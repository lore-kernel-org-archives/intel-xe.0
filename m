Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4865EC197A0
	for <intel-xe@archiver.kernel.org>; Thu, 16 Nov 2023 13:42:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1114410E02C;
	Thu, 16 Nov 2023 13:42:42 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D17E710E02C
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Nov 2023 13:42:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700142160; x=1731678160;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=kxYiiOA9HsjjBygBSk0mFWzbQnyN5RtTUe3fBIy6XmQ=;
 b=VZhRGDEVOzpxMkSfwTV4l8v0PoxwPdehwOlvdqoJkl/5RB9NX55z1HBO
 6XqzERDjXphAxv3NcZIJIbfHOnwtJyNLRe+dxFj+GZJpUmMGbi5jLqBnJ
 W9XO6AXBv4ht/t2Nnhx/YVHhGo8j6PgITsrHBh/5iFbq0wYGpeFE6UvA0
 20DLxHRkK3vPirjZhHyjk2a2Aku/UvJ5x9q+dEGXMdo9fUIQ99USid0kq
 iaYOR6Bk10qoAEICCso3NrBqBDVQayggoKndNz3stLfZoHlEyW1olhRdc
 JzlR+kzF4Z9Qyi7aNV5vVBy/+8EhDaSXOO10dPq9EkjL8+2TYpmjPAOQ6 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="477304150"
