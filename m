Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9ABD7C531DC
	for <intel-xe@archiver.kernel.org>; Fri, 16 Aug 2024 15:45:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EF4410E7FF;
	Fri, 16 Aug 2024 15:45:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="N5YtvBCv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 930C410E7FD
 for <intel-xe@lists.freedesktop.org>; Fri, 16 Aug 2024 15:45:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723823112; x=1755359112;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=blKa+J7W4rkkzlEfcuwKRn391kR5Lk3alFxNDXGfS88=;
 b=N5YtvBCvEFce2b207DqgpCLa/5QUfItOhQw0NCAkXWfrvnUBUugpU83z
 ttnRtjYwGH73tyFJ+hbGQIWTz1Qyp0w7UI7/Q3MudyS2gus52g0GRbUGu
 +7gRsgDMw16Z3ZTe/Bgzhtz71Sv8kayBuA2CRlQCAHUAg1mr0ZmI16LcQ
 F00dgtrS/JOubGcHw53N7NPaPBAyyZ4QpVJ670MDfU/hRFXRTzqklmrNR
 DeotLfFIVaiC8La/nGfaJhMviWxOELdQruvSsGt6a2v3SueV5xfPbpovq
 8/JFjZl83RRl8d6BNp7oXAy3mDCRaNnIyDqrwN75QbPghq/uipaRnacWs Q==;
X-CSE-ConnectionGUID: qHT8tGvPQ3iBwMrWjx2jDA==
X-CSE-MsgGUID: Fm7CDIQ3TsGcgzva3epAog==
X-IronPort-AV: E=McAfee;i="6700,10204,11166"; a="32758739"
X-IronPort-AV: E=Sophos;i="6.10,152,1719903600"; d="scan'208";a="32758739"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Aug 2024 08:45:12 -0700
X-CSE-ConnectionGUID: WhnApBD4TYqndzZe/uoXXw==
X-CSE-MsgGUID: IdAY3sQORbu85KtNC5mPUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,152,1719903600"; d="scan'208";a="64661449"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Aug 2024 08:45:12 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 16 Aug 2024 08:45:11 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 16 Aug 2024 08:45:11 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.172)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 16 Aug 2024 08:45:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kczgOb/8BQPN5PdCAUXkeQKrgSi+ONS3ou5eMpuIyHSz8Rhd3hTmmNd895oAsu6SVbadLWtkSKbPBv0HN4HPe60j4P4ISyxcQA8ezYRmDX298lJWJqDb0I5wjqwKAVQjqNbFeW936upLXGiE1o2eGHMyBESdIiXW9H4NCEuCv2g3Qrn6Q9v0jXDMc+uCndraYtaUH9EplqfD3Sw6ScM6ArbeveHSI8jmZoDey8IThCxPkHzkQA17NcsczFZGAzG/Vp1Y5uPjH6uzHMKIRy3G0gmGZFvUouEu1KJ7nYbQ3v2XlkJs2ECQusauQvIN2fzS9gQqFl6XUlNvSTjjK2msKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HoxCR59Hi4pUP9EXQmOrUvjJ3eSRQ5b5mVDv0rwREOM=;
 b=rq3yGycpM1uW4oNar/D5SepKm4lyxbJUBFJoSX6l/BB6omlgbEoRC+8O3xmyMhoC6VZ1Ntxei/PLkXbAKfxVoLIArnWK1uIjbToGc23ucmCPHtouoQVOmSRLW+B37ihXSs0Bd348Mky+1kLZ9JjD3VXmFAxDDk7RvoZA+YUiXWHeG4LWxFWQwimwlDGeqRvpi2frSM0K8p48OW+Ox6GPpdTYDgPxmdxeAZk3IqCUfXsjC7Yb0T7YLMOGzN6vqjQDh8rm8sHUQsXltkYTkU5oSKr9gSitPKOnjuhtlngwSvBmcEr1FrOp/AVW/BaebgsGBdDGHdK5pwr6ZNIZlHMkzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by IA1PR11MB7385.namprd11.prod.outlook.com (2603:10b6:208:423::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.19; Fri, 16 Aug
 2024 15:45:08 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%7]) with mapi id 15.20.7875.016; Fri, 16 Aug 2024
 15:45:08 +0000
