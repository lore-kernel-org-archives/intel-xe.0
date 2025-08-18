Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65023CA0ED1
	for <intel-xe@archiver.kernel.org>; Mon, 18 Aug 2025 18:31:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00E3F10E03A;
	Mon, 18 Aug 2025 18:31:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dVgWxdlK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C07E10E03A
 for <intel-xe@lists.freedesktop.org>; Mon, 18 Aug 2025 18:31:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755541890; x=1787077890;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Czu1yF9QKRoWvkDoPa4WQvMjvzyYlvWQIpvBIZLpgHQ=;
 b=dVgWxdlK0GSpka9q7cvGIEx7fNHeB5e+G0ViXkySYEc58NWZY4+lYD2H
 68ku7kEz7vlVD4luT3QuHSBY/0cRyMK05lYdLT9uzDGimNNAeJA6RNkJh
 gzRdb2pwhjUsEOMZj29piJ4xRSb3rEqbn/Px+VBlF9oQIbkc6ePTxnrlU
 qgpMqrKUsydhVu/48erbJ1TaNECEDS7Hi1otFl+UMEne9MRsn0fhcws8I
 Eil3baOlOvIqJW70XYLZohzPzy7WYwdQaDbzIjPYQGjRUe8dGOI27kDMt
 gJAXhiuqFjssbDpHfGV6kC3hC3YKKVlrWJDHrwNhTe/bG115J6Oy+aIeA w==;
X-CSE-ConnectionGUID: ml3W3wGVTIekBekbQZerig==
X-CSE-MsgGUID: znZTZUCiSGG0D6ax0ov6iw==
X-IronPort-AV: E=McAfee;i="6800,10657,11526"; a="57486375"
X-IronPort-AV: E=Sophos;i="6.17,300,1747724400"; d="scan'208";a="57486375"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2025 11:31:29 -0700
X-CSE-ConnectionGUID: igLVKaTsRoCxryUR/+Z0ww==
X-CSE-MsgGUID: XDVynRyDSCKQ4Bq7yEXrlg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,300,1747724400"; d="scan'208";a="167148810"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2025 11:31:29 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 18 Aug 2025 11:31:28 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Mon, 18 Aug 2025 11:31:28 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (40.107.92.84) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 18 Aug 2025 11:31:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UF3Sf7aPJgICvd4oiM+GvbKdMSDibXUK7pXz5wdGxodnCdaCMMvwCJVk39oSeyDfaohw20PUwGt6hHPio8OlCMsBLLAU6sEtuwOjGUY9GZWuSvlRyhTWilVMRss4zQtgjDNoxwN+ApxEiWEbpl6Leq/qeyzLZGu++W3jQR5j0cqAEdqb8aVx1ZJpIQnAZU8j4XYyJsRnLN8UCt2s+JUolke21xhajXLnP1lWltSYRaczAz1mSx7xp4/15JtFZ6Vx0A+pJ9OBptlzbtANptaVZu8K7FSK+lqpEDtBZ6lHulytB6Voz0Glg4orJXWmJbWkA4Yt4GqjChLyZkaubjClvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZrpOofMmF5JPRzKFdzr9F3Jj4mefRAIkdVSyUjVXZeg=;
 b=ButF42Ls9Fo8uItZlxZFnhXWAMaUBy8FOTT3MMJLhmmoG6aky/Ff6L+Kmt5k7OIZ8hUjFBtxwc9N6AJ6UE/qxQYWU5zx4rEZaXdQNUFPbPT6tjtiQO+SPvPjFtzPy8VxCzd5zwLQjph4TSVexRu9MJ0e4AJt0FnzrWOyxKnxiaUvsU3gVroywTEEMo9GVFE0WRV4HEZa/B9Z+T8EsZxyOWdlztbL+cdyFdTggsW1C/B1JQkeQnmCQlAcKC5oVyDoPqaBx95ZisIE6brxkbro7yFXv+CiLW4iDtLWxEKL/cJBL5nJ+D9Irj3bs/x0OeXHkVquBmQZuAtXO0Bfqw383A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a) by CO1PR11MB5188.namprd11.prod.outlook.com
 (2603:10b6:303:95::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.24; Mon, 18 Aug
 2025 18:31:25 +0000
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::e40a:ca86:8d29:b2ab]) by DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::e40a:ca86:8d29:b2ab%6]) with mapi id 15.20.9031.023; Mon, 18 Aug 2025
 18:31:25 +0000
