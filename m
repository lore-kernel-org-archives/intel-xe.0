Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE4BDC61DD6
	for <intel-xe@archiver.kernel.org>; Thu,  3 Sep 2026 03:16:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 678EA10E084;
	Thu,  3 Sep 2026 03:16:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="N10hlAW6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E4FB10E084
 for <intel-xe@lists.freedesktop.org>; Thu,  3 Sep 2026 03:16:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788405375; x=1819941375;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=sVY+oD3uMH0jmuY/iZPiGmYlivP5juzDkrw3vaIqP+s=;
 b=N10hlAW6vyRVrFIuWO0PD4uJMMO33nzPVwV9qisD+Q9Aqy8Rq1xJbM1Z
 9nt/f0xultDP6AZzcYbqBTix/SOiMMzwYi7NbvIhYvKxEsMWqDf5O3/DR
 ZHfZEOutXGjr1tmJS9wWlm7LnxKDBNszJHN531RtLxIjZSFFMkQUqE2O2
 mDHqUvW9UWGlLt/uDVCwhpGPB10IBk3MktlMNZcqZWQjrylP8dNVU6vyq
 NU1HPU/TCE81JuwwZGXoQoH8aX4s0m1u6ccJLE5FrrfUAIVRZysNzxBtf
 NUnWmt7Cim77vWtt7/aFNz2c0qh/l/fO3tEhx8OOUOSzqxfF/OpbI94Xx w==;
X-CSE-ConnectionGUID: CeILZYVIQROwo0QellUfvQ==
X-CSE-MsgGUID: mfvP6cL7TZerH1FjKldEAA==
X-IronPort-AV: E=McAfee;i="6800,10657,11894"; a="100230242"
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; d="scan'208";a="100230242"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2026 20:16:15 -0700
X-CSE-ConnectionGUID: ghC0K58PSQaEfN3AsB7pmw==
X-CSE-MsgGUID: p+glLKOnT2WljrLzxZTayA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; d="scan'208";a="268253826"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2026 20:16:15 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 2 Sep 2026 20:16:14 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 2 Sep 2026 20:16:14 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.45) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 2 Sep 2026 20:16:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LuQbsr6iYcYdyU0Vha7PmDQWCdWFU4xCQjjRB832y5pvKeptiexFwXrZjXDq9A7THH1RqpUvjP2+MdtfNfD6xBLuM6VGIvLST4hmW4rizwOXZFMoYhj+8LpSvGViKwsPYw4Wj4KK3iwYPF331WmZtaFp7LxOTqTy3QuM6jkHpmNZl0C7yqFslHBpnIgl06bNNkpfcQMDdxmm8VgqzZUe6dsju/fKhUpY/H5Pf3WhFL0yaeqioR6PaYuwg8KbzMgTGJeSsK714OkhY7PVkPPubB9YwjnkN9aaJV+9OWbgb7jbTiSS4E6aLoF1NX7YrZW94awMP2FEHlcqsvFGWT17TA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NHJ0RyRsj654QhaukUumsRr4EbM++PeeJA4mLrhaRnQ=;
 b=HMfLD4TCVX1AlYlLlpu3zulR4PElZlaB4XZZOqDfy9kLLt90+h7momhRAPVPcds7+C/gn6ejtwzKP4q07ZuyLrKD1d5Gy7YHC4/6VHAHxdXO3HBe+KWn8/ZIMZFLIdxS9Mv7qe93GD8SSGfxMzVwz3oSW/i9Eg3damuwgO9BM894su1Jl5YVU+2jmcPhqXXD29g5aobrSiDgmtSh+siphPdOUggJo3877zAd6j9P7xjJJ8z9wYwywKfrw+Ntyxjja9NTyK9IIqphUrJuCen8MBQHvD79DbEyM4+uXDK6C3OtzOUe+YoPZrkOkoITM3XvVCXeb0LKSyzZCddH6VzX0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN0PR11MB5709.namprd11.prod.outlook.com (2603:10b6:408:148::6)
 by PH3PPF37A184CA6.namprd11.prod.outlook.com (2603:10b6:518:1::d15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Thu, 3 Sep
 2026 03:16:12 +0000
Received: from BN0PR11MB5709.namprd11.prod.outlook.com
 ([fe80::ad31:3f30:20b8:26c]) by BN0PR11MB5709.namprd11.prod.outlook.com
 ([fe80::ad31:3f30:20b8:26c%4]) with mapi id 15.21.0360.008; Thu, 3 Sep 2026
 03:16:12 +0000
Message-ID: <d703508f-e088-43cf-9a4d-c0fb80dca02c@intel.com>
Date: Thu, 3 Sep 2026 08:46:02 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/4] drm/xe/log: Add GUCSUBMIT component
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: <rodrigo.vivi@intel.com>, <badal.nilawar@intel.com>,
 <himal.prasad.ghimiray@intel.com>, <dnyaneshwar.bhadane@intel.com>,
 <mallesh.koujalagi@intel.com>, <matthew.brost@intel.com>
