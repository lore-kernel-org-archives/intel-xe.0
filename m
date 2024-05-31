Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36990C25B75
	for <intel-xe@archiver.kernel.org>; Fri, 31 May 2024 16:36:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DCF210E0E4;
	Fri, 31 May 2024 16:36:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WCbKZeBW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF6EB10E0E4
 for <intel-xe@lists.freedesktop.org>; Fri, 31 May 2024 16:36:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717173405; x=1748709405;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=fVLKyV+AgmZ2PXRjZBC71o90daTSScc2llUkaPie/rU=;
 b=WCbKZeBWBkoyFy9CfR9iulkj0QKJiOBj9zMr/y63tkzeDdtqEbniuU3o
 vdCSNNxSMXBri1K2haXLGYTRSQZlrLuAuvqGIHmkZuBVH9miS6uSGG0Z9
 Uuv1NNGKpyIrcNpJDTN6RQpsmO0Xx44eqLPap9+SiGHKxKMNO888BRYSw
 LtDQT5gshKZUTu1SOX+3r9U7OUEwNhomkC9NR33+UbYyFxlRqkfD4YZp6
 SNNu+0GkOwuq67RLOGJbXZjpmPgMKv9nyUwDlhiHghOpkztRuXPJd+JRV
 kizzc86bBsRfCBgfI4Y2r4XQMyIwqLLVQG+sbIR4xugduLHLV5ALTbvwh w==;
X-CSE-ConnectionGUID: rUyqvnfQRBeZIfNhIIURlg==
X-CSE-MsgGUID: 7n8pRDcFTKifPba9oXGa5g==
X-IronPort-AV: E=McAfee;i="6600,9927,11089"; a="24845640"
X-IronPort-AV: E=Sophos;i="6.08,204,1712646000"; d="scan'208";a="24845640"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 May 2024 09:36:44 -0700
X-CSE-ConnectionGUID: 8DzE4FucTIePcCQqs2JAjg==
X-CSE-MsgGUID: vDnOiqXmS7yQSqZ3U7CVVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,204,1712646000"; d="scan'208";a="40650050"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 31 May 2024 09:36:44 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 31 May 2024 09:36:43 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 31 May 2024 09:36:43 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 31 May 2024 09:36:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hn78egdRLfIFr/E4eWEZ6ZbmrliswV3DT2TLmRYgruWnJXSpNXigIi2BOgO5tiMHuZRlkt7SyUv1c05LRHSGM7qzXAoQPkgFthFr+Pe0yMst9ib0LkKSxa3kzCnOxDzjTdH+pXELgXtmHDsaQx2otV7pIIFLP/08MakPRtnLvjw6uL9A3egAzCHDfq44W8fgbTFLs4dQlX4J4+ODQkUuYwkD4SC3d5QDISsC614vkFqqYIkKYv2ATP3aLCF7+MfJp5DYIUH7HT0Om5NT+6aKeBUXkHIdtAfnlcyqa8M4l3tMKMbNgHBSiYRx61PlCjZjyIwJo86KcphL94RSEMliWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pas+vLytX4ZipOmDepS/G+BvlljfWyvRutu5fml1hJA=;
 b=EAJGAij3eF4ZBRn+vBHABYH3VofElo/vK+PjsZq/6MA350GLBA6UzKyk4KJj5RHQcoo5ZjwmnG/TWjUjCtzVYffs+AL/hF0SIvnr7Oc+qYM1INhyXBNqfWBaIiIQanYaFYric17SrB/yaXmU12kwzc441CZEYIYUYSwxT5ri6uM5v8YrYDXETCihGzm19bHq/6piNCaT/nYQ/H169bKq2CZKHoPYTdgSZFFD1Hh8RGozSFLKQF7+uieB4TDVW54xyJm++4QIwByhSsoItUZiqQNwgs27SMz/AkBFOC2DrbrULbzsyAVCYQEV+O1h79uD3UPLnZiBj7dhRlUVH+7Xag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7SPRMB0092.namprd11.prod.outlook.com (2603:10b6:510:2b1::6)
 by IA0PR11MB8420.namprd11.prod.outlook.com (2603:10b6:208:482::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.25; Fri, 31 May
 2024 16:36:39 +0000
Received: from PH7SPRMB0092.namprd11.prod.outlook.com
 ([fe80::2ad4:4a5:b333:6ff7]) by PH7SPRMB0092.namprd11.prod.outlook.com
 ([fe80::2ad4:4a5:b333:6ff7%2]) with mapi id 15.20.7633.018; Fri, 31 May 2024
 16:36:39 +0000
Date: Fri, 31 May 2024 16:36:10 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Paulo Zanoni <paulo.r.zanoni@intel.com>, 
 Francois Dugast <francois.dugast@intel.com>, Thomas
 =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH] drm/xe: Fix missing runtime outer protection for
 ggtt_remove_node
