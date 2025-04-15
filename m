Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B284FC369AB
	for <intel-xe@archiver.kernel.org>; Tue, 15 Apr 2025 05:58:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75D9210E0D9;
	Tue, 15 Apr 2025 05:58:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AJvmCpz7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 724FF10E0D9
 for <intel-xe@lists.freedesktop.org>; Tue, 15 Apr 2025 05:58:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744696736; x=1776232736;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=butl/CQeWusQl0/SFsqVk+bIZQRyApYa0SUxPX4yACU=;
 b=AJvmCpz79FULk/64uSU/+Ub+iPqxjdVWUJQAk0vJXd1ZXpfLW4a6QZWF
 Vb8aQJjsi7LhUPQvmV6PyqhbiUn/Fci0xjpE/qf7amG7/jrgKZpgq96S8
 u6nqOD2AeVWnP9TCTT94n3aVaVlJb8fT9Fy7nszSqzHygmVeMLPiFMf4z
 QbTX2q39tDXSIUKH+Q22q3bFLuNqHLiZJus+Z2trhiG8jQR2LwsOT0SwH
 B3aNtOV78R4+2LPLnh7dcoLNlYEBQA6Wz6kQb+RRDPuq+FMmuBJivC9M6
 m/QAg7YEVwo1hh5ap86CC0wFMuaWgUYhwM2jRRLl/pVSlLzj9nxbaOGAb w==;
