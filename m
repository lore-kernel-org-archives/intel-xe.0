Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCB4AD116F1
	for <intel-xe@archiver.kernel.org>; Mon,  1 Dec 2025 17:46:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98FF810E43C;
	Mon,  1 Dec 2025 17:46:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PHc/Stw7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C74010E43C
 for <intel-xe@lists.freedesktop.org>; Mon,  1 Dec 2025 17:46:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764611193; x=1796147193;
 h=message-id:date:subject:to:references:from:in-reply-to:
 mime-version; bh=bANPqiX4NWjC4lJKA2+lRgKb3zzYu73WvfbGng1cYw8=;
 b=PHc/Stw7M+8d3KfOSEfw5GsohZHYlwSipXIyzNZcRL/yxW3OrftcPQHD
 hmi3L8cIuzvZQT2DPa3JP9FOPd5YwGKrT2gbgzBXamcu8eWotWHAHlh5E
 waf6TtP2e7zjzFD33h65puPevX3AjOwCe99RpYLttaVHqtLFWXo7U2m0U
 0+nKo7IgEpVlSuXubNJgb4LZAg9znYybQsuRy7II/fglLbnnqMY7Cvx7R
 Vn41hysYCi5se2U8CZXfy7zC2D63AYXoWPuSLLv3rr88jWiVQs2z7kwgP
 d2Y2679AfUSp3Z/Mb93njhBQrV1GgsU8iZcz2qyyVwvlIiIC1k00hlN/w A==;
X-CSE-ConnectionGUID: DlX6Np/5TnicospG4tZg3w==
X-CSE-MsgGUID: Lq5kVzazQ1CqxVco+SQfYQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="77661893"
X-IronPort-AV: E=Sophos;i="6.20,241,1758610800"; d="scan'208,217";a="77661893"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2025 09:46:32 -0800
X-CSE-ConnectionGUID: gP3Q6ABhRB66P6EZjGXdpg==
X-CSE-MsgGUID: lgxiRk+MQmeU5jUSceJATQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,241,1758610800"; 
 d="scan'208,217";a="194230849"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2025 09:46:32 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 1 Dec 2025 09:46:31 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 1 Dec 2025 09:46:31 -0800
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.57) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 1 Dec 2025 09:46:30 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ODEkmvz/C+/MGtYMSbPd/Zqt+gP5T3dpn/v1AID5+6eU8oybgdMqvNPk1nxKahCKF3x+NMHvcTK+q4aWfEplw203pqzqxwQOf6QKiUXzFRNU5NFNZ+5nn1RmwHlbzxWvYY79NKBvQXUJtFz1dtc+YM7Ipeji+V8qhypyLhM1entyoz8VUoDfKjID7DBzwusoUuOeVo7mZ5FvH7sp44mmShJdfO1xGtJww2JxpENpFFM+ZEmgjpf4KJYzU+LlsR+ENYUvjrv9fyZCmZ4fU/tEtcQ+mDZdKd7WdwOSyyYpjrHAREFqCOXwx1KBD73KBxWDB5YAYCHsEjMDzHanZwhPaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PIVvgnQ+s+XJEhFVqDrHMikZvEHQDZm0HDZtedLB9bQ=;
 b=nkJYudh9B9xAhwcUKU9arTQD102ABjUEmjhFS/lQX5aHdLuof8X/A9mQIV/4sI7IRt0d9yxKedpKQHOlKUXcNxgEsyB2xI83SCUh4SIMEhD+hE0+2VW5zu1aBPivXiv5IuR+xVcSIGhmgq/42nQAzXLAnJkgtISomHadIOJw86GcxBj63TQ1ZCwhrjdw2rjZnmLwG1zcK/0Nw4zj/5KO9IN6XBtAxl1E+1+t0TK4D7pcPEc7mFCFGMxNdn6/mUE3qeIJV0WzhR0ra12ppzQSf/T/ZFoa2SVwTPLCgRf2NT+RvHtjAtF4Wc2kMy6zjucplh1nnz86kpN51L4DjStrYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by SJ0PR11MB8295.namprd11.prod.outlook.com (2603:10b6:a03:479::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Mon, 1 Dec
 2025 17:46:19 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::48d7:f2a6:b18:1b87]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::48d7:f2a6:b18:1b87%5]) with mapi id 15.20.9366.012; Mon, 1 Dec 2025
 17:46:19 +0000
Content-Type: multipart/alternative;
 boundary="------------DPPawdaK0540trPMYykfItp8"
Message-ID: <d024e714-b6eb-441a-959a-8c98bbf0e838@intel.com>
Date: Mon, 1 Dec 2025 09:46:17 -0800
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_Introduce_S?=
 =?UTF-8?Q?RIOV_scheduler_groups?=
To: <intel-xe@lists.freedesktop.org>
References: <20251127014507.2323746-12-daniele.ceraolospurio@intel.com>
 <176421349329.30433.14973984677593608995@a3b018990fe9>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <176421349329.30433.14973984677593608995@a3b018990fe9>
X-ClientProxiedBy: BYAPR02CA0050.namprd02.prod.outlook.com
 (2603:10b6:a03:54::27) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|SJ0PR11MB8295:EE_