Message-ID: <Zln8epd2JBtrLBOE@DUT025-TGLU.fm.intel.com>
References: <20240531160205.206604-1-rodrigo.vivi@intel.com>
 <Zln3o08O5Oz+SwQ3@DUT025-TGLU.fm.intel.com>
 <Zln7ZnxjwWjbkABK@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Zln7ZnxjwWjbkABK@intel.com>
X-ClientProxiedBy: BYAPR06CA0009.namprd06.prod.outlook.com
 (2603:10b6:a03:d4::22) To PH7SPRMB0092.namprd11.prod.outlook.com
 (2603:10b6:510:2b1::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7SPRMB0092:EE_|IA0PR11MB8420:EE_
X-MS-Office365-Filtering-Correlation-Id: d5c60e6e-cf09-40eb-c076-08dc818fd84c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|366007|376005;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?rguB2Epn0Zlz+bUw0/WobMfucBIxgPHp/K+cznndacQntlAXA6RwCcRM75?=
 =?iso-8859-1?Q?69KlvNJzWkxdBEGNloAIsvvi9ndwaaQy63B8iOsWUJNVQxxm3C74TsmtHn?=
 =?iso-8859-1?Q?s4J8AuVwmeSNiBAlKxyR/yhp8Cu+O/OFpDZfoAg27azEuxtuJq2YXG6amq?=
 =?iso-8859-1?Q?ydqDbS83E51P0ULy1QwtLM/ibRLVk6xTVsqiwaJJ3MIK2fgKsBm65le6AD?=
 =?iso-8859-1?Q?lIKJFh5SOF6wnZJWl8q6DOCTyYifqO8VVlw8gsOepu6VV+S9O2u2hw36TC?=
 =?iso-8859-1?Q?LMkGSS3uDvy3TPwihBy9Jp+wYtmOj/NRWFT4xHHLhYB44xNr57W0uV9JWS?=
 =?iso-8859-1?Q?FZhbiczq/88AoeS6XaQJtN3e9cWYZMYKxrAKXXAcRWzDVDrfcs/zvMwW2J?=
 =?iso-8859-1?Q?YfLSsD7X24B1ilJCxX4IVCT4sVWTjZpevsU3183jctOWvfkLCvRwVn0wlj?=
 =?iso-8859-1?Q?2XOaZLz01sJWZV4J1mRoxCoPgZ9l1tJv7zNyJcG8nqUq472dCM+A9w80d1?=
 =?iso-8859-1?Q?q8YCUjhmEwLMXg4ijnwGWBtZx7JCjizpPxIYPhQhsz9si+k6GiPV8ZlkPn?=
 =?iso-8859-1?Q?to9IcqJkheLF2atIMQ0QtK5Qg8B50eT7n+C2nQ2yacKT+UI7MV+Rv7bNqh?=
 =?iso-8859-1?Q?80u+yVn//JbXY42nN9obfMRC5e/Zm29537isvK4kzdXvC2+42XV+VjBKE6?=
 =?iso-8859-1?Q?0vfjZVUjn44Nmdbb4danq45KT8zL14jn7SpOsBsPANMHGZMzumEOJywIrR?=
 =?iso-8859-1?Q?HwxzYMTYF6jMglIBDBUOGss/4yflmKKeBPl7SpnqMXAJyfdvaiNR6E62lS?=
 =?iso-8859-1?Q?53pLrkvMPt++LPIgJrVS72qsY1b83w71WgcP4YlC6JvGlf2dhFpBmLwfVY?=
 =?iso-8859-1?Q?VRYYO47XEtnyWhNpn+6yHJq2LlqEJ49nwwaTVYjDSF7Cb5nd8NbfReTogI?=
 =?iso-8859-1?Q?yvxxQUp0vy1X0oSmoXjyptXUAOwCu0uGQ3geN3fUJBJ/JjRP/kSnD6koeE?=
 =?iso-8859-1?Q?iYp42NCFQbsz7n1w92yVOGKPh89vJYtlAeWBwK1TUGxHKvZc9aoJCaX9JG?=
 =?iso-8859-1?Q?Uc0j9i5jlWnsIH4xVNq/ef2sPF3lmqxq/5y9DfAKsv6iB1HBX41+mi9Zi9?=
 =?iso-8859-1?Q?kl9z/DOZ/x44Zt1UmUjnhWBOFf48daMdBP6s5fm6GQLjQu7ZYkcr0y5uOV?=
 =?iso-8859-1?Q?5UgBPJjLggYa9SFKKE5BLc5SglLaYYsG1R5oe1chxm3ryyiTdfx9nSSh2i?=
 =?iso-8859-1?Q?aXK8ItbUV+trOK+0nSI4TRw6zeM5zRQpS5oOgj1iA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7SPRMB0092.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?eHfWV71hthBk+uDSwHcmwOH3UYClLVLfh+4fDTJELCyvOStzzLQXv+TcKz?=
 =?iso-8859-1?Q?LbJRC4NOfOaBQZms+WCcKoLHToSlmtGqhOQiJZEOIwR4I6Keo6lIZxf9fO?=
 =?iso-8859-1?Q?vA9I/yYKctaXqAJJRAWTIMDTkU4T0ZdOTXFvzLUAKI10vJe9I56MbgMrjQ?=
 =?iso-8859-1?Q?Kxi5AoRtF+tYzbAeqcCp0y+eBDJsOatjzWVs0zGuR2xDA2zSPlBNFIfjZr?=
 =?iso-8859-1?Q?3BsC4UoUxJFnhKfBBFA0NC+hlLfzYsKe5QDztMcE2Ldx0vozR3ky0XypES?=
 =?iso-8859-1?Q?0r60iyoi7V+aP+a1DyxAtj0qLlvdtVbi2Ee3hGwlo2WQJCyswXoYABnD/7?=
 =?iso-8859-1?Q?5+KNs9eyoa3nWVZDge40siF8ez7JDUtXoXa8caW9rIyfGEBrhzQiZBcali?=
 =?iso-8859-1?Q?SxvKJgLh1r/YVy0ZDbzhlz+5EJOtt9QH6O45c6YZtvIEA3/4Z7uBiWbbCd?=
 =?iso-8859-1?Q?PjAoG2t+E8B1+8ZjrK45nbi+R5lWiu5mFaNJbX/dUu+Tc1Fha/9dbgZCvi?=
 =?iso-8859-1?Q?8bfApL1ON/qCSVXkIhH1aDcCviNPcb63KQS7RZjKsTFSZeJ4alvbR8g8cg?=
 =?iso-8859-1?Q?QBQP3MMlWERhkQpartYUlCopB8OpmkNlYAx4NX1BKEVhXe9LrPiMzoBMrz?=
 =?iso-8859-1?Q?bkCQRtcwNv4Tv2pvZxFUbKgVHMQVv0KK+fkiZqKGyL9Ff4EgKX2hq3406/?=
 =?iso-8859-1?Q?x++ZcgFVSDbwQmEYsE2B1eNRdHFn3z7yTXESInvPHbPCx+QjoDiMazjQFO?=
 =?iso-8859-1?Q?YPFHi57bSLhvn8+IkweXDvpvCAGA+56PR6gNLoIJ+sRPXzRsQxbJtvD9lo?=
 =?iso-8859-1?Q?o/fmCYyG5tOUKICqT8OnQGWFzNNTD3pR4UkwwZ4XOhvBS9fwMewwig9gV5?=
 =?iso-8859-1?Q?9tfO0hq4m7ppb3cMbCh7G+u/qls6cWgeWfMZ0LiYX7JnoWD3g2XrLf3TC+?=
 =?iso-8859-1?Q?iGdVRwCaP7ZBDExjAnUkHIibjHAj6+88ufLDYsoes6BvxjbasdKJsyIDYJ?=
 =?iso-8859-1?Q?a3kCJ4U5dX4L69FDodCRGVO3uTOJfC3d5WdSH/0ujIO+9VqoZ8ekE89fJ0?=
 =?iso-8859-1?Q?1owP0odpWbE67m1t0pDE2NpzrFy0ez/pl8Q6bHAxZM+y38mQeKFMPuQbfP?=
 =?iso-8859-1?Q?3BUfpm3r1vPBd1zrNJ6dD6oidt2CBVi8GWp2c9P7lEDX80vETp9bSiJyFu?=
 =?iso-8859-1?Q?79GIqB1Hpe8u3O8HqU+hKJ4f6EIkZt9F3OyNOEAVQDMD83Weh/3ZXERC4m?=
 =?iso-8859-1?Q?12/N0XNcXdMm6RmsFZeh5elcH7XKJUE0ASCish0PtTHZXfE3ibKlHereaP?=
 =?iso-8859-1?Q?HdOcp6rgsvP62Ayhhg9OaTFrr6UtT3W5NWcbxFlWIZd5zdXVMuZUIrDs1p?=
 =?iso-8859-1?Q?E76SB6wY0LtpsogWo1X+uf6URqOAAeD67qhkNODywFB/O58SarO5YBGLO9?=
 =?iso-8859-1?Q?FDf++EPOa8hfxUNyBI0CE5exB6koBs+yy37e1rKH95Ciz1XDloAtYAJaWo?=
 =?iso-8859-1?Q?og0z6UARUdoTEZVgE6EWT8upLV0TxtxohUYxOQVC0+i7b4dpHPHN93x6EA?=
 =?iso-8859-1?Q?5QzpdC6lJdDgWaHwkgQinuNy4ainG8uEOAJUkZH2jEyfxbG9g3lPOVj2Oi?=
 =?iso-8859-1?Q?mFyIJB82GjH/BXudgQJONeubpZvbGivFOAtTvdyjuIIC/0uaYuQ0tU5g?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d5c60e6e-cf09-40eb-c076-08dc818fd84c
X-MS-Exchange-CrossTenant-AuthSource: PH7SPRMB0092.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2024 16:36:38.9834 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OjcZm9uLuxq16Z85ipHT1fjW2Wct8rxxcG7D4ACm8oD2S7hF9XGJmG26606JKYoK0Y64DFN5F24zTLhXCUFpVg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB8420
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

On Fri, May 31, 2024 at 12:31:34PM -0400, Rodrigo Vivi wrote:
> On Fri, May 31, 2024 at 04:15:31PM +0000, Matthew Brost wrote:
> > On Fri, May 31, 2024 at 12:02:05PM -0400, Rodrigo Vivi wrote:
> > > Defer the ggtt node removal to a thread if runtime_pm is not active.
> > > 
> > > The ggtt node removal can be called from multiple places, including
> > > places where we cannot protect with outer callers and places we are
> > > within other locks. So, try to grab the runtime reference if the
> > > device is already active, otherwise defer the removal to a separate
> > > thread from where we are sure we can wake the device up.
> > > 
> > > Cc: Paulo Zanoni <paulo.r.zanoni@intel.com>
> > > Cc: Francois Dugast <francois.dugast@intel.com>
> > > Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > > Cc: Matthew Brost <matthew.brost@intel.com>
> > > Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > > ---
> > >  drivers/gpu/drm/xe/xe_ggtt.c | 56 ++++++++++++++++++++++++++++++++----
> > >  1 file changed, 51 insertions(+), 5 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
> > > index b01a670fecb8..d63bf1a744b5 100644
> > > --- a/drivers/gpu/drm/xe/xe_ggtt.c
> > > +++ b/drivers/gpu/drm/xe/xe_ggtt.c
> > > @@ -443,16 +443,14 @@ int xe_ggtt_insert_bo(struct xe_ggtt *ggtt, struct xe_bo *bo)
> > >  	return __xe_ggtt_insert_bo_at(ggtt, bo, 0, U64_MAX);
> > >  }
> > >  
> > > -void xe_ggtt_remove_node(struct xe_ggtt *ggtt, struct drm_mm_node *node,
> > > -			 bool invalidate)
> > > +static void ggtt_remove_node(struct xe_ggtt *ggtt, struct drm_mm_node *node,
> > > +			     bool invalidate)
> > >  {
> > >  	struct xe_device *xe = tile_to_xe(ggtt->tile);
> > >  	bool bound;
> > >  	int idx;
> > >  
> > >  	bound = drm_dev_enter(&xe->drm, &idx);
> > > -	if (bound)
> > > -		xe_pm_runtime_get_noresume(xe);
> > >  
> > >  	mutex_lock(&ggtt->lock);
> > >  	if (bound)
> > > @@ -467,10 +465,58 @@ void xe_ggtt_remove_node(struct xe_ggtt *ggtt, struct drm_mm_node *node,
> > >  	if (invalidate)
> > >  		xe_ggtt_invalidate(ggtt);
> > >  
> > > -	xe_pm_runtime_put(xe);
> > >  	drm_dev_exit(idx);
> > >  }
> > >  
> > > +struct remove_node_work {
> > > +	struct work_struct work;
> > > +	struct xe_ggtt *ggtt;
> > > +	struct drm_mm_node *node;
> > > +	bool invalidate;
> > > +};
> > > +
> > > +static void ggtt_remove_node_work_func(struct work_struct *work)
> > > +{
> > > +	struct remove_node_work *remove_node = container_of(work, struct remove_node_work, work);
> > > +	struct xe_device *xe = tile_to_xe(remove_node->ggtt->tile);
> > > +
> > > +	xe_pm_runtime_get(xe);
> > > +	ggtt_remove_node(remove_node->ggtt, remove_node->node, remove_node->invalidate);
> > > +	xe_pm_runtime_put(xe);
> > > +
> > > +	kfree(remove_node);
> > > +}
> > > +
> > > +static void ggtt_queue_remove_node(struct xe_ggtt *ggtt, struct drm_mm_node *node,
> > > +				   bool invalidate)
> > > +{
> > > +	struct remove_node_work *remove_node;
> > > +
> > > +	remove_node = kmalloc(sizeof(*remove_node), GFP_KERNEL);
> > 
> > Are we sure this code cannot be in an atomic context or in the path of a
> > dma-fence? If either of the former is true, then we cannot allocate
> > memory here. 
> 
> not sure tbh
> 

Me either, we need some deeper thought to answer. Given that is fairly
deep layer I say it is convincible the latter could be true or become
true at some point. The former likely isn't given that we use mutexes
in this path. I'd say best to design this with that in mind.

> > Alternatively, we could use GFP_ATOMIC or preallocate
> > 'remove_node_work' as part of the initial GGTT node allocation. The
> > latter requires a bit more memory, but GGTT allocations are heavyweight
> > objects, and using a bit more memory seems fine to me.
> 
> I had thought about simply going with GFP_ATOMIC.
> 
> The pre-allocation doesn't work. Unless we encapsulate the drm_mm_node
> into a xe_mm_node with the removal info in it.
> 

I was thinking a xe_mm_node subclass.

> > Also if we do the
> > later, maybe just add the node to a list and kick a dedicated work item
> > which process all nodes on the list.
> 
> The list with the single worker also sounds elegant solution here,
> to process all the removals in the same way. But for simplicity,
> if GFP_ATOMIC works I would prefer to go with this that minimizes
> the thread and it has 1:1 work:item.
> 

I'll leave GFP_ATOMIC vs. xe_mm_node subclass to you.

> > 
> > > +	if (!remove_node)
> > > +		return;
> > > +
> > > +	INIT_WORK(&remove_node->work, ggtt_remove_node_work_func);
> > > +	remove_node->ggtt = ggtt;
> > > +	remove_node->node = node;
> > > +	remove_node->invalidate = invalidate;
> > > +
> > > +	queue_work(system_unbound_wq, &remove_node->work);
> > 
> > I think we need to be careful with system wq usage. Recently we have had
> > two bugs [1][2] exposed in 6.9 in which we deadlocked by using system
> > wqs. I think it is likely safer to use a driver dedicated queue here.
> 
> ouch! probably good to create a dedicated wq for xe_ggtt so we don't
> interfeer with anything else.
>

+1 or use an existing Xe wq. Again I'll leave this to you.

Matt
 
> > 
> > Other than these questions, design of patch (try grabbing a PM, if we
> > can't defer to worker) LGTM.
> > 
> > Matt
> > 
> > [1] https://patchwork.freedesktop.org/series/133210/
> > [2] https://patchwork.freedesktop.org/patch/586095/?series=131904&rev=1
> > 
> > > +}
> > > +
> > > +void xe_ggtt_remove_node(struct xe_ggtt *ggtt, struct drm_mm_node *node,
> > > +			 bool invalidate)
> > > +{
> > > +	struct xe_device *xe = tile_to_xe(ggtt->tile);
> > > +
> > > +	if (xe_pm_runtime_get_if_active(xe)) {
> > > +		ggtt_remove_node(ggtt, node, invalidate);
> > > +		xe_pm_runtime_put(xe);
> > > +	} else {
> > > +		ggtt_queue_remove_node(ggtt, node, invalidate);
> > > +	}
> > > +}
> > > +
> > >  void xe_ggtt_remove_bo(struct xe_ggtt *ggtt, struct xe_bo *bo)
> > >  {
> > >  	if (XE_WARN_ON(!bo->ggtt_node.size))
> > > -- 
> > > 2.45.1
> > > 
