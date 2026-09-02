Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8707C624D0
	for <intel-xe@archiver.kernel.org>; Wed,  2 Sep 2026 12:44:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F01610E4E3;
	Wed,  2 Sep 2026 12:44:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mrVdxjwp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD0B589207
 for <intel-xe@lists.freedesktop.org>; Wed,  2 Sep 2026 12:44:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788353043; x=1819889043;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=K/LugCbWF3MwSOtC+0Q7OBmpJrhQxHjk9C+2VbbyYHc=;
 b=mrVdxjwprBA8UnZTO8OzHGmMyIduZxu0QHFR5HVT4oCP6j+Q+ioB6X/C
 Iw3Sa2ncxZeAjQjpFQJeEQKtpNj5SK7kGlDQUEbzF8JQqLhASMJ/wiIS3
 RzB3+GMCfrv3XzT47Pjzbc2t12Id/2ur9qivovZ0DSrOTIkpgYDchjl87
 F1KwtiClpJq1o5lRGtZaw1nKPZoxuYT4Dggjc6dVDec06WugvHxmQXlsq
 hQtKUmtU7Tsv8s+HDpd33Ktj26GxRLRkYGN1hAER3hZXTNpCkNOWDNXy8
 BODaezw+L1Es4GHo8pQ7z2s5/Jo5uYsE1K+mxYLEDQKB6SP8PwjaQjVUh w==;
X-CSE-ConnectionGUID: BL/SETcKTlqeWemkFsjCww==
X-CSE-MsgGUID: H7b7vzYFTU6qWjt7We3uCQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11893"; a="88829742"
X-IronPort-AV: E=Sophos;i="6.25,257,1779174000"; d="scan'208";a="88829742"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2026 05:44:02 -0700
X-CSE-ConnectionGUID: X9OfQgYcRXeLkBcD5waYqA==
X-CSE-MsgGUID: bjxCJK3aR8qiBBNEx48UFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,257,1779174000"; d="scan'208";a="269419200"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2026 05:44:03 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 2 Sep 2026 05:44:01 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 2 Sep 2026 05:44:01 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.40) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 2 Sep 2026 05:44:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yaGbKg9WaT2WrfR0VrHdMYQdMwVMPu7pjHM4twetS9vaQhuAaeXOFgvMfSuuIIc5wXxsSi/s6ImgJeJh0xWuldBbdO8NbjV8yAvwvIysMNAf9JywfN1fRvXiW+nwCGshh45GDbEozik/14BKFve/bpK47LuC2ie4n00Xqpa1bmXoBkYAG8CwadXrynqLLg2yV4dggbNGIcFk3j7s/eGz5zdvERHLps+1ao32V9BT2YIehm5LtZGLTDok+eGFrJCKqBboWwqtvg6ijEpO1X0JJs5ZfASV9EPhb702Cay1Qd2S0GVT6938AORUEtrCawSNXYDD6vEk5kYSP84bpNXvsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OVcdUOzpTej3JQ7uXpa0LcJHHht/QKzJ4+iLxSO1HYw=;
 b=kM49g3vyKI7BWl/UGmvlXfxrfJvC6elUK6VydABOb8HjJpCb8wutL1fVB1G3JVDWVaNJCMTxSnGQru9ToalvXh3kACWRVc/ouo53bPkiXmRhgCW+gtUZ77d/E3kCjRDaSG48RSianfuUBJTzQh/kPGBGtWSP7Df4LPQl7hE3Q7uyyBffB3a9dbCjEYJgIhOlOjzxKUjwiVDIANpA1IM8bD4YQdXbqMksqkDJN6FzOJEd2Tj3j1+/IlW5j3meUAcl98n5WDWhsfRvRYgclV/uKIhP9mwzVlFKF3NLfFkeQrYjGQWWK0RqFsD8WNkBqkSnorbx/3ilaRpZor5VTSA10g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7551.namprd11.prod.outlook.com (2603:10b6:510:27c::12)
 by PH3PPF73E424DB7.namprd11.prod.outlook.com (2603:10b6:518:1::d2e)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Wed, 2 Sep
 2026 12:43:56 +0000
Received: from PH7PR11MB7551.namprd11.prod.outlook.com
 ([fe80::5cbf:6b33:5f0c:88a0]) by PH7PR11MB7551.namprd11.prod.outlook.com
 ([fe80::5cbf:6b33:5f0c:88a0%4]) with mapi id 15.21.0360.008; Wed, 2 Sep 2026
 12:43:56 +0000