X-IronPort-AV: E=Sophos;i="6.04,308,1695711600"; d="scan'208";a="477304150"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2023 05:42:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="835750457"
X-IronPort-AV: E=Sophos;i="6.04,308,1695711600"; d="scan'208";a="835750457"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Nov 2023 05:42:40 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 16 Nov 2023 05:42:39 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 16 Nov 2023 05:42:39 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Thu, 16 Nov 2023 05:42:39 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Thu, 16 Nov 2023 05:42:39 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RjcPkhEvdUbrinI5E+SV66l9EIiycqCArjwabROIkE3XL9T42eaijGDBdweF8SheHrOyCi2Z+ziP2lrv25asIfl9jmMzcFAyPJ90sfh+lq92hd5YtLGp8BCqLMX066R6T4S6L4m03yUmDGACjAfZteXpLzvdnidPeD4X1s46/BHybQ37E9HolIz6dDmL+El55FEVb4BcETot/7VUURffxb+bFup2CdbH+KrqfEnkthPLd5TH65pt40l0LyUo1rW0mqit9Zx55VPzz1WbMY3e0CdwxK6/nQ/YbwbSgP1DxDdVRF0TGXkXPRzWM8JqMs0BFmtB/YzQDeSQmTHsg1AH/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X9f8gca205m3toLmI/PxnE2wnAmtgKmJiCa79DY5FM4=;
 b=bep8OWq4e9t/gZCW+yKmFTqM2B2m/LswdzUc6uKDcJm0s9urGCUel9TIXIXbs3nRZbIX133xzvFx/PsX3R1Xzb9yurm0BZp3Mu3CwMMPGGiLmf3lpj7Ifv5HpGn10u5g9jY3TWCLjEZ440aGaBS1ibvUq9uSUkFtodEkRQVPp8BcVkBc7kk5JQMOIH6pVzyDV1T0ipPxTbkr+pemAP7w3doPjwAISkVUdXtGIp0Xil5NsaY7C+lbuK0nvrs8PzdxtKgq/Qnn7dqfKhw50+PVNqNthZzoe+6193o8eOOIJdrZ/rwZkpztWcVU85pCbY239M6/ED+8dvNOqxZzUtyrcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN8PR11MB3556.namprd11.prod.outlook.com (2603:10b6:408:8d::31)
 by MN2PR11MB4679.namprd11.prod.outlook.com (2603:10b6:208:26b::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.21; Thu, 16 Nov
 2023 13:42:37 +0000
Received: from BN8PR11MB3556.namprd11.prod.outlook.com
 ([fe80::78eb:ce50:6f36:7b2c]) by BN8PR11MB3556.namprd11.prod.outlook.com
 ([fe80::78eb:ce50:6f36:7b2c%7]) with mapi id 15.20.7002.019; Thu, 16 Nov 2023
 13:42:37 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <us7s43n2woxnrfbuyo5x43nxflj3ajf7yamvznk4di3awh75zq@zyjf4wnucgrn>
References: <20231114220922.88268-1-gustavo.sousa@intel.com>
 <y2icpwmp4huod7wsfg3ln4e7bxm2ezgiutgqqcvwcfpqxzruvp@jzrwflkzsx2h>
 <170007111735.1634.7618023957528021915@gjsousa-mobl2>
 <us7s43n2woxnrfbuyo5x43nxflj3ajf7yamvznk4di3awh75zq@zyjf4wnucgrn>
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Date: Thu, 16 Nov 2023 10:42:32 -0300
Message-ID: <170014215216.3216.9843661827530194162@gjsousa-mobl2>
User-Agent: alot/0.10
X-ClientProxiedBy: BY5PR16CA0028.namprd16.prod.outlook.com
 (2603:10b6:a03:1a0::41) To BN8PR11MB3556.namprd11.prod.outlook.com
 (2603:10b6:408:8d::31)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR11MB3556:EE_|MN2PR11MB4679:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ed2c937-0595-4588-7c2e-08dbe6a9e528
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IRDv5p0S/l5oCWxKChkKsJfbHAOQnNqNm73VMkeibC+MfCzSMv0FJVtQfAZ2JkBX5thuKIRUin7tjUcoHKDS8VPgcz7aOTmhdTeGGLmjHkSsWEuBlK06UGF9LzlwJ1RCuiR2A0L8Y7vTc5u+2VUjlXEVuYBRFHebNIdPXBdhB7GOSdhiA4sIHEeoHJBa7BarAUJIF4D2tHWRiyJrhuvp1EQDGeGsa+4Q+q1VbfL/FuXHsF5l1lsID614mPRhJCCP7YL0msvdLN0LZCTwk2lNC39D7fkunOST3kBHOxarC+ZqFPJuin6j6SBY+SY7wSiHOvTpXzewxhPmTqJWEVfD3H36Tb0sBvMSIoXPz5eJxJQzEtLnXlgCNnz6td2JlOoP/Oj5uki0tUU+ClDBLvAsyqS5g3KJiuuIJXl1KhNDlTdUXqZ+QKeVMZjaIAJs+f5jG78yuP3gLBQZU3X1wssjHQlng1KGljGaIUkAuoMgZz549UOqJa+qAG00s/DBhu3rX9sxqnqa76KfBPHiqPtqVAsOKJsThlUxlF1V1eDuDs43r2jmjXI4qsq5EfrlifQ/g4Rmqb5OIOn5d75UHSjCGtVyOKsKhShnxLa/yjnt64N41AR2OsYjAb7VMixNUCrl
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR11MB3556.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(39860400002)(136003)(366004)(396003)(346002)(376002)(230173577357003)(230273577357003)(230922051799003)(451199024)(1800799009)(186009)(64100799003)(6666004)(83380400001)(107886003)(9686003)(6512007)(82960400001)(6506007)(26005)(38100700002)(6636002)(316002)(66946007)(66556008)(66476007)(33716001)(86362001)(5660300002)(41300700001)(2906002)(4001150100001)(8936002)(8676002)(6862004)(4326008)(44832011)(478600001)(6486002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dWJVSkY5SHk1U2N5UkU5ZHpDbEgzcTNDb3RYZ01BOFJXKy9xNTVPcGJJUUdN?=
 =?utf-8?B?WUVHeXBmQ1ZpUFc3RkJPVVFUQ0lEcS83Ylh3ajlaUEphOC83SVJtSUdTSVFS?=
 =?utf-8?B?WmtrUllwWVBhYUNvQjZ4Slg1TWIvOTc4QTdXczhsVWd6OUlDVDlmdFhVUlRH?=
 =?utf-8?B?YUYzcHd4SHhNZXQ3cUU0UEROWWVwdjhWYWg4NmcveUlRZUtabHRWVnVJaG5n?=
 =?utf-8?B?UFNjbkNSUzJDeUlWWTFvOGRabC9Ta3dBVXRiNndqdm02WWZkK1c0U25YNDVv?=
 =?utf-8?B?MFp6Q0VHYXhKSUNjUUNEOGFBNWljTmRXUllyNGxwM1pDZkIrN3ljNXN4VGtj?=
 =?utf-8?B?K1d1YmpSVnpPMkxVVkNDL21IQmh6MEx2bjNBdjFEd2xPVWxNNVRPM0daMjhn?=
 =?utf-8?B?V2RESk43NlpOSjhIeXdnK3NFYnA4QmZXTncvZU80SHVSTmxiNHlsTExzYisy?=
 =?utf-8?B?blZhUllIS3NUa1MxSWI2ZVczb0tWallHR2VoSnpwQml0bjRlSFZoYnZJWHU1?=
 =?utf-8?B?NzVkVWtnaHlWbkUxSHo2cXFxUW5zYllpVXQybGZhRFEwYm5YOHlLdDRFUXhL?=
 =?utf-8?B?V3hldUZ3RGovd3VLN2RSS1ZjK2pUaTRUUzJ4N3VmWUNNa0F3SnhLbEpkWE90?=
 =?utf-8?B?VEt1c2xtMVRRMlZRMlRFVnk1YnZLTUZFY21kdklvT2UwdFlCNXlkYTlzV0s5?=
 =?utf-8?B?YVdGYlY4SERMT05Ublk3Y0FadzNSZlRQVHEzNTJqNm8yZ0FmWHdSTDQyQStU?=
 =?utf-8?B?RDF5TzhxVHJGcTkwelFrQkRKS25xMzFPTm1YT2V0NU5Nd0RmZ01QQXlIYVVS?=
 =?utf-8?B?YlU1RnRyV29VZnROY3B5amZReXpkaERwS3prK21VZExOa2xwYnM3alJOQlJO?=
 =?utf-8?B?Vko4dGFXbStOSTZkSEFFQllvQXBka3pJZVB2aVBRQTZaY3YyZkNtZDBZTTE4?=
 =?utf-8?B?ZzZ2WVJRSGRCNU5vZG5odEJEQnFmZGl3d2x0UXdUU0R5c0M1Z0loYk1iamVR?=
 =?utf-8?B?eG82STkvdkdnWDBlYTRuYUxUUnN4MmZIbytlK1FhN3ZMbGZxZ2Fvc1hLV083?=
 =?utf-8?B?ZGQ0M0JUNW9MRFJVV0ppbVhlTnMwNXRVaXJXYmJMYjJxbFR6ZzZlWGVGQTRq?=
 =?utf-8?B?ZVFSQk5kQ0ZhSTdHZjFwTkQxMnJkSDBkdkFuZm5HRVFGRnZDTG9abkwrdUp1?=
 =?utf-8?B?WlBIUEJaTkl4ZTFDYk5PSFdwYmxvenB5U3dNWlgzN00wSGpKSHJ1OXhMRnVj?=
 =?utf-8?B?c3JiNmxreWZsTmVDWVdHejIrUDAwOCtCN0FTMzBadGJ5QVNZNUFScHJZeHJ0?=
 =?utf-8?B?MmQxZ0g0ZVR0MDQ5MTZHdnFOditZazFGVnhEZjVheFRXWktpUE45YXpmbEdN?=
 =?utf-8?B?VENpYS9yS0kvVXlqLzEzRjNZYkRVZUpWZ3pvd2lXTDhvS3RmNUFJamhTbzQx?=
 =?utf-8?B?SmNiOEpRY3BEZlk3N0JmOEpueTZqR0w3VVJXQnRWR2xjTkluanQ5a2E3bG0r?=
 =?utf-8?B?Z0hVeVIwUXprUS9iMWlSaXdtU0IreExORC8rN0VkazBDNUdrcUVKdWpJQjRo?=
 =?utf-8?B?K2NXYWV6QzdJSGVvejEwanRjb1owb2dPakp1amJFV1VuYnVtUXNDK00vU1pR?=
 =?utf-8?B?NmE5NXBKbEdIVXk2MXFmWG56TUlVUzJISGFsemlZY3ptV0V3SlpVa0dQRFdz?=
 =?utf-8?B?UlB2blhvWU1iZGY5Y0U3dDlhdFFxZFI4ekVFSzNqejhCOWk1RGY0L0lmOXdv?=
 =?utf-8?B?LytnV05sR1BDYVVaRHdCdHdnMHhXTnRjbGNDY1Q2YWhZbThvTTZGOHgwYUww?=
 =?utf-8?B?K1loRW9ZdjJRSG1HaHhtM05KVE4yUzZGSVdaZ2JEWCtiTjBPSzJBQmtNVDU4?=
 =?utf-8?B?bk53YSs5azJKcUJyY3pWbXFsM3hNWHNsdUxsQU1TZWg2elBzWG83RytlMUVO?=
 =?utf-8?B?ZVVaU3ZMT1FyM2h3Vy9nOENIZmNLOVFkSzFXajU5NGhKRHAwV2RLMjVSdjlE?=
 =?utf-8?B?OENNZEJYYk9hWFoyV0NLeDczZG1hdGRtWjc0TVZFTkJYcEordDg2ZThmRTBL?=
 =?utf-8?B?VXh0ZGVMazlYK0VlSEZCZUNNYjA0NXNRVVN2WVlNZ0NZSUZrZFZVNG5SOTRl?=
 =?utf-8?B?R0ZPQThaK2JTeHJBUkc2V2xRTHNCOGhxN1N2NnFWRm9xV0lPWVVWbUdXWFVW?=
 =?utf-8?B?RUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ed2c937-0595-4588-7c2e-08dbe6a9e528
X-MS-Exchange-CrossTenant-AuthSource: BN8PR11MB3556.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2023 13:42:37.5689 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zBqHd2l5X4zItsVRmxc6gVG0lDrs3vPEdyW/ETcftO4PID/2gRv1p9vRCdtghOTX0a8Rq8yrM+b30hFFUmxLCA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4679
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe/mmio: Make xe_mmio_wait32() aware of
 interrupts
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
Cc: intel-xe@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Quoting Lucas De Marchi (2023-11-15 17:04:37-03:00)
>On Wed, Nov 15, 2023 at 02:58:37PM -0300, Gustavo Sousa wrote:
>>Quoting Lucas De Marchi (2023-11-15 13:51:41-03:00)
>>>On Tue, Nov 14, 2023 at 07:09:22PM -0300, Gustavo Sousa wrote:
>>>>With the current implementation, a preemption or other kind of interrup=
t
>>>>might happen between xe_mmio_read32() and ktime_get_raw(). Such an
>>>>interruption (specially in the case of preemption) might be long enough
>>>>to cause a timeout without giving a chance of a new check on the
>>>>register value on a next iteration, which would have happened otherwise=
.
>>>>
>>>>This issue causes some sporadic timeouts in some code paths. As an
>>>>example, we were experiencing some rare timeouts when waiting for PLL
>>>>unlock for C10/C20 PHYs (see intel_cx0pll_disable()). After debugging,
>>>>we found out that the PLL unlock was happening within the expected time
>>>>period (20us), which suggested a bug in xe_mmio_wait32().
>>>>
>>>>To fix the issue, ensure that we call ktime_get_raw() to get the curren=
t
>>>>time before we check the register value. This allows for a last check
>>>>after a timeout and covers the case where the it is caused by some
>>>>preemption/interrupt.
>>>>
>>>>This change was tested with the aforementioned PLL unlocking code path.
>>>>Experiments showed that, before this change, we observed reported
>>>>timeouts in 54 of 5000 runs; and, after this change, no timeouts were
>>>>reported in 5000 runs.
>>>
>>>good find :)
>>>
>>>>
>>>>Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
>>>>---
>>>> drivers/gpu/drm/xe/xe_mmio.h | 11 ++++++++++-
>>>> 1 file changed, 10 insertions(+), 1 deletion(-)
>>>>
>>>>diff --git a/drivers/gpu/drm/xe/xe_mmio.h b/drivers/gpu/drm/xe/xe_mmio.=
h
>>>>index ae09f777d711..4d0e816a81ac 100644
>>>>--- a/drivers/gpu/drm/xe/xe_mmio.h
>>>>+++ b/drivers/gpu/drm/xe/xe_mmio.h
>>>>@@ -98,13 +98,22 @@ static inline int xe_mmio_wait32(struct xe_gt *gt, =
struct xe_reg reg, u32 mask,
>>>>         u32 read;
>>>>
>>>>         for (;;) {
>>>>+                cur =3D ktime_get_raw();
>>>>+
>>>>+                /*
>>>>+                 * Keep the compiler from re-ordering calls to ktime_g=
et_raw()
>>>>+                 * and xe_mmio_read32(): reading the current time afte=
r reading
>>>>+                 * register has the potential for "fake timeouts" due =
to
>>>>+                 * preemption/interrupts in between the two.
>>>>+                 */
>>>>+                barrier();
>>>
>>>we are only protecting here against the compiler reordering this. I
>>>don't think it will due to the external call to ktime_get_raw(). Do you
>>>get any failures if you remove the barrier?
>>
>>Makes sense.
>>
>>I put the barrier here to be sure that the compiler doesn't surprise us, =
but I
>>haven't tested without it. Maybe it is not really necessary indeed...
>>
>>>
>>>Anyway, we probably don't need a full barrier and just using
>>>WRITE_ONCE() for both would be more appropriate.
>>>
>>>I wonder if we could do this logic better and have a header / wait /
>>>tail approach. In both header and tail we read the mmio and don't
>>>care if timeout occurred.
>>
>>Yeah. I was thinking about a something similar, but ended up sending this=
 way to
>>have a single place doing the register read.
>>
>>The difference from your suggestion is that is that I was thinking about
>>adding an extra read once out of the loop in case ret is still non-zero.
>>Basically something like below (the patch below would be a substitute for=
 this
>>one):
>>
>>diff --git a/drivers/gpu/drm/xe/xe_mmio.h b/drivers/gpu/drm/xe/xe_mmio.h
>>index ae09f777d711..2b65d8387cd1 100644
>>--- a/drivers/gpu/drm/xe/xe_mmio.h
>>+++ b/drivers/gpu/drm/xe/xe_mmio.h
>>@@ -118,6 +118,12 @@ static inline int xe_mmio_wait32(struct xe_gt *gt, s=
truct xe_reg reg, u32 mask,
>>                 wait <<=3D 1;
>>         }
>>
>>+        if (ret !=3D 0) {
>>+                read =3D xe_mmio_read32(gt, reg);
>>+                if ((read & mask) =3D=3D val)
>>+                        ret =3D 0;
>>+        }
>
>
>yeah, I prefer this no barrier version. Small tweak on that maybe
>
>diff --git a/drivers/gpu/drm/xe/xe_mmio.h b/drivers/gpu/drm/xe/xe_mmio.h
>index ae09f777d711..bb8f079e3cb6 100644
>--- a/drivers/gpu/drm/xe/xe_mmio.h
>+++ b/drivers/gpu/drm/xe/xe_mmio.h
>@@ -93,16 +93,13 @@ static inline int xe_mmio_wait32(struct xe_gt *gt, str=
uct xe_reg reg, u32 mask,
>  {
>          ktime_t cur =3D ktime_get_raw();
>          const ktime_t end =3D ktime_add_us(cur, timeout_us);
>-        int ret =3D -ETIMEDOUT;
>          s64 wait =3D 10;
>          u32 read;
> =20
>          for (;;) {
>                  read =3D xe_mmio_read32(gt, reg);
>-                if ((read & mask) =3D=3D val) {
>-                        ret =3D 0;
>-                        break;
>-                }
>+                if ((read & mask) =3D=3D val)
>+                        goto done;
> =20
>                  cur =3D ktime_get_raw();
>                  if (!ktime_before(cur, end))
>@@ -118,10 +115,17 @@ static inline int xe_mmio_wait32(struct xe_gt *gt, s=
truct xe_reg reg, u32 mask,
>                  wait <<=3D 1;
>          }
> =20
>+        read =3D xe_mmio_read32(gt, reg);
>+        if ((read & mask) =3D=3D val)
>+                goto done;
>+
>+        return -ETIMEDOUT;

I believe we still want *out_val to be filled even when timing out.

--
Gustavo Sousa

>+
>+done:
>          if (out_val)
>                  *out_val =3D read;
> =20
>-        return ret;
>+        return 0;
>  }
> =20
>  int xe_mmio_ioctl(struct drm_device *dev, void *data,
>  int xe_mmio_ioctl(struct drm_device *dev, void *data,
>
>
>.... it doesn't remove the double call to ktime_get_raw() at the
>beginning on the fast path, but makes this shorter.
>
>Lucas De Marchi
