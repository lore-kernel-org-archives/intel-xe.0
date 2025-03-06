Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1CCCC282EC
	for <intel-xe@archiver.kernel.org>; Thu,  6 Mar 2025 23:16:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96E0210EAA6;
	Thu,  6 Mar 2025 23:16:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GpYt2i8Q";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C59810EAA6
 for <intel-xe@lists.freedesktop.org>; Thu,  6 Mar 2025 23:16:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741303012; x=1772839012;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=AArQghRq0UveyAwIKkjUkts6h5oZZEieaA46gd8VBtQ=;
 b=GpYt2i8Q9aUW/V2YuNSwlZ2ID15yyk7Qo4zy6eWicw436e2o44iNXZdj
 IBvzbqd5Z+DLqg3VbXXlPbN1Pwp3iQwU1hO0q6x+sCzRJNqMyChAMjbf/
 FhmnLJMPO14t/+5RcO1IK1ag7TWOwz1FrAkC9i2StHPCxrnRi1iJwZWlD
 SmRQgdDxSdnsukkwVNPGHdri+K29CPEbzM1I7h5JcOfHNDs9MkA4AZFSb
 KPDFEWJgrrLD6HDEyEI3S4Qie+81ymHVQ+LnQATBhjEBO2oXGpDS+AyZH
 bnW0xJK9SGP9ZZUxkUibQFHziP4u9fyakxMCz85jG4X3mUaqY9qZZVct/ g==;
X-CSE-ConnectionGUID: 8D1Qfr++Q0q42eG1Od3pLg==
X-CSE-MsgGUID: OjQXmc8tTlGCG1Zoxwe/kw==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="46120073"
X-IronPort-AV: E=Sophos;i="6.14,227,1736841600"; d="scan'208";a="46120073"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2025 15:16:52 -0800
X-CSE-ConnectionGUID: K/ZMFMx4Qr2PHCYdAZfccw==
X-CSE-MsgGUID: vgFPUDAGTQimz2GjLlCMKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,227,1736841600"; d="scan'208";a="149957605"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2025 15:16:52 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 6 Mar 2025 15:16:51 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 6 Mar 2025 15:16:51 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.45) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 6 Mar 2025 15:16:50 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ccorXYuHUbNFdBvf2OIGgVeORHgvfg2OoExnd8zndIM24lEmO6m7y9HENTGyHEuc6pygWgXbwxRi+Pca10qUps8/+8yjd+48Sm7wJSlsWTxXWHaFhu9Z5MCjPd3Y/oiBk1m8tz0zkiPvINh4+h1ZU+49JXm+LcYdxtzUbdANbOTReuO4rGDmBI1ba1E8kPBQJiFkL0iPHgVXqxgEuaHxSrZV/mcml/59AkjpVVck77BZt4k6SAOzssx6kTiHoRnOgQnhNOqxEts5S5HZ4IrrhQV69qJCJOKol+vcPhGwPvc/yPqc6N1bGE33hVRwaUaeB0v7GTg1TroFFkBaj0bfWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HV3tgEOqhPoeAaMhvgWDs1J7ZmlWAkRJtKPkxvZlbuM=;
 b=he0+2E9+6g52o084/yGZ6aymoweFSik5gwY4KL7vJA3IoCF2Z+fEeTjaFhtjeb9vk4hrrj/AOVWGyadWbSvRYRJymYoQefEiX3NPaFHMa24qTo16JrKMmrILxhrwICJYXg2+6+wOO5j4X++46XvTPuV+JUeGvtveRZ66ZU16/Ug08RQ2DbnKkI8uijLct5Woi8a4zZRbzHN0xU56BA4LhXEAblfoyvmymPW5bScExLX7QO8zYBHajptH8LO91+1LM9pP1khHWjzJ9FYE6sw/K05r44uqDWKP8uKtSL6FQiaSfGOgvdgvdAV/ahnxBxhYZiHhY8SZ8IXTTk1SQ8Yi+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB7757.namprd11.prod.outlook.com (2603:10b6:8:103::22)
 by SJ2PR11MB7501.namprd11.prod.outlook.com (2603:10b6:a03:4d2::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.19; Thu, 6 Mar
 2025 23:16:34 +0000
Received: from DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::60c9:10e5:60f0:13a1]) by DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::60c9:10e5:60f0:13a1%5]) with mapi id 15.20.8511.017; Thu, 6 Mar 2025
 23:16:34 +0000
Message-ID: <6ff3192f-bde5-4fea-b992-c7df2c0117c4@intel.com>
Date: Thu, 6 Mar 2025 15:16:33 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Apply Wa_16023105232
To: Lucas De Marchi <lucas.demarchi@intel.com>, Daniele Ceraolo Spurio
 <daniele.ceraolospurio@intel.com>