Date: Fri, 16 Aug 2024 10:45:05 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <jose.souza@intel.com>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>
Subject: Re: [PATCH 10/12] drm/xe: Rename xe_ggtt balloon functions to make
 the node clear
Message-ID: <n4tyaumeddcwczm5xyicl5mz2cqguilhr62iry2xsbouud4ed6@judck5dfmtlq>
References: <20240816150243.87596-1-rodrigo.vivi@intel.com>
 <20240816150243.87596-10-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240816150243.87596-10-rodrigo.vivi@intel.com>
X-ClientProxiedBy: MW4PR03CA0307.namprd03.prod.outlook.com
 (2603:10b6:303:dd::12) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|IA1PR11MB7385:EE_
X-MS-Office365-Filtering-Correlation-Id: c7bb30bb-2f22-4eb4-e557-08dcbe0a67ce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?VsHf9fGL3k3bzE/ZUnMwBRJ4lxn4ke5lXrMr+enTbd1L0H2JxCyi2idffYyV?=
 =?us-ascii?Q?uf1225/yOqu7A0ea6ug4Akyy7WuzIH455jnfUHnCzxHdMp5h2b4/sFvN8QHk?=
 =?us-ascii?Q?+59o3CTRqvzBGzoFTVqNAB8HKjCRSwbj48wWRiusKBkqpXrKLEAoROoRUCqo?=
 =?us-ascii?Q?SKcMyjqQ82sT8daSSmzn+rlToomTt1ywyOw/Sxdwk3rJeH/BvujIaBraQVrC?=
 =?us-ascii?Q?FBHo2BYDRWsMhf7Y+6tghAqjkgt5SuGLpSpZGc3p4lTh7wdFIiveE8S1N/zz?=
 =?us-ascii?Q?ueqnNe/CUNwkkNBMxCpNkDWJr7pVp1Blzf/5AHuxKHF5/65YvUp7RbZrfKjB?=
 =?us-ascii?Q?LRRX3EL8ycNfz76e4Jxj338CEKgi98NsRGl/5NaMBC5+JcXcpu9ZRn0Ku0Wr?=
 =?us-ascii?Q?q+Ux/OI3NjPDMrVq8AC0VDo87M3ZdJpqQ7aAQXR6OuMQa8/DcOnAy/seF1hC?=
 =?us-ascii?Q?nTBODyxhuayOyC4/syB2Zn/j1/89yvHtbfbrRhoK00Ii8IZJn3oEnr3sxS4R?=
 =?us-ascii?Q?O/k7iiW07w1vQKCSrtUOm+3dQ5PdVAImh5xSFUqg7iveDbQjCSRRLd2XnuDN?=
 =?us-ascii?Q?ViWfEZqrqMQGkqA2l6ktWp1RAiTMa25MCZ3sD7gT3INYIj6MAPSXDofZrTqF?=
 =?us-ascii?Q?dVnKWh/NTTVeaF1Y6rFLsZXBWsJKhbpi7AGDAqUhAeHRGX8PtHj9lRGrBlm8?=
 =?us-ascii?Q?b3Nix2HUl7TmnVnBnGaj1MIj7xEiDISHh50NRT7BzjO7CDrsjtUHYtAD8ikf?=
 =?us-ascii?Q?J3HvNFH7Gj7oAoO+EDwUFDv2bBTt/3js2XVAssEpkiDipy24ioyvKc+4sdV6?=
 =?us-ascii?Q?i+AM8uBK3JiUrjGNox0xIUljIf9Vip/FkyiQMrVMwvEpi09vw11tam1nuF1H?=
 =?us-ascii?Q?q2ZNeYArGvV6AGsp3v93nsGfR+Gyzqt/FqDfP34NNnL7kyYb62yt06qTHKIb?=
 =?us-ascii?Q?O1KLbV5XkoNMvfmmDu58YF9yxrMuxv6/S1i/U9s7dl78vLVeIqg3OInU7R9H?=
 =?us-ascii?Q?TDJKLJ4XkayaX5gNGC81afjdcUIbkt4NTtC91UTgNDkJ2Ksf4ZUz+8siCVva?=
 =?us-ascii?Q?2UMCs1nVrxj4WsOZEQwdwLLe11NTXsgpSpjDIXuB4sbyGM9RgGFcJMJZFQEM?=
 =?us-ascii?Q?mMGnQihz5hXKWBub7KyGfOYG44LZXmFJcwHJZuA7KdPi/uWsVgcn3WR/5oPh?=
 =?us-ascii?Q?t+nY9GzyxWHtlBMnYLSVoORvJVsjT3b1Ex8EbfLNQO6BPr9D3LJFqyYqj6kv?=
 =?us-ascii?Q?vf+FjvIeh/imRUTjpka7OfBIHOx1lQ1LIG+Oe9x0LWSYo2WFoGiaa/AqhTXR?=
 =?us-ascii?Q?uSiQK4rSHOjhIT/5EfVplZqf51kqof6cvBKFiYdT9QZjhg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?rGkGji+BAXjCRqKpfg8o5OiAehtGAmIdcRpMz7mxmsu9sP1mE0WXZUmmkhdI?=
 =?us-ascii?Q?rb26Xrb5ia27CBTJ67EJSbJtwMeaD3RMzKIFfUXQ8a/ocuNbQMkYqBROHDIj?=
 =?us-ascii?Q?FJMr76IzpJ6+VRfPO+F+sqfetwUy9zbN4QIgEE5uRsmeDu7EJUqM9txxPU5E?=
 =?us-ascii?Q?wYQleW7RZK1JEiTSrED8CfDB7YygoDJ09JNZrZAuM1BewEP4X1VFM1arlPPz?=
 =?us-ascii?Q?ut+YmOGgwr7/CpoGzSB2Si/Wxmw+7fQN+IiHPvoPvtyfz6RBR9Vl37+fKo+n?=
 =?us-ascii?Q?0sarjGMGUhtOfrJL4G5u4OLsYVHe3fGznW9dyXFVtXsthAFimAYjVcyq6ntV?=
 =?us-ascii?Q?K4n0gSwF+TMq9O4yDzeSA1WMWW+Z9iduoU61wgjAHkLGm6vwZxLrytcbQBXN?=
 =?us-ascii?Q?onIJrTm51bRMPOi15zUuBPFe8YQw4zBrMnO7lMo242TfilDmYVhOH2yKs6ew?=
 =?us-ascii?Q?ZENr0pI9HVL2lIMswMjfkRea4Hv3TzjUgFDl4p0KfaLc2WDmrJcdxATk6WOQ?=
 =?us-ascii?Q?Tr4bpjyXte3sG6nrzhnRsyHfEu6K+GOiZW+Ik/K4meLgt1K1NVq7K49dMJtv?=
 =?us-ascii?Q?GcFC7kllxV2hLSgc34VZtfEZzVOISI2EfvtturSCqVuWNCIGhU70nQs4ZThe?=
 =?us-ascii?Q?4B4H73vdAL9Ff/mX186anUbU5yXjFTQ9yL4Kzo9NSm92UP3YCxYiXk4xk6I+?=
 =?us-ascii?Q?0LjZkMjs5qNEpH+1c6pSK749lj5oHsLESRQsF0+aVUgxouQqxHMeg/YtBgRB?=
 =?us-ascii?Q?RWuKLWh2anYXRBPdXnC3eA8n+EzA7mZLj+EezY5qi/aPSc7Ge8S5HfpkVl0g?=
 =?us-ascii?Q?1wew580sNatB81fiHfMjHs1/podEtqLqkah2wgViGAiiwWf+D/9hp20KoXmO?=
 =?us-ascii?Q?5IqcUAeXvrHT65uK6xvlsk7AnluW7y4M3gJaqyXnUS1m1KcN/7SArMdTITUw?=
 =?us-ascii?Q?r3XIHl87lAdpkSoWv7pdU5TDtX3i/d3CIS17y8suXzJI9URIeNurlOEYavYd?=
 =?us-ascii?Q?iyj4CHVoedXjbIl5sHz2bvdZgnTGPguCHJWRvhXdfDPIUtBgUfdxUo2lWVkw?=
 =?us-ascii?Q?nB4jaoOjPj9D8zxLMg2csoaR6lJvi267X3WaCZp0aw/Y9pwJevXr+747+6vV?=
 =?us-ascii?Q?08jeDu661MO49NXFpoomz33TUQZjb82mh/BAa5Lobs+D0injVKpZJbuMPYcY?=
 =?us-ascii?Q?SV3dgQUUt2VIMmviLQQFwsqgC5ORUXYp2+EtxIRWSm0U7zqB6eS8p797iD2I?=
 =?us-ascii?Q?i6iiTMgKsq6oPmiV+dn0YHJqeiiI/gmcKppQ3/0VloyYICg6t4YUGtY6qDNc?=
 =?us-ascii?Q?hBmufxJDU3yZ+r87T9wjQPo8YZyhRjzG8b5RUckEqPd1BFUGNb+KbKaX029i?=
 =?us-ascii?Q?tZ5hRzryVBbvvTILwxhWIxcTHBu8FMsjfWfu6D0npq+lk+RcpgK1nClZiqks?=
 =?us-ascii?Q?KhMiYR/7i/xID3J0P4pxlUZ9MSj8zm5lnpTnoc/YZsEn9h5zzrTIY5KdpbV3?=
 =?us-ascii?Q?XDuA29GMivg6zWiS2Yxc56EmNY2Qo4WG+7unyfB3WdxZm94Bm+7impBKH6gC?=
 =?us-ascii?Q?1PvVuZl1mjvpd0ZVokFn1LpiAZce9IXzmAY0xIGj+u63BCBZHGTYtGcvV15w?=
 =?us-ascii?Q?aA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c7bb30bb-2f22-4eb4-e557-08dcbe0a67ce
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2024 15:45:08.1787 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qOPLNrpZgTb4CKkNiDDKzBcZ4jC4dxrxb9wTmxfOvKj08eEvenzlOUQP5dhYuX75zEHGfsQ03IYkqldxCBz+SisH7V7AThyX8Sc3HQ3yyuo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7385
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