X-CSE-ConnectionGUID: NKiArdgyTniOzLZG9i93NA==
X-CSE-MsgGUID: aApo6nyET3mM3K3aI2cMSg==
X-IronPort-AV: E=McAfee;i="6700,10204,11403"; a="45321576"
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; d="scan'208";a="45321576"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2025 22:58:55 -0700
X-CSE-ConnectionGUID: Qbur+9vRTP+Vv+mLNrLBaA==
X-CSE-MsgGUID: EqLvf6NRSHSDMtVfGXE7Gg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; d="scan'208";a="130027087"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2025 22:58:55 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 14 Apr 2025 22:58:54 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 14 Apr 2025 22:58:54 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.40) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 14 Apr 2025 22:58:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rknlTnLr6tZJW/rbSYR6BZxaT6PNwHo0qD5sBOuw5cHXDhvugKFExJBFsuZgHKv75dbX/5pZNTM4TTmq+Dx9Cqxk3CUJMtwnheFHOgVsQLVivBNaFa5GaC8pFhNU4QrV8A4+QKvp6+pxBpkatAJhT4R6+IiXFIi9/YhVPRNJjr+DPrcB+vo5UL0JYu5Rf1KSbMQTicVqpqFmMLeehYm9d2pvFkVnmdmnUDmo6YK5hUdVTq8790kIsCxx029nnj1P9Xfm3iNFqbBtxNlq2ruymkoPUvjNNJZHWXu7pLtjCVo0jPNIqoapAANbeW6K6+bFT9/B0G1MY42uqP9kP+V7Kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2d0Q1MnzComOLjPiJQm/2W6UuO15FSi5I0yXI4eHqYc=;
 b=vjINxZ4oDZvgq/12IHrPVQjE8UlbHw0Mkb7/JtSR0OWzmbtKKw+TTtLYXCYm9DZdgIXADmo5O/7XHWAkaDcH/OG7BZNsJ727RNwOTYsmUrx5rEWrtH8wDD+LGkZNXsvTSP+x05KhurDqUFnyeZ7DpXcftQG0VLwW0h5b4CXMOlCwnurrvhLpkwZniwgF7WcMUHs+JVNT4uekdtc3vrX79gm09jLYr5tCfHrFBR2NCihG/EgMofkygzYiH1MU7K/VvnLatzSwKnYRWMEpCSwCU4xf2GJ4v8ppv7aYramMmYbcS5uX0IUz3BJVL/ZZrJCfn/1yecih5SgnfUPF3r7Xhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7955.namprd11.prod.outlook.com (2603:10b6:208:3dd::6)
 by PH0PR11MB4853.namprd11.prod.outlook.com (2603:10b6:510:40::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.35; Tue, 15 Apr
 2025 05:58:51 +0000
Received: from IA0PR11MB7955.namprd11.prod.outlook.com
 ([fe80::7265:46ae:19a8:b31d]) by IA0PR11MB7955.namprd11.prod.outlook.com
 ([fe80::7265:46ae:19a8:b31d%7]) with mapi id 15.20.8632.035; Tue, 15 Apr 2025
 05:58:51 +0000
Message-ID: <9cfa6367-837e-43a8-bb9a-0c4a86237160@intel.com>
Date: Tue, 15 Apr 2025 11:28:45 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/xe: Use GT oriented message to report engine
 activity error
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
References: <20250414202347.1909-1-michal.wajdeczko@intel.com>
 <20250414202347.1909-2-michal.wajdeczko@intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <20250414202347.1909-2-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MAXP287CA0021.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:49::30) To IA0PR11MB7955.namprd11.prod.outlook.com
 (2603:10b6:208:3dd::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7955:EE_|PH0PR11MB4853:EE_
X-MS-Office365-Filtering-Correlation-Id: 102e2c72-33e9-449a-0cf7-08dd7be29876
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cEpzZjFVa05GN1lMemYxYWFieWtUQlJIaEozdFpteWxRY0hzblg1clVNdEhj?=
 =?utf-8?B?Mjg1U2c0eVdCUWJ5cDA0RDV5UFRPMXBoWXhkTjE5SkJIbW9EdVVoRjBFYVA0?=
 =?utf-8?B?OHB4UnZsWW9YQXVqaSswR1h3M2pGUzRwaDg0Q0dJV3J0VVpVOEQ1NEp1YXNv?=
 =?utf-8?B?ZEoySDl3blQ3T2toV2ZYVzk4cUE2aWFEem5FSGdEMGVVUVdtUXAvUytkeGE3?=
 =?utf-8?B?bDBNMzBmMVFFVFZhQjcwclZQbmNrL2Z4YkpNUDdjMEJaMjhJaXNLbmJQQ2RQ?=
 =?utf-8?B?eDlYMkpuamtmYmpZY1hJSk90UGZ4RXdlbmxJUk94NFdXSUlIMGk3amVvTTRH?=
 =?utf-8?B?TVZYdXhFSXFsL1BZWjJ5bnl3cEJkVFY4czNUU2ZZYjV3aXRhcGhHcnhRTmdD?=
 =?utf-8?B?cjNCcWhBcHZWRlZsMkpDWFdDbndwOStvVnM4R1B0QnNzMDR5cWxocW5LQkor?=
 =?utf-8?B?a0RiQjZDNjNhSXBnbndQU3Z1U3FFUHBtQ1FHVFZSUnZxWkpKaWxQN05EQWt5?=
 =?utf-8?B?Z0R3UlU4OW1yT3VDVmhOZGVIcll1NC9DODN5ZmlmZVNCaCtxM1M1S24xNERi?=
 =?utf-8?B?d2UxdWtnUmdYRHR4TERhcnVVVlRZcmN4NTdsTEhMT09PSjlBZzdDS0pYNUli?=
 =?utf-8?B?NEU2SDVMM01XSXVOMXVtL3ZiZTVURC80eklpdWJqSEs2S0thL1FtWFREeHBI?=
 =?utf-8?B?MElFKy9YY2ZMeHVTNlhIdUR5RGNGY2VqVmMrS1JzdkV3VU9CUHo4TG5YcDYz?=
 =?utf-8?B?WFZSOGpkbW0vd3NsNGpNTTNaZUVZVVRPRkZ1cHhvWEVVRDB1Z1R4QUdWZlZh?=
 =?utf-8?B?MUNieU9paTVnOU9KNm5mQWd6OXAvSEgwZTdpc2dLeWoyZWg4LzFXQm4yTUQv?=
 =?utf-8?B?UGVWdnZ3dlJEaGF3RTNob05yYlFoMkI4VkcrWm9pQjFneTNOOVVTNmVoM1Er?=
 =?utf-8?B?TGo4TjBxMWpTb2RLTGhqQ0hmL3NvK3JHYjFPWHdJcFN0VDVNRGQxMDUrODRI?=
 =?utf-8?B?aitKeGVZa1JCR3ByR0Y1bENYaE01cWJrZCtZeVhwRVhyOHpxL0kzYXZMbzdh?=
 =?utf-8?B?TnZPWXROTWQ1cFhOeDY3YTRZaFZTd0h2WDU0Vk82KzcxSVB2d3dhMWYvamtM?=
 =?utf-8?B?V3oxb3Ira2pvTEU2b3VlUUJia3J2RkdOaWRtTnZWRlNGbUxmdjg2d1NKWlFS?=
 =?utf-8?B?dXpJTVZsTkxDNnlSbDdYeUpoVE5zZURveDQzcmNKZGd3VzFRVjZhUWVkamdZ?=
 =?utf-8?B?azk2U0RRamdaL2ZJVGkwd0k4YVNyK2FlQ0RDVjlSNFZhcFVGNGVxTzRodWdx?=
 =?utf-8?B?cGNkUXVMMUYrV21mOGJzdXpMTFNvR0E2V1ZwV0VsWUsyYTNKL0dCRSt2OXll?=
 =?utf-8?B?S2RwRVBZdTlwbGhtTDEveHNKZ3lMZjNnWnQwQkJRdEFaU0E0eU01ekZsa3pH?=
 =?utf-8?B?QlVqOHZzSWhzNnlIVXJ2OGJDVnVUc0h4eWtTSi9VNGI1VW5mRS9hbnVKdFRW?=
 =?utf-8?B?N1BVTDRJQzNiM1FOWGR1YmcrZmQ4NE5aU2ROTkZPZ3JhV25TY1VyQThTVDNa?=
 =?utf-8?B?ZXNvVURXREo3bmFKU3lzcTBHcThQWUIrN3lEbW15emJqQXRXVVEzZFZvNTJ3?=
 =?utf-8?B?ajhQTzdSR0w5T0VPcG1Temg5WGRzemZYUkg5UWplTnJEWTYvYitZMEdCUFI3?=
 =?utf-8?B?QTArNTFZYXBDNTZkRDNsbkM2Y2dhQmV3S2JESHhxd25SdVV3TmExQzFhdFlY?=
 =?utf-8?B?RG5PODFlRkZHbi9ZckdHU0poWnh6a0FUK2RXZlFrZlVNb0NIaDV2YktMbThL?=
 =?utf-8?B?YkZ4YUVBNlpuTFlsUFlDT2FpQkNVRG0wV1ptL1Z1RzF1V0dlRy8vdXYxUDNW?=
 =?utf-8?B?TUpTWWtUMXduUmx2anZqRFJna2tRT3FHL2NLNnJUYVRaK2VlTlJuaFhiWHhk?=
 =?utf-8?Q?aa+fBZbF9Fo=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7955.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z3pJYk9raDlndjg2SHhtakRyMkk3ckV5QTZWVWVyMDV6dDV6MjlDUGZSQ0Ju?=
 =?utf-8?B?S01pbVJTaVhRNjYyYU1USHV3azBFellmVVNTRDIxbUIrWlg2M1MrR3dWQ3FR?=
 =?utf-8?B?UmQ3MEJyNHZFdGFaaTdzYktWTnd3NFdQcmJSQnowTGxSaXJKODFQQzU5eUpV?=
 =?utf-8?B?WkNwaEQyVTRDQmV5cGswcDI4YmlUZi94NG1XM0l3ejhDM1kyaFBHMTVyRGdh?=
 =?utf-8?B?dmk2ME02SEM2V0dQb0tHSFJENCtkaEgxYmd5RFZvKzhUVEhWNkhSdithYTdm?=
 =?utf-8?B?TUxreVBSV3dnUHlpNlkrNFlSSTU4T1BWS0hHWDVScXZQQ1RIR0JyWlRZYmYv?=
 =?utf-8?B?VXhnNWI1ZHg1Nlc4dXlXWXdrV08ybVBXdWNSKzR4cW5ZbEdnSkNscHNyZlpQ?=
 =?utf-8?B?YW1iaUMrRTRLV1FCZk1kdCtRMXlLNWVoUzFRczkvSktoTXRFenhpV3pLWjY1?=
 =?utf-8?B?Wk5BcWtwamtBTjltT2ZEZXMzZmdUM1ozQnU1SS93NC9oRVVydEkvRUdkRmdh?=
 =?utf-8?B?N01VdmFnRE81QVlOVVh3KzhlUjZoYk5kTG9jZ2NpemlvOElqMVdqWGVCZGpz?=
 =?utf-8?B?a3hpQVBGbGk4TDdvSDZVckJZSVh3TGx6TVd6SlRvSkh1ZVk1bmhHQXB0Uld2?=
 =?utf-8?B?UHgybEJWdlZRQTl6bVB0Wmw0ZCtiZkJNd09XaWEwMFlSYjBENFpaM2lCNVVU?=
 =?utf-8?B?dm5TOGd1M0Y0OUZSL0grNlB2T09NR0JSQzdXUFF1d2lWUGlrU21zL0srT3c4?=
 =?utf-8?B?dmpUOUZPYy82RDZNNVpjcEVJdkJ0WGpKRndFVVkrY0ZNR1Qvalo4M0FUYU9I?=
 =?utf-8?B?ZldhQlNaSGFuQ3UrUzVHenNmRVlUelZ2L0k5b09wY09ndGlVMWFQeGF4ZUJy?=
 =?utf-8?B?TUlhbTBiNHBrMWFhbVdtSmFIQXYxR21JNEhScEl5MStDR3dFdXlvdXNzeTFD?=
 =?utf-8?B?S25jNmdhWjUrcmIwK0pOaFMwZjZVUkhxT3p0NmZwWnBzbExINmVYdUlpZXRu?=
 =?utf-8?B?TnVGdzNZY0gwcFY5ejhnZG00NXpzckxEUmhYWXpkcFZMQzdDb1BIL1hWQTVp?=
 =?utf-8?B?dG84NmpmWm1QNjVzdWJsM28wYlVsV0VJUzVnczRXd2tWVU1KTk95M0dLY0dt?=
 =?utf-8?B?NktnZnFZK1FNZW9HM3hBQ2Mzd09FREdIZHFWcndPenQ0RWVKSzZwdWVXS2Nr?=
 =?utf-8?B?UnpHYy83Uk5vcG1zVXE2Nng3RlVWeTFzQ3VXUEpLL2tWSVRlQjk0VjNnTzJj?=
 =?utf-8?B?M25RR09qbThhSG4wMzN3eGVPUGhjSkRrSS9DMk5YR0NEMlhlR0lQNGFVK2JG?=
 =?utf-8?B?L0ZUeUlpalc5dXpTQks2MGFwK2ltZHJRQzFOMDVIOU5WTmJtZmpXOWNHNEZZ?=
 =?utf-8?B?UDNONS9oZzE5NWNOd1Z6cThtZlBLWTJFNy95ZXNrdU9ETE5hS3ZEeDNsVWpF?=
 =?utf-8?B?eHBCSUp3ME9zTzVxSWZFOEdQSExWSCt6ckpieGI4cEVHVGcvelgzMEJaWUFF?=
 =?utf-8?B?TmZBOExndFhqa2IvdjdFd2twSEJMdEZrVmJ6NnEzeDVFS3hvSC83UnNWVFN2?=
 =?utf-8?B?MGxrTGRLYThBMzNJZUhkL3N6QzFlM3FIK3lBZ3dpTFlTejVYZFI5VUM5TVlH?=
 =?utf-8?B?dzNpMHg5YzRjcStDS0RXRFdDS1c2WTBVbTFycE14UUhMVXJLMjRxbk5Fbjgx?=
 =?utf-8?B?bmFYQVpubm56NmllM3YvWUtaQUZCOGxCQ09CaUxaMUNuNmRhUlJrTGVGalgv?=
 =?utf-8?B?OFQ0V25iR25FaDNMZEVWcGRtK0IwdHJNdUduWkVISFpCOEF3T2lMdG4ydXJ1?=
 =?utf-8?B?SzhnUGF6a3E0a1VPMzlxbkdLelNLN2lWWllsU3RQTHd2ZXA4bXY4WTBpK2pY?=
 =?utf-8?B?c0lQSHNNeGRKelpJb2VLSW9nTVowcGxLc050WC9DbGFCd0NsZmtabm5kOUVT?=
 =?utf-8?B?OE9yWTBWMTZsT0FnYnUxaWZoSzQ0MFI5eVlGeTZQa2M5WWgwMlFOWmdVZGJN?=
 =?utf-8?B?VERBeHFQdzNhaSt2Q0w4LzlrcnQwZUJOSHI3aVFIR0lFb2FkdlNTNmt1ejhC?=
 =?utf-8?B?MzdlR3Vyeit6bktIc3hqeE01SHoyZ3FVY3NhVGZmMjhZbFd5U0R6b0x4VjA1?=
 =?utf-8?Q?pcGlQr4IdN24uuQgNDZv35kFt?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 102e2c72-33e9-449a-0cf7-08dd7be29876
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7955.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2025 05:58:51.0734 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FJ2r4Do2XXmldBp+NEmCOjbOqV0HXGTV6x6Z9rLvr8m/rQplRGwiA7j2gB8JmAo9z0ISnwHLEl/72Afu7q/6Pg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4853
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



On 4/15/2025 1:53 AM, Michal Wajdeczko wrote:
> We are enabling/disabling engine activity on per-GT basis, so any
> errors should be also reported per GT, like:
> 
>   [ ] xe 0000:00:02.0: [drm] GT0: PF: Failed to enable engine activity function stats (-ENOSPC)
>   [ ] xe 0000:00:02.0: [drm] GT1: PF: Failed to enable engine activity function stats (-ENOSPC)
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Looks good to me
Reviewed-by: Riana Tauro <riana.tauro@intel.com>> Cc: Umesh Nerlige 
Ramappa <umesh.nerlige.ramappa@intel.com>
> Cc: Riana Tauro <riana.tauro@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_pci_sriov.c | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pci_sriov.c b/drivers/gpu/drm/xe/xe_pci_sriov.c
> index d69b6b2a3061..8813efdcafbb 100644
> --- a/drivers/gpu/drm/xe/xe_pci_sriov.c
> +++ b/drivers/gpu/drm/xe/xe_pci_sriov.c
> @@ -7,6 +7,7 @@
>   #include "xe_device.h"
>   #include "xe_gt_sriov_pf_config.h"
>   #include "xe_gt_sriov_pf_control.h"
> +#include "xe_gt_sriov_printk.h"
>   #include "xe_guc_engine_activity.h"
>   #include "xe_pci_sriov.h"
>   #include "xe_pm.h"
> @@ -121,8 +122,8 @@ static void pf_engine_activity_stats(struct xe_device *xe, unsigned int num_vfs,
>   	for_each_gt(gt, xe, id) {
>   		ret = xe_guc_engine_activity_function_stats(&gt->uc.guc, num_vfs, enable);
>   		if (ret)
> -			xe_sriov_info(xe, "Failed to %s engine activity function stats (%pe)\n",
> -				      str_enable_disable(enable), ERR_PTR(ret));
> +			xe_gt_sriov_info(gt, "Failed to %s engine activity function stats (%pe)\n",
> +					 str_enable_disable(enable), ERR_PTR(ret));
>   	}
>   }
>   

