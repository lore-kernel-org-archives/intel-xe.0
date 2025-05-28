Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC6F1C5AD49
	for <intel-xe@archiver.kernel.org>; Wed, 28 May 2025 16:08:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75EA210E2C3;
	Wed, 28 May 2025 16:08:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gyzYoyaq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86D8010E2C3
 for <intel-xe@lists.freedesktop.org>; Wed, 28 May 2025 16:08:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748448481; x=1779984481;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=shY90brEXOT/SnV+IIsIvQfFIpf7z+h2HZSEO7QoXpQ=;
 b=gyzYoyaqVcpSbXBLjbPjKmhQhgWfNQVztdpHjMyklP7IvRqW5Ex0YeNk
 wsMLfLwvC8MtfJQ6BYeYgJfX5tQeEG1Lem5AJmockr4k4XKtJeWkjFdJU
 qtQoUYWN6XWzpYY0Sii6FDnc2RijASt/WwojF+cU6Sbb8P/hiTkb5nvkn
 y+uuDGQ3Vpd4E7nj8MSCnIeRxJjvI37CfKblguNpfG1ikQhupDJJ3bgnD
 wh3zFWlaCEARGe+Ev0rNdf9CT0eHIKf6zRO35Nh1o7I6kQz2pM6Qcn4TG
 ObOueYUTvWiEgTAO8/bCQEpG4BF5e/KFzV8jV+R27MfayrqZ/lpGNaOeC Q==;
X-CSE-ConnectionGUID: BA3/gh/6T2OdM72T075BxA==
X-CSE-MsgGUID: pHfce3enSDGTKQnvGRvJaA==
X-IronPort-AV: E=McAfee;i="6700,10204,11447"; a="61886263"
X-IronPort-AV: E=Sophos;i="6.15,321,1739865600"; d="scan'208";a="61886263"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2025 09:07:58 -0700
X-CSE-ConnectionGUID: taEVEZG4TH2JQEB42K+JDA==
X-CSE-MsgGUID: begkOAXXRk6l9oQbhehAJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,321,1739865600"; d="scan'208";a="148585070"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2025 09:07:58 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 28 May 2025 09:07:57 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 28 May 2025 09:07:57 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (40.107.92.70) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Wed, 28 May 2025 09:07:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=scj9zSFLVYsaUFWvJOgNaGpX/xypBc3lQLGC6H2KjhNd+lKUo7Hvmh0IdUD09kLIIdQ/+4K8+j38aqPljKAc8aISvzQgZZFgsbmQHoGdm+F5JP4aI1PjUR1lIQQ3vQWEmiyQ3CF0N9hncP+KAm9SNQ2y7lbA2JOC3oE+aPpOHoPjSvb8LgrL14WVmMqnxlULB1yf8bb5JY3T6+VBznY2BzL/qbTk0zJIG9PdgCsJGt+3xs5aFo5+wetNe102qUqGqFjTzfP0aMcJtSnLf+lTmAVhLZIoO5pxbgIQbkpvuSEnK/xttIi1/vMs5gQZWie5CnAUIiooAJ75U0mPkYiqBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IEx2uXQdbHounXnWjmvzXUyuaVkKvvXCMNgpZolop3I=;
 b=xBNXdWkwsaeWgzStELmCxzCYySi5aqHDo/oYhss5UAHEy+Bdw9Ms6tuONE1n+daaJNGDGjF7nOOv1B5uEaWFEM2oL6UU9IQSeMvWH/P8CxJW8phSGAzf6mVQ9Xc2Q7F03NQwgWyyjjrhRFf19oqSVpuMhBQEx3KZAlnRazlNii8W4yNR9mqQb8WhhuVQPhrsjSZTKrHQBLyzDg7nUVcCqb0+qSsDHon1LXh2Ye2JnkIXamEArC5t2Kc35sGhzF6+Vv9QX0IMLzPu5aNRNEOPwvU61nO7kU1rMV/taFbFEex6+M46xigPoDSZlNl748DbDmG1Rn7698BGXodv8a9FkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by IA4PR11MB9034.namprd11.prod.outlook.com (2603:10b6:208:567::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.26; Wed, 28 May
 2025 16:07:53 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.8769.021; Wed, 28 May 2025
 16:07:53 +0000
Date: Wed, 28 May 2025 09:09:25 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH v2 18/32] drm/xe/vm: Add attributes struct as member of vma
Message-ID: <aDc1NYKT/0fFlt1k@lstrano-desk.jf.intel.com>
References: <20250407101719.3350996-1-himal.prasad.ghimiray@intel.com>
 <20250407101719.3350996-19-himal.prasad.ghimiray@intel.com>
 <aCTik0GGPGymStmr@lstrano-desk.jf.intel.com>
 <eab2c34b-d89a-46f5-9147-bb9060b4a5c1@intel.com>
 <aDX4X7X6GAZcaBBv@lstrano-desk.jf.intel.com>
 <d9a23e0a-8173-4c30-8f8b-1f9dbaf7eccf@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d9a23e0a-8173-4c30-8f8b-1f9dbaf7eccf@intel.com>
