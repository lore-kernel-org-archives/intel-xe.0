Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AD8BC77B7C
	for <intel-xe@archiver.kernel.org>; Tue, 24 Jun 2025 13:03:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1C1210E599;
	Tue, 24 Jun 2025 13:03:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kHWhhc7s";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDB6610E599
 for <intel-xe@lists.freedesktop.org>; Tue, 24 Jun 2025 13:03:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750770203; x=1782306203;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=3/fO2oZAJ/bYWYiLyquWWG0R1yj+8rLtarvuLz8vt1o=;
 b=kHWhhc7spgwDYOagaTe3L0CrwqB5lbXGwNBeJDccJdN/Il+ZNL1ryq0n
 4NnmCur0L5TC778ejKKxAValC/pkDNuFp0OlXD3C+nLFCdmORkWOhyRdv
 vofx70xhVCM85sqZWoEYuWGq+bN3nS7vmV1bnSQi4e/4GpdnmxjifHp3Y
 LH1Dt4lqCWrlS8abPqRa7iPhsUTvXxEKUrXvoKgUJHwPxgPorrrC857IN
 92NwO5LDVzrfWYDLKNVtArRV8pGU0M7MVHH1SrwYAHpnI/podYTdh36WA
 tNJnXfiYxoMHrtCfm/HEHaw8V7VMP0EEEV5nrfObLDdOH67s9z9lKb8Hv g==;
X-CSE-ConnectionGUID: 6n9BmTKrSjabcJi/s9ndXg==
X-CSE-MsgGUID: pR9y/1jMQDCiJYwX0mpyCw==
X-IronPort-AV: E=McAfee;i="6800,10657,11474"; a="56791657"
X-IronPort-AV: E=Sophos;i="6.16,261,1744095600"; d="scan'208";a="56791657"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2025 06:03:22 -0700
X-CSE-ConnectionGUID: z5pXIN27SLSAPOh3OktgRg==
X-CSE-MsgGUID: Sz9CAsmRTi65anXubkV1Vw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,261,1744095600"; d="scan'208";a="152201967"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2025 06:03:22 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 24 Jun 2025 06:03:16 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 24 Jun 2025 06:03:16 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.60) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 24 Jun 2025 06:02:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PBnvvJhz8bXxcTqqdDCpZ9O/FNP3Bdec+IXZXlRuw5jPvhw0HTAIUKGe0Si+GcFoVNTLDt76ESim+Lo8/N8kVdY3xc+D3//ECdvHxqzlq1TJKDnQHU5N9OePnyk6dU3st5ftW992vW1L4InsEg97+fObZwCoDbunQ5F1HAlu4dShbKqkE5dgsxuezN18ZBIxl1tDHzXGkEnNU1kpa+1bLbdq1l+HWBd8u3sDqELjfiyTs2DGREzNIqSrSXlTjsdyVBIxPQkghZcyE3nRGY9fU3kv2YtMqjSR9dmkgCzGDVEL8sgZUWiGHoGcxXfa7UdfTfIqWp2lf4bjA03lSQvDRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SQVhMEV6ELaQRENbS3aByEZIE2m1LxLMglZhBZWddl8=;
 b=Cx48LBZZfYRZB4RdsYfJwpA9o3ksu/gT0osZpXFF8axln8S+oJnUHoRuj1gQnWh8rxwkxEfWFZ9hbtB1O3yqyGzgAU4KmSMNLEemTP6RjjMjWsfXBK4+G1nbElWDVO0OynMY4fdlT8RrtiqGT/uNjJ+NRcKFduhwwIOuSNOsdKC5UDcpyNEw/B49FLbFyWJVUBg35KlgBr9rn2WflMn2FlqZyiI6MtxBrdJftRK2WM/N877H+i1fKyk3EfnempEWv5nRZWYE3ttQQN6T7T7OmCcHer1ZeEGYagQvO5bOkkzPGSzE9Vh4Sf8JkLyEt6+AQUu56oTemg5wswI8UotHHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5249.namprd11.prod.outlook.com (2603:10b6:610:e0::17)
 by CH3PR11MB7896.namprd11.prod.outlook.com (2603:10b6:610:131::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.28; Tue, 24 Jun
 2025 13:01:55 +0000
Received: from CH0PR11MB5249.namprd11.prod.outlook.com
 ([fe80::a665:5444:d558:23c3]) by CH0PR11MB5249.namprd11.prod.outlook.com
 ([fe80::a665:5444:d558:23c3%5]) with mapi id 15.20.8880.015; Tue, 24 Jun 2025
 13:01:54 +0000
Message-ID: <e74166fe-c293-4158-a596-6386ab95ca64@intel.com>
Date: Tue, 24 Jun 2025 18:31:47 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/2] drm/xe/xe_debugfs: Exposure of G-State and pcie
 link state residency counters through debugfs
