Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5238AC54E5D
	for <intel-xe@archiver.kernel.org>; Tue, 12 Mar 2024 20:14:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC46A10E92E;
	Tue, 12 Mar 2024 20:14:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="i+nD4D6w";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82C1710E92E
 for <intel-xe@lists.freedesktop.org>; Tue, 12 Mar 2024 20:14:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710274467; x=1741810467;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=7ZWTtemNkNsnX0Tex3p5bgIaRsWl+74xLpbMJSVA+8A=;
 b=i+nD4D6wbZF9ybCT7ukL1jb261nXw7KOujC1XkC8hEHN5jiEx4kSX6GL
 6RINfTcljy8a51Zqv4+H/ObsvMOX3mW7whwldXY7k/JErwd0wtc0Fechg
 /YoE2F0iem+wBpjFYA0SXYKmQpodkqaKjvHB++5znpW5c8qi2F+2JpOHK
 Ge6hVhLjweF4bS4cK3B+4/ZLlDmSl+HlpxV2Qx6/09H28S9R9bfAUmORa
 oRR+MlrMLVgIC/zZ9G7cQPBEqWt9Vu1tkAhGbbsZYMl3d90gZ/zx1FGQO
 KVGr19W1si3YEwgOhlRj36u4YrwZae1xd9ZwXq77Ibg7rDx72EsWhLhha g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11011"; a="16409520"
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; d="scan'208";a="16409520"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2024 13:14:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; d="scan'208";a="16226367"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Mar 2024 13:14:26 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 12 Mar 2024 13:14:26 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 12 Mar 2024 13:14:25 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 12 Mar 2024 13:14:25 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 12 Mar 2024 13:14:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fbCFXBMpMYmaq8cuA4X6MKrEipOGz8cRIadkdq9gwjDht0kb4TYg9Nj53wdCVKomxx2A6l3ue8kSJbroPlRPL4IvTYncsYq8dSuGErdGAEnrhi67BRs/bBuGN1nsE5ye+7AGzGuShYzzbRUWC/NJF/W70fgf7ICm4XIZf/lt+HR5QMXmdNbsEozd6tpKz+AFrXKCy8IH7v+755H9/YAzM14naSPOcjwPrlF4S3sKv+KmhJ6sHAn2BESt37KToqbd+IHRsKvArBw6Lqa4DdsA7htlYhKbVKWP8Bwzat1AeMZr07WLxQPugpIjkxnjvtonq68aHKK3HTehV+FHQhzCsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=byDBIyiV923LgTF3T+T259zLo6qZ9WnO50Vh8I+EJbk=;
 b=f1HbzqWV0zOc8swxyMhGHH+t3/V0yiHDWvcfw09UPM6Nrz+/BXKI8WGcL0d4ye3rv1ae32erUkmV7WmYvbeoxSDqKw22v35QAW6dmhDIerWGaOijJzy/PGLWPe3JnXABJyLF6CeV/N8Qzfg7OxMxOdszKSitWnuFDRtxNEo4p966bdudnZwuv9vmm9Nr7rrNftnHH0Y2ku1lDX/2Xm8KokwUpICv5K5ydNdJi715vauECVboX0I6YAuQ9mRRvrgz3sYHpkMBizjgbCeXPrwSHnt5Ldsq5josn6C/VofDNZ/2SL75t0wwJWdynJIXMD8r0dxqI7/mgw5pmeAIpPpCWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by PH7PR11MB6379.namprd11.prod.outlook.com (2603:10b6:510:1f9::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.17; Tue, 12 Mar
 2024 20:14:21 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::cc14:a507:b02c:b551]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::cc14:a507:b02c:b551%7]) with mapi id 15.20.7386.016; Tue, 12 Mar 2024
 20:14:21 +0000
Date: Tue, 12 Mar 2024 13:14:14 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 17/17] drm/xe/oa: Enable Xe2+ overrun mode
Message-ID: <ZfC3lpWKNqlEGajV@unerlige-ril>
References: <20240312034003.2747815-1-ashutosh.dixit@intel.com>
 <20240312034003.2747815-2-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240312034003.2747815-2-ashutosh.dixit@intel.com>
