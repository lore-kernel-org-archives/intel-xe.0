Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE37CCA0EDB
	for <intel-xe@archiver.kernel.org>; Tue, 12 Aug 2025 18:54:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E88210E037;
	Tue, 12 Aug 2025 18:54:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="P1HXdj26";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5057C10E037
 for <intel-xe@lists.freedesktop.org>; Tue, 12 Aug 2025 18:54:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755024873; x=1786560873;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=gHsK3YBrqLc2K2i91gdFn/NMhqrIpV/sexUBO4qNXPk=;
 b=P1HXdj26Vli5e4ufdI0XJfgKp/aAzokIIiFiQwUAmjZbAXOrFd7GW7e2
 HNQonMDh07Y6R5IqkTaTMGChJNDk9KhupWuq93CetUbxKr6I8vKYi5sOB
 7oge4AghLleolYJ7AnRQzKq3xbES5N484Rmhdo0TWaDtccWW8UF9GdzV5
 0E0UFi2+9msa4bnheDBH4W73NGdkdYHma+WpVvyETCj44CXBoyr3CU4aW
 0eum1/LQokzkr7nHYA00a/SJ771l63tgNcxh9s+t073cX9W65OtlTzRVg
 cNC6GnkiMbEJ16G1X2qIPQpw0nzuoYHcWGNMl+PaCu2CeBdW6FgwTdw/P w==;