Message-ID: <7a44005e-ae56-4db8-9668-20208d9706ba@intel.com>
Date: Tue, 19 Aug 2025 00:01:19 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 00/24] MADVISE FOR XE
To: <intel-xe@lists.freedesktop.org>
CC: Matthew Brost <matthew.brost@intel.com>, =?UTF-8?Q?Thomas_Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>
References: <20250814105950.2177480-1-himal.prasad.ghimiray@intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20250814105950.2177480-1-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0040.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:175::13) To DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPF691668CDD:EE_|CO1PR11MB5188:EE_
X-MS-Office365-Filtering-Correlation-Id: 99b852d6-e245-49e7-f0cd-08ddde857009
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aVZ3NWN1eXhtQURiYjlhQkpOYTFiQzMweHNTQWtHdE1SZFgweHI4UEZEVEcw?=
 =?utf-8?B?NytveUYreEZaY2pyV1krNUtzUzJMS29YbXlLNForR0oxSjh6b2UyaEozWWNy?=
 =?utf-8?B?RFpMcEd4b3crQVhrRVBjU2JCN1V2b3NOSjlxckN3ZGFreGlWZFd0ek9xY05y?=
 =?utf-8?B?cnZBU3kxeGtpRFd3NGtNdzByTlNKcHBOZ1YxZ1hHQUdUSE8xL1U0dEJrRlNt?=
 =?utf-8?B?Z1kzbW9tdmtlTWtSelVrZDVCcjcvTTBXVUZxZmNIbWt6SlBzQWNkcGlob0xw?=
 =?utf-8?B?UG5KOGNXOE5TQlpyMnY3My8vTU1OMnE4WFJmUlAxK3pseVBCK3A2U3hvQVdh?=
 =?utf-8?B?V2ZuZnZCS0tyMkxZWlNocDF0WkdxcU0xdGVMVlM5cTlpelFQMnQxd29GemYz?=
 =?utf-8?B?WXA2RTJJWERvd1lyN2tyYWJhQS9Nc24wNGozNm5kQUxxcHEvR0RkbWRnNGZI?=
 =?utf-8?B?bWMwZ3FUVkZiSld3enk1M2tWejNPenhUSzR5ZEoyakNzU3lTZEdHZld1NGhI?=
 =?utf-8?B?K3RhM3JRV0VKTXRVZnZnSU9HeFVGNlo1ZTAwekR2Y3NJWnd1RUZFYjNWRklB?=
 =?utf-8?B?akZ5V1lUSW50Zlg0T05VbjZOUlFIV3VMSjRYTWNpMVRqemdxalA3YnNyVlJ4?=
 =?utf-8?B?R2d2U2JiemVNTmxHdGVxVU96d0srTEhSZ3BLMjRURUkxTXpVVXY3MkltL2E3?=
 =?utf-8?B?eGd6Q2krRXFONjlxRmZMMUlxZXAxS3BLWlZ3U3ZEaW5Na09xT0h3VHNpdnlE?=
 =?utf-8?B?VUdZMkp1NXZiWjUvQzgzNko2SlFyUGFGZzRQMWxaQjlLMnBFNTloS3pFcHFQ?=
 =?utf-8?B?Ykxqb2Zrcnk4ODlONFdJdXRWNFhtWGFYTWNaYVhRT0xFcG9sSDZDckw3ZTM1?=
 =?utf-8?B?MXRIcjMrZGtNOWNtczN1dTRuOGdYZFdvL1RUZWpZY0x4TTNHR3NTOVZjcUIr?=
 =?utf-8?B?SFhSa2kwa00zaXFxd0FiQnQwU1gvRzFrUFNxbVovVUVDbTYySzUxbG1lVWl1?=
 =?utf-8?B?QmE5ZGMxc1hXeEdESXRGbVlnZzY1SHRLMjJFV09USHZqb2ovSlltdGlJRUxQ?=
 =?utf-8?B?V3l5dzBpeEd6MmgyUkNtektlbjJ1SllDWnRkOG9lVUtqUGNJRzFpMk5OQVdq?=
 =?utf-8?B?a1p5ZWgrMVZ2b0xlOVhIZWJLNTkwNVhvRkRybmVWVStWZnRoK24wZGREUFAx?=
 =?utf-8?B?Y0Rrck1LcElLQ3NtZncrY2ZQbWRlMUZmVGpuTDJjdlNSN1hMcE9Ud2MzK2lp?=
 =?utf-8?B?b3dSbnZ3ZzZNcFZ6V1R3WnRZcXRQWGNYN0NEc1pKTnQrd3kzTHM2Z3BpVVhI?=
 =?utf-8?B?UTNicWNudS91Q1NESE5Ed0VTcDZnMlk5d25HUGI3TGluWlo1Q01wNlliVmJo?=
 =?utf-8?B?R3ZkUXFmNk82NlNSb2dEMUplNkpUaU9TemtONjZOS3drRUhWYkZ2endpdHhk?=
 =?utf-8?B?VGZxMHpVbW9RU3o1NURhVWJhRGVqZnRQenNhcHRxSFhMdHFZOWFPeUh4UWRi?=
 =?utf-8?B?V25zbjB6TUlUdisxbkpaS09tVHBFdjR6eGUzcnJoRkUrUVRXRzg5YXB2RUta?=
 =?utf-8?B?c1c3dmhZVHpiSGlUSVVkZU0vSzl0dThUOVdZd3R0U2p1R0lyL0FaOTV3RVp3?=
 =?utf-8?B?Q29UZDVncE9meHZuMzN5MTVzN0NiN2htU29BczlkZ2RvV1N6WCtoVmZlUmVT?=
 =?utf-8?B?NldiWWYwZjMyM0R0UHEvM2ppcU9FSmpiRnpuL3ZPOXlNd3ZIME5JUUgzOVBt?=
 =?utf-8?B?cFZDTmZHL0JKQU5pTTEybmlvM0pyM1l4VEE1Unh0M3M3eWdFVE52YmFlSGp5?=
 =?utf-8?B?UVY3T1pZaHVqeWpjSVpBd3VJUHU3SmhKWG9tT1dydlFWcGdtWnl0OXA2NFo3?=
 =?utf-8?Q?xhvu7C4n00t47?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPF691668CDD.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aUpHdWV0cUJXNXdlY2ZGdE9NZHdVUWRWc2tWSUJLbzVxZi9hQ0l3aVRXTzZE?=
 =?utf-8?B?dVJCUWUrQVNSUnQra1JsVGs1YlpKbGhqejRPZ3gwRlBCNlAwM0tUR21jbWlq?=
 =?utf-8?B?R2Q2RmJWRkx1QVAyeUdWZkYzNFNONytCQld4RHp6ZEJvUnpxOVVLamE3c3Mx?=
 =?utf-8?B?cjN1Tk1aN3JwSElkSG01akZaR0dyRURXaXByQUFuclR5bDV4d3R5aDdZZEpo?=
 =?utf-8?B?YTY2OXRYVm1XWGJBd2dETEtWdmpTN21ibnVOMWVlSGZMRnpKQU5Nbnkxa25q?=
 =?utf-8?B?d0xURzk1MmRCdkVGYTFOR00rdy9IamRwdHBVbmZOQjg5NGtMVnNqRXc0Z0Zh?=
 =?utf-8?B?TzBxd3E0eUVVUXdNZllsSkYzN0QzajdDQVA3N0ZSajFUS3Q2UjllLzlHeit0?=
 =?utf-8?B?MnBxcWNkeDNPbjdDRi9OTkRYN3J2Ukk3NW1XYTNUbk1zQkRQUVlUaThEL3Zw?=
 =?utf-8?B?U1VjTlVmK29lekRKQU4rbEUwRnNCRENITEUyL0tJRXRoeU9QQzVsVFVYalFa?=
 =?utf-8?B?emFqRWUwcW5RS3hwbUVQUHV5eU91bnFPVStKTVpONFVWWTNwS2p4cGY2MkZC?=
 =?utf-8?B?THJ3b2txeHQyUEFxK09ZeWwvSys1Vis3S1NtSE5tNU9tcWUwSjJmdW00cHk4?=
 =?utf-8?B?WnF0VHFsZmtROVZlSUdaREtXTHdiVTFkeG5DUVptOFRBTnN2UzU3R2JDVTR6?=
 =?utf-8?B?WVdxU1BxcmFXaHN2Um5ra2RsSGtRNjlqU2VydlE1UGx2Tk0zTk1aOUNobmZX?=
 =?utf-8?B?ZURSUW9icGVRQU9ObFYvdHhYWUg3V2FZbUpnZ3NsMGZDUml4UVlISW9ROG9k?=
 =?utf-8?B?YXl0YURvb0NLb3FmVXhmZGRHcEtpZDJpVy95bTB6QnQxemg2VmZhdnBiRE1o?=
 =?utf-8?B?WjdsWHJOeXRWWkNtdHh5MUZvTlEyN2lKOXRuZnNNa0FycWpWdWJlcUd5N20y?=
 =?utf-8?B?dWkvVWh3bWV3MDJ6RVBKTmVBU1U2ZWxMK09US0Rlb1ZDdS9lUkxoVmRSMHBL?=
 =?utf-8?B?aThtYXBJUzNKaWs5cFA3NHRCQTlrRzJjMGI4b0VRSCtoWEVXOWZqd3lkMm15?=
 =?utf-8?B?OXI4dm5Yd3BwRUErSCtjWkE4REQydlgwYm9wU0dXU09xR29zSU91T05heTl6?=
 =?utf-8?B?MDNkSnlmNVMwbWEvVmtObmhDbmhpbUVTOFNKU2toS25BOWpHdE14V05tenpY?=
 =?utf-8?B?eDBNNm9XQXRUYmhjVzVFYjRLR1dBNGQyaDl1WXVjcmJvaCtzMUdYOHc0YkpC?=
 =?utf-8?B?WFRtRkR6eVJ5ZnpMNFlPTzVEdEVLZWk4RFZSYnM3TkxNZTQ2WFlTUGJSWlYy?=
 =?utf-8?B?dXIxWDVWbGt3OUR1RnJ3UzZsK0xCeGgwTHBGVzdTQWZlVVZEQ3MzeGROSFNk?=
 =?utf-8?B?ZTdYN1FUcGI5aWRnanBoTUtYRExHT0VpSTJ6TXArRVQ3aFA0SmdNRk9jVmg5?=
 =?utf-8?B?ZGFWUFJYSTdPQzVIMXdZNytLeFdWRjhpQTlwaHFYOWllYW5taWF0azBLMk9k?=
 =?utf-8?B?MFYwOVNvdExHV0pGbTNQdFNSQytUYnhBa3NYa2g5cUdIdWpiQjdEajk3M3dC?=
 =?utf-8?B?M1RMVmZya214cllaNktndW5xcU9mSW5VZDhwdkxYRXQzY01tbnA0TjBDRk9l?=
 =?utf-8?B?N2VWUk1iOWtpZUhjeHhUbWoyUmI3QmVZWFcwb3U4cjJqUTNFeWIzTnNqSVFL?=
 =?utf-8?B?NkZiUG42QitYV3B1MDBtclMvMlRaemFqVExEblREWDFMSUdrL2M0QzFHenlZ?=
 =?utf-8?B?S3FqMjN3cGxoa2R4Uy9oZXRIY2NnNC8zWnE5SEdjT3RsQm42cnVZWFV5dkVh?=
 =?utf-8?B?bVIwZ1dFRDVkVVNvVEZUM0JsVXQ2ZWNWcFlFQ1NpWmJHSkdpSkNOVU82Y3JJ?=
 =?utf-8?B?dzlmaVRKeTdkU1FBeUF6M3o2KzNUcno1M3BDWXVQM3BXc0JnUzdsN1J5dlBu?=
 =?utf-8?B?R1M4R3VGaFJyQmNwREd3bGdTMml5MGtwNGoxakRzY0IrSENkdlNBVGdYTnRH?=
 =?utf-8?B?bCtJbmxJSmdMdnRaaFpQQ2VpWk5XVEsxVmJRakx3b2k3NTlHblNNZ3ptYnlK?=
 =?utf-8?B?aC81T0Jub2ZoL3hiRGJiUXQyOFBxWmZvaDI4VU5aTmZTZjk2aXBzMVJaaFZo?=
 =?utf-8?B?RTdyWDc5UTlZaUVIRVlHVUpJOW9pQTVodFJWaWlpMVM5NmxzUzJlVTFvSlFC?=
 =?utf-8?Q?11MBIMn5pJ05l5lT3DeYLiU=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 99b852d6-e245-49e7-f0cd-08ddde857009
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF691668CDD.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2025 18:31:25.2468 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hW/o8VU7h4aGAeWLatINWVvGIa+l7xmU5jdpmu6dQk1qi8W6fvXvMuPL7Sdm6y4hDbQDeaHhMCtfF/EQi0sG1HxARZPqo1OjUCFQM/hKYc4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5188
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



