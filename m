Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2825CD4F54
	for <intel-xe@archiver.kernel.org>; Fri, 29 May 2026 23:24:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79B2910E004;
	Fri, 29 May 2026 23:24:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nPkhE2I3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDA9F10E004
 for <intel-xe@lists.freedesktop.org>; Fri, 29 May 2026 23:24:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780097081; x=1811633081;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=2xgjolR4bF4/Ll3E93ESQRC7sMigcEVOJBTlWzHEBXU=;
 b=nPkhE2I3s+B3IwG78tBcKIyQsQmxeTBRRpyIa3E274qMvBbdgV4QrkYh
 xfX8hbcrvF/ic5nmk10ZmOrDPDLck1jebloK5LTYILN8KXyUkgvRdshCk
 2Bku26Ry2DWnHXQJYHxsNZ5kr0DQUlQWUVltY0O7ktJzjZbZyzncdvGEQ
 QdpnEYaeQlGVVlktHRO+h6Ebr+qiTBfAw7ucQLAfh9UwQ5JLuY3ijMXBj
 0QGPEphWhGEeqi4foMo17q1K+yExeil5o59RfkwKkTXoZW7rNAJVuh0K6
 gTI85WpLKPJzhDrh05cBq1TNa74ZumcTTYflHfznRXD7apLybFxfpKDWe Q==;
X-CSE-ConnectionGUID: uFUCw8MbSG+EHtIZX4M4/g==
X-CSE-MsgGUID: w7/O440gT6KVBLAoY+VAKA==
X-IronPort-AV: E=McAfee;i="6800,10657,11801"; a="84813177"
X-IronPort-AV: E=Sophos;i="6.24,176,1774335600"; d="scan'208";a="84813177"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2026 16:24:40 -0700
X-CSE-ConnectionGUID: K5E/39BOTYqMhw9FGv3aIQ==
X-CSE-MsgGUID: UhuzQISkQqqygwr7q80adA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,176,1774335600"; d="scan'208";a="240434143"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2026 16:24:40 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 29 May 2026 16:24:39 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 29 May 2026 16:24:39 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.13) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 29 May 2026 16:24:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZnxMPIHU1yaauyySxJOvvvZCEuCoXLAZsFSJsjiOkVhs3t4WD4GfIhZ3d1U1NWi1eoZb5XrCeVlODD8Qe0HP5sSkk6elqIyHWOXQxZs/M8b5ntxYRGkbX4vDyp0QHmdmCPlv1X/TJfRgw4ihYAjCDOmdySggkleF/SZNt3jaDghcDRS3GBVi5Sx+zvzHuoVDD4nvuMb455TV0h3xruaGxomnh4RKvDKuLiQFWbhdeCa78reL57RuvyWlw0Q2NDDR6wR/C9aHMmEUEZV9ny0F7Od7CSWd0xw68uBWzqPz/I4rSymj6PxXeuks7RMkMrgF64OK/j6kb5yl/BNzIFGUXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t2GpZoqE9cH70cteCT6qKc0IphXlecR2xWneYPQOxaI=;
 b=RrW5mndr4OfxBjSF0n7gAF/EXH4FxcK4Y/HMGN5kEwk4oY2qkkiP8dAZoT+drmz+Si3/T2hDquz32v1xTlezl5HMKJ935D2KAHUPPsomoy1K4F04bXwLcoP3KJtm6VmW7moP8629SQU3YfXmCsT2iXOtWZqD85WDg7qd1er4x4ckRi8I8eLcGsvhRKP7d4Y/Op6DB7Mgnt7OnRBxdOm/O1ZWbhAcCX/Ne5kFwtKr9wf9YKmh20D+IohpZ39dm4sVzoDuECTMkLX1ZSozh3Z3b3CvFfqaAxwYB2iLwzRgsN10Ac3m/+nTjS1wCvftjOrkHtlvctElMzlbCgB09ydszg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by SJ0PR11MB5040.namprd11.prod.outlook.com (2603:10b6:a03:2d6::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.15; Fri, 29 May
 2026 23:24:36 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057%3]) with mapi id 15.21.0071.011; Fri, 29 May 2026
 23:24:36 +0000
