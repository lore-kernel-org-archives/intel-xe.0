Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F0B1C02188
	for <intel-xe@archiver.kernel.org>; Mon, 27 Jan 2025 18:52:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12CED10E5A9;
	Mon, 27 Jan 2025 18:52:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GHIZ2jbG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2678A10E5A9
 for <Intel-Xe@lists.freedesktop.org>; Mon, 27 Jan 2025 18:52:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738003954; x=1769539954;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=emmR3xF0nIbRtNWmdMWEFDg9dEpMEPClvTNkk1CvBqY=;
 b=GHIZ2jbGf37H6ReXhGF7TuS+vETJSL+r10x+wDbSl0E4oAvhjLqy19+V
 SJPUtCiay0UNxKyHix6QGWYYXu8sLu8iNe0TMSNq0r4zYdtTiDspbthOg
 V8teIv6wh2he5WV0gT2F6VcDQlG4wPwXSw2fQIGJwA4ymsHpPqVj1GvWE
 SjeWCqwceGp4SddXUkq1VWCwn6bSbuGZM+nYs7TWtMQYrNPymHueisg23
 oTuXMWKdBcCNzb+HcJ2JZ3HB8jdzS9t//n1u9MFUGrm/DjJ8dp4yu5aCM
 nUl9JEZYZG1lvIYyeRJi8k334GWHt1O8F5crciN+nEkmVcf8sep+IRizz Q==;
