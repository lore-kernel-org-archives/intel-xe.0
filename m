Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6480CC9832A
	for <intel-xe@archiver.kernel.org>; Tue, 29 Sep 2026 05:34:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2302B10E7BA;
	Tue, 29 Sep 2026 05:34:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GIbRUeOu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C73210E74D
 for <intel-xe@lists.freedesktop.org>; Tue, 29 Sep 2026 05:34:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790660095; x=1822196095;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=fbtrEkQiy3BCFRCbj31AgtXjvrYpPdUX3KhqFhOYx4I=;
 b=GIbRUeOuGP740NB761Ewsc52+5cgr1Vo/x4l/6zsF735MDVzVo4Hn/PG
 eaGKsSPyGC0umCbZh/gOP+HWNBS1C8wk/juBpnbXQX+CFgaOh6xMndWNR
 FyPDOF211Pgpu57GizS08EeFSOMXj0FibM0bxpEaEGxtWTKLXDmLDB+3d
 M/1DGFYwL5TIVpeOvoV/tN899t2n+MDR70zW6fKzsWOKtxamnOOysM2n1
 K012uwMCjHEdolzjYPkpzPwc6MYj7oSVe3+08jowyhXannUI5A62RhZDU
 twWpIvIBfdDpXr4/XNGZgmBTzlgk78ZMS1iaJLMJZH/cVuOwurhLAScxv Q==;
X-CSE-ConnectionGUID: 3lpKr3wpThm9GTVr0AeFNg==
X-CSE-MsgGUID: lr8IjtpxSSKh8dfETSeT5A==
X-IronPort-AV: E=McAfee;i="6800,10657,11919"; a="91467820"
X-IronPort-AV: E=Sophos;i="6.27,129,1787036400"; d="scan'208,217";a="91467820"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2026 22:34:55 -0700
X-CSE-ConnectionGUID: wl6+2uI0QpyMBwKVCfqlkQ==
X-CSE-MsgGUID: eoRKTHv7Sdacj5eeYZaZ5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,129,1787036400"; 
 d="scan'208,217";a="275292719"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2026 22:34:52 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 28 Sep 2026 22:34:51 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Mon, 28 Sep 2026 22:34:51 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.7) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 28 Sep 2026 22:34:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iPFOnn9NWRJCMp9InTvyJ8TalXZYkEFZ9CBCSoBuBXBoHuHQ8p5x0zvMvOSdoLwnI+X5gytbYPCwzPXZG1JvS0l+KDg4XHhmnw7qoinTWj+q2DbqVZObtcJXdHfdZgdIPvf5kMdNeFJqA+MkabxHCwjWstaz2EafjVQLCN5x/fGjAwlhGYEVtwmP2iyfiMxjyvyzRWhGw/LGf33xOCDV2OvKMAgSnbCNqaN/ERd9ofAqGUtQNSRkr98qNtgMMyDH0mVSfetudpklTcr1l07txyTg483tC4Q8vGz6fCHntpMzlJDWS6lomSN9rqsgz6hTWpnrUVqeiYyQrAuK46AcxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aiL9/wwJVKXP9Eq50IFDqkVtudqrLXmaoNbm9fq8zw8=;
 b=EWgntmQWGyb6ROGHZte29wMB+JiwDNjsHV/Tf/oVpQwjDVR16Hy1hb0NY2yVtBgynF1AEYAGo8WJ8llidcPPUKhCyiEGgxg6WkfjBeu8W0I3NZHu/yXlXL3YTTk43JmAuokaX/JUVCDww5TxNlI/66ozNwgMc2/VEC+KJVBShMdJc1hqqCwSy0DFaC3KHCy6Bu7CsFkDOASa/dBx2k1MuZurx2UMcLQ1jLJwFHLhzEm9/JYtDP0K+NvRltwtFccQNHs3810UbRoNvBd/bY8A4doYvdwNjFfIH5IVVnGQdq7s9K+k0zzD8HFG/oCd34A2RQvVKqZtC08xxg/+yUralQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6207.namprd11.prod.outlook.com (2603:10b6:208:3c5::21)
 by PH0PR11MB7564.namprd11.prod.outlook.com (2603:10b6:510:288::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Tue, 29 Sep
 2026 05:34:47 +0000
Received: from MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d]) by MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d%4]) with mapi id 15.21.0451.014; Tue, 29 Sep 2026
 05:34:46 +0000
Content-Type: multipart/alternative;
 boundary="------------bPPJYnJ0D3oNfWb0dWvs1Up2"