Date: Fri, 29 May 2026 16:24:30 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 3/9] drm/xe/rtp: Keep track of non-OA nonpriv slots
Message-ID: <ahogLn6RQKw21klf@soc-5CG1426VCC.clients.intel.com>
References: <20260518234716.1540123-1-ashutosh.dixit@intel.com>
 <20260518234716.1540123-4-ashutosh.dixit@intel.com>
 <ahnbSrt2ee6b/m4z@soc-5CG1426VCC.clients.intel.com>
 <877bomlzc7.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <877bomlzc7.wl-ashutosh.dixit@intel.com>
X-ClientProxiedBy: MW4PR02CA0028.namprd02.prod.outlook.com
 (2603:10b6:303:16d::7) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|SJ0PR11MB5040:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a6ecfe8-440f-4046-f03d-08debdd97277
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|4143699003|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: GGzFnTlsU0NrlHVEaxwIrYtPVn8epjj1CAZ2MJWzBrO8pwZyq5J1pBGK7J+cb9xbIQ/naMIVb6UoHVIRQU1qZFVRwb1SkcUStdcGHXCZsibC2aZ1Ms4tpVaURzG+mNHMj18I8mbI/M3doB5x1i4PHIAcgDObTK6dJB5YsFKzMwBzQkcWfpfh1Uc/vGdHBxg8Yw+yOdjOG/SK6cI3asU1jyxlQUiOZi0l3s3EueWz7LGNAGsfhYJWD8k3yQX5AFImN863auvDTJB65LFIsHY9Yx8gYFYug2BMRgBn9Pq0q+Fd1MFE2MpBWxY4eb7JqyrxGzCMSlBzy0Eh5ufMwXq9pBlWytywJzvbnq51DtgZZgV+DhSA5M1nC7l8VCvyBv7AwaozAL82vowFoIkL0krlE6Z9Lo3Y4i6Z8bSaM+IXG4x34BDi5VyHlqkrLOPFh/fF8MSZuQPRMWlaOPzkhWtVzue2Kt2ZUPpC7j4SLxNhb4k/4v11EcPH/m2JefuReyfhYrqn2Q/NDzNJHtMHhV5o+7vTTeEg2HFNAGrDlxTtlZiyBzAw/j4l6KDIhdKPWDokUZlxsAg9TzP6MvojQqxF5/Q1veUbI9+4pnoDMAuJ3ktMkc9XcZmo0r6VLFPgwmJlkb06QdGhXdTl1A/9NBKzbjDoUr4P4JgU4/ncbu7fN+D5mi1jETnCTmPZg7U3lzkgG2ry1ERnRPJa9JsZiafPFg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(4143699003)(56012099006)(11063799006)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QWlkOHlrN0gzVWpYQXlXTzhuSzFvZHoxVFgyMDRMdTRIWVNxcUwyajJBdjQy?=
 =?utf-8?B?Q08rRXRMWUNtbVhndFkzbmZDUVNkWEFzTk9kVXdBVm15MFphU0htR0liQkpC?=
 =?utf-8?B?dU45WVFJZ3kxZGtVKzdWZTlwSXVobzdGejduTWpUdGo3cEtEVXlIN1ZMTG9M?=
 =?utf-8?B?Q0REc3htdkJuZE92UFZvb3ptVDlEa3M1RzlxR2RibmQyMFFtVzRReDNHT2tp?=
 =?utf-8?B?Q1FvSVlZMFg3d2NSTnl2dEFGVFFJcVVaYnRNZjZSVVlqclVrcnZnbW96dFJZ?=
 =?utf-8?B?L2ZQRklYTFovU3M2akJuNmhVZ2dzVXJnRk5hcmI1RGpnMEVJcXJ6S3JoNjdn?=
 =?utf-8?B?L1JMQXg4OVduNGp4UmcwVUlPUmY4UW83bW1PTmU3bFoyL1V5dWtLdUZZTkZs?=
 =?utf-8?B?ZHVCNHY0MnhkTUhlRzJJUEJHWER5dGEwOE85Q3JVbGNEcGdnVSt6Rjc1ejBy?=
 =?utf-8?B?bUZiL0RpWlpUbnAxdmpTOTV2MktiNTVYSEoyZVNlS0Jla083eXhubkNSUXJv?=
 =?utf-8?B?dU5aMGkxUmRRTjV4VndDOG9wVUxzREpuaVI5K09xY3YxdFkzclJ5SzIxSTc0?=
 =?utf-8?B?SVRrNEF0S1NjZVRLWFk2SFVZUXBCNTg4RGs3N01EZi9mcEpIWUVodkVqSUFt?=
 =?utf-8?B?bGkyTXZqR0lJSFI4R2lQOFJlUHg4Y01IZUk2R0Ribi9HU2RGblRtQU5MMTNZ?=
 =?utf-8?B?cmNqa3NDWWhHaEtGZ3V4bWIrMlpVaXdTSnFUTkRTbEpocnZpektWYjRUREt1?=
 =?utf-8?B?a0R1d1JTZ0Q4WjlYeEVDRmNtMUd2bFJpMVI1aEdIb0F3bWxZL3FhKzFkRmdR?=
 =?utf-8?B?dHdicHBtbkhpNGpicDhqK3VxdjlkeEJpbzZVY0hLQUJjb0JCaEEzZUMvdkIw?=
 =?utf-8?B?U3hQeTN2R1NFdGNpaTlPaTFMbktlUFVnOTU5MGI4YUJMVlRyYy9iL05WdHZZ?=
 =?utf-8?B?bTlnN04vWjNOZHBYd0N6cGM0RVNEMFB5THN6Zk1IL2dTL0VjR1dxbTJtNkRM?=
 =?utf-8?B?N0FwN0xGb3Z1ZHovMFJ6bWU1bEZTMGc3bENFZ3hyUW1zTUhoSTZlSXB0VUor?=
 =?utf-8?B?Z1VzRlMyNUtiZld0dFo3MmE1ZVRPTGx3OHE1U1JoS2lSS3NLdVNNYnNpUkVN?=
 =?utf-8?B?NmpnMmZDRkhkMFo1VUFzb2lKZUg2SHQ5aHgxUXdMTXNSNGRtTTQ5RytLZzJL?=
 =?utf-8?B?SmV2VmQ5b0YyZVJCcGI1ditmN3VsTWVhQWFyUTFMeWhkL2QxU25Zc3pXZUZQ?=
 =?utf-8?B?emU1TXlmZjB1VmhMRit4NXFTUERYK0lZSzBXcWtrZUZkMXpxNUpVbmJYTFFW?=
 =?utf-8?B?THJmVWs2bHA2VmZDbHhwNjhQM1ltUVlGWFd6a3JpUzJwL05QeThvK2FtVit6?=
 =?utf-8?B?TkwvM2JKWkN1UW9taTVtZTVXK1FxLzZpbzdnWTdnM2J1YmpPc0RlbGRjNzg4?=
 =?utf-8?B?MUZqZUx2Vm1kazA5SW1HQzFlS1Q4RDgzZWtGQ3dWYSt3Vm5qQy9pb0thMXNh?=
 =?utf-8?B?amM3SUNLNEM4clFLZnJ6V0I5bEZvK1JwaGJyS1JldWRBb1RTcXg4eUZLdm5X?=
 =?utf-8?B?RjV0YUVqV1JYeS9CUDJ5VC9uQUNQbVlaaUc0NTBuWUY1bDdtOUJadWIvanNo?=
 =?utf-8?B?Tmh5cnRiYjlXZHhyRmV5NDJ2ZzVmOWdkNEw3ejdMWTRlY2QyNUxpNjgzN3A4?=
 =?utf-8?B?cDNUK1MwaHZDNFpEeG9reEQxVmhqTExUSHdlVFdsaE5odHpXWmF3UzVWd0xp?=
 =?utf-8?B?eVdMUWNlQTJTWVN5d2Rremp0SUFYbGtoemVzQkNPZjJhWEphOGZkREpaNkgv?=
 =?utf-8?B?NHNRTyt0Ykp2MG1nd3U5MDNtMzN5SHB2NFBDWTRXRHRXNHdzZHVCcTMzaXV1?=
 =?utf-8?B?TjJPZVlTclpPQXUwejIvU1dtK0YrKzJCb2szbUJPRUsxb2IrYzBwTTVNbVVp?=
 =?utf-8?B?M1c4QWhkbVlScmRPVGZONEFsNVUrbndva0Y5Undiam80c3g4NVR2TGZjYjIr?=
 =?utf-8?B?bGVhU3E2bjZFTHN6NzZBUXp5TlNMZzBMS0RzRWE4YlFqNzBsVzBsS0xOYkxp?=
 =?utf-8?B?dDU5WFNCVHZ0OG9mY2g2elhoaG82bWREZUsxWGRmbDBLTlRpV3ROV1ZEZE1W?=
 =?utf-8?B?LzgrVHBIK1B0UndJTEE4SzNwcFB1aDluc2dIYVhRMzRxWUFaMmRadTBMckMv?=
 =?utf-8?B?YnM4WGEwVXhCbkFLVDlrNjJ6MHpONGVPMnYrdTVvaGhLSDlaZkFDV2o1YjQ5?=
 =?utf-8?B?WS8vMEExYjU1Qit3VXB4eURGY1JZZ2puUWZxanczMlVBTW9yaWoxc2hwSlZE?=
 =?utf-8?B?QVgvT2Fmci9OVGpOY2FNWUt5WW9IY296SEhYMUxwWjgzdHI2dXg0OXNEdW5R?=
 =?utf-8?Q?ERmoFUrZJZoxwC00=3D?=
