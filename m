Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A547EC282C1
	for <intel-xe@archiver.kernel.org>; Fri, 28 Feb 2025 16:29:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F96110ECFA;
	Fri, 28 Feb 2025 16:29:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lDVyXImT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F9D710ECFA
 for <intel-xe@lists.freedesktop.org>; Fri, 28 Feb 2025 16:29:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740760179; x=1772296179;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=uZvI/BIwPaZlm9kn40QzZChN5hnSur1q9TaiTAxmvFI=;
 b=lDVyXImTp6DWmgVffGPTFfooQjUi4eeKtYeRoUdm7P1q3Rmu2YC0PzHJ
 lTgX6vwhZDKB2sNdg/10rynGi0nB+xgs4n8WwHDAKofZXh49btDYR0FKs
 A+EWTC37wj1aqnpDzABwDA9G1ddj6er1DgW3U6okH2aoiQN30yOP+2MV0
 pV1jyaFB9WT/qczWODtPjijvDXhvY7sOjWQwopnHF5bDZllm2xBKm3o2m
 Fl/yv961lxgFSJSklp1YtIYoo9M7Lsh1MA5gGseVZg/c6W3BCx30yx9sA
 xnny5qKY1P4Bvzz+myyZ+PZoHMidxbIsFXRlAvZh8hV8PaNc5GRHTQroF A==;
X-CSE-ConnectionGUID: HlFyZWvTTT6DSXRlKANR2w==
X-CSE-MsgGUID: rRFSMptqRAOidYeXDHu1eA==
X-IronPort-AV: E=McAfee;i="6700,10204,11359"; a="41395476"
X-IronPort-AV: E=Sophos;i="6.13,322,1732608000"; d="scan'208";a="41395476"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2025 08:29:34 -0800
X-CSE-ConnectionGUID: 8JKo92lkTYyIE7D1mjWzKA==
X-CSE-MsgGUID: BJb6ysVURauLwT7uUnBDcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,322,1732608000"; d="scan'208";a="117563357"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2025 08:29:34 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 28 Feb 2025 08:29:33 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Fri, 28 Feb 2025 08:29:33 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.175)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 28 Feb 2025 08:29:31 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sd5U/PJIqYBF9pmhGFpcF/YzbxIsxGTU/uge0ap3K6/wuCbUk7gKtk+u7pqai1zpRMsNAOCEewgjzEGj4x3sbTF3/AZiLEFkUfDUa4vdwhmNDSj242XuGgksrQO16S4+8kFWmCJxs4kBCDE9x8v8Tte5xOYkaM9ZcLyJtp0uVpCFEpZeiCcCRaoT0Ywa3BYBKQsBjSkdKhciLRGMJSA943SxS9zhD+VTYoDA683dLUBKIvdmV3KmOFRV7ix3Jk7SwS1KcPylliKVCqwWMpCj9kuHX4KsangQY3hSmylaCaWoQOF8myTCeOW36Vv4GONOsxudzfCEZlEQVrJXQkAgpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EbZ1ENX61xE0+jgBC9M4+Yg5RyJq0CLCrpe5E1eTLKc=;
 b=fSfwor60RscEabcNmeSZL2YnJIdbmH9Y6tbnKm2wza898Rk1zp+TG6AaI/uxKA2me7+ycyodMw5RwAb58fgl91NkUC1IhWmx6FKvzN1bH3ZLVUn2l26bvpJCJbyG0t1gQf8Iptag1PkKZbTpYDjNeHbNVorxlwbvPoKFK742twflSdbaBe1/l0vOcFjy94OjdyHh7sozSuVOguZ7zks5fQkChXsgMBQ+qKbFL1lVAzdper6beK2CTZwwOOmGXBxBDmkQK9cnP1M+knMQEluVQB+dYAC9o3f7mW9DJ8Qmv/Ho1JhN2srX4+A5AtdfZz0WXxiMsCQ8PkJIQhTzohgfwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by MW4PR11MB6569.namprd11.prod.outlook.com (2603:10b6:303:1e1::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.20; Fri, 28 Feb
 2025 16:29:29 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d720:25db:67bb:6f50]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d720:25db:67bb:6f50%7]) with mapi id 15.20.8466.016; Fri, 28 Feb 2025
 16:29:29 +0000
