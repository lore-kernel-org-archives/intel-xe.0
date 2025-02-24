Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E713AC021BE
	for <intel-xe@archiver.kernel.org>; Mon, 24 Feb 2025 13:42:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5032910E3B8;
	Mon, 24 Feb 2025 13:42:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XOGiK//v";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B6D510E051
 for <intel-xe@lists.freedesktop.org>; Mon, 24 Feb 2025 04:00:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740369619; x=1771905619;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=SfpemNivdywMyl27uTkNoWswYhEdFHmkmFNnk8HeVy4=;
 b=XOGiK//vKys+cvcsbnmGlCHEuc36MtPZyrs3RPXIHmDFuR2+X2tUZEwC
 OhyMv8O/9UGr/cGd+pHW0FQltQhAGBwk0xAN1cAQLizR7aF0vNFYgpdNT
 Z/PwuLhmy6LZZheCsv53q8Ya56Xvo/0vJfW4rw8ZXT1g1CwzOYR0CVRB1
 Qa82TP0py7GRz7tKx+Vkv5mhB008gm7ow7xTn/xNF8+Ll/mwm5Q9iIIXB
 vOQc/qjxGJu4kxzFHLYTFGfyd+TRw52qATUo+qEnMhgvd6NHlnTw1fuFc
 /WtwphbluOQLx/A4blKcuLc4IhEAa4EgSsq67oVR6mrkn6Qp0BmRy+tYY Q==;