X-Exchange-RoutingPolicyChecked: UoipLKtKHur95j7IjCT/yPVhWD7IH8gXDFZ7mSibCzyNrjW8DH/Uy9HAFV4jgFzSNDr+kZqWzD+lKOsEw8CJ1y6tPCbKKIW+dEkIm96t4rm0KBYqFf/KzZ0HfiZO8a6HukkqkjDq3vCZiIPUqsgRy+9e81B38RTNZKaHB3V28qZ3nS2vSasVBPT9G4jARuSw0RDoV28pt3EiVdu5rpM7u7Eva6wUdkj3gnvmVeIakkD54jQzayZrY+W3hTSp9OZmIxB3WU1VyXV9Wg4mDLUQ76QwQFHfTPVfaAnX6vDFaa4S06RXIBHjlmUElbX0yj/PtH7UwTf1AvQ9r05Wq1p1tg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a6ecfe8-440f-4046-f03d-08debdd97277
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2026 23:24:36.1074 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RGo0MtTajJ/8rN8BzracFGhnnFCpDotje0K+7hpBsET1opWz9SopvMgKEPMp8KESEn/OIjcthpNXZF4Ykcx3Q5KQ8vRh6TaxSa7ujIyVaTQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5040
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

On Fri, May 29, 2026 at 01:45:12PM -0700, Dixit, Ashutosh wrote:
>On Fri, 29 May 2026 11:30:34 -0700, Umesh Nerlige Ramappa wrote:
>>
>> On Mon, May 18, 2026 at 04:47:10PM -0700, Ashutosh Dixit wrote:
>> > In order to dynamically whitelist/dewhitelist OA registers on OA stream
>> > open/close, we need to keep track of nonpriv slots occupied by non-OA
>> > register whitelists.
>>
>> Can we maintain the slot index within hwe, so that the caller does not need
>> to keep track of it? I am assuming this will only be used in the probe
>> path. For all other paths the *_sr registers are used directly which
>> already have the registre<->slot association stored within them.
>>
>> i.e.
>>
>> hwe->slot;
>
>Hmm, when I first wrote the code, I had this in hwe: hwe->nonpriv_slots.
>But later realized it is only needed in xe_reg_whitelist_process_engine(),
>so moved it to the local variable nonpriv_slots there.
>
>Also, nonpriv_slots is actually number of slots occupied by non-OA
>registers. So if it part of hwe, the question becomes more complicated:
>what do we store there, number of slots excluding OA or including OA? Since
>we only need number of slots excluding OA.

