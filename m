Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0FFFCCD1BF
	for <intel-xe@archiver.kernel.org>; Fri, 24 Oct 2025 20:22:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B81C10EB3D;
	Fri, 24 Oct 2025 20:22:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OmSyWzzz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3B9C10EB3C
 for <intel-xe@lists.freedesktop.org>; Fri, 24 Oct 2025 20:22:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761337353; x=1792873353;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=YynRUj1H6BHmjOuaw2qMwD/U45BBqgJTT85WT5JbHbs=;
 b=OmSyWzzzT+lovT69IesSexdqB2prHTehcrtOGu0dCi3LMsTIHJmHB7Ib
 OskMHJ9WZ5sBBVFTw3qvuY2J87kbWBwj/GQTdG1lvtWrRiVkku15SYFgC
 jLK6XBr7Wy6qLsxU8/YdH7EYhrEeoIljPrFRPinXIfaNC+dJHi627zvmB
 fZe67wMIelWVj5NegtcQ40Yj6tSXrcbfctY6NnZA+pQCsZv+11JQwceP5
 SOu6WrC8hYXe+V9JGTQqisoCfa6Wq8F2KSm+k4NeROFKO3ToS6kPNnNew
 +Lm5omiQs8GEP2sLcz3pWYLNWyWDbYxmEpKc/RrhmMsGlNcawQ7RdVqCE Q==;
X-CSE-ConnectionGUID: UYsEttvITfCAtR5kaTGbjw==
X-CSE-MsgGUID: RTA7JZPhQBuvdlsQzKAfWg==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63558231"
X-IronPort-AV: E=Sophos;i="6.19,253,1754982000"; d="scan'208";a="63558231"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2025 13:22:32 -0700
X-CSE-ConnectionGUID: bH1CoslFTy2itzCXFiQjOA==
X-CSE-MsgGUID: I6wQa9hdQ2KiOMgG63qLTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,253,1754982000"; d="scan'208";a="208153647"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2025 13:22:32 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 24 Oct 2025 13:22:32 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 24 Oct 2025 13:22:32 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.21) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 24 Oct 2025 13:22:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NYlnhNE9ggXQXNPp6G3hCxNbjTTlCKvX+pZtG1dN4G5U8xU+FxUtDqHq3XwK+9MV5AMPLJoPftDJK7aNSf36fruv2obvt/kla4yn6mwM19BzYtZwhTuwmmMqFd47VfMc07lQoSKkZdvtSh/SzcIS8/YOn9xKfXS0sEJb83elW1MM6oC+tNYIqmq6GzWtue2MJhu0FaDgm2hvP6XU1/PnSbTW1jVP38kysiqA95V+fp+EyPQFjymCe7NwdonW5Fy8vIXoc8XMqhcHKwYk1NQYieHD8YX5jdzhQ/ZC35cnSoaNcODzx0fVyvYfdZRgyUkQQojGeWzlYKvb2v9oMSWKAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X9b7UTHKeT6mbmrWUN866zY9IIF1WduAnTpq9aGWDqo=;
 b=i0pE4qt6piOWkwvYlt3i0Tq/WXx8jhtIu1OpS0PYF5ly/h8I0LAYzeljyATXs5T4UPo8GXu75FqzeEzpjjXfViPnrm5rHN5YigKPW+rU5A437fHPSXrejfPHPi1jXCupCjeKVCEjBhX8HrNjkCNDvQ+chVKKO5yuVAjJMqhUfsrrMo8TG+WeB8c8OLmTRnmi8raZ4aih7e2bufBEdJA65lPLflFBezvKgsk36rUukw/olm5ENZIYzg7bMYi0I/WjpGsDec5z9iVfMKvBWRrNodVI1l/doBJhT3eBKrVj1eVR+wNnm1c6el4zk+j32Yol/geKCPpPTQVRPy77pLSUgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by IA0PR11MB7696.namprd11.prod.outlook.com (2603:10b6:208:403::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Fri, 24 Oct
 2025 20:22:30 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350%7]) with mapi id 15.20.9253.011; Fri, 24 Oct 2025
 20:22:29 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20251024200834.1512329-2-matthew.d.roper@intel.com>
