Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBBDAC71130
	for <intel-xe@archiver.kernel.org>; Mon,  7 Jul 2025 23:10:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB62010E033;
	Mon,  7 Jul 2025 23:10:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HSAhE2BN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A1D610E033
 for <intel-xe@lists.freedesktop.org>; Mon,  7 Jul 2025 23:10:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751929830; x=1783465830;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=6FMOQ/8awlTMdlURHCKeD2sG/+dd9upGDKRaCAS83Kc=;
 b=HSAhE2BNqL4udrs2LZRzbaVHmuKgy4/cM7pQm2b9tGs+X+B5GlQ6YdiD
 422wB42uuQ9mkDbx/3xGrHkPkEUWZ9rS6CytApTymND0Wc7Ud6df/nMao
 Kid0kwJRRUJSNwty16l3J4gGtmtDrJkKGcWnrcmAGRYwlgXonJCJZGckc
 u86zOatPQEKLiBveOGfRDLwYJiuAIrcyzE3wChiLp+02lWCD9tZyxyKxv
 fs0FX3k0QiGWRKRb+q0Wu2ci442q6SzA9H+C3fkbugLsSlhqXQBZcz+9y
 NG75C+DYXIOlS+bO/nN6kTjZoX+ZQ4/rbXW8E1BqG+X9DeXJJoB80ZtAn w==;
X-CSE-ConnectionGUID: FulIhTt7TUyLyqYWeAuuUw==
X-CSE-MsgGUID: c55vtFMmSMmSmenzFty0jA==
X-IronPort-AV: E=McAfee;i="6800,10657,11487"; a="54044868"
X-IronPort-AV: E=Sophos;i="6.16,295,1744095600"; d="scan'208";a="54044868"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2025 16:10:30 -0700
X-CSE-ConnectionGUID: lok4lQ88QcyMdmcIO9G55g==
X-CSE-MsgGUID: +/clfthdRM2b9yiM/b0yiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,295,1744095600"; d="scan'208";a="155079314"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2025 16:10:30 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 7 Jul 2025 16:10:29 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 7 Jul 2025 16:10:29 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (40.107.237.75)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 7 Jul 2025 16:10:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mynCOIanA9BoZLt0yjomIvdA4WcKZCNF2UqhGYMg8vNTTQfeuWjC2gPyusUlNIII4jyVJZ4Cb1yek+pccr0NMV3qdv2qw2jiKIBo1BeJTmGlU/XPTq0gst5+9j9GB/APxTOC6AMoqKyWFI36ar8qymc8JWjCx/AHb0BJYpYJ6JNa02W59Vik7LWW+VI1MjS7WLMNSAVgKLUXvBQaugsMETo93ONCMgdCivDgcj5MmVROeFwrQiCt2qQTmO1bO0MkuaHbDn7ub/V1WkU63llAqC/Dnn67NCrBhNtn9CL96JtODpFJrEnxdsHtR1vy66xBTgSD1TdszgIPx02jI4t5HQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UWQwGjg5E+5FcpHNPx3VsxBYD6crcR6ExrcpZI2y1OE=;
 b=g60mz1tMEws5WLFv7P2NVjPMu5NZn122p+NHX9eMIpjIQvyBwuWBt392QQuapmAVZMqPAifb7jhRJ015zk7XocrXDYhR2/QsnRIwtI/6MCfijQrMH64BaLbvjJyUo3iWpV5dsa0R+cQs3a5uyQk2hNMN7XBzNTAa7UGc62KBJZ4LVypo8SkLxHkaWHvKLKThXyozh9EDfTj8U1A/NSfwHKRtG4JuOewIG+qOKsweCT8+oH0ehkfGSwYr3oew/+4gmfNqWC250bdln+moYrAQ74K1ugmZ3xDnYQV5/irEm4FliCNA5qbcNgsaWXZJoH6MOza6ptCnb2VNZ9XorZ7aDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by MW4PR11MB6888.namprd11.prod.outlook.com (2603:10b6:303:22d::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.34; Mon, 7 Jul
 2025 23:09:58 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%5]) with mapi id 15.20.8857.022; Mon, 7 Jul 2025
 23:09:58 +0000