X-CSE-ConnectionGUID: xwN6p8OSR5OeBUl9JFHFYw==
X-CSE-MsgGUID: aO/hYboRTLCIxiHkx+WKzQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11354"; a="40960470"
X-IronPort-AV: E=Sophos;i="6.13,309,1732608000"; d="scan'208";a="40960470"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2025 20:00:19 -0800
X-CSE-ConnectionGUID: kVfkJa4VT2igVOu+zeodCQ==
X-CSE-MsgGUID: GSoOqzKMQ4ySTYkKVRyjBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,309,1732608000"; d="scan'208";a="115747826"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2025 20:00:18 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Sun, 23 Feb 2025 20:00:17 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Sun, 23 Feb 2025 20:00:17 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Sun, 23 Feb 2025 20:00:12 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VAS3dSFLV47k8RK/GjfWRFRmHdwznSnpr1DCKnBdDmkDjGI3aUkmczP0HgQ7eSfLn3zRBuONyV4z6hocwLL5FE6jRMijmD+DCuT/hCPYGwxskGcMNbKu/JgwoROl3g/AxgFpy2yFkIlpi+XJwmMNuD67RGGSa9zvmhbfbwhypPJsdQrwjmV83PrbEekp9N/sSbsfymasxXWJQeSrrj2H0c9GCT/IFtJ+Feg6fRBZfhNnz17YRvBgpLQSwHm0LvXy6i7pKG2A9RSEnpNcvuTxND7twuEJh6j65pUHjb34ZcDIGedhRiFdL7IYXf9m1VV1hxIZmEfESge5RdqTJMJ93g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hgvSAlPDlKj08GhDum+Yb1RPgVPkG4UuL9O8c3LKI8Q=;
 b=GHm4dIfkLj0A8xDiAkoVYao3kWVznFoTo/PlOGk1Td4CN+hB4ue/0j2oCGTE2KxvlItBMjEnK4YUdu6AQkFTxeZrqCJxsQIkigiYhjydowA1mMVPn7dk78sRDNBskQfInZYEuQEZ2k0OnhMwSjpP9Pxl6MAVJ1OdCvsM5y4yzH/0bGwl/w95CpGTvXf3MKpFHxt6QgTV3Umb07cmfbU/Cidbjlt+ZlyoSBjMotyDRYmpffxNj0I+O2OZJNfyuxp+h58bW62+9Nhs3Yn9/GVqF4TWlPWV3sSC88AmyaCD6SGgVglkCWJ/CrpuKc7YuL3Eu5QXGh2IBwHkxpMLP5chUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH0PR11MB4821.namprd11.prod.outlook.com (2603:10b6:510:34::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.20; Mon, 24 Feb
 2025 03:59:59 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.8466.016; Mon, 24 Feb 2025
 03:59:59 +0000
Date: Sun, 23 Feb 2025 20:01:03 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>, "Nilawar, Badal"
 <badal.nilawar@intel.com>
Subject: Re: [PATCH] drm/xe: Make sure scheduler is ready before submission
Message-ID: <Z7vu/0o/rrqVB5N+@lstrano-desk.jf.intel.com>
References: <20250220123859.291523-1-tejas.upadhyay@intel.com>
 <Z7i2szvi1T19KQnR@lstrano-desk.jf.intel.com>
 <SJ1PR11MB62049A747DD815101D9DEB7381C62@SJ1PR11MB6204.namprd11.prod.outlook.com>
 <Z7vsfEZsAotWoSmm@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <Z7vsfEZsAotWoSmm@lstrano-desk.jf.intel.com>
X-ClientProxiedBy: MW4PR03CA0062.namprd03.prod.outlook.com
 (2603:10b6:303:b6::7) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH0PR11MB4821:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e3ecdc4-f846-431d-653a-08dd5487b55f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?05Hf3V0e/baPWEADN9/ypRCgeAp/Fgoa0ED3eIdO+7vnp+Mqh3FFhxbSctsz?=
 =?us-ascii?Q?AiTNc33O+xGBZGDsh0ttNSmMt25/dTuCqOPGUgzUJQVVHgEC0vtxsbI8jHKG?=
 =?us-ascii?Q?AuvfEXuGKxWh87SAL8k4q1af1JQZ7DnLuinuz5SPJWs5Sr7rewY2yEeGLn4b?=
 =?us-ascii?Q?MoK5VoYQq/+mG3Bums8bAro23JeGKxT3mFbqlr+AcH96yr+cwi8mHNMFMbUO?=
 =?us-ascii?Q?H5u59EtYBUx07D08muLmDpltEq7ZLzBwFMPg5W+JR0vT0RwvT9NuuNY/R3Mr?=
 =?us-ascii?Q?6saIiMh1NjX/pFPPzZq/tYyIAufNNd7KrADzr3mDZAaOUj9m66VKQmcEeeXJ?=
 =?us-ascii?Q?osetfIbm4KJtt0JctZIrEQvh0Y6BQeM4PTnr64sFeJPdE4PVRlWSfD9WWY37?=
 =?us-ascii?Q?5n+GupdAkqMjxjz+aEnBpIDSlG8loFKtDIsyiuSn4UWbdqNtCa8jroqI0ufi?=
 =?us-ascii?Q?vSCVNPlmuWkNVEXKrPwSIbC3gY6khho/nshZXpYrMwtVh+/qY/wc67d95JNo?=
 =?us-ascii?Q?izmLq+mp8hVhPLejN7XS3cAQc/nuVkCcQOw5kv+f95t1y83wrw8m3jaBDLfG?=
 =?us-ascii?Q?iyThxjG6GFWE6pUECXcmtAN6E6+suycZxmkkUuqwgzMP4/riaP0QdlmT2l0H?=
 =?us-ascii?Q?Y1PXUmx57duMk4TIEpGYNtYCdJM+XKPH+bGQx87mRj9TnFce6kJkG/T4vvzD?=
 =?us-ascii?Q?Kmb3eP/kLP+gW0TRbnMNoZwZqCBbVR9AN+OlpbeFou+jnXKaB6cxLZCUy0tW?=
 =?us-ascii?Q?UMBmHvRs6zgizz4MoJW+KYQzpHNYkUx5jwEnMtxphOp8rZJS3HzN7dB7cw3n?=
 =?us-ascii?Q?abYNjQ+rv0zzLT9dbFxTehOVs6s2L50mwH2GTTy4vBXITPDBNKFjcb87eWiN?=
 =?us-ascii?Q?yNCLuwnqosRb4qmhMPzbVbNO1c32MElTvYxnkeMFdiD+YTDAk9CHlOITeswk?=
 =?us-ascii?Q?GlQdOUa4+H3t6vb3y/pLpSK40dczfJkJScMmBJ0hg3udPFrvHoMtIXmjFIz4?=
 =?us-ascii?Q?UEYhFdvqn1ZOFSYMF1LmMQ0jwJkdJiDvj+OuqaNymlw/GHjkwJu/C8+rr/dU?=
 =?us-ascii?Q?kV/JAjF2z9uc04Gp1qY5/Oj0c/AR91EyCJPkZoWXaJ86ruKQIhoEZM1vD4UJ?=
 =?us-ascii?Q?49ennyfgAGlhBIJpB2qXOCu7ThzKyYkMFyHVUVdVdrW5Z0EzM/mLZQNWr88V?=
 =?us-ascii?Q?mIIJ3CQFE5bkuXjxTu9dAuGEjt+dUyu+SR+Zc3zQFkZqIQJWWslfPJQOb+sx?=
 =?us-ascii?Q?D3fGc1sP6jkH6rzb1ZH192HC0TvZL4X7QPCG3X47joBnpCwd2u8EyyZz/oso?=
 =?us-ascii?Q?t0ZXclNKvoJf64BfgT6lQJ90iqlEZsxet7LjjM0QIGArAw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?EsvGZsLn2rddC05cc+2Lqtfk9BD/rhIdU61R62Q4ffD07CG/jcfIqQPCBZWc?=
 =?us-ascii?Q?PMTl7jQj0FBuKcSOcSETfuwF/g4o3MRDXQ8X6WbBihZs3mRZga24evUe4LPw?=
 =?us-ascii?Q?RinrEOT4PcGeWd3qrP3SRiw8stBYtR05PigZlLfkNUJLigBSXZ68FN/mtYYi?=
 =?us-ascii?Q?FfRPdJeHJ3H1YZub8gPuHkQ7NBuKCPBQ3DzwSWyH+g9mhMtBhG4K1poFd/xJ?=
 =?us-ascii?Q?15sEIyMzirVWbhXB9PwTEQfwgcHGSGUzz1V4L9jZKfnSjG2/nYQfkAbcr96C?=
 =?us-ascii?Q?dZp/N76Ie6DAgbjv+raRvSelqB7uH/9STIpiZ5Mkzs7F1ZLHM7BReeUjJB56?=
 =?us-ascii?Q?PqmqqqBguabcDOroCVr2gD1COeJrNB86d2zxf+EKnIMWq+g//jGX9R1XNL2x?=
 =?us-ascii?Q?++VxTwcGAwi31HFtOMELtqzW/TrVZ/oVC/CooGXLWAyuhLBuLdxqq0i3iWAQ?=
 =?us-ascii?Q?aYM0xXLdz78cMHbt1n0RFWgd3vLoCRrqJnKjGz+hEqBcyDOaARlS3fnNqGlO?=
 =?us-ascii?Q?vOcQg1/KR2Tr5PynSkOMc9tjm+XWvh+O0ofKAvyZrs2brhez7ZtKoGdpQ6f2?=
 =?us-ascii?Q?dtiAwyPL2mMa02ofCZLamWqzSQLD4REIR7cv21yoqntwnF9DBMJizcABpWcw?=
 =?us-ascii?Q?oGHODZkAEbXLV88lsvPxYFJnZDUVHg8CymyvvekPgvxrr1zVSOrakv3oGEc8?=
 =?us-ascii?Q?0Czax9uoeGSfHJSzxOo/CWmIyO8tH1hFlU3/rpEB9uFxbaBudd7rikH2vVMX?=
 =?us-ascii?Q?PVPXBM8KHmZynTEAp64fUKm08DNfTabx5rGcc6MPs687YJpDse+dRiRWcT6T?=
 =?us-ascii?Q?jOVcDzI4a46D6UXnYIDNWHx8m5Cum/3p0qNFB8SRpggVMeFvoEcB5ywKSWTU?=
 =?us-ascii?Q?MZIFaq0s4WJ1hiWHv4mFpwsueOdac10QeWryTNqt6vbExm19QAhq5ovCfhxz?=
 =?us-ascii?Q?U+5wYrFDSzwicEvLavy5BLeNQkdGP0iMbst2VI2dAk4ku0JFi6P14sYDALuT?=
 =?us-ascii?Q?/EQUd/F0tzxBPjFQ5N2V7JpMW19muz0jKUWhiDBxa47rXT0yPVfz6L7io6QY?=
 =?us-ascii?Q?rQ1gNsak3ctgoZgRz/vi7o7mVMPEZwxLgFbOTQmdCJFqFw4GTe1olEi7+Nk2?=
 =?us-ascii?Q?aru5fWRgILsUVBnR4OqlMX7rc7q4WJNdnRK/uMusDVi+oQd3jWsPFLwffpN5?=
 =?us-ascii?Q?Ec91te/NRT6FhYhWNEEv05qXzj21z8e+XqdFL0R9re8TyUbJ3gtIX62Gae1z?=
 =?us-ascii?Q?CfQFPHk0xkVupnwObBpp9Z73Ubf3AWd7gvTt9efvkRc7OsG/ink6jC98HKng?=
 =?us-ascii?Q?j9K64XHIg2gioLnVvbbIozAzZdfkNbntOLtoQHXUjSVNNbk593Kt1XMa7lK3?=
 =?us-ascii?Q?xqIf5MOegIyiZh3wPFaHiLTAcSz7DHCdkuGlI6whkmM1+/8dUtCaJVX93hPn?=
 =?us-ascii?Q?Lzxc+PGGItB2ZYqXa3iXCX+w2tR2RR4uspxVo89N/ezkQNfr9sTKLolAM393?=
 =?us-ascii?Q?bgP7aYkD9yO+sGezzDbD57oUhvgPIbsvuDmKh93OpmZ0UiLkGz4B28C0M7Vz?=
 =?us-ascii?Q?IfizXRnlWdFdZU0WppEL+9TsUSlKfDAV3x/DiC6jGAIeRwS0k0fn0qVBWGjx?=
 =?us-ascii?Q?ig=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e3ecdc4-f846-431d-653a-08dd5487b55f
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2025 03:59:59.8153 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +shjArXdNbfNGyEjDFyyVUZm3RryI1luRZSankNJwlFd6gfMKoKoWvnH6is3DzgnfpjXEIHXZukEu6Kgq1YvIQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4821
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

On Sun, Feb 23, 2025 at 07:50:20PM -0800, Matthew Brost wrote:
> On Sat, Feb 22, 2025 at 12:17:51AM -0700, Upadhyay, Tejas wrote:
> > 
> > 
> > > -----Original Message-----
> > > From: Brost, Matthew <matthew.brost@intel.com>
> > > Sent: Friday, February 21, 2025 10:54 PM
> > > To: Upadhyay, Tejas <tejas.upadhyay@intel.com>
> > > Cc: intel-xe@lists.freedesktop.org; Ghimiray, Himal Prasad
> > > <himal.prasad.ghimiray@intel.com>; Nilawar, Badal
> > > <badal.nilawar@intel.com>
> > > Subject: Re: [PATCH] drm/xe: Make sure scheduler is ready before submission
> > > 
> > > On Thu, Feb 20, 2025 at 06:08:59PM +0530, Tejas Upadhyay wrote:
> > > > Async call to __guc_exec_queue_fini_async frees scheduler while some
> > > > scheduler submission would have already started.
> > > > To handle such small window race case, submission should only start
> > > > when scheduler is ready.
> > > >
> > > > It will help to solve below which is not easily reproducible,
> > > > https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/4223
> > > >
> > > 
> > > I don't think this help. We can only enter xe_sched_submission_start if exec
> > > queue is in &guc->submission_state.exec_queue_lookup and remove the exec
> > > queue under a mutex in release_guc_id before we call xe_sched_fini which flips
> > > the ready state to false. We then immediately free the scheduler - we'd be
> > > getting a UAF in xe_sched_submission_start anyways.
> 
> This assessment isn't exactly correct. Rather we should not be calling
> start after we call stop in xe_exec_queue_fini. 
> 
> > > 
> > > The gitlab issue looks like a memory corruption. Basically it is saying a variable
> > > which is a bool is reading 107 which shouldn't be possible.
> > 
> > It gets issue, while accessing drm_sched_rq *rq, look at below,
> > 
> > static struct drm_sched_entity *
> > drm_sched_rq_select_entity_fifo(struct drm_gpu_scheduler *sched,
> >                                 struct drm_sched_rq *rq)
> > {
> >         struct rb_node *rb;
> > 
> >         spin_lock(&rq->lock); --> here it crashes
> > 
> > Async free of sched_rq happens at,
> >  void xe_sched_fini(struct xe_gpu_scheduler *sched)
> > {
> >         xe_sched_submission_stop(sched);
> >         drm_sched_fini(&sched->base); --> here it frees sched_rq and marks sched_ready = false)
> > }
> > 
> > It looks like inbetween drm_sched_fini and xe_exec_queue_fini we are hitting this issue, which might be avoided with check mentioned here in patch. I saw similar check being done but other drivers look below in drivers/gpu/drm/amd/amdgpu/amdgpu_job.c,
> 
> We shouldn't be calling start after xe_exec_queue_fini here. If we are,
> that is the bug.
> 
> >                         if (amdgpu_ring_sched_ready(ring))
> >                                 drm_sched_start(&ring->sched, 0);
> > 
> > 
> > Dump stack details :
> > [ 1481.378550] ==================================================================
> > [ 1481.385791] BUG: KASAN: slab-use-after-free in __lock_acquire (kernel/locking/lockdep.c:5089)
> > [ 1481.392598] Read of size 8 at addr ffff88812352a7a0 by task kworker/u128:11/2827
> > 
> > [ 1481.401506] CPU: 17 UID: 0 PID: 2827 Comm: kworker/u128:11 Not tainted 6.13.0xe-ptl+ #1
> > [ 1481.409475] Hardware name: Intel Corporation Raptor Lake Client Platform/RPL-S ADP-S DDR5 UDIMM CRB, BIOS RPLSFWI1.R00.5045.A00.2401260733 01/26/2024
> > [ 1481.422824] Workqueue:  drm_sched_run_job_work [gpu_sched]
> > [ 1481.428348] Call Trace:
> > [ 1481.430803]  <TASK>
> > [ 1481.432913] dump_stack_lvl (lib/dump_stack.c:123)
> > [ 1481.436589] print_report (mm/kasan/report.c:379 mm/kasan/report.c:489)
> > [ 1481.440206] ? __virt_addr_valid (./arch/x86/include/asm/preempt.h:94 ./include/linux/rcupdate.h:964 ./include/linux/mmzone.h:2058 arch/x86/mm/physaddr.c:65)
> > [ 1481.444511] ? __lock_acquire (kernel/locking/lockdep.c:5089)
> > [ 1481.448527] kasan_report (mm/kasan/report.c:604)
> > [ 1481.452141] ? __lock_acquire (kernel/locking/lockdep.c:5089)
> > [ 1481.456181] __lock_acquire (kernel/locking/lockdep.c:5089)
> > [ 1481.460030] ? check_chain_key (kernel/locking/lockdep.c:3967)
> > [ 1481.464137] ? __lock_acquire (kernel/locking/lockdep.c:5240)
> > [ 1481.468240] ? __pfx___lock_acquire (kernel/locking/lockdep.c:5077)
> > [ 1481.472604] lock_acquire (kernel/locking/lockdep.c:467 kernel/locking/lockdep.c:5851 kernel/locking/lockdep.c:5814)
> > [ 1481.476331] ? drm_sched_run_job_work (drivers/gpu/drm/scheduler/sched_main.c:344 drivers/gpu/drm/scheduler/sched_main.c:1068 drivers/gpu/drm/scheduler/sched_main.c:1199) gpu_sched
> > [ 1481.482099] ? __pfx_lock_acquire (kernel/locking/lockdep.c:5817)
> > [ 1481.486292] ? lock_acquire (kernel/locking/lockdep.c:467 kernel/locking/lockdep.c:5851 kernel/locking/lockdep.c:5814)
> > [ 1481.490143] ? process_one_work (kernel/workqueue.c:3212)
> > [ 1481.494360] _raw_spin_lock (./include/linux/spinlock_api_smp.h:134 kernel/locking/spinlock.c:154)
> > [ 1481.498061] ? drm_sched_run_job_work (drivers/gpu/drm/scheduler/sched_main.c:344 drivers/gpu/drm/scheduler/sched_main.c:1068 drivers/gpu/drm/scheduler/sched_main.c:1199) gpu_sched
> > [ 1481.503825] drm_sched_run_job_work (drivers/gpu/drm/scheduler/sched_main.c:344 drivers/gpu/drm/scheduler/sched_main.c:1068 drivers/gpu/drm/scheduler/sched_main.c:1199) gpu_sched
> 
> This worker is flushed via xe_sched_submission_stop in xe_sched_fini.
> Again we shouldn't be calling xe_sched_submission_start after this. If
> we are, this is a bug. We'd still get a UAF if we did this too as the
> scheduler memory is immediately freed after calling xe_sched_fini too.
> 

Maybe add a cancel_work_sync(&ge->sched.base.work_tdr) in
__guc_exec_queue_fini_asyns before calling xe_sched_fini.

Matt

> Matt
> 
> > [ 1481.509428] process_one_work (kernel/workqueue.c:3236)
> > [ 1481.513477] ? __pfx_lock_acquire (kernel/locking/lockdep.c:5817)
> > [ 1481.517693] ? __pfx_process_one_work (kernel/workqueue.c:3138)
> > [ 1481.522275] ? __list_add_valid_or_report (lib/list_debug.c:32)
> > [ 1481.527155] worker_thread (kernel/workqueue.c:3311 kernel/workqueue.c:3398)
> > [ 1481.530966] ? __pfx_worker_thread (kernel/workqueue.c:3344)
> > [ 1481.535243] kthread (kernel/kthread.c:389)
> > [ 1481.538510] ? kthread (kernel/kthread.c:374)
> > [ 1481.541824] ? __pfx_kthread (kernel/kthread.c:342)
> > [ 1481.545569] ret_from_fork (arch/x86/kernel/process.c:147)
> > [ 1481.549203] ? __pfx_kthread (kernel/kthread.c:342)
> > [ 1481.552986] ret_from_fork_asm (arch/x86/entry/entry_64.S:257)
> > [ 1481.556918]  </TASK>
> > 
> > [ 1481.560615] Allocated by task 8713:
> > [ 1481.564099] kasan_save_stack (mm/kasan/common.c:48)
> > [ 1481.564104] kasan_save_track (./arch/x86/include/asm/current.h:49 mm/kasan/common.c:60 mm/kasan/common.c:69)
> > [ 1481.564108] __kasan_kmalloc (mm/kasan/common.c:398)
> > [ 1481.564112] drm_sched_init (drivers/gpu/drm/scheduler/sched_main.c:1314) gpu_sched
> > [ 1481.564121] guc_exec_queue_init (drivers/gpu/drm/xe/xe_guc_submit.c:1445 (discriminator 6)) xe
> > [ 1481.564349] xe_exec_queue_create (drivers/gpu/drm/xe/xe_exec_queue.c:152 drivers/gpu/drm/xe/xe_exec_queue.c:183) xe
> > [ 1481.564563] xe_exec_queue_create_ioctl (drivers/gpu/drm/xe/xe_exec_queue.c:687) xe
> > [ 1481.564777] drm_ioctl_kernel (drivers/gpu/drm/drm_ioctl.c:796) drm
> > [ 1481.564859] drm_ioctl (drivers/gpu/drm/drm_ioctl.c:894) drm
> > [ 1481.564937] xe_drm_ioctl (drivers/gpu/drm/xe/xe_device.c:210) xe
> > [ 1481.565149] __x64_sys_ioctl (fs/ioctl.c:51 fs/ioctl.c:906 fs/ioctl.c:892 fs/ioctl.c:892)
> > [ 1481.565154] do_syscall_64 (arch/x86/entry/common.c:52 arch/x86/entry/common.c:83)
> > [ 1481.565159] entry_SYSCALL_64_after_hwframe (arch/x86/entry/entry_64.S:130)
> > 
> > Tejas
> > > 
> > > Matt
> > > 
> > > > Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> > > > ---
> > > >  drivers/gpu/drm/xe/xe_gpu_scheduler.c | 8 ++++++++
> > > >  1 file changed, 8 insertions(+)
> > > >
> > > > diff --git a/drivers/gpu/drm/xe/xe_gpu_scheduler.c
> > > > b/drivers/gpu/drm/xe/xe_gpu_scheduler.c
> > > > index 50361b4638f9..42ca3c4a299a 100644
> > > > --- a/drivers/gpu/drm/xe/xe_gpu_scheduler.c
> > > > +++ b/drivers/gpu/drm/xe/xe_gpu_scheduler.c
> > > > @@ -80,6 +80,14 @@ void xe_sched_fini(struct xe_gpu_scheduler *sched)
> > > >
> > > >  void xe_sched_submission_start(struct xe_gpu_scheduler *sched)  {
> > > > +	/* Async call to __guc_exec_queue_fini_async frees scheduler
> > > > +	 * while some scheduler submission would have already started.
> > > > +	 * To handle such small window race case, submission should only
> > > > +	 * start when scheduler is ready.
> > > > +	 */
> > > > +	if (!drm_sched_wqueue_ready(&sched->base))
> > > > +		return;
> > > > +
> > > >  	drm_sched_wqueue_start(&sched->base);
> > > >  	queue_work(sched->base.submit_wq, &sched->work_process_msg);
> > > }
> > > > --
> > > > 2.34.1
> > > >
