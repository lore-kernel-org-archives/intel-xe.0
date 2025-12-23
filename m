Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3496E748E6
	for <intel-xe@archiver.kernel.org>; Tue, 23 Dec 2025 21:36:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7226B10E2CC;
	Tue, 23 Dec 2025 21:36:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UOu8Kxam";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 025B210E2CC
 for <intel-xe@lists.freedesktop.org>; Tue, 23 Dec 2025 21:36:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766525815; x=1798061815;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=saeeqKD3uEGIAoiTJAZ9hF2J6I61qyeyN/RwGunP5tQ=;
 b=UOu8Kxam7aeXkUCL2SkfIfkpiCAcrymolJfS+gX/OpgyMynFWNu8fZI1
 kb42EHx7oLf2Bpy8Ee0oE4HkU3OAliztGslgIYpVG6rUjOC3H0/g/BVQc
 DAY3bcnunrdewd9/RJiz5TjsUMrhUpT90oUD50ogfpKfnZVmcXnaUcVS1
 EGDzvsKeW9MdFvhTW5gQ4B08mK2tH25BwyeDDMZhorPYDsEGqzUOK9i2i
 T2+aLK/1rCWFCmm5JfCRcv31K3gBOcMvJ6LHKd1HsWVNEX+lpIene/ZES
 a8RLB2TVP3fO04kwF9QGjblK4tAqFQgYxV/M8WNujVrMUVmExfOe5JzQ6 A==;
