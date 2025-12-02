Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F4E0D1171A
	for <intel-xe@archiver.kernel.org>; Tue,  2 Dec 2025 17:24:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50F9E10E694;
	Tue,  2 Dec 2025 17:24:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IFdbWKoB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A334210E694
 for <intel-xe@lists.freedesktop.org>; Tue,  2 Dec 2025 17:24:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764696266; x=1796232266;
 h=date:from:to:subject:message-id:references:in-reply-to:
 mime-version; bh=HgTgtp7tfPbkMdCpCtwk7cmXnl+7GR9dAjeCErrtBUU=;
 b=IFdbWKoBd+swDYMNOAnIhd1JX7kKJgsexxJxZm/q4+Sid3TQHbeNZo+f
 bWK1+Ojg4MLO+cY21xxzNKQ/aNup0erKuz4+BArnuyWeIrcIRe3xza9pt
 CUypnnoyD6vRHzN3IQMpVI4ot+9g9eb+WHIeHxFpcATS2N67GeMe6JQMh
 Qid4xhcvZ0hgag9BuBjvgkLNPRC5fO0clGfY9Rhpgz2zZXgx/l9ZP7T21
 IebGlpU2OymjteR1hSQRwewSLzMkXHOT0cbT6ND2aPGucDrnrFMx47YbV
 wjXUGwHQ/dOimisxZR9HFzlQdCaEKorU5VpgbAJeV3CO/07yPNpQYI+Yx Q==;
X-CSE-ConnectionGUID: cPKY5u1uSuO+rei6bqwARw==
X-CSE-MsgGUID: GbZ+/ODLSaGar0A1JrZgKg==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="78140488"
X-IronPort-AV: E=Sophos;i="6.20,243,1758610800"; d="scan'208";a="78140488"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2025 09:24:26 -0800
X-CSE-ConnectionGUID: qr26Ga2NQvCQBqdGMSIjZQ==
X-CSE-MsgGUID: 7dU3U6gWQJKAIAgH2P8DgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,243,1758610800"; d="scan'208";a="194421667"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2025 09:24:27 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 2 Dec 2025 09:24:25 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 2 Dec 2025 09:24:25 -0800
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.12) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 2 Dec 2025 09:24:25 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SsnTxgsrO5tWbnH2AChMGjGBzDPpc5swUJxh5PUlHSwXKstrR4Y9yKCnLwepKqzQM3rfkPVXjUx5Ojbnnf3UNgTa4D3p3f0IDLoD9NgE75ZX1IOEiWxSOslZ+hwGSuV5p/+oRiAJpcPSb3xJ4qJSnRjdw4Qefc+EyGyHEkmG41AOy9ukFMzpdu76deJTX76rQU7aEaKGz4HAl/O0Uiin0ZERBjmMkThp9SzORqlXJ78ozecrzz3Vn/RrQLL+UkTnAiyNfd1mqu4sUz/ZMhtE1NVTca2AYxokyx8MCaiYN/6wpHY7xMs/nXoNxh9sp8xC2e2NzfNRZYmQLchE47ZQBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YtovIVyimvOIL3erUS+rdxhkezMXficMIyrnC2r+qrI=;
 b=dynib5EWMiHFaJT9Cor5dXScSOXmrSXlCG/vJGMfodSHw/pud1EA759kqNcTIAXl4B02OUQqE1cbElE5+xJty6E03GLKqUnaWJY+w0f4NzFU8ghVxro9m2+lbiY98Km+fwXSrKrdZ8RITA9eDHA30C+cAM4OhCbGqT6Xs3EpgXwa5Ms8Fl9UKpIdf4pxAJFdS7VXbLNeWzo+1d0BJ55DC+x8M0ZUMPWLn+vget470Fu3p7rbP6lST0I+L6u3qvcuLJ+5F4Rq0YgYG9AnQ3KwMi4qi/OJzEO6VtMe+qAWGKzeJzgLijxSVAGK6VGmZh3Q+jJ82vMORXttPwyII6y96w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ5PPF89507EDE4.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::83e) by PH7PR11MB7551.namprd11.prod.outlook.com
 (2603:10b6:510:27c::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Tue, 2 Dec
 2025 17:24:22 +0000
Received: from SJ5PPF89507EDE4.namprd11.prod.outlook.com
 ([fe80::28e0:9ef7:24f0:c21b]) by SJ5PPF89507EDE4.namprd11.prod.outlook.com
 ([fe80::28e0:9ef7:24f0:c21b%7]) with mapi id 15.20.9366.012; Tue, 2 Dec 2025
 17:24:21 +0000
Date: Tue, 2 Dec 2025 09:24:19 -0800
From: Matt Atwood <matthew.s.atwood@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: Re: =?utf-8?B?4pyXIFhlLkNJLkZ1bGw=?= =?utf-8?Q?=3A?= failure for
 drm/i915/display: Add initial support Xe3p_LPD
Message-ID: <aS8gw0AKOnp7owYf@msatwood-mobl>
References: <20251202012306.9315-1-matthew.s.atwood@intel.com>
 <176465855011.47892.751386860256814962@a3b018990fe9>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <176465855011.47892.751386860256814962@a3b018990fe9>
X-ClientProxiedBy: MW4PR04CA0268.namprd04.prod.outlook.com
 (2603:10b6:303:88::33) To SJ5PPF89507EDE4.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::83e)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PPF89507EDE4:EE_|PH7PR11MB7551:EE_