On 14-08-2025 16:29, Himal Prasad Ghimiray wrote:
> -v8
> Define new function in gpuvm for madvise
> Fix tile check in ops_create
> 
> -v7
> Change gpuvm layering on gpuvm_map_req struct
> Fix EAGAIN return on garbage collector splitting vma
> 
> -v6
> Rebase on gpuvm patches
> Address review comments
> 
> -v5
> Restore attributes to default after free from userspace
> Add defragment worker to merge cpu mirror vma with default attributes
> Avoid using VMA in uapi
> address review comments
> 
> -v4:
> fix atomic policies
> fix attribute copy
> address review comments
> 
> Provides a user API to assign attributes like pat_index, atomic
> operation type, and preferred location for SVM ranges.
> The Kernel Mode Driver (KMD) may split existing VMAs to cover input
> ranges, assign user-provided attributes, and invalidate existing PTEs so
> that the next page fault/prefetch can use the new attributes.

Implementation is tested with 
https://github.com/intel/compute-runtime/pull/845

> 
> Boris Brezillon (2):
>    drm/gpuvm: Pass map arguments through a struct
>    drm/gpuvm: Kill drm_gpuva_init()
> 
> Himal Prasad Ghimiray (22):
>    drm/gpuvm: Introduce drm_gpuvm_madvise_ops_create
>    drm/xe/uapi: Add madvise interface
>    drm/xe/vm: Add attributes struct as member of vma
>    drm/xe/vma: Move pat_index to vma attributes
>    drm/xe/vma: Modify new_vma to accept struct xe_vma_mem_attr as
>      parameter
>    drm/gpusvm: Make drm_gpusvm_for_each_* macros public
>    drm/xe/svm: Split system allocator vma incase of madvise call
>    drm/xe: Allow CPU address mirror VMA unbind with gpu bindings for
>      madvise
>    drm/xe/svm: Add xe_svm_ranges_zap_ptes_in_range() for PTE zapping
>    drm/xe: Implement madvise ioctl for xe
>    drm/xe/svm: Add svm ranges migration policy on atomic access
>    drm/xe/madvise: Update migration policy based on preferred location
>    drm/xe/svm: Support DRM_XE_SVM_MEM_RANGE_ATTR_PAT memory attribute
>    drm/xe/uapi: Add flag for consulting madvise hints on svm prefetch
>    drm/xe/svm: Consult madvise preferred location in prefetch
>    drm/xe/bo: Add attributes field to xe_bo
>    drm/xe/bo: Update atomic_access attribute on madvise
>    drm/xe/madvise: Skip vma invalidation if mem attr are unchanged
>    drm/xe/vm: Add helper to check for default VMA memory attributes
>    drm/xe: Reset VMA attributes to default in SVM garbage collector
>    drm/xe: Enable madvise ioctl for xe
>    drm/xe/uapi: Add UAPI for querying VMA count and memory attributes
> 
>   drivers/gpu/drm/drm_gpusvm.c           | 122 ++-----
>   drivers/gpu/drm/drm_gpuvm.c            | 287 ++++++++++++----
>   drivers/gpu/drm/imagination/pvr_vm.c   |  15 +-
>   drivers/gpu/drm/msm/msm_gem_vma.c      |  33 +-
>   drivers/gpu/drm/nouveau/nouveau_uvmm.c |  11 +-
>   drivers/gpu/drm/panthor/panthor_mmu.c  |  13 +-
>   drivers/gpu/drm/xe/Makefile            |   1 +
>   drivers/gpu/drm/xe/xe_bo.c             |  29 +-
>   drivers/gpu/drm/xe/xe_bo_types.h       |   8 +
>   drivers/gpu/drm/xe/xe_device.c         |   4 +
>   drivers/gpu/drm/xe/xe_gt_pagefault.c   |  35 +-
>   drivers/gpu/drm/xe/xe_pt.c             |  39 ++-
>   drivers/gpu/drm/xe/xe_svm.c            | 254 ++++++++++++--
>   drivers/gpu/drm/xe/xe_svm.h            |  23 ++
>   drivers/gpu/drm/xe/xe_vm.c             | 438 ++++++++++++++++++++++--
>   drivers/gpu/drm/xe/xe_vm.h             |  10 +-
>   drivers/gpu/drm/xe/xe_vm_madvise.c     | 445 +++++++++++++++++++++++++
>   drivers/gpu/drm/xe/xe_vm_madvise.h     |  15 +
>   drivers/gpu/drm/xe/xe_vm_types.h       |  57 +++-
>   include/drm/drm_gpusvm.h               |  70 ++++
>   include/drm/drm_gpuvm.h                |  38 ++-
>   include/uapi/drm/xe_drm.h              | 274 +++++++++++++++
>   22 files changed, 1922 insertions(+), 299 deletions(-)
>   create mode 100644 drivers/gpu/drm/xe/xe_vm_madvise.c
>   create mode 100644 drivers/gpu/drm/xe/xe_vm_madvise.h
> 