References: <20251024200834.1512329-2-matthew.d.roper@intel.com>
Subject: Re: [PATCH] drm/xe/configfs: Drop MAX_GT_TYPE_CHARS constant
From: Gustavo Sousa <gustavo.sousa@intel.com>
CC: <matthew.d.roper@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>, <intel-xe@lists.freedesktop.org>
Date: Fri, 24 Oct 2025 17:22:27 -0300
Message-ID: <176133734766.1676.15788306250151133090@intel.com>
User-Agent: alot/0.12.dev22+g972188619
X-ClientProxiedBy: BY5PR13CA0009.namprd13.prod.outlook.com
 (2603:10b6:a03:180::22) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|IA0PR11MB7696:EE_
X-MS-Office365-Filtering-Correlation-Id: 9f0b2916-d299-437e-aa6c-08de133b0e1c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eHY0S0ZRRkFQSjR2VmJmZTVuYU5IR05IelhJVE9vUXNIdVpLRlBCbmE1K1dK?=
 =?utf-8?B?Q1VTbHEyVEV2amdENDBIeStmeTJ6SGNnSkpZNzJ6YnJQQUNWaTYvc0pVdU92?=
 =?utf-8?B?anBralhKNk9Ya1Z4LzhTaEdvaGMyOUtzUlpoNWFqd1I5Q0ZVQ3NVNHE1ZTho?=
 =?utf-8?B?eW9wREFMMnFHQVcwTTFHOWZwdkc5dkcyYnlrRG9CV0IwanczcUdoQ2VwT0lw?=
 =?utf-8?B?Z09JcXI2TkJFdkFyZ2IzNHBHNDRoSjgyVnhOa015c1Ivd1FvZ1YzR3BTaTZ5?=
 =?utf-8?B?Qm4vTjB2eGVPNWJYVkFSY1dsaUNRYmFETk54K3RMZVZVSE54NEJKb0Z3MmRl?=
 =?utf-8?B?Sm9PZHBvQVJRUjZMMW10TjRnelo4Sm16bXRCUXlWMCtkMHdSOTR5VW5FVm5i?=
 =?utf-8?B?M01KVWFVN1paL0JkSWNNMEhpWGcyVDNFdkoydHVTTXFDQXdjeVNIbmQrQzNt?=
 =?utf-8?B?M0NmRnkvRm9uN29jMTY2bkZ1UFUwQW43cUdaMkVEcHh4UnZSVy9FWVhMV2Yw?=
 =?utf-8?B?ZlhNVTUwMm1LWDBiUDBvd3Y3NCtsNFFhbHdNTGVRYW5sTngzVm9RU3ladlhh?=
 =?utf-8?B?VnpsMWpZUXh6RVZvVVFxaVkybzhNMVNOOStNbElhUG9Vd3M2UkszaXNLeHRF?=
 =?utf-8?B?Kzd1VXNGTWNXemVraWNBSmtsUWg5Nld4VTU2dEtxZnZMdFBoeWVibFViNlpM?=
 =?utf-8?B?TVpDZjcwaWZaQ2VlVk9hd3Q1bGlBMWhxVVE0UjVNbWlpWDVMalNTdDRpZjBw?=
 =?utf-8?B?QUJrajE1R0NyU3NsSjRFd1cwWllPWHVPOGhqUTVRM1hzWTM1MlluSEFyaWJt?=
 =?utf-8?B?L1VZWCtSTXZuYXlhTnp4WmNnWTdReXk2aUMyaVd0S3d0UFVxemJGbjVyaU01?=
 =?utf-8?B?SDVybVJEeWJhamphWUJJK3Q1bklLVzdSOWRWYUM5WEcrM3RMRWE5eDkzRmRs?=
 =?utf-8?B?UVNzNEpvWHlLY0FuRzNpUjE5K3lYb3UzZjI2azlXblVMQ1F4eExIMUVDR2Zk?=
 =?utf-8?B?VklZN1NRaWJtRU1FNXhXT256aHc4Zzdma0twcUpvcElDb2VJV2hrY2xNM1dO?=
 =?utf-8?B?RngvS3JJNjZlSDNkVFhxaC9HRmV0TjBuUWNDbFoyM0RzamI0OHJWbVkwbGNl?=
 =?utf-8?B?UFFaWmlsYnkwSXdsTjJMSzdyUzZJZ3B2MGNzeG8vWkFiZkw1dlh1Mjdkc0xT?=
 =?utf-8?B?QnBXR1FTQndFSTRaNmRXTGNFTWJ0ZXZQSTlCU01mQlZyVFJiRGM3ZlVWdlpE?=
 =?utf-8?B?djcwQU4vTXZvMWVtVk1CcW82OXZWYklCMlp3a0RjTkJQcWFNMFduay9leXVW?=
 =?utf-8?B?c3VITUo5c2NDWWwwWEhiaHI0TEl4VTBvbWVsR0xBRytwcDk0NTZMTmN2RFV5?=
 =?utf-8?B?N3NRTms0YTBLUlBNeTFUek81Yyt1elJmR2FBUUZQOUlsV2VnbDU4VWVGeGU5?=
 =?utf-8?B?Q1NrZy9aYWZQUmthMVBWTEZGa3BpM3BLZFVQcFc1ZmJEVFAwbmE2MXU5MFhP?=
 =?utf-8?B?Y1hSeDRNMzVzSWpIQnRyMEZFSzhORXQ3SHU3VDYvZGRNb0VpQ0RNdmpYbThW?=
 =?utf-8?B?Ykc2ZjFYYkNTSW9sS1czKzAzRFJxZFBsbUJpdDk2dDg4ZCtTWkExSXpla2Nz?=
 =?utf-8?B?STFOSFVpYjZzM1FJRFBJMG1iR1B4SHRqcUJZOTR3cWxFbFlmSG44QWsyaG93?=
 =?utf-8?B?MjVVaTlITTRsNmNkL1J4QmRZbHlJSjBuOXlaMWovWXYzbUliRmN4UzFZaUFv?=
 =?utf-8?B?OFBqdXVGR2ZlaW1TRStNUWpMUlNrSUxpREpRRU5CU0lqbExWbUcxWHlVNVhV?=
 =?utf-8?B?OHM5WTdOQXhQUGxIL294cGhZZWpuVUw0Ti84bDFTbENyVHpOeEVqNm9oZzZq?=
 =?utf-8?B?WFJSdzJwQ3ppdVA4MndGTmNtVHlnSU5xNHJHV3dMMnIwZ0lPei94ZW5CUmRV?=
 =?utf-8?Q?tbBvapH72dTFFqLvVQNcOrk7mjv/nOWN?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Wm85SlJWdWg2L2VyY0hjSGE0TjhrQVhxSDd5TEpXb3JxYXd6NkgzdFFSOFR6?=
 =?utf-8?B?SWs4alpNRXc5ZGNCMHVmb2RDcVpIV0JFclM1eEZHR3BQZjRCZU5vUS9RSXpv?=
 =?utf-8?B?S2dnMzZpbmVselJsODRHTXZ5VmhoZDlaMDNwVVBRVm9BNFl0djlQTmF4dFJR?=
 =?utf-8?B?d1B3M080MWVVdkdOemlmS1gxd2tLdHZSVWNpTkRQdDJsWTN0SXkzMzdJcDQ3?=
 =?utf-8?B?Qk1oZXBoRUFlNGptYUVHL2phQWI5dlY1TTBXWWMvRFFqcjVYTUxKTTdqM0Zo?=
 =?utf-8?B?dWZXQXVGbHBtU0ZGdHVlMzVSd1hSNjhvL3lIbm41MDFnV0lyRFBkajN2cDBQ?=
 =?utf-8?B?SDI4MWR1NjgzMkVUQzc4aWV1ZXJtU0JwckxhdWZSOTFldzJHVTBER0t2MXRs?=
 =?utf-8?B?Yllwa2o1eXdOUVUvVkdBNVpycUh5MmJLQjhBblBXb1Nzdi9hSERNa0tYWGYw?=
 =?utf-8?B?R0ZXTHN2Y0REbUpEQUhOaFNWVWdDL1B5NHRrQzROUWlyN1FJTXR1ZGF4bXdM?=
 =?utf-8?B?K29zTVUyTS9aR2ZtSklDZUlRWlRlUCtCRmtTQzJTOFRteTB0VlNtM0N2QUlC?=
 =?utf-8?B?cTFjSzllaXVKTlZxWWhPaExTczhENzE1bjZzKzV0bytwbzU5OHkvRlEzaUJy?=
 =?utf-8?B?R1FHMmxRZWpEb1VyRjc3eEg5R3h5N254V2hHZjhaMHRPRTNPRHpBUUpWZUdC?=
 =?utf-8?B?TmVab3ljQ0MySEpRS0JwR3FLb08xczIweGlKbEFQbllBelVheGtFcEtVSDlQ?=
 =?utf-8?B?YUZ6NUozWUVCRFV4WmxYTmNpblRaZFRaM2FzaTc2YXllaWVJRXc5U2JIRFBK?=
 =?utf-8?B?b1A5TWpFaG9DaGZLZlhrQkQ0U09LeE8rbTl4VjYvZk9CdGFzby9PSzdOKzgr?=
 =?utf-8?B?ZFZld25kMzl0YjBhcDdNNkZMTlZPMnl3QW00VHVWVkluSHVhNm5zUGpvT0dl?=
 =?utf-8?B?UGY0dlVRcWhYS3RydUdMNElnZXR3dEVBUWZ5S0pCdUhPL0toei80TFN1Z0Nj?=
 =?utf-8?B?dkJmWUhybmh6RUMwMDNYUEJ6WVNvOXp4c2Yvc0VURWUvNzFLa0dNSXZZT1RJ?=
 =?utf-8?B?cVg5cWxuemRSQ0pzcXp5UFlXUkJsY2Y2NzVTcUg5YWUxdUxia2wrTUJKcUVI?=
 =?utf-8?B?bUxUNC9kbkRnOU9KMTYwaFhMbC9ZYXZ2Q0cyMmsySEcwZGVQRGZMZHkyZFJV?=
 =?utf-8?B?VTFySTU2Qmw5WkZwUTVBSGxnbXRYQjRoRU5BUlcraUJYRG5BWnZnaEk1SFdj?=
 =?utf-8?B?MElBd0VzVmRQMk5PZ0FWZUhibzcrZm02Q3VMUUtCNG9sbDRlZWpkTG5OcW5O?=
 =?utf-8?B?ZzZma05EM2RnYnRsN2U3a1VkcWUxZUtKNUxRaW9tcHdiZ1FFR1VPK3JaRGRG?=
 =?utf-8?B?YU5LM3lLN1J5NG1sK0ltVHlHbUQ4K3crZkJKbC9ib245ZVZWKzJwbFRrTVYz?=
 =?utf-8?B?RVZqdGpDSkZDaGthZXZYYkVlMDFybDlBZkJtMXFsa1ZEUk5KdnJKU2t6eGVW?=
 =?utf-8?B?MU5jaW1JM0N6QzNQUGFVMHRxTEg1M0FPcWRmWDBhZ0hrdHVIVjVxWmwwaWhv?=
 =?utf-8?B?UE9icnRSUVVsb3dWSFJIQlZvMEEvRG43QnVwbFZ5NFd4ODQ1OEFDSjhZWmVN?=
 =?utf-8?B?d3Q1RG91dVZ4b3J5RGZZMHdOUi8rQ0tZVW1Kc2YrMVZGNGtkR0ozSVB3TUNr?=
 =?utf-8?B?YnRHcW5SR1V4TUpLd2pxVE42RWQrWHo2SDRTczBPbUNJWFRyaXBaT0hucHQ2?=
 =?utf-8?B?QzFkRjJmRk5oWEJLREt6NCtOZ3JNYkZWU3BCSlpXeEhtTlF4ODl5czQ0R1R2?=
 =?utf-8?B?Wko3dGlaVmRLVGdoeUxYMFE2THh6YmF6V3Q2UUovZ3F1cFNpMGk5dFdCbWVS?=
 =?utf-8?B?b1R0YzlVbk43dWFEK01sQURpeEFYYzZjZHNDZlllUXlsUklmV2xDLy9uZ3ds?=
 =?utf-8?B?YUlvU29ZVDNFUTU1RVRDaGVVY0NHWFFSWHVUTnNpOTZrNjZGZEpWS1FBK04w?=
 =?utf-8?B?K1RmcHlqQjkwbjl4U0ZqWjFscUwwTWVWTDA0aWEwQU5Uc2tnR01vbkVjSEpC?=
 =?utf-8?B?OTBwaFZPREU3anFPWXFLVG9sYUxia1lrVGtmbDlhSld1SVpOVWdOclpBTmdr?=
 =?utf-8?B?NzJzUERJWG1od1lmNWpBYm11NEFoRTVGQ2NpVnFmWTR2SkJvcGR1cGJQSTlI?=
 =?utf-8?B?eXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f0b2916-d299-437e-aa6c-08de133b0e1c
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2025 20:22:29.5414 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JqrEAgVrLDq1bFSPH1/KuqSurRsna3+rA5Fj0/NKNntA5O8YTgdDO1p5oUwHF2+gZR9EYWQgZSp+u3SHJiADAA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7696
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