I would just think of it as the next available nonpriv slot for the 
caller to use. It's just a state w.r.t the hwe. When you let the caller 
(even if internal to the KMD) manage it, it's prone to errors - not 
about this series or current code, but in general.

Thanks,
Umesh

>
>Therefore, to avoid these complications, I decided that the best way was a
>temporary local variable.
>
>What do you think we'd gain by maintaining it as part of hwe? If things
>change later, we could add it, but for now the local variable seems
>sufficient?

>
>Thanks.
>--
>Ashutosh
>
>> >
>> > Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
>> > ---
>> > drivers/gpu/drm/xe/xe_reg_whitelist.c | 8 ++++++--
>> > 1 file changed, 6 insertions(+), 2 deletions(-)
>> >
>> > diff --git a/drivers/gpu/drm/xe/xe_reg_whitelist.c b/drivers/gpu/drm/xe/xe_reg_whitelist.c
>> > index 6cc81f53fc601..1e788e2ee4014 100644
>> > --- a/drivers/gpu/drm/xe/xe_reg_whitelist.c
>> > +++ b/drivers/gpu/drm/xe/xe_reg_whitelist.c
>> > @@ -159,7 +159,7 @@ static const struct xe_rtp_entry_sr oa_whitelist[] = {
>> >	},
>> > };
>> >
>> > -static void whitelist_apply_to_hwe(struct xe_hw_engine *hwe)
>> > +static int whitelist_apply_to_hwe(struct xe_hw_engine *hwe)
>> > {
>> >	struct xe_reg_sr *sr = &hwe->reg_whitelist;
>> >	struct xe_reg_sr_entry *entry;
>> > @@ -191,6 +191,8 @@ static void whitelist_apply_to_hwe(struct xe_hw_engine *hwe)
>> >
>> >		slot++;
>> >	}
>> > +
>> > +	return slot;
>> > }
>> >
>> > /**
>> > @@ -203,11 +205,13 @@ static void whitelist_apply_to_hwe(struct xe_hw_engine *hwe)
>> >  */
>> > void xe_reg_whitelist_process_engine(struct xe_hw_engine *hwe)
>> > {
>> > +	int nonpriv_slots;
>> > +
>> >	struct xe_rtp_process_ctx ctx = XE_RTP_PROCESS_CTX_INITIALIZER(hwe);
>> >
>> >	xe_rtp_process_to_sr(&ctx, register_whitelist, ARRAY_SIZE(register_whitelist),
>> >			     &hwe->reg_whitelist, false);
>> > -	whitelist_apply_to_hwe(hwe);
>> > +	nonpriv_slots = whitelist_apply_to_hwe(hwe);
>> >
>> >	xe_rtp_process_to_sr(&ctx, oa_whitelist, ARRAY_SIZE(oa_whitelist),
>> >			     &hwe->oa_whitelist, false);
>> > --
>> > 2.54.0
>> >