X-CSE-ConnectionGUID: WAlkW7G7Qu6YmolOrHYvxA==
X-CSE-MsgGUID: 9wZD1skERWOw+EgO2x2pWA==
X-IronPort-AV: E=McAfee;i="6700,10204,11328"; a="38177769"
X-IronPort-AV: E=Sophos;i="6.13,239,1732608000"; d="scan'208";a="38177769"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2025 10:52:34 -0800
X-CSE-ConnectionGUID: 6JLu4HfMT5m9cMQnle5eDw==
X-CSE-MsgGUID: 84GLVGnnRXmxkLMUw3DRrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,239,1732608000"; d="scan'208";a="109055336"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 Jan 2025 10:52:33 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 27 Jan 2025 10:52:32 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 27 Jan 2025 10:52:32 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.176)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 27 Jan 2025 10:52:32 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SrAqpKd01AZv0bITQ1wRWfxtu8iv6nM0rua8fhpJJjVDZHF6dmSJyFcvtwW7H2LAwgXZOXTZUbJY3fT9ejz0XLqWYavXR+r4cvD02shfsoPvb9+zADlIEd1qT/sdYbzdiQBjD1eNHJjVvj6+3NDxq0Z0IOQxIVw21Cr9+x/5S02vnL9SY9k52+OQ83efkgJPFo9L/463POQXgvdCcRpysOQy44tieRcmWJStqsd8Naxlp0ClQ7igq7Rp/znLK76WOjZPC4BFPPjKzxtXaeBnWD/n8u6TXbzhNMgDfVFc6vEdm1TYsBIKirvlYCX1EfbdLwMhyfXBG7Ob/4k6xl+Waw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wiIo14QlZMfvj678h8W2uLY1EGTpVtE1kVFD25raAaY=;
 b=PiKM7u2wYE4Vw7GQe0iBYRHCXE55Yr22Esc/MotvuXvIg8/1YSp866vNL+pc17rXSTCXpJmqFRAtmTJtEDnv9aveS5zmwNxsFDGrdDNszRt0fhHKyBbZY2sJIqhozzHvD6PeBL9X6mye6VkdE/WrAg9Ki9qfI+nyHhaGi6L9NFMa/AWuhNObPSkxmKEn9N/8GCJSNrH1wZ09QnSDsl4N9VMHgViP11bwLB4pOAW1VNH77rSGbQJvh6OamgF7GI8Isjz5Xm4DvVuxHyxDiNLb6vdRPv5zNFQhV98f2ujlGiG4wXu3L/aRKQEDo1X5YxHY46ojHgBvd/YqytYMysKZoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB8282.namprd11.prod.outlook.com (2603:10b6:806:269::11)
 by PH0PR11MB5175.namprd11.prod.outlook.com (2603:10b6:510:3d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.23; Mon, 27 Jan
 2025 18:52:30 +0000
Received: from SN7PR11MB8282.namprd11.prod.outlook.com
 ([fe80::f9d9:8daa:178b:3e72]) by SN7PR11MB8282.namprd11.prod.outlook.com
 ([fe80::f9d9:8daa:178b:3e72%5]) with mapi id 15.20.8377.021; Mon, 27 Jan 2025
 18:52:30 +0000
Date: Mon, 27 Jan 2025 13:52:27 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: John Harrison <john.c.harrison@intel.com>
CC: "Summers, Stuart" <stuart.summers@intel.com>,
 "Intel-Xe@Lists.FreeDesktop.Org" <Intel-Xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe: Upgrade complaint about missing slice info
Message-ID: <Z5fV6zQUhk5bdjG7@intel.com>
References: <20250118005403.2960807-1-John.C.Harrison@Intel.com>
 <02d1075214e3ba35645686c1cb479dd5c74b5571.camel@intel.com>
 <24263415-c44d-47d5-bb92-d3fbc0aa356e@intel.com>
 <cb6a29e0-7baf-4872-8ae9-5374998a5a6d@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cb6a29e0-7baf-4872-8ae9-5374998a5a6d@intel.com>
X-ClientProxiedBy: MW4PR04CA0101.namprd04.prod.outlook.com
 (2603:10b6:303:83::16) To SN7PR11MB8282.namprd11.prod.outlook.com
 (2603:10b6:806:269::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB8282:EE_|PH0PR11MB5175:EE_
X-MS-Office365-Filtering-Correlation-Id: 68540566-7f35-4e2e-6f3b-08dd3f03c064
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?D71N4HjFABJORRsXtMamMyumxOeUaAf9YVOXx/wAXK1KW1Kz9VgCGW2rLs?=
 =?iso-8859-1?Q?W5KBJ8uGyIs0SBQ60OnJPLk7A5mcPjH3adFCCI+d4+lcwjO6sJ5dUs1BgG?=
 =?iso-8859-1?Q?SdXNyuZolhkIIMMVUYgmlQCJtBNy571qEBhex0/WOh/msV5Nsg2bBCfsju?=
 =?iso-8859-1?Q?w2p40u7e7WG7Zf8bQ5los7+tVwqZHkfu+mR+j2RXgFpESaSAzrN+THZhez?=
 =?iso-8859-1?Q?jICYIx9KdETdbU9kbcq8IrCONsr+ow46Uh1iEvW/llvQcPncDM2vcBFLlT?=
 =?iso-8859-1?Q?DTqiAfY9HCX2cYMDKmdzInFitvJaZxZ/ugbLiwb6xLzHSwel7YPptl27bW?=
 =?iso-8859-1?Q?y/NRFFDto+s9i1FkDI3FFdX5eebvShbBpJ1nZzgytrQ4t9stdpqtd+Lumc?=
 =?iso-8859-1?Q?QmFKXmYTTjh+eC5M2DC3GwI2YYu9iqTGGEnYT5LdzmdFMFW3b7KN45l7dj?=
 =?iso-8859-1?Q?zuUXQbn5oL5aJO+WV/bkW9x0CoVCD7KSR2q0lGtAe+r4FjJMIpLuQx8WLl?=
 =?iso-8859-1?Q?zXxq3+AIKkDk2snl5kArXQiF7O2d6u9kPd1q8Jb4Zj9dP+PH1Zzd4LOQl7?=
 =?iso-8859-1?Q?qh4GsHWcgBLNv7ulI/GfBLb0+pk9+GN5Ytjxw1Ch6hZgAs9UbYh9Rj0hhU?=
 =?iso-8859-1?Q?PgxZFd+WX4htXL5V2e2uUb+nE8brs2GtmPDAFy7qInDj4gr2bn9X7/aUOE?=
 =?iso-8859-1?Q?0ICgPrW2h7JG30T5oY2ID101cLHB2WfU5SBQ2WJvF+CmXqLZBEirATWLxK?=
 =?iso-8859-1?Q?uvPiiyfgduzJYgnHeyHYIHLj5IBlQoFeYwm1QPdjFEIZh81JSc+8f1Cz1V?=
 =?iso-8859-1?Q?CJ9VEvqa5qG0AfNqdakvgoaa5tQFlUpzz808z3Wo/q3wIwsGgb67BO/c6V?=
 =?iso-8859-1?Q?gllGSWedvmCLwn+rVX4mS9D5HpgsO+MOsNLrWQAhnPipoN91ZgpUCWOdxB?=
 =?iso-8859-1?Q?S+QkFmeALKEkqXtWd2aV2RtK1FIiq7DL5MQ1AuGMQTNanX34AHvRNoP6mB?=
 =?iso-8859-1?Q?Hmil8+OybHxEdTfnesGLbFUzdykDNz4FvIFQ5MGvwnlG+OIWnFAxhHrIiB?=
 =?iso-8859-1?Q?IeQ62LsHpApvrBxM6fG4q9k3MpkoZlrjZ3IPt/w2NSTh/bYWhnH79eFOMJ?=
 =?iso-8859-1?Q?19yXxeNLIfAeODQpeWljfhLi/6OtDTfvaMBZMJEgUPv1Zcu0pliij1RIcL?=
 =?iso-8859-1?Q?7QoIAU9B9M35MziHlNoIwGSm18D3DHR5VNEFX97WIRxSLzgDbJ+zm/CjkH?=
 =?iso-8859-1?Q?YL2pWvSYVKpm9j44mhtne/JIvjWJy4uh/Pu1j88OoEmqEwH0ys31M+A+JI?=
 =?iso-8859-1?Q?FmFA2Ik+Gr3KEGgB6n+NBG4D4MxR9j3u+jUQbAhWmsId92MdWG2AgCMjRP?=
 =?iso-8859-1?Q?2cHUZp6gMGHRlcQMqKU4T85qpwrNmAGPaRCZQb4Jv6ENzETbj/sKfWNFqx?=
 =?iso-8859-1?Q?5OcIjHAVo4jlXas0?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB8282.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?FOrYqc+r48iZLsC2zYqKqgxWKJNK4afR6RoCYDGFhRLDxRZWs9x5ASaem5?=
 =?iso-8859-1?Q?rZG3zXpDefDQ58fGolHeUYuSnBlTAypO4RvWrYdEYR6iqdayxuPPZOx/f2?=
 =?iso-8859-1?Q?yFCXtd4b6Bp16/5RnfbqfH8sObS4L4qo1xYxdn6wCj0DNlbZyveHNn8OUr?=
 =?iso-8859-1?Q?0qbugaB3fX4vJu4Y26foaaKAPtZbXfOkcbc1gCLhN6VmnqtUI8XR7WOvso?=
 =?iso-8859-1?Q?aTgfypEf3JYG1MIRzUtNkgZzH0hT3WxrGUGpe30TDcMliDETyKAkJ6A1qW?=
 =?iso-8859-1?Q?vr/9r2oIno4VS34zbccRq4sNYUieClcQCZRGODqL/YdQUgEBETTlU0uNXh?=
 =?iso-8859-1?Q?Rwj7jDRt/nAmEc+t0GHZ5oPoBkhBAxAk7JUsih/I/Cu1ylj7hvgf8DtL6f?=
 =?iso-8859-1?Q?92QkGuw1LPwfCDxsX9Oz/lfh6NN0lwzQkxIWj2qwuaf4emlGEkXDLdtmdv?=
 =?iso-8859-1?Q?hdZADl/PIUEy1mRbtg3ZVQA9gDtZeob71istErazt28h9RNWnMeIoJxpxv?=
 =?iso-8859-1?Q?+ew4kcY33t6bo4n+wgptX8w8bTCV9Sq41vCFGPjxsNTC7OBj/5CTNeKOpL?=
 =?iso-8859-1?Q?8/mW7XY+z+W/kXazrKhKGiBvtD7mBJMeDqAmrInLeKYoN4TtpCaerzCTjd?=
 =?iso-8859-1?Q?IcLIJdkQ6sW5c6lhVAFiONq0Hdqv7SmteqrPenz5C70EdoDk+WSWW9tG0P?=
 =?iso-8859-1?Q?5gsLJFki3B/fHNHvFI0ZpG2+Ekhz86nojOiwz3qirVSjLkTCMxIgRO1kEh?=
 =?iso-8859-1?Q?rW5FYHZHgdtEDElbCoNaa+p/nfrPNj5EvGCq1rA/sxsFqCuEpOse6lgp1C?=
 =?iso-8859-1?Q?h2MxeQ7TcS6XSCNmEN/dVAztg2UUpma1On9/uusY2CbH1fMTbEsH4Q0oVu?=
 =?iso-8859-1?Q?tby5kSt1WxDUkwUZBXiAaybGhCDOF3JNq5354QCJtZvCL0ZUQH4oW2oL32?=
 =?iso-8859-1?Q?QKpxn/lclOuwuzR3/CMcoZURyETt6PwqebkakLGpo1aVwM1HZ3w6ZEERca?=
 =?iso-8859-1?Q?knpOgWmwFungqt2x8K0wyNa0srs3yNJjX2qpx+x/I1OoA/8+0UFAZ7f6gb?=
 =?iso-8859-1?Q?KlMjzoOaapdcpOrv3cymkzEpO8b/V9+7AnUVAkleTATL3S5jPaIkS33C5r?=
 =?iso-8859-1?Q?sOXYKu0DSUzba7mi1HZezuMUJ7bnEZMK12c6L38a5jI9iq2iMz+FscymiO?=
 =?iso-8859-1?Q?N6wz8Ou0Gy6NCCn9UgkPU9ITDZ29R8K+kGPaTI9rA9CFTOgn/auDSwYe3a?=
 =?iso-8859-1?Q?1byGnarT+PLp0UXwLkdTrF8Yyl6o5HJnEIhOJvyAiCLNpqThy0bVj63BVn?=
 =?iso-8859-1?Q?r92ZhB71WVwa9179r/cP7rUZoulpiPy2gfy1msoKuEM9+6e/ZRoDw0u1us?=
 =?iso-8859-1?Q?ambTfJLAQhXyJzHVb0i4Ht7bmKFGDWH1B7SxC6qTF8J/NDU2kToWdnG2WP?=
 =?iso-8859-1?Q?nVW4QTnwLYqDzxnsNt4fLM2RUyHq2Z3lpb6IZJNUHvlEIp3i7T5FbblSY+?=
 =?iso-8859-1?Q?oBwsYSeka49ACKRyAruEfPB+72MyWh94I/YlyH0ViKyuRk2ktnDkYPNjJP?=
 =?iso-8859-1?Q?9AhvaFMPo8hUvoTXJvMVuW1q946BTiArZttuS8qrVRZxif4tQU//QB2Hce?=
 =?iso-8859-1?Q?owEjxJCzy+sncIq1pygSWelWxlAhI7z521cyh9p1Vtq7GBfLXSzQ4imw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 68540566-7f35-4e2e-6f3b-08dd3f03c064
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB8282.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2025 18:52:30.4532 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WmclEZ+Scrm/yeM0W7hgaKoL/VJjdY+1GO/e2rGw8qqKpSi3n0qwvWqK/NPzzluvY6SzHKqaAeFaznmYQUW2mg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5175
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

On Fri, Jan 24, 2025 at 03:56:54PM -0800, John Harrison wrote:
> Ping @Stuart & @Rodrigo? You still have concerns or can this be merged?

no further concerns from my side

Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> 
> John.
> 
> 
> On 1/21/2025 11:10, John Harrison wrote:
> > On 1/21/2025 09:42, Summers, Stuart wrote:
> > > On Fri, 2025-01-17 at 16:54 -0800, John.C.Harrison@Intel.com wrote:
> > > > From: John Harrison <John.C.Harrison@Intel.com>
> > > > 
> > > > The steering code needs to know slice/subslice counts and this
> > > > information should be retrieved from the hwconfig table. However,
> > > > earlier platforms don't have it, hence the KMD has a fallback path.
> > > > Newer platforms really should have the entries and if they are
> > > > missing
> > > > that is a bug that needs to be fixed in the table.
> > > > 
> > > > So update the complaint to be an error on newer platforms and remove
> > > > it completely for older ones that we know are bad (but are not POR
> > > > for
> > > > the Xe driver anyway). Also, re-word the message a little to make it
> > > > clearer what the issue is.
> > > > 
> > > > Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
> > > > ---
> > > >   drivers/gpu/drm/xe/xe_gt_mcr.c | 8 +++++++-
> > > >   1 file changed, 7 insertions(+), 1 deletion(-)
> > > > 
> > > > diff --git a/drivers/gpu/drm/xe/xe_gt_mcr.c
> > > > b/drivers/gpu/drm/xe/xe_gt_mcr.c
> > > > index a1676b787fdc..605aad3554e7 100644
> > > > --- a/drivers/gpu/drm/xe/xe_gt_mcr.c
> > > > +++ b/drivers/gpu/drm/xe/xe_gt_mcr.c
> > > > @@ -341,7 +341,13 @@ static unsigned int dss_per_group(struct xe_gt
> > > > *gt)
> > > >          return DIV_ROUND_UP(max_subslices, max_slices);
> > > >     fallback:
> > > > -       xe_gt_dbg(gt, "GuC hwconfig cannot provide dss/slice; using
> > > > typical fallback values\n");
> > > Agree with Rodrigo that this is still interesting for older platforms
> > > to show the expectation.
> > But it does not provide any useful information. You might as well just
> > have a loop on initial driver load that prints the warning out ten times
> > for any platform prior to LNL. The comment below has all the information
> > that the above message tells you (and more, because it actually tells
> > you this is expected rather than unexpected). There is zero use in
> > spamming the user with debug messages to say something that is an
> > absolute guarantee on a given platform.
> > 
> > > 
> > > > +       /*
> > > > +        * Some older platforms don't have tables or don't have
> > > > complete tables.
> > > > +        * Newer platforms should always have the required info.
> > > > +        */
> > > > +       if (GRAPHICS_VERx100(gt_to_xe(gt)) >= 2000)
> > > > +               xe_gt_err(gt, "Slice/Subslice counts missing from
> > > > hwconfig table; using typical fallback values\n");
> > > I understand the intent here, but IMO it would be better for this to be
> > > a warning.
> > Whereas, if this is a platform which is supposed to have this
> > information then it is absolutely an error if that information is
> > missing. Something, somewhere is broken and very definitely needs to be
> > fixed. Also, while the fallback should be accurate for the platforms
> > below, that is not guaranteed to be the case in future. In which case,
> > using a fallback may lead to incorrect register accesses. Which, again
> > is very definitely an error.
> > 
> > Either it is a new platform and someone forgot to add that information
> > to the table. Or it is a new platform that does not conform to this way
> > of accessing registers and thus needs a KMD update to support it. Or it
> > is an existing platform that got broken because of some regression bug.
> > Either way, it is something that we need to catch in CI before the cause
> > of the issue makes it out of the door and on to end user systems.
> > 
> > John.
> > 
> > > 
> > > Thanks,
> > > Stuart
> > > 
> > > > +
> > > >          if (gt_to_xe(gt)->info.platform == XE_PVC)
> > > >                  return 8;
> > > >          else if (GRAPHICS_VERx100(gt_to_xe(gt)) >= 1250)
> > 
> 