Message-ID: <292e7fb6-1537-4ae1-9685-00b0f8096718@intel.com>
Date: Fri, 28 Feb 2025 08:29:28 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] drm/xe/vf: Set submission version in xe_uc_fw struct
To: "Laguna, Lukasz" <lukasz.laguna@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: <michal.wajdeczko@intel.com>
References: <20250225132337.6508-1-lukasz.laguna@intel.com>
 <20250225132337.6508-4-lukasz.laguna@intel.com>
 <f42f1fb1-9cca-429c-b232-1dc2984e04fe@intel.com>
 <91ed57cd-f17a-469e-9bef-fd43f2894e39@intel.com>
 <058ab253-3ed9-4a1a-a23e-c75282ec1069@intel.com>
 <62e7b237-e6c9-4022-a83e-4d77584f54b0@intel.com>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <62e7b237-e6c9-4022-a83e-4d77584f54b0@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0P220CA0012.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::24) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|MW4PR11MB6569:EE_
X-MS-Office365-Filtering-Correlation-Id: d4ed7ece-8183-47b8-8ce5-08dd5815130c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bmFNdTBhRklnWkR4ZmJvT2VqNHB4SlZSUXZsaFo0VXQwNk0wNnBtR0xHbysz?=
 =?utf-8?B?SE45S2VuN3ozZlJVU0ovUnM1SFk4NUkvT1RLUU5Oa1ZRc1h5TnpTOGc4YnpJ?=
 =?utf-8?B?aGJaWEFlUGY4WHRYRFRxS2J4NDlDc3ArUWxBbjU4S1JPMUtPSUZYQUQ4SlI2?=
 =?utf-8?B?ck52cE8zbUlrbVNuRFkvRnZnWVN3QTN0cUdRY1FnNlFyNFpPbWhvVmlRSkFX?=
 =?utf-8?B?Z3I2ZzBHMVRsMlhGWkZLTTZITU9scndwbHkrMWdSWll0WFppZXVlcFpwTFVC?=
 =?utf-8?B?UjZaUkkzRzI0YnIwNk9CWmFCK01HMnR6V2w1aHVsMXBUVmp5eTJaS0JqZmFK?=
 =?utf-8?B?TVlIUFlFSjFBU1lsVUFhcEVnOTVXY2RkZ0VnOGZHY1VsS3JNR0RQa0RQNmVE?=
 =?utf-8?B?Zmpzc0tmY3lwOGI0MU9rdzVORFlJbi84VjlBdWNMVVZXamNYdFE4d1c3UTdp?=
 =?utf-8?B?bmJSb29mTWRCU09YWTJPNFZjOHQzU0lOTGJNOWl6QnZyTFFUc0M2SE1ueG1T?=
 =?utf-8?B?TmlMN0xxcnZjV3hJOFdETmpGUXpNTlVGVklUMHRHT2hRTjd3YUZUL2Vhamx2?=
 =?utf-8?B?eFpLa0tMdks4Z1JQRlFuOW5oZC9ONzJzZkFoS081MkZkTWRWb0VuWW9aalNX?=
 =?utf-8?B?dFdkdmRFUVRiUkhGMVc5VFJuWWFHb0FUMVFXdnhFdTJnQU5VYzBIZE9ZWFJk?=
 =?utf-8?B?REhWV2s4cTZzVjI0dFhNUmYrcHdKRSs5YUR3QStBa3hSNTQyTFBBTnhFQVdI?=
 =?utf-8?B?N2ZMeVZFblMvTHZaR1dtRjZEbVJFSVdxMThFMHVnQXNHcS9PV3BpY2Z0NlRk?=
 =?utf-8?B?d1pXUXlDUFhiMUdoREZmaks5dnlPTWdCckdLa1pRMlppTW0yS2RyRmNta2hn?=
 =?utf-8?B?dFBzd3o3YVRMQmpUSlB0Y1cyQ21hQXZaVXROL29uY0JQMzFNS3dzNDlvU0Iy?=
 =?utf-8?B?dGZ4WEhPZnE5TEZpOE9oYjZZeTZOc0ppOWsrYzlBNXZTMFJ2elJhb3l5SzJp?=
 =?utf-8?B?WkVtdW5LQmc3TlRrem1tTGUzYlFpY1Z3azRYdXdaYzYxbys5c3pnclZsc3lU?=
 =?utf-8?B?SmtjVlJUMS9BTDRaVHBwZ0p2TDlVRWtsVDFUWlFZa1pmbmllalpSb3VHaVlJ?=
 =?utf-8?B?WjJ4TlJTdmFXT3R0a0c2UGNOd0xkcXduSSt0VE4rMzF6alp2WVJxaFB5ZTdR?=
 =?utf-8?B?anUvYnVWVWhJd1ZMMElQM2FnRUFIYTVhSWFhWUMyTStYN2tQUllFRzZyMVJX?=
 =?utf-8?B?dlljUWJDTXdRSE9teVBBVEpCcktwdDMyNGk3K1B6Q2FBL3VaREQ3NUY3cUVE?=
 =?utf-8?B?L1YrbzdlcXFlQXh0Z3pXdjhyUk5BdWoxSTBDNjA4a1J6d1RoT0pMODcrNTA4?=
 =?utf-8?B?YzNtTzhxdzN1S3RWdm14RGliK2NteHpxc2hCdW1WZkdkemRYb0kwanZ2Uk8r?=
 =?utf-8?B?NGRsNENXdlFwTy9taTBBc1B1VExxV0ZReHJXSEpiVlBObitRU1cwcndPK3ps?=
 =?utf-8?B?OXkwRkNMQ3FldmkwL2VzUlNJZUtKRWdCV1g4VCt4U2hyTVpGT2ErWm5qSVNL?=
 =?utf-8?B?NE9tZ1NzKy9jc3oxdElHREhYeGJzRnhLLzhrSUI1eUl0QUQwZ1gzSmdHT3oy?=
 =?utf-8?B?Y0NGcUFsWlE4WGh2TXNLMUR3U2FJOGVXUVdZSkwxZG9LblArOHR0UnZVNHRO?=
 =?utf-8?B?MTVNZFRtNy9ZaFRnZXpmTDJIVDVtWDRnd21ZN29CMjlpZk1HS2tLcGsyL21k?=
 =?utf-8?B?M3E5NVRMR0p3cFMvTDNaZzh2OWFlcWRlMzdjYW9PNVkrdHVlRFZQMWx6WFc2?=
 =?utf-8?B?eVFaUk95TnJQSjhmZmFiSFU2SDBxS1doYS9IOEhNbDVuZy9PajUyTWpSd1hr?=
 =?utf-8?Q?H3SpwJRuzOcoO?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dngvL1dCNTFhZ1Zja3lJcGtwS05jbGZYRnlrdi9kMWVVZkpsZnpzOU81dk5q?=
 =?utf-8?B?bkRNV1F2bUt0dC9hYk0zVUFrYzZjRnp3U1ZLcVNMczliU1NOcFpUa2ZPWjl2?=
 =?utf-8?B?R3Zxb1A0d0ZkMm1mSFNxTlNGWWkyWHNCS0p6NDZ1YXVxSXRmc1Z0UzRrNFQ0?=
 =?utf-8?B?Z3QwL0N2aGswMWtYaXJqd1pxQ1VLd0lsSm1rSllBajl3eUxWWjZ2RmxZYTNV?=
 =?utf-8?B?RWdDVnJveFVyNUJ2UllTRmtaN0ZVMWFnVUdRenF5YjBCYUY3dXlCUkJWVDMw?=
 =?utf-8?B?ampLS2ZwckxqSGZtd3FFOVl1MUQ1eGEvVzhnUGpjWTArUWdzNnZJUHNETnhS?=
 =?utf-8?B?bXJKSU1kWk0wbW14S1BLOGp0YURPek1Yb0VQVkptclY5Sks5V1VTaC9QQWhM?=
 =?utf-8?B?S0hBaWxmUndyMXk3S3VkYWZwcUJGTXlJTXZ4d2VVS2ZtZ092QjdLMzd0ZWJS?=
 =?utf-8?B?KzQwd0tBbjNQYlByajk5VUtKeFN6WHEyS2dBNnNyM1dVdkZFQkdNQ1NuY0JV?=
 =?utf-8?B?TXpvV2JXOExuczlBRWpveHYvMndqWktsKzNMazQxVjk4UE1BYmZBTFRxZDNk?=
 =?utf-8?B?SzFodHpQWGk4WkliU1VUZlc0U1RlNVpRaXk0eklXM1FFM3pPL1BFK0JuQnRT?=
 =?utf-8?B?QzBRRHZpM1VGMldTdWhRWng4U2VTOWFBL3l0a1R2YzNoclpnZml4TEtpUnh0?=
 =?utf-8?B?ai9EcldWRVIrQ28rTHRSWHQ3cnNHbTZrcUtsdyswM0hwYzJSWllmZjlQRTZt?=
 =?utf-8?B?Y3FYaHBhNUFUM2FISWxiczJYZnZORC9EMTFqRTVJVEpkS1dlUnNRcUxoY1RV?=
 =?utf-8?B?Ui9Galkvc0pLR2RQUk5xd0lmaUxQSVZ5aEY2YmxVaVhDMEhmWnZSSkFlUjND?=
 =?utf-8?B?V2E2OUpOdmlLUlZrdHQzaWwvVjM4R0pMeDRIOEVWZ3dRRzlUTUZYMFo5NzhE?=
 =?utf-8?B?dFc3OVBBS29ZK1lZOWVQSkszamJrWVhybGhJaDdwNzdXNGpNRjBFZWo1M3ND?=
 =?utf-8?B?YitoTFlGK3habXFYRnM5cHBNTFJON1pCTXhCUGxRN1Z6WkMrZFljV2VNY05E?=
 =?utf-8?B?Q3hqdEtpMEtRVVNrWndiVkVQQ0ZvdWErNTBNVE9vTndtRTMzdGJvQkI1RVNp?=
 =?utf-8?B?RUF4a0NVc1ZDQjBtZmNGaE5lMi9hREtXZGx6UmVuWk92ZUxTMHZJRXMrV3pl?=
 =?utf-8?B?bEhpOHZzZ1M2aS9KV0gxV2p6UmNGUUoxNFVDeGg0ODVHZmVZV0JMdXRBbGU3?=
 =?utf-8?B?SndZYmU4UjBVSEFiRk5kM0s3bjFNUlEvbGdlSldVNk42SDdaSXlvTWw0ZXk3?=
 =?utf-8?B?dkxYN0RZQ1lzb3JaMTZHRDVVN2J4WUVYcitDMHd0UjdBc3ZjY25rZHJnZUNI?=
 =?utf-8?B?R0ZRM3JiR0hXQXpMY3V6NXplQ1E0YmR1UVdnUXpnUEdlbWF2U2dvOEE4ZE9o?=
 =?utf-8?B?bXZhTnZqTk1PeFBZS3dqc3hTQXNuSFhQb3VsVFZ5OEkwdzdHd2txVWl1TzRp?=
 =?utf-8?B?b2JkSGVPWTdsRjZoZVloZmp2Q1BzcUhSZkFHY2Q2elZ5SklLSnZwN1o1MUx1?=
 =?utf-8?B?NDdzVGZYTGJwWW9WM2V6VVBiMWRZUmtoNGNTMzF1eUNmK3grMXM1WnpQektj?=
 =?utf-8?B?QXRDUTl4R1lBcEo0R2lZNWpHdGwwZjRnRGhrNnlaL0NVeDVBcGgzazlUR2Yx?=
 =?utf-8?B?ei92Zk5IeWpzTkxkSG1DbTRoKzIvcFQ4cWgvOTU0SDh2SlZrcHdwYnR6dW9v?=
 =?utf-8?B?eGw5K3F3QTJ6Y0NxYmx1TmZzVlhyY1lVczY1Q1R1ZUttL2hETmNEZ3FmNEtU?=
 =?utf-8?B?cVI2cWFlZ1ppTUNFeHFPemZmU1puVUpyTUl1N3IxV3VZZElSekk1bUNrOHhP?=
 =?utf-8?B?ekVEYkFuOFo1dTZBR0JsMFV6NWl1YWZrclMrVCtQVjgveTN3NGRjSDI5ZEVq?=
 =?utf-8?B?aFBzYlNXZVhOVUpqWk51ZFRHTjdUU3h4R3FkdFREdmF2dEFRbGJIMkFHeE40?=
 =?utf-8?B?UXV1VTBGYWVvb3J3eDFzNzk1OGRMVzdlLzdyMXdGb0dvZUp0MDVEV3FPNklO?=
 =?utf-8?B?S2xsR2tnNEFjd3RPNW5DUXp4MUYxcGNTWW0yWDRJei9wWHczalprTkN6eTFR?=
 =?utf-8?B?OVVZTTRQc1FJTGFBMzk1cGJKbWwxeDV1RWt6L0V4eDBlcGY5ZVdabkt6M0tV?=
 =?utf-8?Q?mbcgU/ep7zCHI2Kmox+VuvY=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d4ed7ece-8183-47b8-8ce5-08dd5815130c
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2025 16:29:29.5023 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jGoZbTBqhGH6IbL5JQDwZzLoJtm0bJfu/kUx/aK+3UiQcNGbFpX09s+iFjVIB6UaVE5pn/FN+p/b41TGB5TcRTj1l975VPz8wVa2VF70X+E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6569
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