Message-ID: <24325239-64bf-4db3-b5de-a888b285e616@intel.com>
Date: Tue, 29 Sep 2026 11:04:39 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 04/12] drm/xe/mmio: Report BAR mapping errors using
 structured xe_log API
To: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: <michal.wajdeczko@intel.com>
References: <20260928092114.1610203-1-dnyaneshwar.bhadane@intel.com>
 <20260928092114.1610203-5-dnyaneshwar.bhadane@intel.com>
Content-Language: en-US
From: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>
In-Reply-To: <20260928092114.1610203-5-dnyaneshwar.bhadane@intel.com>
X-ClientProxiedBy: MA5PR01CA0282.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:21d::7) To MN0PR11MB6207.namprd11.prod.outlook.com
 (2603:10b6:208:3c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6207:EE_|PH0PR11MB7564:EE_
X-MS-Office365-Filtering-Correlation-Id: 0e33dcb8-f64b-4904-f401-08df1deb5f36
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|23010399003|10067099003|11063799006|22082099003|18002099003|4143699003|8096899003|56012099006;
X-Microsoft-Antispam-Message-Info: ZMhCpr9wQRgwVe8QFLzVxlg6+cK2KW9pshw2EMl7q6KuGCgb4RFLfiv4hKftqlICsYq3l8eRy/h5buleEaSmRvyyVzHg3UX3wSvQL5oiRVCdfdBT+KJUUckWp2j8Nt3VEMgC7BGKgWKSb639YLTaQK/sMCJff3T9cQoosdTIgrKHbePPw1jJFjY3tHvKVECtkft6kR2R7M6sLMRtUIzR/K/4b18eSj8M3rkBKTjJVz4xyuUgiysnWtJ5M3BAPqEkjE6W5aU16Hwn91zD591OXrxj5ZpoiRetc9UT/BLBUZl99bYdT6SKATXDlfLaSVOBaH4QxTHd+x5YNBkFvMl5xr5equ1vTcetcPaK+DcM3WRkvLwRwC2YadOw4hdgJ8qDyGOZ6eK0qJ1EUmq6xK1ppKKXWF5CiVXYdgbaw+17a8zuT2fCTqvHFEqdEy4CZm03DX1DZSLlxuwm8fYeLsAxj/GWV4qkjaU4DeJjxI2L+cvRRCZE+iDs413okzrjmHjv/vPcqsED+Vtpl/Bv2wMnflttc0hc067qaSvjPghgcL0oZALRvg9EV2uv/TJ5xrey8Q6GKkTfmVHy+aZAB6UFNw4vaWIl4zNBYaqh7BRf25vMIXt/6tnbpHxKfvCJwPS9vaNwKlg6QAg4Zc9Nuo9Roeb5kCCQpxXpfKsxuoEo9ow=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6207.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(10067099003)(11063799006)(22082099003)(18002099003)(4143699003)(8096899003)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NTZ4WU1lVlVxNm8wbS9YUUFHT0hRTldLQlFwZzhtdnM4WXEyTzRHWTdzN3Ri?=
 =?utf-8?B?RUd6QTFyc2J0b1BYNWpuMURHbnAwSHRUZzlKWmNSVkZUZTY4YzFURmw4dlR6?=
 =?utf-8?B?dTNTRnU5Skp6ald0N3FVZ3ZibTV5T3BYRlQ5bVNVdEo2b2J0ckoyRUhOVHIx?=
 =?utf-8?B?NlJLM05sWlI5eC9xdkZkV05sZnk1YjhwRDhid3crSVlBNVNUczU4OFhmYmF2?=
 =?utf-8?B?STYxYTBtY3kraEJxKzVGck1NQmtYcjdmaDlOdk9FMWtubHVxbk9YL2M3bEZN?=
 =?utf-8?B?OWpuRmtGaUtFZHRHZEIxcmZqUzFTVGdrWFYvYm9EcDZDdS9CNDR0UG1KcWtG?=
 =?utf-8?B?VmxpUUlIZVN0WERtYzJMK1J6aHVRYUhRNGNRUmluclZLLzBpMTJLMUc1VCta?=
 =?utf-8?B?aFRiRW9xMlVCbEgvOVdrSFJzTmdObEg4RFIzRmp0R0xFYkN6VFN6QWUvZlI2?=
 =?utf-8?B?Z2E2dFVpUC9TdkRjNnEvQzd3UldMd2IveTZWS01QamFMNHlXbUJqZURsdXM4?=
 =?utf-8?B?WndxZnY5czQzN01XNGJxaElJNVZDV2ljanplc2R3Q0t2VjJQbUpjS3Y0WEYy?=
 =?utf-8?B?aG1UOG54VktXNEhCRkxsU2d3UTNoTVJORnF6WXVWVkVIQStmdCtIK0x2WUc1?=
 =?utf-8?B?ZUZ6eEZ6ZWJURkJQZll3bWNjSFRxTkswNjI5elE1LzVZNUJXMEt1Z0pPT2pS?=
 =?utf-8?B?NE4rTlBreWx0Rk5IVlczYWJCMExFMXFWcElkeDlGb0VZeUFYVXB3bnUyZjRo?=
 =?utf-8?B?eUx6WlQwK0xkTCt0ZUsrTHJmT1lzWHFlL0xlTTZjVXNCTzVZemlodnVjcDVN?=
 =?utf-8?B?WkFBNzRORXFiaDQxYTN5SVhXenl4UnQwVTBvb3dYam9senhsSWhpaERwYm5S?=
 =?utf-8?B?ZFZWbzBudWxUb0NBYVc0UDlzRUxZdlBJOFF3VU82WU90UkJkbWRnNzArTFJV?=
 =?utf-8?B?aWZLY3FGTW1xaTZabitjZTBQT3pZamJpTTFrVk1WRWdUc0JCN0x1YmVEVEky?=
 =?utf-8?B?NCtGZGtlaTRXcUpCWFo2NUphL3VLelR1RFRHbnpVN1FLOXQzSDV6R1FFd1Ns?=
 =?utf-8?B?aHdOc0ZLTDJka1FaTXFqbFVqcDRTSWtOSjJadU5iMkFBL2ZDNDlhaHk1cjdN?=
 =?utf-8?B?TTJFcEtkSmg0MjFvdW1jb0hPZDJ3Q2hBSnE0VUxDWVhZK3JyNisxN29jWnE5?=
 =?utf-8?B?LzNIbjB4bVVyckRaazQ0djZhUlc1bWhHWFZYejRPSWFJdzhxaVpnM2hlOHUz?=
 =?utf-8?B?TXlHVmYzUE1KY0hjN2RxdmhjMkJlYWlabWFuYWZKV1V5NjlUSGdrRzVDeWVl?=
 =?utf-8?B?QTdOeC9qZisrY2twMUxGbzRkdlMwSVAycEM3bkIzeXUwTlVNc25hc2JHNlpZ?=
 =?utf-8?B?S3ZzcHdMZytIUkNNNVhKM0JlclBibW1aS2U1cnV2bXdjZTJ5VDYwV0JjRFpq?=
 =?utf-8?B?T2hUQXlNNzJWaUtnR3J5Y0VLd2xWbThsc21Wa1Bpb2JtOC9GVm1CeUx2dzhw?=
 =?utf-8?B?QXFCUng4NUd2TlpiTTVhbmduVzU2SDFKempQeFpldGlSdmJLSkdnZEZaSlFW?=
 =?utf-8?B?dGZzTGt3QW5aMWNkbDl3QThHZVdEZ1JNOXh3bDlwcnF5WjIyWGw4NVA2TE1S?=
 =?utf-8?B?dlpOSzRJRjljNGdQRDQ4T3FZb3VxRi9jc2xNZGdGblozcnRKMFA4K2RaN01N?=
 =?utf-8?B?UUFvbVVJWFcvNGdpaVoxdnVQMU9IbnNqMW5GbnZ5Nm10QUVINklVK3lTQnM5?=
 =?utf-8?B?N2s5ZVMyUVF5WnZJa1l1V21VdkttU3RlVmFSS3liZTl3V0lPWVhZRGhpZEVk?=
 =?utf-8?B?N0tzVlp5aXk0UXlBa0xTc0psa2o1aUlYTXlNYjZDY3J1UXE3NGdEb25udVVU?=
 =?utf-8?B?a1ZzenAxR2xyMURHRzJ5LzgvWnRiN1JZMDZuc0p0M2RKaVRHNXVyQkk1Sit1?=
 =?utf-8?B?eVhvZGpzSXVNZjdEaE1hbUJYVk1pakNicFdhMlFxelZJaGVGM1Q0cVpBSEJF?=
 =?utf-8?B?Wms0dzhHNk1vVDMwUFRud09OSnhSVGRzWis2MHVNOWJTSWVUdTA3Wkp5dFU0?=
 =?utf-8?B?SWI3UGxkTGZJeUR3U2tjL04vMkgza1hETGNOVWljRG5rRFgyQWsrMUFMUUdC?=
 =?utf-8?B?Smlra3UyeXVsV2pVQmZrOVdXdG1xVUU2UU81aEhvVEd4N2k1MXJPaUFjU1BO?=
 =?utf-8?B?V1hWNTUzcjZmSFcyWUtXczVGOVY1WGRqempTYjljdmZWSDZrSXNwNXJrOWg4?=
 =?utf-8?B?K283QUpLWWpQZ1JiejJRL0FHY0dEU2xpbWxybm9jcTJZZjB4YmRyNkh3bEta?=
 =?utf-8?B?YnlXUWlubklVcmtzL3ZDZUNZeGYxbXBmUzRMano1Qk9mdEs1U1NHd1o0eGJk?=
 =?utf-8?Q?Qm4cqlBLxhER1o6M=3D?=
X-Exchange-RoutingPolicyChecked: 38OoutveKPfDoyoq4Yp0PZOvQuee/hE9QcJGNrzoe9rMUOSOdgmsUNsjyLOKK91ZlPcgA6ysxu5fYc5Z94trEcOp0n/E0xPSPtEgwEe/X9LwVMAH316worxqq5FdgSw5Ce1mbAJQYCG/5uxHB17+nUOSPqM1D1xTa7osSN8H7IKVzH3kq50cqAHNtVQKhvh8EsoVt2+bg4YTLqIfqNwwicMjJn4t1EEZ+SQ9wa/DdoZX2sTTVQJ+jjmr2u42vnuoI8WTHHAtfKqsdcYEhv67w2icEu9U1UUyjZlVlU4zsBzHfmzUzkg+EgpzvSj00UfN6CPV/j9/GnNcJoLEfgphuA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e33dcb8-f64b-4904-f401-08df1deb5f36
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6207.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2026 05:34:46.4932 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WdKFpCphj2DFiVVKtbA1nCl2b3gCkREOuQGq+2agqVrCXggC6+UgUVpHU6tZ6MVNqF9yZV7XppJRZaDD8TLAHED8yLFO0SF467UapiGU0Kg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7564
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

--------------bPPJYnJ0D3oNfWb0dWvs1Up2
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit


On 28-09-2026 02:51 pm, Dnyaneshwar Bhadane wrote:
> Replace xe_err() calls with xe_log_err() and xe_log_err_fatal() using
nit: hmm, Remove xe_log_err macro, we used only xe_log_err_fatal right?
> the REGS component tag for MMIO BAR probe failures
>
> Signed-off-by: Dnyaneshwar Bhadane<dnyaneshwar.bhadane@intel.com>
Reviewed-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_mmio.c | 12 ++++++++----
>   1 file changed, 8 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
> index 7fa18dfcb5a2..890146b8836b 100644
> --- a/drivers/gpu/drm/xe/xe_mmio.c
> +++ b/drivers/gpu/drm/xe/xe_mmio.c
> @@ -15,6 +15,7 @@
>   #include "regs/xe_bars.h"
>   #include "xe_device.h"
>   #include "xe_gt_sriov_vf.h"
> +#include "xe_log.h"
>   #include "xe_printk.h"
>   #include "xe_sriov.h"
>   #include "xe_tile_printk.h"
> @@ -71,8 +72,8 @@ int xe_mmio_probe_tiles(struct xe_device *xe)
>   		return 0;
>   
>   	if (xe->mmio.size < xe->info.tile_count * tile_mmio_size) {
> -		xe_err(xe, "GTTMMADR_BAR is too small for %d tiles: %zu\n",
> -		       xe->info.tile_count, xe->mmio.size);
> +		xe_log_err_fatal(xe, REGS, -EIO, "GTTMMADR_BAR is too small for %d tiles: %zu\n",
> +				 xe->info.tile_count, xe->mmio.size);
>   		return -EIO;
>   	}
>   
> @@ -105,13 +106,16 @@ int xe_mmio_probe_early(struct xe_device *xe)
>   
>   	xe->mmio.regs = pcim_iomap(pdev, GTTMMADR_BAR, 0);
>   	if (!xe->mmio.regs) {
> -		xe_err(xe, "Failed to map GTTMMADR_BAR\n");
> +		xe_log_err_fatal(xe, REGS, -EIO,
> +				 "Failed to map GTTMMADR_BAR\n");
>   		return -EIO;
>   	}
>   
>   	xe->mmio.size = pci_resource_len(pdev, GTTMMADR_BAR);
>   	if (xe->mmio.size < SZ_16M) {
> -		xe_err(xe, "GTTMMADR_BAR is too small: %zu\n", xe->mmio.size);
> +		xe_log_err_fatal(xe, REGS, -EIO,
> +				 "GTTMMADR_BAR is too small: %zu\n",
> +				 xe->mmio.size);
>   		return -EIO;
>   	}
>   
--------------bPPJYnJ0D3oNfWb0dWvs1Up2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 28-09-2026 02:51 pm, Dnyaneshwar
      Bhadane wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20260928092114.1610203-5-dnyaneshwar.bhadane@intel.com">
      <pre wrap="" class="moz-quote-pre">Replace xe_err() calls with xe_log_err() and xe_log_err_fatal() using</pre>
    </blockquote>
    nit: hmm, Remove&nbsp;<span style="white-space: pre-wrap">xe_log_err macro, we used only </span><span style="white-space: pre-wrap">xe_log_err_fatal</span>&nbsp;right?
    <blockquote type="cite" cite="mid:20260928092114.1610203-5-dnyaneshwar.bhadane@intel.com">
      <pre wrap="" class="moz-quote-pre">
the REGS component tag for MMIO BAR probe failures

Signed-off-by: Dnyaneshwar Bhadane <a class="moz-txt-link-rfc2396E" href="mailto:dnyaneshwar.bhadane@intel.com">&lt;dnyaneshwar.bhadane@intel.com&gt;</a></pre>
    </blockquote>
    Reviewed-by: Mallesh Koujalagi <a class="moz-txt-link-rfc2396E" href="mailto:mallesh.koujalagi@intel.com">&lt;mallesh.koujalagi@intel.com&gt;</a>
    <blockquote type="cite" cite="mid:20260928092114.1610203-5-dnyaneshwar.bhadane@intel.com">
      <pre wrap="" class="moz-quote-pre">
---
 drivers/gpu/drm/xe/xe_mmio.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
index 7fa18dfcb5a2..890146b8836b 100644
--- a/drivers/gpu/drm/xe/xe_mmio.c
+++ b/drivers/gpu/drm/xe/xe_mmio.c
@@ -15,6 +15,7 @@
 #include &quot;regs/xe_bars.h&quot;
 #include &quot;xe_device.h&quot;
 #include &quot;xe_gt_sriov_vf.h&quot;
+#include &quot;xe_log.h&quot;
 #include &quot;xe_printk.h&quot;
 #include &quot;xe_sriov.h&quot;
 #include &quot;xe_tile_printk.h&quot;
@@ -71,8 +72,8 @@ int xe_mmio_probe_tiles(struct xe_device *xe)
 		return 0;
 
 	if (xe-&gt;mmio.size &lt; xe-&gt;info.tile_count * tile_mmio_size) {
-		xe_err(xe, &quot;GTTMMADR_BAR is too small for %d tiles: %zu\n&quot;,
-		       xe-&gt;info.tile_count, xe-&gt;mmio.size);
+		xe_log_err_fatal(xe, REGS, -EIO, &quot;GTTMMADR_BAR is too small for %d tiles: %zu\n&quot;,
+				 xe-&gt;info.tile_count, xe-&gt;mmio.size);
 		return -EIO;
 	}
 
@@ -105,13 +106,16 @@ int xe_mmio_probe_early(struct xe_device *xe)
 
 	xe-&gt;mmio.regs = pcim_iomap(pdev, GTTMMADR_BAR, 0);
 	if (!xe-&gt;mmio.regs) {
-		xe_err(xe, &quot;Failed to map GTTMMADR_BAR\n&quot;);
+		xe_log_err_fatal(xe, REGS, -EIO,
+				 &quot;Failed to map GTTMMADR_BAR\n&quot;);
 		return -EIO;
 	}
 
 	xe-&gt;mmio.size = pci_resource_len(pdev, GTTMMADR_BAR);
 	if (xe-&gt;mmio.size &lt; SZ_16M) {
-		xe_err(xe, &quot;GTTMMADR_BAR is too small: %zu\n&quot;, xe-&gt;mmio.size);
+		xe_log_err_fatal(xe, REGS, -EIO,
+				 &quot;GTTMMADR_BAR is too small: %zu\n&quot;,
+				 xe-&gt;mmio.size);
 		return -EIO;
 	}
 
</pre>
    </blockquote>
  </body>
</html>

--------------bPPJYnJ0D3oNfWb0dWvs1Up2--
