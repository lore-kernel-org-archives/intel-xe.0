Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17BEBC30653
	for <intel-xe@archiver.kernel.org>; Mon,  1 Jul 2024 11:31:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B78A810E3A8;
	Mon,  1 Jul 2024 11:31:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BeUY/Jbw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF6D210E3A8
 for <intel-xe@lists.freedesktop.org>; Mon,  1 Jul 2024 11:31:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719833515; x=1751369515;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=6qI8ZKB2XLSEMk4QZbVyyTNOItmblsjCMEWX+e/QZ7I=;
 b=BeUY/JbwXk883w+nU/FjNfskxL/TrcXrSWT2ov+HZ6ZsNHeXjzIAk6pj
 9eK/sM3b7YyZMZfX7t4w7eYcxdUqWgsFb2Mkmm3T8LHudnLSvPByXqKsz
 UBfnnJ7GvJlLZqleq6Rgsga8WRzUHHg0tvESEq9F66zy3bncVrSUCq7pI
 dv5wd1pP/uDjaHHhzwHMAaZx6ECQsWFrrpbjb0ukF9NQEhsozMpYC0+nR
 E9SzJmq3V7assnDUYViekAuMzJ5RkYlM8nwkH3pzF7BTi8bf8k4WYrc/p
 Q2B6sk5UwMvqMEdnIP78wNYk0oVi2461gFAuT7qeXREByleFbuuEIaHmq Q==;
X-CSE-ConnectionGUID: WAYnu6lZTAe9aaTr1kxz2Q==
X-CSE-MsgGUID: xQQzpOsoToKu5xf7woOaJQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11119"; a="17086286"
X-IronPort-AV: E=Sophos;i="6.09,176,1716274800"; d="scan'208";a="17086286"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2024 04:31:53 -0700
X-CSE-ConnectionGUID: 7qQiVtEjQRqZW3RBBni0pw==
X-CSE-MsgGUID: 4yoL2ZheTeqQnQSIPYHT2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,176,1716274800"; d="scan'208";a="50702592"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 01 Jul 2024 04:31:54 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 1 Jul 2024 04:31:52 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 1 Jul 2024 04:31:52 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 1 Jul 2024 04:31:52 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 1 Jul 2024 04:31:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nYzk2HXKEyLA/L5arZbQsBmXEUnFzJ2NUJLdgJm7T1ki7Ouo9+zjizq10tZdiL11233QM8RqlEt4sb5f0nMiKKiC69cmuIyPktvzQLLYzZZsTZ5/w6WK89mdEFhLocM6qOJoMoVyWyBVoSlEneFMBxKgPXj9lQnUjFnCnjfAMfr9w/TrWl3RNL1lVINWaD1FvUJtH4wTdKp5xIjg9dFEeybreDB7PLubZLQ0v1lJqUdI0olpZmXlphrPqxE9vcFiZsYJASd8mukTqz8e9BMMvbHl48/1KwQ3zbpLhztPTFGLqd7/UV2jQOsA9f6epSj6yCWk8fgiNgWTpdit3Ze65g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SYhK9bEhxDH9ZEQbd3RE4L+rP90DiiXEKv6Wkmy3efY=;
 b=oOkmN4ic5qDSow047wKe1aloRbs0ClvmX8ykvbDE15UCXyAWd1lhk1DHvfjzo9wAaywi83XVSV9iBRW6aWPVAK4irkD1lsn54ViH/m/zMtTkQ0aDPChSXRRrQNIHUZR5Dq70/7W6G+SGmgvEXsZHtaryJkuY8kg6Ju16zz6HxorS5+zPnSXzMXyHF/cSZxXS+7DVWeItaphGUOgVINqo0NMBbyATCzUff8928cuRdI+nzogAVPIE5XLE1YI+VP5pYSI88dr8K8tSuFfzJMm/4Xs2fs5kPKauiU5xZk+RAIBHTyHFm0P7Ib/OlSzC+VMlMtKRPxz3fa4rk9lPshe4Mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by MW6PR11MB8338.namprd11.prod.outlook.com (2603:10b6:303:247::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.29; Mon, 1 Jul
 2024 11:31:50 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%6]) with mapi id 15.20.7719.029; Mon, 1 Jul 2024
 11:31:50 +0000
Date: Mon, 1 Jul 2024 13:31:45 +0200
From: Piotr =?utf-8?Q?Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 2/3] drm/xe/pf: Restart VFs provisioning after GT reset
Message-ID: <20240701113145.uh5xffy3cjihq2vs@intel.com>
References: <20240701102738.934-1-michal.wajdeczko@intel.com>
 <20240701102738.934-3-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240701102738.934-3-michal.wajdeczko@intel.com>