Quoting Matt Roper (2025-10-24 17:08:35-03:00)
>Early revisions of commit 7abd69278bb5 ("drm/xe/configfs: Add attribute
>to disable GT types") used MAX_GT_TYPE_CHARS not only to size the
>constant name field, but also for some of the string matching logic.  By
>the time the patch finally landed, the constant was no longer needed for
>parsing.  Stop using it for the string field definition as well; this
>eliminates the risk that we forget to update the constant if we ever add
>a GT type name longer than seven characters.
>
>Suggested-by: Gustavo Sousa <gustavo.sousa@intel.com>
>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>

Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>

>---
> drivers/gpu/drm/xe/xe_configfs.c | 3 +--
> 1 file changed, 1 insertion(+), 2 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_conf=
igfs.c
>index c1419a270fa4..fad75650f3dd 100644
>--- a/drivers/gpu/drm/xe/xe_configfs.c
>+++ b/drivers/gpu/drm/xe/xe_configfs.c
>@@ -301,7 +301,6 @@ struct engine_info {
> /* Some helpful macros to aid on the sizing of buffer allocation when par=
sing */
> #define MAX_ENGINE_CLASS_CHARS 5
> #define MAX_ENGINE_INSTANCE_CHARS 2
>-#define MAX_GT_TYPE_CHARS 7
>=20
> static const struct engine_info engine_info[] =3D {
>         { .cls =3D "rcs", .mask =3D XE_HW_ENGINE_RCS_MASK, .engine_class =
=3D XE_ENGINE_CLASS_RENDER },
>@@ -313,7 +312,7 @@ static const struct engine_info engine_info[] =3D {
> };
>=20
> static const struct {
>-        const char name[MAX_GT_TYPE_CHARS + 1];
>+        const char *name;
>         enum xe_gt_type type;
> } gt_types[] =3D {
>         { .name =3D "primary", .type =3D XE_GT_TYPE_MAIN },
>--=20
>2.51.0
>
