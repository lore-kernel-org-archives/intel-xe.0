Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90F69C83F27
	for <intel-xe@archiver.kernel.org>; Wed, 16 Jul 2025 14:22:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4928910E70E;
	Wed, 16 Jul 2025 14:22:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KdFZllJm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAF5810E70E
 for <intel-xe@lists.freedesktop.org>; Wed, 16 Jul 2025 14:22:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752675751; x=1784211751;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=lZXwvXvlEgDyH4tTJ0M1JB5VmAdM3IRSu76ckcmc7Hg=;
 b=KdFZllJmINkUB+BXexo6aF3A+qyFM81Fiu64YETytutLY3JxsAvAcrjG
 JExTqut0UtGyAId/ad6GexzfZS3UtF2EOIvqmFA6eZa+6GFqdHPxc0oGE
 k+Z/q4/qFxHgrfKSPeM7tzPPYFuRW2ItNw0vwpGWqMF1aLVFvuLxMdLfi
 iCF8vqJrY/A/QcnkwOfS0eQnSRfj6iys0kKQdfOjQuxR/WW/+pkSKh3W4
 gpV43F+4jvJB4DP7waH/MaSLCNvLu7k7UF+uHKfFn1fmhn9mrkgtdrZPz
 aeWtoV3hprMrtBjzNwg2C6902j2PITZP76H45APdFDQD4MpAxOVeE0Itk g==;
X-CSE-ConnectionGUID: IUZZ221CT6+3otxI5R3Eqw==
X-CSE-MsgGUID: 3kjVGHE9QtmEXlDv0ZOxuw==
X-IronPort-AV: E=McAfee;i="6800,10657,11493"; a="42556577"
X-IronPort-AV: E=Sophos;i="6.16,316,1744095600"; d="scan'208";a="42556577"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2025 07:22:30 -0700
X-CSE-ConnectionGUID: DKj6goY/QleRDpPBT16Wyw==
X-CSE-MsgGUID: mwT4QIV6TZOvVWab4t7VBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,316,1744095600"; d="scan'208";a="161846818"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2025 07:22:30 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Wed, 16 Jul 2025 07:22:29 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Wed, 16 Jul 2025 07:22:29 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.69) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Wed, 16 Jul 2025 07:22:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D2nub9hYf/MAKGLalTqLWeMgOYp3vc4mIawA9/Kw4bjJv17yGb5+auHmRpBiTM10DJO/mWlqiHHF3XsFsgevoX/wGXcoNE7nXutQkWjxWzGYteeol3j/NoB8cmASI7pxy77GODUX8TIPvifcYaKHoJm9NROQEc7SwxJ1VlyY/SfEjevi/gEa6m04/q63Lyw+9hBjdk6Dr2GY0tKk52zMImUGXZbalisMVshqmWZN5v+IPXb9/8xy/qB5jojyFUEDXR+i1G1cTqHhsnfClPF0m1vQXihn5f+yzn9fPyn6HybB7xEu9qBlebioZmwJRomG7cVgthUBqvCGcnUhREV0TQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kkMTW5K5xFm4PCE5THWG2LzEviZpmAzd4DW3QaHmDSw=;
 b=tAeKpZhqKq9J5eLeFccctOWCMNsiFsvzSn2OKXNA+QGOj0hFU+9twvs1R3F3y/GrCMRAaKwENIxDzxCUSUWqSgSb8rEun7QSjC144LGlByMFhA2IDp6nbLGcb6xjt3yCZgGHTTddRDfFVCvjqOKFAH5iO0p2O6afgkSMw/5prThmM1v78FaecIzvLEXQtdI4EkdkNVesRHQtzdzRN7l0tk+B0l1pZ2rvJlaS7Rr4fRNZU/j9Y35ULyN77haJEkfZuNl1XdXzXaZDM6sAlUCw/LvZqgkrQ6hbEbbg7B4xIQ5OP8Tjv++bJxkCT5jnH2JA+isJrBtf8P8aO/3L1UBIzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 PH7PR11MB8249.namprd11.prod.outlook.com (2603:10b6:510:1a7::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.35; Wed, 16 Jul
 2025 14:22:11 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%6]) with mapi id 15.20.8922.028; Wed, 16 Jul 2025
 14:22:11 +0000
Date: Wed, 16 Jul 2025 16:22:07 +0200
From: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>
To: Tomasz Lis <tomasz.lis@intel.com>
CC: <intel-xe@lists.freedesktop.org>, =?utf-8?Q?Micha=C5=82?= Wajdeczko
 <michal.wajdeczko@intel.com>, Piotr =?utf-8?Q?Pi=C3=B3rkowski?=
 <piotr.piorkowski@intel.com>, Matthew Brost <matthew.brost@intel.com>, "Lucas
 De Marchi" <lucas.demarchi@intel.com>