On Fri, Aug 16, 2024 at 11:02:41AM GMT, Rodrigo Vivi wrote:
>These operations are related to node. Convert them to the
>new appropriate name space xe_ggtt_node.
>
>Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
>Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
>---
> drivers/gpu/drm/xe/xe_ggtt.c        | 12 ++++++------
> drivers/gpu/drm/xe/xe_ggtt.h        |  4 ++--
> drivers/gpu/drm/xe/xe_gt_sriov_vf.c | 10 +++++-----
> 3 files changed, 13 insertions(+), 13 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
>index 960f5a28b7ed..05c3e6e929ae 100644
>--- a/drivers/gpu/drm/xe/xe_ggtt.c
>+++ b/drivers/gpu/drm/xe/xe_ggtt.c
>@@ -347,17 +347,17 @@ static void xe_ggtt_dump_node(struct xe_ggtt *ggtt,
> }
>
> /**
>- * xe_ggtt_balloon - prevent allocation of specified GGTT addresses
>+ * xe_ggtt_node_balloon - prevent allocation of specified GGTT addresses
>  * @ggtt: the &xe_ggtt where we want to make reservation
>  * @start: the starting GGTT address of the reserved region
>  * @end: then end GGTT address of the reserved region
>  * @node: the &xe_ggtt_node to hold reserved GGTT node
>  *
>- * Use xe_ggtt_deballoon() to release a reserved GGTT node.
>+ * Use xe_ggtt_node_deballoon() to release a reserved GGTT node.
>  *
>  * Return: 0 on success or a negative error code on failure.
>  */
>-int xe_ggtt_balloon(struct xe_ggtt *ggtt, u64 start, u64 end, struct xe_ggtt_node *node)
>+int xe_ggtt_node_balloon(struct xe_ggtt *ggtt, u64 start, u64 end, struct xe_ggtt_node *node)