X-CSE-ConnectionGUID: rQfWEoCzQUmAbXrOKLVrhA==
X-CSE-MsgGUID: ET9GAKbaRZ6/tz6f8lY1Aw==
X-IronPort-AV: E=McAfee;i="6800,10657,11651"; a="67569430"
X-IronPort-AV: E=Sophos;i="6.21,171,1763452800"; d="scan'208";a="67569430"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Dec 2025 13:36:55 -0800
X-CSE-ConnectionGUID: 8ab2hifbRjCh12OxkIAeig==
X-CSE-MsgGUID: DT3hm9NfQg2RC4RAxKLM7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,171,1763452800"; d="scan'208";a="237273937"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Dec 2025 13:36:54 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 23 Dec 2025 13:36:54 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 23 Dec 2025 13:36:54 -0800
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.37) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 23 Dec 2025 13:36:53 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P1xixF7X33NynhEimOIu/cwRchXcNDLhYZecb394Yjghjf7R8Hc+h6EOBMldZas81eSiy6PfXRXyUu68x3kUgAcAUIv1yTDLWgS5P4kAM4OG+w4jZufBBQMRLTr2XWI6zl+NAvTRrjB2fC1vnAqxQMro5D2yHHgo1lGnJDwcqDd7fDd7ZoxSamdmUUgSSxkZtcpV4DZaeFrATki5DakdOQmmYHn0zlODqze5iaLUQ9q5PyZVV4oEmry2Zh7vgXRx3ye9ju62T+u+TWMkapO26aFKkfl00o8QAVFC36OeM8yPpzFPU8Bw9rgwtUxdFNLSEFy9kdqxQPE+z2AvLwi6kA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zqRTQkWmdI5JkXwyJuBZ61v2nJT1SlKi1p6vEG4vXRQ=;
 b=aosbs6mTMadf3EjaPjqf8scG0c+/zaStVxT7n3r3ibNPCx5jO88IAUmGPGz4+antWLJbL8OzBXb2in/awfCp8Eh/PDHZ9UTuuMObYGRtj5odpqY3zxQyKZJOU4Vwbev8KNFDZ1sel+tkDewMF2X+dIb9+XbBKg9O+Mtaqfp0mOT8RJPcWN9yLyxOyXBmjKXUgVhlOk1DZ/68fvKNKK7ppQYaiNLBd1bSbJmduiGKyOVaPSx2PsseqePQBzH3CafQS4QPtk+2A/sVivVKWC2QTi8FIFpWCvCABZwaiZEqAkVCYMz2wagztDO6A+V22QUQKGJ7CaDcFV6ULR8b47+Chg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA1PR11MB6783.namprd11.prod.outlook.com (2603:10b6:806:25f::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.11; Tue, 23 Dec
 2025 21:36:47 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.9434.009; Tue, 23 Dec 2025
 21:36:47 +0000
Date: Tue, 23 Dec 2025 13:36:44 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Jonathan Cavitt <jonathan.cavitt@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <saurabhg.gupta@intel.com>,
 <alex.zuo@intel.com>, <daniele.ceraolospurio@intel.com>,
 <rodrigo.vivi@intel.com>, <michal.wajdeczko@intel.com>,
 <stuart.summers@intel.com>, <ashutosh.dixit@intel.com>
Subject: Re: [PATCH v3 2/2] drm/xe/guc: READ/WRITE_ONCE ct->state
Message-ID: <aUsLbPyLcHFzAlTQ@lstrano-desk.jf.intel.com>
References: <20251222201957.63245-4-jonathan.cavitt@intel.com>
 <20251222201957.63245-6-jonathan.cavitt@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251222201957.63245-6-jonathan.cavitt@intel.com>
X-ClientProxiedBy: BY3PR05CA0037.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::12) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA1PR11MB6783:EE_
X-MS-Office365-Filtering-Correlation-Id: ae310acc-5ff9-4956-ecf2-08de426b5fea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?eyJCQR/TwXfWveFgucVLkSt3d6zX2zz2fyTlUqePObjFDXQj2EK017hQxue8?=
 =?us-ascii?Q?RKebRy2M7oPzpk8rOkAwmK8vLAITuIZcRbsur1Qaq6TYTFW+uGBtwV1dtT1+?=
 =?us-ascii?Q?SZAsQxMdi2kO5skjwNyrt+7+Z/0z/9F/Fi198p5NV+127XxucmyxDEKpZWLJ?=
 =?us-ascii?Q?3kOSoe5m0ZHv46yPlA/9NcfcpYlq1VlQIIcxxZe393gaM24yjd2w/UpIAyFF?=
 =?us-ascii?Q?R1I8w1hDM3esI70lGwZhOYgojQ3X798qgkUjn6NRkjiIRTMW6+Di7LEBioEG?=
 =?us-ascii?Q?Am0cPz5onuVLIHEI4zOuSxyCEP8YKl/4V9v7fX1UpQcc023zI8WdmoTUtuuK?=
 =?us-ascii?Q?m+mBoilyVj29QL5unQd55iwH24hvMh+hTPff2kqFB8jMmyPL9AKdEuCpyfqu?=
 =?us-ascii?Q?QzR3wUqRDb0DI0dz5gdBeh/4y557OwqkqIt0IBhD/jz6XWSRygXplq7EDdnj?=
 =?us-ascii?Q?ZGK1TlX4aFujzUUgkph74egqAlkbC7vL69pVPQkb0eh3o1+hvRtiz/WMSRUL?=
 =?us-ascii?Q?X2Ya7p4tILXh/niBwpdz0sLkPWXCQdqayOPHhr1FVkr4e18+Fep+TrrjIWge?=
 =?us-ascii?Q?Ujh9CyENXkXZAN4L80M3EIX8KaVeHheNDa/gQeBViIkN2yvF7WddsKT3z7XT?=
 =?us-ascii?Q?2q142TNQmddIDm91uUETkJ348PFG8x95vMm0zzLJGu4t+1lH1vD3bbmjirAD?=
 =?us-ascii?Q?S4IKf1NPpONTx4HnNoCFzeJyDi8HRuv18pkZAPCwVv2EUZVGra1Es84BqVhj?=
 =?us-ascii?Q?tFCej5Bgxoz6LcGjG8DtTcX71cnqxcaH074v0CVet5K2wvDafvLyrEUG1R26?=
 =?us-ascii?Q?/bAy2mRZlc/sPkf+7VQT+vvczsltvo8sk0AtP8cW7qf74wYOX62GmCm/GlV2?=
 =?us-ascii?Q?++fAo/IhMRro/ispvBpbCH59tncm7+SEZOQlafNHLafkoXBPVVij4aL8lfh7?=
 =?us-ascii?Q?hLyikTMt5TfuuyAA7lyUJni99YKAJEIHWoD6hRJXsL9uz6tg8nG03iZJYeHW?=
 =?us-ascii?Q?ZexQAxXrgqDBt2XJYjlTQYiFd7MraE62UkMX0aayEPOrM7ePTwiMmP0OYEEC?=
 =?us-ascii?Q?gJtfvF7EDwqepZSnsSyka9Yd7NTRPD779UUqYGiWmih4Q/z7hpndI4M4tGxE?=
 =?us-ascii?Q?Ycw2nSRvzcuGk6BI26Pw+uvhgUWN76tYUFc3MQXQWyOFTO+Wle+UrURuJsuq?=
 =?us-ascii?Q?7PAPryBTeKkuoiwud8A5gRAljfcKZBlj4JbOi3Jaq9+bQt0c4rpFMRRVT9bv?=
 =?us-ascii?Q?uCdPZ7jXljwcu1G9sfRyKh5ilA/wmDaSb41rlAqAiJqNFa/UCvfeB1lG7mBA?=
 =?us-ascii?Q?m0WK7xC+RuBXwk6BFGM5kUJX5DbeStmg+ZKya1shmW9bnibwH0jix9e4u/mk?=
 =?us-ascii?Q?DGrNET2LpVOZh/sK2rUyvP32sOuvfec3asV+gZhN5UucWsjcLSZywuAU/YOi?=
 =?us-ascii?Q?BWpNU81D4zaCa08oyBdnr4LQIicrCJe+?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Ht7EAG8o5tF9E3K5xMXr6b9rcNjn5teInCW8ETh+k2S+d7VmHeU27u6G8JVd?=
 =?us-ascii?Q?GPbF0B6xQl/YE6zZblTT+GrHvEGRcnKvpfLyxdA9NLGWcrYucRJO4ul2/hZE?=
 =?us-ascii?Q?K7hCIUfQ/5rqU+PhRuxQlnVe85OGnl6Khzq3YZJ8Amm7E5179B6IqsIAs0cn?=
 =?us-ascii?Q?kvKmEXPRuMF0dcdHqnCJp6PCZ+CSkVTF9EBeLocKns0jr8rb+hGTnzeddkw3?=
 =?us-ascii?Q?WNXicQ4E1zas1Fw/UdNvDcPxANSBH1z2h4rAfsAXnCDpo8C042NRBugQUOS0?=
 =?us-ascii?Q?z95o42sC8iqKCmrfPcetga3xvJ4HbZYVmkGu62kNPHNFuBFurYXmEft9GyKL?=
 =?us-ascii?Q?Gtz5pyihsYwNj7oj0A3XTmz0Ax/zkextJ7nzj6bxACb8tXipTUKfODdvwmgP?=
 =?us-ascii?Q?2McbOr3Hx0Kx+JwiThoFRyCDKhw+mOCWLYqSPr3vn+e5k8gS4LShrDB23oYB?=
 =?us-ascii?Q?LEphpdGldGh1HSEFSqaUlcHxQ4Akt5xePvSGD0Wt/yAgSZOBePXTUGcebocN?=
 =?us-ascii?Q?y2EYK4ymgUgowYG95Ip6G++5ZrKe1+p3kTrBkupZlx5FNSJnQu/6gGRPLfFw?=
 =?us-ascii?Q?UhiMaGF0DuqnAZIvYlid70UDQ88YReZHdDVgcHPrJ+iZAEU3KgRr/wzkdb5Z?=
 =?us-ascii?Q?2QcmTkaM8k3Ia20y4d0sYisz2QhmVO+Xqt9/4sWpB4iUu5xiAAcJUAJalwfe?=
 =?us-ascii?Q?WCG725GJ2Swk2iQePyMcmVEP+sPOpls3wWOMpyIQWCx6jSLx1EudnZ4qLRZI?=
 =?us-ascii?Q?Bf68zyh8J54Mq5FUETatSu5B134FsBfZUHf+LOaHXiRqnYJ2DjNTHAPQfwIC?=
 =?us-ascii?Q?8vamNkISWa8ExYjW4pRbszHJ2Af1MneyGvY3nI/oyUbG8Zl1ugTUTVY6BrUQ?=
 =?us-ascii?Q?niuztdhuA0DR5LbXPEhDhJpEN755ovGV/3ExrUwDhxez7HsXciMXkKnE+VKd?=
 =?us-ascii?Q?LmR2odHT6qivJKgmuvq992aSX8cmh9BJdCUAfytOW2eI8B42L0DwltWl+MFw?=
 =?us-ascii?Q?bJh6XkKT4Ef8mOMOBudT8rzoSQ2uw1OhsyfVSE22Jcn62aRueiTU+qcYjuiR?=
 =?us-ascii?Q?T+5J4UBQIkgZ0QSX+kXph6O4itPXbisub35x0/CMP6Xxl1D3X9uvQR7tNMa4?=
 =?us-ascii?Q?3tFP8ZMsFfNrqfHRgk6tfOHZBJPws57y9XDaFs6mKJfO7PxSSqjf+t0/zNpB?=
 =?us-ascii?Q?/Vwob419zXWnlfWTGD3EMQ6DswAY+lgwQAv8X37devmL26JcPohxDACOFv4v?=
 =?us-ascii?Q?VhVszd2Z25jQxdsorbiOjhd/VT+k0ziCr02s62wRV4xdV7g8NjFHWkRtCruC?=
 =?us-ascii?Q?EFPNja1XjzZSZtP4TFT1I+Ldoy/GG4TGm4Pwg8rWDnfni1OWg6dMBuasYMqd?=
 =?us-ascii?Q?U4niYJ4oukgMk58cKX0r8e1oc58xeTXnVoQNhA6mI2cru3SK0aoat1urxT/x?=
 =?us-ascii?Q?F9GDWS3av72aEomDMPTLdF3TXiM85+/q07skQqWz6dGqxMXl9OsxgWa7CxhV?=
 =?us-ascii?Q?x5Ve2w6LHoVvPE38LB/k9+dlJLMO32VzQa1Yjiw3xARqwb61ez2u402wNc+V?=
 =?us-ascii?Q?f6KHWg27GyMGJ22t2QPhCZuui3Un9r+zmSlOCJykv6o3vF3jwLCCSgzuiYEj?=
 =?us-ascii?Q?S5zLp+mofsmboqU5YN8Cjz/4J4BcYSmdx9DJySK1COhwvwRkiSzF/kcbfedi?=
 =?us-ascii?Q?kKC8ZagofuMtHzmRPhja0ksYeAkBPo+CIjpTqLurINEyZ/n4nyg2D2pZ0gZm?=
 =?us-ascii?Q?jh7cU59BCQIUH9Hb2aZXeqDv6RrVe3c=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ae310acc-5ff9-4956-ecf2-08de426b5fea
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Dec 2025 21:36:47.2306 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bLyYyuhj+HQDUsZreKCmKEs5TBEUU1cmXGE2DrwfTBJLZyK8UmS/axbAytDqP7U7wCatult3HuO69/St7SSO6g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6783
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