Date: Mon, 7 Jul 2025 18:09:56 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
CC: <intel-xe@lists.freedesktop.org>, Matthew Brost <matthew.brost@intel.com>, 
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: Re: [PATCH 2/7] drm/xe: Count dwords before allocating
Message-ID: <vfz6lr2q65ty6piwvpin5advomiu6lhxiopv26nndskdqlqjad@45tbr2qisa33>
References: <20250703-lrc-refactors-v1-0-6aa22f174041@intel.com>
 <20250703-lrc-refactors-v1-2-6aa22f174041@intel.com>
 <b3bc6a5b-c0c0-4fea-9e43-4fec14eeb317@igalia.com>
 <kt6owi62zxtgertnfrrrlb5tc7wdcxw7rj6y6jjdifvzeyraov@zvywv2qd4q3p>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <kt6owi62zxtgertnfrrrlb5tc7wdcxw7rj6y6jjdifvzeyraov@zvywv2qd4q3p>
X-ClientProxiedBy: BYAPR06CA0020.namprd06.prod.outlook.com
 (2603:10b6:a03:d4::33) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|MW4PR11MB6888:EE_
X-MS-Office365-Filtering-Correlation-Id: c1201c1a-952e-47e6-4811-08ddbdab64bf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?4/G90HkQjPZZoguhm8BTav3AqCxeTBC29Q/KbtVKdVLErISGPj+XJhq84/2q?=
 =?us-ascii?Q?OeALwe68QIhTN8hazbsHGyDQi9rNaQ3kZSxqLVF4jDLw4enYTOP6dvNHN+e7?=
 =?us-ascii?Q?mpkuyh3oskfvHJ4k2+k9RAicwoe31L5nXGB4AggUnEgZjgnJaDnu603L+/bm?=
 =?us-ascii?Q?txbJZZCFadYuRr0xd+u4IZtqyCreb7mEkAoLN3NwLLj0xlb3zjr3ouBoRSSy?=
 =?us-ascii?Q?A9GA7RxTWul3Q6zXQ2BVjZUAwlDg5/uAKH1UfMnFSNHOy6kPylXsb1jTbrZb?=
 =?us-ascii?Q?Kp6hf3ilNd/cwiCX45WzpapOgycj1upnrepArtjT9DmXwcm1OqqY7kYzUh3G?=
 =?us-ascii?Q?g32/a0kIxUELp0IlLOjezLnNPWHnnUcbsdfrHj/0d/X1rrqSJmnxQ2a3i5qR?=
 =?us-ascii?Q?IzbBlZcmlFD2s+op3oMODGpkGxC6ikea0mZvICK64VclSHlYEPU9fcAExqhe?=
 =?us-ascii?Q?KI3fc5M/8ltsTVVmR709Jl5ewCeYWpGUV+A9EwNtYD9LDM4AWmcLqyd9ADY5?=
 =?us-ascii?Q?ZcOm0H2K7s820HmRqS3pLKr9YqHk/+qKJXT5AiOO96fREv1GMeFhySazWlyX?=
 =?us-ascii?Q?cTEYrPMFmv6J4Wu3uQEabqIMz5CiTEa9/gtM/qZk/BSdK6/hI5rFtAy8MkV4?=
 =?us-ascii?Q?UHGk99Xz6ComtxYx9zHmnAvOHDiRNT8jQz8/Vgqw8tXkgK98LGcsDzmlGhXB?=
 =?us-ascii?Q?ktB5xZrr32lnr6Xjm/M5LGdgixM03anpz376koO1Ntk99r5P97aLlBFWVUmw?=
 =?us-ascii?Q?C9b+nXxWX+rditSBcedJrHG6BKqYnp1rGSBzUgVXeAbg9ryQ1d3q9WNBL95k?=
 =?us-ascii?Q?UkArgtEKEOUZBFa+7a3bOnwkYyF8w+TM7Arx0OtEDFvwzOpEK7FnSrZJDZSx?=
 =?us-ascii?Q?i+atWSkhEbG+MxRaQLhVuuFvk5bF+pLYnEUNSMk4Y5an8Hig0Ydo0f+eEBPM?=
 =?us-ascii?Q?YtxJI3xGJAVlvKKHfEqPeigPoSoaU5l8cE+S7SDt9YfKkj/e5ipXbk+dZc7O?=
 =?us-ascii?Q?QblUQlOfoFb4uvVG7z1hXZWywWN0eEAJ3VLNi1icBmYrQGmU2cpNGmNgQBKi?=
 =?us-ascii?Q?np3VIzpTELQLKHmrRSLV3cutGBf1qkfnaBEFH1bsGSsZwEJc9UtuDbPhcJtJ?=
 =?us-ascii?Q?FxKVZd8HV14c/SCAEvzgtQPLrwPpmO+LXPQRryZdqS5mNdO4TzhGRHRMph0U?=
 =?us-ascii?Q?/XZw/w6lJz/hd69qZQ0wAQisoikUTAXLlUNRHPoZ1v1nH5YmGb4em2CpKi2o?=
 =?us-ascii?Q?ld2dbYjZyINtv+B60rMx5y7Xa141EZZI8lioapT4e6MGzaKCwhvCZ2p7WaCY?=
 =?us-ascii?Q?3LYw6Rpb8jozOriTlPuSLia6ogmnAHDItEPb6I3zZvfuqYcIpiJK0Z/mYl+Q?=
 =?us-ascii?Q?bo+wT0JDND4jF8EEIpJnh3d1mq/DHcqv09YlSvf7YGRkzCR7QVlsrKW5wE51?=
 =?us-ascii?Q?a1zX4HvfEQ0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?zUGpvnC10FHEMI1dEJPEdF3n6nX5qOUgAOncaVNknVSCDfQsC4rA0W59kCME?=
 =?us-ascii?Q?8txzrjRI0XtkQfVZ5183ue7jlIhTlrzUPzf2MXv4oSC6Gpgm2mQUTivmY2dv?=
 =?us-ascii?Q?7AbKv1JEYA8Y2Mvy/e8TlIEFQtAV51cFcYTsvkA4bVrtpoN5c5x6BJqIHQ2b?=
 =?us-ascii?Q?j4L2P6PyPdzLttEVVYgwcphdCy8420juuBSuUnFhlwJ3QcjWvoXJSk88UxsX?=
 =?us-ascii?Q?2zaEbcvdimWLi/EdW5+FnZkd0jrwBXWGR+9OMSHTODYNDrbHMErnaoAZYL0c?=
 =?us-ascii?Q?jVqSJuSbOHXEkLSslpZATwXbco2lTeT+mgVmKQQZ0jqjXBWWtUiYHi0jqc5/?=
 =?us-ascii?Q?ntStHYH4cf0Tu5PLf400UYbowiKNmIfyNA6V2HNnMlfPB9JV+rHsJDhkEfGp?=
 =?us-ascii?Q?w15eWes3arvaMdKpEDqaYx+NG7U6/BG9d3gCTxZyCGUflPZrQVRr2Rh1Cw7t?=
 =?us-ascii?Q?sjKc2baESRiUPgKStV+g9r7ODg3FGykr6sR84hOnzWJz0oIK5qPlRc17Vy+j?=
 =?us-ascii?Q?S1FTo/AK3kTXWh+u50ejWFDk4LoO7YQWDomnQzHgpA9wsTLWGc5IQuUUuz93?=
 =?us-ascii?Q?pTcd9ZO8vMl5NY+WzjLrYwQAvVBK4kTDhrxZMV1WhFA6uYUdPGPH6gL3qCxN?=
 =?us-ascii?Q?0+pDTaFKSsbgdjYDhXJQpkW8yJIFjjq00VYeT3NAUAS9BHgQCJVBXGSnYztt?=
 =?us-ascii?Q?0KWiOr+22/2p0/R+lBdCyVMfbVcQk14geJ+UDP5O09kfqnrb4/oHoUJF7z+b?=
 =?us-ascii?Q?0jX1TJcJMODE+FDFGgVnnefVGv2pTidJKKy4HpVvvKIFX9S/fX6UAg4jUrw5?=
 =?us-ascii?Q?i6aGIr83xaldqHLJjJUU7d+4V0HU10WjWxXX4f/lFsWCYlRH/fcw45CYaaqw?=
 =?us-ascii?Q?s7k1szbuEVDHN4mUB3fv76vga4HtqFG8aW6EGjfr+0flyD9KnmelmZIou4pQ?=
 =?us-ascii?Q?NxcYKCrdnw9+WyTdCBI717a5ozfeC2DXEfoMr56nNNNNXnopZVSB535nF93K?=
 =?us-ascii?Q?gzf4aKN+oKPyKNckFK58/S+wYFA0Gxat1iblWvHrARCQVr2BZw+osKU+takU?=
 =?us-ascii?Q?t/YWe8zMLJSgW44Lo5ucsKLYU1owMvW28YBK3/+yHp+XoOatJf6rvWkzWk/3?=
 =?us-ascii?Q?+o733XKOMf7JPwod3m9M28mR3RgOTNIO0rckQi3q5c7VmekGSTqyr0YEjBaN?=
 =?us-ascii?Q?uxgt7xKhXOEt6CXiy5qoz55hrziqk9TpOzoKSQ7fs3Xn0vU5IpV+3xHOuZBc?=
 =?us-ascii?Q?YywADPnEd+CTdAGWzrxvyYWp3GwZ8LCpbgZ6MRibjTbCN86Avjk0cG1pQELT?=
 =?us-ascii?Q?e6oLHN1MQrOAxVvnM8e/md7IoONXMoP2jwau7QJ61HYfhr13jTka5cv3QDn+?=
 =?us-ascii?Q?bFTk+NiYJN7l4FLVLBhKu56kwHtImquvrmTU6cR7IsIXeeQn2JUDDFprMmAj?=
 =?us-ascii?Q?Atf5gxqos8IJaT3KInTPEa9kcF1yUWG2yoXVgsLaWs8G23T6AXfaYYTtU6ak?=
 =?us-ascii?Q?ZqRX3Mn4Lrh0KZmgGwqCb5NLO9adDggFVOFpeH3H/7DCivY4TawmcNnsML6q?=
 =?us-ascii?Q?3nrufw3UlqGBk1NRSseg3fvSU4N6v1GDDzLTLPSnOG5x/M8uEehkSAm8q78S?=
 =?us-ascii?Q?Tw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c1201c1a-952e-47e6-4811-08ddbdab64bf
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2025 23:09:58.5824 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4LoBBD8/UeHyCD9/3SLJ4dL446/mfyiR6cVKMRPVO9qOkJLVA3TFrbkLuCRZO+tedmZ6dyLZUHyUed5XQl1vjjtfS66CTZAtyLfPPrJ3vFI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6888
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