X-ClientProxiedBy: BY3PR05CA0022.namprd05.prod.outlook.com
 (2603:10b6:a03:254::27) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|PH7PR11MB6379:EE_
X-MS-Office365-Filtering-Correlation-Id: a96c7191-9af6-40d0-e8f5-08dc42d10107
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: c1uZ7Jf+DU4T89873ztXSr7sipasWTEzvrMNASr/4kj0zvjLW8y8AuMFAibLsglRGMjLteYGHXWjiZbq3oZVjMLX6CM39TYzkyx9AZxw4qBSpM95FtXZzdhqjMxacSTXBrl2R7qeqdHLO2ViFHPjb0i4iK7oQyI7dLx0/PVmikL+ci9vioCbnWT695HBKhS18LZ+VAtpDO6Hr9EyJI8XhLw/Z0Eq3i3rdKMyjibwUEL8FoyaCBrBrA/y6G23BpDXmufrbaXBNrfEZQffIrmEAXpgtMX9opZrJrVZnoX5k+3r4aBmuqQcKrvqtweZHcHerKQ7gmrJpzFIje7DH+RCtQ3X76+Kl8N5wHDjp6oLR9HOX7N8hwEWvAqmig6bZxGfJoz9ZW73usPS7wUzyNz+ORwo/Mv2TpB3Ni00Qp8Bt2MQZB8793kao3yxBYMy9RhNOyRoPfML4FaZqb7RPgeG8m1bmbRV4s5WZVfapqv3wQNlzQ1I8O0FSxHPRFwmVVSCw2kcjg3TQZ+EQ1kbSjDdZgqQWxhuPyRHUfcqxklSLlYIQ6ZKvHk/9op1CcqSmm77bfeLZ6kwF+hnJ7BqIYuRH9qBhrcg7rBM26S8QHhuBY95Z5V3CraOY+8BKQ4UVCrv2PluMu26+bULaOZlxhuvFwM2n5yM13pR/OiSQBE3H6M=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NUVxL3g4ZU84ajhRejJlWTl0dnU2TE1FYUZ5WFljWGJyWWhMUHlDT2pxYTNh?=
 =?utf-8?B?WEtpOE0zbkhHNzhyWm1MSUtFc1FuOTNOYzU0R2dtdFpzUjQ2YndWWkFRTjVL?=
 =?utf-8?B?eGN0dmRFclovUkVGcTBOOEpRTXhpQlRiQndqVHlDYlRTTHl5QU9sQi9rNnZs?=
 =?utf-8?B?NUJoSWFweDYyVEluWDJhc2lDUEpVK2Ird0ZEZDNvQXpERHRXVzZ4L0laa0Vr?=
 =?utf-8?B?MjI0NlNRUG5oekZyb0VteHBGM0x1YmNqSGdkbTZWNWZoa1l4ZTEwVVFpWnpI?=
 =?utf-8?B?OFB1TDFUK0J3aUJVbWNlOVZDVExGOGE2YXlPNzhFcHJIeHdQd3hWYXZJaVFM?=
 =?utf-8?B?dVp5NUkxQ0hYVWF3K2FSNm94dHBvRThXd1ptN2lDUkNiaHFMMmU1c0h2QmJk?=
 =?utf-8?B?OEw2akJBZGhpdi92cFU5aHZTSVVyeW5hemhRS1F0bDFsSGQxU0VSNjNjN3pX?=
 =?utf-8?B?eVh5VDhFQXhvWk5Ba1RHZy9mckJCdUdVckpsR0RvM1BkT25hSnVERTYzTmFm?=
 =?utf-8?B?T2hQYTVyN2thVVJ6c1hTbUdsempaL1ZzUy9rcXJVUlVoT0czclEyZWNCaUJR?=
 =?utf-8?B?WGRQMzRxNzF5SFFUVlQ5ZS9xT2F6eWp2UjdtZHdXMGgxS0VDZWx2dmppMjds?=
 =?utf-8?B?ZXRid0VJUm1FbTc2YXcvOG9vY041dGJkRmViUlBBTExjVWdPWEk5Ry9OTlJn?=
 =?utf-8?B?ZWJUdGltMUdBNHZVcm5NOGcwYVBCT040WnNYN2xkV3VLb0d6S3cwT1c2eFV2?=
 =?utf-8?B?cTdPd3o3blRaY0FMclhmQUZocjRHMFdVakZrZXdqaENqYnVBOWZld3FoQWND?=
 =?utf-8?B?SjNCS0tLb2pSR25zVk1Ga2VSOE5DWUxXOXY4bU1sRy9pV2h5bkJ3R1BTTHEr?=
 =?utf-8?B?RXMyZWs3Z0h6Zm5CM21CUHRPOTNjZzExOE9IVTdZWVJhbUlTTXdKRmJpbkVF?=
 =?utf-8?B?cEdIcFBUc2RKWks1Y1orZWttQk5JTGpTelhJZEM3ZHRjVGxQKzNuRjFFS1ZX?=
 =?utf-8?B?VHM3bGI5UVJWWjhjY3J2L0dWTk4xSktqTUwvTWVvSzVvVmMwZHJXNnZzaXZu?=
 =?utf-8?B?dGNOU2daWmZVblNDaGRJNzkyZXJLYnpqeHd4WHhjY3dEUDZTZ3FYVDViRzJW?=
 =?utf-8?B?eGM5cXppMEcrMlpoM2gyZklRZFA3REx6UkRla2xFd0NVbE0rdjdvMGJ6QWJS?=
 =?utf-8?B?anZYMFcyeGR3WUFpMWhtNmFDZWNuM2wycGJVeStWcTF3TFJFaC9paEh6UCtM?=
 =?utf-8?B?TXhaM3JsaHdXYnZNdytOM0NaOXB1S1hQam42aUxTeXNaUDh1bDVSdmVHQ25S?=
 =?utf-8?B?MHNOYUp6MkUycGVuVnNZUFVRVGc5QnBhQlZ4UTJHd2hIVHM4STJWOWp2cVJI?=
 =?utf-8?B?MXdZcUxVejA3Q1ExM2xUZlA2cHkySDY1WlN3RlFyQ2wrbVoxc2RuVTZaOFBB?=
 =?utf-8?B?S2Voc1dpd2ZpU2tCOTV2ZGEyckJ5aTNValdUZ2dEazd2RHRGMkduRGY5Y0wy?=
 =?utf-8?B?MnlPRERYNWVZUEI4WmV6Y1Ryd0VRRjFaRklIV2ZnR3ZsOWtYYmhlRGZ1ZEhY?=
 =?utf-8?B?ZWRBZkUvNm4xODhndmkrdlBTaHBHVlBld3lZakM3NTNXaXBIQ1NieUdNZlpJ?=
 =?utf-8?B?S084UXN6OXUyOUJucTFvU3pSbCtOL0UzbjYzczAwWFhYbzI4b0VxNjRCV0dT?=
 =?utf-8?B?OXllZndQMDhoYXdvV1VMcEZqQkloUy92NzRHTEpzS1JRN2MrdFhtNXQzZDly?=
 =?utf-8?B?MS9lM29FN0pUU1lkdlh6aFd6VS9zaWhuZW5rTTlZUDRjT2VNNTJwOHNQMytx?=
 =?utf-8?B?L1NUR3JydjdzNmRMdFBOcDd0V1ZBSGFHdWhQL043WmVtQzhOQUNiK09NT0pD?=
 =?utf-8?B?Z1U4WFRuY2YwWUNhcmk5WTV2NHI5SmhsRFR0a2pmaVkvdFdzdTJjUHpBZmFn?=
 =?utf-8?B?QUJDRWpJWmc1eHNnbmVBK2lRV3Bta3RRY1Fqa2VRWmtlQU1Ic2JhQWptV2pz?=
 =?utf-8?B?SFZEbkRyellYVUtmcUwrTlRwTlIvdVI4WURwRzF1MTk2c3cxdjB0ZEl4dldD?=
 =?utf-8?B?bW1QVDFnTlBacGZUOWhOc1ZlQzMxZnJIc3hxQmxnbVErNGZCbnI0bXYzZERN?=
 =?utf-8?B?WkpVY3prYXB0eFJJTHRJdXZ5NzJ5THEyT0VuTm4yekk4bXdIWWVyUHRaNmtK?=
 =?utf-8?Q?DixrWxZnTu4dyd7BOWu7N9A=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a96c7191-9af6-40d0-e8f5-08dc42d10107
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2024 20:14:21.4995 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e0XZAyjxvgU3NOxYurEZdw5gaaf82aHhyF0BX6hTr7PpQbsWyEe9Ci5M3+PCfBxKrd5bj/bJgmIKpQSNFsGuYYtcgLLDSX9zwZIkDXKChkE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6379
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