On 2/28/2025 1:25 AM, Laguna, Lukasz wrote:
>
> On 2/27/2025 20:43, Daniele Ceraolo Spurio wrote:
>>
>>
>> On 2/27/2025 3:22 AM, Laguna, Lukasz wrote:
>>>
>>> On 2/25/2025 23:30, Daniele Ceraolo Spurio wrote:
>>>>
>>>>
>>>> On 2/25/2025 5:23 AM, Lukasz Laguna wrote:
>>>>> The VF driver has already negotiated the ABI version with GuC. What
>>>>> remains is to populate the generic xe_uc_fw struct with the version
>>>>> before initializing submission.
>>>>>
>>>>> Signed-off-by: Lukasz Laguna <lukasz.laguna@intel.com>
>>>>> ---
>>>>>   drivers/gpu/drm/xe/xe_guc.c | 9 ++++++++-
>>>>>   1 file changed, 8 insertions(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/xe/xe_guc.c 
>>>>> b/drivers/gpu/drm/xe/xe_guc.c
>>>>> index bc1ff0a4e1e7..7b38447d902c 100644
>>>>> --- a/drivers/gpu/drm/xe/xe_guc.c
>>>>> +++ b/drivers/gpu/drm/xe/xe_guc.c
>>>>> @@ -703,9 +703,16 @@ int xe_guc_init(struct xe_guc *guc)
>>>>>     static int vf_guc_init_post_hwconfig(struct xe_guc *guc)
>>>>>   {
>>>>> +    struct xe_gt *gt = guc_to_gt(guc);
>>>>> +    struct xe_uc_fw_version ver;
>>>>>       int err;
>>>>>   -    err = xe_guc_submit_init(guc, 
>>>>> xe_gt_sriov_vf_guc_ids(guc_to_gt(guc)));
>>>>> +    err = xe_gt_sriov_vf_get_guc_ver(gt, &ver);
>>>>> +    xe_gt_assert(gt, !err);
>>>>> +
>>>>> +    xe_uc_fw_set_compatibility_ver(&guc->fw, &ver);
>>>>
>>>> Why not just pass &gt->sriov.vf.guc_version here, instead of 
>>>> copying it into another variable first?
>>>
>>> By using xe_gt_sriov_vf_get_guc_ver(), we additionally verify 
>>> whether the handshake completed successfully (major > 0). Only in 
>>> that case we set the version in xe_uc_fw.
>>
>> But it's impossible to get here with a wrong major value, because 
>> xe_gt_sriov_vf_bootstrap() would fail. If you really want to have an 
>> emergency check then IMO it'd be better to just have:
>>
>> xe_assert(xe, gt->sriov.vf.guc_version.major);
>>
>> which you can have in this function without the need for an helper 
>> (the same assert exists in other SRIOV functions like 
>> xe_gt_sriov_vf_lmem).
>>
>
> Next thing is that gt->sriov.vf.guc_version is a different struct 
> (struct xe_gt_sriov_vf_guc_version). xe_gt_sriov_vf_get_guc_ver() sets 
> version in generic xe_uc_fw_version structure format.

Ok I missed that. It makes no sense though for them to be different 
types, because they're meant to hold the exact same information. 
Thinking more on it, why does vf.guc_version even exist as a separate 
variable to begin with? Can't you just store the VF info directly into 
the compatibility struct when you handshake? And if the xe_uc_fw_version 
is missing something (like the branch variable), that needs to be fixed, 
not worked around, because if we ever get a release with a non-zero 
branch value all the runtime checks will break (because they're done on 
the compatibility struct, see the GUC_SUBMIT_VER() macro).

Daniele

>
> Lukasz
>
>> Daniele
>>
>>>
>>> Lukasz
>>>
>>>>
>>>> Daniele
>>>>
>>>>> +
>>>>> +    err = xe_guc_submit_init(guc, xe_gt_sriov_vf_guc_ids(gt));
>>>>>       if (err)
>>>>>           return err;
>>>>
>>