References: <20260901063059.2547247-1-arvind.yadav@intel.com>
 <20260901063059.2547247-2-arvind.yadav@intel.com>
 <38edbb95-d9bb-4201-9a5e-829079de789e@intel.com>
Content-Language: en-US
From: "Yadav, Arvind" <arvind.yadav@intel.com>
In-Reply-To: <38edbb95-d9bb-4201-9a5e-829079de789e@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0050.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1d6::10) To BN0PR11MB5709.namprd11.prod.outlook.com
 (2603:10b6:408:148::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN0PR11MB5709:EE_|PH3PPF37A184CA6:EE_
X-MS-Office365-Filtering-Correlation-Id: b8dbb7da-c7be-4f91-83f9-08df0969b4bd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|23010399003|376014|10067099003|18002099003|22082099003|4143699003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: ydDWNm7VDQ/1j3qEuTuLhdrmu8A89Q5HxsxE06FIdq2T8lAUkdPfqCBC7zzkq8cgip0XcfCZJI/cykiJvlQD/f05KlvHIInRV2DnGtIP7eCEKg3Xi8tUtRSKHqd6+4rmxpWeiPL41Wma7Hx1X3uDB6lezoPUEaliTF72eXTXnB9GWumNpavULJhogUrVj7O3kQ62jE9087OueRBsFhFSsINMSRvDN8w5+3i2K6yvXJUUSd82KO3tIuGBUz/ljTDpYZM5bP6ROmejSk0oNHKC9gxk83pJtyRnFpq1TjZJ0zc35TwzI+e46Hfh0Int/jl/1XbbjLXuJvLuusaeR0OA+THupQ9TmIm23XFJ8UBIecx+xUk7lYTbnzQfuXB9ot/FmZBbVRoJJgI6PA5sGHi0Xd5/RhytisY3ov86SB5+j1S2k2ZHqW/mgv/As3EI8Sd+armF4BX7Myl2Lg5Jq094z2Af7tgQA8aTNeetH/Ija8Qv5LhEYEX1vHuMli7YGu88MbbL2g/InG42KW1vAAVrCZHRjFVbtcqCynbnxdhF2tgopXj2RnPEK3rG0Iq3Bpz/BxLA+xNrfaxvJORL5LAfXruVAvasZ3JsRSjAFnMwMN8YZ/Pnl4sXpH4IE6HhaUjLNVfNB9vqn90ltwA7rFDWK/2xyiMed4/stn2JNa4J7kQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN0PR11MB5709.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(10067099003)(18002099003)(22082099003)(4143699003)(11063799006)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZXNySlhFYmpDU0JDbWYzeFdrbkd1c2ptZDl6Y1lPMVhZcUM3YlI5YVZIMFFp?=
 =?utf-8?B?Q1JrUzdMSWxoWUV3N3Z2dEFkNU5CWk4rbWhtNnd2TWdybmVCWFJFYXF0WWNK?=
 =?utf-8?B?ZUVnOFE2cHRYS0haWFBDT3Fwa0RDUE10STFieUFoR2prc2ZmVnptQldZazFp?=
 =?utf-8?B?Y2pyVDNjaGx4VUJGa3Bucko2SDB4YUZzMTJXUTUvU1E5OUlDTFRUT3J4ZkRt?=
 =?utf-8?B?cXFFMjhoM3F3bEk3K1UvanJ1QUNzK1F1ZTB5OCsvc3FKV0VWcStQQVdaU0Mz?=
 =?utf-8?B?MlRmcjJ1ODdTTzVodlNramFiT1FtOHIvVXNwUW1oU0JQbU9ZMUxoVXp4Ukw0?=
 =?utf-8?B?Z2Y1ZXF1QTNqS0lVV3BtSGVSYnNneDhFSTY3TzBUOTJYb3Y1RE9CaFZLUThy?=
 =?utf-8?B?cVJZVjlRcGhSdFd0d0JPTmUvSVcvZC9aUnVNS0xUUEFobE5lRVVLbTEvcUF3?=
 =?utf-8?B?MXhCTGdrbEdScFNJM29vSmFJbzBzTTFEYnlOcjNvRUMyYkJJcWhCSEZVaGpq?=
 =?utf-8?B?VldDZWIvSzdBZU1KZ0hZY0tHdGJJSzNQL3RaOFdTS3NzRXkrY0lMQzhZZnZD?=
 =?utf-8?B?VVRKc1JaYXE5cmRJdE82SEY2TkxvL014RkQvVUxuSFlSQ2RoWHJwbmJOb1FM?=
 =?utf-8?B?Tk04VFJ1ZkdDU1hTTCtJcWFrRGZDWk1KWjYvT0FUcXJSNFI0OER2LzRKeTRK?=
 =?utf-8?B?d1E5bWFXTXkzeERGeTh2V3NOeFVnK3l0Rm15SmUyTlJOV0ZFbWRKWUNnYk4r?=
 =?utf-8?B?NW5ZWENweUhCNGVpMUtxZEFUdmZWTFZFSWlVVHA5ZTJPZHk0ZktiWlVGRDZv?=
 =?utf-8?B?N0xVdlF3c01QSi85dG55QVgzbUNYWTBZdGRsVHZINTRxVllWdGpQdkcvNWhM?=
 =?utf-8?B?ZWdJYmp2d0NuaWVkcFRqL0tDUHNPeTU1NGMya3JFSUFoOUdWWU83WFpMcVlT?=
 =?utf-8?B?OCt6WkF1WUJ0RXlPQUlWclRWRWhkenJhQXV5TUNsRENIcG0yUEJOZHBFa0NJ?=
 =?utf-8?B?MDdBWXlRTVdRTW5yNGRUamg2T0oxTkRKWEtTMnhyY1R2S0R0anlVVUEyY01S?=
 =?utf-8?B?dWpORFQ4M0RFdUlNakp5RCs1Z0tYWWZVY0FwOVU5SS95MFZUNHVhcmFKQ0lR?=
 =?utf-8?B?dm9HY1FqdUlGNG9BemlhL21vdHArK2YyMHc1N1B2WGxOZUlDeDNrNHN4VGlW?=
 =?utf-8?B?QkJ0aGJLYUtnbWlIMzYrcXkyQjVQaGs5QldKbnBrOVp5SFpRTlkxd3hOMGhH?=
 =?utf-8?B?b3VMNXlHM1k0SU40cUlhaEFHNDlkRjdOY2I4SENCU29yV2xib3JFRnYwd0lh?=
 =?utf-8?B?cU4rZzVwOEwzSDVHeHBhK0F6K0F2T0pwWE5rUmExY3NkdkNYSmpucHN1YVEv?=
 =?utf-8?B?OGdsdGk5TlBia0hKcXd3MnE2dmJGS0RGeExod3ZpOVAxeWhXV2ROYjhBMHZC?=
 =?utf-8?B?WE9QZ3M4TXk1R1FVV0MxcmZaSGEvd0FlRlcrS1BpcjFVY1liWDNyZ0Y4T0pV?=
 =?utf-8?B?eE1XYStSWnQ2akFnQ3Z0eGxxZVB5aERNV3ZWcmpHaUtjYWkwUURyQ0RPT2I0?=
 =?utf-8?B?RWNOeUhWeDFpRWJ2Nm5nNmVySmtTazRQUlRIWFplcUNQV3d3NXB1UXpFQ1Qx?=
 =?utf-8?B?ejNSSjdnOVpVNlVjN2M4Tk9HbFlleFZLWjBUazA2MmxuRTFLUG9MTHBGdEJz?=
 =?utf-8?B?UmMycEpVYllXWHNwWmtHRDFNbXdheDdBUHgrdjlwY0ZWUGFuQ0dhRjVvM3pF?=
 =?utf-8?B?Ly9EY1NKZ21wMjNFbTN6UmZCQk9sYmpqY2pzUlZIbHpQa2R1RU9YOC91MXFt?=
 =?utf-8?B?R25OaFVkeENsaS95R2VXVlhXSGJndGI1V05kSnNoZUl6TGdYejBGNFVmak15?=
 =?utf-8?B?MU1XNDA3REY1R1JIT0dPa0hxZkFWYVNYd2lNczkwZHlEZGRTOGh3a1RTTUlK?=
 =?utf-8?B?cWJMM0xsQ1BiNXI4MnZidmhWMkkxdVBNZi9ydndqRVcwQ0YzRTJhaXJpWWZa?=
 =?utf-8?B?UXRqVzJHK2pOV3RZRHlVRnJ6Y1dTT1JZbk1uSEd2a3dhckhNZEt3R0tRcTJj?=
 =?utf-8?B?WHMyaUNoY3I3YmYvZU8rSC9aZEdIMVZXelJIcWVobUxBUzUvcVVLWWduZ0ZV?=
 =?utf-8?B?Nm9DQkdjRUdyYm9nSjA3SG9ER2hSb3NUU00zN0p6TExpdzc4eC9aaklkWE5N?=
 =?utf-8?B?bGYvaHp2UnVMTXRDOHpkYjJYMmExb04yMGFSaE8xSjZsNStLZXFvNDBpZEZP?=
 =?utf-8?B?NmZVSGpHUnk5RmZSbmJjUDIwdXAvZWtQQWk2ajlReTQ4SGVmczFOT1hocjJP?=
 =?utf-8?B?UlU5bVBXKzl0TEpER1lFWllaZHc4VzhMcHltUVRDVlNrd1FYbFAxZz09?=
X-Exchange-RoutingPolicyChecked: vXmo/Cs3TalheurhzUHBieHbQWC9/g/sNUeQK16foACQBact2QNW2JjUaE5uQ1KI/yXh2lSe/6qI3F3RVSgn/qdK/18m/sPqudfDDQ8VKlWuMVRC5IH+0lMdawdg2rJ+cRj8jJO/VGFq6fH+tlUygTjF+PUGzmy6cdd327CB4zTXW9w1NpInrl3zFCiZlKKgGeMlbEkrZe0IM5RAZ5vD4njtvgU8GeSehSdFfUPoPmTYD9dcx8SapjCuIBFVAk0GeQpxV61XSRjovgxbXs+QD8Gp1bfu6taQP6NxQwFGO9Hmyn4pkBsDdvoQOHIzTkJhUZd5R2piTSzuUvH6vRMZDw==
X-MS-Exchange-CrossTenant-Network-Message-Id: b8dbb7da-c7be-4f91-83f9-08df0969b4bd
X-MS-Exchange-CrossTenant-AuthSource: BN0PR11MB5709.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2026 03:16:12.4284 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fLoWhCpnlRCRDqAB5X7p4Ly2zLdBBDfBq4DJtnMPW+J9Qk6o+ZWAQJZtJmMUa3Tz47VJF+WfZosnIPWMautS0A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF37A184CA6
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


On 02-09-2026 18:03, Michal Wajdeczko wrote:
>
> On 9/1/2026 8:30 AM, Arvind Yadav wrote:
>> Add a GUCSUBMIT component for structured SIGID logging.
>>
>> GuC submit failures can still map to an existing SIGID, but using the
>> generic GT component hides the source of the report. Add GUCSUBMIT as
>> a DRIVER component and map it to XE_SIGID_GT_TDR.
> nit: can we improve the commit message? maybe
>
>   "The proper SIGID for the GuC submission failures is GT_TDR, but use
>   "of the generic GT component may hide the real source of the report.
>   "Add GUCSUBMIT as a DRIVER component and map it to XE_SIGID_GT_TDR.


Noted, I will update the commit message.

>> Cc: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
>> Cc: Badal Nilawar <badal.nilawar@intel.com>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> Suggested-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
>> ---
>> v6:
>>   - Moved GUCSUBMIT from DRIVER_FIRMWARE to DRIVER, since GuC submit
>>     is a driver submission component and not a firmware component.
>>     (Michal)
>>
>>   drivers/gpu/drm/xe/abi/xe_log_abi.h | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/gpu/drm/xe/abi/xe_log_abi.h b/drivers/gpu/drm/xe/abi/xe_log_abi.h
>> index d6105520173e..91fe983ad917 100644
>> --- a/drivers/gpu/drm/xe/abi/xe_log_abi.h
>> +++ b/drivers/gpu/drm/xe/abi/xe_log_abi.h
>> @@ -144,6 +144,7 @@ enum xe_log_location_bits {
>>   	define(DRIVER, 4, RTP, SW, "Register Table Processing")			\
>>   	define(DRIVER, 5, WA, SW, "Workarounds")				\
>>   	define(DRIVER, 6, PAGEFAULT, MEM_FAULT, "Page Fault")			\
>> +	define(DRIVER, 7, GUCSUBMIT, GT_TDR, "GuC Submit")			\
> nit: we can have "GuC Submission" as a full name


Noted,


~Arvind

>
> Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>>   	/* */									\
>>   	define(DRIVER_HARDWARE, 1, REGS, IO_BUS, "Registers")			\
>>   	define(DRIVER_HARDWARE, 2, GGTT, IO_BUS, "Global GTT")			\