CC: <intel-xe@lists.freedesktop.org>
References: <20250226032934.1789134-1-vinay.belgaumkar@intel.com>
 <7c70d716-0d1c-4797-bf6e-65f00acf6c6f@intel.com>
 <bo6avog2wss6bmme74jlkzittwormczq3iruqj7xv27jrgtnha@qxakweupxmun>
Content-Language: en-US
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
In-Reply-To: <bo6avog2wss6bmme74jlkzittwormczq3iruqj7xv27jrgtnha@qxakweupxmun>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0035.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::10) To DM4PR11MB7757.namprd11.prod.outlook.com
 (2603:10b6:8:103::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB7757:EE_|SJ2PR11MB7501:EE_
X-MS-Office365-Filtering-Correlation-Id: c1678aec-4ac7-4e12-83a6-08dd5d04efe8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TE5Gd1FJb284QzU1Y0V2ajVRVTVRT3ptY2ZMdWpBNXY3NHBGd2luQ0swd1pv?=
 =?utf-8?B?Q3FZTFp2TE5McHFsZ1pqUnVRU2szZXhOT1VFT3JBbXc3K2dJOXRXTk0wTzdZ?=
 =?utf-8?B?b3poNzFFRmNPS2RTdkxBVlNHOC9VYVBibGJuSDZxdkRNWk1Wd29vaFlJZzZ3?=
 =?utf-8?B?R0FlSmZpRVRzQ3M0SjdOMGxzcExwUW55RW1jZGF5d1VjeUFMZnBTeXZSNzcz?=
 =?utf-8?B?QU1LSElpMXJCTW1CQUpvTGVFNGRPemtZRWpIbmNXSWJ2c0Q4NFNkcURGa2tP?=
 =?utf-8?B?UGRRU1ptYitIN0gxMGUxRE8ydGk1NWloR1ByR1lyMUMxY1N0a3UvdlJzVCtT?=
 =?utf-8?B?NzJuaWFTNDVtRG5QK1NpT1R6T2dhb1VVOEc1M2h5Qlh5YzdnZDBxVnhGUnYx?=
 =?utf-8?B?V3VlMmhuUzdoT2RMMXZsWEZpbkVNckxtUllycWlKWVN3U20wVGw5QmtpODlh?=
 =?utf-8?B?M2k1aHZ1UWlJMGN6QklnMElrS0tOcjdNYUxYcWdYT01lc3g0V2V0SUZhNEJy?=
 =?utf-8?B?Tk1nU0ZRSmdST0RyTmpwZmdpckpjaXdwWDVRUjkxZFpBNm9FUlFJR1hIeTZG?=
 =?utf-8?B?UUlZb0dsSG9ISmZIYm83eE80ZndJSmsvSFBmQnFYY1lPeS9vQVkzcmJIazZy?=
 =?utf-8?B?akorbmNacXMzTGVILzI4ejRkQVd3QkVVNkZkMnBPU2ViRW9qd1hQa3p5R0Vl?=
 =?utf-8?B?emVYSHpDclhvU0NJaVBKQXdYK3dtM3JqSzByWjlOVXAvajNQbStXczhRSGhV?=
 =?utf-8?B?MXlTVGR4T2RvaUhxQks1dk44ekhvR0VIY3NTK3I2Zk83bUUvQWJ2eTVnaTdM?=
 =?utf-8?B?Zld2WHVWNE5Ta0dBTjh1TlBHc2o0QWZ4TERBMzYzVVFUd0ErYjQ1S3N3N3FM?=
 =?utf-8?B?L0hVcFgveHcvczF1emcwbzkzdStFMnZ3MHZRTWx3dzRLZFhCTUNmVWxNd2Zn?=
 =?utf-8?B?d3ZMbFVRbU1PcVMvZm9TMTVRUFpYN1VYVnViT1FWWmNVQ1ZSS0FKeGhpV1Ru?=
 =?utf-8?B?eVV3a1NUOXlSV2UyY0ZqRUs2clRJUW5IQ3BCQ0tGRE5FSUVWQmRHdFRqcmpF?=
 =?utf-8?B?VkRQb0NSZ2duR0J0K3NHZzg0ZEVRQU1YbmhITjdNSHh3VUtPUWE2QjlOeHBq?=
 =?utf-8?B?WHlJSEZFWUxLZTdhRzVhM1JQYXFoeHNIQ3BFV0F2c0ptWmh0aFcwMitBYTdW?=
 =?utf-8?B?Qy9TZDl2TVBlZzBmZlNlVUxGUEJWOFdhdEtTNDVXWm5NWG4wWUVPbi9Jck1m?=
 =?utf-8?B?Q0pmWFFUbGdGbkpSODlHdHJDbTJYNWRSeTBZZGF3cXl4cmVSdGJKSUNIR01V?=
 =?utf-8?B?eGlrelltVzF1aXlkckxEbHdZc2NVb2JhV1kwU0EyV1kwRjFtTDdNWFBReElY?=
 =?utf-8?B?d3hUeDQ5SEUrQW1EdWc1QzE3U1Bnb092YzJpc2NmZ3crSUNtWTRvNXc5YmJZ?=
 =?utf-8?B?VUg5czZLMW95OTdUVk5Wb21kaGlNLzJxZFJtU3VpeWpubUoxWi94eGVNRTRh?=
 =?utf-8?B?eTBnUTArbEgzcldGaGV6ZStmb3ZUSU9nOTcrWHlaTWh2Q2JFLzI1RHZQY0l3?=
 =?utf-8?B?eFR2WjR6TDROb0ljSERuRFIxYU5mVThQUzREeXU1cHVqakFIaTJsNmw0N2Zq?=
 =?utf-8?B?bGo3eTV5QS9BZEZiV2dUUTUxYnp4cm1ZQjNWd3MrcjFTZHRQVTFtVmNsMXQ4?=
 =?utf-8?B?WVVpYXNHMVVidlBWelFxcjdPNjBxbTVJOGxpOTlwcWxmYkp2Uk9yWXRIcDlY?=
 =?utf-8?B?amNSODhHY3ZRZ3NlL1F0dUk3WTcyOG5ld1lzSVB0eWVhVlB0aGUySWxrNC9H?=
 =?utf-8?B?SzZCTXNiWlBXNUpzSTZEZ1EwVDlkdi94RENDQVpPby9RTjBraUFDNnZzcUts?=
 =?utf-8?Q?472gg/GZkFYcK?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB7757.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bUFqS0lBUVZNem9CWE1NdTgzOXJrM3pPNFBBRlYyKzRqVitubURBaFdycEw4?=
 =?utf-8?B?M3RYZDJlS0h3SHVlVXF4WXk4clltRkNCS1IyZ2xjVnJWWTIzdnc5dFpGQTVV?=
 =?utf-8?B?NTdYaWp3TVdDa29MVTBwRFMrV0JnZ1VlTEh0ZEJzZncxOVJ0U2d1U0lIUzk4?=
 =?utf-8?B?eVo0dS84WEVzblU3NkpxZlZzdkc1YlJBNU81bGpESUJFQ09VbnNFZHJ6MjNQ?=
 =?utf-8?B?V0gyVHRuUTVhdVRPNVBHa1ZjMHZpL0VlTFJLdTlKYlNlY25oN2M4cTRIdmNK?=
 =?utf-8?B?WEJPSW43cG9QV1BscUpuQjJ3QUdQQ3ljNnVSaHhwdWlEWkUxTSthWW8yRTNm?=
 =?utf-8?B?ZldDUCtnWjZJRXR2NWMrN2h3VjZzOU92cVVFL1A0VENqQno2WkR1ZjgwcVJq?=
 =?utf-8?B?L1dWeGJlV1NSS3poVUUxdkJ6ZGJZRW5TVk9HYXVyanRhejY3d3ZFVW1yTmtT?=
 =?utf-8?B?cFhBTFViVTlrbHBJSGw3bUtPbWwwVDZ3aW9nRGs1bG15WFdCYzVGZzU5cWt5?=
 =?utf-8?B?YXd1SGUzVGh3b2pINzU1cWxaRklzTzRFUjllYmlyWDNKWTFTbHZjdW1kN1Ry?=
 =?utf-8?B?SlBKTlNYOGhWTloyTnpqMm5XRmV4YjJLeTFiajRDV3NXdTY3bjJsZk1uVFgz?=
 =?utf-8?B?MHFHZlRENm8zVW5CNjR6TTVaMCtqRGoxOTl2QUdycE1aQm41U2w2cHVuR2Y3?=
 =?utf-8?B?MXhLdVZmMDlSdEZDUmxhNks5R083bUptdlJ0ZXlNSlRQM3BMSTNKTHUyclBY?=
 =?utf-8?B?dUlhKzVSVlIvTm14ekpyTFJVRDRVNW02a3hBeHhieTk5RzhqTk5XSG9Gc2Ny?=
 =?utf-8?B?dHo1UkxTTkRzQnJzZk9NQnlEajdiVEw5VmdlVFJldXhHNHpUdGNUK1QyUlRr?=
 =?utf-8?B?WWQySlNJSjVZbTJkMGtrQ1N1aTlQV2FobTRxSXl5cnY5MUh2TStMQSsxSkg4?=
 =?utf-8?B?ZU9Idm5tTzBQemNxKzhYZzYyRkE5RHVOWGF5UHlDc1JxZGxld1I0T1BTdG95?=
 =?utf-8?B?VkZTY2VrTjlubUJ6WDlhSUxZenVMKzRBblk5QjYzcm92dXpyaUVEL2txR0lZ?=
 =?utf-8?B?T014cVRreGV5ZW11eDlHWTF5T0NYSFdISkhhVnh2dTFtTy8vVUNCWW53OHZq?=
 =?utf-8?B?YWtnRmZpc0xyOXRsMmtreGVwTmVVS2VhR0V6L2h1eHF5S1orWFl3eWwyOWJG?=
 =?utf-8?B?azYvSE1Pai9tRXQ5QytzVXU2SzhnNWg0Tzh2RmF2ZGwzTmo5b2NWSWpkYWJU?=
 =?utf-8?B?RWdxUTcyemYxT1dLeUZGTTg0ZW9oV0hONnlHd0lWa1RaSktxLytiRUVNU05v?=
 =?utf-8?B?a0JScm5xcEFWdVZmMVUyeFBaRi9hSmx2S2FXZjhaL2FsOGQrTmdoZU1CY2xZ?=
 =?utf-8?B?Rm5KeloydzJjeFFDMHExVzVNeWhrU1RtVDI1KzFkMlZGT2VtN3VXaStyaC9O?=
 =?utf-8?B?TkhURWtXZ0szUDRhRnpQTHcraUQ0MnBCamFSL2J4YlNWc0dVY0pvWHRNOGpt?=
 =?utf-8?B?Ri8yQzZQUjBxUW1oUExURDFEbTc0ZlIxd01CbnZ0MXlMVExHWkxGeVZqamhk?=
 =?utf-8?B?WDh0THVSZzU3MktiZzRUeStkTEZDbzd4MmN4WGpXRm5UcHZLYlN5Mzg0dGdi?=
 =?utf-8?B?ejh3clk1WUFoem15bzJtL1o2bmFJYzRvMzNET0cwaXNlZWRCcWNyVXdiajBy?=
 =?utf-8?B?Y3B4SVllQk40MmFDeExYMU05bWs4U3VrT3ZqS1NOc1gxZU16enJLMlFYcGN1?=
 =?utf-8?B?MjRMZzVlTk90Zk44ZnZEMi9RN1BrZ0owTkJhb2xUR01XbkpTYThFcktxOUhE?=
 =?utf-8?B?ZzBPOXdhdjA4em8xVEpja3RGVDZMTTR4Nm9pOFJqMUxkQmJWeDNjelo4aFNT?=
 =?utf-8?B?bS9RMTN6bGFtSkMzVkloc3Z5QWh4SEgzK3hLVHRpbFJDUmRwa0V2YTFIKy9l?=
 =?utf-8?B?ZmxZTUFjU0ZqVW5NWTRBRTZoWUxKSGJyTlJvak52SWo2TFE2M2FnMlBIMmxp?=
 =?utf-8?B?dXlhT01vQzIyWmd4WVRuMmhYTnEwKzd5elJpQkxFZlRTRjZaOXZRKzZsQWRt?=
 =?utf-8?B?QUF6L3dkZnVxSERCcTM1MmRHSENLcEZQb1dSYmdTODZQcVQ0TmQ4UWpiR1g0?=
 =?utf-8?B?a0RJQnNURjQvQmtWTlQyU3lmSGd1c09yZDh0WGhvd0FxS1pXS2FzWitoQVNC?=
 =?utf-8?B?NUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c1678aec-4ac7-4e12-83a6-08dd5d04efe8
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7757.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2025 23:16:34.4013 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ncB/V1Fp30VTCPlbslP5qs7hzBf3SAp4xhLoS4yBC25OLHZA/DWcaNf9nMgJ8dfYMUZ5akhbo3edTmJ+PBp8dQ7sNrHjPNusnbIlBCyOfoM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7501
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


On 3/6/2025 1:34 PM, Lucas De Marchi wrote:
> On Wed, Mar 05, 2025 at 05:50:48PM -0800, Daniele Ceraolo Spurio wrote:
>>
>>
>> On 2/25/2025 7:29 PM, Vinay Belgaumkar wrote:
>>> +        { XE_RTP_NAME("Disable DOP clk gating"),
>>> +          XE_RTP_RULES(MEDIA_VERSION_RANGE(1301, 3000),
>>> +                   GRAPHICS_VERSION_RANGE(2001, 3001)),
>>
>> XE_RTP_RULES() does an AND of the rules, while here it looks like you 
>> want an OR. Maybe use FUNC() helper?
>
> A "OR rule" is also allowed. See:

Will use OR in that case.

Thanks,

Vinay.

>
>     { XE_RTP_NAME("14020756599"),
>           XE_RTP_RULES(GRAPHICS_VERSION(2004), ENGINE_CLASS(RENDER), 
> OR, MEDIA_VERSION_ANY_GT(2000), ENGINE_CLASS(RENDER)),
> Lucas De Marchi