Content-Language: en-GB
To: Soham Purkait <soham.purkait@intel.com>, <intel-xe@lists.freedesktop.org>, 
 <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>,
 <riana.tauro@intel.com>, <jonathan.cavitt@intel.com>
CC: <lucas.demarchi@intel.com>, <ashutosh.dixit@intel.com>,
 <jani.nikula@intel.com>
References: <20250620120356.3289744-1-soham.purkait@intel.com>
 <20250620120356.3289744-3-soham.purkait@intel.com>
From: "Poosa, Karthik" <karthik.poosa@intel.com>
In-Reply-To: <20250620120356.3289744-3-soham.purkait@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0097.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:af::14) To CH0PR11MB5249.namprd11.prod.outlook.com
 (2603:10b6:610:e0::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5249:EE_|CH3PR11MB7896:EE_
X-MS-Office365-Filtering-Correlation-Id: 5bd3cacf-2245-451d-87e7-08ddb31f4b2e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SkVvSzZaU1Q5aEZQeS9YNmRqeHhPK25Fc05EekpxdXBQUHlualcySWZQT0lQ?=
 =?utf-8?B?SXVTZ0d2d2xjM09rY0t1Uyt1NXl0NWdyeTd4Z1FmM256aHRKQnkzSHpCNEo4?=
 =?utf-8?B?L3NOaUFaRjVRWGtjbllHdWZKQW5vTktPckJWRDlZM2lTcWI4VG5US0lCNFZ2?=
 =?utf-8?B?dTZqUXZvU3BMcVFxa2pCNGdGRDFjL3JGRTRXUzdnMzVOTGxnejBTR1REQjFE?=
 =?utf-8?B?NEcwQnlnTWJKMFJCdmR5RVl2SWFLL0s0cHNpSGhQZXFTa3pUMjdlQjZQY040?=
 =?utf-8?B?RFQvZUlsNGYybGR5MlA3Z25ESjlTTnF5ejVDZWNUb2JuWGxjS2VVZGRXcVpQ?=
 =?utf-8?B?aWZDVjNUVWswUXhGRFhiZXc1Y2xSYUMxMndqenpjRy81L1FiS2g0NVZNVU1r?=
 =?utf-8?B?VFBBVkNUeGwwUG1HbzVvS1hLV3ZSUUdnVmVmditkWHhHTWE2UVN1VjlqVjk0?=
 =?utf-8?B?R1pZMEN1cUtoSUIwY1dycElVYnEyb1VjR0g3YXdmeUd3OTZkdnlnaUs0TW00?=
 =?utf-8?B?VXpzbk15NXhCZFF2NFA5aUQ2YW51NEo5RW00SS9hL2ltN0o3TW9xRXhUbzNR?=
 =?utf-8?B?Vmd4SmRJNzRKREoySm5LUzhHVWhIYW95aHVGQ1JUajduQUl6Q201a1d2Wk1r?=
 =?utf-8?B?cFNBZGVFOUtKczVlVHU3cUpBalNlK0lTS3dubmlTZnk1Y0dBMEVVeG9RYU1W?=
 =?utf-8?B?dmNTYXh5SnVrKzQxNnNrOCtrMUhVT3dWZC9xeW5aNEZwRktxSlBVdGZDZm9G?=
 =?utf-8?B?dHZaQ3dkc0luMjExc3p5VHpxbVJHeWFNZVVtRkw2WUV0RXdNUHRJZitrdytB?=
 =?utf-8?B?RU9CeXVDNTFEZnVRYlpLV3h1Z0lERUU4eWZ3T2ZaOTJvUU94c2wwcEgrK1Ax?=
 =?utf-8?B?U1c4UHpzQVRLbHJ1RDJRQTZ2MndWWHZScDEvUExKY2ViSlo0dTM3MTg2ZU1s?=
 =?utf-8?B?ZjNUV3dDcGNmZXcrd3V1TTA3RTdnK1p3VENxR1ZyejU2UFdvYXhTMm8ySkJC?=
 =?utf-8?B?Y2hCeWcyYVdNQkdiVmk2aWEzc3I5MGgyenBzV2VlU0hkMGpGU1E2T3NHcjU3?=
 =?utf-8?B?V0pESXVhejAxeW1QSE1PeDZCY24zTURnZUFheFZLZ0c1N3prdlZSYm51T1k0?=
 =?utf-8?B?ZTl4VXp0eXFGVVpEZGtlb3RrQzVEK1FIelRpcVVyTDh5QmIxSlBoUE5GczZr?=
 =?utf-8?B?L2JlanhnK2VQQjczWmJaRGNLWllMSWdEWVorQVFvVWRZa2hmT0NydWNqZ2Vu?=
 =?utf-8?B?ZmlFWENKNkRxdERYdFJWSElVWitWbGVKYkVwMW8rK3FZYVdkZnV5R0J6eVZp?=
 =?utf-8?B?S3NBMDVvWDVsWkFaN3AwVUc3eFd3L0g1ZitOQlpLVFNTLzhMK1MwbldQeE4v?=
 =?utf-8?B?V09iS1E3SGNUWkQzTDlyQUhVbkNGaEczL1JmRVpOeGVOOWs2UlRESWpESFRF?=
 =?utf-8?B?MlhFSEZibktrQnNGcXpKSDRWRzQya1ZldzNnRG1vQm93aWNXWDl5QjhIMVRn?=
 =?utf-8?B?cGt2VUtKVWJ6YjRjNEdxbEZpS2xEUmc4c3FPYWN5TEw1Szg1WTNUdi9ZaGZC?=
 =?utf-8?B?Z3kyc21jYmFONjhVeGdFMHdTQk5rcFJwbDh5ZDlxTmloMnFyMFJCQzZicUFZ?=
 =?utf-8?B?TVVQSU5jZ1JBNmkrTWRjbVgzcHBVMHRNNjk1TEtxMXRvSWpKd29xNEZYK0Jp?=
 =?utf-8?B?RThTaW5pT3RLYzZ0ekdMQXVURmxXTGp6RjJwMUh6bFNnWmFiMUQ2TFdZTVAw?=
 =?utf-8?B?LzN1YVc1Rkh2S3Q1akFzZVcxcDl2clZCSTE1Y1FIbHByTlIwUmhIeDlHRGND?=
 =?utf-8?B?ODhzU2dGbUVqU0NnMnN2Z2didmFFYzVneUhqNmtsR0t3OXlyQVVtdU56Q1V6?=
 =?utf-8?B?SS84MEJaZkVpN3NpZVREWngwTmVvdmEwamQwaHppNzJCR0NxMTh3VHRMcUhi?=
 =?utf-8?Q?rAplkQOSr08=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5249.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RVVudFBxWEVsQm9xRzVQZDE5VHl0SEpUOXREWnVjTUxCTFpVY01vQ1gxUkxN?=
 =?utf-8?B?MnFSV1pVMkMrRU4vT0FrL0YxSGkzYk44ZGgzQzFmKzBGQlpKWFNDeGFzMmQ3?=
 =?utf-8?B?ODRJK2RkdFRIU09HU3AwRTRnK01qWkZOWVBFbm0xTEJucnJDMVRra3FsSm90?=
 =?utf-8?B?TkQ5cUpMVjhZTFd5WERKT2p1NzcvMmNEcnowSzUydkRPUUFKVG9WcXZsdkg0?=
 =?utf-8?B?R1YyQ1ZiOGJQZUt1M01uOWNJcnkwY2Jqa3QxN21vUC9EQXRRcW1WYUtqRERM?=
 =?utf-8?B?WEZCUjdaVXZtaHJGVzc0YWtSWEREVVgwVE5meXJnS04wWHd6UHZtQUNETFhw?=
 =?utf-8?B?UkFNWjRQV3JzQ1IxdEdscXNzUHp3WGdkcHU4ZmF2TjgzaGZuZllxR3JpZ3Vz?=
 =?utf-8?B?N0ZLcVRZdisrQ1pWcVlJamtqSmFlR21sMDJCU1krYjFVS3c2M1l6UHpXSURp?=
 =?utf-8?B?cUFBOWNSY3NJTUJsTCtFT2tSdTk0Tk9SeXEyVzdNcUNCYXc3cDlybmJnTElN?=
 =?utf-8?B?ZFBBTU1zREl0ZU1zNEpUQTJERUZ6U1pESzkwbFdnTXdCSWhpOC9PRE5IcTBB?=
 =?utf-8?B?RGRtMmM2N3JzT3VBaUtoVXh5WXJ5QkFYQlFTbE9mQ2xYYXhEM1NhZzIxQWFv?=
 =?utf-8?B?bk8zcWpzS3NUVmc4b1oya1d2eWw0eTQ3RW9PNitzTVk0akQ0My9JcXdqb2g0?=
 =?utf-8?B?KzZXemJWVFByRm82VEU3WkV6MUFvbWlWYU8xZXlPMHBPTWFXdlFxSmNySnRT?=
 =?utf-8?B?U0dVN0pTR1JPa1dWRHRaa3Mxc200NGF6VFpqMTk1MXY4OXVhcU95QnlScGFO?=
 =?utf-8?B?WGlwa0NWV0x3T0Jndks0VkxpbGlvZmZleEpjV1gvUFZoc1VoNUNoL0RHenRC?=
 =?utf-8?B?N2thaHJSMzBrN0hSOXlMcXBuM3MydjNoRGdHblU4NHhpZDNxVjQvLzMvR2Zp?=
 =?utf-8?B?Szh5VFZITWNrOWtrVy9IeG51bXhrNlYrbEhoR1lKM1lqWXBzNm5USjhuUVI5?=
 =?utf-8?B?bW01VStpNlNNWEVpT1I4YlZwd2FwTjdmZHp2UmtsMmdHT1RnRHpPNkVqd1BT?=
 =?utf-8?B?cHNROXBob1VtS2JVUCtjaVM0SkRqbmVnYzZPbTdtVFBHcnRpaFUvSDJLeWRD?=
 =?utf-8?B?MGtzbFBlZzNJUGJsb20zQm52ZFpLaXpPV1RMckE5Q2t3MjlraVB0V3MzL0Rt?=
 =?utf-8?B?akVma2hSMHJyYzNxVFczRzlnNkhWVmMvbjFDOVZwY1VqRitjSEZ4UnJrRERn?=
 =?utf-8?B?cXdsT3I1OVp2VlBRK2NWdVc0cjBQL2F0YWdIUUlKeVJLcStiNll5eUsyWFdq?=
 =?utf-8?B?MUJTRldkdWhkZFovUFBEd0lVV0Y5Y0hnTlRqYm9aVHp5c1dLQys0TkVLQU5z?=
 =?utf-8?B?UFlhcEllRk9KME51QjZNUnpZMGhRREFCcGNnSmpJN1JhRndQdnBLV2dEc3pS?=
 =?utf-8?B?NnR4R1NqTkNLZTA3SDkrSXE2dEVjTW43ZkVmaTJManBncEJTNlJMbVFRQUpn?=
 =?utf-8?B?ZXU1VENJZzA4b1dkUlNMclM3RDYvZXpPdlE3VWtrejJwMUhvemhzNit5QkNO?=
 =?utf-8?B?VHFuamJQaU1HdEJLMkNVSzY4ZGFOMnprblFYR1hHSzhCaUM3WldlQ2t3citZ?=
 =?utf-8?B?N3FRaENSNkFuTHozNGlRMlZRRWtVWVkxUnlzQW5WM29VRm5HbUJhbmxKdjFm?=
 =?utf-8?B?WVExajk2cUwwVVV1TFEyRGlTZWJKUWtZbVNDQVk4aytGU0hxbHJrK0U1SExN?=
 =?utf-8?B?RW51NTdNTmFtc2REbGVwZEIrcDl5NmQ0dG5XVzhjdjhjek1raXlKZzdlZVIv?=
 =?utf-8?B?YXQ2TDFTMWtMWktiWnBMR3dGV1g4Zlg1TU9aSHg1Z1paZ0wycVJhcDFKeTdK?=
 =?utf-8?B?NlQwVnRJVzFrb3RpYTk2YWZweXdIUHFlVjU3VWxhbzFrWmx2elZ0RjFrWXNY?=
 =?utf-8?B?UTNnWXZxWlJwcUtzZWJzRVAwMG15NENXQVA3Zjk0WGFzMk1ob3FPb3lOSmJM?=
 =?utf-8?B?WEIrZERwQTh6a1NUWFhpYURhYUU0dzg3dnU0MkViYVFXRndtQ1owamFYNkU2?=
 =?utf-8?B?Vm5WWFc3Vi8xWmw0anRNS0FLcEJUSnIxT0wyNnNzS1FkcVpwWk0wdFFYRmt6?=
 =?utf-8?B?ZkdHQTJ0SFJoSUV1R1hOSWZlWVhHZWxaajRFcE4zNVRuYW9QRXdIK3FJaTBh?=
 =?utf-8?B?OEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5bd3cacf-2245-451d-87e7-08ddb31f4b2e
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5249.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2025 13:01:54.7153 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BUA9EiElB9t4whIkF5nwRsd+mtRugTAXb1c8/NsUIHuiR5TFBIy+WyQ7H/ogP9wCrox4xgwPNRJlN2S78F8QNg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7896
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


On 20-06-2025 17:33, Soham Purkait wrote:
> Add debug nodes, "dgfx_pkg_residencies" for G-states (G2, G6, G8, G10,
> ModS) and "dgfx_pcie_link_residencies" for PCIe link states(L0, L1, L1.2)
> residency counters.
>
> V1 : Expose all G-State residency counter values under dgfx_pkg_residencies. (Anshuman)
>       Included runtime_get/put and removed drm_warn. (Riana)
>
> v2 : Moved "dgfx_pkg_residencies" from "/sys/kernel/debug/gtidle/" to "/sys/kernel/debug/".
>                                                                                   (Anshuman)
>
> v3 : Included debugfs node "dgfx_pcie_link_residencies" for pcie link state residency
>       counter values.       (Anshuman)
>
> v4 : Included check for BMG and dgfx and helper function for repetitive code.  (Riana)
>       Used drm_info_list to create the debugfs. (Karthik)
>
> v5 : Reordered commits to reflect the correct dependency hierarchy.  (Jonathan)
>       Simplification of commit message and rectified register offset. (Karthik)
>       Error handling and return before printing.			     (Riana)

Commit message should be in imperative, present tense.
Please change: Moved -> Move, Included -> Include, Reordered-> Reorder

Space is not needed after version, it should be v2:  v3: etc

Multiple changes should be prefixed with -

You can refer to other commit messages.

Example:

v3:
  - Rebase.
  - Rephrase commit message.

> Signed-off-by: Soham Purkait <soham.purkait@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_debugfs.c | 71 +++++++++++++++++++++++++++++++++
>   1 file changed, 71 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
> index d83cd6ed3fa8..9e1f753ed1df 100644
> --- a/drivers/gpu/drm/xe/xe_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_debugfs.c
> @@ -11,16 +11,19 @@
>   
>   #include <drm/drm_debugfs.h>
>   
> +#include "regs/xe_pmt.h"
>   #include "xe_bo.h"
>   #include "xe_device.h"
>   #include "xe_force_wake.h"
>   #include "xe_gt_debugfs.h"
>   #include "xe_gt_printk.h"
>   #include "xe_guc_ads.h"
> +#include "xe_mmio.h"
>   #include "xe_pm.h"
>   #include "xe_pxp_debugfs.h"
>   #include "xe_sriov.h"
>   #include "xe_step.h"
> +#include "xe_vsec.h"
>   
>   #ifdef CONFIG_DRM_XE_DEBUG
>   #include "xe_bo_evict.h"
> @@ -30,6 +33,23 @@
>   
>   DECLARE_FAULT_ATTR(gt_reset_failure);
>   
> +static void read_residency_counter(struct xe_device *xe, struct xe_mmio *mmio,
> +				   u32 offset, char *name, struct drm_printer *p)
> +{
> +	u64 residency = 0;
> +	int ret;
> +
> +	ret = xe_pmt_telem_read(to_pci_dev(xe->drm.dev),
> +				xe_mmio_read32(mmio, PUNIT_TELEMETRY_GUID),
> +				&residency, offset, sizeof(residency));
> +	if (ret != sizeof(residency)) {
> +		drm_warn(&xe->drm, "%s counter failed to read, ret %d\n", name, ret);
> +		return;
> +	}
> +
> +	drm_printf(p, "%s : %llu\n", name, residency);
> +}
> +
>   static struct xe_device *node_to_xe(struct drm_info_node *node)
>   {
>   	return to_xe_device(node->minor->dev);
> @@ -82,11 +102,57 @@ static int sriov_info(struct seq_file *m, void *data)
>   	return 0;
>   }
>   
> +static int dgfx_pkg_residencies_show(struct seq_file *m, void *data)
> +{
> +	struct xe_device *xe;
> +	struct xe_mmio *mmio;
> +	struct drm_printer p;
> +
> +	xe = node_to_xe(m->private);
> +	p = drm_seq_file_printer(m);
> +	xe_pm_runtime_get(xe);
> +	mmio = xe_root_tile_mmio(xe);
> +
> +	read_residency_counter(xe, mmio, BMG_G2_RESIDENCY_OFFSET, "Package G2", &p);
> +	read_residency_counter(xe, mmio, BMG_G6_RESIDENCY_OFFSET, "Package G6", &p);
> +	read_residency_counter(xe, mmio, BMG_G8_RESIDENCY_OFFSET, "Package G8", &p);
> +	read_residency_counter(xe, mmio, BMG_G10_RESIDENCY_OFFSET, "Package G10", &p);
> +	read_residency_counter(xe, mmio, BMG_MODS_RESIDENCY_OFFSET, "Package ModS", &p);
> +	xe_pm_runtime_put(xe);
> +	return 0;
> +}
> +
> +static int dgfx_pcie_link_residencies_show(struct seq_file *m, void *data)
> +{
> +	struct xe_device *xe;
> +	struct xe_mmio *mmio;
> +	struct drm_printer p;
> +
> +	xe = node_to_xe(m->private);
> +	p = drm_seq_file_printer(m);
> +	xe_pm_runtime_get(xe);
> +	mmio = xe_root_tile_mmio(xe);
> +
> +	read_residency_counter(xe, mmio, PCIE_LINK_L0_RESIDENCY_COUNTER,
> +			       "PCIE LINK L0 RESIDENCY", &p);
> +	read_residency_counter(xe, mmio, PCIE_LINK_L1_RESIDENCY_COUNTER,
> +			       "PCIE LINK L1 RESIDENCY", &p);
> +	read_residency_counter(xe, mmio, PCIE_LINK_L1_2_RESIDENCY_COUNTER,
> +			       "PCIE LINK L1.2 RESIDENCY", &p);
> +	xe_pm_runtime_put(xe);
> +	return 0;
> +}
> +
>   static const struct drm_info_list debugfs_list[] = {
>   	{"info", info, 0},
>   	{ .name = "sriov_info", .show = sriov_info, },
>   };
>   
> +static const struct drm_info_list debugfs_residencies[] = {
> +	{ .name = "dgfx_pkg_residencies", .show = dgfx_pkg_residencies_show, },
> +	{ .name = "dgfx_pcie_link_residencies", .show = dgfx_pcie_link_residencies_show, },
> +};
> +
>   static int forcewake_open(struct inode *inode, struct file *file)
>   {
>   	struct xe_device *xe = inode->i_private;
> @@ -240,6 +306,11 @@ void xe_debugfs_register(struct xe_device *xe)
>   				 ARRAY_SIZE(debugfs_list),
>   				 root, minor);
>   
> +	if (IS_DGFX(xe) && xe->info.platform == XE_BATTLEMAGE)

If the offsets are common for all DGFX you can keep only IS_DGFX() check.

else IS_DGFX() is not needed, as BATTLEMAGE is already DGFX.

> +		drm_debugfs_create_files(debugfs_residencies,
> +					 ARRAY_SIZE(debugfs_residencies),
> +					 root, minor);
> +
>   	debugfs_create_file("forcewake_all", 0400, root, xe,
>   			    &forcewake_all_fops);
>   
