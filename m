Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9E77FF512C
	for <intel-xe@archiver.kernel.org>; Tue,  7 Apr 2026 17:07:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3C1E10E3F6;
	Tue,  7 Apr 2026 17:07:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XZgZ+6Uo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85C8510E3F6
 for <intel-xe@lists.freedesktop.org>; Tue,  7 Apr 2026 17:07:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775581622; x=1807117622;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=xJ5EHC+2TRIVicHVbsySCgGvl9OiIgno51fpilcdnW8=;
 b=XZgZ+6UosPG2krtTMrZOJ18v8go4UbRszemuwtf45c5//X+2flGgsLG6
 QYwcjcihGMIjvMbnD6gSVynUDEQ+07Lrzz5zi2uy15HmNV+1x79FZo+vb
 pb+bGf043J8bprMSNnIO6degBgs+GiODgkIPRH+306pNvLoHiyqN88dGD
 mLO8vXG+ljAI8ayZ8tDZCS5UePwoteYxGrCKcfb4FFsAerBo6J/kvRMsk
 Diot/KCurr7/wbkqLwhRKVreUEVB+qVMPqSaP2k0HhF/G0+pZ8hSteX94
 J/Wm8FTd3usQOPj/UK7SdDMc+NoOsi3rthTryXYUMtOzFzndf+/Uxa6SW w==;