X-MS-Office365-Filtering-Correlation-Id: 58d6886b-011d-4ac3-61c2-08de310188bc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|13003099007|8096899003; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RHBEVDhZdUh0MzNhY0hnV21vRVlpQlRhanVyNTF6SkVwZWVRa2dxa0V2SmJG?=
 =?utf-8?B?cGNPTjdyZlRGUWVUQUZQdWtWNHI4VU5Na0xLQ1pUcGY2UE5iQ0lrbXhXeGJQ?=
 =?utf-8?B?dS8yVmtTWGVwVnNBeHRlUWEwb1VvY0pObmNtd2REeS9zNjNsN3h4SEJaRktS?=
 =?utf-8?B?ZUdmaHJ1QUM4RnNJNmFKbVRzdklDRzdQNzFJVjJwRUsxM0VnQlBic2FJeDdW?=
 =?utf-8?B?cS9uR1JvTlcybjA4OW8zS0NwMW5yNThFRkpmK1ltRXBONzlJYlNlZ0IwR09W?=
 =?utf-8?B?RVBSSjlyamFVRGErM2c2S3BJcVlOd09sLzdKbzY1NnM4aXc1aWJ4cTFxZ2hV?=
 =?utf-8?B?WHVMSlIrNitacjZkSnlCT1ZYM0t2c0dNeGVmK0VlSWRxY2dFbDJYZ2haWUxk?=
 =?utf-8?B?cVRDVmNHTVhKYUhPZWFReHBYMXJCVktvb0NINHZOR3ZBaG1iUFMrUlg5Sm9W?=
 =?utf-8?B?UVlpY25lcW52cnZoeGUxbm1jeFJXa1UvbGdWUVdoSnZRSUkzNkhOeXlGREZT?=
 =?utf-8?B?M01JOVBlMzd4WGh6d0J6dFRtZ1FlL0lhZSt0RzFWQ0dIME0wSnBjajZSUk9q?=
 =?utf-8?B?cWlmTllGbS9vNEhDSUhNM0habmEvUDZ3NE9vLzVSL2gzVmxMcTZyTmVOUG8z?=
 =?utf-8?B?UmtpRG5DQ2MycnN2VVpoZ1NxYWxNYjQrVmVEYjVDZXNVa01tYnVpUjdJYVli?=
 =?utf-8?B?Mml2Q202eWxoNXZCWnZlUjkxKzkrenJvTmRLZHVaNkpqYzN0MmlQeFpYbzhY?=
 =?utf-8?B?RmthWk96N1RXQ2J4NVhQbDN1K3VqaEQ3RHg5U0pITU9xSHBYVmx4bm1NdlV3?=
 =?utf-8?B?cThHbmpSRnJxdnZpb0s3a3dRaDlLRkFoTXFTWHQ2dkxzTyt0S3JwMUhHR0FO?=
 =?utf-8?B?RlJydkpLVDZIR21FeWZsL0dLRiszaTNjeGlHaDZmTXFNNkg1aWlCSEVuVGt3?=
 =?utf-8?B?Yk9lb3ZMMWthdGJFZmpLRG5tSStnVjZMNTYwV2ZsbUFWclRVLzVJRzhVMHdT?=
 =?utf-8?B?endObjJjTGpydkpGd2RZRDlCbklsV3BRSW9HZnlNQThMVjgxMDFIUzJnZktv?=
 =?utf-8?B?RVVxMURmdlh2YXVucG45eHp0bDI5cnNhZnIzZjdvYUphSUVMTWVUZXg0YXl1?=
 =?utf-8?B?dVYwaEhiUXY0Q045YjluRW1reEZ1OGR1Vkg4SEpIOEQvWFNHc3V2ZzkwV3ZK?=
 =?utf-8?B?MDVsOGxwWDUyQmRQeGhPUWRhb0pDMDcyYm92VE9nNzR6VU94NTY5Zm9sY21I?=
 =?utf-8?B?SDlpZlBrYnQybEt3ai85KzJ6Y3pXR1loRExXdnhNZkNsRlFoKzErdTdDWW94?=
 =?utf-8?B?ZXRkaHFkdTE2SmV6WEIzaHlzRTgvN2hTMmIybitKaVlKamFxR050eExIT1Bm?=
 =?utf-8?B?N3pZYzdReXRPOGMxL1VaQ3RCQmVVckRkUVZIbVhyR2UwRG0xcHFwRS92Z1lP?=
 =?utf-8?B?MWZLVTMyOCtIWUdsMTRpUlhzQXVkVGR4WUU4RE11VitFL2RvYjRDeVJzYjZ0?=
 =?utf-8?B?ZjVXOXhqVGw4ZGl5ZFlPaEQzZTliNFhRczk5YVlWdTNzWVhqMDZtWXArZjd0?=
 =?utf-8?B?dzJEUkdzNURhaVdaRTN1YWUraVJKZHdsVEJ0aXJERll6aVgvRjRhQUlONVNP?=
 =?utf-8?B?c1g3Wm00d1FvQ1BaRU9ScmExV0s0aitzcW5sSkc5UTJUb3E3V0xLTjBHYzZJ?=
 =?utf-8?B?bFB2TThObHkxbjVRZCs0czZobjRkNjQzejN5WldQenVRalNRa21LaEtmY3BY?=
 =?utf-8?B?SFBFSklLem44RXpKR0NZUzQwMmlCak5ZczVKNE9VZE8yVk0rbkt3RGZIaUd1?=
 =?utf-8?B?d3Nmc01aMDBCWFNKU1NxRDVZQU9PcDEzMEkvbDNzWS8yV05ld1JraTdua29Z?=
 =?utf-8?B?TTVTZU9SeklaOXlJUU9DVDh4aXVpL0tZN3ZwS0JoOXlKMXc9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(13003099007)(8096899003); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a3h3RHc3Mk5tY0lzMzYxUmJ6MHk1dzJDNmVRa0Y1VDhsM0dHcGZVdCtnWktx?=
 =?utf-8?B?ZDNhSnNvYTNBanlTdHBqa3BWTElIRlYxZlc2dytUaGQ5d0dIanlDYXk3V2t1?=
 =?utf-8?B?dm5GREpWT1lvTWI1UkJLeklzRkd1VmVDcUo1TUtsTERIeStjZWhrU1RkbUFk?=
 =?utf-8?B?ekNQNkw0TnlYRFpJSnNaMFVjR0s4cTVMdkF6OEVLQXVldG9aTmpqQnlWRGR4?=
 =?utf-8?B?bmFkYWx1RW00dU82TWpTdjgwWTVpZW51MTN2R2NEWlovRVFPRzQrSmlhb2NP?=
 =?utf-8?B?V3ZlNzNueTdXYjBaOHJqQ3NVZTk3NlcwUTdHMUNuQzBtcTNFUStIemZNU3R3?=
 =?utf-8?B?T3AxeWkwcXZiei9lejhGQ3lucS9tQzVBcVJ6SXNtMHBRYVNYWHRNdHlGek1y?=
 =?utf-8?B?UXhSRGpMZlZaVUtnR1N6a21ZRmFVVXprSUpPckFOWHhtcmRsR1lJU3JKZGlJ?=
 =?utf-8?B?U1A3WDUxcVIxeHE1QUxOYkw5alhuQi9kSDhja2x4UjV0N1NGMmNuaWRGVUlK?=
 =?utf-8?B?aVZHbm9yZ0FFWnRScE1KdEJKVHhJVVNRbXY4bVR5UnZGeS8xdzFIR3hZalRD?=
 =?utf-8?B?YmVCeU1tZjA1RG1IcGN6WHR4dytnTjlISHdoVU5PQXhVSkNrd1NleVR0Tk1E?=
 =?utf-8?B?aGpMdGZsRzNMaTBtVEcwdGNnR0JMajFudnRWVko1VFQyOFA1aTJaSnIxMU9y?=
 =?utf-8?B?dnJmd21DUEttbklQeTJhTTQ3aGZwVHBSd0JPUktlQnFtMFlYczBIU3ZQclJN?=
 =?utf-8?B?WS9KMUFpYnhUaUphUzlzUXlvWkRpcVg0N05QN0FCWmYzZWMvOEtPVXQ1aDBR?=
 =?utf-8?B?d3RybnZaNHowWkVzTlBKYWlIYytxVFRKU0NNSTl6VFRtN2l6V24za2N6cnMx?=
 =?utf-8?B?bHl2T1JKUUVrV2pWZ1hIZ3BZVWlTdkYzVnZ1NDN5MGtMZXp3Vk9DMXYzckFs?=
 =?utf-8?B?YytaNDQ5RHZyeWxsSDdqSmNZdWZKQ0ErQlZtOEE2dk5GcG41THpYdUY4QVpG?=
 =?utf-8?B?NVRzNEMxWEtnT2U4RExONmxwRzRQYk1Rb0ErQzI5ZmY2MDNsbEtlblROT0lQ?=
 =?utf-8?B?cG1HV0c1eGdOL2preFhQU3h5KzQwN3VURDBDb3lqYmVxWnl2VEdaVVd1SEk5?=
 =?utf-8?B?RUloZGhFc3l2Qk1CWUJXNlhYbHczam1XVEo0cm1JaU1vMzVUdmhQSFBHQnZB?=
 =?utf-8?B?cTdPTjYrODlnWXNNMHJMaWZkUkZJcUs1Z0RBQzUzN3dnUXQwNi9nWUJaTXFR?=
 =?utf-8?B?dWRpR1hxVnpVVTJUZTJvVU82aDhDWXF5TzBhNVZYVDVkY0k5UmRsZFJ3b1pk?=
 =?utf-8?B?UkJvSUVjQ1UvU1pKb2V3eitMb2FyWE02cjNYU0xYUnJCSGNPdklYd0l6VUZK?=
 =?utf-8?B?eWxLNVFUZDJiNHk5R3VPelZteVJlQmM1QWJka0dDVGQ1a3l4a1I1UjVIbFZD?=
 =?utf-8?B?NUhvUjZkUGU1MFhOS2wyVDU2c1lDZU1RbEYwY3NPcWp2bENXNSt1V3IyNVBL?=
 =?utf-8?B?bTI4VHYrdG5hU0xkR3B5aExVVG9wbnJDb2d2bzM4L2pFVnRUTzl6cEFpM1lC?=
 =?utf-8?B?RVJ3aVd3bUtTc0NadG5YUVh3bHVGa0lhK0diOEptL0FWcDVxaUdTVEdGTjFn?=
 =?utf-8?B?dHY2ZHkwaHFVcTNCQVVzdVBwMVV0UGg0T01tV1M0ZjAzMER4SzdlTFJrNXI4?=
 =?utf-8?B?NVVoT1NaS0ZCZSt3VVJHRGVIZlJ6M3lscjl1czFtZXBzMmE4aGpVSWRNTE8x?=
 =?utf-8?B?bzlLM09PVUloWExKL1RyczhQM1dCUG9ueUlkZjExVm91SzlJY0tSR0hQSFcr?=
 =?utf-8?B?Tm9HaHZNYWlWZVZuZHFOUTZSN3B1UUJWa205UGFHRk13OCtOdGY2VjBxcU1y?=
 =?utf-8?B?d1kyTjUvTllTZHc4TXREdE9NcXgxbVBqcFhVWDZUNXBQdzhERjVkSGZtOFJK?=
 =?utf-8?B?aFczNGNldVpwdXN6dyt6MnZ5ZDluS1BraXFrMCtBM3E0aEZLYmh6RjN1bTgv?=
 =?utf-8?B?cHFVTXJOeGdQZzZOZjNFUXpaeWkvbUJValhua0xqMXZKeXIxakdpeGxkV243?=
 =?utf-8?B?Z3lieExTWFJjUmVxOFE2Y3lJMUNPbDRQcnJUalZ1TTZPU1FkUVUxRDVRREU2?=
 =?utf-8?B?cVBJcm5YeVVtdGR5V1JuVlplOU5LVkM0SE1vSGRicUtWT005bjRlMFYwQ0ho?=
 =?utf-8?B?MVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 58d6886b-011d-4ac3-61c2-08de310188bc
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2025 17:46:19.3655 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MYOnpPwYrNPbBus8jDE1nhELaPYq+2inmIU8198fw1Pmmsc8tdAchoOky0kqT2w0uUZHHdQEW4Eg8wNMV7/dbXTPpGPR0ii86E5jP/vjC/4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB8295
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