don't like the lack of consistency. All other functions use
foo(ggtt, node, ...), while this puts the node at the end.

Not even clear why we keep passing both as the node already has a
back pointer to ggtt. Using the back pointer coul be done on top, but
the lack of consistency bugs me :-/

with that,

// Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi

> {
> 	int err;
>
>@@ -384,13 +384,13 @@ int xe_ggtt_balloon(struct xe_ggtt *ggtt, u64 start, u64 end, struct xe_ggtt_nod
> }
>
> /**
>- * xe_ggtt_deballoon - release a reserved GGTT region
>+ * xe_ggtt_node_deballoon - release a reserved GGTT region
>  * @ggtt: the &xe_ggtt where reserved node belongs
>  * @node: the &xe_ggtt_node with reserved GGTT region
>  *
>- * See xe_ggtt_balloon() for details.
>+ * See xe_ggtt_node_balloon() for details.
>  */
>-void xe_ggtt_deballoon(struct xe_ggtt *ggtt, struct xe_ggtt_node *node)
>+void xe_ggtt_node_deballoon(struct xe_ggtt *ggtt, struct xe_ggtt_node *node)
> {
> 	if (!drm_mm_node_allocated(&node->base))
> 		return;
>diff --git a/drivers/gpu/drm/xe/xe_ggtt.h b/drivers/gpu/drm/xe/xe_ggtt.h
>index 67ae5f1602a3..e68cede2e6b5 100644
>--- a/drivers/gpu/drm/xe/xe_ggtt.h
>+++ b/drivers/gpu/drm/xe/xe_ggtt.h
>@@ -13,8 +13,8 @@ struct drm_printer;
> int xe_ggtt_init_early(struct xe_ggtt *ggtt);
> int xe_ggtt_init(struct xe_ggtt *ggtt);
>
>-int xe_ggtt_balloon(struct xe_ggtt *ggtt, u64 start, u64 size, struct xe_ggtt_node *node);
>-void xe_ggtt_deballoon(struct xe_ggtt *ggtt, struct xe_ggtt_node *node);
>+int xe_ggtt_node_balloon(struct xe_ggtt *ggtt, u64 start, u64 size, struct xe_ggtt_node *node);
>+void xe_ggtt_node_deballoon(struct xe_ggtt *ggtt, struct xe_ggtt_node *node);
>
> int xe_ggtt_node_insert(struct xe_ggtt *ggtt, struct xe_ggtt_node *node,
> 			u32 size, u32 align);
>diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
>index 47222bd9988d..9a1be23ae71d 100644
>--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
>+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
>@@ -528,7 +528,7 @@ static int vf_balloon_ggtt(struct xe_gt *gt)
> 	start = xe_wopcm_size(xe);
> 	end = config->ggtt_base;
> 	if (end != start) {
>-		err = xe_ggtt_balloon(ggtt, start, end, &tile->sriov.vf.ggtt_balloon[0]);
>+		err = xe_ggtt_node_balloon(ggtt, start, end, &tile->sriov.vf.ggtt_balloon[0]);
> 		if (err)
> 			goto failed;
> 	}
>@@ -536,7 +536,7 @@ static int vf_balloon_ggtt(struct xe_gt *gt)
> 	start = config->ggtt_base + config->ggtt_size;
> 	end = GUC_GGTT_TOP;
> 	if (end != start) {
>-		err = xe_ggtt_balloon(ggtt, start, end, &tile->sriov.vf.ggtt_balloon[1]);
>+		err = xe_ggtt_node_balloon(ggtt, start, end, &tile->sriov.vf.ggtt_balloon[1]);
> 		if (err)
> 			goto deballoon;
> 	}
>@@ -544,7 +544,7 @@ static int vf_balloon_ggtt(struct xe_gt *gt)
> 	return 0;
>
> deballoon:
>-	xe_ggtt_deballoon(ggtt, &tile->sriov.vf.ggtt_balloon[0]);
>+	xe_ggtt_node_deballoon(ggtt, &tile->sriov.vf.ggtt_balloon[0]);
> failed:
> 	return err;
> }
>@@ -555,8 +555,8 @@ static void deballoon_ggtt(struct drm_device *drm, void *arg)
> 	struct xe_ggtt *ggtt = tile->mem.ggtt;
>
> 	xe_tile_assert(tile, IS_SRIOV_VF(tile_to_xe(tile)));
>-	xe_ggtt_deballoon(ggtt, &tile->sriov.vf.ggtt_balloon[1]);
>-	xe_ggtt_deballoon(ggtt, &tile->sriov.vf.ggtt_balloon[0]);
>+	xe_ggtt_node_deballoon(ggtt, &tile->sriov.vf.ggtt_balloon[1]);
>+	xe_ggtt_node_deballoon(ggtt, &tile->sriov.vf.ggtt_balloon[0]);
> }
>
> /**
>-- 
>2.46.0
>