X-CSE-ConnectionGUID: D+H6gMCxRhKkSzEg7zG0bA==
X-CSE-MsgGUID: oS5aDZmNQqimNuzd4WJSfA==
X-IronPort-AV: E=McAfee;i="6800,10657,11752"; a="76516343"
X-IronPort-AV: E=Sophos;i="6.23,165,1770624000"; d="scan'208";a="76516343"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2026 10:07:01 -0700
X-CSE-ConnectionGUID: AMzKGMMVTKSWr6ovYDUYgw==
X-CSE-MsgGUID: cWoYkh5+SxCQKm6a/QsfZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,165,1770624000"; d="scan'208";a="221665463"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2026 10:07:00 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 7 Apr 2026 10:06:59 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 7 Apr 2026 10:06:59 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.2) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 7 Apr 2026 10:06:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YHTIsuSuQGKaeZjnlk2NYdmNO+9GIq7bhfUO9QSCYoi54EUT9qeSSS2XbOOcdFEZ4lSzRm1RzOB06r9OhOzA3eBgYJzvqgmJwzlD9W3YbGOhlwceCM60q0ybwjseWBf4wUAFhkODdva50yIZn14n+KVit3/ZFuygD8CdK39np/HDt4kScs76BJcVu3KLFsq6Q+9ixEAhTp6RYbTwHaaXYwm7XKEW0K9QR45nkZnuHCK5tOOZj41nTDSmKeBBpGsCs3s3wWyeREVIpfn6RLZPxVfJ/qrYYJPW/8AjcRceSuIz4/hEQTbpaj5RqbAEVGSfErfRfDI0M+pVF7+QTQ9mLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VThC6iy2C9T/2r6NNhvbTsrmssu/HzDHWLdgrWonJ4o=;
 b=NwPQe8lkleHRxbN+i/i/9UYPj3+iRxOYd0hYNlfIpuUezjrTlLbYuvhBQuMGGvaR8DecgUYQkw+Jcjy/20t5inJOptyFQnAmitojb4DAipSoEZf3eSj58SCgrY/t8sKy429fDTwC+zvqYlgXcA2hNzeQcHdMyZScOZc8gIUWceaCffRD8dT5Vm2YgyndyZ7n5F6a7aInp2q6BH2TsHJKJiV1VtsNKyYNzKbW9gCTGgPTlAZ6vuMUlYg8wa883hiUHz971EOIXoNyJP8P6Lsbbp7RsMnEsdIX85ZV+BS/q0fvHnmrYWtCdDh+g6BiiQFi8ODQoDZuvhoNkQIdY+1Zkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA3PR11MB8046.namprd11.prod.outlook.com (2603:10b6:806:2fb::22)
 by PH0PR11MB5831.namprd11.prod.outlook.com (2603:10b6:510:14b::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.15; Tue, 7 Apr
 2026 17:06:52 +0000
Received: from SA3PR11MB8046.namprd11.prod.outlook.com
 ([fe80::87cd:16d5:8dbe:2286]) by SA3PR11MB8046.namprd11.prod.outlook.com
 ([fe80::87cd:16d5:8dbe:2286%4]) with mapi id 15.20.9769.020; Tue, 7 Apr 2026
 17:06:52 +0000
Message-ID: <1fd7b979-975e-43cb-b408-c4cdb611ef31@intel.com>
Date: Tue, 7 Apr 2026 10:06:50 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/xe/pat: Default XE_CACHE_NONE_COMPRESSION to
 invalid and assert on use
To: Matthew Auld <matthew.auld@intel.com>, <intel-xe@lists.freedesktop.org>
CC: Matt Roper <matthew.d.roper@intel.com>
References: <20260406182546.569131-1-x.wang@intel.com>
 <20260406182546.569131-3-x.wang@intel.com>
 <d6c549b1-c20c-49ec-9629-11243b27966b@intel.com>
Content-Language: en-US
From: "Wang, X" <x.wang@intel.com>
In-Reply-To: <d6c549b1-c20c-49ec-9629-11243b27966b@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY5PR03CA0011.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::21) To SA3PR11MB8046.namprd11.prod.outlook.com
 (2603:10b6:806:2fb::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA3PR11MB8046:EE_|PH0PR11MB5831:EE_
X-MS-Office365-Filtering-Correlation-Id: 8532093a-846f-4776-ce21-08de94c81065
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|42112799006|1800799024|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info: MsOUChWEpddTs3yOFtwKFmCtYDo4r+uIIaJ0I+yiCKnDmn+XF4wxjxcINZtTRgY0A99sh7wKPR9EEET3gqBk+eZ6z/LDXE5tO3HgMDXj+1NLykopNBqXDOjaYpsvTYiyo4P2M8NcHJ0/aXt1QRcEtpEyK3DWAlNB2aaNEseDs74SKJgJ+UBGYflTUAzP9ZpEo373+g7UWF95LbQolNaixCmslvCVeUqOVM3DeVZv09ty3pEF0SRCbfGoLxAdwa4r3U0C4WfFtZJIr+AZU8mDfEo+JwnQRoLlcFzAevsFP4u10TNAxPcRmW+ter0vwWxPG9ANSOw0NGwMRA45zqAw2pq8DNRaZDxvJpm7da1hdjFP775B1Bxg7kDt7Lv4WZHNfwZ5Pag24q5GznSO9PKKKbtA3/qYNNyT9DWydlLlPUhdgwE8+/yZewLlJp5GjSNvioeHmWx7xRTdOGL1Q1mfU/z16tBEuFzGklVsvuRFPhFAM9rzCyqUbGKh8cxsGGWl17eJzuS3dxp371iUqymDil14KhfIp+nxRzyKgDi1d79bnpzK2Emu9ErnkZ378fVOVdspW7rz6qjnK4y1gLvtANZTzGk2e+EkZbLHm7Gnat4MKlEj+Z85mlDufvMYsXZ1HeuXwZxnPIgRjU3Isvdn243WHighCmevSIcpMJKwj3CS8Rrx3Hz4bu55so/T8Ut6ESRkwsWf8tmMBVezU1y+9xvNv5QkDIdKXWfCrAIqh+M=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA3PR11MB8046.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(42112799006)(1800799024)(18002099003)(22082099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NkZUNkl6YWtHdmJRbWs3djNpQnBHNnF5MWNBZjUxWGdUTGppMjEvcVJsMWNF?=
 =?utf-8?B?b1BvalByUTRqTmJPc2VHaHVnaHE3SjJHSE9WYXZuVVBObjlQRVpVM3FTRGs3?=
 =?utf-8?B?bjRCcFhxbWxBUlAvc3A1cGQ3RVhvaGxtWUVub0xSMG9vNzUxTnJaejBON25j?=
 =?utf-8?B?TjdEWGFCRE53ZkNtbVA0eGk1WWg4dkIva3hGZk1FOGt3S1hsN3AxZzZ6bFRE?=
 =?utf-8?B?ZGEzMTAxeFBtbVFnc2taczNhY0NFdVU3Q1FycitJZWJzM2cwVlJxWHlVUSsx?=
 =?utf-8?B?V0g2Y3dtS0FUa0x4UENrcnpEY01adTdNUzZFSUpWSkJHbzJ1UXlWWTVwYzFi?=
 =?utf-8?B?am1tUEx4L2ZZb0ozUHB2TDFYNW1oaVErS1BKM1U1UEtFOXpqQzdZUldTZ1hv?=
 =?utf-8?B?R1p3Q0R3SHR3cVFoWnVScmxRdkY4SXFleHFaeEY4WHVob2t5a1hMSVgvZFQw?=
 =?utf-8?B?TWxGN3FzbHphRmJZbTVIcXhmcDlzRmM5R1JIWlZNY3VCTTJnbEUxdjZ4aElw?=
 =?utf-8?B?c0taZHBwZXFlTjFQdGlzLzlxVVo4dk8zR3dxMmpSbjM1N1BTcm9NSExxdTc5?=
 =?utf-8?B?ZTc5UmkvL2dKaWtuNWh6NVEvc3J4cnZSUUtFQXRham1Ma3JPSHdyekJUUGZG?=
 =?utf-8?B?UXA2MHdyK2RraXExbXdLUGc0WGFTblM5WkNFUWRPUlRGeERUTkRJMy9SVXJh?=
 =?utf-8?B?bWFDVVUyd001dVc4aXZuZnJkd0tsMXg1YUFVRUJZN0lud3dWVFMyMEhXejdh?=
 =?utf-8?B?aUU1K2hMQ3ZISzJkNXEyYmFDb2lNWTdDZk1zWEFBS0RJdHdSUDYrZzFZUXVG?=
 =?utf-8?B?ZENqd1NHSy9qUU1DVmg2eDdkMFFFNVF5MnQrZXBZQXRadXpPU0xuenQvUlBO?=
 =?utf-8?B?MHlZTklkcUlzK2dudGFYaGhRMTYyZzJJWlh4T0tqbktPbE5RbTdwWVF2Z0hZ?=
 =?utf-8?B?cnlhQUs4Qnd6bUdtVEJNMlNyOEpzVXlKQXgwZnZzcFBRQS9vQUdHWDA0R094?=
 =?utf-8?B?SmR2VHdINjNPLzBVcFpFODcvU2F2SEZHamR4dHlzemhBSUt2dElhYVFscWJj?=
 =?utf-8?B?RjE4cmJESEZSL0ptTXBTV2NvTmdua2ViYXRweHRqUTE1NE9FQ2JKR0VKTlRp?=
 =?utf-8?B?Z24zVFllRlRtUUYyQnNsWDAvbklYYzV1NmtiZno0aDRLSnpuUy94SHpwTFRm?=
 =?utf-8?B?cmlFWnA1L2U3TkFmMzgxUThvK3A1SG5SSWZOWUs2S2NDSi9KOSt5QklESk9q?=
 =?utf-8?B?NUxaQVVab0VaNjRMWFdhSllaT25KekV5aFJFcU9zWE5TL0ZMd1lzQ2RCUUpp?=
 =?utf-8?B?YnFHYmVkYkwrSFp5SUMvbzdDYkMvT3crZElyMnhnbjluS2xJa2F3N0ltYTE3?=
 =?utf-8?B?bmU1NFMxc3BTbnNGRUNEUnlwZ1VVajh1ekliYTBCM2FFYXF0NU5zZ1R0bWpK?=
 =?utf-8?B?eENzQVJwY1lKcC9XY3p6MEx1YUM0UnhNcUpzSGdIMGdBeWxJc2x4ajlSRXBS?=
 =?utf-8?B?Kzh3MTliSjZEOGxqbEdzdFpGcjkwaGxkTU12eVFiZDdiaUJSK1RoZW1QcnNw?=
 =?utf-8?B?ZHNTSFZ2L3o1Q3p1TUpTbkVRS2NTWng2WHlmenFQZ0c4L0RDVmxudmY0OHVD?=
 =?utf-8?B?MEFidUdkNnJVL1NqSFNlR3dxK3NLb2xmOGxJSzNsM0hFN1ZyN3g4aUJ6a3lu?=
 =?utf-8?B?cXlCTnFjejk3Zm8xNmtnQzFaRFA3QndRN3haYllkZFcvSm9INVBiUVlPdWl6?=
 =?utf-8?B?S0MxZkl2OHNDdk82VGpDVFVlWmU3aXh3Nnl4T0x1RHhpWmt0U282YWZtQjNu?=
 =?utf-8?B?MEh6UFgwcUVlanpXYXNzbVpWd0kyUkMyazhrTmhWN3JuYzJwZkVjbEovaE1q?=
 =?utf-8?B?SkFlb0VEOVptWjc2cE5QbTBZcUZKNC9wT3dxWnZFMmNBeWNqa0RBT3I2ZzBa?=
 =?utf-8?B?NVdGMzZRbjdJS3pVcjNoYnlaTW5tb2x1MURuRWNXZWZxUkRCWlZoK2oxc1da?=
 =?utf-8?B?Y2FkM1FJSGc2Ymx4L1FYWlArdk5IVDJrU0lQdCtTcG1WWW4vWmdmc2FzR2s0?=
 =?utf-8?B?N3lhTVg2UW5XdmJ0d1gzOFQyOEFjWkk2ejRlU1N6QWF5dGJvVVlvZlRGQWRU?=
 =?utf-8?B?Q1E2L1o4OHlKSDV1NE94Rkl5b3IvWE9kRW54dGFwakowa2V2anJuNzZ6K2p3?=
 =?utf-8?B?N2RNNWw4NjdTMzZVQlJkSDQ1OUJSV09KSXNIbmtpS0dOUlh6L05vNDJPRXlv?=
 =?utf-8?B?eTRncFI3elNyR0txQk9ENW1YL1oreWlTSzluV2YrWVU4WkhTMlFKSXNLdXNM?=
 =?utf-8?B?cEE5UkVXK1VXdmdiZWFQa3h6V04zVEtSTFdZM1lqeG1Ndi9qSk5yZz09?=
X-Exchange-RoutingPolicyChecked: EkbIrgTa70vIoKTRpdcTkRGtIF5e9gjL3Aalk/pmRRc1OHiSWQ+ibf7Q5utmpOhDuxmY3aOjKSP2IJTGgnpx9p6NPjo13CUw5qlQk9UexVXYFsRZTLZ6qsOC1eY1cAZ/YHSj3Gn46mZzG1qmIu8cVd+yxJkMEjTPrR4AlXSUHifHJ+eAMxlovpcBxGc/oyynfm0E89sVt4cFyXkYmrcMfByvO4wFIFPB9qUg/7gy5YAWnmLSpUUGftxB9UlRicK80cVSh+eiinjbYr+1IMJVyvZssgee5OLDnLCcaCfIGVQohAQCcOeqaPF/iTaoNkvKiznIzPzQFAgdhac9XHRG7A==
X-MS-Exchange-CrossTenant-Network-Message-Id: 8532093a-846f-4776-ce21-08de94c81065
X-MS-Exchange-CrossTenant-AuthSource: SA3PR11MB8046.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2026 17:06:52.4856 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V5NjHMQ3gAJLre1z+/mei4CsmwwAUqUL+N4z/aRDD50MNAf4KOc9HzO1LWU9s3nux++wvOrMM3Jy7U5s68NI4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5831
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


On 4/7/2026 02:48, Matthew Auld wrote:
> On 06/04/2026 19:25, Xin Wang wrote:
>> Initialize XE_CACHE_NONE_COMPRESSION PAT index to XE_PAT_INVALID_IDX by
>> default, and add xe_assert() checks at the sites that use it for PTE
>> encoding. This ensures platforms that don't support this cache mode fail
>> loudly rather than silently encoding an invalid index into PTEs.
>>
>> Suggested-by: Matthew Auld <matthew.auld@intel.com>
>> Cc: Matt Roper <matthew.d.roper@intel.com>
>> Signed-off-by: Xin Wang <x.wang@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_migrate.c | 9 +++++++--
>>   drivers/gpu/drm/xe/xe_pat.c     | 1 +
>>   2 files changed, 8 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_migrate.c 
>> b/drivers/gpu/drm/xe/xe_migrate.c
>> index fc918b4fba54..cad47866435d 100644
>> --- a/drivers/gpu/drm/xe/xe_migrate.c
>> +++ b/drivers/gpu/drm/xe/xe_migrate.c
>> @@ -30,6 +30,7 @@
>>   #include "xe_lrc.h"
>>   #include "xe_map.h"
>>   #include "xe_mocs.h"
>> +#include "xe_pat.h"
>>   #include "xe_printk.h"
>>   #include "xe_pt.h"
>>   #include "xe_res_cursor.h"
>> @@ -341,6 +342,7 @@ static void xe_migrate_prepare_vm(struct xe_tile 
>> *tile, struct xe_migrate *m,
>>                   DIV_ROUND_UP_ULL(actual_phy_size, SZ_1G);
>>               u64 pt31_ofs = xe_bo_size(bo) - XE_PAGE_SIZE;
>>   +            xe_assert(xe, comp_pat_index != XE_PAT_INVALID_IDX);
>>               xe_assert(xe, actual_phy_size <= (MAX_NUM_PTE - 
>> IDENTITY_OFFSET -
>>                                 IDENTITY_OFFSET / 2) * SZ_1G);
>>               xe_migrate_program_identity(xe, vm, bo, map_ofs, 
>> vram_offset,
>> @@ -635,11 +637,14 @@ static void emit_pte(struct xe_migrate *m,
>>       u64 cur_ofs;
>>         /* Indirect access needs compression enabled uncached PAT 
>> index */
>> -    if (GRAPHICS_VERx100(xe) >= 2000)
>> +    if (GRAPHICS_VERx100(xe) >= 2000) {
>>           pat_index = is_comp_pte ? 
>> xe->pat.idx[XE_CACHE_NONE_COMPRESSION] :
>>                         xe->pat.idx[XE_CACHE_WB];
>> -    else
>> +        if (is_comp_pte)
>> +            xe_assert(xe, pat_index != XE_PAT_INVALID_IDX);
>> +    } else {
>>           pat_index = xe->pat.idx[XE_CACHE_WB];
>> +    }
>
> To simplify the flow, maybe we just unconditionally stick the assert 
> here?
>
Yeah, I can modify this to simplify the assert here.
> But would it make sense to take this a step further and wrap all 
> pat.idx[] accesses with a simple helper (like xe_cache_pat_idx()), and 
> add the assert there? There are a fair few places directly accessing 
> pat.idx, outside of xe_pat.
>
Agree on wrapping pat.idx[] access with a helper for
consistency.
But I don't think an assert inside the helper is the
right place. For UC/WT/WB, all platforms initialize
them so the assert would never fire — it's dead code.
For compression variants, xe_bo.c:3763 intentionally
reads the INVALID value as a capability check, so an
assert there would break that. Better to keep the
assert at the callsite like we do here in xe_migrate.c,
where we have the right context to know a valid index
is required.
What do you think?

Thanks
Xin
>>         ptes = DIV_ROUND_UP(size, XE_PAGE_SIZE);
>>   diff --git a/drivers/gpu/drm/xe/xe_pat.c b/drivers/gpu/drm/xe/xe_pat.c
>> index 75aaae7b003d..fad5b5a5ed4a 100644
>> --- a/drivers/gpu/drm/xe/xe_pat.c
>> +++ b/drivers/gpu/drm/xe/xe_pat.c
>> @@ -559,6 +559,7 @@ static const struct xe_pat_ops xe3p_xpc_pat_ops = {
>>   void xe_pat_init_early(struct xe_device *xe)
>>   {
>>       xe->pat.idx[XE_CACHE_WB_COMPRESSION] = XE_PAT_INVALID_IDX;
>> +    xe->pat.idx[XE_CACHE_NONE_COMPRESSION] = XE_PAT_INVALID_IDX;
>>       if (GRAPHICS_VERx100(xe) == 3511) {
>>           xe->pat.ops = &xe3p_xpc_pat_ops;
>>           xe->pat.table = xe3p_xpc_pat_table;
>