X-ClientProxiedBy: VI1PR0102CA0023.eurprd01.prod.exchangelabs.com
 (2603:10a6:802::36) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|MW6PR11MB8338:EE_
X-MS-Office365-Filtering-Correlation-Id: 26300e0c-1162-4a4f-5f44-08dc99c1661b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NnViUGk5LzBRODJBWEpzSVpEZm5xUGVKbzJwUkRaZGk5N3M5bEhkSzRsWE5y?=
 =?utf-8?B?ZHBXUGl3VUF0bVVORXV2TXZ6NkhpeHRMOGlObGc5VXdVVjd4QjJsZlVZM2NK?=
 =?utf-8?B?TS9ld3UreFdwWlYzTUdobVBtZm8wbUk1V0Z6c05oZzdOZ2hjQkNDV3pCOEU2?=
 =?utf-8?B?eHFHZWtsVUNVTUIrU2NxMSsvU2lkWFNOVHFTTmppbTU4dkw0WDhsaEdGVWQ0?=
 =?utf-8?B?YWZjSmIrZlBEc2R1MmFLZER6V25FVERXdTBKR0VwaWJ6K2h2QW5HcG1VaHFQ?=
 =?utf-8?B?ZE9qcUN1NXdSeExlNTJZK01EQy81QTBIRVBBY09na0EyL1FhK0lnL0FyTUM2?=
 =?utf-8?B?SDN1ZGpRRjRHRVBOOHZOaUNWVG0vdXZidEduY1BDZGZjUm5qaGZyWlozNDF6?=
 =?utf-8?B?NDAxTkRHejhJQmJYUlN5WXE5UkNCSWJ3a2RqdDU5UDVpTVlZMW5DTUNubE1t?=
 =?utf-8?B?UzN0YWVGSTdtU1ROdUZDRWpaSmJLNmJqdXZodDN5VWJpa0VYcFRod3pSYVhp?=
 =?utf-8?B?aGRmci9TTlhJMm9LUHk3S3pBR2wxUXAxUWg1SWVLc0d5RU9aeHFNdFlZWTJN?=
 =?utf-8?B?clBselFHVkZUOUIwYjd5YXlveCtpZUVxTitnV3VBOTJLZ1IyVUpvWXE1VDVH?=
 =?utf-8?B?dWRyUGpPR2FOZUIwbFUvVkdTekttSUcxYnA3aEdzTGc2ejJnMXdQc0NkWTBn?=
 =?utf-8?B?R3oxWkE3UXRzYjYxSTAwNEVWWEc5R3htVVNMKzZQUDhMTVlIc3hBcjh1SzZk?=
 =?utf-8?B?cC9uYzYrN3BXUDZ3SVJ5ZWpLejhuSUhYcEFsS2pqdFMvV2VoaG00U09EdjlP?=
 =?utf-8?B?eFlDTWFwWmdFSjl2bndnQmNodUhJQk41N2FhZ0RzRHAwY1BlSVNOMUVVdEZZ?=
 =?utf-8?B?Um8vMVpzQ210RnBienpZSmkvMExqRzBRazk3UDcxd1RjM0x1dmFXVzJjR3pF?=
 =?utf-8?B?QlBCRyt6eTlKNkhoRklQUTJqWmJlNEYvMlp6ellCaWdLN2llVFByOERycUhU?=
 =?utf-8?B?Z3lvSGg5RTlvSHdlU1hPcEF3Si9nMXFHL09MbzM5QnIwVzhkeGc0c1k5dzZt?=
 =?utf-8?B?UnlXdldjaUZRTTlwQ0pGRFRCYmJwMThGWkVReGlsT3RJQ0dEaHc2bTV4dmk5?=
 =?utf-8?B?MjNyaEFrclkxenRwNENOb3RhWDZQUGtIeDdZMHU5MzE3T05pRXZVdG02RHhY?=
 =?utf-8?B?bkRsdUFLbXNtNVJHeTdJSU50amtQeVVFL2VoeVoxWU1LUGsya0E0TEVEU3FG?=
 =?utf-8?B?aVZnSzFGUGoyQkE4dGljVEJHdzNkaW9maWxHRnNweVppWXkvcnl3WCs4TEFV?=
 =?utf-8?B?OGd1VzJ1Q0N2V1BGR2ZYRlZ0WFVGSnRXNnU5MlVhMGZoa3JCTXJUZFdHRUFZ?=
 =?utf-8?B?ekx1RHlUOCtlQWtSNXRPT2FuakYvWTZmTjBycG9ORlU3UmxwclNrUTRhMkJG?=
 =?utf-8?B?Y1Y1TGpGT013R0EyUW9vYzZvTjh3Y0VGZGtkVFo0eDhvZ1k0RlU2ZFRNbDRw?=
 =?utf-8?B?VklwakttWnZLdi95dkppU3pQTU5ZZW9GSDZqb25tWUVYWnkyZXFubEZwUWVi?=
 =?utf-8?B?Q2xoTC82RnBTUnJHbGFuVk5qTVJvT0FRZ241L20zV3F0WEhLa1BxVGc0SkZQ?=
 =?utf-8?B?emoxc3NFUTRKdFBhNUJKc3Jtc1dpMEppVnR6K3ZKeDNCbGlCZjI3VFRYYzRp?=
 =?utf-8?B?VU9pajdUWXkydXlqTnNYY20zL0I3eUxaa3dGMDhTYkdEcVhqTktqQ0pwZzFU?=
 =?utf-8?B?QTMyMG81MCt5UkRpSHRSODQ4YTB2S3IyVUZOV3hzakNBSnhtVmZMNVFyYldS?=
 =?utf-8?B?ZkFhVkZsL0JTUEJycE5XQT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dXdoYzRNeWc5ckFQZFRLeHA4ZC96bkQ1NzYrYzRFMnRYWWJLaTMrZnRZY1Na?=
 =?utf-8?B?bkwweVYya0VNSm1GdklzeXhSMVFBbGhjb3l0cUtDSkozeW5MdUU0M0I3NDVv?=
 =?utf-8?B?TWFReWNkM05oUmJnNzYycG9lQ2dOQWc5OGpRVGVMb1pML2I2OEZ3aWM4Z3hC?=
 =?utf-8?B?cVpWa2pWSjVQeXVVWjJ5Qjg3dElRcW51WlZUeG1PbjRBUjZjdzhaUXhBcnhH?=
 =?utf-8?B?K1I0eHprY2pQUTN0OVhpK08zRjF4cnlBdHBvMTNYWExnVmhqZWt2ZzZyQ25z?=
 =?utf-8?B?d1NhYzZTcHA2d2NmaVFkZFV5bmxJZTN1Mlk3WU1jRzhBMTg4M01SZjJ4SE0v?=
 =?utf-8?B?MGtPNm14QUhpWkw0LzR2R1FpNVo4blA0VnJtRDZkck50Q0FlYTZ6N3IrK0x4?=
 =?utf-8?B?VzFQSkJPWS9RVyttTy9DSUQxZEdpMThwMWwrMzhyYXRaTTNDR1RaOXVpOEsy?=
 =?utf-8?B?RlN6OWp4YlhzcWw2ZEwyWVhDMXpyaU1QaDd2S3hSRVlKYzQ4Z2U2U3h4QXU2?=
 =?utf-8?B?TFNhMmtjeHhmU1k2dFIvRFIvQW1IeitwN1pMN3JpSlBwNEc5aDE4aTJ0TzlR?=
 =?utf-8?B?SDlrVkI2MkZyei9QeXhFK3ZORmRGTjhNM2ZyajlmYTBjTnVOT00rcHM5ZE9X?=
 =?utf-8?B?RXpsbEVtUVQxZG5EMXR5eHBmdERFK281b1Y4VnArVlI5c2lzaDNuQ2VjQ2dM?=
 =?utf-8?B?MGRSb2hzNFVmL0FpZmxNK29UblJ2c3c4OHJxOXVLYTF6c0VBU250TjY0V3Bn?=
 =?utf-8?B?b1ZzQThibG4ya1FmaEgzN09ZY0tiK2ZDeFBHV1JFbkIzeldtZ21EaURWM1Yr?=
 =?utf-8?B?cXFQY3RqQkV1ZVhHMnAzSVdtenB5R252TlhuS1g2c1ZpSkxmaGozUXNSQ01n?=
 =?utf-8?B?Rkd6TzRGSTdGYWxRTjh3QjVpT2Q4TS9BR0s4UEMxWmNOVVRmN01ZWUlDY1pa?=
 =?utf-8?B?UHZ6MEMrZk5kVTdpNGt4b2FFK1VFSjQ3UnJ3a3lXTlAvNC9ZcUVEYzZlenZI?=
 =?utf-8?B?MXBBbjViMDFlbjdianJaM1Z5Mkd3b1NQbHNDQ2k3WnNGWXZwN1N6OVZ0VFgr?=
 =?utf-8?B?WXllaTM4alJETGMzQzJhMGdTUEtwTW11bWlXL1VRMDN6VTlXVWlrbGVXNDF5?=
 =?utf-8?B?YXRwTlJwZHoyZEozTmJtTW5rdjRqZ0VPbDkwTVFPT1o2QUhYdmtQeC8zSWdL?=
 =?utf-8?B?S0hlUTQyTTBaRC9lUEt6QjhVVEhSYWs1Y0FrNnVOWGl2V3JFTG93WjVZbmoz?=
 =?utf-8?B?WHBnN2dWdHpaK1d2TFkzbmFiL01mTXNWRjlmQnR2cTE2eHJzbkJrN1dpMklS?=
 =?utf-8?B?MmloU0FOVnFybkxKUEZCLzBJb25GR1dBZWE0UG5ENE5yYm5STEdPZ3RjMitZ?=
 =?utf-8?B?NFl1ejZXbVVpaDAvcFgwbGFHMlIzVE5laFlRdTRsK2hzallESlp4RFY2d1Bp?=
 =?utf-8?B?U0tFMUNPRm0rK0hkSXdrc1Y4L1AxTzJaZWsrbDVkR0dsQTk1OXNrMEJ5RHVM?=
 =?utf-8?B?MEpvN0diWHR4RHRkdTBxeWtCY01PZjgyeDkwbW13ZkFXK0RqeUxFdEk5akc3?=
 =?utf-8?B?WUVpOW05MTU5ckNvTHR1bEw3S1B6MTdaKzR2dy9YbHdKYkNRN0dXa0ZaUVA5?=
 =?utf-8?B?UUNJODF3UjdxalczYVBNeGIwVG83cEkvdFBFVkFaU3ljK0VwMU14S2VuL2Zs?=
 =?utf-8?B?cXVEazU1SkNnQTdQcFJLWkR6R1doMU5VaFV3NnpaRHFWUzIwSDhoQmNpazU3?=
 =?utf-8?B?QTFBWjh0bzlHSHdxREVTZXV4bE5tVHhFRXlzdm5ROWV5ejlFZVBTTjNhWHd6?=
 =?utf-8?B?ejBzVWhIS0FmZVQ4QU92SXJscGFYdFZSVXRIbEVTcHFwNzJGRTFuNTkvV3dG?=
 =?utf-8?B?YXdNV3ZIMmNNYnBvRXR5bjQzYm0wUDhub2N6VE5tZkp5YVhyOUQrV09zSGNh?=
 =?utf-8?B?WklBRmdtdG53ME82YVpLQjRBY3BKZHZHckVmNkx3L0pNbW5Xb3hldXIrcTVC?=
 =?utf-8?B?VzVvWTU5VmN2MkJhYVVZRlVIUHVoMGtHRHdwbXkzNlczNlFWZnY2aFJJejJx?=
 =?utf-8?B?MWhjR1FZY243K3ZiTXlCK0JObjZxazBqRFExcll5VEdHQlUvV3JTM0NkU0Zj?=
 =?utf-8?B?MXkydVNRUVV1VmNCa1daeEx1ZXpzbEV5R1NTYzFDOVRjemYvTlJINndRVjZD?=
 =?utf-8?B?ZXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 26300e0c-1162-4a4f-5f44-08dc99c1661b
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2024 11:31:50.1681 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cHW1QxAbkin+oM4zwklEH6n3vPsy8O1VOJ9DIVDGY2d8kzMtJ/xacyBIpWkNXzJbM0R1jkfGWMFeITIZ04RAA93aHpw01QFrOMPPUG2tGkA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR11MB8338
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