X-CSE-ConnectionGUID: 2wcJxPv8QSCCS9QvYLl8UQ==
X-CSE-MsgGUID: CgkPs0YcQbqxKbmW+j4KTg==
X-IronPort-AV: E=McAfee;i="6800,10657,11520"; a="61153407"
X-IronPort-AV: E=Sophos;i="6.17,284,1747724400"; d="scan'208,217";a="61153407"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2025 11:54:33 -0700
X-CSE-ConnectionGUID: lSYeOqOOStWHWm2T4jokIg==
X-CSE-MsgGUID: Ndq/LZHeQu+pOI0LQgswIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,284,1747724400"; 
 d="scan'208,217";a="166644470"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2025 11:54:32 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 12 Aug 2025 11:54:32 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Tue, 12 Aug 2025 11:54:32 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (40.107.237.72)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 12 Aug 2025 11:54:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Yzf0udbU36h2Lyh3RTY/Po51nC/Tp7g88MXb+dJ3qCqVkeKHf6hjLgZjyuveSeq8cv6uuzs99d0SpwjKt7S/3Qd+UO2mkbnkKlBu76xWKnxfiI4zqpdZ3oy9l0QcJDRQloHgA2LuRvLPu+i+f6xqrLx+r6fj1L81uadbL5LFSbkE1SSYqny3wj1dnQphgO+msIZEl9cFGzmgR02ECrw9HHyMwgh8IU3bCKc5NoEBuM2SR17y2CS4j14/FsW2L6FbtWR6hEp8Vs0cSPpx1Jyb0hYd/DFsEYHyfzViY9+bwbNJPfed+S4uT3h9YeMUFRX7CecTX1yUADEo5hDIyLPYWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DIv+Di3nyfKPBjOo9i0wRPNOiyKO6xQqonFnNkCrvQY=;
 b=cMn5hhNK380DAPpDD2hBP9a97NLc/X0t7VDnNE5TYtV3Y59KTx7xM92pQ+V67TxxNTI04TJnuPRqcq+TsF3PYInM/SvT4OAwTeOlGU68Hpn/Xt9TnZvFG2OReDYBOdR76NHkTylNziFB+7/zEU6Fmyx6PMLZ2ZNCE0w+LjHvnpR4LseoVBcceYhL/Q8an9h19++KkWdg2jSQ+tFDW//FV5aiPzZX2icR26uQsmhFYfcEjv8XMwhtUQTv7k4YSOWIoCHxwvmmfjfaLtMXw+3dJzmF9P30kXoDk/vTDUPHPvaziqjZWnoK6zOcmePkmgh58T4Op9YKmVFzk2NblZ6How==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA3PR11MB9226.namprd11.prod.outlook.com (2603:10b6:208:574::13)
 by PH8PR11MB7095.namprd11.prod.outlook.com (2603:10b6:510:215::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.15; Tue, 12 Aug
 2025 18:54:28 +0000
Received: from IA3PR11MB9226.namprd11.prod.outlook.com
 ([fe80::8602:e97d:97d7:af09]) by IA3PR11MB9226.namprd11.prod.outlook.com
 ([fe80::8602:e97d:97d7:af09%6]) with mapi id 15.20.9009.018; Tue, 12 Aug 2025
 18:54:28 +0000
Content-Type: multipart/alternative;
 boundary="------------OppALd09cDSYz4GEtJ3izAH0"
Message-ID: <d2b91034-ad76-40eb-a1bb-577cb0dd3fdd@intel.com>
Date: Tue, 12 Aug 2025 20:54:23 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Take preemption into account when resubmitting
 jobs
To: Matthew Brost <matthew.brost@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <michal.wajdeczko@intel.com>
References: <20250809043421.1982541-1-matthew.brost@intel.com>
Content-Language: en-US
From: "Lis, Tomasz" <tomasz.lis@intel.com>
In-Reply-To: <20250809043421.1982541-1-matthew.brost@intel.com>
X-ClientProxiedBy: WA0P291CA0002.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::29) To IA3PR11MB9226.namprd11.prod.outlook.com
 (2603:10b6:208:574::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA3PR11MB9226:EE_|PH8PR11MB7095:EE_
X-MS-Office365-Filtering-Correlation-Id: 778dd079-610c-497d-e39d-08ddd9d1aa16
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|8096899003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?T3kva2d5WG5ZVmFhWjdxWWFsYk9KRkxLNHkydG14UDQyb01UQnhZY1lKbjVT?=
 =?utf-8?B?R2NhdWwvc2hPT2tiTktUWnNTNGVvdmVMcGgvU0ZmT3ZFdndCSFdvMG5uNmxW?=
 =?utf-8?B?U0xUWTd0MmVwZTRGMStNVUhLYmh3SmhTQlVlSm5QR2RRdExqZ0c0RWpQaUtK?=
 =?utf-8?B?R291OVBneXJ6QUZuajgva0lFcnlocGxxVEZuSFcraW52SWtoSHhNNUNDMUVs?=
 =?utf-8?B?czJnRHlGbVd1bnRHcmlOUk83NlFIaVdiNnFXdGFudVlRYzIyK2h1b00rY3NB?=
 =?utf-8?B?SGJsemN5eVdvamFMTzFlcE82ZjBnWDBDVW52cWx1TUgwUkRwV0JuV0RwRE5y?=
 =?utf-8?B?VmJxRjVjY3FicHZDN2lhTytBYUt4WWFvMmRwbWtFZ21FZnAxWi92akdPZmxQ?=
 =?utf-8?B?SmFDcG1wUmJPR2wzVmtNUkhzMVk0Um5LR09ZZ3lHS2JpV1lxay9ZanZ1Tkhz?=
 =?utf-8?B?Y3RTMWFNOFhFdEl5dzJxbjJ1MVpCamdTOXdIVFEzV3dtZXFNRDdNaHJyaFVR?=
 =?utf-8?B?NzJOUVUrVmVULzVMdGZ1Vm44QjFlRmIzeTR2SVZIWTRwM3EvaDRqeTRscXc2?=
 =?utf-8?B?aFdUc0hsUW1NbldORGU2K3ZNS3V6TFhMWFREVEU4LzRjVng0QnF3SXh3RXJS?=
 =?utf-8?B?SVJqYTNiUnlTMU9QYUM2TWF0SlU1b1orcnhqYUpFZHdVclhGbVdqZWxObk5u?=
 =?utf-8?B?UmMxSk5LL1pmL0JoWDdZK21JVmpLcVA1R2tVZVhndW5UK0dzeVZ5RHdsZXZh?=
 =?utf-8?B?MjIzWTZjN1hyV1JPZ1Y4dEdldGQ3bFVWcnR2Q2Q1ZDZDY2s0SmlFcTFnRFpa?=
 =?utf-8?B?NG9qamlVZWhSbUNTYkhwTE8zelFKSTN6UjZkMWJWajBUSFpvWi9tc3lCU0Nl?=
 =?utf-8?B?U0dEOWxVdzcxek5KRXdHQ201TzVxaWkyZjhtVG1uZUR5TDNBaGd6R2I4bkNR?=
 =?utf-8?B?VzNLd2hLSlJuWG5MaTVSN1RteWV3a1pWc3orbmNWZkVHWkwvMHNrYWd2U3Fo?=
 =?utf-8?B?MTZrdjJMd08zZFNabzVSOXpuZ0drQ091dGxqelFWbFhreXE5T1JqaTE2U1kx?=
 =?utf-8?B?dVZXYWhIM2NnNGdQQU9qWDNROXFYcGM4OTFxUzJIVUo2RVNhdlZRR3VoSkNF?=
 =?utf-8?B?dm9CQld4ckFMUHEzRzZYK0I1MUFZdjNYMjZKc0o3TGtyV0Q2aGVEQ2YwY1Q1?=
 =?utf-8?B?VWc1K1dRSGZ6SGJ5b3N1RDN4aWFKZ3BnNkNtV29XSFRiL1lWVEJkWWRwbjZk?=
 =?utf-8?B?dTFsR1IvaHkrcE9rRElSeUdVaEY5YW9EVEExT2ZVUmc5WmRxcGxUb2E0Ry9z?=
 =?utf-8?B?ZVFKYXdOa3ZOZTNyOFNNSyszQWp4aFhiU2hHNERCZVMrZXJ0ZFhGMCtkNm9X?=
 =?utf-8?B?MkhHNGNxTVpCajVVbWVPODdEUGd6M3d2bXZXOXNDZjZQVnpWK3Q5aElFOGc3?=
 =?utf-8?B?WlptT2RGbGxVT3V3QnRwd0NlZnc5ZTg5VW1mdWFuMVIxRGpqK0VsMXhWZkhi?=
 =?utf-8?B?c1Brb3g2N3RjVFRtS2U3Z3k1RkZUR1NINjlCdzlpNGtPVHI1M2NIOGRPQVBJ?=
 =?utf-8?B?aEtFMTNzaFlrZGFWZWNXNFVZbFltOXU2WGVwZmllVHVMdWwrcThmRmtOTFJ1?=
 =?utf-8?B?NE5QZVJSaDdRRXlmZ3JKV1BmVm15WXhVY082cVRLRWgzaWN0Mm9RWWFmSEM4?=
 =?utf-8?B?R2UwVXVLYXlkQmx2am9FRW9lRllqUldldU5KTHlVR0k4OFFsUXptejZWZEs1?=
 =?utf-8?B?bERWczJBVVc5Mm9hYUVtOHBObXFmVGxiN1pLemZqMWFKMS9LTnkrTTNFT3ZV?=
 =?utf-8?B?N2JCTWZDYkFaaXYvRWpOR0FuUHJOd253Qk9kRWJFVnZCSzhWNURBZ3lFZ3Uw?=
 =?utf-8?B?M0lua2VsNVArb2NXV1p4K2NZUnFDUWp6YTF5bFM0WElXNzhLRW5aRFY1VWNq?=
 =?utf-8?Q?H+b0xO1rSdE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA3PR11MB9226.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(8096899003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?elN3MytndEZjWUs1ZHlyUGw4TnZwV1RoOU9FQUYwOVlQL2NBaHM1Nk9abXFN?=
 =?utf-8?B?T0dsQmtRcm1tODJJbWpHNnZRRCs4eDh0K2dpN2Nmam4rVWZRaGM2bU1uQmIz?=
 =?utf-8?B?MFA1c0VFTWcya3IrbVpiZGh6Zkl1ZCtTNEdHRDRuZ3JPVmxrVzMrZGVUVFQ5?=
 =?utf-8?B?cjZBanlYTUl5UUozc3VRbG13bUhjQjRrMll5dS9hdTNYNXY1RTZQdlZqaUxw?=
 =?utf-8?B?SmpXYkI2aWNIYkRoM295aWRKS05kbkVxYis5WlJVejRRMzVIbXZSNGM0MzA5?=
 =?utf-8?B?c3B1SzBlY2NrdVc1cVNkRGlKQlN1a3RMcHpxQS8zeDlTVWNIaFJmSHFiTitT?=
 =?utf-8?B?MGI5cUdJUGo2TFpnVVE0am84QmYzb3RESzFhQXlJc3JXenNrT1l0OXJobThK?=
 =?utf-8?B?VGJja1htZncvVGhVRVFUcHd2ZEdhNEtUMTBmd1ZXMzhDVms2S3J6aDRoUXd6?=
 =?utf-8?B?UzdhOGIwOUQyZGNoWmI0eWJnVXlQSzhQeVVCc1pJVXFmejJZaE04c3BHM2hJ?=
 =?utf-8?B?VUw5a1lDeGIzS21wcnkwWmJ4TlVMemkrb04rU1I1L2hLNHJMcUwvSWJ2RlV5?=
 =?utf-8?B?UXdkQWpZWGxhS2dpMWNCNUxlRmVpaWdaejJ6UUJCSWpweXAvV0RJVklrczBy?=
 =?utf-8?B?d3BCMEZCYitQMmRqMzBNbTZ2N0NzQ1hhd0g4ZXpqeTNmWndtd1dheXVrY3N0?=
 =?utf-8?B?a3d0VmdWNjhpL0FSWHJlaG1XcTBacHNLbzBTdFBkY1Z2dldpNzJkRENxWnJy?=
 =?utf-8?B?VkhJcGZzUDZRMTRZZDl3OTRlZzJJbEtCNStYUGVDbWtLZVZGRlc4ZkR3KzNy?=
 =?utf-8?B?ekREOFI0bk5oTEtoUDJTT3RSaVpHSUJxVW5yUnJSbHR1bHdkVFVFTU9uZlNj?=
 =?utf-8?B?Z0xOMm9YMzY1UUdodVYrSmQvOFNhcE0xc1lERXFmbUFJaDI1NkVFRjFwbDVa?=
 =?utf-8?B?eFBQSXF2dUdtQ3ZGZzVockRGcm1ZQTd5ZHdMeThuS3Rwd3E5ODdQbmxOdjNE?=
 =?utf-8?B?Q1p2MVpVSkdQejVFbGFrdG1zRjkxeEMyaVFIVjlTQnFCQjRueVN5ajVqbEYy?=
 =?utf-8?B?dnY5ZVVNdnhZK1lncndLS2cySWpjNjNWK3RQeklvRXQ0V256ZmNmcHRYU2dB?=
 =?utf-8?B?QVg2dmJPWWJxazY4Vk90UDNUbERYT2N6MlRLelg3MGtTdU5BUWxNb2dlZVYv?=
 =?utf-8?B?ZDBiRXVabGR0WWZzTmRkcnpORFEzbkJvY0E3dGhjSC95aTF3dDZpTFVWNFVB?=
 =?utf-8?B?YnZQZjdXVDRtRHF0czMyRm5CbEFWNnpuVFBtVVNHQ291N2FsaFhPSlhTVVg1?=
 =?utf-8?B?SDVLSWkzMXRPYkZWeUpETXNMOG9MM091eWlJaDJodms5YWVXZWQ5NjV6T1Jy?=
 =?utf-8?B?dU91Y2N2U0o4T0hXSytiRWhkcU9kWWFCTG93VkQ3c0pwM3pOK01FeWFLeUMx?=
 =?utf-8?B?WXJpcUljbDFraCs2ZGNNT2ZWMkRrb1FNOVR1ZFhuNFNiWHd4TE1SOVdRTFV6?=
 =?utf-8?B?eCtSTTNQMHUrcXAzdGNwVGpwYTJIL2F5cWNJOUZUVzRXRmhibXRqbzdoOUZz?=
 =?utf-8?B?Q2l4cjY3NmRlbDFITEhUWmhFTnQ2R3ZvMFRMTDlkdTd1Q3NLSU1ZRFYvUTht?=
 =?utf-8?B?T05tc3FCNlNBWnNvUHMzNkdNZ0YzWmhUa0luSHZUVjNmRzZTWlF5am5wcFRo?=
 =?utf-8?B?SGJjNUp2d0lKYkoyY013ZVozaXkwQm1tWnFUTDBwKzRMNlJOQTdleDUrVFhT?=
 =?utf-8?B?RlRacmlMYnZwWU0wMzFjeGl3ekh5MUdPTFNMSlZSZjR4elRtYTlycFlEZ0x6?=
 =?utf-8?B?Q3pOMVJoQnd6c3o4eWRJOXpGNjJvWTVaaWUzdk56aXZsYjBxOVNmTlhuZzcr?=
 =?utf-8?B?Z3dZWU9halhiOFlYNHRDOE5xc1BxVG5HMEdrYnJkS1lRUFFHWVR6SWFIcmZT?=
 =?utf-8?B?UW5NOGtUTUZhZnAvVENFa3NXcC83MGhUL0ZNbUhSYUFmN2c1bmtJcGh1WHhx?=
 =?utf-8?B?dG5aYkRwVC9rNmxJSG9TY09vVE1CZU40eFpOQ1o4ZXRvQ2I5cFlab3o3MFRC?=
 =?utf-8?B?djk4Q3Uwc2R0QUpWZVJQa0JWd3FJbW9yVFpTa2htS1k0RGtIWWhKZ0pxZmdD?=
 =?utf-8?Q?cnqZDfLgNhrDsUIV1k/4Lxpck?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 778dd079-610c-497d-e39d-08ddd9d1aa16
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9226.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2025 18:54:28.3849 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bMsaQwTe+uGYolnSLQ99TdWtgzdIyvgu5XlphXmS5fPGaTpLNERjPNFMNVpsy0YdvH8im9Y0q7GGfkFekUNVyg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7095
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

--------------OppALd09cDSYz4GEtJ3izAH0
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit


On 8/9/2025 6:34 AM, Matthew Brost wrote:
> Take preemption into account when resubmitting jobs, and adjust the new
> LRC head pointer accordingly to skip over previously executed parts of
> the job. To support this, save the head pointer of each job when it is
> emitted.
>
> This code can either be leveraged or reused for VF recovery.

Right. VF migration recovery.

This will help in amending the jobs ring fixup code with ring position 
control.

>
> Signed-off-by: Matthew Brost<matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_guc_submit.c      | 23 +++++++++++++++++++++--
>   drivers/gpu/drm/xe/xe_ring_ops.c        | 23 +++++++++++++++++++----
>   drivers/gpu/drm/xe/xe_sched_job_types.h |  2 ++
>   3 files changed, 42 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 1185b23b1384..3ba707bbb74d 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -1954,16 +1954,35 @@ void xe_guc_submit_pause(struct xe_guc *guc)
>   		xe_sched_submission_stop_async(&q->guc->sched);
>   }
>   
> +static int guc_lrc_offset(struct xe_lrc *lrc, u32 job_head)
> +{
> +	if (xe_lrc_ring_head(lrc) == job_head)
> +		return 0;

not sure why we've singled out this condition rather than putting 
(job_head <= xe_lrc_ring_head(lrc))

below, but that's just a matter of individual style, so can be both ways.

> +
> +	if (job_head < xe_lrc_ring_head(lrc))
> +		return xe_lrc_ring_head(lrc) - job_head;
> +
> +	return lrc->ring.size - job_head + xe_lrc_ring_head(lrc);

I don't think it's a good idea to read the head value from LRC multiple 
times,

this is vram access. Also if we're assuming the value in LRC is kept 
unchanged,

maybe a comment would make sense, to avoid incorrect reuse?

But instead, since it is used 4 times, a local var is fully justified.

-Tomasz

> +}
> +
>   static void guc_exec_queue_start(struct xe_exec_queue *q)
>   {
>   	struct xe_gpu_scheduler *sched = &q->guc->sched;
>   
>   	if (!exec_queue_killed_or_banned_or_wedged(q)) {
> +		struct xe_sched_job *job;
>   		int i;
>   
> +		job = xe_sched_first_pending_job(&q->guc->sched);
> +
>   		trace_xe_exec_queue_resubmit(q);
> -		for (i = 0; i < q->width; ++i)
> -			xe_lrc_set_ring_head(q->lrc[i], q->lrc[i]->ring.tail);
> +		for (i = 0; i < q->width; ++i) {
> +			int offset = !job ? 0 :
> +				guc_lrc_offset(q->lrc[i], job->ptrs[i].head);
> +
> +			xe_lrc_set_ring_head(q->lrc[i], (q->lrc[i]->ring.tail +
> +					     offset) % q->lrc[i]->ring.size);
> +		}
>   		xe_sched_resubmit_jobs(sched);
>   	}
>   
> diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c b/drivers/gpu/drm/xe/xe_ring_ops.c
> index 5f15360d14bf..4dad28f0614d 100644
> --- a/drivers/gpu/drm/xe/xe_ring_ops.c
> +++ b/drivers/gpu/drm/xe/xe_ring_ops.c
> @@ -245,12 +245,14 @@ static int emit_copy_timestamp(struct xe_lrc *lrc, u32 *dw, int i)
>   
>   /* for engines that don't require any special HW handling (no EUs, no aux inval, etc) */
>   static void __emit_job_gen12_simple(struct xe_sched_job *job, struct xe_lrc *lrc,
> -				    u64 batch_addr, u32 seqno)
> +				    u64 batch_addr, u32 *head, u32 seqno)
>   {
>   	u32 dw[MAX_JOB_SIZE_DW], i = 0;
>   	u32 ppgtt_flag = get_ppgtt_flag(job);
>   	struct xe_gt *gt = job->q->gt;
>   
> +	*head = lrc->ring.tail;
> +
>   	i = emit_copy_timestamp(lrc, dw, i);
>   
>   	if (job->ring_ops_flush_tlb) {
> @@ -296,7 +298,7 @@ static bool has_aux_ccs(struct xe_device *xe)
>   }
>   
>   static void __emit_job_gen12_video(struct xe_sched_job *job, struct xe_lrc *lrc,
> -				   u64 batch_addr, u32 seqno)
> +				   u64 batch_addr, u32 *head, u32 seqno)
>   {
>   	u32 dw[MAX_JOB_SIZE_DW], i = 0;
>   	u32 ppgtt_flag = get_ppgtt_flag(job);
> @@ -304,6 +306,8 @@ static void __emit_job_gen12_video(struct xe_sched_job *job, struct xe_lrc *lrc,
>   	struct xe_device *xe = gt_to_xe(gt);
>   	bool decode = job->q->class == XE_ENGINE_CLASS_VIDEO_DECODE;
>   
> +	*head = lrc->ring.tail;
> +
>   	i = emit_copy_timestamp(lrc, dw, i);
>   
>   	dw[i++] = preparser_disable(true);
> @@ -346,7 +350,8 @@ static void __emit_job_gen12_video(struct xe_sched_job *job, struct xe_lrc *lrc,
>   
>   static void __emit_job_gen12_render_compute(struct xe_sched_job *job,
>   					    struct xe_lrc *lrc,
> -					    u64 batch_addr, u32 seqno)
> +					    u64 batch_addr, u32 *head,
> +					    u32 seqno)
>   {
>   	u32 dw[MAX_JOB_SIZE_DW], i = 0;
>   	u32 ppgtt_flag = get_ppgtt_flag(job);
> @@ -355,6 +360,8 @@ static void __emit_job_gen12_render_compute(struct xe_sched_job *job,
>   	bool lacks_render = !(gt->info.engine_mask & XE_HW_ENGINE_RCS_MASK);
>   	u32 mask_flags = 0;
>   
> +	*head = lrc->ring.tail;
> +
>   	i = emit_copy_timestamp(lrc, dw, i);
>   
>   	dw[i++] = preparser_disable(true);
> @@ -396,11 +403,14 @@ static void __emit_job_gen12_render_compute(struct xe_sched_job *job,
>   }
>   
>   static void emit_migration_job_gen12(struct xe_sched_job *job,
> -				     struct xe_lrc *lrc, u32 seqno)
> +				     struct xe_lrc *lrc, u32 *head,
> +				     u32 seqno)
>   {
>   	u32 saddr = xe_lrc_start_seqno_ggtt_addr(lrc);
>   	u32 dw[MAX_JOB_SIZE_DW], i = 0;
>   
> +	*head = lrc->ring.tail;
> +
>   	i = emit_copy_timestamp(lrc, dw, i);
>   
>   	i = emit_store_imm_ggtt(saddr, seqno, dw, i);
> @@ -434,6 +444,7 @@ static void emit_job_gen12_gsc(struct xe_sched_job *job)
>   
>   	__emit_job_gen12_simple(job, job->q->lrc[0],
>   				job->ptrs[0].batch_addr,
> +				&job->ptrs[0].head,
>   				xe_sched_job_lrc_seqno(job));
>   }
>   
> @@ -443,6 +454,7 @@ static void emit_job_gen12_copy(struct xe_sched_job *job)
>   
>   	if (xe_sched_job_is_migration(job->q)) {
>   		emit_migration_job_gen12(job, job->q->lrc[0],
> +					 &job->ptrs[0].head,
>   					 xe_sched_job_lrc_seqno(job));
>   		return;
>   	}
> @@ -450,6 +462,7 @@ static void emit_job_gen12_copy(struct xe_sched_job *job)
>   	for (i = 0; i < job->q->width; ++i)
>   		__emit_job_gen12_simple(job, job->q->lrc[i],
>   					job->ptrs[i].batch_addr,
> +					&job->ptrs[i].head,
>   					xe_sched_job_lrc_seqno(job));
>   }
>   
> @@ -461,6 +474,7 @@ static void emit_job_gen12_video(struct xe_sched_job *job)
>   	for (i = 0; i < job->q->width; ++i)
>   		__emit_job_gen12_video(job, job->q->lrc[i],
>   				       job->ptrs[i].batch_addr,
> +				       &job->ptrs[i].head,
>   				       xe_sched_job_lrc_seqno(job));
>   }
>   
> @@ -471,6 +485,7 @@ static void emit_job_gen12_render_compute(struct xe_sched_job *job)
>   	for (i = 0; i < job->q->width; ++i)
>   		__emit_job_gen12_render_compute(job, job->q->lrc[i],
>   						job->ptrs[i].batch_addr,
> +						&job->ptrs[i].head,
>   						xe_sched_job_lrc_seqno(job));
>   }
>   
> diff --git a/drivers/gpu/drm/xe/xe_sched_job_types.h b/drivers/gpu/drm/xe/xe_sched_job_types.h
> index dbf260dded8d..359f93b0cdca 100644
> --- a/drivers/gpu/drm/xe/xe_sched_job_types.h
> +++ b/drivers/gpu/drm/xe/xe_sched_job_types.h
> @@ -24,6 +24,8 @@ struct xe_job_ptrs {
>   	struct dma_fence_chain *chain_fence;
>   	/** @batch_addr: Batch buffer address. */
>   	u64 batch_addr;
> +	/** @head: The head pointer of the LRC when the job was submitted */
> +	u32 head;
>   };
>   
>   /**
--------------OppALd09cDSYz4GEtJ3izAH0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 8/9/2025 6:34 AM, Matthew Brost
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20250809043421.1982541-1-matthew.brost@intel.com">
      <pre wrap="" class="moz-quote-pre">Take preemption into account when resubmitting jobs, and adjust the new
LRC head pointer accordingly to skip over previously executed parts of
the job. To support this, save the head pointer of each job when it is
emitted.

This code can either be leveraged or reused for VF recovery.</pre>
    </blockquote>
    <p>Right. VF migration recovery.</p>
    <p>This will help in amending the jobs ring fixup code with ring
      position control.</p>
    <blockquote type="cite" cite="mid:20250809043421.1982541-1-matthew.brost@intel.com">
      <pre wrap="" class="moz-quote-pre">

Signed-off-by: Matthew Brost <a class="moz-txt-link-rfc2396E" href="mailto:matthew.brost@intel.com">&lt;matthew.brost@intel.com&gt;</a>
---
 drivers/gpu/drm/xe/xe_guc_submit.c      | 23 +++++++++++++++++++++--
 drivers/gpu/drm/xe/xe_ring_ops.c        | 23 +++++++++++++++++++----
 drivers/gpu/drm/xe/xe_sched_job_types.h |  2 ++
 3 files changed, 42 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 1185b23b1384..3ba707bbb74d 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -1954,16 +1954,35 @@ void xe_guc_submit_pause(struct xe_guc *guc)
 		xe_sched_submission_stop_async(&amp;q-&gt;guc-&gt;sched);
 }
 
+static int guc_lrc_offset(struct xe_lrc *lrc, u32 job_head)
+{
+	if (xe_lrc_ring_head(lrc) == job_head)
+		return 0;</pre>
    </blockquote>
    <p>not sure why we've singled out this condition rather than
      putting&nbsp;<span style="white-space: pre-wrap">(job_head &lt;= xe_lrc_ring_head(lrc))</span></p>
    <p>below, but that's just a matter of individual style, so can be
      both ways.</p>
    <blockquote type="cite" cite="mid:20250809043421.1982541-1-matthew.brost@intel.com">
      <pre wrap="" class="moz-quote-pre">
+
+	if (job_head &lt; xe_lrc_ring_head(lrc))
+		return xe_lrc_ring_head(lrc) - job_head;
+
+	return lrc-&gt;ring.size - job_head + xe_lrc_ring_head(lrc);</pre>
    </blockquote>
    <p>I don't think it's a good idea to read the head value from LRC
      multiple times,</p>
    <p>this is vram access. Also if we're assuming the value in LRC is
      kept unchanged,</p>
    <p>maybe a comment would make sense, to avoid incorrect reuse?</p>
    <p>But instead, since it is used 4 times, a local var is fully
      justified.</p>
    <p>-Tomasz</p>
    <blockquote type="cite" cite="mid:20250809043421.1982541-1-matthew.brost@intel.com">
      <pre wrap="" class="moz-quote-pre">
+}
+
 static void guc_exec_queue_start(struct xe_exec_queue *q)
 {
 	struct xe_gpu_scheduler *sched = &amp;q-&gt;guc-&gt;sched;
 
 	if (!exec_queue_killed_or_banned_or_wedged(q)) {
+		struct xe_sched_job *job;
 		int i;
 
+		job = xe_sched_first_pending_job(&amp;q-&gt;guc-&gt;sched);
+
 		trace_xe_exec_queue_resubmit(q);
-		for (i = 0; i &lt; q-&gt;width; ++i)
-			xe_lrc_set_ring_head(q-&gt;lrc[i], q-&gt;lrc[i]-&gt;ring.tail);
+		for (i = 0; i &lt; q-&gt;width; ++i) {
+			int offset = !job ? 0 :
+				guc_lrc_offset(q-&gt;lrc[i], job-&gt;ptrs[i].head);
+
+			xe_lrc_set_ring_head(q-&gt;lrc[i], (q-&gt;lrc[i]-&gt;ring.tail +
+					     offset) % q-&gt;lrc[i]-&gt;ring.size);
+		}
 		xe_sched_resubmit_jobs(sched);
 	}
 
diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c b/drivers/gpu/drm/xe/xe_ring_ops.c
index 5f15360d14bf..4dad28f0614d 100644
--- a/drivers/gpu/drm/xe/xe_ring_ops.c
+++ b/drivers/gpu/drm/xe/xe_ring_ops.c
@@ -245,12 +245,14 @@ static int emit_copy_timestamp(struct xe_lrc *lrc, u32 *dw, int i)
 
 /* for engines that don't require any special HW handling (no EUs, no aux inval, etc) */
 static void __emit_job_gen12_simple(struct xe_sched_job *job, struct xe_lrc *lrc,
-				    u64 batch_addr, u32 seqno)
+				    u64 batch_addr, u32 *head, u32 seqno)
 {
 	u32 dw[MAX_JOB_SIZE_DW], i = 0;
 	u32 ppgtt_flag = get_ppgtt_flag(job);
 	struct xe_gt *gt = job-&gt;q-&gt;gt;
 
+	*head = lrc-&gt;ring.tail;
+
 	i = emit_copy_timestamp(lrc, dw, i);
 
 	if (job-&gt;ring_ops_flush_tlb) {
@@ -296,7 +298,7 @@ static bool has_aux_ccs(struct xe_device *xe)
 }
 
 static void __emit_job_gen12_video(struct xe_sched_job *job, struct xe_lrc *lrc,
-				   u64 batch_addr, u32 seqno)
+				   u64 batch_addr, u32 *head, u32 seqno)
 {
 	u32 dw[MAX_JOB_SIZE_DW], i = 0;
 	u32 ppgtt_flag = get_ppgtt_flag(job);
@@ -304,6 +306,8 @@ static void __emit_job_gen12_video(struct xe_sched_job *job, struct xe_lrc *lrc,
 	struct xe_device *xe = gt_to_xe(gt);
 	bool decode = job-&gt;q-&gt;class == XE_ENGINE_CLASS_VIDEO_DECODE;
 
+	*head = lrc-&gt;ring.tail;
+
 	i = emit_copy_timestamp(lrc, dw, i);
 
 	dw[i++] = preparser_disable(true);
@@ -346,7 +350,8 @@ static void __emit_job_gen12_video(struct xe_sched_job *job, struct xe_lrc *lrc,
 
 static void __emit_job_gen12_render_compute(struct xe_sched_job *job,
 					    struct xe_lrc *lrc,
-					    u64 batch_addr, u32 seqno)
+					    u64 batch_addr, u32 *head,
+					    u32 seqno)
 {
 	u32 dw[MAX_JOB_SIZE_DW], i = 0;
 	u32 ppgtt_flag = get_ppgtt_flag(job);
@@ -355,6 +360,8 @@ static void __emit_job_gen12_render_compute(struct xe_sched_job *job,
 	bool lacks_render = !(gt-&gt;info.engine_mask &amp; XE_HW_ENGINE_RCS_MASK);
 	u32 mask_flags = 0;
 
+	*head = lrc-&gt;ring.tail;
+
 	i = emit_copy_timestamp(lrc, dw, i);
 
 	dw[i++] = preparser_disable(true);
@@ -396,11 +403,14 @@ static void __emit_job_gen12_render_compute(struct xe_sched_job *job,
 }
 
 static void emit_migration_job_gen12(struct xe_sched_job *job,
-				     struct xe_lrc *lrc, u32 seqno)
+				     struct xe_lrc *lrc, u32 *head,
+				     u32 seqno)
 {
 	u32 saddr = xe_lrc_start_seqno_ggtt_addr(lrc);
 	u32 dw[MAX_JOB_SIZE_DW], i = 0;
 
+	*head = lrc-&gt;ring.tail;
+
 	i = emit_copy_timestamp(lrc, dw, i);
 
 	i = emit_store_imm_ggtt(saddr, seqno, dw, i);
@@ -434,6 +444,7 @@ static void emit_job_gen12_gsc(struct xe_sched_job *job)
 
 	__emit_job_gen12_simple(job, job-&gt;q-&gt;lrc[0],
 				job-&gt;ptrs[0].batch_addr,
+				&amp;job-&gt;ptrs[0].head,
 				xe_sched_job_lrc_seqno(job));
 }
 
@@ -443,6 +454,7 @@ static void emit_job_gen12_copy(struct xe_sched_job *job)
 
 	if (xe_sched_job_is_migration(job-&gt;q)) {
 		emit_migration_job_gen12(job, job-&gt;q-&gt;lrc[0],
+					 &amp;job-&gt;ptrs[0].head,
 					 xe_sched_job_lrc_seqno(job));
 		return;
 	}
@@ -450,6 +462,7 @@ static void emit_job_gen12_copy(struct xe_sched_job *job)
 	for (i = 0; i &lt; job-&gt;q-&gt;width; ++i)
 		__emit_job_gen12_simple(job, job-&gt;q-&gt;lrc[i],
 					job-&gt;ptrs[i].batch_addr,
+					&amp;job-&gt;ptrs[i].head,
 					xe_sched_job_lrc_seqno(job));
 }
 
@@ -461,6 +474,7 @@ static void emit_job_gen12_video(struct xe_sched_job *job)
 	for (i = 0; i &lt; job-&gt;q-&gt;width; ++i)
 		__emit_job_gen12_video(job, job-&gt;q-&gt;lrc[i],
 				       job-&gt;ptrs[i].batch_addr,
+				       &amp;job-&gt;ptrs[i].head,
 				       xe_sched_job_lrc_seqno(job));
 }
 
@@ -471,6 +485,7 @@ static void emit_job_gen12_render_compute(struct xe_sched_job *job)
 	for (i = 0; i &lt; job-&gt;q-&gt;width; ++i)
 		__emit_job_gen12_render_compute(job, job-&gt;q-&gt;lrc[i],
 						job-&gt;ptrs[i].batch_addr,
+						&amp;job-&gt;ptrs[i].head,
 						xe_sched_job_lrc_seqno(job));
 }
 
diff --git a/drivers/gpu/drm/xe/xe_sched_job_types.h b/drivers/gpu/drm/xe/xe_sched_job_types.h
index dbf260dded8d..359f93b0cdca 100644
--- a/drivers/gpu/drm/xe/xe_sched_job_types.h
+++ b/drivers/gpu/drm/xe/xe_sched_job_types.h
@@ -24,6 +24,8 @@ struct xe_job_ptrs {
 	struct dma_fence_chain *chain_fence;
 	/** @batch_addr: Batch buffer address. */
 	u64 batch_addr;
+	/** @head: The head pointer of the LRC when the job was submitted */
+	u32 head;
 };
 
 /**
</pre>
    </blockquote>
  </body>
</html>

--------------OppALd09cDSYz4GEtJ3izAH0--