X-MS-Office365-Filtering-Correlation-Id: 46aae124-9a82-47ba-fc97-08de31c7a1c1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|376014|366016|1800799024|13003099007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VVl0bjNCRzFFbVZSN0ZiajVsbE5vWVY3ZGdkaWtsMGwxcWRKU0hwMFZQUVVm?=
 =?utf-8?B?UllXSFc5TENsMGJyNzlmcFQ1cVBTYlRGeTJMa0dBT2lNdXNvcW5DZGllWGdE?=
 =?utf-8?B?NGJNUHZaQU1xaFlnbitycktPZ3h5L1F6SXBlOEpQYW5oVU0vd0xqcTRRLzRE?=
 =?utf-8?B?RXU1V2RwaXVTY3lHSG10SDV5N2Y0azVFQ2s1TVRQQklPaVdEWG03bHZhWUJB?=
 =?utf-8?B?T0V3b0daWFBBVGFySk1iVTlvY1pxTkdwSG91d2wrMnNnNFdPdTZWSDgwK1Ar?=
 =?utf-8?B?b1JwRWRsSXl3RlhvQjI0QkhYNTZvalIxMTdtNlp6b3I1czlyTzIrYUFGTFkz?=
 =?utf-8?B?TjZCUVUrMjVUaDR5dFNOTFkwanJGZmx3TEhyamEzUHhJazNEdDllQkR6K0xY?=
 =?utf-8?B?YkJuY2NtQ3RkQ3RKZXZ4aUVVNUxOWjdWYWdvbHhSb0d1SzVBOXQ3ZjVOSHJH?=
 =?utf-8?B?V2VOS1ptbDhubEhOZU1FNmNsV200NGlZNnM1MTNvWHd3bEZiNW9sUHB5SWpk?=
 =?utf-8?B?clVlWmg2NTVBSTF3eXNxbk00NTZTWUVlZHVTak9zc2hqcm1GYThzdGdJdHAr?=
 =?utf-8?B?QlBQR3BDa1hlQWlKY2tyUjRFYmx0MkdPRHB0dXAvRGxtUDhzRHByK2VYaSt1?=
 =?utf-8?B?b3VYakt0c0cybVVhM0ZkUG53c1lQOGh6amJjOUtjS3ZXTkNYbCs2bUt5VEN3?=
 =?utf-8?B?QmtHOHJWSWxmYVhrdi9FYXNsNnppWnVKRmFETDhOdzJsQTBVK0Q2TlF4MVZI?=
 =?utf-8?B?QzdYaEI4N1ZKdjRBNjJqN1dMOUF3eWhqUTFhQzFTYyszMGt3Q1R1b2RXNTI0?=
 =?utf-8?B?bEQwTTFLOUtUUzdaQzZlb1hDUzlJQzdGOEdpNEdSVVRMMGoxUHdzc0d5NUlr?=
 =?utf-8?B?OXV5UFordkVmN2ZxRmd5UzNPQmFwTTRXWEdYZnYzZzRHbUh5cVNtcDRvcmdR?=
 =?utf-8?B?MGtxZXBSQjVleUdTQm5MSERkWDN1S2FpdmltVklieDZiVG9kUGxXTjJnYUNS?=
 =?utf-8?B?Z09ZcjlWV2U4UWRqV21TT0diT3M3UjU1MXJ1SFB3Mm9Od3Y0TmxacHpRYSsy?=
 =?utf-8?B?R0VwVkdUWGttUnBRU3ZoWlluVTNDVzhYTjIrUEpGaW9xUXRCQSt4Y0JubDd3?=
 =?utf-8?B?eHZRRGd3U0JnQVgxOFN0SHBvN3NWYlNJVk9sQjF6T0w4Z1RwQ3dmQVk3VE5C?=
 =?utf-8?B?WXRydXlRV0RUTnZ0cnhwcUxaL2gzTlRrZURjS2pWa2pIanFWMzcvWjVwOFU5?=
 =?utf-8?B?dDhubXA4bFJEQ3Z3SjhaSHVOeFZjTDhxaTFwVWloQWRFaVZZNURpcTBzSUk4?=
 =?utf-8?B?bGtzcE1BRndjOWNETDZzd2xaS0oxYWV1MjBCVXVhOWJ4NEFGQm52MEhYS0h3?=
 =?utf-8?B?QVdyREVLdXp6eldzbmNCQ0FFcmdUWnJ0WE5JdW1oN3c1Q2JIQUMyaitsMGxB?=
 =?utf-8?B?NmliSkpQZi9rREZ1NWVpejJmeXVrd3ZsZS9Ic3JhT1lEa2pyTk8yMXdMblJO?=
 =?utf-8?B?bVpoZ3NMS0pSMXg2VTd0N2J5ZU10SzRYeS9DMUxpaXVramRLNzFpL3E3bWNG?=
 =?utf-8?B?Tk96L1JiK2dWTm1HNzYwVTMvSXZwclgvVis3aURRV1dlWE82SEdhSkdWNXFu?=
 =?utf-8?B?VXRjQ3JTT3Bid2IxbnRoQU5TcDFhNHBFKzZ6MnJvVWRodXNMT2w4SS8xbHdY?=
 =?utf-8?B?L1NVZi85eHBCZEcyU3JHUXdWaDU5VE0xcXNVYUhSK2F2amNQM2tFdUwydjFZ?=
 =?utf-8?B?Z0tQWVFYdElpZ2VRdXpYd1hvV01BNnhUbGt5VVlCUTNmc1pQZEdxTlFpa29t?=
 =?utf-8?B?VlcrV0hVa05VMFNEc1I1WTZhRnA3WlZtQnlVdlFyRW5BRTJOcStjNkl3QWJV?=
 =?utf-8?B?SzNGRmlXVTZlVGlvZWlGTE1oejkxd2NKL3hNNFRtL2ZsNVE9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ5PPF89507EDE4.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(13003099007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QlIreGxrN2RpMlAwL1IwUyszQ1liUVY1UGdwNEV3eE1laHp6K3RhWFQwYk5h?=
 =?utf-8?B?emdUS1gxUVhDTFM4SXVQNmtrRXExTU5oN1lORTVjYjQyNUViNitHcVM5bk1t?=
 =?utf-8?B?ZDZOT3d5a1h4UzJYMGFTaC9HK2RhTk0xWmM4dGYwb01VQlJxVVhHUWpMK0VY?=
 =?utf-8?B?cFJOVjJHK3NVLzBVZUN3QnlDSHhJQ1FRdHNrZ0lMeFVzQ2hmU0NUMG9sRDZP?=
 =?utf-8?B?cmt3NUtZQzhiVVdZdnpMYlNmbmN3Vnh4UEswS2FGdzdxYzhPSk9ITzQ0c1Vm?=
 =?utf-8?B?eGNRbHE4Tm0zWHc2NEtTZHo3QnV5K3VIaHQ0TUJPQkJDVGRCcmFYd1YvbWdB?=
 =?utf-8?B?dHc2NlRyRXNLWjZrVXhLdlNpR2t0TDJqSnVwNFlQLzkyeXdTK2p6VEZ2MlBi?=
 =?utf-8?B?aTllZlBKeHZWT1QrQTQ2UFhvYklpV1MvcEwvSkloUmVsK3Y3eFJ5V3FoQlNL?=
 =?utf-8?B?SjFZbmc1RkRDNmxsSnFoS0dlSlRYUWZPTVo1Q3A4UHh5SlBUT2NhTVlIc3B2?=
 =?utf-8?B?MkEydjhOa0M0OGVzc21jQURpQ1FNMWdmUXVXWUdtQjVYc0pLVldIVE00MG54?=
 =?utf-8?B?YlNBNEwxWnQ3RWg0YlJpcHJuVU5TMUZwczZXa2ZkN0hGL3o4dzNrT3hGL2hK?=
 =?utf-8?B?Qmo3VHdPQVllaEswcy9LN0Y2eWpSY0NoMG9uNEV5V29lMlZaWmRJVUlPZ1ky?=
 =?utf-8?B?M0FOUzB2ZU5UUnhmNko1bG5tY3VRQ29jOW9LZEhJWitTdC9DZVozMGRubVU2?=
 =?utf-8?B?akRDTTVHSURhbVhlTzJFSVl0MHFSRkkvSUJnMnN6VUZLUnhaVkZkRTIvc2Z3?=
 =?utf-8?B?d21helpYVjZQZVJGdFFiTk5iQXdabnJETEE0WSswd1I3TWVsZzB3aHJheDZa?=
 =?utf-8?B?OW15dEh4OU5Fc3hjUnRLcVFLQm9iUS9ibUFhK3I3SXR2alo5eGZ2ek9BUzhj?=
 =?utf-8?B?VUliR2JuOTF2MXk5ekhHNU9rbStyRzVNMW5CWThxUGpYTW9acU1mZ1Zub09z?=
 =?utf-8?B?YzdsdXZ4aFY1WTErWTROODh6NHcrcXNQZWQxblBSUC9xTHRjWlBJbWFpenNW?=
 =?utf-8?B?aElYTTlwc3VnWnN3bzJMZzEwU3dpbkRhckFBM2pqYWhqbU9yNzZydjlQdjZo?=
 =?utf-8?B?TG1sVGcrY2hqdzZ4NnVBem9qSmlxdmJCQ3Q1L2RZVVRjTnNpV01tNDNKb2dY?=
 =?utf-8?B?ZHplcDlIeWUza0xIUXROeFZ3bTJ4RFhjamdONUxRbjA4YWhkQ3RaY1oweTFW?=
 =?utf-8?B?cjBwdzZtVG50Ri9tZ21wVXkyWjZqTlhPSHNnSGtMc0VSdWh3TWJtUmhiTFRu?=
 =?utf-8?B?NE1PeVhYbUo1aGN3TVZoakZNQTdNS05VQVpGUjBaaVZDVmhFZUFIanZxeC9r?=
 =?utf-8?B?M1lUUC9lRHFPMUhuNmJWTno4aVYxTEVMcUNVTGRKL0V1SCs1VVhEOFZ1amtQ?=
 =?utf-8?B?cE9jN3pXMGRtYVVoNGtneW1ZbEx2QnAreG5oRmcwUEFVS1ZCQ0ZEdmhHazQv?=
 =?utf-8?B?K3RwSDRhbEN1SzR3UE1tZTJvbVdtZVBWVllCUE11ays2RFhQbzdKVnRPQnlO?=
 =?utf-8?B?NmNHeE9WdmNWQkg4aWsvdEwrT1hqejNiTGlISEd4R1RtQXNPVWNnSXVFT0ll?=
 =?utf-8?B?Vk94Wm9NMzVlQ0NlWXlmd2VTaWswaTh2cWNhYmlkMlExM0RGZXJVMXpyMEt0?=
 =?utf-8?B?TGkvUDZRcXo3dStGTS9KUWNGQ3FYeHhYRVVnMCtqcnltbkRPWHhCeGJSby9i?=
 =?utf-8?B?QWJ4bGFSbkVzMS9PNDVSbExyS2Q1UHI3OUZ0a05nTGJONzJwUVNHdlV6c1RY?=
 =?utf-8?B?NlJHQkszcUd3T25DcjJBbGY1MGswSzBlNmx5blc5aDhuUDhpMjNJZlpHRlc4?=
 =?utf-8?B?TGo3TVVYYmR1QmFMWDZ5cXBrVHpTcWgrS1czd3FoYUxXYlVkM0RTc29tWHAw?=
 =?utf-8?B?TXNTRHNSYkxkNUYzeGFPem5Fa1plVzE3SndaNG9BN3FtOHp6bVI1aERZNnIz?=
 =?utf-8?B?azRtRnBpN0xXcXhtcE9wOWJuN1N4ZVNkSHF3WTQ4cnBsSnRpcDVJQXYweW5H?=
 =?utf-8?B?cjdqdEZSVm5LVHJVVW5rY2JmZjBCQU1pSmlOZ1QzTnlPUDJ3YmRHQk1oOFU2?=
 =?utf-8?B?aDNjQTBnZFg3UzNQelErenZjYUVvbm5yL3JhM3ZBZmpnZVRWekhYQ1VIK2RV?=
 =?utf-8?B?aHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 46aae124-9a82-47ba-fc97-08de31c7a1c1
X-MS-Exchange-CrossTenant-AuthSource: SJ5PPF89507EDE4.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2025 17:24:21.7742 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PeRmya+568ljDqJQrlRxn4hfnrvJNJ7krtBgXmKzBqvK1GLyuObwcHDYbSMRtHHTemysZbUeubYi9bh7YOCloA3+oUWGim9AFvTh99XvB2g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7551
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

On Tue, Dec 02, 2025 at 06:55:50AM +0000, Patchwork wrote:
> == Series Details ==
> 
> Series: drm/i915/display: Add initial support Xe3p_LPD
> URL   : https://patchwork.freedesktop.org/series/158344/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from xe-4178-639f325d8cbdc690de963db2fe5840444ac7ea65_FULL -> xe-pw-158344v1_FULL
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with xe-pw-158344v1_FULL absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in xe-pw-158344v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   
> 
> Participating hosts (4 -> 4)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in xe-pw-158344v1_FULL:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_async_flips@alternate-sync-async-flip@pipe-c-edp-1:
>     - shard-lnl:          NOTRUN -> [FAIL][1]
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-lnl-3/igt@kms_async_flips@alternate-sync-async-flip@pipe-c-edp-1.html
Failure unrelated.
MattA

> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in xe-pw-158344v1_FULL that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@kms_async_flips@alternate-sync-async-flip:
>     - shard-lnl:          NOTRUN -> [FAIL][2] ([Intel XE#3718] / [Intel XE#6676])
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-lnl-3/igt@kms_async_flips@alternate-sync-async-flip.html
> 
>   * igt@kms_async_flips@alternate-sync-async-flip@pipe-b-edp-1:
>     - shard-lnl:          NOTRUN -> [FAIL][3] ([Intel XE#6676]) +1 other test fail
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-lnl-3/igt@kms_async_flips@alternate-sync-async-flip@pipe-b-edp-1.html
> 
>   * igt@kms_big_fb@4-tiled-32bpp-rotate-90:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][4] ([Intel XE#316])
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-dg2-463/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html
> 
>   * igt@kms_big_fb@linear-8bpp-rotate-270:
>     - shard-lnl:          NOTRUN -> [SKIP][5] ([Intel XE#1407])
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-lnl-3/igt@kms_big_fb@linear-8bpp-rotate-270.html
> 
>   * igt@kms_big_fb@y-tiled-32bpp-rotate-90:
>     - shard-bmg:          NOTRUN -> [SKIP][6] ([Intel XE#1124]) +2 other tests skip
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-bmg-8/igt@kms_big_fb@y-tiled-32bpp-rotate-90.html
> 
>   * igt@kms_big_fb@yf-tiled-8bpp-rotate-270:
>     - shard-lnl:          NOTRUN -> [SKIP][7] ([Intel XE#1124]) +2 other tests skip
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-lnl-3/igt@kms_big_fb@yf-tiled-8bpp-rotate-270.html
> 
>   * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
>     - shard-adlp:         NOTRUN -> [SKIP][8] ([Intel XE#1124]) +2 other tests skip
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-adlp-4/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
> 
>   * igt@kms_bw@connected-linear-tiling-1-displays-3840x2160p:
>     - shard-adlp:         NOTRUN -> [SKIP][9] ([Intel XE#367]) +1 other test skip
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-adlp-4/igt@kms_bw@connected-linear-tiling-1-displays-3840x2160p.html
> 
>   * igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:
>     - shard-bmg:          [PASS][10] -> [SKIP][11] ([Intel XE#2314] / [Intel XE#2894]) +1 other test skip
>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4178-639f325d8cbdc690de963db2fe5840444ac7ea65/shard-bmg-4/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html
>    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-bmg-2/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html
> 
>   * igt@kms_bw@linear-tiling-1-displays-2560x1440p:
>     - shard-bmg:          NOTRUN -> [SKIP][12] ([Intel XE#367])
>    [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-bmg-8/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html
> 
>   * igt@kms_bw@linear-tiling-3-displays-2560x1440p:
>     - shard-lnl:          NOTRUN -> [SKIP][13] ([Intel XE#367])
>    [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-lnl-4/igt@kms_bw@linear-tiling-3-displays-2560x1440p.html
> 
>   * igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc:
>     - shard-bmg:          NOTRUN -> [SKIP][14] ([Intel XE#2887]) +4 other tests skip
>    [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-bmg-2/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc.html
> 
>   * igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs:
>     - shard-adlp:         NOTRUN -> [SKIP][15] ([Intel XE#455] / [Intel XE#787]) +7 other tests skip
>    [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-adlp-4/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs.html
> 
>   * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs:
>     - shard-lnl:          NOTRUN -> [SKIP][16] ([Intel XE#3432])
>    [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-lnl-3/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs.html
> 
>   * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:
>     - shard-adlp:         NOTRUN -> [SKIP][17] ([Intel XE#3442])
>    [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-adlp-4/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html
> 
>   * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-b-hdmi-a-1:
>     - shard-adlp:         NOTRUN -> [SKIP][18] ([Intel XE#787]) +11 other tests skip
>    [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-adlp-4/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-b-hdmi-a-1.html
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
>     - shard-dg2-set2:     [PASS][19] -> [INCOMPLETE][20] ([Intel XE#2705] / [Intel XE#4212] / [Intel XE#4345])
>    [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4178-639f325d8cbdc690de963db2fe5840444ac7ea65/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
>    [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-dp-4:
>     - shard-dg2-set2:     [PASS][21] -> [INCOMPLETE][22] ([Intel XE#2705] / [Intel XE#4212])
>    [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4178-639f325d8cbdc690de963db2fe5840444ac7ea65/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-dp-4.html
>    [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-dp-4.html
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs:
>     - shard-lnl:          NOTRUN -> [SKIP][23] ([Intel XE#2887]) +3 other tests skip
>    [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-lnl-3/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs.html
> 
>   * igt@kms_cdclk@plane-scaling:
>     - shard-lnl:          NOTRUN -> [SKIP][24] ([Intel XE#4416]) +3 other tests skip
>    [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-lnl-4/igt@kms_cdclk@plane-scaling.html
> 
>   * igt@kms_chamelium_frames@hdmi-aspect-ratio:
>     - shard-adlp:         NOTRUN -> [SKIP][25] ([Intel XE#373]) +1 other test skip
>    [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-adlp-4/igt@kms_chamelium_frames@hdmi-aspect-ratio.html
> 
>   * igt@kms_chamelium_frames@hdmi-cmp-planes-random:
>     - shard-bmg:          NOTRUN -> [SKIP][26] ([Intel XE#2252]) +3 other tests skip
>    [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-bmg-2/igt@kms_chamelium_frames@hdmi-cmp-planes-random.html
> 
>   * igt@kms_chamelium_hpd@vga-hpd-enable-disable-mode:
>     - shard-lnl:          NOTRUN -> [SKIP][27] ([Intel XE#373]) +3 other tests skip
>    [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-lnl-3/igt@kms_chamelium_hpd@vga-hpd-enable-disable-mode.html
> 
>   * igt@kms_colorop@plane-xr24-xr24-ctm_3x4_bt709_dec_enc:
>     - shard-bmg:          NOTRUN -> [SKIP][28] ([Intel XE#6704]) +1 other test skip
>    [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-bmg-8/igt@kms_colorop@plane-xr24-xr24-ctm_3x4_bt709_dec_enc.html
> 
>   * igt@kms_colorop@plane-xr24-xr24-multiply_inv_125:
>     - shard-lnl:          NOTRUN -> [SKIP][29] ([Intel XE#6704]) +3 other tests skip
>    [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-lnl-3/igt@kms_colorop@plane-xr24-xr24-multiply_inv_125.html
> 
>   * igt@kms_colorop@plane-xr30-xr30-ctm_3x4_bt709_enc:
>     - shard-adlp:         NOTRUN -> [SKIP][30] ([Intel XE#6704]) +1 other test skip
>    [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-adlp-4/igt@kms_colorop@plane-xr30-xr30-ctm_3x4_bt709_enc.html
> 
>   * igt@kms_content_protection@uevent:
>     - shard-bmg:          NOTRUN -> [FAIL][31] ([Intel XE#6707]) +1 other test fail
>    [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-bmg-8/igt@kms_content_protection@uevent.html
> 
>   * igt@kms_cursor_crc@cursor-onscreen-32x32:
>     - shard-bmg:          NOTRUN -> [SKIP][32] ([Intel XE#2320])
>    [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-bmg-8/igt@kms_cursor_crc@cursor-onscreen-32x32.html
> 
>   * igt@kms_cursor_crc@cursor-random-512x170:
>     - shard-adlp:         NOTRUN -> [SKIP][33] ([Intel XE#308])
>    [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-adlp-4/igt@kms_cursor_crc@cursor-random-512x170.html
> 
>   * igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic:
>     - shard-bmg:          [PASS][34] -> [SKIP][35] ([Intel XE#2291]) +2 other tests skip
>    [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4178-639f325d8cbdc690de963db2fe5840444ac7ea65/shard-bmg-1/igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic.html
>    [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-bmg-6/igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic.html
> 
>   * igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:
>     - shard-lnl:          NOTRUN -> [SKIP][36] ([Intel XE#309])
>    [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-lnl-4/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html
> 
>   * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic:
>     - shard-bmg:          NOTRUN -> [SKIP][37] ([Intel XE#2291])
>    [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-bmg-2/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic.html
> 
>   * igt@kms_dsc@dsc-basic:
>     - shard-bmg:          NOTRUN -> [SKIP][38] ([Intel XE#2244])
>    [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-bmg-8/igt@kms_dsc@dsc-basic.html
> 
>   * igt@kms_feature_discovery@dp-mst:
>     - shard-bmg:          NOTRUN -> [SKIP][39] ([Intel XE#2375])
>    [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-bmg-2/igt@kms_feature_discovery@dp-mst.html
> 
>   * igt@kms_flip@2x-absolute-wf_vblank:
>     - shard-adlp:         NOTRUN -> [SKIP][40] ([Intel XE#310])
>    [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-adlp-4/igt@kms_flip@2x-absolute-wf_vblank.html
> 
>   * igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-dp2-hdmi-a3:
>     - shard-bmg:          NOTRUN -> [ABORT][41] ([Intel XE#6675]) +6 other tests abort
>    [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-bmg-3/igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-dp2-hdmi-a3.html
> 
>   * igt@kms_flip@2x-modeset-vs-vblank-race-interruptible:
>     - shard-lnl:          NOTRUN -> [SKIP][42] ([Intel XE#1421])
>    [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-lnl-3/igt@kms_flip@2x-modeset-vs-vblank-race-interruptible.html
> 
>   * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:
>     - shard-bmg:          [PASS][43] -> [SKIP][44] ([Intel XE#2316]) +3 other tests skip
>    [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4178-639f325d8cbdc690de963db2fe5840444ac7ea65/shard-bmg-4/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html
>    [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-bmg-2/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html
> 
>   * igt@kms_flip@flip-vs-expired-vblank-interruptible:
>     - shard-dg2-set2:     [PASS][45] -> [FAIL][46] ([Intel XE#301]) +1 other test fail
>    [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4178-639f325d8cbdc690de963db2fe5840444ac7ea65/shard-dg2-434/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
>    [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-dg2-464/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode:
>     - shard-bmg:          NOTRUN -> [SKIP][47] ([Intel XE#2293]) +2 other tests skip
>    [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-bmg-8/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling:
>     - shard-lnl:          NOTRUN -> [SKIP][48] ([Intel XE#1401] / [Intel XE#1745])
>    [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-lnl-3/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@pipe-a-default-mode:
>     - shard-lnl:          NOTRUN -> [SKIP][49] ([Intel XE#1401])
>    [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-lnl-3/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@pipe-a-default-mode.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling:
>     - shard-bmg:          NOTRUN -> [SKIP][50] ([Intel XE#2293] / [Intel XE#2380]) +2 other tests skip
>    [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-bmg-3/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-blt:
>     - shard-lnl:          NOTRUN -> [SKIP][51] ([Intel XE#651]) +1 other test skip
>    [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-lnl-3/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen:
>     - shard-adlp:         NOTRUN -> [SKIP][52] ([Intel XE#651]) +1 other test skip
>    [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-adlp-4/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-render:
>     - shard-adlp:         NOTRUN -> [SKIP][53] ([Intel XE#656]) +4 other tests skip
>    [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-adlp-4/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt:
>     - shard-bmg:          NOTRUN -> [SKIP][54] ([Intel XE#2312]) +2 other tests skip
>    [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt:
>     - shard-bmg:          NOTRUN -> [SKIP][55] ([Intel XE#4141]) +4 other tests skip
>    [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscreen-pri-indfb-draw-render:
>     - shard-bmg:          NOTRUN -> [SKIP][56] ([Intel XE#2311]) +7 other tests skip
>    [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscreen-pri-indfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-render:
>     - shard-adlp:         NOTRUN -> [SKIP][57] ([Intel XE#653]) +2 other tests skip
>    [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-adlp-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-mmap-wc:
>     - shard-lnl:          NOTRUN -> [SKIP][58] ([Intel XE#656]) +8 other tests skip
>    [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-lnl-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-render:
>     - shard-bmg:          NOTRUN -> [SKIP][59] ([Intel XE#2313]) +4 other tests skip
>    [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-render.html
> 
>   * igt@kms_hdr@bpc-switch:
>     - shard-adlp:         NOTRUN -> [SKIP][60] ([Intel XE#455]) +4 other tests skip
>    [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-adlp-4/igt@kms_hdr@bpc-switch.html
> 
>   * igt@kms_pipe_crc_basic@suspend-read-crc:
>     - shard-adlp:         NOTRUN -> [ABORT][61] ([Intel XE#2953] / [Intel XE#6675])
>    [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-adlp-6/igt@kms_pipe_crc_basic@suspend-read-crc.html
> 
>   * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-edp-1:
>     - shard-lnl:          [PASS][62] -> [ABORT][63] ([Intel XE#6675])
>    [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4178-639f325d8cbdc690de963db2fe5840444ac7ea65/shard-lnl-3/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-edp-1.html
>    [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-lnl-4/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-edp-1.html
> 
>   * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-1:
>     - shard-adlp:         NOTRUN -> [ABORT][64] ([Intel XE#6675])
>    [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-adlp-6/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-1.html
> 
>   * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-6:
>     - shard-dg2-set2:     NOTRUN -> [ABORT][65] ([Intel XE#6675]) +1 other test abort
>    [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-dg2-463/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-6.html
> 
>   * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-hdmi-a-1:
>     - shard-adlp:         NOTRUN -> [DMESG-WARN][66] ([Intel XE#2953] / [Intel XE#4173])
>    [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-adlp-6/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-hdmi-a-1.html
> 
>   * igt@kms_plane_scaling@2x-scaler-multi-pipe:
>     - shard-bmg:          [PASS][67] -> [SKIP][68] ([Intel XE#2571])
>    [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4178-639f325d8cbdc690de963db2fe5840444ac7ea65/shard-bmg-4/igt@kms_plane_scaling@2x-scaler-multi-pipe.html
>    [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-bmg-2/igt@kms_plane_scaling@2x-scaler-multi-pipe.html
> 
>   * igt@kms_pm_rpm@system-suspend-idle:
>     - shard-dg2-set2:     [PASS][69] -> [ABORT][70] ([Intel XE#6675])
>    [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4178-639f325d8cbdc690de963db2fe5840444ac7ea65/shard-dg2-436/igt@kms_pm_rpm@system-suspend-idle.html
>    [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-dg2-435/igt@kms_pm_rpm@system-suspend-idle.html
> 
>   * igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-sf:
>     - shard-lnl:          NOTRUN -> [SKIP][71] ([Intel XE#1406] / [Intel XE#2893])
>    [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-lnl-4/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-sf.html
> 
>   * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf:
>     - shard-bmg:          NOTRUN -> [SKIP][72] ([Intel XE#1406] / [Intel XE#1489])
>    [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-bmg-2/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf.html
> 
>   * igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf:
>     - shard-lnl:          NOTRUN -> [SKIP][73] ([Intel XE#1406] / [Intel XE#2893] / [Intel XE#4608])
>    [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-lnl-3/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf.html
> 
>   * igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf@pipe-a-edp-1:
>     - shard-lnl:          NOTRUN -> [SKIP][74] ([Intel XE#1406] / [Intel XE#4608]) +1 other test skip
>    [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-lnl-3/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf@pipe-a-edp-1.html
> 
>   * igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area:
>     - shard-adlp:         NOTRUN -> [SKIP][75] ([Intel XE#1406] / [Intel XE#1489]) +1 other test skip
>    [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-adlp-4/igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area.html
> 
>   * igt@kms_psr@fbc-pr-sprite-plane-onoff:
>     - shard-bmg:          NOTRUN -> [SKIP][76] ([Intel XE#1406] / [Intel XE#2234] / [Intel XE#2850]) +2 other tests skip
>    [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-bmg-2/igt@kms_psr@fbc-pr-sprite-plane-onoff.html
> 
>   * igt@kms_psr@fbc-pr-suspend:
>     - shard-lnl:          NOTRUN -> [SKIP][77] ([Intel XE#1406])
>    [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-lnl-3/igt@kms_psr@fbc-pr-suspend.html
> 
>   * igt@kms_psr@fbc-psr2-basic:
>     - shard-adlp:         NOTRUN -> [SKIP][78] ([Intel XE#1406] / [Intel XE#2850] / [Intel XE#929]) +3 other tests skip
>    [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-adlp-6/igt@kms_psr@fbc-psr2-basic.html
>     - shard-dg2-set2:     NOTRUN -> [SKIP][79] ([Intel XE#1406] / [Intel XE#2850] / [Intel XE#929])
>    [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-dg2-463/igt@kms_psr@fbc-psr2-basic.html
> 
>   * igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:
>     - shard-lnl:          NOTRUN -> [SKIP][80] ([Intel XE#1127])
>    [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-lnl-3/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html
> 
>   * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
>     - shard-bmg:          NOTRUN -> [SKIP][81] ([Intel XE#2330])
>    [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-bmg-8/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html
> 
>   * igt@kms_rotation_crc@sprite-rotation-270:
>     - shard-lnl:          NOTRUN -> [SKIP][82] ([Intel XE#3414] / [Intel XE#3904])
>    [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-lnl-3/igt@kms_rotation_crc@sprite-rotation-270.html
> 
>   * igt@kms_setmode@basic@pipe-a-hdmi-a-3:
>     - shard-bmg:          [PASS][83] -> [FAIL][84] ([Intel XE#6361]) +1 other test fail
>    [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4178-639f325d8cbdc690de963db2fe5840444ac7ea65/shard-bmg-5/igt@kms_setmode@basic@pipe-a-hdmi-a-3.html
>    [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-bmg-6/igt@kms_setmode@basic@pipe-a-hdmi-a-3.html
> 
>   * igt@kms_setmode@invalid-clone-single-crtc-stealing:
>     - shard-bmg:          [PASS][85] -> [SKIP][86] ([Intel XE#1435])
>    [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4178-639f325d8cbdc690de963db2fe5840444ac7ea65/shard-bmg-4/igt@kms_setmode@invalid-clone-single-crtc-stealing.html
>    [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-bmg-2/igt@kms_setmode@invalid-clone-single-crtc-stealing.html
> 
>   * igt@kms_vblank@ts-continuation-dpms-suspend:
>     - shard-lnl:          NOTRUN -> [ABORT][87] ([Intel XE#6675]) +1 other test abort
>    [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-lnl-4/igt@kms_vblank@ts-continuation-dpms-suspend.html
> 
>   * igt@kms_vblank@ts-continuation-dpms-suspend@pipe-c-edp-1:
>     - shard-lnl:          NOTRUN -> [INCOMPLETE][88] ([Intel XE#4488])
>    [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-lnl-4/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-c-edp-1.html
> 
>   * igt@xe_compute@ccs-mode-basic:
>     - shard-lnl:          NOTRUN -> [SKIP][89] ([Intel XE#1447])
>    [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-lnl-3/igt@xe_compute@ccs-mode-basic.html
> 
>   * igt@xe_compute_preempt@compute-preempt-many-all-ram:
>     - shard-adlp:         NOTRUN -> [SKIP][90] ([Intel XE#6360])
>    [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-adlp-4/igt@xe_compute_preempt@compute-preempt-many-all-ram.html
> 
>   * igt@xe_copy_basic@mem-page-copy-17:
>     - shard-adlp:         NOTRUN -> [SKIP][91] ([Intel XE#5300])
>    [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-adlp-4/igt@xe_copy_basic@mem-page-copy-17.html
> 
>   * igt@xe_eu_stall@invalid-sampling-rate:
>     - shard-adlp:         NOTRUN -> [SKIP][92] ([Intel XE#5626])
>    [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-adlp-4/igt@xe_eu_stall@invalid-sampling-rate.html
> 
>   * igt@xe_eudebug@basic-vm-access-faultable:
>     - shard-adlp:         NOTRUN -> [SKIP][93] ([Intel XE#4837] / [Intel XE#5565]) +1 other test skip
>    [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-adlp-4/igt@xe_eudebug@basic-vm-access-faultable.html
> 
>   * igt@xe_eudebug_online@interrupt-all-set-breakpoint-faultable:
>     - shard-lnl:          NOTRUN -> [SKIP][94] ([Intel XE#4837]) +2 other tests skip
>    [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-lnl-3/igt@xe_eudebug_online@interrupt-all-set-breakpoint-faultable.html
> 
>   * igt@xe_eudebug_online@set-breakpoint:
>     - shard-bmg:          NOTRUN -> [SKIP][95] ([Intel XE#4837]) +4 other tests skip
>    [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-bmg-8/igt@xe_eudebug_online@set-breakpoint.html
> 
>   * igt@xe_evict@evict-beng-mixed-many-threads-large:
>     - shard-adlp:         NOTRUN -> [SKIP][96] ([Intel XE#261])
>    [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-adlp-4/igt@xe_evict@evict-beng-mixed-many-threads-large.html
> 
>   * igt@xe_evict@evict-large-external:
>     - shard-adlp:         NOTRUN -> [SKIP][97] ([Intel XE#261] / [Intel XE#5564])
>    [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-adlp-4/igt@xe_evict@evict-large-external.html
> 
>   * igt@xe_evict@evict-mixed-many-threads-small:
>     - shard-bmg:          NOTRUN -> [INCOMPLETE][98] ([Intel XE#6321])
>    [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-bmg-2/igt@xe_evict@evict-mixed-many-threads-small.html
> 
>   * igt@xe_evict@evict-small-cm:
>     - shard-adlp:         NOTRUN -> [SKIP][99] ([Intel XE#261] / [Intel XE#5564] / [Intel XE#688])
>    [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-adlp-6/igt@xe_evict@evict-small-cm.html
> 
>   * igt@xe_evict@evict-threads-small:
>     - shard-lnl:          NOTRUN -> [SKIP][100] ([Intel XE#688]) +3 other tests skip
>    [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-lnl-3/igt@xe_evict@evict-threads-small.html
> 
>   * igt@xe_exec_basic@multigpu-no-exec-null-rebind:
>     - shard-adlp:         NOTRUN -> [SKIP][101] ([Intel XE#1392] / [Intel XE#5575]) +2 other tests skip
>    [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-adlp-6/igt@xe_exec_basic@multigpu-no-exec-null-rebind.html
> 
>   * igt@xe_exec_basic@multigpu-no-exec-rebind:
>     - shard-lnl:          NOTRUN -> [SKIP][102] ([Intel XE#1392]) +1 other test skip
>    [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-lnl-4/igt@xe_exec_basic@multigpu-no-exec-rebind.html
> 
>   * igt@xe_exec_basic@multigpu-once-basic-defer-bind:
>     - shard-bmg:          NOTRUN -> [SKIP][103] ([Intel XE#2322]) +2 other tests skip
>    [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-bmg-2/igt@xe_exec_basic@multigpu-once-basic-defer-bind.html
> 
>   * igt@xe_exec_fault_mode@many-bindexecqueue-imm:
>     - shard-adlp:         NOTRUN -> [SKIP][104] ([Intel XE#288] / [Intel XE#5561]) +7 other tests skip
>    [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-adlp-6/igt@xe_exec_fault_mode@many-bindexecqueue-imm.html
>     - shard-dg2-set2:     NOTRUN -> [SKIP][105] ([Intel XE#288]) +1 other test skip
>    [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-dg2-463/igt@xe_exec_fault_mode@many-bindexecqueue-imm.html
> 
>   * igt@xe_exec_mix_modes@exec-spinner-interrupted-lr:
>     - shard-adlp:         NOTRUN -> [SKIP][106] ([Intel XE#2360])
>    [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-adlp-4/igt@xe_exec_mix_modes@exec-spinner-interrupted-lr.html
> 
>   * igt@xe_exec_system_allocator@many-64k-mmap-new-huge-nomemset:
>     - shard-lnl:          NOTRUN -> [SKIP][107] ([Intel XE#5007])
>    [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-lnl-3/igt@xe_exec_system_allocator@many-64k-mmap-new-huge-nomemset.html
> 
>   * igt@xe_exec_system_allocator@many-large-execqueues-mmap-shared-remap-dontunmap-eocheck:
>     - shard-adlp:         NOTRUN -> [SKIP][108] ([Intel XE#4915]) +67 other tests skip
>    [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-adlp-6/igt@xe_exec_system_allocator@many-large-execqueues-mmap-shared-remap-dontunmap-eocheck.html
> 
>   * igt@xe_exec_system_allocator@process-many-stride-mmap-remap-ro-dontunmap:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][109] ([Intel XE#4915]) +11 other tests skip
>    [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-dg2-463/igt@xe_exec_system_allocator@process-many-stride-mmap-remap-ro-dontunmap.html
> 
>   * igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-huge-nomemset:
>     - shard-lnl:          NOTRUN -> [SKIP][110] ([Intel XE#4943]) +9 other tests skip
>    [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-lnl-3/igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-huge-nomemset.html
> 
>   * igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-free-huge:
>     - shard-bmg:          NOTRUN -> [SKIP][111] ([Intel XE#4943]) +4 other tests skip
>    [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-bmg-8/igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-free-huge.html
> 
>   * igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv:
>     - shard-lnl:          NOTRUN -> [ABORT][112] ([Intel XE#4757])
>    [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-lnl-3/igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv.html
> 
>   * igt@xe_mmap@pci-membarrier:
>     - shard-lnl:          NOTRUN -> [SKIP][113] ([Intel XE#5100])
>    [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-lnl-3/igt@xe_mmap@pci-membarrier.html
> 
>   * igt@xe_module_load@load:
>     - shard-bmg:          ([PASS][114], [PASS][115], [PASS][116], [PASS][117], [PASS][118], [PASS][119], [PASS][120], [PASS][121], [PASS][122], [PASS][123], [PASS][124], [PASS][125], [PASS][126], [PASS][127], [PASS][128], [PASS][129], [PASS][130], [PASS][131], [PASS][132], [PASS][133], [PASS][134], [PASS][135], [PASS][136], [PASS][137]) -> ([SKIP][138], [PASS][139], [PASS][140], [PASS][141], [PASS][142], [PASS][143], [PASS][144], [PASS][145], [PASS][146], [PASS][147], [PASS][148], [PASS][149], [PASS][150], [PASS][151], [PASS][152], [PASS][153], [PASS][154], [PASS][155], [PASS][156], [PASS][157], [PASS][158], [PASS][159], [PASS][160], [PASS][161], [PASS][162], [PASS][163]) ([Intel XE#2457])
>    [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4178-639f325d8cbdc690de963db2fe5840444ac7ea65/shard-bmg-2/igt@xe_module_load@load.html
>    [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4178-639f325d8cbdc690de963db2fe5840444ac7ea65/shard-bmg-4/igt@xe_module_load@load.html
>    [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4178-639f325d8cbdc690de963db2fe5840444ac7ea65/shard-bmg-6/igt@xe_module_load@load.html
>    [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4178-639f325d8cbdc690de963db2fe5840444ac7ea65/shard-bmg-1/igt@xe_module_load@load.html
>    [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4178-639f325d8cbdc690de963db2fe5840444ac7ea65/shard-bmg-8/igt@xe_module_load@load.html
>    [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4178-639f325d8cbdc690de963db2fe5840444ac7ea65/shard-bmg-3/igt@xe_module_load@load.html
>    [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4178-639f325d8cbdc690de963db2fe5840444ac7ea65/shard-bmg-3/igt@xe_module_load@load.html
>    [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4178-639f325d8cbdc690de963db2fe5840444ac7ea65/shard-bmg-5/igt@xe_module_load@load.html
>    [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4178-639f325d8cbdc690de963db2fe5840444ac7ea65/shard-bmg-5/igt@xe_module_load@load.html
>    [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4178-639f325d8cbdc690de963db2fe5840444ac7ea65/shard-bmg-5/igt@xe_module_load@load.html
>    [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4178-639f325d8cbdc690de963db2fe5840444ac7ea65/shard-bmg-5/igt@xe_module_load@load.html
>    [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4178-639f325d8cbdc690de963db2fe5840444ac7ea65/shard-bmg-1/igt@xe_module_load@load.html
>    [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4178-639f325d8cbdc690de963db2fe5840444ac7ea65/shard-bmg-7/igt@xe_module_load@load.html
>    [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4178-639f325d8cbdc690de963db2fe5840444ac7ea65/shard-bmg-7/igt@xe_module_load@load.html
>    [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4178-639f325d8cbdc690de963db2fe5840444ac7ea65/shard-bmg-4/igt@xe_module_load@load.html
>    [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4178-639f325d8cbdc690de963db2fe5840444ac7ea65/shard-bmg-4/igt@xe_module_load@load.html
>    [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4178-639f325d8cbdc690de963db2fe5840444ac7ea65/shard-bmg-8/igt@xe_module_load@load.html
>    [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4178-639f325d8cbdc690de963db2fe5840444ac7ea65/shard-bmg-8/igt@xe_module_load@load.html
>    [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4178-639f325d8cbdc690de963db2fe5840444ac7ea65/shard-bmg-7/igt@xe_module_load@load.html
>    [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4178-639f325d8cbdc690de963db2fe5840444ac7ea65/shard-bmg-6/igt@xe_module_load@load.html
>    [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4178-639f325d8cbdc690de963db2fe5840444ac7ea65/shard-bmg-6/igt@xe_module_load@load.html
>    [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4178-639f325d8cbdc690de963db2fe5840444ac7ea65/shard-bmg-3/igt@xe_module_load@load.html
>    [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4178-639f325d8cbdc690de963db2fe5840444ac7ea65/shard-bmg-6/igt@xe_module_load@load.html
>    [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4178-639f325d8cbdc690de963db2fe5840444ac7ea65/shard-bmg-2/igt@xe_module_load@load.html
>    [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-bmg-8/igt@xe_module_load@load.html
>    [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-bmg-1/igt@xe_module_load@load.html
>    [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-bmg-1/igt@xe_module_load@load.html
>    [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-bmg-1/igt@xe_module_load@load.html
>    [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-bmg-7/igt@xe_module_load@load.html
>    [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-bmg-8/igt@xe_module_load@load.html
>    [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-bmg-7/igt@xe_module_load@load.html
>    [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-bmg-5/igt@xe_module_load@load.html
>    [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-bmg-5/igt@xe_module_load@load.html
>    [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-bmg-5/igt@xe_module_load@load.html
>    [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-bmg-6/igt@xe_module_load@load.html
>    [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-bmg-2/igt@xe_module_load@load.html
>    [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-bmg-2/igt@xe_module_load@load.html
>    [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-bmg-6/igt@xe_module_load@load.html
>    [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-bmg-3/igt@xe_module_load@load.html
>    [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-bmg-3/igt@xe_module_load@load.html
>    [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-bmg-6/igt@xe_module_load@load.html
>    [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-bmg-6/igt@xe_module_load@load.html
>    [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-bmg-8/igt@xe_module_load@load.html
>    [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-bmg-4/igt@xe_module_load@load.html
>    [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-bmg-8/igt@xe_module_load@load.html
>    [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-bmg-4/igt@xe_module_load@load.html
>    [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-bmg-4/igt@xe_module_load@load.html
>    [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-bmg-8/igt@xe_module_load@load.html
>    [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-bmg-3/igt@xe_module_load@load.html
>    [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-bmg-2/igt@xe_module_load@load.html
> 
>   * igt@xe_oa@invalid-oa-format-id:
>     - shard-adlp:         NOTRUN -> [SKIP][164] ([Intel XE#3573])
>    [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-adlp-4/igt@xe_oa@invalid-oa-format-id.html
> 
>   * igt@xe_peer2peer@read:
>     - shard-adlp:         NOTRUN -> [SKIP][165] ([Intel XE#1061])
>    [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-adlp-4/igt@xe_peer2peer@read.html
> 
>   * igt@xe_pm@d3cold-mmap-vram:
>     - shard-lnl:          NOTRUN -> [SKIP][166] ([Intel XE#2284] / [Intel XE#366])
>    [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-lnl-3/igt@xe_pm@d3cold-mmap-vram.html
> 
>   * igt@xe_pm@s2idle-basic-exec:
>     - shard-adlp:         [PASS][167] -> [ABORT][168] ([Intel XE#6675]) +5 other tests abort
>    [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4178-639f325d8cbdc690de963db2fe5840444ac7ea65/shard-adlp-6/igt@xe_pm@s2idle-basic-exec.html
>    [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-adlp-3/igt@xe_pm@s2idle-basic-exec.html
> 
>   * igt@xe_pm@s2idle-vm-bind-prefetch:
>     - shard-bmg:          [PASS][169] -> [ABORT][170] ([Intel XE#6675])
>    [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4178-639f325d8cbdc690de963db2fe5840444ac7ea65/shard-bmg-1/igt@xe_pm@s2idle-vm-bind-prefetch.html
>    [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-bmg-6/igt@xe_pm@s2idle-vm-bind-prefetch.html
> 
>   * igt@xe_pm@s3-d3cold-basic-exec:
>     - shard-bmg:          NOTRUN -> [SKIP][171] ([Intel XE#2284])
>    [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-bmg-8/igt@xe_pm@s3-d3cold-basic-exec.html
> 
>   * igt@xe_pm@vram-d3cold-threshold:
>     - shard-lnl:          NOTRUN -> [SKIP][172] ([Intel XE#579])
>    [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-lnl-4/igt@xe_pm@vram-d3cold-threshold.html
> 
>   * igt@xe_pmu@engine-activity-accuracy-90:
>     - shard-lnl:          [PASS][173] -> [FAIL][174] ([Intel XE#6251]) +4 other tests fail
>    [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4178-639f325d8cbdc690de963db2fe5840444ac7ea65/shard-lnl-2/igt@xe_pmu@engine-activity-accuracy-90.html
>    [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-lnl-2/igt@xe_pmu@engine-activity-accuracy-90.html
> 
>   * igt@xe_pxp@pxp-termination-key-update-post-termination-irq:
>     - shard-bmg:          NOTRUN -> [SKIP][175] ([Intel XE#4733])
>    [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-bmg-2/igt@xe_pxp@pxp-termination-key-update-post-termination-irq.html
> 
>   * igt@xe_query@multigpu-query-hwconfig:
>     - shard-lnl:          NOTRUN -> [SKIP][176] ([Intel XE#944])
>    [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-lnl-3/igt@xe_query@multigpu-query-hwconfig.html
> 
>   * igt@xe_query@multigpu-query-topology:
>     - shard-adlp:         NOTRUN -> [SKIP][177] ([Intel XE#944])
>    [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-adlp-4/igt@xe_query@multigpu-query-topology.html
> 
>   * igt@xe_render_copy@render-stress-1-copies:
>     - shard-adlp:         NOTRUN -> [SKIP][178] ([Intel XE#4814] / [Intel XE#5614])
>    [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-adlp-4/igt@xe_render_copy@render-stress-1-copies.html
> 
>   * igt@xe_survivability@i2c-functionality:
>     - shard-lnl:          NOTRUN -> [SKIP][179] ([Intel XE#6529])
>    [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-lnl-3/igt@xe_survivability@i2c-functionality.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@kms_flip@2x-flip-vs-dpms:
>     - shard-bmg:          [SKIP][180] ([Intel XE#2316]) -> [PASS][181]
>    [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4178-639f325d8cbdc690de963db2fe5840444ac7ea65/shard-bmg-6/igt@kms_flip@2x-flip-vs-dpms.html
>    [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-bmg-4/igt@kms_flip@2x-flip-vs-dpms.html
> 
>   * igt@kms_pipe_crc_basic@read-crc-frame-sequence:
>     - shard-bmg:          [ABORT][182] ([Intel XE#1727]) -> [PASS][183] +1 other test pass
>    [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4178-639f325d8cbdc690de963db2fe5840444ac7ea65/shard-bmg-2/igt@kms_pipe_crc_basic@read-crc-frame-sequence.html
>    [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-bmg-8/igt@kms_pipe_crc_basic@read-crc-frame-sequence.html
> 
>   * igt@kms_psr@psr2-suspend@edp-1:
>     - shard-lnl:          [ABORT][184] ([Intel XE#2625] / [Intel XE#6675]) -> [PASS][185] +1 other test pass
>    [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4178-639f325d8cbdc690de963db2fe5840444ac7ea65/shard-lnl-8/igt@kms_psr@psr2-suspend@edp-1.html
>    [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-lnl-4/igt@kms_psr@psr2-suspend@edp-1.html
> 
>   * igt@kms_setmode@basic@pipe-b-edp-1:
>     - shard-lnl:          [FAIL][186] ([Intel XE#6361]) -> [PASS][187] +2 other tests pass
>    [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4178-639f325d8cbdc690de963db2fe5840444ac7ea65/shard-lnl-8/igt@kms_setmode@basic@pipe-b-edp-1.html
>    [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-lnl-4/igt@kms_setmode@basic@pipe-b-edp-1.html
> 
>   * igt@xe_pm@s2idle-basic-exec:
>     - shard-bmg:          [ABORT][188] ([Intel XE#6675]) -> [PASS][189] +1 other test pass
>    [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4178-639f325d8cbdc690de963db2fe5840444ac7ea65/shard-bmg-4/igt@xe_pm@s2idle-basic-exec.html
>    [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-bmg-2/igt@xe_pm@s2idle-basic-exec.html
> 
>   * igt@xe_pm@s2idle-exec-after:
>     - shard-lnl:          [ABORT][190] ([Intel XE#6675]) -> [PASS][191]
>    [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4178-639f325d8cbdc690de963db2fe5840444ac7ea65/shard-lnl-3/igt@xe_pm@s2idle-exec-after.html
>    [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-lnl-3/igt@xe_pm@s2idle-exec-after.html
> 
>   * igt@xe_pm@s3-multiple-execs:
>     - shard-adlp:         [ABORT][192] ([Intel XE#6675]) -> [PASS][193] +1 other test pass
>    [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4178-639f325d8cbdc690de963db2fe5840444ac7ea65/shard-adlp-1/igt@xe_pm@s3-multiple-execs.html
>    [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-adlp-6/igt@xe_pm@s3-multiple-execs.html
>     - shard-dg2-set2:     [ABORT][194] ([Intel XE#6675]) -> [PASS][195]
>    [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4178-639f325d8cbdc690de963db2fe5840444ac7ea65/shard-dg2-436/igt@xe_pm@s3-multiple-execs.html
>    [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-dg2-463/igt@xe_pm@s3-multiple-execs.html
> 
>   * igt@xe_pmu@engine-activity-accuracy-50@engine-drm_xe_engine_class_video_enhance0:
>     - shard-lnl:          [FAIL][196] ([Intel XE#6251]) -> [PASS][197]
>    [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4178-639f325d8cbdc690de963db2fe5840444ac7ea65/shard-lnl-1/igt@xe_pmu@engine-activity-accuracy-50@engine-drm_xe_engine_class_video_enhance0.html
>    [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-lnl-3/igt@xe_pmu@engine-activity-accuracy-50@engine-drm_xe_engine_class_video_enhance0.html
> 
>   
> #### Warnings ####
> 
>   * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
>     - shard-adlp:         [FAIL][198] ([Intel XE#1231]) -> [FAIL][199] ([Intel XE#1231] / [Intel XE#6699]) +5 other tests fail
>    [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4178-639f325d8cbdc690de963db2fe5840444ac7ea65/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
>    [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
> 
>   * igt@kms_flip@2x-flip-vs-suspend-interruptible:
>     - shard-bmg:          [SKIP][200] ([Intel XE#2316]) -> [ABORT][201] ([Intel XE#6675])
>    [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4178-639f325d8cbdc690de963db2fe5840444ac7ea65/shard-bmg-2/igt@kms_flip@2x-flip-vs-suspend-interruptible.html
>    [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-bmg-3/igt@kms_flip@2x-flip-vs-suspend-interruptible.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc:
>     - shard-bmg:          [SKIP][202] ([Intel XE#2312]) -> [SKIP][203] ([Intel XE#2311]) +2 other tests skip
>    [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4178-639f325d8cbdc690de963db2fe5840444ac7ea65/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc.html
>    [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-render:
>     - shard-bmg:          [SKIP][204] ([Intel XE#2312]) -> [SKIP][205] ([Intel XE#4141])
>    [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4178-639f325d8cbdc690de963db2fe5840444ac7ea65/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-render.html
>    [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:
>     - shard-bmg:          [SKIP][206] ([Intel XE#4141]) -> [SKIP][207] ([Intel XE#2312]) +2 other tests skip
>    [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4178-639f325d8cbdc690de963db2fe5840444ac7ea65/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html
>    [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-draw-blt:
>     - shard-bmg:          [SKIP][208] ([Intel XE#2311]) -> [SKIP][209] ([Intel XE#2312]) +8 other tests skip
>    [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4178-639f325d8cbdc690de963db2fe5840444ac7ea65/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-draw-blt.html
>    [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff:
>     - shard-bmg:          [SKIP][210] ([Intel XE#2312]) -> [SKIP][211] ([Intel XE#2313]) +3 other tests skip
>    [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4178-639f325d8cbdc690de963db2fe5840444ac7ea65/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff.html
>    [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen:
>     - shard-bmg:          [SKIP][212] ([Intel XE#2313]) -> [SKIP][213] ([Intel XE#2312]) +10 other tests skip
>    [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4178-639f325d8cbdc690de963db2fe5840444ac7ea65/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html
>    [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html
> 
>   * igt@kms_joiner@basic-big-joiner:
>     - shard-bmg:          [SKIP][214] ([Intel XE#346]) -> [SKIP][215] ([Intel XE#346] / [Intel XE#6590]) +1 other test skip
>    [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4178-639f325d8cbdc690de963db2fe5840444ac7ea65/shard-bmg-7/igt@kms_joiner@basic-big-joiner.html
>    [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-bmg-5/igt@kms_joiner@basic-big-joiner.html
> 
>   * igt@kms_joiner@basic-ultra-joiner:
>     - shard-bmg:          [SKIP][216] ([Intel XE#2927]) -> [SKIP][217] ([Intel XE#2927] / [Intel XE#6590])
>    [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4178-639f325d8cbdc690de963db2fe5840444ac7ea65/shard-bmg-8/igt@kms_joiner@basic-ultra-joiner.html
>    [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-bmg-1/igt@kms_joiner@basic-ultra-joiner.html
> 
>   * igt@kms_joiner@invalid-modeset-force-ultra-joiner:
>     - shard-bmg:          [SKIP][218] ([Intel XE#2934]) -> [SKIP][219] ([Intel XE#2934] / [Intel XE#6590])
>    [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4178-639f325d8cbdc690de963db2fe5840444ac7ea65/shard-bmg-6/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html
>    [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-bmg-4/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html
> 
>   
>   {name}: This element is suppressed. This means it is ignored when computing
>           the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
>   [Intel XE#1061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061
>   [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
>   [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
>   [Intel XE#1231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231
>   [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
>   [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
>   [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
>   [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
>   [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
>   [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
>   [Intel XE#1447]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1447
>   [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
>   [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
>   [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
>   [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
>   [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
>   [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
>   [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
>   [Intel XE#2291]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291
>   [Intel XE#2293]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293
>   [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
>   [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
>   [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
>   [Intel XE#2314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314
>   [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
>   [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
>   [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
>   [Intel XE#2330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330
>   [Intel XE#2360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360
>   [Intel XE#2375]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2375
>   [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
>   [Intel XE#2457]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457
>   [Intel XE#2571]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2571
>   [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
>   [Intel XE#2625]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2625
>   [Intel XE#2705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
>   [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
>   [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
>   [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
>   [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
>   [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
>   [Intel XE#2927]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927
>   [Intel XE#2934]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2934
>   [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
>   [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
>   [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
>   [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
>   [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
>   [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
>   [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
>   [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
>   [Intel XE#3442]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3442
>   [Intel XE#346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/346
>   [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
>   [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
>   [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
>   [Intel XE#3718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3718
>   [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
>   [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
>   [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
>   [Intel XE#4173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173
>   [Intel XE#4212]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212
>   [Intel XE#4345]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345
>   [Intel XE#4416]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4416
>   [Intel XE#4488]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4488
>   [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
>   [Intel XE#4608]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608
>   [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
>   [Intel XE#4757]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4757
>   [Intel XE#4814]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4814
>   [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
>   [Intel XE#4915]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915
>   [Intel XE#4943]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943
>   [Intel XE#5007]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5007
>   [Intel XE#5100]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5100
>   [Intel XE#5300]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5300
>   [Intel XE#5561]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5561
>   [Intel XE#5564]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5564
>   [Intel XE#5565]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5565
>   [Intel XE#5575]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5575
>   [Intel XE#5614]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5614
>   [Intel XE#5626]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5626
>   [Intel XE#579]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/579
>   [Intel XE#6251]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6251
>   [Intel XE#6321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321
>   [Intel XE#6360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6360
>   [Intel XE#6361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6361
>   [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
>   [Intel XE#6529]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6529
>   [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
>   [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
>   [Intel XE#6590]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6590
>   [Intel XE#6675]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6675
>   [Intel XE#6676]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6676
>   [Intel XE#6699]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6699
>   [Intel XE#6704]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6704
>   [Intel XE#6707]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6707
>   [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
>   [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
>   [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
>   [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
> 
> 
> Build changes
> -------------
> 
>   * Linux: xe-4178-639f325d8cbdc690de963db2fe5840444ac7ea65 -> xe-pw-158344v1
> 
>   IGT_8647: 8647
>   xe-4178-639f325d8cbdc690de963db2fe5840444ac7ea65: 639f325d8cbdc690de963db2fe5840444ac7ea65
>   xe-pw-158344v1: 158344v1
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/index.html