X-ClientProxiedBy: SJ0PR03CA0359.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::34) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|IA4PR11MB9034:EE_
X-MS-Office365-Filtering-Correlation-Id: 8662c869-1959-4ca1-81f0-08dd9e01cd5d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SS9GdmhKMGI3SVE2bWZMMm5LTlhlR2pORm9PcjJYbkRKKzQwYU5mWVVUMEhK?=
 =?utf-8?B?M2MwTG4rSFJVbkRmYURaNDd2N3FhSWRVN0FwdXdLeUtDZ29vdUxmU1YwOHpH?=
 =?utf-8?B?OGYwa3V5V2VBRUNsem0wdjMyMjNCdGt5QVQ4ZXBwZlpiaUFOSkJiSkxwUEpR?=
 =?utf-8?B?ZGNPbHpsTUJ6ZmUwMnBaZHk1N0pnZ0QxV1d0N1U5K1VlQnZTK3J4cVFxRHZI?=
 =?utf-8?B?TklXTmtwTjUxTi9NNmpWL2FwL3FBNmJZYkliSEZWMzYzRDN4elI0N2tUWFhB?=
 =?utf-8?B?cEtXNjNtTUZEMWhtamlFa0FwaVdPUU5RS3d3WVloRy9xNmZBNzNWMkc5cFlS?=
 =?utf-8?B?NUp5RjRjQ0VXYlRkbTFQVWRBNndXNTE4ZDlzRURQdkwxU1lUbmRnQXNENDNL?=
 =?utf-8?B?NHFGTWVFRFVsdEQrQzA0WFRGYUt1amRFN2VNQUF3eVprcTNnWkhrVFRWNEMv?=
 =?utf-8?B?Yk90Ynp6VkFmaDcwcjQwdWNYL2pnMDF6c2RrNEZvYVhJRFYydVJQZmZzb1k5?=
 =?utf-8?B?bDZrTWtBTHZsa2VWbThyZlZCNjFaMTRTS1dQeVFNR3BHVVdvbnk4WGJKeHF0?=
 =?utf-8?B?bzdoWWhVcnlFUzhUQmtpOXJiK1E1dGk3MFo0UzFQMGZkRWp2dnBwTE5MVVpq?=
 =?utf-8?B?WkRjZnNTTnBvb1ZFajFQZTVDblhqWUtHOWozZno0aVhzV0taaXluaVYrRGUw?=
 =?utf-8?B?bTROVlVSU01KcDVETWxPS3ZiQnhONHByaWhrY2xuVjlkS2xhUjFBVkVUd1c0?=
 =?utf-8?B?L0plVlZLbkFzWjAyTmNEaVpld3JIVzQxV2RpTm1MZTZna0ZRTm5wV0t3N2tn?=
 =?utf-8?B?bms0cDNkb3hxa0xuY0g5MkJUR1FLT3lXZDZBQ3JZWXRlWno0NDhTeU5BeWRJ?=
 =?utf-8?B?L2xIZXBpZ3dUR0lITStnQkRjamFhSUdkN1FERlFSSDZ5RkdLZEhjUnNVTWZY?=
 =?utf-8?B?RDI2VVRuazhOQmc4ZGQwNk1mVlJRdTlNWHpWWGJmU3JoOWNHbmJPYmloT1l0?=
 =?utf-8?B?SlhtNC9lTkdYRXkyMmhubm5MS2tGeDV0WXdZZGcwYWxTZzIyc2ZXVzNJUzFI?=
 =?utf-8?B?eW45WXRyUklrdUVZYWJxSFZzMHVBMGlFZnBBVjQ4VCtYeXVYenh5R1phcmNJ?=
 =?utf-8?B?Qm5FU0xuS0l4VnBjY1NTREhSTVpLYXZ4QUYrQXpwZHpNVkl2S0NXSm9rdUx1?=
 =?utf-8?B?RmtJM1NkY050WE9JTXk1VldON3ZkbDZ2OUo5ZXZKVU9oc3ZnNS9ha3BoZHBH?=
 =?utf-8?B?QVpUaHh6TTlRQkRRZ1JDMnN5STRsR0crOHVqakx3UW1xdzhndFN0WEZUY2tk?=
 =?utf-8?B?ZUpCWjNiTDBUQ3dGc1owUEFwM2J3QWFoZURUY3E2UVB4aUVPNU9leXdkUVF4?=
 =?utf-8?B?OEFtMTNFanpvWTdVTUViNGExUjQwN3F4TlUxVU9HWkp5cWVJQ1pWUEkxbWVP?=
 =?utf-8?B?bkt6V09pbTI3enh4T0NqTzd0RjRSTG5aTU1hK1FyY3NRNXM5QjY1Umxtd1dP?=
 =?utf-8?B?elF4cVdBa2hYNytXbFdUc09jZmh6K3BHaWFZTlVHclNNNWxDdW9GZVRzRlJK?=
 =?utf-8?B?Z1lIbkhKSTdLUmhvNFVtaHVzN2VudHBCMmRsYlNGOCt3KzdhWmN0VE93VWlC?=
 =?utf-8?B?RXh3VVRPdVhOSHN2NlJWUUhvU0pYeWNQSUwxNTh1R1h5K3JoQnRuWE1WVnkr?=
 =?utf-8?B?dXVvek5vTk9mU01VeDQrSVlRdlN3bVhRUlhuOFFyaDh4NEd2SllZdzNwYTRN?=
 =?utf-8?B?WmpVTFdNK1ZJV1kwaWZYWHArSmZ1bnV5ajNsOHUvaE5Ud24zbHR0NU1iWG15?=
 =?utf-8?Q?uw29EZbjGIeQSg5oxTcafRF8sT8tfwt3cxvhU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QWZvemxSc3hVZmNIZjFZSkQvWEsyenJCaTBzTWZGd2JTQVZiLzZCMzc4dU1o?=
 =?utf-8?B?a1ZYMXBGUkxKY2Q1eUxyL2JzTmttSFl6NzZZaThsOEtzL2c4Q2NEbndJR2xt?=
 =?utf-8?B?OE5ZSXhDbE1aZWdtQzZ2eWQ2eEFIdGRFZVhHYXBRcmRtMmxla2RjTFE1K1gr?=
 =?utf-8?B?cEtwZ0pDZ2svR044cll3eEVyRnU3NFdud0hobVhEOWpLT0cxQkFBdUl5NlRm?=
 =?utf-8?B?Ukg4Ykl6U0VoVllSYkdTSmhEZXZoQytTZC9pMllMK1NuaEpsZU1ESjBNVkRN?=
 =?utf-8?B?dUd2bGVjNVd4aUg0by9abGpjaU1pWkgrVi9IUG1iSERmaXlQajNWWklpUE9x?=
 =?utf-8?B?QlJpZXp1N1dXeWp2QzVIN3pGU2lnQldScDZ0eXZQNG1NejJORzlaTWcyY2or?=
 =?utf-8?B?OXhYaDRBZ3hMZXVTQVh1cW9kUURWVzJKbWdUdHp0bmo3MkdCUE1idFEzZFJo?=
 =?utf-8?B?TWQxcGtMdENlRnlyMzB0bS8yVDZIL3JETkNVckdzTEh6bHhzNS9NVGZSblVQ?=
 =?utf-8?B?bDBVNENoNDJqRFpSNVRTbldDQWhZb0hudHBLMW1OTThqNy9qYmRUNWczZklR?=
 =?utf-8?B?dXdqb0p3M2t5bVlMTWkzQStyeHBoek9EdnpyUEVjbDVJMUtCRGoyUTltS0hn?=
 =?utf-8?B?K3lLenVKR2ZhWmFtdFNIa0QyaWRUN3FvMXgvQ2tBMnRnMUM5b24wenRoN3dN?=
 =?utf-8?B?dzlsaU0xOFdTb2JKdWdESCtibytxa1h5L015ZnBCRFhhWDZnZmVwL05YQUpZ?=
 =?utf-8?B?RUJHam5TSW5JaFRqTUxEUnBNU1JVWHlqTHhUNFA0bUFvWEpYK2JnSno1d01W?=
 =?utf-8?B?WmxhSk9heUVIUDF5dzJMZGFiTlN6SzhiYnRXT1RxMDJBQnJSb3J4RThVcWVu?=
 =?utf-8?B?ZVZTU28wWGJqWDYydit2Skc0Vi9RYzVHNkZ3MXNESDcvdzcvV3JsRkEzc0ha?=
 =?utf-8?B?K1kwWmJING5LaldtTldDbElwSmc2Ris0UzN5M1dlaFFjT1A0YytOdk5GRHNS?=
 =?utf-8?B?cm9uVnd3Uk10SFh5WU5ZamVoejNiSjRFM0xDMWlhaXBOemJ0UktYbFBlVHp4?=
 =?utf-8?B?YWdkUzdXK3lSL1pQRVFvRWhBYWsrQjJYZDVzNjRjWFFZdlRuWWVFZER6Ykl1?=
 =?utf-8?B?L05uWHBaQWFMYjlaNlc2YXBubnU4SC80QldkUnNQNEg2NzVXcDRGdHVMOE54?=
 =?utf-8?B?djlyd29lSXZpVTlwaG0yU2w4dENRRklHR1ZHeDBYOHpQSHFTRi81QlR4Sk0r?=
 =?utf-8?B?RWFwTVRiZ3BSemNJbk1lVFZwdjhNVElGZytnVGF3QjVqSUlDZG5CSTNsN1Za?=
 =?utf-8?B?Q1ZTSGRqYmFYVlMxWGFEYkt6TlZtcmZ0TWF3SDFnRDV6NFBhZkNWRWNrTThx?=
 =?utf-8?B?VDJUMkg4MUFHN1VGdjNoZU1sOUNDM2ltbE4xZGd3MGtlQm5hWTlIWDZpeFQv?=
 =?utf-8?B?UUJKeGswY0xCRzVhKy83UlVYTGVsUTcwODBCYXBXQXF2NnBOU2Q1azFvNitQ?=
 =?utf-8?B?S1N6SFlFZGt4RCtVRmllS2QxdHZMbW9JNEl5ZzZoS1VDTm1rNnNOeUlwaXNF?=
 =?utf-8?B?SmlDa25JN2FUYWJuVy9PeVMrWHhMcjN4QTFNdncwU3RBU2lvbm83ZkZKOWtt?=
 =?utf-8?B?TVJ3b3phUUQ0Y3F5K1ZBaDNCaUNqQ1BIT1M5bWp0cEZrcHhmQUk5czNNNFN1?=
 =?utf-8?B?Mk9DYnBva0lVajZwZW5VZlY2Vk90dk9nVlV4RS9oNDFlSE52NDV6NHFIVk5I?=
 =?utf-8?B?N2w3dnl6NTErSTMzMkl5dWo1d1N3TnpBcW1pR25jSnRVdUJtbkJjZjR2ak5z?=
 =?utf-8?B?Qkt6dXRUYzQ4RituR2pITlZseUpIbjZOWGtYandlTlF3L3R5ZU1hdVYzWTNK?=
 =?utf-8?B?WXdEYjg3MWtzeEZpaTFwTStmWGoxZ1BOQ2tHeml3M240LzljYWc1cGZUcUs0?=
 =?utf-8?B?WmVPYkJVbng1Q0JsYXV1ODUya1VPdVRiZkg5NkFEcVFlVGVIQzFENTU1dmoy?=
 =?utf-8?B?RHB0czU1WHFqN3F1dW5MSlBUa2R3a3N3bnR3S3NSMVJ4QVVPNU5UWUNxT1dF?=
 =?utf-8?B?YzRBaVB6aGlxT2hTU0dUMmNlakp4MWVOWS84bzJ5Q0VHZHFVbS9CQlRvYVoz?=
 =?utf-8?B?SzVBMHNFU0hJLzNPdFNsT1N6RThzR3hrbllrV2EyL091aUxhalNJUnF4cGdL?=
 =?utf-8?B?d3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8662c869-1959-4ca1-81f0-08dd9e01cd5d
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2025 16:07:53.6556 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cMk3IF+wQUdn2VvenGjNqBuukWP7KBGvcKWvWu4LCkt8xi0hUIUu4WEZrpasSpx2lo6LKFP2hCHzwTy2hyMVHg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9034
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