Michal Wajdeczko <michal.wajdeczko@intel.com> wrote on pon [2024-lip-01 12:27:37 +0200]:
> Any prior configurations pushed to the GuC are lost when the GT
> is reset. Push again all non-empty VF configurations to the GuC
> as part of the GuC reset procedure.
> 
> This will also help restore early manual provisioning, when the
> PF was in the meantime suspended and then resumed.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt.c                 |  3 +++
>  drivers/gpu/drm/xe/xe_gt_sriov_pf.c        | 12 +++++++++
>  drivers/gpu/drm/xe/xe_gt_sriov_pf.h        |  5 ++++
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c | 30 ++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h |  2 ++
>  5 files changed, 52 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index 759634cff1d8..29e8ea94d05e 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -683,6 +683,9 @@ static int do_gt_restart(struct xe_gt *gt)
>  	/* Restore GT freq to expected values */
>  	xe_gt_sanitize_freq(gt);
>  
> +	if (IS_SRIOV_PF(gt_to_xe(gt)))
> +		xe_gt_sriov_pf_restart(gt);
> +
>  	return 0;
>  }
>  
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf.c
> index 7decf71c2b7d..9dbba9ab7a9a 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf.c
> @@ -8,6 +8,7 @@
>  #include "regs/xe_sriov_regs.h"
>  
>  #include "xe_gt_sriov_pf.h"
> +#include "xe_gt_sriov_pf_config.h"
>  #include "xe_gt_sriov_pf_helpers.h"
>  #include "xe_gt_sriov_pf_service.h"
>  #include "xe_mmio.h"
> @@ -82,3 +83,14 @@ void xe_gt_sriov_pf_init_hw(struct xe_gt *gt)
>  
>  	xe_gt_sriov_pf_service_update(gt);
>  }
> +
> +/**
> + * xe_gt_sriov_pf_restart - Restart SR-IOV support after a GT reset.
> + * @gt: the &xe_gt
> + *
> + * This function can only be called on PF.
> + */
> +void xe_gt_sriov_pf_restart(struct xe_gt *gt)
> +{
> +	xe_gt_sriov_pf_config_restart(gt);
> +}
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf.h
> index 37d7d6c3df03..f0cb726a6919 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf.h
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf.h
> @@ -11,6 +11,7 @@ struct xe_gt;
>  #ifdef CONFIG_PCI_IOV
>  int xe_gt_sriov_pf_init_early(struct xe_gt *gt);
>  void xe_gt_sriov_pf_init_hw(struct xe_gt *gt);
> +void xe_gt_sriov_pf_restart(struct xe_gt *gt);
>  #else
>  static inline int xe_gt_sriov_pf_init_early(struct xe_gt *gt)
>  {
> @@ -20,6 +21,10 @@ static inline int xe_gt_sriov_pf_init_early(struct xe_gt *gt)
>  static inline void xe_gt_sriov_pf_init_hw(struct xe_gt *gt)
>  {
>  }
> +
> +static inline void xe_gt_sriov_pf_restart(struct xe_gt *gt)
> +{
> +}
>  #endif
>  
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> index 810b579a0025..db6c213da847 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> @@ -1970,6 +1970,36 @@ bool xe_gt_sriov_pf_config_is_empty(struct xe_gt *gt, unsigned int vfid)
>  	return empty;
>  }
>  
> +/**
> + * xe_gt_sriov_pf_config_restart - Restart SR-IOV configurations after a GT reset.
> + * @gt: the &xe_gt
> + *
> + * Any prior configurations pushed to GuC are lost when the GT is reset.
> + * Push again all non-empty VF configurations to the GuC.
> + *
> + * This function can only be called on PF.
> + */
> +void xe_gt_sriov_pf_config_restart(struct xe_gt *gt)
> +{
> +	unsigned int n, total_vfs = xe_sriov_pf_get_totalvfs(gt_to_xe(gt));
> +	unsigned int fail = 0, skip = 0;
> +
> +	for (n = 1; n <= total_vfs; n++) {
> +		if (xe_gt_sriov_pf_config_is_empty(gt, n))
> +			skip++;
> +		else if (xe_gt_sriov_pf_config_push(gt, n, false))
> +			fail++;
> +	}
> +
> +	if (fail)
> +		xe_gt_sriov_notice(gt, "Failed to push %u of %u VF%s configurations\n",
> +				   fail, total_vfs - skip, str_plural(total_vfs));
> +
> +	if (fail != total_vfs)
> +		xe_gt_sriov_dbg(gt, "pushed %u skip %u of %u VF%s configurations\n",
> +				total_vfs - skip - fail, skip, total_vfs, str_plural(total_vfs));
> +}
> +
>  /**
>   * xe_gt_sriov_pf_config_print_ggtt - Print GGTT configurations.
>   * @gt: the &xe_gt
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h
> index 58c8f879d7ab..c0e6e4743dc2 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h
> @@ -55,6 +55,8 @@ int xe_gt_sriov_pf_config_push(struct xe_gt *gt, unsigned int vfid, bool refresh
>  
>  bool xe_gt_sriov_pf_config_is_empty(struct xe_gt *gt, unsigned int vfid);
>  
> +void xe_gt_sriov_pf_config_restart(struct xe_gt *gt);
> +
>  int xe_gt_sriov_pf_config_print_ggtt(struct xe_gt *gt, struct drm_printer *p);
>  int xe_gt_sriov_pf_config_print_ctxs(struct xe_gt *gt, struct drm_printer *p);
>  int xe_gt_sriov_pf_config_print_dbs(struct xe_gt *gt, struct drm_printer *p);

LGTM:
Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>

> -- 
> 2.43.0
> 

-- 
