Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F18B3CFA47A
	for <intel-xe@archiver.kernel.org>; Fri, 21 Nov 2025 07:21:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB5C010E12D;
	Fri, 21 Nov 2025 07:21:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cqOe9fGS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78B8E10E12D
 for <intel-xe@lists.freedesktop.org>; Fri, 21 Nov 2025 07:21:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763709717; x=1795245717;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=mk/nURMavl4sLohW4A3rmPsS/jV4MprMN/ySPueA0Zs=;
 b=cqOe9fGSwuh7v0RMokk+1LB6PlQwWGFVQ3g7CfKQGQrCnY1hIBQX6KbD
 is68MRaJPNaHLvRVvEjHMMnNn2uymi4Og/+qVmIGltOBftPgs7F5pZPbq
 8XIf7RF1G2O0tJWcjLw9WTfDWBFK6mXpwN3ThqecWgyrQU0ay63c5rn6q
 B37Zq+F9QdMBjnDP1fWtbQU4t+xJDXDR6mw0Dq53MlGgd7HVU6CM3mKXZ
 pWE4FRRsTj+6Qy4WEqyg6P/HAcwyrny3AGIqwN+xvkJzsVdfwxA0SPxEI
 VcZ7V8ickqx2qjv3A6ZJyheJK5npjGEIcK14xZG2xvwSkI41qu1A1JQtc A==;
