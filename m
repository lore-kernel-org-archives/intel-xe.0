Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 565AECC6B3D
	for <intel-xe@archiver.kernel.org>; Thu, 15 Oct 2026 10:33:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D44510EA0A;
	Thu, 15 Oct 2026 10:33:17 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4962310EA0A
 for <intel-xe@lists.freedesktop.org>; Thu, 15 Oct 2026 10:33:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792060391; x=1823596391;
 h=message-id:date:subject:to:references:from:in-reply-to:
 mime-version; bh=+FdP1wd7K3bL4S4pejl1Ak5vtNXHjrpEMmPmZBspSOc=;
 b=ULBruvDXTQMVneRPVWGhgKX9jLrCVLB2glcMUYIdgiP22rCx5YkjigHJ
 I/+HDnebfhqnjvQYQDOGYBEQcTdYcIMYJM6wvVbWIzXTJOaT0yCse6F9T
 r8hcbdgQTb/Lhlj9KbCz8pYorEQPXzzi0+wZTA8CHGGKj7/3io0qb2hTh
 IVeZJ2QyG3M8aibrO9fYeomfl+8kfxEYiU3fGER260cfpXnkRVnYqjSGi
 yIDH9NeSUO2KfPYrumbwm3MFU4cAVprn8dlXSHDC0ZQ8u2wb+QYqnG/dw
 heieeTsEJSFZVMaWV4zSJNOeWl7KupmoQ1O+dTkwY+ADr046Cc2MDlt8G Q==;
X-CSE-ConnectionGUID: 771osol7TG+SwT3BBkzRRA==
X-CSE-MsgGUID: mmG+GlyNTUu3y1FQ/IcEGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11935"; a="713714"
X-IronPort-AV: E=Sophos;i="6.27,159,1787036400"; d="scan'208,217";a="713714"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2026 03:33:10 -0700
X-CSE-ConnectionGUID: ZubMWBHiS8i3McoOkwq85A==
X-CSE-MsgGUID: clr5gn35T5+LS1r5bcHRZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,159,1787036400"; d="scan'208,217";a="1910961"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2026 03:33:09 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 15 Oct 2026 03:32:53 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Thu, 15 Oct 2026 03:32:53 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.18) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 15 Oct 2026 03:32:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=px96FGTnkBf55ME4a8Lf70z5W+bcSM9PyQbeuW9QwQMKPvFf5q7Zk2unnRalgNDpWXsq+Srp48uPijG8Vct879scTlRcvmpHvMuRNvAI0GT+tcXxvoWB3RLbv0gwTaAaI0Ap1lhBpbx+uS76819W72Ebidn5FFF8kd03bbtollr/9CcPgol9QD7MoGWjA2OUN7O8LfAq1otE45ACmS2rp0w7jGi3uSb+mH+nXhDXgPvRBZFc6Tov6FZTC2bXcus2EngxRuP7SIUNIt6f7AHrhovQzyrFq5eQp0jJ01Eq8An/cZeonJhG3sGG3ulmnbjM7SRygatrMk4HiprWtfnjnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=noyLpUGT4FCnz/SoQpzjpU/pXl3Xu7ihueALvHP4WnU=;
 b=OoNWjJtZcn8T9oRFi8bkbwGvy1Jd2nEihPBvazc57NkKbaD1V2EM9KAFuLeniBWFoeGZrbm6U04R5DuPdDlF/0jp4/LjyupU1xmWqmphkrLBB8HSIlbhmkLXjbAa2M9TzdbJu48KwLNYahvuevv6ibf3+5cU84inph5hPCcxM9pj9FJlG9xl1S9kZdMzz6IPUZcxJfXAlBPQT3nysmvb10lvxOh2kCGbLcr5yjZcQzXorJBjPkae+/vwII5TjUdNklyqFIuQMVDkFrkzFVrqWMUncLrcIaqbzSG32L9VWRQE9FtSXAVeklZtxWzY8VNhfCHUCGPzcqicYVEZFRkHbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB6939.namprd11.prod.outlook.com (2603:10b6:930:59::17)
 by PH8PR11MB9974.namprd11.prod.outlook.com (2603:10b6:510:3cf::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.23; Thu, 15 Oct
 2026 10:32:51 +0000
Received: from CY8PR11MB6939.namprd11.prod.outlook.com
 ([fe80::d46a:5310:523e:2307]) by CY8PR11MB6939.namprd11.prod.outlook.com
 ([fe80::d46a:5310:523e:2307%5]) with mapi id 15.21.0522.012; Thu, 15 Oct 2026
 10:32:51 +0000
Content-Type: multipart/alternative;
 boundary="------------svLNBKEB2V2FWOjgFeb9Lk0X"
Message-ID: <c42b2003-687d-4561-9666-625660238cfe@intel.com>
Date: Thu, 15 Oct 2026 16:02:43 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 2/4] drm/xe/kunit: Extend GuC ID manager split-pool
 coverage
