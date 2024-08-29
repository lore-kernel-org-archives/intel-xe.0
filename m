Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C84CCA0EC7
	for <intel-xe@archiver.kernel.org>; Thu, 29 Aug 2024 22:37:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA3F110E7A5;
	Thu, 29 Aug 2024 22:37:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="X4IDERMn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EABD810E7A5
 for <intel-xe@lists.freedesktop.org>; Thu, 29 Aug 2024 22:37:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724971053; x=1756507053;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=2oRmh1sYnP7zai14wl8hzZyQxZ/wtfjlGXZhmKDgz/8=;
 b=X4IDERMnjwXHG6XMZ3JdVyVKuceL9XudTvsg3YFmzDTa6vJq/bcM6D2r
 upnueg7BLpL934gqpn2mCIcGgDkRkWNGnZbcBEdECZZfY+KkUd3Wi8ovX
 nxaWdSHR6MG6Kf40QH5SS7Se6yYaqur2OOBRGaa1R2qaasDkheZVd6YcC
 0FakMbsTqukNzTm7ktUgqLZJqIKaP5G4gtv7/eK/W1jcIOKQ9fb0FeJuP
 vy5yvfRO6YMLL18bKWkxOrXuksMlUBTzuTTAI3evQt/W4siwj5aeRhh3i
 1hhBfLVoFwULZjwpjASstYM2NaSHVZH1G5Zp25dMSEc71mMWse+yeB+LS g==;
