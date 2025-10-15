Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05267CCD185
	for <intel-xe@archiver.kernel.org>; Wed, 15 Oct 2025 19:19:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1EDF10E8C4;
	Wed, 15 Oct 2025 19:19:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Bh69dZV3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA17410E8C4
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Oct 2025 19:19:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760555967; x=1792091967;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=taDRhjGRaVzxiuMTycKdVCfIC9U16s4Ty39sVJzZsiI=;
 b=Bh69dZV3xhiU38SKbNoJB+uwXe+cpc9fsklk2ZDU3htpQ01V8AnjXlKd
 oqRuuB9rF80L2T+mb/iuBbkSs61ZWY4ANKIAbJr3f/cxce4tHBe3UDgMq
 eOOmjBph68am0r0ubhfYtQF9X5Kusy1Amlh/yioeo3Taw1B8LbZGF/IQE
 txbm7oCRXKlyRbtEBz0X9jAFlS/VHzm0BoVfWJWut/U5Hp/hWZqJWIQZD
 AU5Q5nHdCFNPvL7QPvyt944CNL47NHiQVYzeev5jR12JOPl/RSVpIX0OM
 4e6aISV6y4PEepmltIZy+4eDM+YTSJZ4u2M6O9GIsj1gZXAFdH1qDk/wL A==;
X-CSE-ConnectionGUID: XIAA5r+CT2OOXi9B2mU18Q==
X-CSE-MsgGUID: Gyp4P+41SPONOZoecEeY/A==
X-IronPort-AV: E=McAfee;i="6800,10657,11583"; a="65359625"
X-IronPort-AV: E=Sophos;i="6.19,232,1754982000"; d="scan'208";a="65359625"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2025 12:19:26 -0700
X-CSE-ConnectionGUID: 983wuAGzSDWLEuvhfHlEyg==
X-CSE-MsgGUID: 30MsS+VJR8WSSUMMYQJj5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,232,1754982000"; d="scan'208";a="213208874"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2025 12:19:26 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 15 Oct 2025 12:19:26 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 15 Oct 2025 12:19:26 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.9) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 15 Oct 2025 12:19:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xt5O3rxXhdUWgLax+bYt5KZRXPaCvCVh6tyv6fdf/EWrVR5IdewcTdr+19fM/L5i4N4CNJa9ap9mpjKyUJHRVHLYKwp07t1/isupIN9SQ/cmgWver3pf06x/eHPWo7d4y37qTF7XbRFv1UkgSlLdP6ajwQGIwg9CuoYD2EfO8ggLrzTKQEIJR8qWFThxvTMB+vh9jtXgMvQc0gVmPou04NjjUnwsN0eeYB0ybRakaJPDvMxTSxCiIB4hQ4VqdTER4myhcKDxNZZYxifLjbag79qA1BC67dvaIGq9Xdy5Q8i648LPfMB4xlMR9ETYPxCTLMlqU1xZdfYH9fn6zAinVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gxnB0KDdgAe+48xvXGKZrem5U6gHoNlcNsi7SHq6iRg=;
 b=TR8v+5blQsktwSujyiM+7tnBiprAhjAkAjmCIqWHohurFzuKKoqEprugUFCL6iaI85utOj9aOcRcWZMTyaFd2v04fkX5CaDLzxveYv8Hc4wJhzHRPX27fu9dEinRp/vMv1dUk7eX+GeIaRNne0ppRSNvbWvRuyPabyxQSmSupVqypahqIQHirniMZbFnr+VSkZfzzWXmk7HUS869kOhuTEbKA3VLWFobcYGbXUnpYrIbEcIrhf3QhWrW4S0ays3af4V/Vi4ue8rr78eY4C8h+hTaEzEZ/4XcejTVn8HqUUUObltfecgAJdfH7WGeeNeuNxNUzRu+X26se7dTuQgobQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB7757.namprd11.prod.outlook.com (2603:10b6:8:103::22)
 by PH0PR11MB4775.namprd11.prod.outlook.com (2603:10b6:510:34::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.11; Wed, 15 Oct
 2025 19:19:22 +0000
Received: from DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::60c9:10e5:60f0:13a1]) by DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::60c9:10e5:60f0:13a1%2]) with mapi id 15.20.9228.010; Wed, 15 Oct 2025
 19:19:21 +0000