Subject: Re: [PATCH v6 7/9] drm/xe/vf: Post migration, repopulate ring area
 for pending request
Message-ID: <jawcj7rw2h5zmtcwyuousaurikd5wgksevk7x6kbtl7wsilmxl@rzkxy3liwxqt>
References: <20250704210228.825843-1-tomasz.lis@intel.com>
 <20250704210228.825843-8-tomasz.lis@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250704210228.825843-8-tomasz.lis@intel.com>
X-ClientProxiedBy: VI1PR0502CA0002.eurprd05.prod.outlook.com
 (2603:10a6:803:1::15) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|PH7PR11MB8249:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ebbdb27-926b-44b2-8d58-08ddc474271f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?L3lRdnJFMThVL1g3WDBXMWFjQVBwQmdPQ3Ixc1J4ekR2TThBVmxSU2VvSjdv?=
 =?utf-8?B?QTVObUpXQkIzSnBZeGFxNmI1R1BlbEtOZDlValVuMzhpT05vNDZDeGJ2RXQ4?=
 =?utf-8?B?ek41NzBnaUtDQmVNRDR3MWRIVkt6ZlJmcGJsUXpJSXBmODVZdmxNcm4zTWli?=
 =?utf-8?B?RVdHczFidUhUb0hVTElyRFFQdWNkRzd1MkN5YmtJeHQxQWthUllWNlRyWDIv?=
 =?utf-8?B?YmgwRHRQWlFyN3JnWVR4U1I4Zjd4ZWZ3cHA2bXB2aVg5Qko1c3pFek4zOU5Y?=
 =?utf-8?B?dWxUOWpKd2t5MDRxQjJnZG1jbmZjU2YxOVBkZUJNZ0RXZy9jVHFOUDRjd0Mx?=
 =?utf-8?B?N3VxQTUxcEpyRHhkTUlXVURuVFlpSjZUUkx4QStYcjVYVklCRDlhbDBPeDlG?=
 =?utf-8?B?aDZuVXQ1aTlpZHZqWTdZZUxteWs3Sno1TjNON2lwR2ZJUFd2Z2R4WFRxaFRx?=
 =?utf-8?B?dmZYYWkxeXprWm5FUjZ0Y3N5MG5ObGczNS9ZQjNoTVJKdTYxWU5nQjJmbHdC?=
 =?utf-8?B?OXd3SmpOZXJSWFppLzBMamUrRXVUUzBHbUdzdjhUdWcvalpZOVlyV1h0VHB1?=
 =?utf-8?B?K0pyVnFmanlsWTlyaXBUeGl4TVI3dlBvZU1aWE16QjFwZXdyNWFQd1JlaCs5?=
 =?utf-8?B?bzBQUi96dDMxbEN3enFKelg1L2RzY3NtOTQ4RkZmRlluQWlWMHEwS2MyMDFI?=
 =?utf-8?B?V0xhblU3L3VrUFVUWTJUQll3TUdCaC9Ld2VzK0IzcXAyQk9XWTNyL1YxQ1Bm?=
 =?utf-8?B?MWZ1dTk2UVlCMlpvUGNBcms3ZkpUL2Z2aFg3VUFrdHhhWXh6cHFkVEdIS2lH?=
 =?utf-8?B?TGVFZmNiRFJuV0UyQXozN3Nwa0QwalZZa2NkNGk1M3g3UlVISU4zK2NSQkJH?=
 =?utf-8?B?a09BaHdVbnJpMGpTU1BtVnNpMWlGMUJuM1BDOHQrSHRNNC9NQ0wvc3JZUDFM?=
 =?utf-8?B?ckZpcmdxcWttaXZ5R1lld0IrSFI1QllybWFnbkFFSTVHUnBPUjJZcE1rc2or?=
 =?utf-8?B?eGxpUFdlT2JlMXFqRGVZM3B2NHV4UDZNdVFGdktHc0ZTQ2NGS3NJZzd6MExa?=
 =?utf-8?B?a25lUDhkRnM3UUU1SjNrSHU2a2xXWTU3ZVZTY3EzRG5JUVhCTS9ZQ3A2SGpD?=
 =?utf-8?B?b21yVEM1ZS83dTFET3RNeWE4SlM2akFteFE1Z3hZSmd4UlYxemJBOTNxUjd0?=
 =?utf-8?B?RnAwdU9qUTNkTm9QLzhTNEtTMWJiSE9kNHlRY1ZCSGJQSC9rSXFrVWJpS0F1?=
 =?utf-8?B?OWJ5WkV1SEtRT3YrUFVicEI1Y2JzejJMdXQ2K0VwTW5vZ3FTK3k1dzRTRHNH?=
 =?utf-8?B?NVhTTzFpTU9XM3luaE9rQ2wvSHFqYVRUZWZFUWsySGZ4RjlCLzNJWWFjWldU?=
 =?utf-8?B?eDhFRmtKd0NrVUsrU1ZVZjdVaHZkUTR3OGVtemE2ejc4ckh4ekZwYmJMc093?=
 =?utf-8?B?Y3UvUDJzaWF5QnpQSnBwMmd5OGVVNjg2V1pMb29aS1A3RXRYbVhFSVpRRGF5?=
 =?utf-8?B?ckcvbzlHampTN045MDBMRDRLWUVwdk12a0pSWmZBUnhleTk3d1M1ZjBBelU2?=
 =?utf-8?B?NUdTdit1VS81em1pYnd1WU84VXg4TDloZHRUYkUxck0weWpFOGdlY1pkbndX?=
 =?utf-8?B?Y0tKRzdyQ1IzY0tPWXdOc256cHRNQ1lkNng4QkFsWG8reVZ4TVc4eE9NNWxu?=
 =?utf-8?B?ZDZhaUREVkR1VFpkZVJQVmhabzNBQ2FYRHFYVWNQVnNrbE1MT3hJR1I1eEUw?=
 =?utf-8?B?WG1uN3VLZERwa2pCRjNuTnZaNDZ3VXhUUGhVbWs1RmJXVitPdnV3b0dXa1My?=
 =?utf-8?B?RVhWUG8yNjl1OS9DZjF4Y1l1d3hiY2x2WkxCcml4dEJvd1NVa0FaWEVXcUNv?=
 =?utf-8?B?NGJuNW5laGZVMW1xb2xTWGFJUFF0UjVzdlJkUkpFdlQzY2c9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Zk1XV2VJVWFrUHdrMG5Wb0NkZWJKdEZjT21PdzB0cUxmMUhyYTVjYWkrYzMv?=
 =?utf-8?B?cFVlWDJBa3JvUmtlU2c0VG5mb0g2WVpzUjNBSURUT2F4YWR4aXIyZzIvNnhq?=
 =?utf-8?B?Yy9UY2FZbnA2L1pEeUpLQ3ZCcTVaeTZ4andRbk1vaHI0QnhxZGhHaDQwSE9F?=
 =?utf-8?B?eHA4Uk0ySzluODJkdENyUlcrRW5IWEtuK1EvSDN6K3NWQVJndDJrT2F5Wmk1?=
 =?utf-8?B?elhkN3BSWEQwN3FnZnMzQTFkRmlSN0FBTEpxSDhSZHR4SittYWV1WmFmdGFh?=
 =?utf-8?B?anlGMGh5UzNjZXlLaDBEbFdBN1BKZENTNVdxQWpkYUJ1bEpKL1kzaTgzdFha?=
 =?utf-8?B?c1Urc01pbFMyNEJlUHU4b25hTjd5WXFxZ2UwWGIxcVFDbXQ5dXlIRGI0UzlU?=
 =?utf-8?B?SjdwdGlXeHpWaFVUM1EwdzY1dnpmeEo2VURjVmJLMFFWTXBaNkhZTGdQNm9U?=
 =?utf-8?B?czArUnUzL2RmNE44Vmg3K3ZaMjVJbHVGTXh4bmh1OWZRT3RIaUIvNndCUnRz?=
 =?utf-8?B?VU9yMHdEejYrNnBOajcxV0RHQVJscGlvYnNMSU5MVm9ubXk4eGhWcEw4Y0Z4?=
 =?utf-8?B?cTJjcWxvQzN2NEErMHBSQ05NMXdvTWovTnQxR0FpQjM1R3hNWElBSW9vM2dF?=
 =?utf-8?B?d0FiRlphRlk0SGtQa2M5b0hmNnBGQlE4MjBWYmZ4akFUUlAyYWJ5T3RhM21v?=
 =?utf-8?B?S1Vma09mbVZSc2w1Zk1rZFRMQ3N3VGpuMWZpQ0xPUGpCT1pUSmk0c2dnd0V2?=
 =?utf-8?B?U1hyd0c4RDFmT0lveFIzQVVkMnJHeFcvcjZUOTdFdUtFUWYyMENOWEVmS1lI?=
 =?utf-8?B?NnJ5OTErS1Q3UE1BdnhRaWJyaHlib0lBanRFWW8wencwVUlaK0hrNTBSMkZM?=
 =?utf-8?B?bDVQSkdEbFhSbG9BeExzL0phRG04ZGhVMGprUmdFRkpWZ3dwL0tvUGNrN0lq?=
 =?utf-8?B?SVoxMFJETFZYSHlucDdwdit4N20wUEZZc3NOZGoxOUhzd0JTL3N1OW9BNDlz?=
 =?utf-8?B?Q1NDZjF6SG9zSThYamtXVlBlWHJwUlNMdlNHdjhUdVYxR2RwQUlnaURKNW5q?=
 =?utf-8?B?ai93QVdDSVhBRU5ldDBDYXFFZmlzTnFHSC9jZTMyUEJvSS9uUG1pdnp0MWIv?=
 =?utf-8?B?RHZubFpRMnlKZXlPYW5rNGZjVkJLZTJlRkMxRDdiOWlKb3QzUlhDSkJUZE5o?=
 =?utf-8?B?VktITkFPVHFFWjBrZE16V1FJa1NoZ2krWlBhR1EvRlJ1djZROG9RRU9oclBT?=
 =?utf-8?B?ajhrUXQwd3Z3YWQzOHhUaE1LdDd2bmZKNWZuRmpDYnE5anRESW5zMXY2T3d1?=
 =?utf-8?B?VnFRamh3T1dndGcreG1CWTZFbW54K21yZ3NIUk1naXFxNEVTanRkTHBHZzZE?=
 =?utf-8?B?b0pUMGwrT1duWDRxZmZzdytoQU51L2gxRFVtQ0JMVGI0WjRvRERsNmZ3bFQ2?=
 =?utf-8?B?VVJweWZ5YTI5V005R1NJbGtnRlhaNG42NmNOTHBLMEFYdjFnTkNHSkJHbmp1?=
 =?utf-8?B?ZGUyWUhEemhWZXNHRWxDZHNVYW5aSkJXemJsWmIxZ1lDWlcxeUp3RFlsOHcx?=
 =?utf-8?B?ZjR2dG9qNDFxRWpYcUk0alFMMExMcW9INUQvRWZ0U0dEUlVoN1U2YmYyUVd2?=
 =?utf-8?B?MG5Za2owKzU3ZGdTQUNzbUt1QnZ0QUlFVW9YRHV2QVFQTFVKQnRUVUNQVTZK?=
 =?utf-8?B?cE9XakI5ckRjTXd1WDVuTlZhQnBtRmVZc2FGdkFITGVvajVLNHFpZWtqQVo1?=
 =?utf-8?B?VU1rd2RYWVpIODVaR2hvbTJCRHdkODJhZW55d2ZIY1RNZlFQYkRueTBsSmk3?=
 =?utf-8?B?OEJSYUNHay9KTnA0UUkyb1FzSDJjOUdOdUFCU2NTdllJcjJNeWk5bjBUcDdh?=
 =?utf-8?B?U2ZtMkxUSHpiREdnSjhDMXRub295a2JFZFBrcVJHRklpQWNocTVjUFlUNE94?=
 =?utf-8?B?OENBYUR0dTJVQW15UkdaL1hzNjdrbnZCSmIyRDR6NjNEUS91TVhMZTVrUzZK?=
 =?utf-8?B?ZDlqeElvZVQvbzN2OW0weTBXMGE3QzVvM09ybGtPTGhqaFNKcmN5NFJUSE9a?=
 =?utf-8?B?Ry9kWWJaUkthc0FiODJQcUVPVHQ3UGJXN1RDRWZvTDEzMXgzR0xGcVZXdFp1?=
 =?utf-8?B?MjcrZ1hVNTNEQ3dvWTRLdHNodFpmejZpdmZvUnVibkpFdGx6dFJJc3RlVkRY?=
 =?utf-8?B?eUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ebbdb27-926b-44b2-8d58-08ddc474271f
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2025 14:22:10.9710 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kqJX4YBI+FArjEEw9YSrr61ETEe5KIIDZt1gHSUWi/Yj85f7IvnQJ2v6s+/7nqS1zdVof2kW5Z/Mmc2WLn6VGHzRbK9CduDewvJ5U2TlZXw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8249
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

On Fri, Jul 04, 2025 at 11:02:26PM +0200, Tomasz Lis wrote:
> The commands within ring area allocated for a request may contain
> references to GGTT. These references require update after VF
> migration, in order to continue any preempted LRCs, or jobs which
> were emitted to the ring but not sent to GuC yet.
> 
> This change calls the emit function again for all such jobs,
> as part of post-migration recovery.
> 
> v2: Moved few functions to better files
> v3: Take job_list_lock
> 
> Signed-off-by: Tomasz Lis <tomasz.lis@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Michal Winiarski <michal.winiarski@intel.com>

Reviewed-by: Michał Winiarski <michal.winiarski@intel.com>

Thanks,
-Michał

> ---
>  drivers/gpu/drm/xe/xe_exec_queue.c | 24 ++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_exec_queue.h |  2 ++
>  drivers/gpu/drm/xe/xe_guc_submit.c | 24 ++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_guc_submit.h |  2 ++
>  drivers/gpu/drm/xe/xe_sriov_vf.c   |  2 +-
>  5 files changed, 53 insertions(+), 1 deletion(-)