--------------DPPawdaK0540trPMYykfItp8
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit



On 11/26/2025 7:18 PM, Patchwork wrote:
> Project List - Patchwork *Patch Details*
> *Series:* 	Introduce SRIOV scheduler groups
> *URL:* 	https://patchwork.freedesktop.org/series/158142/
> *State:* 	failure
> *Details:* 
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v1/index.html
>
>
>   CI Bug Log - changes from
>   xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884_FULL ->
>   xe-pw-158142v1_FULL
>
>
>     Summary
>
> *FAILURE*
>
> Serious unknown changes coming with xe-pw-158142v1_FULL absolutely 
> need to be
> verified manually.
>
> If you think the reported changes have nothing to do with the changes
> introduced in xe-pw-158142v1_FULL, please notify your bug team 
> (I915-ci-infra@lists.freedesktop.org) to allow them
> to document this new failure mode, which will reduce false positives 
> in CI.
>
>
>     Participating hosts (4 -> 4)
>
> No changes in participating hosts
>
>
>     Possible new issues
>
> Here are the unknown changes that may have been introduced in 
> xe-pw-158142v1_FULL:
>
>
>       IGT changes
>
>
>         Possible regressions
>
>   * igt@xe_module_load@load:
>       o shard-adlp: (PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884/shard-adlp-4/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884/shard-adlp-4/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884/shard-adlp-4/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884/shard-adlp-3/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884/shard-adlp-4/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884/shard-adlp-1/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884/shard-adlp-1/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884/shard-adlp-1/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884/shard-adlp-1/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884/shard-adlp-9/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884/shard-adlp-6/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884/shard-adlp-9/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884/shard-adlp-8/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884/shard-adlp-8/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884/shard-adlp-6/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884/shard-adlp-8/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884/shard-adlp-9/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884/shard-adlp-9/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884/shard-adlp-6/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884/shard-adlp-2/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884/shard-adlp-2/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884/shard-adlp-2/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884/shard-adlp-3/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884/shard-adlp-3/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884/shard-adlp-2/igt@xe_module_load@load.html>)
>         -> (ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v1/shard-adlp-6/igt@xe_module_load@load.html>,
>         ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v1/shard-adlp-6/igt@xe_module_load@load.html>,
>         ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v1/shard-adlp-6/igt@xe_module_load@load.html>,
>         ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v1/shard-adlp-6/igt@xe_module_load@load.html>,
>         ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v1/shard-adlp-2/igt@xe_module_load@load.html>,
>         ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v1/shard-adlp-2/igt@xe_module_load@load.html>,
>         ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v1/shard-adlp-2/igt@xe_module_load@load.html>,
>         ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v1/shard-adlp-2/igt@xe_module_load@load.html>,
>         ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v1/shard-adlp-3/igt@xe_module_load@load.html>,
>         ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v1/shard-adlp-3/igt@xe_module_load@load.html>,
>         ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v1/shard-adlp-3/igt@xe_module_load@load.html>,
>         ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v1/shard-adlp-1/igt@xe_module_load@load.html>,
>         ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v1/shard-adlp-1/igt@xe_module_load@load.html>,
>         ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v1/shard-adlp-1/igt@xe_module_load@load.html>,
>         ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v1/shard-adlp-4/igt@xe_module_load@load.html>,
>         ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v1/shard-adlp-4/igt@xe_module_load@load.html>,
>         ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v1/shard-adlp-4/igt@xe_module_load@load.html>,
>         ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v1/shard-adlp-8/igt@xe_module_load@load.html>,
>         ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v1/shard-adlp-8/igt@xe_module_load@load.html>,
>         ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v1/shard-adlp-8/igt@xe_module_load@load.html>,
>         ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v1/shard-adlp-9/igt@xe_module_load@load.html>,
>         ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v1/shard-adlp-9/igt@xe_module_load@load.html>)
>       o shard-dg2-set2: (PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884/shard-dg2-435/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884/shard-dg2-466/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884/shard-dg2-463/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884/shard-dg2-435/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884/shard-dg2-463/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884/shard-dg2-463/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884/shard-dg2-432/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884/shard-dg2-435/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884/shard-dg2-466/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884/shard-dg2-432/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884/shard-dg2-432/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884/shard-dg2-466/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884/shard-dg2-436/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884/shard-dg2-436/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884/shard-dg2-436/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884/shard-dg2-436/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884/shard-dg2-464/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884/shard-dg2-464/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884/shard-dg2-433/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884/shard-dg2-433/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884/shard-dg2-464/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884/shard-dg2-433/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884/shard-dg2-434/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884/shard-dg2-434/igt@xe_module_load@load.html>)
>         -> (ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v1/shard-dg2-432/igt@xe_module_load@load.html>,
>         ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v1/shard-dg2-432/igt@xe_module_load@load.html>,
>         ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v1/shard-dg2-432/igt@xe_module_load@load.html>,
>         ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v1/shard-dg2-432/igt@xe_module_load@load.html>,
>         ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v1/shard-dg2-436/igt@xe_module_load@load.html>,
>         ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v1/shard-dg2-436/igt@xe_module_load@load.html>,
>         ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v1/shard-dg2-433/igt@xe_module_load@load.html>,
>         ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v1/shard-dg2-433/igt@xe_module_load@load.html>,
>         ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v1/shard-dg2-433/igt@xe_module_load@load.html>,
>         ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v1/shard-dg2-464/igt@xe_module_load@load.html>,
>         ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v1/shard-dg2-464/igt@xe_module_load@load.html>,
>         ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v1/shard-dg2-464/igt@xe_module_load@load.html>,
>         ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v1/shard-dg2-434/igt@xe_module_load@load.html>,
>         ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v1/shard-dg2-434/igt@xe_module_load@load.html>,
>         ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v1/shard-dg2-434/igt@xe_module_load@load.html>,
>         ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v1/shard-dg2-435/igt@xe_module_load@load.html>,
>         ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v1/shard-dg2-435/igt@xe_module_load@load.html>,
>         ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v1/shard-dg2-435/igt@xe_module_load@load.html>,
>         ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v1/shard-dg2-466/igt@xe_module_load@load.html>,
>         ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v1/shard-dg2-466/igt@xe_module_load@load.html>,
>         ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v1/shard-dg2-466/igt@xe_module_load@load.html>,
>         ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v1/shard-dg2-463/igt@xe_module_load@load.html>,
>         ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v1/shard-dg2-463/igt@xe_module_load@load.html>)
>