Message-ID: <523ac791-b43e-41a3-bac6-26a882fe281f@intel.com>
Date: Wed, 15 Oct 2025 12:19:18 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Prevent runtime PM wake while reading rp0
 frequency
To: Badal Nilawar <badal.nilawar@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <rodrigo.vivi@intel.com>, <sk.anirban@intel.com>
References: <20251015094611.1468939-1-badal.nilawar@intel.com>
Content-Language: en-US
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
In-Reply-To: <20251015094611.1468939-1-badal.nilawar@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR07CA0102.namprd07.prod.outlook.com
 (2603:10b6:a03:12b::43) To DM4PR11MB7757.namprd11.prod.outlook.com
 (2603:10b6:8:103::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB7757:EE_|PH0PR11MB4775:EE_
X-MS-Office365-Filtering-Correlation-Id: 6bf4823a-3283-490a-ace9-08de0c1fbe9a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?N1FROGt5MC8veExPNy9FcHRXaWROUU0rdDh1NjFYTnNBOUY5Qmc1VVJuS2FW?=
 =?utf-8?B?bm5HQlRIOFN1d1YvSEE4ZmRtQjMvN3Y4YXA2QmJ0QVV4c1lvWWp5NG5vVFdk?=
 =?utf-8?B?L3gxSzcrY0xQM2JHZm14bkdtN3d5d20yWEkxSDNWcVZsTExLRzVubnVGbmZk?=
 =?utf-8?B?VndjWUNoVE11RHljOUNpNmJSYzVjL2g0eDZRZWJadDU4eit3MkRDU240bURm?=
 =?utf-8?B?ZGlLYy9vdHdYZit5bUFtSTZwOHYvYTlhZWpiK1NxMmFCNG9BMTRiTzBqZnhW?=
 =?utf-8?B?MHZCU0dYWjk5ZEdDY0xoSkthaVNzTVAzMjJINmlRT29DMGZyU0VHVnRqdWtt?=
 =?utf-8?B?R0ZRYVJGYVpKZnhNeFBIbW45UThYblJWQ1g2L3gvYW5lRFVRTmhMbmlndHUy?=
 =?utf-8?B?dFZBenNTL0xtRHlzWEpUcWp4WkZVUlBmd1BUZi8yNmVMT0tpUllzek1Wd2ZK?=
 =?utf-8?B?Z2MrZGVQUm8vdWNqVW9pSG9FTERMR1Z4ZHBvQThWZ05HS1hqNUVyY001cElU?=
 =?utf-8?B?R1ZQNGVSeGswR3NMTkxjaUZUT3RCU1JHSjNkZ0VyajlUamlYd2R5V3hHZHFH?=
 =?utf-8?B?R0ZjYjNZRkFmTUJRSlozR3A1MUwzalpoNUk2RFBQV1lGL3NqT0NlVEpRYWZ2?=
 =?utf-8?B?Z29FQjdOUFUvWDFaakF1Ti9FSHR0ZTV2eHN4TndQSzU2SERuSmllOU1FT2x5?=
 =?utf-8?B?eHJDcU5YTERVMFpUSnh1Ym4vQVpxQmVRYW9nOHBmV3FUL0lBeWlvNTlZTUNJ?=
 =?utf-8?B?ODk4REFkMTFLQTBnQU1zUnUrdnROM3h0eTQwcGFibmlRdlc3aFJ6UWdSY29G?=
 =?utf-8?B?ZWVMSitWdFV5cXY5VVpTVUFwNDhKV2VqRll1TlptbHVwMHl0dkFFM09vZ1Bs?=
 =?utf-8?B?WE1JTmtEWGoxMDdqaFdYam9uZ3doTmFZV29nMlJoSmk5K1pGSmZmbGhHOXpp?=
 =?utf-8?B?Y1VwSXNTVCtmOWpMNFZFYnYrWUl4M2JVcy9EV0lWRkh6QmpPM1pnVEorQ0Rx?=
 =?utf-8?B?NktudVBPaUd6dHBTMU9kMUdTdEZZS1hNMjhGbys4aVFIdnRzK1RIN3hIV0FJ?=
 =?utf-8?B?cE1hSjRRYmNEcklWUVYvMjg3N2ZEOEJoTWRkRTZnVmo0clpoRjV3Q2RuTzhl?=
 =?utf-8?B?cFhBZUo4dmV1TDdWTkhjYjZFSDF3S1NaaExqQ29hc3lScjV6VS90L3RiZSs0?=
 =?utf-8?B?ajUzZ0hIOHNpeklJRVRKblNjVHRESWVWQ29nT3ZnSm1GUTlHcGpXVGlsOStu?=
 =?utf-8?B?WGFlUkJUYm9BeEtnQ21pRkxTWkVMdm9Zcy91ZWRYL1J1RjhQQjI0MVhBWFFp?=
 =?utf-8?B?OUREWXdEZjBTejdTOUx0aDYyUy9TQmhSMDcvMWJMaUpkRUd6aVo3M1RReUow?=
 =?utf-8?B?UUJqOWg1a21MQmlCdzR3a1Z2Z0NhT3VvVFdpeTZOZDN6YlJsSTJkNnFYN25x?=
 =?utf-8?B?ZStkVVRMam12Q0p5c2xVNHJXZE9VZVZkNVdNeG9mcXBzSkFZRVdvTldkdmVC?=
 =?utf-8?B?ODAzUlZabkM5VWh1YTVJS2s0RGpJUlF0YU0zSk9iVHZ2Nzh1OU5xQnBLTzcy?=
 =?utf-8?B?UHJCbjVXRFBocFA2TU9ERy9zSWkvUVkrVWhMSHhGVVpDSTlKTUpzY1BLV0M4?=
 =?utf-8?B?cG1zeWJEc0lSR0k3a2RscFVycmtqUHZySGdCWENRTHdmMUtIa3BnMWtHVGhV?=
 =?utf-8?B?M1VpK3UxdDNrL3VOVE9PTlh2ZXBHejRpN2Vld0V0S2F3UENGZG9Nd0xZYndm?=
 =?utf-8?B?YnhuMkNWdDV4bS8zVkZoMTNNa3pGTWs3R3hyU2paOGtHZG45NThqVlR0cDdo?=
 =?utf-8?B?endkK2FoSGlscjczL3JPbEYyREE1NVNleUVmMFlXVWRhQlRrdlJOWVkvYXJY?=
 =?utf-8?B?SkU0Nll5Q1pSUTRxVFIvV0hPOW9QMHFDQzlTdnovZFBKaG5YT2JDbzAyTWda?=
 =?utf-8?Q?x0eodKeDGBvgnJQUXRWXGqcYzXYV+oj+?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB7757.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TnM1UExML0JoSDQxelhJdkxYRUJtMU05NldiTjRSMDQxUk50QkVRdG45dmNR?=
 =?utf-8?B?UzNSY2FxWlJsS0xBODZDdWRvR0R0dHhTRjJ3VkdLU3FYWFlaSmYvK0ZVRDZP?=
 =?utf-8?B?RUJuT2g0R3h5RUNXYXh3dThKL1E2RFR1WnFyeEJTT2xFc3JLTFB1b1B2U1lh?=
 =?utf-8?B?Z2tjVEpoa1ZNQUxQbThPYzdjVGZUYUlZUnFzdFE3bEpYWkllYUkxNG9YbFlP?=
 =?utf-8?B?Rll5N011MTc2NE5XZ243R1ByYUxmMkNLbXpZWE9QdUVkeWpsUmFUank5cTZn?=
 =?utf-8?B?bEI5V2RUd1YvMldKUHFtSmllSGFXRmZENnRyQlIvd0xTaStVRTdPQ0Y5bjVU?=
 =?utf-8?B?Q080b1dmR1JGamQ2RVYyYUFkMVlCNWI0NUE2MVlCMkRmbk5sYW5oMmYrOUZp?=
 =?utf-8?B?VEY4ZXFNbzgxYTJmODU0NXNWb3NsR3hCZHFDSHFWQ3ZraDFtbW9mRHVWRnY0?=
 =?utf-8?B?REdCQUtmN3RJcS8xV05jNlBwQnMzQ3d2V2dCUEY5T3ErQTFvMWplNnJac0Zr?=
 =?utf-8?B?RkFGRlJaM0FUL1l2WFAzWjAzUFVqSDFTYlFHbXI3VEFzVWJKVmJXeFNseE4r?=
 =?utf-8?B?bU5TU0Y5ME5nMFFQWWVKYmd1VkYzL29IaTByQlUwQW1FeWVyR0EzVGFibFI1?=
 =?utf-8?B?dmppWE5sdDVPakRvMVhKazJmQ3RVeFluVWJGTHRtMjlVSTkrNytYeExZMlN0?=
 =?utf-8?B?WWFzZlpGUVJiZFNSQ1JDOVpmUWkzZ01kd0J5QmpnSW14Z0RiVkt3TjN0Vk5w?=
 =?utf-8?B?L2tZSk1yTzZLYXh1OStYdjRxdHh5S0Q4Y1k4T0MzQlJmMml1MDFkbUMzcUFx?=
 =?utf-8?B?S1M4QTg4Yk1VcmVxa2Y3UE45akgwUEtwTG9CQjF0blpPQ0lXekJJRW5Id3hx?=
 =?utf-8?B?TlZjQnQ1UUF2U1JacGwvWjd5MGVnN0k1bzJac05uMUdzQUtOOG45a1ZKOWdL?=
 =?utf-8?B?V0dqU1hEejMwS2lDdzJ3Z0lRb2pZZVVtTFo0blNtbUNQM2lUOXEvZEZTSVZ6?=
 =?utf-8?B?NGxaajlDZTRIRk1NbGU4SVFySkFvRURwMlorUnVGRWYzcnlYOEZtZWIyMStk?=
 =?utf-8?B?Zm5vYnpMVDBnVTQvT280a3hBc3ZrNytIZnlBOEZlQ2dSb2VpK3ZJcjNtVTZT?=
 =?utf-8?B?RDVmVklNV0pHMUI1YUVMbnBZSlpQWE5EYStXNEV5QTBIV1BweWFDZmx1NzlW?=
 =?utf-8?B?T251anlDQzRtWnQ5WDk2UGJGOGtiWlhVR3g0KzJ3WHhPWGI2VnpzdCsva1Vi?=
 =?utf-8?B?WERpWElTdk1GVXFoazhNQ3E1bldVTGg1SkRBRGFiaExVdVovSWVyTnlCbFNk?=
 =?utf-8?B?WHZSc0s0N2ZUNzFKelpYOW1GVjNVMGplMXlOMjZFUkE3ejFwbCtDVTRkei9r?=
 =?utf-8?B?VXpaeHVvRTBwbWhwM0xDdGRQRUZuQm90RVFsZHJueVJrclNkUFJ6ZmQwL3B5?=
 =?utf-8?B?N3FJVlN5M0Fuc1VzUDI1OWVQZUsydUtQTHpvMisreHp1K2hYUDUzWUpZT08v?=
 =?utf-8?B?aUVqZlh3TytYWXNmb0dOQTdHamQ5SENiazR2VkZhZkUrdzZWU2ZiNzlTWENy?=
 =?utf-8?B?TUF6L29vRnJ0aGQ3ZUVKaFhxQSs3QnNtdlJGd09GOU9WREhONXhONkVtU0cx?=
 =?utf-8?B?bnRmZFpHNC9vdEdXOVhhUzlyMGZTUm1xdFlGOThZR3RveHlqalJjSmtXdjZV?=
 =?utf-8?B?QzllaUJxNkVYeUtOcWhyZVcrTmZXZVRKRXVjL3VUOWV0dUNQQUFYZStlc3B1?=
 =?utf-8?B?TzAvdmlRSmR6bFBiMU1naTJzTllVd0hraHN0N1ZERlpJZ2YvS0ZqaVFHWWZ6?=
 =?utf-8?B?N0lUKzNnT2o1M3Q5SUYwSmE5S0pGaXR6MGtCK21NQ1IxTnhuMEFqQ2tSejJh?=
 =?utf-8?B?QW9ZNzJvVi9LaWFEM1pUYllxa2QwTmMzdXFBdFBkZnh0S3dMeElJSVJqTWZV?=
 =?utf-8?B?U3JUWGlBWDlKUGM4WGN5bnFVRTZ5OXRDYUtvN0E2SnZCVzNCdGtXLzg3a0w5?=
 =?utf-8?B?WkNLU2txYlRpT201QVUrb3pUbmQ0V2FKQythU0lOa3dZczUzcGVacTk4Z0lZ?=
 =?utf-8?B?TmpOYkpCTXMwNU1mQXU4Vi82cWV4aE5uNUxtcUZ1clJyUHJzajA3ZU5ET1dn?=
 =?utf-8?B?T1p0ZVZyM3owRWZiR3MyS1MyN0I0QkNqckdwQWsxMGZ4aXNtTFEvWGxGbGVy?=
 =?utf-8?B?TEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6bf4823a-3283-490a-ace9-08de0c1fbe9a
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7757.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2025 19:19:21.7421 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rof2UTg57MZglKf2y7bifPNbcZg4wNF72epAHsy33jIhNwrKXH74GffFlSo3f77p9ZB6atQVufV810n6EVKtnoSt/EAaW1cOZrcSXhVKAoM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4775
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


On 10/15/2025 2:46 AM, Badal Nilawar wrote:
> The rp0 frequency is a fused value that is read once during probe
> and then cached, so there’s no need to trigger a runtime wake
> when accessing rp0.
>
> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_gt_freq.c | 7 +------
>   1 file changed, 1 insertion(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_gt_freq.c b/drivers/gpu/drm/xe/xe_gt_freq.c
> index 4ff1b6b58d6b..701349251bbc 100644
> --- a/drivers/gpu/drm/xe/xe_gt_freq.c
> +++ b/drivers/gpu/drm/xe/xe_gt_freq.c
> @@ -99,13 +99,8 @@ static ssize_t rp0_freq_show(struct kobject *kobj,
>   {
>   	struct device *dev = kobj_to_dev(kobj);
>   	struct xe_guc_pc *pc = dev_to_pc(dev);
> -	u32 freq;
>   
> -	xe_pm_runtime_get(dev_to_xe(dev));
> -	freq = xe_guc_pc_get_rp0_freq(pc);
> -	xe_pm_runtime_put(dev_to_xe(dev));
> -
> -	return sysfs_emit(buf, "%d\n", freq);
> +	return sysfs_emit(buf, "%d\n", xe_guc_pc_get_rp0_freq(pc));

LGTM,

Reviewed-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>

>   }
>   static struct kobj_attribute attr_rp0_freq = __ATTR_RO(rp0_freq);
>   