X-CSE-ConnectionGUID: KDA7zsc1T6G1V7NznTD5Uw==
X-CSE-MsgGUID: vX/KBY0NT4CM5eI/9p6MBQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11619"; a="83420397"
X-IronPort-AV: E=Sophos;i="6.20,215,1758610800"; d="scan'208";a="83420397"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2025 23:21:57 -0800
X-CSE-ConnectionGUID: 6qE6SrBHS2C5NajhMFC4xQ==
X-CSE-MsgGUID: 39lAgLxWReC2DqZ9cJa0lw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,215,1758610800"; d="scan'208";a="195788137"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2025 23:21:56 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 20 Nov 2025 23:21:55 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 20 Nov 2025 23:21:55 -0800
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.21) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 20 Nov 2025 23:21:54 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tlawtWqrH8HFbP4UWSCJVK93MBaUrUvxD+ccy5JF9WlN3e/rhSQdQ8N5lXHrKtuFPMXQTg2In01Ks5yunZYUjQVp3AsFmIvON93fW9MEi3QfoHIXRhivhfSlfnOJ7OrBcN+r3U0yBMCZARPsBT+oYsnYDkzH4hZobubVZQc9BIQhnzaFbVgKWrUDJdsJP2OyIMoUF3m+15Kj8BSLE10ccflAKgAVVFTUPDQ5fIlCVVcOXGpJKTk1sIpMrEd8PafLCHSZ2VgngPI7DGbvHf0E0qurmL4GyUm2rjyMAo0TJRyNxxXcGTqzg75CbafepsX/IzM8FHm9LKxw8uKwHcyLPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IV2EE73D3ZSQuIZ4mowGb0XOTsOg05kYP6OVFSmU+e4=;
 b=A4RIWvglGJ6ES7n/o7Y2Z0AUMwyfPzOKSCqdCPffi2idSof1hqWwiZ/jdmRCgS+aE2pVmzVh6hPtQi7ZuEYqNzwGEUjXUA5icSreYE4uMAspzAl3oTGRaY9fBfaup22Pcy1kAgzmC2zaCcBOUKiK6NTJ7ZVbmaMB63DCbgTjKxKkBJ6dFn6flW0PFGA/IMtwraKrqJztBZwCV7DoDmlohmqnncL3hecam3r7EcTNJCounboGDiWRv+Wm9k2TAVyJwN6jyVurR0nziEILkh500aMObInBrgbI0IdtVIkQki+pSgKRrQvsIkB9NlYkb8ATCwu+g9q8F1By8r695ThpUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CH3PR11MB7937.namprd11.prod.outlook.com (2603:10b6:610:12c::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.11; Fri, 21 Nov
 2025 07:21:51 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.9343.009; Fri, 21 Nov 2025
 07:21:51 +0000
Date: Thu, 20 Nov 2025 23:21:48 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 <intel-xe@lists.freedesktop.org>, Tomasz Lis <tomasz.lis@intel.com>
Subject: Re: [PATCH v5 3/3] drm/xe/vf: Add debugfs entries to test VF double
 migration
Message-ID: <aSATDB7VFSYZ1rLw@lstrano-desk.jf.intel.com>
References: <20251120145157.6995-5-satyanarayana.k.v.p@intel.com>
 <20251120145157.6995-8-satyanarayana.k.v.p@intel.com>
 <49e4f27e-a921-458b-ac2e-d8e38d715de3@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <49e4f27e-a921-458b-ac2e-d8e38d715de3@intel.com>
X-ClientProxiedBy: MW4PR03CA0160.namprd03.prod.outlook.com
 (2603:10b6:303:8d::15) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CH3PR11MB7937:EE_
X-MS-Office365-Filtering-Correlation-Id: abc3da56-d2c9-4c08-9e3b-08de28cea3c1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WHkxaG5leEE4VmV2ejJmdUdWVmpvWHh6ajkzRWY5SkNaMHU0TVRRQ1pIalNE?=
 =?utf-8?B?Rk8vVW9ZQ2V0cElmZFhtUjlUeHdKRGtUOVZONnJBUFkvOXk3SmNCaWdxMGFB?=
 =?utf-8?B?eldGWkhqM1dIa3pEY05wdFJMRjRWRElDRTZMMy9SZ0ZKUFNYMDJYYitZa2VO?=
 =?utf-8?B?NEZNYWVwUlluYURTdVdSTmJQT3BTcDduZkEreW5GN2J2V1FTcjY3MGx3emx1?=
 =?utf-8?B?Q3g0OGdpeWV5cmtlRi9jL3VqZkpPRDA3U0tBT3RDRHJIUEw0YmFCMVNVV2g0?=
 =?utf-8?B?T1QvUXdyYlY3enA3OXRqeFNucVArWnQwWkphVzJZelA2NHdyMjZSbnNNVUhN?=
 =?utf-8?B?MWh0YVdXQlJ4anJXTnRncXlDeXcxeVdGWkRkRWZleWhvQnJyL0hBdkY4N1Bq?=
 =?utf-8?B?cXhZYXJvQXc1YlBiMGthM0xrQ204R0tFTzBkUjFrb3JnbXlyVDBRYWZsc2FS?=
 =?utf-8?B?NG5mNjRvRUVkYW0rRzRrTFNIN21ualVaM1BacCtrM2U3LzQ0djBLZG9YZ2Vu?=
 =?utf-8?B?Nk5mWFFUb0EzSkxiNjgzcnNQQlg2cGZ1alNpVlhZWEYwV3J1dVkwU3IvTmc5?=
 =?utf-8?B?VUh3UnFmNGJ6alJURjgvMkt4UktNKzdBSDdxVFQ4Rm9KT2R5a2pJNjE3Z2Ni?=
 =?utf-8?B?dTQxOXdxYnBYMDRoZlpYNGJTSkVUWWNlTllhUWZyaTg3ZEFKUm10Q3JmRnJ2?=
 =?utf-8?B?VGlOQ1U0bFZVb2tBelFVcXJLUUIwek5HT0xWWnJ3TTNLWlBuMnNLKzFqam92?=
 =?utf-8?B?NHBIR1F6eWJ2eEZRR0hOOXVsd0xhUjZqMnBhSDZTU2lNd0loUHZjRGpDSjM2?=
 =?utf-8?B?TmRkdENzRXBZeVk1eVR4QVl5b2c0TERpU0cwSXFRUnBZZGgvV3Y2Wk5Qa2Qr?=
 =?utf-8?B?dmNqQ3dkOU5YaFIyQnhTR2FhL2thRHB1Vmp0Qm1JQVVKd2Rpai9MVHdkamJG?=
 =?utf-8?B?aGtHaTVrbE5YdjdOVmhwVnNUeEIvN2Q4eFRyc01Tejc0YjJWcVFQN3BvNWkw?=
 =?utf-8?B?UkdIL29kWS9sMHIram1Qd3gwK0RHZThrWENmYU5WWWdOL3NiQ3hNcGVoVDNW?=
 =?utf-8?B?a2lXQUJ5b0hzSTRLdTZOc2xNQ1BXb1lZNkU4dzFia0NkNGNPbFVaYVhBMUsr?=
 =?utf-8?B?aktBaUU3dXNQYTNhYUVVL1pjZzQ4ZkJTakJPNGJnNlZra3ZheUgzK0hTSjNS?=
 =?utf-8?B?OENLQVlDam5nZDNCOXFPOE41YmZQMU9ia3VNelM0Q3EvVjlCZEtobnhXQ3dS?=
 =?utf-8?B?SEw0NXVPS2x6Z21RdmNrVExaZURTSDBjNzRQSkVGQVAxcE5hTmJsclFuOStQ?=
 =?utf-8?B?YkxrQXFOVjZyWWlIM0NvM01UNGpzbWpaT2YrNjYreVNQK3c4RjRJM3V6TkNE?=
 =?utf-8?B?bjZ2T2dXL0NLVnhFY2JKRWhUbEJPeEg2KzQ4WEF6QUNnRU9SL0trTGdPeEYr?=
 =?utf-8?B?dlJSc29uRG9oUUVvTjJObnNaY1BHbGpxU1hhbG55TzR1WlFsS0hhaHpzeVJ5?=
 =?utf-8?B?SEFRUi9UWHFwWUk5NzdpZk0yUzBzaklxdmozNjJOeDFNNlcyZUdPWFB4ZFcz?=
 =?utf-8?B?YnBvejlrZDZBTkJzaVJCNEcvdnhpNTFqRDMxcHVvbktSWGdyY3k5U1B4ZGQ4?=
 =?utf-8?B?cDRuRnpURHFIV21INVhBcHhxUjZSbVR2R1RZWVYrSm9CUmJKbmZ5ZTlwYlN3?=
 =?utf-8?B?dnh1Vlp3VTNjN2sxWlkwR3hKTmJOSWtOTWl1Y3V1MklPWnZaRlVvR1NsZHQr?=
 =?utf-8?B?TzRnZEJnSWNlMzN6VkJtdVhCQ1dtTEMrMFRTQXU4cElmVHQySk9JQ1VPdEgw?=
 =?utf-8?B?cG9wNEk1Skg3U3lvSWlvMmM3NFRTQStselBiYXpjRkpkQVpJN2VqZVYwSGlS?=
 =?utf-8?B?MEdjc055allQUTVacVQwLzZ0ZXRYblBkZ0QzTlI3Z29sa1VWWWtXVlE1MmdH?=
 =?utf-8?Q?BCpfw+PFHsyxakUiRVqfrMMHGCNlOJjp?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UmNzTmZFbkJuUjZ4Mnp5aHlTTitFdXY5VTFhTTZPUkZ0ZThsZjBaRS9CU1E5?=
 =?utf-8?B?NFhqdWQ2c1QwTkpFTnhvZ0FNSXRyR2FIMHZCeUREZURPelBCMjVPSkZwZWtr?=
 =?utf-8?B?NmtCdmlHVFlBOFVXM0UwQVNRVDBPbHFYM3lOZC8zZUpaaCtuZjhMaExGeFlq?=
 =?utf-8?B?Qy9jR1R5dTNvbnBzVlIxY00wYmhkQ0xFaFl6OW9IODYzK0NnUW5XRnB6bU5t?=
 =?utf-8?B?TlNrbDdoS3Z0RkhPUDhlOVZDT3hDMDZQWkhHaTNvTHlINWJKTjZiK2hTK3dQ?=
 =?utf-8?B?SUdqbW5PSEpjb3lBbjZ4MU81RFdlMkYzOGFVSlNEbEgzS091YjN0Ym9CaS9i?=
 =?utf-8?B?THBxc1Uzb1p4VzF1YThDTkU2Rm0vZ2E0eEtIWHgxNXlqaEZrTVZiRk45S0My?=
 =?utf-8?B?MW1Ud0lZRnNhakFCRXNQQ1ZVUjVKOHkrR0RNcXdwZzhnQXZUUm0rcS96K21J?=
 =?utf-8?B?N0VsTS9rdFhJbnlzSjQyZDVzTkwvbUU4dFlBQzAwNXpiTGhBRnpuOFBzREJ1?=
 =?utf-8?B?bVZBTXpoaTUxaE9HcEU1aituTDVZZUtqVFlCODZqZjgxMlJEbjhlWEkxdXZC?=
 =?utf-8?B?TDhyN2ZKK3VlUGNPcWVMK3Nxd1dxVjZ0c2I0bDFOVExFd0p0ampOOWxpL3Nr?=
 =?utf-8?B?bzNNcVNNbGFPU1BCbW5ObVVaTzNBUlNDTm5lUGQ5c20yVFNqQlFsSlB1MlAy?=
 =?utf-8?B?VHN6OXVRZlcrR2pTK0ZwRHNlQVF3MXU5R1pOQTdOTHJhZndEbFB1NkZXQTlE?=
 =?utf-8?B?aW5VVWd4b3NZc1NhWVk4bFU0Slo1TGZIRW1FZERLeHBJcHNxaVc3SFh5c2o0?=
 =?utf-8?B?VlU3RlB2dWtXTTV4ekFnanlsaW5adEZuT0V1b2F6eWRNQWtyT2NCYXJNcmdU?=
 =?utf-8?B?bjh3N1d3dmZEdmhsV3MzY25UVGdlZFcyK2xhcFlFQ1FzNHFuV0VVMFlyQ2t3?=
 =?utf-8?B?NjdNTm9WbkxXWGhrZXlxdWFFdy8rdFZJMG51VXNtWUNzenZBSlowdFdCM2Fu?=
 =?utf-8?B?M1FoMkxwVkN1RFJKWUc3QUhicEI0dkVYNFUrM2w1UFVzM21Xc2x3cXpoSTU2?=
 =?utf-8?B?U2xoUW1JbzFBS1c5blJjalRWaER4YU1ITmZUZkFNa3d0T2VoRUVVakVEQWNw?=
 =?utf-8?B?ZTl6Q2JONDNZUVpldHJqVS9NL083UnhNZ3RBVVdKOHpmeHB2UmFXTm8vbTcy?=
 =?utf-8?B?UlB4Q1hhVDlQd3FNb0FMdFJOZXovOVkwQlNicjB0dlJLSUMvSHZUZkV0Q2Qw?=
 =?utf-8?B?cS91aWE1VHV1NlVYYzFNSG9UcURMcHRHVUdWTlhFazV3NUVHQkZEN092VkpC?=
 =?utf-8?B?YlIwMDBQODJ0REFrZEliZkdYUkFaRTJSZjc1RzNFU1RjWndmVm5kSktFaEJZ?=
 =?utf-8?B?UWFUeDZzTnN1a1VrNHlwbytldmZJM3A0ZXc4VnZ5aVVFZVR5MUo0azJFVE5C?=
 =?utf-8?B?N3RaMEFsRzZnS2FyZU1yemtRZkYrT2dNQnNDcEhNUVJ6bWRPRk0wUjBCT1c5?=
 =?utf-8?B?c1o1RGpVNWUvekFCQTBHaHJZRlJXSlBnSW1IR2xUMThzbW9namdncWNhQnA1?=
 =?utf-8?B?U0tsczVMRzNxelRZeEE3OVlhb3F3THZ1eS8yb3RQc2dKaHlRVCtmaERwVkdZ?=
 =?utf-8?B?Rnd3Mnhya2puUklZcWpZSVN6MDRiVUhDSjlmbUJ5N0lrbzhTbk1xa09ra2dl?=
 =?utf-8?B?eUU2MzZtd25ScUdiU243NHkzVWVPbldhNEc0SElFRDZZdU83MEljY2xDUGVH?=
 =?utf-8?B?bW1QNzNHdmQ4K3IrajdaZUFyYnQwcklQN1pCMVBsb0pmTlpmSnh2ZXhVL2JX?=
 =?utf-8?B?NXZlOFRVUlBoa2Z1V2k2MmE1bHhPUmtKRXNST0tPOGJZTmdVUkNpQkdBTFlx?=
 =?utf-8?B?Skc5VFpLeGdVWGV0UlRkbVRIay9jMUdSNlJ4bStha0gxYzRkek1Jd2VPMGdj?=
 =?utf-8?B?eHVobmZIeElCUmZzQkttcnU4NXFjd25HM2lXeVNMNmZ2WUhvYnE4YW9ja1pX?=
 =?utf-8?B?TTNhaWNSVFJnWmV1RjZUZ0NIUXVZVno1VEpVU1BYcFF3WXdHU0FocmVER1px?=
 =?utf-8?B?d1RWbUpGSjF1dXl1T0k0cW1wai9iSElKbGZQbjR1T2J3RnZMWHlxcW5JMTFz?=
 =?utf-8?B?a25DRTRaVXZJTUlDN284em1zdXE5aTRNR293SzhVNWw5a05hQ1RNTkJaQUx2?=
 =?utf-8?B?Zmc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: abc3da56-d2c9-4c08-9e3b-08de28cea3c1
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2025 07:21:51.0619 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 24ju5KgoE7Bk3twNYG7OeBht/Ytm6Aqi7SZ08ASksAkZow9zMO0KnzKqN0XumfIfGHn1xrhp0k8848IZSmbR6Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7937
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

On Thu, Nov 20, 2025 at 10:53:02PM +0100, Michal Wajdeczko wrote:
> 
> 
> On 11/20/2025 3:52 PM, Satyanarayana K V P wrote:
> > VF migration sends a marker to the GUC before resource fixups begin,
> > and repeats the marker with the RESFIX_DONE notification. This prevents
> > the GUC from submitting jobs during double migration events.
> > 
> > To reliably test double migration, a second migration must be triggered
> > while fixups from the first migration are still in progress. Since fixups
> > complete quickly, reproducing this scenario is difficult. Introduce
> > debugfs controls to add delays in the post-fixup phase, creating a
> > deterministic window for subsequent migrations.
> > 
> > New debugfs entries:
> > 	/sys/kernel/debug/dri/<card>/
> > 	├── gt0
> > 	│   ├── vf
> > 	│   │   ├── resfix_stoppers
> > 
> > - resfix_stoppers: Predefined checkpoints that allow the migration process
> > to pause at specific stages. The stages are given below.
> > 
> > VF_MIGRATION_WAIT_BEFORE_RESFIX_START	- BIT(0)
> > VF_MIGRATION_WAIT_BEFORE_FIXUPS		- BIT(1)
> > VF_MIGRATION_WAIT_BEFORE_RESTART_JOBS	- BIT(2)
> > VF_MIGRATION_WAIT_BEFORE_RESFIX_DONE	- BIT(3)
> > 
> > Each state will pause with a 1-second delay per iteration, continuing until
> > its corresponding bit is cleared or a maximum of 10 iterations is reached.
> 
> fixed 10s might be still not always sufficient for the test
> 
> if you're afraid of locking down VF driver due to test bug that forget to clear the stop-bit,
> then maybe we should look for some other solution ...
> 
> > 
> > Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> > Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> > Cc: Matthew Brost <matthew.brost@intel.com>
> > Cc: Tomasz Lis <tomasz.lis@intel.com>
> > 
> > ---
> > V4 -> V5:
> > - Updated debugfs entries (Michal W).
> > 
> > V3 -> V4:
> > - New commit
> > 
> > V2 -> V3:
> > - None.
> > 
> > V1 -> V2:
> > - None.
> > ---
> >  drivers/gpu/drm/xe/xe_gt_sriov_vf.c         | 37 +++++++++++++++++++++
> >  drivers/gpu/drm/xe/xe_gt_sriov_vf_debugfs.c |  5 +++
> >  drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h   |  8 +++++
> >  3 files changed, 50 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> > index 1cd3d8204c15..0f25091f4949 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> > +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> > @@ -5,6 +5,7 @@
> >  
> >  #include <linux/bitfield.h>
> >  #include <linux/bsearch.h>
> > +#include <linux/delay.h>
> >  
> >  #include <drm/drm_managed.h>
> >  #include <drm/drm_print.h>
> > @@ -1234,6 +1235,34 @@ static int vf_post_migration_notify_resfix_done(struct xe_gt *gt, u16 marker)
> >  	return vf_notify_resfix_done(gt, marker);
> >  }
> >  
> > +#define VF_MIGRATION_WAIT_NO_WAIT			0
> > +#define VF_MIGRATION_WAIT_BEFORE_RESFIX_START		BIT(0)
> > +#define VF_MIGRATION_WAIT_BEFORE_FIXUPS		BIT(1)
> > +#define VF_MIGRATION_WAIT_BEFORE_RESTART_JOBS		BIT(2)
> > +#define VF_MIGRATION_WAIT_BEFORE_RESFIX_DONE		BIT(3)
> > +
> > +#define VF_MIGRATION_WAIT_DELAY_PER_ITER_IN_MS		1000
> > +#define VF_MIGRATION_WAIT_DELAY_MAX_ITERS		10
> > +
> > +#ifdef CONFIG_DRM_XE_DEBUG
> > +static inline void vf_post_migration_inject_wait(struct xe_gt *gt, int wait)
> > +{
> > +	uint delay_ms = VF_MIGRATION_WAIT_DELAY_PER_ITER_IN_MS;
> > +	int max_delay_iter = VF_MIGRATION_WAIT_DELAY_MAX_ITERS;
> > +
> > +	while ((gt->sriov.vf.migration.debug.resfix_stoppers &  wait) &&
> > +	       max_delay_iter--) {
> > +		xe_gt_dbg(gt,
> > +			  "*TESTING* injecting delay resfix_stoppers = 0x%x, remaining iters = %d\n",
> > +			  gt->sriov.vf.migration.debug.resfix_stoppers, max_delay_iter);
> > +
> > +		msleep(delay_ms);
> > +	}
> > +}
> > +#else
> > +static inline void vf_post_migration_inject_wait(struct xe_gt *gt, int wait) { }
> > +#endif
> 
> we don't use "inline" in .c
> 
> > +
> >  /*
> >   * Increment the startup marker again if it overflows, since GUC
> >   * requires a non-zero marker to be set.
> > @@ -1270,18 +1299,26 @@ static void vf_post_migration_recovery(struct xe_gt *gt)
> >  		goto fail;
> >  	}
> >  
> > +	vf_post_migration_inject_wait(gt, VF_MIGRATION_WAIT_BEFORE_RESFIX_START);
> 
> can we code that in some nicer way:
> 
> 	VF_MIGRATION_INJECT_WAIT(RESFIX_START);
> 
> #define VF_MIGRATION_INJECT_WAIT(_HERE) \
> 	vf_post_migration_inject_wait(VF_MIGRATION_WAIT_##_HERE)
> 
> > +
> >  	marker = vf_post_migration_resfix_start_marker(gt);
> >  
> >  	err = vf_notify_resfix_start(gt, marker);
> >  	if (err)
> >  		goto fail;
> >  
> > +	vf_post_migration_inject_wait(gt, VF_MIGRATION_WAIT_BEFORE_FIXUPS);
> > +
> >  	err = vf_post_migration_fixups(gt);
> >  	if (err)
> >  		goto fail;
> >  
> > +	vf_post_migration_inject_wait(gt, VF_MIGRATION_WAIT_BEFORE_RESTART_JOBS);
> > +
> >  	vf_post_migration_rearm(gt);
> >  
> > +	vf_post_migration_inject_wait(gt, VF_MIGRATION_WAIT_BEFORE_RESFIX_DONE);
> > +
> >  	err = vf_post_migration_notify_resfix_done(gt, marker);
> >  	if (err && err != -EAGAIN)
> >  		goto fail;
> > diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf_debugfs.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf_debugfs.c
> > index 2ed5b6780d30..66d5ffd0e371 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf_debugfs.c
> > +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf_debugfs.c
> > @@ -69,4 +69,9 @@ void xe_gt_sriov_vf_debugfs_register(struct xe_gt *gt, struct dentry *root)
> >  	vfdentry->d_inode->i_private = gt;
> >  
> >  	drm_debugfs_create_files(vf_info, ARRAY_SIZE(vf_info), vfdentry, minor);
> > +
> > +	if (IS_ENABLED(CONFIG_DRM_XE_DEBUG)) {
> > +		debugfs_create_x8("resfix_stoppers", 0600, vfdentry,
> > +				  &gt->sriov.vf.migration.debug.resfix_stoppers);
> > +	}
> >  }
> > diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
> > index 66c0062a42c6..3ece00f74e46 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
> > +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
> > @@ -52,6 +52,14 @@ struct xe_gt_sriov_vf_migration {
> >  	wait_queue_head_t wq;
> >  	/** @scratch: Scratch memory for VF recovery */
> >  	void *scratch;
> > +	/** @debug: Debug hooks for delaying migration */
> > +	struct {
> > +		/**
> > +		 * @debug.resfix_stoppers: Stop and wait at different stages
> > +		 * during post migration recovery
> > +		 */
> > +		u8 resfix_stoppers;
> > +	} debug;
> >  	/**
> >  	 * @resfix_marker: Marker sent on start and on end of post-migration
> >  	 * steps.
> 
> as this is still a quite invasive change, can you post a IGT patch which uses these stop-points to prove it works as expected?

I wouldn’t call this an invasive change, but I fully agree we need an
IGT + vmtb case here. If this is manually verified, it’s probably not a
blocker IMO. This really should go into the 6.19 PR if we can make it,
as I think everything for VF migration enablement is ready in 6.19,
right?

Matt

> 