On Sun, Jul 06, 2025 at 10:30:11PM -0500, Lucas De Marchi wrote:
>On Fri, Jul 04, 2025 at 11:20:08AM +0100, Tvrtko Ursulin wrote:
>>
>>On 03/07/2025 23:41, Lucas De Marchi wrote:
>>>The bb allocation in emit_wa_job() is wrong in 2 ways: first it's
>>>allocating enough space for the 3DSTATE or hardcoding 4k depending on
>>>the engine. In the first case it doesn't account for the WAs and in the
>>>former it may not be sufficient. Secondly it's using the size instead of
>>>number of dwords, causing the buffer to be 4x bigger than needed.
>>>
>>>While it's unlikely this is causing any real issue, let's calculate the
>>>needed space and allocate just enough.
>>>
>>>Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>>>---
>>> drivers/gpu/drm/xe/xe_gt.c | 33 +++++++++++++++++++++------------
>>> 1 file changed, 21 insertions(+), 12 deletions(-)
>>>
>>>diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
>>>index d397df056e4cd..a926f560f2e36 100644
>>>--- a/drivers/gpu/drm/xe/xe_gt.c
>>>+++ b/drivers/gpu/drm/xe/xe_gt.c
>>>@@ -189,16 +189,7 @@ static int emit_wa_job(struct xe_gt *gt, struct xe_exec_queue *q)
>>> 	long timeout;
>>> 	int count_rmw = 0;
>>> 	int count = 0;
>>>-
>>>-	if (q->hwe->class == XE_ENGINE_CLASS_RENDER)
>>>-		/* Big enough to emit all of the context's 3DSTATE */
>>>-		bb = xe_bb_new(gt, xe_gt_lrc_size(gt, q->hwe->class), false);
>>>-	else
>>>-		/* Just pick a large BB size */
>>>-		bb = xe_bb_new(gt, SZ_4K, false);
>>>-
>>>-	if (IS_ERR(bb))
>>>-		return PTR_ERR(bb);
>>>+	size_t bb_len;
>>> 	/* count RMW registers as those will be handled separately */
>>> 	xa_for_each(&sr->xa, idx, entry) {
>>>@@ -211,8 +202,26 @@ static int emit_wa_job(struct xe_gt *gt, struct xe_exec_queue *q)
>>> 	if (count || count_rmw)
>>> 		xe_gt_dbg(gt, "LRC WA %s save-restore batch\n", sr->name);
>>>+	bb_len = count * 2;
>>
>>Shouldn't this be count * 2 + 1 ?
>
>right, but then we also need a `if (count)`, like we have for count_rmw.
>
>>
>>>+	if (count_rmw)
>>>+		bb_len += count_rmw * 20 + 7;
>>
>>1)
>>This one is good. For both hardcoded value are a bit fragile 
>>maintenance wise but it can be improved later.
>>
>>2)
>>Until now bb_len is in dwords, but below it is in bytes, right? In 
>>which case here there should be one, at this point exactly:
>>
>>bb_len *= sizeof(u32);
>
>not at this point exactly... xe_bb_new() arg is number of dwords.

actually not at this point and not below neither. the 4k align is
completely bogus there.

>What we are missing is to make sure the size is 4k aligned...
>
>>
>>>+
>>>+	if (q->hwe->class == XE_ENGINE_CLASS_RENDER)
>>>+		/*
>>>+		 * Big enough to emit all of the context's 3DSTATE via
>>>+		 * xe_lrc_emit_hwe_state_instructions()
>>>+		 */
>>>+		bb_len += xe_gt_lrc_size(gt, q->hwe->class) / sizeof(u32);
>>>+
>>>+	/* Make sure accounting offsets downward is also aligned */
>>>+	bb_len = ALIGN(bb_len, SZ_4K);
>>
>>I did not get what you mean by "accounting offsets downward"?
>
>we use e.g. `xe_bo_size(lrc->bo) - 4K` to get the offset to "the last
>page" in the buffer. However if the overall size is not a multiple, it
>will return a non-aligned value which is not allowed here: the
>bb_per_ctx_ptr for example needs to be 4k-aligned.

my bad... this is the bb from xe_bb_new(), not the bo. It will already
not be aligned due to xe_bb_new() and it also doesn't matter.

Lucas De Marchi