I missed the fact that the GuC FW only supports this feature for BMG and 
newer HW (I did all my local testing on BMG), so it fails when we try to 
enable it on older platforms. I'll add a platform check in the next rev.

Daniele

>  *
>
>
>     New tests
>
> New tests have been introduced between 
> xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884_FULL and 
> xe-pw-158142v1_FULL:
>
>
>       New IGT tests (1)
>
>   * igt@xe_gpgpu_fill@offset-16x16:
>       o Statuses : 2 pass(s)
>       o Exec time: [0.00] s
>
>
>     Known issues
>
> Here are the changes found in xe-pw-158142v1_FULL that come from known 
> issues:
>
>
>       IGT changes
>
>
>         Issues hit
>
>  *
>
>     igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v1/shard-bmg-1/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0.html>
>         (Intel XE#1124
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124>)
>  *
>
>     igt@kms_cdclk@mode-transition:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v1/shard-bmg-1/igt@kms_cdclk@mode-transition.html>
>         (Intel XE#2724
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724>)
>  *
>
>     igt@kms_chamelium_hpd@hdmi-hpd-enable-disable-mode:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v1/shard-bmg-1/igt@kms_chamelium_hpd@hdmi-hpd-enable-disable-mode.html>
>         (Intel XE#2252
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252>)
>  *
>
>     igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic:
>
>       o shard-bmg: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884/shard-bmg-7/igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v1/shard-bmg-6/igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic.html>
>         (Intel XE#2291
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291>)
>  *
>
>     igt@kms_flip@2x-flip-vs-rmfb:
>
>       o shard-bmg: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884/shard-bmg-7/igt@kms_flip@2x-flip-vs-rmfb.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v1/shard-bmg-6/igt@kms_flip@2x-flip-vs-rmfb.html>
>         (Intel XE#2316
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316>)
>  *
>
>     igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-pgflip-blt:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-pgflip-blt.html>
>         (Intel XE#2311
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311>)
>  *
>
>     igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-plflip-blt:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v1/shard-bmg-1/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-plflip-blt.html>
>         (Intel XE#2313
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313>) +1
>         other test skip
>  *
>
>     igt@kms_hdr@bpc-switch-dpms:
>
>       o shard-bmg: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884/shard-bmg-4/igt@kms_hdr@bpc-switch-dpms.html>
>         -> ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v1/shard-bmg-7/igt@kms_hdr@bpc-switch-dpms.html>
>         (Intel XE#6662
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6662>) +1
>         other test abort
>  *
>
>     igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b:
>
>       o shard-bmg: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884/shard-bmg-6/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b.html>
>         -> ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v1/shard-bmg-2/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b.html>
>         (Intel XE#6675
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6675>) +1
>         other test abort
>  *
>
>     igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v1/shard-bmg-1/igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area.html>
>         (Intel XE#1406
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406> /
>         Intel XE#1489
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489>) +1
>         other test skip
>  *
>
>     igt@kms_vblank@ts-continuation-suspend:
>
>       o shard-bmg: NOTRUN -> ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v1/shard-bmg-1/igt@kms_vblank@ts-continuation-suspend.html>
>         (Intel XE#6675
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6675>) +3
>         other tests abort
>  *
>
>     igt@xe_exec_system_allocator@many-stride-malloc-prefetch:
>
>       o shard-bmg: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884/shard-bmg-8/igt@xe_exec_system_allocator@many-stride-malloc-prefetch.html>
>         -> WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v1/shard-bmg-8/igt@xe_exec_system_allocator@many-stride-malloc-prefetch.html>
>         (Intel XE#5786
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5786>)
>  *
>
>     igt@xe_exec_system_allocator@process-many-free-madvise:
>
>       o shard-bmg: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884/shard-bmg-8/igt@xe_exec_system_allocator@process-many-free-madvise.html>
>         -> ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v1/shard-bmg-3/igt@xe_exec_system_allocator@process-many-free-madvise.html>
>         (Intel XE#3970
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3970>)
>  *
>
>     igt@xe_pmu@engine-activity-accuracy-50:
>
>       o shard-lnl: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884/shard-lnl-1/igt@xe_pmu@engine-activity-accuracy-50.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v1/shard-lnl-2/igt@xe_pmu@engine-activity-accuracy-50.html>
>         (Intel XE#6251
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6251>) +2
>         other tests fail
>
>
>         Possible fixes
>
>  *
>
>     igt@kms_cursor_edge_walk@256x256-left-edge:
>
>       o shard-bmg: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884/shard-bmg-2/igt@kms_cursor_edge_walk@256x256-left-edge.html>
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v1/shard-bmg-4/igt@kms_cursor_edge_walk@256x256-left-edge.html>
>  *
>
>     igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html>
>         (Intel XE#2291
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v1/shard-bmg-5/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html>
>         +3 other tests pass
>  *
>
>     igt@kms_cursor_legacy@flip-vs-cursor-legacy:
>
>       o shard-bmg: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884/shard-bmg-8/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html>
>         (Intel XE#5299
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5299>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v1/shard-bmg-4/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html>
>  *
>
>     igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884/shard-bmg-6/igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible.html>
>         (Intel XE#2316
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v1/shard-bmg-5/igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible.html>
>         +1 other test pass
>  *
>
>     igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1:
>
>       o shard-lnl: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html>
>         (Intel XE#301
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/301> /
>         Intel XE#3149
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v1/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html>
>  *
>
>     igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a:
>
>       o shard-bmg: ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884/shard-bmg-6/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a.html>
>         (Intel XE#6675
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6675>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v1/shard-bmg-2/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a.html>
>  *
>
>     igt@kms_vblank@ts-continuation-dpms-suspend@pipe-c-edp-1:
>
>       o shard-lnl: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884/shard-lnl-4/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-c-edp-1.html>
>         (Intel XE#4488
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4488>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v1/shard-lnl-4/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-c-edp-1.html>
>  *
>
>     igt@xe_exec_system_allocator@processes-evict-malloc:
>
>       o shard-bmg: ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884/shard-bmg-5/igt@xe_exec_system_allocator@processes-evict-malloc.html>
>         (Intel XE#3970
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3970>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v1/shard-bmg-1/igt@xe_exec_system_allocator@processes-evict-malloc.html>
>
>
>         Warnings
>
>  *
>
>     igt@kms_flip@flip-vs-expired-vblank-interruptible:
>
>       o shard-lnl: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank-interruptible.html>
>         (Intel XE#301
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/301> /
>         Intel XE#3149
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149>) ->
>         FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v1/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank-interruptible.html>
>         (Intel XE#301
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/301>)
>  *
>
>     igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc.html>
>         (Intel XE#2312
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v1/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc.html>
>         (Intel XE#2311
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311>) +7
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-blt:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-blt.html>
>         (Intel XE#2312
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-blt.html>
>         (Intel XE#4141
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141>)
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt.html>
>         (Intel XE#4141
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt.html>
>         (Intel XE#2312
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312>)
>  *
>
>     igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-fullscreen:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-fullscreen.html>
>         (Intel XE#2311
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-fullscreen.html>
>         (Intel XE#2312
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312>) +3
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-render:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-render.html>
>         (Intel XE#2312
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v1/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-render.html>
>         (Intel XE#2313
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313>) +6
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc.html>
>         (Intel XE#2313
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v1/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc.html>
>         (Intel XE#2312
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312>) +3
>         other tests skip
>  *
>
>     igt@kms_tiled_display@basic-test-pattern-with-chamelium:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884/shard-bmg-4/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html>
>         (Intel XE#2509
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v1/shard-bmg-8/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html>
>         (Intel XE#2426
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426>)
>
>
>     Build changes
>
>   * Linux: xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884 ->
>     xe-pw-158142v1
>
> IGT_8639: 2ce563031e6b2ec91479f6af8c326d25c15bdb26 @ 
> https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884: 
> e7a767430515c3a6e8aee91c2a68cba8b06fe884
> xe-pw-158142v1: 158142v1
>

--------------DPPawdaK0540trPMYykfItp8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE html><html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    <br>
    <br>
    <div class=3D"moz-cite-prefix">On 11/26/2025 7:18 PM, Patchwork wrote:<=
br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:176421349329.30433.14973984677593=
608995@a3b018990fe9">
     =20
      <title>Project List - Patchwork</title>
      <style id=3D"css-table-select" type=3D"text/css">td { padding: 2pt; }=
</style>
      <b>Patch Details</b>
      <table>
        <tbody>
          <tr>
            <td><b>Series:</b></td>
            <td>Introduce SRIOV scheduler groups</td>
          </tr>
          <tr>
            <td><b>URL:</b></td>
            <td><a href=3D"https://patchwork.freedesktop.org/series/158142/=
" moz-do-not-send=3D"true" class=3D"moz-txt-link-freetext">https://patchwor=
k.freedesktop.org/series/158142/</a></td>
          </tr>
          <tr>
            <td><b>State:</b></td>
            <td>failure</td>
          </tr>
          <tr>
            <td><b>Details:</b></td>
            <td><a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
158142v1/index.html" moz-do-not-send=3D"true" class=3D"moz-txt-link-freetex=
t">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v1/index.html</a><=
/td>
          </tr>
        </tbody>
      </table>
      <h1>CI Bug Log - changes from
        xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884_FULL -&gt;
        xe-pw-158142v1_FULL</h1>
      <h2>Summary</h2>
      <p><strong>FAILURE</strong></p>
      <p>Serious unknown changes coming with xe-pw-158142v1_FULL
        absolutely need to be<br>
        verified manually.</p>
      <p>If you think the reported changes have nothing to do with the
        changes<br>
        introduced in xe-pw-158142v1_FULL, please notify your bug team
        (<a class=3D"moz-txt-link-abbreviated" href=3D"mailto:I915-ci-infra=
@lists.freedesktop.org">I915-ci-infra@lists.freedesktop.org</a>) to allow t=
hem<br>
        to document this new failure mode, which will reduce false
        positives in CI.</p>
      <h2>Participating hosts (4 -&gt; 4)</h2>
      <p>No changes in participating hosts</p>
      <h2>Possible new issues</h2>
      <p>Here are the unknown changes that may have been introduced in
        xe-pw-158142v1_FULL:</p>
      <h3>IGT changes</h3>
      <h4>Possible regressions</h4>
      <ul>
        <li>igt@xe_module_load@load:
          <ul>
            <li>shard-adlp: (<a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884/shard-adlp-4/igt@xe=
_module_load@load.html" moz-do-not-send=3D"true">PASS</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-4156-e7a767430515c3a6e8aee91c2a68cb=
a8b06fe884/shard-adlp-4/igt@xe_module_load@load.html" moz-do-not-send=3D"tr=
ue">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4156-=
e7a767430515c3a6e8aee91c2a68cba8b06fe884/shard-adlp-4/igt@xe_module_load@lo=
ad.html" moz-do-not-send=3D"true">PASS</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884/shar=
d-adlp-3/igt@xe_module_load@load.html" moz-do-not-send=3D"true">PASS</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4156-e7a767430515c3a=
6e8aee91c2a68cba8b06fe884/shard-adlp-4/igt@xe_module_load@load.html" moz-do=
-not-send=3D"true">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884/shard-adlp-1/igt@xe=
_module_load@load.html" moz-do-not-send=3D"true">PASS</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-4156-e7a767430515c3a6e8aee91c2a68cb=
a8b06fe884/shard-adlp-1/igt@xe_module_load@load.html" moz-do-not-send=3D"tr=
ue">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4156-=
e7a767430515c3a6e8aee91c2a68cba8b06fe884/shard-adlp-1/igt@xe_module_load@lo=
ad.html" moz-do-not-send=3D"true">PASS</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884/shar=
d-adlp-1/igt@xe_module_load@load.html" moz-do-not-send=3D"true">PASS</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4156-e7a767430515c3a=
6e8aee91c2a68cba8b06fe884/shard-adlp-9/igt@xe_module_load@load.html" moz-do=
-not-send=3D"true">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884/shard-adlp-6/igt@xe=
_module_load@load.html" moz-do-not-send=3D"true">PASS</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-4156-e7a767430515c3a6e8aee91c2a68cb=
a8b06fe884/shard-adlp-9/igt@xe_module_load@load.html" moz-do-not-send=3D"tr=
ue">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4156-=
e7a767430515c3a6e8aee91c2a68cba8b06fe884/shard-adlp-8/igt@xe_module_load@lo=
ad.html" moz-do-not-send=3D"true">PASS</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884/shar=
d-adlp-8/igt@xe_module_load@load.html" moz-do-not-send=3D"true">PASS</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4156-e7a767430515c3a=
6e8aee91c2a68cba8b06fe884/shard-adlp-6/igt@xe_module_load@load.html" moz-do=
-not-send=3D"true">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884/shard-adlp-8/igt@xe=
_module_load@load.html" moz-do-not-send=3D"true">PASS</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-4156-e7a767430515c3a6e8aee91c2a68cb=
a8b06fe884/shard-adlp-9/igt@xe_module_load@load.html" moz-do-not-send=3D"tr=
ue">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4156-=
e7a767430515c3a6e8aee91c2a68cba8b06fe884/shard-adlp-9/igt@xe_module_load@lo=
ad.html" moz-do-not-send=3D"true">PASS</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884/shar=
d-adlp-6/igt@xe_module_load@load.html" moz-do-not-send=3D"true">PASS</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4156-e7a767430515c3a=
6e8aee91c2a68cba8b06fe884/shard-adlp-2/igt@xe_module_load@load.html" moz-do=
-not-send=3D"true">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884/shard-adlp-2/igt@xe=
_module_load@load.html" moz-do-not-send=3D"true">PASS</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-4156-e7a767430515c3a6e8aee91c2a68cb=
a8b06fe884/shard-adlp-2/igt@xe_module_load@load.html" moz-do-not-send=3D"tr=
ue">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4156-=
e7a767430515c3a6e8aee91c2a68cba8b06fe884/shard-adlp-3/igt@xe_module_load@lo=
ad.html" moz-do-not-send=3D"true">PASS</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884/shar=
d-adlp-3/igt@xe_module_load@load.html" moz-do-not-send=3D"true">PASS</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4156-e7a767430515c3a=
6e8aee91c2a68cba8b06fe884/shard-adlp-2/igt@xe_module_load@load.html" moz-do=
-not-send=3D"true">PASS</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-158142v1/shard-adlp-6/igt@xe_module_load@load.html" moz=
-do-not-send=3D"true">ABORT</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-158142v1/shard-adlp-6/igt@xe_module_load@load.html" moz-do=
-not-send=3D"true">ABORT</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-158142v1/shard-adlp-6/igt@xe_module_load@load.html" moz-do-no=
t-send=3D"true">ABORT</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-158142v1/shard-adlp-6/igt@xe_module_load@load.html" moz-do-not-s=
end=3D"true">ABORT</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-pw-158142v1/shard-adlp-2/igt@xe_module_load@load.html" moz-do-not-send=
=3D"true">ABORT</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-pw-158142v1/shard-adlp-2/igt@xe_module_load@load.html" moz-do-not-send=3D=
"true">ABORT</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-158142v1/shard-adlp-2/igt@xe_module_load@load.html" moz-do-not-send=3D"tr=
ue">ABORT</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
58142v1/shard-adlp-2/igt@xe_module_load@load.html" moz-do-not-send=3D"true"=
>ABORT</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1581=
42v1/shard-adlp-3/igt@xe_module_load@load.html" moz-do-not-send=3D"true">AB=
ORT</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v=
1/shard-adlp-3/igt@xe_module_load@load.html" moz-do-not-send=3D"true">ABORT=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v1/s=
hard-adlp-3/igt@xe_module_load@load.html" moz-do-not-send=3D"true">ABORT</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v1/shar=
d-adlp-1/igt@xe_module_load@load.html" moz-do-not-send=3D"true">ABORT</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v1/shard-a=
dlp-1/igt@xe_module_load@load.html" moz-do-not-send=3D"true">ABORT</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v1/shard-adlp=
-1/igt@xe_module_load@load.html" moz-do-not-send=3D"true">ABORT</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v1/shard-adlp-4/=
igt@xe_module_load@load.html" moz-do-not-send=3D"true">ABORT</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v1/shard-adlp-4/i=
gt@xe_module_load@load.html" moz-do-not-send=3D"true">ABORT</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v1/shard-adlp-4/igt@=
xe_module_load@load.html" moz-do-not-send=3D"true">ABORT</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v1/shard-adlp-8/igt@xe_=
module_load@load.html" moz-do-not-send=3D"true">ABORT</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v1/shard-adlp-8/igt@xe_mod=
ule_load@load.html" moz-do-not-send=3D"true">ABORT</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v1/shard-adlp-8/igt@xe_module=
_load@load.html" moz-do-not-send=3D"true">ABORT</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v1/shard-adlp-9/igt@xe_module_lo=
ad@load.html" moz-do-not-send=3D"true">ABORT</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-158142v1/shard-adlp-9/igt@xe_module_load@=
load.html" moz-do-not-send=3D"true">ABORT</a>)</li>
            <li>shard-dg2-set2: (<a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884/shard-dg2-435/i=
gt@xe_module_load@load.html" moz-do-not-send=3D"true">PASS</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-4156-e7a767430515c3a6e8aee91c2=
a68cba8b06fe884/shard-dg2-466/igt@xe_module_load@load.html" moz-do-not-send=
=3D"true">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884/shard-dg2-463/igt@xe_module_=
load@load.html" moz-do-not-send=3D"true">PASS</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe8=
84/shard-dg2-435/igt@xe_module_load@load.html" moz-do-not-send=3D"true">PAS=
S</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4156-e7a7674=
30515c3a6e8aee91c2a68cba8b06fe884/shard-dg2-463/igt@xe_module_load@load.htm=
l" moz-do-not-send=3D"true">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884/shard-dg2-=
463/igt@xe_module_load@load.html" moz-do-not-send=3D"true">PASS</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4156-e7a767430515c3a6e8ae=
e91c2a68cba8b06fe884/shard-dg2-432/igt@xe_module_load@load.html" moz-do-not=
-send=3D"true">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884/shard-dg2-435/igt@xe_mo=
dule_load@load.html" moz-do-not-send=3D"true">PASS</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-4156-e7a767430515c3a6e8aee91c2a68cba8b=
06fe884/shard-dg2-466/igt@xe_module_load@load.html" moz-do-not-send=3D"true=
">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4156-e7=
a767430515c3a6e8aee91c2a68cba8b06fe884/shard-dg2-432/igt@xe_module_load@loa=
d.html" moz-do-not-send=3D"true">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884/shard=
-dg2-432/igt@xe_module_load@load.html" moz-do-not-send=3D"true">PASS</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4156-e7a767430515c3a=
6e8aee91c2a68cba8b06fe884/shard-dg2-466/igt@xe_module_load@load.html" moz-d=
o-not-send=3D"true">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884/shard-dg2-436/igt@=
xe_module_load@load.html" moz-do-not-send=3D"true">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-4156-e7a767430515c3a6e8aee91c2a68=
cba8b06fe884/shard-dg2-436/igt@xe_module_load@load.html" moz-do-not-send=3D=
"true">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-41=
56-e7a767430515c3a6e8aee91c2a68cba8b06fe884/shard-dg2-436/igt@xe_module_loa=
d@load.html" moz-do-not-send=3D"true">PASS</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884/=
shard-dg2-436/igt@xe_module_load@load.html" moz-do-not-send=3D"true">PASS</=
a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4156-e7a7674305=
15c3a6e8aee91c2a68cba8b06fe884/shard-dg2-464/igt@xe_module_load@load.html" =
moz-do-not-send=3D"true">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884/shard-dg2-464=
/igt@xe_module_load@load.html" moz-do-not-send=3D"true">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4156-e7a767430515c3a6e8aee=
91c2a68cba8b06fe884/shard-dg2-433/igt@xe_module_load@load.html" moz-do-not-=
send=3D"true">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884/shard-dg2-433/igt@xe_mod=
ule_load@load.html" moz-do-not-send=3D"true">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-4156-e7a767430515c3a6e8aee91c2a68cba8b0=
6fe884/shard-dg2-464/igt@xe_module_load@load.html" moz-do-not-send=3D"true"=
>PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4156-e7a=
767430515c3a6e8aee91c2a68cba8b06fe884/shard-dg2-433/igt@xe_module_load@load=
.html" moz-do-not-send=3D"true">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884/shard-=
dg2-434/igt@xe_module_load@load.html" moz-do-not-send=3D"true">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4156-e7a767430515c3a6=
e8aee91c2a68cba8b06fe884/shard-dg2-434/igt@xe_module_load@load.html" moz-do=
-not-send=3D"true">PASS</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-158142v1/shard-dg2-432/igt@xe_module_load@load.html" mo=
z-do-not-send=3D"true">ABORT</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-pw-158142v1/shard-dg2-432/igt@xe_module_load@load.html" moz-=
do-not-send=3D"true">ABORT</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-158142v1/shard-dg2-432/igt@xe_module_load@load.html" moz-do=
-not-send=3D"true">ABORT</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-158142v1/shard-dg2-432/igt@xe_module_load@load.html" moz-do-n=
ot-send=3D"true">ABORT</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-158142v1/shard-dg2-436/igt@xe_module_load@load.html" moz-do-not=
-send=3D"true">ABORT</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-158142v1/shard-dg2-436/igt@xe_module_load@load.html" moz-do-not-s=
end=3D"true">ABORT</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-pw-158142v1/shard-dg2-433/igt@xe_module_load@load.html" moz-do-not-sen=
d=3D"true">ABORT</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-pw-158142v1/shard-dg2-433/igt@xe_module_load@load.html" moz-do-not-send=
=3D"true">ABORT</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-pw-158142v1/shard-dg2-433/igt@xe_module_load@load.html" moz-do-not-send=
=3D"true">ABORT</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-pw-158142v1/shard-dg2-464/igt@xe_module_load@load.html" moz-do-not-send=
=3D"true">ABORT</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-pw-158142v1/shard-dg2-464/igt@xe_module_load@load.html" moz-do-not-send=
=3D"true">ABORT</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-pw-158142v1/shard-dg2-464/igt@xe_module_load@load.html" moz-do-not-send=
=3D"true">ABORT</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-pw-158142v1/shard-dg2-434/igt@xe_module_load@load.html" moz-do-not-send=
=3D"true">ABORT</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-pw-158142v1/shard-dg2-434/igt@xe_module_load@load.html" moz-do-not-send=
=3D"true">ABORT</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-pw-158142v1/shard-dg2-434/igt@xe_module_load@load.html" moz-do-not-send=
=3D"true">ABORT</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-pw-158142v1/shard-dg2-435/igt@xe_module_load@load.html" moz-do-not-send=
=3D"true">ABORT</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-pw-158142v1/shard-dg2-435/igt@xe_module_load@load.html" moz-do-not-send=
=3D"true">ABORT</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-pw-158142v1/shard-dg2-435/igt@xe_module_load@load.html" moz-do-not-send=
=3D"true">ABORT</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-pw-158142v1/shard-dg2-466/igt@xe_module_load@load.html" moz-do-not-send=
=3D"true">ABORT</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-pw-158142v1/shard-dg2-466/igt@xe_module_load@load.html" moz-do-not-send=
=3D"true">ABORT</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-pw-158142v1/shard-dg2-466/igt@xe_module_load@load.html" moz-do-not-send=
=3D"true">ABORT</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-pw-158142v1/shard-dg2-463/igt@xe_module_load@load.html" moz-do-not-send=
=3D"true">ABORT</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-pw-158142v1/shard-dg2-463/igt@xe_module_load@load.html" moz-do-not-send=
=3D"true">ABORT</a>)</li>
          </ul>
        </li>
      </ul>
    </blockquote>
    <br>
    I missed the fact that the GuC FW only supports this feature for BMG
    and newer HW (I did all my local testing on BMG), so it fails when
    we try to enable it on older platforms. I'll add a platform check in
    the next rev.<br>
    <br>
    Daniele<br>
    <br>
    <blockquote type=3D"cite" cite=3D"mid:176421349329.30433.14973984677593=
608995@a3b018990fe9">
      <ul>
        <li>
          <ul>
          </ul>
          <br>
        </li>
      </ul>
      <h2>New tests</h2>
      <p>New tests have been introduced between
        xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884_FULL and
        xe-pw-158142v1_FULL:</p>
      <h3>New IGT tests (1)</h3>
      <ul>
        <li>igt@xe_gpgpu_fill@offset-16x16:
          <ul>
            <li>Statuses : 2 pass(s)</li>
            <li>Exec time: [0.00] s</li>
          </ul>
        </li>
      </ul>
      <h2>Known issues</h2>
      <p>Here are the changes found in xe-pw-158142v1_FULL that come
        from known issues:</p>
      <h3>IGT changes</h3>
      <h4>Issues hit</h4>
      <ul>
        <li>
          <p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-158142v1/shard-bmg-1/igt@kms_big_fb@yf-tiled-max-hw=
-stride-64bpp-rotate-0.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124" moz-do-not-send=
=3D"true">Intel XE#1124</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cdclk@mode-transition:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-158142v1/shard-bmg-1/igt@kms_cdclk@mode-transition.=
html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2724" moz-do-not-send=3D"true">Intel XE#2724</=
a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_hpd@hdmi-hpd-enable-disable-mode:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-158142v1/shard-bmg-1/igt@kms_chamelium_hpd@hdmi-hpd=
-enable-disable-mode.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/2252" moz-do-not-send=3D"=
true">Intel XE#2252</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-at=
omic:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884/shard-bmg-7/igt@kms_c=
ursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic.html" moz-do-not-=
send=3D"true">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-pw-158142v1/shard-bmg-6/igt@kms_cursor_legacy@2x-long-nonblocking=
-modeset-vs-cursor-atomic.html" moz-do-not-send=3D"true">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291" moz-do-not-se=
nd=3D"true">Intel XE#2291</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-flip-vs-rmfb:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884/shard-bmg-7/igt@kms_f=
lip@2x-flip-vs-rmfb.html" moz-do-not-send=3D"true">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v1/shard-bmg-6/ig=
t@kms_flip@2x-flip-vs-rmfb.html" moz-do-not-send=3D"true">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316" moz-do-not-se=
nd=3D"true">Intel XE#2316</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-pgflip-=
blt:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-158142v1/shard-bmg-1/igt@kms_frontbuffer_tracking@f=
bcdrrs-2p-scndscrn-indfb-pgflip-blt.html" moz-do-not-send=3D"true">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311" moz-=
do-not-send=3D"true">Intel XE#2311</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-plflip-blt:=
</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-158142v1/shard-bmg-1/igt@kms_frontbuffer_tracking@p=
sr-2p-scndscrn-shrfb-plflip-blt.html" moz-do-not-send=3D"true">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313" moz-do-n=
ot-send=3D"true">Intel XE#2313</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_hdr@bpc-switch-dpms:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884/shard-bmg-4/igt@kms_h=
dr@bpc-switch-dpms.html" moz-do-not-send=3D"true">PASS</a> -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v1/shard-bmg-7/igt@k=
ms_hdr@bpc-switch-dpms.html" moz-do-not-send=3D"true">ABORT</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6662" moz-do-not-send=
=3D"true">Intel XE#6662</a>) +1 other test
              abort</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884/shard-bmg-6/igt@kms_p=
lane@plane-panning-bottom-right-suspend@pipe-b.html" moz-do-not-send=3D"tru=
e">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-158142v1/shard-bmg-2/igt@kms_plane@plane-panning-bottom-right-suspend@pip=
e-b.html" moz-do-not-send=3D"true">ABORT</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/6675" moz-do-not-send=3D"true">Intel XE#6=
675</a>) +1 other test
              abort</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-158142v1/shard-bmg-1/igt@kms_psr2_sf@fbc-pr-overlay=
-primary-update-sf-dmg-area.html" moz-do-not-send=3D"true">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406" moz-do-not-s=
end=3D"true">Intel XE#1406</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/1489" moz-do-not-send=3D"true">Intel XE#1489</a>) +1 o=
ther test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_vblank@ts-continuation-suspend:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-158142v1/shard-bmg-1/igt@kms_vblank@ts-continuation=
-suspend.html" moz-do-not-send=3D"true">ABORT</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/6675" moz-do-not-send=3D"true">Intel=
 XE#6675</a>) +3 other tests
              abort</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_system_allocator@many-stride-malloc-prefetch:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884/shard-bmg-8/igt@xe_ex=
ec_system_allocator@many-stride-malloc-prefetch.html" moz-do-not-send=3D"tr=
ue">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-158142v1/shard-bmg-8/igt@xe_exec_system_allocator@many-stride-malloc-pre=
fetch.html" moz-do-not-send=3D"true">WARN</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/5786" moz-do-not-send=3D"true">Intel XE#=
5786</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_system_allocator@process-many-free-madvise:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884/shard-bmg-8/igt@xe_ex=
ec_system_allocator@process-many-free-madvise.html" moz-do-not-send=3D"true=
">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-158142v1/shard-bmg-3/igt@xe_exec_system_allocator@process-many-free-madvis=
e.html" moz-do-not-send=3D"true">ABORT</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/3970" moz-do-not-send=3D"true">Intel XE#397=
0</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pmu@engine-activity-accuracy-50:</p>
          <ul>
            <li>shard-lnl: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884/shard-lnl-1/igt@xe_pm=
u@engine-activity-accuracy-50.html" moz-do-not-send=3D"true">PASS</a> -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v1/shard-=
lnl-2/igt@xe_pmu@engine-activity-accuracy-50.html" moz-do-not-send=3D"true"=
>FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6=
251" moz-do-not-send=3D"true">Intel XE#6251</a>) +2 other tests
              fail</li>
          </ul>
        </li>
      </ul>
      <h4>Possible fixes</h4>
      <ul>
        <li>
          <p>igt@kms_cursor_edge_walk@256x256-left-edge:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884/shard-bmg-2/igt@kms_c=
ursor_edge_walk@256x256-left-edge.html" moz-do-not-send=3D"true">FAIL</a> -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v1/sh=
ard-bmg-4/igt@kms_cursor_edge_walk@256x256-left-edge.html" moz-do-not-send=
=3D"true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884/shard-bmg-6/igt@kms_c=
ursor_legacy@cursorb-vs-flipb-toggle.html" moz-do-not-send=3D"true">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291" moz=
-do-not-send=3D"true">Intel XE#2291</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-158142v1/shard-bmg-5/igt@kms_cursor_legacy@c=
ursorb-vs-flipb-toggle.html" moz-do-not-send=3D"true">PASS</a> +3 other tes=
ts pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@flip-vs-cursor-legacy:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884/shard-bmg-8/igt@kms_c=
ursor_legacy@flip-vs-cursor-legacy.html" moz-do-not-send=3D"true">FAIL</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5299" moz-d=
o-not-send=3D"true">Intel XE#5299</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-158142v1/shard-bmg-4/igt@kms_cursor_legacy@fli=
p-vs-cursor-legacy.html" moz-do-not-send=3D"true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884/shard-bmg-6/igt@kms_f=
lip@2x-flip-vs-dpms-on-nop-interruptible.html" moz-do-not-send=3D"true">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316"=
 moz-do-not-send=3D"true">Intel XE#2316</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v1/shard-bmg-5/igt@kms_flip@2x-fli=
p-vs-dpms-on-nop-interruptible.html" moz-do-not-send=3D"true">PASS</a> +1 o=
ther test pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1:</p>
          <ul>
            <li>shard-lnl: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884/shard-lnl-5/igt@kms_f=
lip@flip-vs-expired-vblank-interruptible@c-edp1.html" moz-do-not-send=3D"tr=
ue">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/301" moz-do-not-send=3D"true">Intel XE#301</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/3149" moz-do-not-send=3D"true">Intel=
 XE#3149</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-158142v1/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank-interruptible@=
c-edp1.html" moz-do-not-send=3D"true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884/shard-bmg-6/igt@kms_p=
lane@plane-panning-bottom-right-suspend@pipe-a.html" moz-do-not-send=3D"tru=
e">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/6675" moz-do-not-send=3D"true">Intel XE#6675</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v1/shard-bmg-2/igt@kms_plan=
e@plane-panning-bottom-right-suspend@pipe-a.html" moz-do-not-send=3D"true">=
PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_vblank@ts-continuation-dpms-suspend@pipe-c-edp-1:</p>
          <ul>
            <li>shard-lnl: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884/shard-lnl-4/igt@kms_v=
blank@ts-continuation-dpms-suspend@pipe-c-edp-1.html" moz-do-not-send=3D"tr=
ue">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/4488" moz-do-not-send=3D"true">Intel XE#4488</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v1/shard-lnl-4/igt@km=
s_vblank@ts-continuation-dpms-suspend@pipe-c-edp-1.html" moz-do-not-send=3D=
"true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_system_allocator@processes-evict-malloc:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884/shard-bmg-5/igt@xe_ex=
ec_system_allocator@processes-evict-malloc.html" moz-do-not-send=3D"true">A=
BORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/39=
70" moz-do-not-send=3D"true">Intel XE#3970</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v1/shard-bmg-1/igt@xe_exec_syst=
em_allocator@processes-evict-malloc.html" moz-do-not-send=3D"true">PASS</a>=
</li>
          </ul>
        </li>
      </ul>
      <h4>Warnings</h4>
      <ul>
        <li>
          <p>igt@kms_flip@flip-vs-expired-vblank-interruptible:</p>
          <ul>
            <li>shard-lnl: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884/shard-lnl-5/igt@kms_f=
lip@flip-vs-expired-vblank-interruptible.html" moz-do-not-send=3D"true">FAI=
L</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/301" =
moz-do-not-send=3D"true">Intel XE#301</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/3149" moz-do-not-send=3D"true">Intel XE#314=
9</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158=
142v1/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank-interruptible.html" m=
oz-do-not-send=3D"true">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/301" moz-do-not-send=3D"true">Intel XE#301</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-m=
map-wc:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884/shard-bmg-2/igt@kms_f=
rontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc.html" moz-do-no=
t-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2312" moz-do-not-send=3D"true">Intel XE#2312</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v1/shard-bmg-4/=
igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc.html" =
moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2311" moz-do-not-send=3D"true">Intel XE#2311</a>) +7=
 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-bl=
t:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884/shard-bmg-2/igt@kms_f=
rontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-blt.html" moz-do-not-sen=
d=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2312" moz-do-not-send=3D"true">Intel XE#2312</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v1/shard-bmg-4/igt@k=
ms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-blt.html" moz-do-not=
-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/4141" moz-do-not-send=3D"true">Intel XE#4141</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-bl=
t:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884/shard-bmg-7/igt@kms_f=
rontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt.html" moz-do-not-sen=
d=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/4141" moz-do-not-send=3D"true">Intel XE#4141</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v1/shard-bmg-6/igt@k=
ms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt.html" moz-do-not=
-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2312" moz-do-not-send=3D"true">Intel XE#2312</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-ful=
lscreen:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884/shard-bmg-7/igt@kms_f=
rontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-fullscreen.html" moz-do-n=
ot-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2311" moz-do-not-send=3D"true">Intel XE#2311</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v1/shard-bmg-6=
/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-fullscreen.html=
" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2312" moz-do-not-send=3D"true">Intel XE#2312</a>) =
+3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-re=
nder:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884/shard-bmg-6/igt@kms_f=
rontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-render.html" moz-do-not-=
send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2312" moz-do-not-send=3D"true">Intel XE#2312</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v1/shard-bmg-5/ig=
t@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-render.html" moz-=
do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2313" moz-do-not-send=3D"true">Intel XE#2313</a>) +6 oth=
er tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mm=
ap-wc:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884/shard-bmg-7/igt@kms_f=
rontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc.html" moz-do-not=
-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2313" moz-do-not-send=3D"true">Intel XE#2313</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v1/shard-bmg-6/i=
gt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc.html" mo=
z-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2312" moz-do-not-send=3D"true">Intel XE#2312</a>) +3 o=
ther tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884/shard-bmg-4/igt@kms_t=
iled_display@basic-test-pattern-with-chamelium.html" moz-do-not-send=3D"tru=
e">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2509" moz-do-not-send=3D"true">Intel XE#2509</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v1/shard-bmg-8/igt@kms_tiled=
_display@basic-test-pattern-with-chamelium.html" moz-do-not-send=3D"true">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/242=
6" moz-do-not-send=3D"true">Intel XE#2426</a>)</li>
          </ul>
        </li>
      </ul>
      <h2>Build changes</h2>
      <ul>
        <li>Linux: xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884
          -&gt; xe-pw-158142v1</li>
      </ul>
      <p>IGT_8639: 2ce563031e6b2ec91479f6af8c326d25c15bdb26 @
        <a class=3D"moz-txt-link-freetext" href=3D"https://gitlab.freedeskt=
op.org/drm/igt-gpu-tools.git">https://gitlab.freedesktop.org/drm/igt-gpu-to=
ols.git</a><br>
        xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884:
        e7a767430515c3a6e8aee91c2a68cba8b06fe884<br>
        xe-pw-158142v1: 158142v1</p>
    </blockquote>
    <br>
  </body>
</html>

--------------DPPawdaK0540trPMYykfItp8--