On Mon, Dec 22, 2025 at 08:20:00PM +0000, Jonathan Cavitt wrote:
> Use READ_ONCE and WRITE_ONCE when operating on ct->state
> to prevent the compiler form ignoring important modifications
> to its value.
> 
> Suggested-by: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc_ct.c | 7 ++++++-
>  drivers/gpu/drm/xe/xe_guc_ct.h | 6 ++++--
>  2 files changed, 10 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> index f2148a8bf208..dfbf76037b04 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> @@ -529,7 +529,12 @@ static void guc_ct_change_state(struct xe_guc_ct *ct,
>  	if (ct->g2h_outstanding)
>  		xe_pm_runtime_put(ct_to_xe(ct));
>  	ct->g2h_outstanding = 0;
> -	ct->state = state;
> +
> +	/*
> +	 * WRITE_ONCE pairs with READ_ONCEs in xe_guc_ct_initialized and
> +	 * xe_guc_ct_enabled.
> +	 */
> +	WRITE_ONCE(ct->state, state);
>  
>  	xe_gt_dbg(gt, "GuC CT communication channel %s\n",
>  		  state == XE_GUC_CT_STATE_STOPPED ? "stopped" :
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.h b/drivers/gpu/drm/xe/xe_guc_ct.h
> index 5599939f8fe1..767365a33dee 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.h
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.h
> @@ -30,12 +30,14 @@ void xe_guc_ct_print(struct xe_guc_ct *ct, struct drm_printer *p, bool want_ctb)
>  
>  static inline bool xe_guc_ct_initialized(struct xe_guc_ct *ct)
>  {
> -	return ct->state != XE_GUC_CT_STATE_NOT_INITIALIZED;
> +	/* READ_ONCE pairs with WRITE_ONCE in guc_ct_change_state. */
> +	return READ_ONCE(ct->state) != XE_GUC_CT_STATE_NOT_INITIALIZED;
>  }
>  
>  static inline bool xe_guc_ct_enabled(struct xe_guc_ct *ct)
>  {
> -	return ct->state == XE_GUC_CT_STATE_ENABLED;
> +	/* READ_ONCE pairs with WRITE_ONCE in guc_ct_change_state. */
> +	return READ_ONCE(ct->state) == XE_GUC_CT_STATE_ENABLED;
>  }
>  
>  static inline void xe_guc_ct_irq_handler(struct xe_guc_ct *ct)
> -- 
> 2.43.0
> 