On Wed, May 28, 2025 at 11:03:31AM +0530, Ghimiray, Himal Prasad wrote:
> 
> 
> On 27-05-2025 23:07, Matthew Brost wrote:
> > On Tue, May 20, 2025 at 02:57:45PM +0530, Ghimiray, Himal Prasad wrote:
> > > 
> > > 
> > > On 15-05-2025 00:06, Matthew Brost wrote:
> > > > On Mon, Apr 07, 2025 at 03:47:05PM +0530, Himal Prasad Ghimiray wrote:
> > > > > The attribute of xe_vma will determine the migration policy and the
> > > > > encoding of the page table entries (PTEs) for that vma.
> > > > > This attribute helps manage how memory pages are moved and how their
> > > > > addresses are translated. It will be used by madvise to set the
> > > > > behavior of the vma.
> > > > > 
> > > > > Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> > > > > ---
> > > > >    drivers/gpu/drm/xe/xe_vm.c       |  6 ++++++
> > > > >    drivers/gpu/drm/xe/xe_vm_types.h | 20 ++++++++++++++++++++
> > > > >    2 files changed, 26 insertions(+)
> > > > > 
> > > > > diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> > > > > index 27a8dbe709c2..1ff9e477e061 100644
> > > > > --- a/drivers/gpu/drm/xe/xe_vm.c
> > > > > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > > > > @@ -2470,6 +2470,12 @@ static struct xe_vma *new_vma(struct xe_vm *vm, struct drm_gpuva_op_map *op,
> > > > >    		vma = ERR_PTR(err);
> > > > >    	}
> > > > > +	/*TODO: assign devmem_fd of local vram once multi device
> > > > > +	 * support is added.
> > > > > +	 */
> > > > > +	vma->attr.preferred_loc.devmem_fd = 1;
> > > > 
> > > > Assigning a value of '1' is a bit odd... I'd prefer using a define or
> > > > something similar to indicate the intended behavior. I noticed a few
> > > > other assignments to '1' in the final result—same comment applies to
> > > > those.
> > > 
> > > Sure
> > > 
> > > > 
> > > > > +	vma->attr.atomic_access = DRM_XE_VMA_ATOMIC_UNDEFINED;
> > > > > +
> > > > >    	return vma;
> > > > >    }
> > > > > diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
> > > > > index d3c1209348e9..5f5feffecb82 100644
> > > > > --- a/drivers/gpu/drm/xe/xe_vm_types.h
> > > > > +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> > > > > @@ -77,6 +77,19 @@ struct xe_userptr {
> > > > >    #endif
> > > > >    };
> > > > > +/**
> > > > > + * struct xe_vma_mem_attr - memory attributes associated with vma
> > > > > + */
> > > > > +struct xe_vma_mem_attr {
> > > > > +	/** @preferred_loc: perferred memory_location*/
> > > > > +	struct {
> > > > > +		u32 migration_policy; /* represents migration policies */
> > > > > +		u32 devmem_fd; /* devmem_fd used for determining pagemap_fd requested by user */
> > > > > +	} preferred_loc;
> > > > 
> > > > I'm a little unclear on how these variables work.
> > > > 
> > > > In the uAPI for migration_policy, I see MIGRATE_ALL_PAGES and
> > > > MIGRATE_ONLY_SYSTEM_PAGES (these should probably be normalized with a
> > > > DRM_XE_* prefix, by the way), but it's unclear to me what exactly these
> > > > mean or how they're used based on the final result—could you clarify?
> > > 
> > > With multi-device support the idea was to have flexibility to move only
> > > system pages to preferred location or also move pages from other vram
> > > location to preferred location.
> > > 
> > 
> > Ok, I think having bits set aside for this makes sense.
> > 
> > > > 
> > > > Likewise, I'm confused about the devmem_fd usage. It can either be
> > > > assigned a devmem_fd from the uAPI, but in some cases, it's interpreted
> > > > as a region. I assume this is anticipating multi-GPU support, but again,
> > > > the plan isn't clear to me. Could you explain?
> > > 
> > > The devmem_fd is intended to be used to determine the struct drm_pagemap *,
> > > which in turn will be used to identify the tile associated with VRAM for
> > > allocation and binding. The changes that introduce the
> > > devmem_fd->drm_pagemap->tile [1] linkage will be part of the upcoming
> > > multi-GPU support.
> > > 
> > > To ensure that the current changes are easily scalable and can be extended
> > > for multi-GPU support, I am defining devmem_fd in the UAPI and using it in
> > > the KMD as a region placeholder until multi-GPU support is integrated.
> > > 
> > 
> > Hmm, will this break the uAPI though? e.g. How does the UMD choose
> > between region and FD at the uAPI level? If the answer is once multi-GPU
> > lands it is always a FD rather than region then we really need to land
> > some of the multi-GPU patches at same time as madvise - at least the
> > ones which export memory regions as FDs.
> 
> I have tried to streamline these changes in the latest revision. Let's see
> if they make sense. This is with assumption that in a multi-device setup
> devmem_fd <=0 is actually invalid and doesn't point to any remote/local
> tile.
> 
> A value of 0 for DEVMEM_FD means the default behavior or VRAM of the
> faulting tile.
> 
> A negative value indicates that SMEM should be used.
> 
> Other positive values correspond to valid devmem_fds. With the landing of
> multi-device changes, if a positive devmem_fd is not valid, we can fall back
> to the faulting tile or SMEM.
> 

I think that makes sense - so then multi-tile (or more specifically,
multi-vram regions) within a single device then is an extension of
multi-gpu.

Matt

> > 
> > Let's loop in Thomas on the multi-GPU assumptions too to ensure
> > correctness.
> > 
> > Matt
> > 
> > > [1] https://patchwork.freedesktop.org/patch/642773/?series=146227&rev=1
> > > 
> > > 
> > > > 
> > > > In general I agree with the idea of xe_vma_mem_attr though.
> > > > 
> > > > Matt
> > > > 
> > > > > +	/** @atomic_access: The atomic access type for the vma */
> > > > > +	u32 atomic_access;
> > > > > +};
> > > > > +
> > > > >    struct xe_vma {
> > > > >    	/** @gpuva: Base GPUVA object */
> > > > >    	struct drm_gpuva gpuva;
> > > > > @@ -128,6 +141,13 @@ struct xe_vma {
> > > > >    	 * Needs to be signalled before UNMAP can be processed.
> > > > >    	 */
> > > > >    	struct xe_user_fence *ufence;
> > > > > +
> > > > > +	/**
> > > > > +	 * @attr: The attributes of vma which determines the migration policy
> > > > > +	 * and encoding of the PTEs for this vma.
> > > > > +	 */
> > > > > +	struct xe_vma_mem_attr attr;
> > > > > +
> > > > >    };
> > > > >    /**
> > > > > -- 
> > > > > 2.34.1
> > > > > 
> > > 
> 