X-CSE-ConnectionGUID: Dhiux/7tQzW8XP84Wl1i3w==
X-CSE-MsgGUID: Bn0EwF8MQH2dPuAjVwaguQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11179"; a="23480898"
X-IronPort-AV: E=Sophos;i="6.10,186,1719903600"; d="scan'208";a="23480898"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2024 15:37:32 -0700
X-CSE-ConnectionGUID: 41MYWuHaTQi8W6p19MLdRg==
X-CSE-MsgGUID: n1QLzdEOQc+212VgJ1X0xg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,186,1719903600"; d="scan'208";a="68380690"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Aug 2024 15:37:34 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 29 Aug 2024 15:37:32 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 29 Aug 2024 15:37:32 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 29 Aug 2024 15:36:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WKxpbrbxXG+835FUrlbtWW11ur0xD+q5YVPHab690jrGQnBsMPwAdPor3XOfcTkQMz1Aif7pUzkurGTlH7sgZIZVd5YvHMTfQwb6J0gc3dq3/hZCU4FdT4Vh8LKjrdFKIE9VFLKjj/My1KHclUQvYNWiRpl8D0QL4qIqIxEKL3eRFnZ+HZWW5XEGs7YvtbVcvH1cx3s0mGWB2hGFPeAkYQsFRxacpd1McPxA7f9ObO7+CaL8TtBzsAWC9WeyqeL7ieRHl9sBAa4Y4gz/RYUQuBfb4hNiUW+tG63zm5YiEAEcjRTJqRhrQsx9WxiQ9qPTj/BGM2w9QeX2dvt9DGpHog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7mum/CdT/RnjiAaZNNUU6Og5ol1CxGnNkJADucg8XKw=;
 b=PjXxQMV+xADL3kKSmL7ziCtu3SskWf9HGX0kckT87vl7rq9lzqPHlvD07bBxyF7oGQSYDL7TYtgJq0RSgRnB6XGhR1Kl7vg+Gnp0JDKAB+JvNupUyGX7ALF+tWmnYBrq1ki3gq+lQFKjzyozcG54u4OkZzZ8QkW5KWGu2qM1tUykGOf9xuOpY2M4wo040ie8bzsWRN/V69mI8sTHY2fl06OFcPSJfh6NKMMHcEf3YAMTXVIC6yGOpTQnEVNZxvikyoXq1OiL/M2VcRTF/Ca0uYEkZYz4KJEJQkVpo7Svcn3sTgJSfbs+L8enVzb8bpbM3jw3TTIjNuT5eL1HRZts4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA1PR11MB8428.namprd11.prod.outlook.com (2603:10b6:806:38b::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.28; Thu, 29 Aug
 2024 22:36:46 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.7875.018; Thu, 29 Aug 2024
 22:36:46 +0000
Date: Thu, 29 Aug 2024 22:35:18 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe: Add missing runtime reference to wedged upon
 gt_reset
Message-ID: <ZtD3pnQGG/Rg2QDH@DUT025-TGLU.fm.intel.com>
References: <20240828173256.182364-1-rodrigo.vivi@intel.com>
 <b54629d9-44ed-4bda-8b54-f53eaee85bc4@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <b54629d9-44ed-4bda-8b54-f53eaee85bc4@intel.com>
X-ClientProxiedBy: SJ0PR03CA0072.namprd03.prod.outlook.com
 (2603:10b6:a03:331::17) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA1PR11MB8428:EE_
X-MS-Office365-Filtering-Correlation-Id: 72bb2a7e-c87b-4bf5-a1b4-08dcc87b1048
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?qHaNC1KpRV7sD022Mt4eMy2jMwQkJad0A8WKMZQj/TnulNe1Z/j/vNWcPglh?=
 =?us-ascii?Q?NNMFpt28CImhRFfEtetiKAvcCjOn6un8JoI+WLLXFVn3qmWfaloH0eLnMieQ?=
 =?us-ascii?Q?D4XMOVnZWsxWh7roCqTy2io20ZpVVnmVqwVecpnNswspsgEpgOGcVdoQ34H/?=
 =?us-ascii?Q?vjiAMhxpyK7TUXxTc6MVNEWG7mlRdHn1rg/s/7gqv/rKc4tFkJ7SaE6UejtT?=
 =?us-ascii?Q?wsbapvad4FJTzcEjJRVsiy9Jjl3dm7+pF4p3RottaQ3WGpR1xgDU4PJuWd9r?=
 =?us-ascii?Q?s1CzScum6bmX9ftzjaf/HlZQ5J44Ng6KBxjiAjDYZR4A5TV1m8unGje3jtzj?=
 =?us-ascii?Q?6g+Gfu3by1a13m2AIeZECmBMGnrqmi8nHgx/JNUep9Bn0HlyXeSsjPovtj7W?=
 =?us-ascii?Q?BwR5cIxhn4ZPJyKJkkhCXfr5YDsKF6SvS78ogSvXZb5bTkRoVuMxYA+8r0aI?=
 =?us-ascii?Q?Hlf06HE8YcLUNj8lToN8UaQmKvAFu1brx0X4bQ+F3VVHIekxlqmgtnQMLcNI?=
 =?us-ascii?Q?HqIhcaPZVhJw3CFrWxzzJfQpJORCPa+MM8HHXctTMQlKE3xE2iNpG2S6Wgvm?=
 =?us-ascii?Q?mNW3jC3KqM+tVsmrM1x/Ikm3bY+oNPmvTjzF7fE2WMousZpup4zRz3b1AvWF?=
 =?us-ascii?Q?1wYWkEz9Nx3MiDSXlABc+c8KAy4zG0lnjUDU/bPMx5oOeki0ivC940BKsPCV?=
 =?us-ascii?Q?29vJmqjb8YGKgUcLfPcGW+8+G06Tu6hD3r+7KmxdMqY6iHwVRbexKvy5/e3W?=
 =?us-ascii?Q?nTzccXfHTGA3vKJKZmtwLp34tMq6/9ikWtBW6p/8Rk+AmqkQxADozoT6EPKX?=
 =?us-ascii?Q?bOMl2abpy6BYezAaEcZxgxDlvgPHFLYV5LGyfY9/gx/OM8wID8Mj9NfnbL7f?=
 =?us-ascii?Q?PmyBI/3miOsZJIp0djD1O2QdCd36r3h5mrjO1KqjfaX9h+tMk0vo8eRP3XpZ?=
 =?us-ascii?Q?pY7UIscF+VRbIKgZo192uftgppUeoU1y1Tu49tV+tUTLmeaQxokWF7VyGmEM?=
 =?us-ascii?Q?vkdnXdauyTcfmzVCch6s9eN/NeBUi9Qnx+N55iI6zkpPXks2cTEkBoRU/rdz?=
 =?us-ascii?Q?YB20sAc45ckVgHm4uAH/JB3a2GoF8uRI7aMQ6n7anUY2yERWNjyaHDQbqlkX?=
 =?us-ascii?Q?WcEgILGQqk9DV7Kn174opSYTZLFPWzenwpxMqlYK9mubCH9vEzfDVnidpZr2?=
 =?us-ascii?Q?mXbIcZ1F9+3bdYy1UtTzHCL6T79YKwxS0f6nMPUcQ6odkgEuocgfwL90NsaC?=
 =?us-ascii?Q?psGrd6RsbYiQB7QGh+iflzlzRa5JW9eGxyHtzOcR1IW797c1GvuPJ6uux2aw?=
 =?us-ascii?Q?84659xAkjY7ctPVMWmCXNr6sp5rWoyhXUR/3XlPWtGKlMw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1NCBs2TE/i9+sdvICOWhWRus4CbILb5ESywcrwbOdgJcrxUpilcNTdTGmNeF?=
 =?us-ascii?Q?K5GEtwP67WzORvhvyBq1OHrgXI/rQ3PGetfHCiqKKKHGsECFuN65NqObAmo5?=
 =?us-ascii?Q?DcGdPJk0h8N03psmdgFTGtI5Wf3+4gXI9oIICt2IuSi+t78zacY6CFRDAEQJ?=
 =?us-ascii?Q?eiAC4UiVc17U+Jo/55s0hG91p9chltAVJ8kaqRfu1Pi32wE5NCWmbfcZtb8B?=
 =?us-ascii?Q?wjlOFIV6tMD7FkgUS+1Gqheuz9WbCRDPB72en8eIAK3hTuZGYOkmPgl9B8EJ?=
 =?us-ascii?Q?NhEbYvr4ikQFkDypbNyFto10ANC8e7P7DoEsHeLfyFiYcBpAJi5tcAZ+WoJM?=
 =?us-ascii?Q?kV+ekeUWEoaopmZIiusjfquPnvzH1AD9IOj4ebhfnGE4rapcC51HCEAcvepa?=
 =?us-ascii?Q?S9X4w9Uw2Y5ld+hzP94JWtwECNBx57Qfq4UhM2jcP1NfRnFbefl6HNm24nnG?=
 =?us-ascii?Q?MFXQ6011kHXg2M0iH/RXyGO+Bwme/CFjm2BzZ2H4MxJ1tiZjRKxRrORlrOoU?=
 =?us-ascii?Q?oJU11dOodjf70kii9nlHMZsc/gPig2b3q6tN3UmyAxmoD8J1iz7tsuHnFf58?=
 =?us-ascii?Q?EcsXa3NIFNRC6j54yYG7BLoTjbm3avCgfbNCkTi8u7HeXAjtxFvWMwGFTQ0C?=
 =?us-ascii?Q?D77XMHyLKzV1dgbKbf7jqE6jdJU45v3PN/0wdxGDelJ91L3+fhPSpJmBhAud?=
 =?us-ascii?Q?1+iwl9uOmuX2mrLEcRM/EfLbvPXuIt0SdF5UnRfqxhqmfr4wFRl/ZAhllQL5?=
 =?us-ascii?Q?C22wSaWto+PYsOllZ0qBrJ40shNn8WBZP+syxwysFatj9lb2hPQIcMBMgaOC?=
 =?us-ascii?Q?KbpglL4fNAKgL2P6y+iqdDrFXjAXFrrfsvqyXyjFvOXyY4g9/zfJTj/deu+g?=
 =?us-ascii?Q?k8VDusNFmNjp41xGv71Y5Mg1bftr85ORGBe71huL0ecYQaKzX6uquKkj9RUK?=
 =?us-ascii?Q?az4y3y+RHs/1cDnMdpoJpMnR/0jEKw1URMOA5DE7P1XBUDWTMMvUUUoyTgsL?=
 =?us-ascii?Q?5XPWUI7pAU7E80Czz3DUo2WhXXza5Vicr4zALrTKpNCfl9MQpfcJnftrYDCZ?=
 =?us-ascii?Q?jl4BNzj8bbZa5DMH6dE8W00MUISlmgZdKokfMUjfSAhkG/0MirICdvhyTNCx?=
 =?us-ascii?Q?DcyFaU5+FJbe/DgBjPRN4zQVaX5zNqQlYRmPAldgCGYTHmG5kfM2UFgibHU/?=
 =?us-ascii?Q?acd783jpwaIK1YejvDPltn1JlgcPrKvelsh51uORdD8SkKdV4LMRIWcvw4U7?=
 =?us-ascii?Q?ZhZ2SF5BSzie46ozQvRmdcrpo00RqmQqLCWu8aPOSV2dSzVzJJvaPr+Gl9QJ?=
 =?us-ascii?Q?LZL992Slo9/wXFd/qk1aUdViAAM2XeyET5IJkzcXjzlyOxcqvSWmVvNxQ7Tf?=
 =?us-ascii?Q?scB9aTZbvRQHjcHGfI80LNl2QjY76AnmaYvjWMuCvsYHDlasYYPMQI7GXjLH?=
 =?us-ascii?Q?fYNjWorTJQVDWgWG+4s2G+vOb8cQmAdLrGk1OGqU3TYZk3txiE9S4LKTEnLz?=
 =?us-ascii?Q?bgRLPuYa8aV022Pt/2Onuaxrrj0uU+4zU99cPKOyvxIY6ftZD1zzxkKAj1pN?=
 =?us-ascii?Q?FvB+bNBr3FIc+nXp5xDlHSnKUzqJWbY9v8nr9xkw5IjKZycHXgQ1IAgDJXch?=
 =?us-ascii?Q?Dg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 72bb2a7e-c87b-4bf5-a1b4-08dcc87b1048
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2024 22:36:46.0549 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U0vsCwHuEGuBWiZYvTSkrW/srv2MH7LrebRlKuoX7UYajH6nRDTqFwvJ798Ri2xfSSRcLQZKzLKdxKrPOVVRSg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8428
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

On Thu, Aug 29, 2024 at 12:01:01AM +0530, Ghimiray, Himal Prasad wrote:
> 
> 
> On 28-08-2024 23:02, Rodrigo Vivi wrote:
> > Fixes this missed case:
> > 
> > xe 0000:00:02.0: [drm] Missing outer runtime PM protection
> > WARNING: CPU: 99 PID: 1455 at drivers/gpu/drm/xe/xe_pm.c:564 xe_pm_runtime_get_noresume+0x48/0x60 [xe]
> > Call Trace:
> > <TASK>
> > ? show_regs+0x67/0x70
> > ? __warn+0x94/0x1b0
> > ? xe_pm_runtime_get_noresume+0x48/0x60 [xe]
> > ? report_bug+0x1b7/0x1d0
> > ? handle_bug+0x46/0x80
> > ? exc_invalid_op+0x19/0x70
> > ? asm_exc_invalid_op+0x1b/0x20
> > ? xe_pm_runtime_get_noresume+0x48/0x60 [xe]
> > xe_device_declare_wedged+0x91/0x280 [xe]
> > gt_reset_worker+0xa2/0x250 [xe]
> > 
> > Fixes: da4b21f402c6 ("drm/xe: Add missing runtime reference to wedged upon gt_reset")
> 
> Hi Rodrigo,
> 
> fixes tag looks wrong, "drm/xe: Add missing runtime reference to wedged upon
> gt_reset" is this patch.
> 
> 
> > Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> > Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > ---
> >   drivers/gpu/drm/xe/xe_gt.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> > index 224c137967c3..a895704bf64f 100644
> > --- a/drivers/gpu/drm/xe/xe_gt.c
> > +++ b/drivers/gpu/drm/xe/xe_gt.c
> > @@ -794,11 +794,11 @@ static int gt_reset(struct xe_gt *gt)
> >   	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
> >   err_msg:
> >   	XE_WARN_ON(xe_uc_start(&gt->uc));
> > -	xe_pm_runtime_put(gt_to_xe(gt));
> >   err_fail:
> >   	xe_gt_err(gt, "reset failed (%pe)\n", ERR_PTR(err));
> >   	xe_device_declare_wedged(gt_to_xe(gt));
> > +	xe_pm_runtime_put(gt_to_xe(gt));
> 
> 
> AFAIU, this looks incomplete, xe_pm_runtime_get() should also move before if
> (xe_fault_inject_gt_reset()).
> 

Agree with Himal.

Matt

> Thanks
> 
> >   	return err;
> >   }