To: <intel-xe@lists.freedesktop.org>
References: <20261014100907.77877-1-piotr.piorkowski@intel.com>
 <20261014100907.77877-3-piotr.piorkowski@intel.com>
Content-Language: en-US
From: "K V P, Satyanarayana" <satyanarayana.k.v.p@intel.com>
In-Reply-To: <20261014100907.77877-3-piotr.piorkowski@intel.com>
X-ClientProxiedBy: MA0PR01CA0046.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:81::16) To CY8PR11MB6939.namprd11.prod.outlook.com
 (2603:10b6:930:59::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB6939:EE_|PH8PR11MB9974:EE_
X-MS-Office365-Filtering-Correlation-Id: e5c9ccf5-7f6c-43bc-e10c-08df2aa7aa25
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|23010399003|1800799024|11063799006|4143699003|22082099003|56012099006|18002099003|10067099003|261009223027099003|8096899003;
X-Microsoft-Antispam-Message-Info: us/Pf9Q7pzYC1z3s7T0ACH1F5dKd2ba64zC2YpdaaY7nR+HoB341GyaG32ulGL80lkEyRPXtRLxQy4rmHnjFJzhr9VkQknMC3JGeHUeA/DeMXChi9eH99NkH++fDmdCCKRse0YmBgVlNYdMsEi5d6H+VDPScYoGT+jH5KYqqnlFeAhpB0BDl59ttcgodEnxNceC7zYNsHM1AkPrzFm+JhX9zJORsVkknqufsqlbqhphMJEesfgQB4+BOSUNpVyV2yhFlcTz7N7dNDmT1INHYoN0eLJljPE8FQ9jQHLH3bW/Oa7bZIWmm6UIhV4UfcuSJPVn8SwOzh2qaFCtoHVUM3Y474wGNpN6CexVSgfwOlwRSv9Zx4k6D8jyp9tRLNritvj/FEpAeVR5Pig15WtDk6OOG113Gg7da40q1qWMA8t21kYZP4vMuW3kTUNYLJaNQMqOnBPXgA19ASDe0JGHExvnyAMmf8sZuw0gAy462vPBc09oDT+4evI4aPIUgKeU76olr1b49Ysq1m6rUtuiPhtoTJobQvlXo2fcGYHop53ZGYLFkiT1CeWeDjQAqlgmHf21HYMNkLk0vUMJqwcqJayUP+PumAHOTWNCDt/87s+k93Ps0cs9vnsuKUWXDQj9BRF6VNJlB8VCLK30o0GfQkfKpt6CvkDRMOG6KOPDDgC0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB6939.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(11063799006)(4143699003)(22082099003)(56012099006)(18002099003)(10067099003)(261009223027099003)(8096899003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QWFmcUV5TzM3WjVLZ0p1VXhrRmhEbmQyb3pYa3B5MElMamNoUVlxK0tMWTE0?=
 =?utf-8?B?V1didE01K0tNSnFKdGJMUjRYRXk4WUZRNjNoYkIzOE9leHc3ZzBrOStQYnRi?=
 =?utf-8?B?QTF6S2NBektKbURaODFyanBvbXhYbTkyck43em45dDhtZDMzei9aVlNDcSt2?=
 =?utf-8?B?SUQyNm0wa05tU1FMNHlsQURHeXp5TTF4TkRJTmdXemV4VDMvd1Jid1ZXRFZ3?=
 =?utf-8?B?YmpLeXRHeGMwN2RUOUpNOGlBS2gyMzVqVmc5eURLcUdlTXI0Q2laV3Z6Um5B?=
 =?utf-8?B?Wllpb2ZwTkl1SU0wRmNJR2RBeEhmL1lTMlNqL2ZrQkt2N1NJSnN1RWJjVHUz?=
 =?utf-8?B?a1A0NjEzcFN0cmljN2M3L2svUUg1bmVDVFJ3U0taM25zVFRtTmZNUS9ORXZo?=
 =?utf-8?B?d212ZnI2SGczQ2cyeW9Rbm4yaWg3R1M5M1RqQVZIVzVKQmpvMkpnN3ZZOW4v?=
 =?utf-8?B?NEV5RW9BQnQzeUN6bFU2Mk50L0FORjUwU3YzdENGbDVBeE9HcXEvbFlHalN2?=
 =?utf-8?B?bE5IZGMzZW9DYUwxTUVTSmhUUTdNVHNUZGVmbVM1V0hQOUdCbXJkUzEyUUJL?=
 =?utf-8?B?VnpxOWRHTlhBWVQ0YTNRWGpOYkVhNzdBYng1Q2tlMDlxTms1clRZaENJSHEr?=
 =?utf-8?B?UTF0VkxTeEhXdm94d2R4NkF2aGg1MHdFUGtnVURBakQrL2h4QWd5OG56RWdC?=
 =?utf-8?B?b0JZWkFqOEhCT1NBNkQyYkRrMENVcjBkZlFGK21pWEVITGV6Y1N4RGtNRVVG?=
 =?utf-8?B?Mmk1OVlZVEZsdkRNZEgwZ0czRjVQK3dFYXE1bnNSajJHMEV5SFlNT2U1RkJ5?=
 =?utf-8?B?TGJxZFNNVTBFUHJ0ZU1oSExaOFFaQVJpaTU1Mnk3S2RURmdtQ3IvNHpCTDcx?=
 =?utf-8?B?eXY1a1hkRDNqVXBxREJ5WFEwMTVqbEdKd1RnUlBaM21WeFh3Yyt1dGtrb0Z0?=
 =?utf-8?B?WUNjaUVUOHBocVYzQWpuZ1E2VnVaMFFXcUtxVC8rWEw0QnRLWm1LRmg2UE1t?=
 =?utf-8?B?ZnVCa1FDVE5RMS9wNzRlMzJxakxDK2xiN3ZoTFl2cldaSXVGVDRjUGd5TldT?=
 =?utf-8?B?M0xueGpRcC9Fd01RTktoVnlsVkY1RFU0MEJrWHcrY2JYWnY5bmZJSXRVdy9Z?=
 =?utf-8?B?OXZ6NXJTYmZGcDdsYnF4eCtaa3k1MnNWQkMvQXRuVlUydG1qTU51YUZ5ZldS?=
 =?utf-8?B?akUyMG8rWDA5aVFPLzlaczI4UUtDU1pCWGF4a2tCZHp3Kzd1TWlQdFZiNWtI?=
 =?utf-8?B?SUZ0S0lTMWY1UmF2TmxVVGtNL0huVUxHYlFJU2VMTHZFL2FNeWFIemVBSWs3?=
 =?utf-8?B?NkhNa080VUkzVU5peEtOR3RlZEc0Nnd1bDQ1WHFTeWRjd2JZZmdsVytPN2VK?=
 =?utf-8?B?NFZwdHprR09QMEdMOEZybnowQ09ROWgzbDZWNEZCdzhydlJiblVCZmZzc2Jo?=
 =?utf-8?B?SGc4VTcxaWtSeXZ1MWhhV2tCMXlhd3F0VFV1TWM2cVF1QlkxdWgxVmd2OHVj?=
 =?utf-8?B?bEMwbmVoa1N6YXE1Yi9NNWxRK005Z3dIcjJKdy9lYW5Hc1pUenNCTFRFaDRW?=
 =?utf-8?B?dFZvTnVyblcraXdLcFB4Q2tZU0hQenVORk5HdWxCRERUV1RGSmlEU20rdVJU?=
 =?utf-8?B?VjhlQ01pZFd6U2M2MlhNUFc4UHAzWHFKUm1vMHNUSEc5c2hkdTREY0tWRXFN?=
 =?utf-8?B?V1dQM2Q2YThJS2JyS1d3UVJjU2Y3NlFsQU9Ra09Mb25Uc3k5cHg3bzBscG42?=
 =?utf-8?B?NmxzbVBPKzJidzF4TzVGZ0loRXZBY2twdFFQNmY1RktnT3A1VDk2R2owcXZl?=
 =?utf-8?B?aFNzUUxJaUZjZ3NhckJmcjEzZUM5aWVXMWhWMmxNSnpvWmVrT1NkQ3V2Z2N2?=
 =?utf-8?B?TnRFZ09UcHo4RzRFN3ZWTDJIUE5oWDJlKzZGQlhTS0s4R0ErQi9BV05PUXZY?=
 =?utf-8?B?ekNLOHFGUEFpK2tDd2VENzlmaStXRkFnNk1CUHdxRGp2a1BiZkIzUTljQkY0?=
 =?utf-8?B?N3kyM2o4aVVnVUVQWmIrczVxUCtDTG1XcU1HTzFvZ3lRSnNZbHBaTEhmcEpC?=
 =?utf-8?B?OFBuRkwwVDFTdGE4VWNVeFEyUVZIenhCR2l1MkQwanBJelREc25wQzFnVERi?=
 =?utf-8?B?cVloMXJqNFAyMVNnUUY4ZnV1Q2pXdlRUSVhGdUFGL3ovRlp4V2QrbmJZTXIy?=
 =?utf-8?B?YVVFRlJFZlQ4Yk8rcUk1clllMFE2S0tkZFM2U3Q2NTlMUm9lM0M2YXdTaUJk?=
 =?utf-8?B?Q0hzS3dzdGZRRmJwTHNCRFkrM1ZkVEU2WTU0YTdyNnBzZ0lJbHBMVkIxMkZ4?=
 =?utf-8?B?U3dWcFVYUGh1dW1jUEZ1RnhKc2o3SE5QZkxSckl4R3I4dmpqR1p6SEIzbFVn?=
 =?utf-8?Q?03qBYsnRAbdqJ0V8=3D?=
X-Exchange-RoutingPolicyChecked: SukZuwIUIKuM79zEpkFtsXNEGocRLLr95rw0ccCcsf6sFX0tM7tNySRmzFiEWTU4se+RQuOAcnPtPs7gpTuyRfj6n0NC+yRQOBMIfCq2Q+p13flF5Th8P3qVUAHCteSrfmcbxDKUFZzi2jXIF4GQVNu0oFKXAjyCr9GAH7ycvLvH1wVBEAHH3Iua3vmOU04MbCphcfoODg+AoKCSShFUxrhuGqDt3Fbh7HkjhiVHzkPIJrEyyzep+ityHnXmgQUBtZZenE7KGGEwIBldBfl+byJVoAH7H9Y5/4M3deZ3oHy7Ck4SSXKyg35Hwd0jFJsbTkL8KWn5xcoJuL5YHEGsGg==
X-MS-Exchange-CrossTenant-Network-Message-Id: e5c9ccf5-7f6c-43bc-e10c-08df2aa7aa25
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB6939.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2026 10:32:51.3738 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9ljD/vEpwBfnozt1CXGQ3Z/FV4moSMXNyfzJLekgw+NvIK+7zpjSjZ5Iigg/RPUyQ+MNJhmFf6faERFceZrNYL9S/hO3NyVDlsFnqgwkwVs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB9974
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

--------------svLNBKEB2V2FWOjgFeb9Lk0X
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit


On 14-Oct-26 3:39 PM, Piórkowski, Piotr wrote:
> From: Piotr Piórkowski<piotr.piorkowski@intel.com>
>
> Expand the GuC ID manager KUnit coverage to exercise the new
> usable/shareable pool model.
>
> v2: Use KUNIT_EXPECT instead of KUNIT_ASSERT inside the locked section
>      so the mutex is not leaked on failure (Sashiko).
> v3: Guard failed ID reservations before releasing test allocations.
> v4: Avoid releasing unreserved ID ranges after failed test reservations.
> v5: Fix check_used() cleanup and add missing reservation guards (Sashiko).
> v6: Use guard() for the ID manager lock, simplify the skip helper and
>      replace magic numbers with named constants (Satya).
>
> Assisted-by: Claude:claude-5-sonnet
> Signed-off-by: Piotr Piórkowski<piotr.piorkowski@intel.com>
> ---
>   drivers/gpu/drm/xe/tests/xe_guc_id_mgr_test.c | 632 +++++++++++++++++-
>   1 file changed, 609 insertions(+), 23 deletions(-)

LGTM.

Reviewed-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>

>   
--------------svLNBKEB2V2FWOjgFeb9Lk0X
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 14-Oct-26 3:39 PM, Piórkowski, Piotr
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20261014100907.77877-3-piotr.piorkowski@intel.com">
      <pre wrap="" class="moz-quote-pre">From: Piotr Piórkowski <a class="moz-txt-link-rfc2396E" href="mailto:piotr.piorkowski@intel.com">&lt;piotr.piorkowski@intel.com&gt;</a>

Expand the GuC ID manager KUnit coverage to exercise the new
usable/shareable pool model.

v2: Use KUNIT_EXPECT instead of KUNIT_ASSERT inside the locked section
    so the mutex is not leaked on failure (Sashiko).
v3: Guard failed ID reservations before releasing test allocations.
v4: Avoid releasing unreserved ID ranges after failed test reservations.
v5: Fix check_used() cleanup and add missing reservation guards (Sashiko).
v6: Use guard() for the ID manager lock, simplify the skip helper and
    replace magic numbers with named constants (Satya).

Assisted-by: Claude:claude-5-sonnet
Signed-off-by: Piotr Piórkowski <a class="moz-txt-link-rfc2396E" href="mailto:piotr.piorkowski@intel.com">&lt;piotr.piorkowski@intel.com&gt;</a>
---
 drivers/gpu/drm/xe/tests/xe_guc_id_mgr_test.c | 632 +++++++++++++++++-
 1 file changed, 609 insertions(+), 23 deletions(-)
</pre>
    </blockquote>
    <p>LGTM.</p>
    <p><span style="font-family:Menlo">Reviewed-by: </span><span style="font-family:Aptos">Satyanarayana
        K V P <a class="moz-txt-link-rfc2396E" href="mailto:satyanarayana.k.v.p@intel.com">&lt;satyanarayana.k.v.p@intel.com&gt;</a></span></p>
    <blockquote type="cite" cite="mid:20261014100907.77877-3-piotr.piorkowski@intel.com">
      <pre wrap="" class="moz-quote-pre"> 
</pre>
    </blockquote>
  </body>
</html>

--------------svLNBKEB2V2FWOjgFeb9Lk0X--