On Mon, Mar 11, 2024 at 08:40:03PM -0700, Ashutosh Dixit wrote:
>Enable Xe2+ overrun mode. For Xe2+, when overrun mode is enabled, there are
>no partial reports at the end of buffer, making the OA buffer effectively a
>non-power-of-2 size circular buffer whose size, circ_size, is a multiple of
>the report size.
>
>Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
>---
> drivers/gpu/drm/xe/xe_oa.c       | 36 +++++++++++++++++++++++++-------
> drivers/gpu/drm/xe/xe_oa_types.h |  3 +++
> 2 files changed, 31 insertions(+), 8 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
>index 6f5bbb0787d9..6a0d2e229254 100644
>--- a/drivers/gpu/drm/xe/xe_oa.c
>+++ b/drivers/gpu/drm/xe/xe_oa.c
>@@ -106,7 +106,15 @@ static const struct xe_oa_format oa_formats[] = {
>
> static u32 xe_oa_circ_diff(struct xe_oa_stream *stream, u32 tail, u32 head)
> {
>-	return (tail - head) & (XE_OA_BUFFER_SIZE - 1);
>+	if (stream->oa_buffer.circ_size == XE_OA_BUFFER_SIZE)
>+		return (tail - head) & (XE_OA_BUFFER_SIZE - 1);
>+	else
>+		return (tail - head) % stream->oa_buffer.circ_size;
>+}

For ex: consider a 16 MB buffer with a report size of 384 bytes. At the 
end of the buffer, you would have an empty space of 256 bytes (16 MB % 
384)

(For ref: 16 MB = 0x1000000, 384 = 0x180)
In this case circ_size = 0xFFFF00

Let's say your head is pointing to 0xFFFD80 and tail is pointing to 
0x180 (essentially there is one unread report at the end of the buffer 
and one unread report at the beginning of the buffer).

In this case, (tail - head) % stream->oa_buffer.circ_size, is not 
calculating the correct size. Should be 0x300, but I am not getting 
that. Can you please check/verify?

I am thinking we need something like this (roughly). We don't need the 
mod operation.

static u32 xe_oa_circ_diff(struct xe_oa_stream *stream, u32 tail, u32 > head)
{
	u32 available = (tail - head) & (XE_OA_BUFFER_SIZE - 1);

	/* head is always aligned to report size, but tail may not be */
	available = available % format_size;

	return tail >= head ? available : available - empty_space;
}

>+
>+static u32 xe_oa_circ_incr(struct xe_oa_stream *stream, u32 ptr, u32 n)
>+{
>+	return xe_oa_circ_diff(stream, ptr, -n);
> }
>
> static void xe_oa_config_release(struct kref *ref)
>@@ -280,7 +288,7 @@ static int xe_oa_append_report(struct xe_oa_stream *stream, char __user *buf,
>
> 	buf += *offset;
>
>-	oa_buf_end = stream->oa_buffer.vaddr + XE_OA_BUFFER_SIZE;
>+	oa_buf_end = stream->oa_buffer.vaddr + stream->oa_buffer.circ_size;
> 	report_size_partial = oa_buf_end - report;
>
> 	if (report_size_partial < report_size) {
>@@ -306,7 +314,6 @@ static int xe_oa_append_reports(struct xe_oa_stream *stream, char __user *buf,
> 	int report_size = stream->oa_buffer.format->size;
> 	u8 *oa_buf_base = stream->oa_buffer.vaddr;
> 	u32 gtt_offset = xe_bo_ggtt_addr(stream->oa_buffer.bo);
>-	u32 mask = (XE_OA_BUFFER_SIZE - 1);
> 	size_t start_offset = *offset;
> 	unsigned long flags;
> 	u32 head, tail;
>@@ -317,21 +324,23 @@ static int xe_oa_append_reports(struct xe_oa_stream *stream, char __user *buf,
> 	tail = stream->oa_buffer.tail;
> 	spin_unlock_irqrestore(&stream->oa_buffer.ptr_lock, flags);
>
>-	xe_assert(stream->oa->xe, head < XE_OA_BUFFER_SIZE && tail < XE_OA_BUFFER_SIZE);
>+	xe_assert(stream->oa->xe,
>+		  head < stream->oa_buffer.circ_size && tail < stream->oa_buffer.circ_size);
>
>-	for (; xe_oa_circ_diff(stream, tail, head); head = (head + report_size) & mask) {
>+	for (; xe_oa_circ_diff(stream, tail, head);
>+	     head = xe_oa_circ_incr(stream, head, report_size)) {
> 		u8 *report = oa_buf_base + head;
>
> 		ret = xe_oa_append_report(stream, buf, count, offset, report);
> 		if (ret)
> 			break;
>
>-		if (is_power_of_2(report_size)) {
>+		if (!(stream->oa_buffer.circ_size % report_size)) {
> 			/* Clear out report id and timestamp to detect unlanded reports */
> 			oa_report_id_clear(stream, (void *)report);
> 			oa_timestamp_clear(stream, (void *)report);
> 		} else {
>-			u8 *oa_buf_end = stream->oa_buffer.vaddr + XE_OA_BUFFER_SIZE;
>+			u8 *oa_buf_end = stream->oa_buffer.vaddr + stream->oa_buffer.circ_size;
> 			u32 part = oa_buf_end - report;
>
> 			/* Zero out the entire report */
>@@ -369,7 +378,6 @@ static void xe_oa_init_oa_buffer(struct xe_oa_stream *stream)
> 	xe_mmio_write32(stream->gt, __oa_regs(stream)->oa_head_ptr,
> 			gtt_offset & OAG_OAHEADPTR_MASK);
> 	stream->oa_buffer.head = 0;
>-
> 	/*
> 	 * PRM says: "This MMIO must be set before the OATAILPTR register and after the
> 	 * OAHEADPTR register. This is to enable proper functionality of the overflow bit".
>@@ -1256,6 +1264,18 @@ static int xe_oa_stream_init(struct xe_oa_stream *stream,
> 	stream->periodic = param->period_exponent > 0;
> 	stream->period_exponent = param->period_exponent;
>
>+	/*
>+	 * For Xe2+, when overrun mode is enabled, there are no partial reports at the end
>+	 * of buffer, making the OA buffer effectively a non-power-of-2 size circular
>+	 * buffer whose size, circ_size, is a multiple of the report size
>+	 */
>+	if (GRAPHICS_VER(stream->oa->xe) >= 20 &&
>+	    stream->hwe->oa_unit->type == DRM_XE_OA_UNIT_TYPE_OAG && stream->sample)
>+		stream->oa_buffer.circ_size =
>+			XE_OA_BUFFER_SIZE - XE_OA_BUFFER_SIZE % stream->oa_buffer.format->size;
>+	else
>+		stream->oa_buffer.circ_size = XE_OA_BUFFER_SIZE;
>+
> 	if (stream->exec_q && engine_supports_mi_query(stream->hwe)) {
> 		/* If we don't find the context offset, just return error */
> 		ret = xe_oa_set_ctx_ctrl_offset(stream);
>diff --git a/drivers/gpu/drm/xe/xe_oa_types.h b/drivers/gpu/drm/xe/xe_oa_types.h
>index 6984e7d04be5..d8d5c9d8c22e 100644
>--- a/drivers/gpu/drm/xe/xe_oa_types.h
>+++ b/drivers/gpu/drm/xe/xe_oa_types.h
>@@ -163,6 +163,9 @@ struct xe_oa_buffer {
>
> 	/** @tail: The last verified cached tail where HW has completed writing */
> 	u32 tail;
>+
>+	/** @circ_size: The effective circular buffer size, for Xe2+ */
>+	u32 circ_size;

You could store the difference here instead.

	/** @empty_space: empty space at tend of buffer */
	u32 empty_space;

Regards,
Umesh

> };
>
> /**
>-- 
>2.41.0
>