Message-ID: <5166575b-d624-4234-a9df-1c239ec3b318@intel.com>
Date: Wed, 2 Sep 2026 14:43:51 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/4] drm/xe/svm: Report terminal page-fault failures
 using SIGID
To: Arvind Yadav <arvind.yadav@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <rodrigo.vivi@intel.com>, <badal.nilawar@intel.com>,
 <himal.prasad.ghimiray@intel.com>, <dnyaneshwar.bhadane@intel.com>,
 <mallesh.koujalagi@intel.com>, <matthew.brost@intel.com>
References: <20260901063059.2547247-1-arvind.yadav@intel.com>
 <20260901063059.2547247-4-arvind.yadav@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20260901063059.2547247-4-arvind.yadav@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM9P250CA0007.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:20b:21c::12) To PH7PR11MB7551.namprd11.prod.outlook.com
 (2603:10b6:510:27c::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7551:EE_|PH3PPF73E424DB7:EE_
X-MS-Office365-Filtering-Correlation-Id: 5a9127c1-55ed-4d9f-d4e1-08df08efda33
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|1800799024|366016|3023799007|10067099003|4143699003|11063799006|18002099003|56012099006|22082099003;
X-Microsoft-Antispam-Message-Info: o7kyRAN1ULcCvRphaW4GdFNItKoS+dXbttNE15YINDUmi391e8mlSMQEjIS6zNayvEw4+t4GKGsmPidnGjLo9otfjidAxRMJfv982Eqqy6ySDZdT41ZPVhS8zVjSHXr0Fe4vvSpynwbRdZMg0JdMyh9uGelHTu66StMiubsNossLa6kiVPx687gqJNLFnWeRYLzV5OpY0JJX2OjQQAX42pBzdAHBIjd+sNPIQKcaptyVc4N0UMTYOccx9YNqkG1mMcVEXtFd5rZr0Y9nD8w7OVVavCuXezFqhzJAkHDAw8IexizuU9XvXOL0rT+YXZHQH/o19JK4REWFJSHUnfkSdldcoHgSQuE0tqrzGVd+O+G92fD6ejMwzWcLP+pbITpO5vGHT3rebpWCxkv/96ldnFC+FW68js9Ia1AweMtYlY3UACW2STH4iTjtQBSCkMX7Vtfvsa/vvq8d9UVCPHIq3gYQ9nM9ebsK8kAGztBC0yakNHvSFyMOGuBrbjzFgGvxfQuYue6BhSowrZJo2TaGdRr9YaAr+yUwComFb0M6Z5TCzW77/Ol5129CeiTTXkutM1KFc7A9RHPdWXk8IiefWoJQ5H+E3c3UyXPUs+8c9K3G2bcwP1TG0V/SYaijnkTVdGfeXHIjAjNEvPsZ7HVSfb5QKOhiSpuoxTqeRgJjll4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7551.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(3023799007)(10067099003)(4143699003)(11063799006)(18002099003)(56012099006)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Umgrb0hXOUpNeldZcWJFemplK3VCQmZQKzNjcE5lTzFMV04xM25Wb2hySFdP?=
 =?utf-8?B?UmpFTit1YWM0YkZYcFBPUlg5bENZL0c4RHFGRzI5Q2NnOXVoNzJhd2hEejVp?=
 =?utf-8?B?SWw2cEk3alB3OGp6Q2ZpQWpaS2dWVC9HRTRBU1B5OUpiWGxjV08xdjJSMW9u?=
 =?utf-8?B?VW9ReDFMNCtUUFVzdHFjNG1KMDZTOVo4TkYxOVdqZHRvWm8rTzdiVnNsaGlp?=
 =?utf-8?B?V3liS3k0NUJhdEJqdGRBTWg3TnZUSDJlSFlncXNaTnJlWjFyRUVLZXdiczZW?=
 =?utf-8?B?b1NKNWVnYWVCdWMxNTByRFd0M2psRjIzS1dzSUNlbFRQNldEYzBDdW53N25r?=
 =?utf-8?B?SUExSEo5Z25jR2FVdHhYKzhacVdFYXR2SFFhbldIdUQxd3NvY3VRekpmVUJD?=
 =?utf-8?B?TElnOGRoTjdRWkRqVk5BdU96NlplcFA1bHNuKzVYSitneUIxckQwM1Y4OFYv?=
 =?utf-8?B?eWQyZC9JVnFlamxJS05kdFZmRjR1MjUyT0VDVVZTdjRHWU80eCs4d0RXZTRo?=
 =?utf-8?B?MFVma1FDN0gyUVdaMWI1TURxNEVnUUsrSWx2NjZzTHFkRzY5Y1FKc3lrNGsy?=
 =?utf-8?B?aEdoQlJXR0daZVZJMG5NV3htY0Y5TzdXSWRrdnVnekRscE80dFBpaVNqY2F2?=
 =?utf-8?B?ZzE4L2RHVFlsZWJPVHoxc2I0Zm9POTNla3NvYUFHY1l1aExUdnA0Vng2K3Ru?=
 =?utf-8?B?S0o2MERCSFRXZ0xPa2lJWDRRUUV3clJ1VktDMzh3ZnhmR1drRXBRUzM5RERv?=
 =?utf-8?B?V0lVZ0lza3ZvRk5zbEEzL1hwbGxGZmxYVm13VVY0eDYvMDVUSlN0aWdKMndI?=
 =?utf-8?B?Sno1RTFOMjc2Ui9LQ1ZpdG94VjdScExGSjlpWGV5Qzg0eHdmT2h2b0Q0VzB1?=
 =?utf-8?B?Mnk2SHhWU0EwWTRHeWFmamZiZXQ5SzhKWEh1RWFjVzFISDI0azZhbkdHeVpU?=
 =?utf-8?B?TkpmREtSU2pGZVVaZXkrcWxITS9pSThvT281MmE4SkhFUXJQOEhHQkxLTDZp?=
 =?utf-8?B?YUtzMitzZmlKamRnNlpSaFRmTFBieDdEOVNDNXhVK2lnby9SdUtuVy93Rzho?=
 =?utf-8?B?S1VwRlFTVFplQXBRTFN4cEFocHErUDkyZW5wSE9xMkhSN2tmS2pGb2x4NkxD?=
 =?utf-8?B?UU5iZlljOGQxKzkyc3lFajZEUHQ1TWkyaU04bVdxaEJkUHpHSnR6UXBKVUFV?=
 =?utf-8?B?S0VVUmtZckM5U3d4djIrNVpOZmYyNGtNWXpEak1mQmVaMnJLQXFrMzBwYnkz?=
 =?utf-8?B?aE9JTjI1SG9JS3JXUHBQRU95RVUwRVlEUXVOMVlBcmd6aUE4S2pFYVVVZzI4?=
 =?utf-8?B?b0V0bDdCczhJTmM4cEVkaFRzbjExMzhtWW9ZWXU4c2dDbTAzWFIrWEl1Y251?=
 =?utf-8?B?YW1OVlRjMUlLMjREY2w2WjB6SlJRNloyMmpYUGJpRXR6OUZPZWV0QjcwdTRs?=
 =?utf-8?B?SmJyS0NDdnNHYk9ZK1k1TzFZNjlQODNOU2hGcmdIWWljVE9UWmFEMmRENEhH?=
 =?utf-8?B?c1dLbit3SnQ2KzlqNWkxZCtEbS8ySUVmKzVYSWl6ZDJBaVJQeTBYRTFyVkhU?=
 =?utf-8?B?b0JqaFBPVXVROE5lMWJQbm1Od25qakdzVzNrMTd2MCtxVUlDa3BjVnlHYkJt?=
 =?utf-8?B?TWlZNk9kWDIycWQzK01tT2ZaTERkelo4VjFhZTM1M0JyUk85ZVRiZlRBem5s?=
 =?utf-8?B?MmM3Sm9XekZsTDdWV08zamVsMjRPb1JPenhXQlF3MUN4MmlYMXpYYnBvWEoz?=
 =?utf-8?B?WU41RkxKeGR3b2Yza0N2dGc0b2syelJhNGhKODhCdm9wTERHM0hwR1RBdmNn?=
 =?utf-8?B?M1pSeFpuNm1YOWtrZ0xCOHp2SmR2OC9KU3hOZ0IxRkNMTThlbGIxZVE1UDNI?=
 =?utf-8?B?WkIxWVh5a2xCdnExM0Y5TURVQlRkWjRKSUlGN0FZN2dPaEUwM29ydERma3hJ?=
 =?utf-8?B?WXFnZDVFUjMwVEdWaFJnUjJobjdzanlnMEJSMEExbmVnR0MxSjBtMFM0andw?=
 =?utf-8?B?VFlrbTVWazhMT0d6VDV3bVhXV1YyUG5SN2Y2NDJ5b29tRVV5R2xJTVFGMWEr?=
 =?utf-8?B?S0xqcWczamdhckhFNGZVVldHaXF4VjVUSTF2U2dsOGl2OVlucFlZYU05dWxi?=
 =?utf-8?B?Ulp6S0QzY3dZUThwZVRyNGM0RWhQRzRJWXJoMHROY3J4aTYzcHBhZjhRVFBU?=
 =?utf-8?B?eHdUYXZOa0hCa3lKZVJlRHpYZ2tNN21nREFDNzZvRXhyeE9GT0xyQkFaeUdX?=
 =?utf-8?B?Mmp6dEUrQTFEMzM5ZDhhY3dxRHRyWkx1TlZBNi83ZlNsdkc2aHF3SGVOWUFp?=
 =?utf-8?B?cWhidldBZmZOUm1LTUZLL1Z5ZzZrUHB1Ulc2N1dCZThpcFpaaEN2OFVrRHY4?=
 =?utf-8?Q?Ctky4ygiHlURFgT4=3D?=
X-Exchange-RoutingPolicyChecked: p81Qp266oE56Pz9DK7ZHmqDGX8/4mJvk0264BcdZRk3eMxu2McODksuKuTaofo4qIHOvV2I5nMTjUjgKPqgc61OdPkHFFAb1eK8mkIK6X3KowII0tb7YYzWEfe/ON2XD7equFPhY7VZkOZMDfvZp39RBE1Nev9k1rTUkJkui+91vujMpcZR/pBBYHu/Vrofjwg0fe3K0sySV6GHmMtZwUw9JT+/ECfn5x8bueqxUVYuYyQyCsxgYNCtm8H9xlvMvH1YTI+CzTRHeR6rTuMz5MVQJfun+wNnAtD1nA1sa6QbWPZy9vxTJHcPw7jMc0BlqvXUNnlziB0GEM/4eiOm5nA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a9127c1-55ed-4d9f-d4e1-08df08efda33
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7551.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2026 12:43:56.2667 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o3ta3p+B4iOlac+tisdKAdVUWi/KrvqJ+3qXHaJ74MAO7qONNDDggNVPim4MAlGZOMzl8gU/cRzsRp7p0BQuFTXwSdbDUvxTuvoBIjXDHQM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF73E424DB7
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



On 9/1/2026 8:30 AM, Arvind Yadav wrote:
> Route terminal SVM page-fault failures through the structured SIGID logging
> helper.
> 
> These errors are reported only after the retry count is exceeded, so they
> represent terminal page-fault handling failures rather than transient retry
> conditions.

that sounds like a LLM output

> 
> Use the PAGEFAULT component, which maps to XE_SIGID_MEM_FAULT, and pass the
> real errno value to the helper. Pass the GT object so the report carries
> tile/GT location. The helper renders the errno, so remove the manual
> ERR_PTR() formatting from the message text.

do we really need to explain here the details how xe_log() macro works?
or that 'real errno' value will be used?

> 
> Cc: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
> Cc: Badal Nilawar <badal.nilawar@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Suggested-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
> Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_svm.c | 13 +++++++------
>  1 file changed, 7 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
> index 627a741293d5..349e307ca092 100644
> --- a/drivers/gpu/drm/xe/xe_svm.c
> +++ b/drivers/gpu/drm/xe/xe_svm.c
> @@ -13,6 +13,7 @@
>  #include "xe_bo.h"
>  #include "xe_exec_queue_types.h"
>  #include "xe_gt_stats.h"
> +#include "xe_log.h"
>  #include "xe_migrate.h"
>  #include "xe_module.h"
>  #include "xe_pagefault.h"
> @@ -1361,9 +1362,9 @@ static int __xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
>  				else
>  					goto retry;
>  			} else {
> -				drm_err(&vm->xe->drm,
> -					"VRAM allocation failed, retry count exceeded, asid=%u, errno=%pe\n",
> -					vm->usm.asid, ERR_PTR(err));
> +				xe_log_err(gt, PAGEFAULT, err,
> +					   "VRAM allocation failed, retry count exceeded, asid=%u\n",

s/asid/ASID

> +					   vm->usm.asid);
>  				goto err_out;
>  			}
>  		}
> @@ -1384,9 +1385,9 @@ static int __xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
>  			range_debug(range, "PAGE FAULT - RETRY PAGES");
>  			goto retry;
>  		} else {
> -			drm_err(&vm->xe->drm,
> -				"Get pages failed, retry count exceeded, asid=%u, gpusvm=%p, errno=%pe\n",
> -				vm->usm.asid, &vm->svm.gpusvm, ERR_PTR(err));
> +			xe_log_err(gt, PAGEFAULT, err,
> +				   "Get pages failed, retry count exceeded, asid=%u, gpusvm=%p\n",
> +				   vm->usm.asid, &vm->svm.gpusvm);

s/asid/ASID

also, does it make sense to log the gpusv kernel pointer ??
maybe log the gpusvm->name instead?

>  		}
>  	}
>  	if (err) {

