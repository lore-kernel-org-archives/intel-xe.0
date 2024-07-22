Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 738BFC3DA59
	for <intel-xe@archiver.kernel.org>; Mon, 22 Jul 2024 19:00:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 785DF10E192;
	Mon, 22 Jul 2024 19:00:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TQYUJ3gZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A45210E192
 for <intel-xe@lists.freedesktop.org>; Mon, 22 Jul 2024 19:00:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721674832; x=1753210832;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=/pvWxr/LHjsGk+Hhj0CMQ4gCPjzaIbl/hDyhraJhvV8=;
 b=TQYUJ3gZvwz/FrsUBEdIyifMZ1NZjvglsIWv+VVgznKXhP76jErKNaIc
 VgVx8JmNxvf7SicZ1cyfU0XDo1YfQV62q1cLBX1ZQYzAoTwuEo5SodgRZ
 8+W3piqMqGd6tDUTtB8KfQcR+6tQYQjG3WaervuPQrdLwPljSrBfC51B4
 VX07drTNiH9+ZP6LNI+G3Y+yRv/9BQXb7ecu9v0ZK/zqU1ePnPRjTf3ii
 5E08mskiuh8OQHDjD8omYqdyUxwkzEW/jBLyJ9QbDUrkajW6a9j4HLoni
 RvjZHsnlE84hKlzDWQpSnNxz3LrNnh7g2DxDNZkfrp9Z1j4vClcDqt0zr A==;
X-CSE-ConnectionGUID: norCWAfnRxqngNHzS6snvg==
X-CSE-MsgGUID: NtqFvOqOQDS7mdS6Btg9nw==
X-IronPort-AV: E=McAfee;i="6700,10204,11141"; a="36707241"
X-IronPort-AV: E=Sophos;i="6.09,228,1716274800"; d="scan'208";a="36707241"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2024 12:00:32 -0700
X-CSE-ConnectionGUID: AZa6Py/3QqaglcK4HlV9XA==
X-CSE-MsgGUID: vyXdo4g9R+Gzm600TnsWPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,228,1716274800"; d="scan'208";a="82993540"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Jul 2024 12:00:31 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 22 Jul 2024 12:00:30 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 22 Jul 2024 12:00:30 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 22 Jul 2024 12:00:30 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 22 Jul 2024 12:00:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J6vKuStHRtjYbLhFenJ3kmzFoymUfd+bvpc6QgyryESJVroNIGe87Fp8E60p7vaFugsAAjqwcAO8SuutprijmDfDOLsyGAxlj/Ul3I7wcAcHxBEh0lid1cELwRXBM9Nq2jccVQ6oMd4EVNUsFCuuKsnqO6//gv+/mnIorxPPMOgeTwG85ZvclmTg+ncvvuwKE4C4vy6qbEWe3jwBXXTZ2PzxQjJecA9eEqFeAn2JEkJFAPJwi54EatbFcUJ0SkFVUnBGQKLVsEqhhaJvuzn6buvm+z8p1vmnCe1QITP5MbE/GcRFsQsrhVOpRfZOFRCNAy/EN/jk3s3HZte15SPmnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jLtPE8LskvGnVSQBUUhmDFq2VRrXqHGZlHz7JbPqRgQ=;
 b=KG/rixXrNVrGrUrRQv+fHrCE58NQ9Iku1yb5wUWfzi0gAfSEaQSHag6jH50H1IIyixfeyz5ODIEGlKmtCVUj8EaEDM+ZSbhrrwztsG07dUivlPj0mO28smRX7gXQAwbTnM0sQWL6MJziDeXhK0L/zzw5ALjrxo96VI7vsDbBTNX0PtIG8CMCcnHG0Irf2CO3TLoLVBBp57zFXugX+e+25HGHv1QVrlehSDy7H0EIW7k8OF7uhM+iujvEisVfQu33lRw3fJ5PAQgbSoYY+fM0QNT9D32GWuHRrwVSZgsRuOBKzs4vMGyeJr1LKFZ3139nl/dVHSlo4bvpWACo0ls3Rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by SA3PR11MB8048.namprd11.prod.outlook.com (2603:10b6:806:2fd::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.24; Mon, 22 Jul
 2024 19:00:27 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%5]) with mapi id 15.20.7762.024; Mon, 22 Jul 2024
 19:00:27 +0000
Date: Mon, 22 Jul 2024 15:00:25 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v4 4/4] drm/xe: Fix use after free when client stats are
 captured
Message-ID: <Zp6sSSI-48U0k37e@intel.com>
References: <20240718210548.3580382-1-umesh.nerlige.ramappa@intel.com>
 <20240718210548.3580382-5-umesh.nerlige.ramappa@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240718210548.3580382-5-umesh.nerlige.ramappa@intel.com>
X-ClientProxiedBy: MW4PR04CA0252.namprd04.prod.outlook.com
 (2603:10b6:303:88::17) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|SA3PR11MB8048:EE_
X-MS-Office365-Filtering-Correlation-Id: 646ef364-afcb-4b55-40ee-08dcaa808ca2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?1mIkM20WYDw8PMjAcydEeTjNyfugpbJ9flVzjDiwZJO4zND5E0R1j7wAdVPZ?=
 =?us-ascii?Q?LrbxRaERTMblOdVQgzZa/9Scx2Jg7IRo7s/ctdX5X4jJqsxMu0Awcp+0RKez?=
 =?us-ascii?Q?OTl+VBxXh4MfeW2BvmDTPs9Hiv3lhsRL9OEL52rudK0RaWqdoSRRCtZiDZTq?=
 =?us-ascii?Q?s0AkKqleEATsEpHv+0278vjRsdILrHeEF1StC/neCrmTGsCI/NJl070jgWYa?=
 =?us-ascii?Q?s9bmbEq+C9+NA/cxbITKumQMaUzL2TSyGmxdyf+1jXt0/jWHcqjWdEqCISvz?=
 =?us-ascii?Q?kXCgzdHfjrOOgM35CdGuT5nyPes9CLZfXU3L7LY9UIYuuI782ORvX/XrbuTj?=
 =?us-ascii?Q?jBlk+kSCNW6Q3WSmlbb2OMriqGDhRj2KJ1kVDZddbhin++5vsnRrhh7vYgPN?=
 =?us-ascii?Q?Oa134i8bVTLqVdsqRH6SaPBqfLi4CHAc1nrf7v8rnxiU5fFIubAgTsLa2tSg?=
 =?us-ascii?Q?GbAzrjybh5rK7z3VSv26Cgm7cST7c7BJEF1Q8e45os1q4E0JYu3DKngmjWSC?=
 =?us-ascii?Q?wnDow5fq8I55KIIlxxCVU/GwG3OTTvwGOaXOJmiBt83ZidLdnVcSPiT0IeLx?=
 =?us-ascii?Q?JskbxXeTqqHg1jvQeN8rCC8/ioEJ2sP84WQYff4Bgb25j75NKEE9pJezYbRg?=
 =?us-ascii?Q?5vE4Jw3O/+BP9zsuocO+JognQjW+qatppJMkT09dx2oMlY0hTRPgMvQduaYp?=
 =?us-ascii?Q?xuqtT1q2lVAIoohdBQlUeT+hAghrryKg9lXPQgPzlF7zelm17yE4/BrcYqK6?=
 =?us-ascii?Q?00zPFop+Xq0Ck/l/9NNnBeqySy8I7ntaCPgMQVKT47otDEt/fynJ99slBmgR?=
 =?us-ascii?Q?91cEi35kiSJytIW7/2YlMIdIjd7dOpSLAUWYQmzBgMftbdwLu25MHHQihGKB?=
 =?us-ascii?Q?YKROrDwmwgOL6svDzBLUaXrV3u/hX6EDofdBNMUrybryWtPDwI5TTdEFX8gA?=
 =?us-ascii?Q?dF2wb/8+3EywECMSOep6Wdgjb9lyihplmJO0AqbfU0wdugW2rpavBzq8gb08?=
 =?us-ascii?Q?dEmEtuhHCG9qbFbviCQoy0HraEo5iziOq2vg2DHFubcwdLgGUDCvSS05pAqf?=
 =?us-ascii?Q?BIdmKbJmeDP+sQXCMpd5ESjaEnHhX9ItsPU8jvpF7oL4PX/QDYCHzMnch6G7?=
 =?us-ascii?Q?jM8feRG7qkaocGbDj3ymjmvKJsTfy5EMxGdXiXWdLxnxU36t9AcK62cZhY7W?=
 =?us-ascii?Q?g+pR9GEZvs97+0SmeMJxuVE3qhNg/U2z3Je3yCDYqPPM+0s/z8ffncxyqW9W?=
 =?us-ascii?Q?z64LMy80HUzZTkU4/DijaySz5m/Mtesv1Qf/qKSGpQ5Hvm3676HaD3mU1uDI?=
 =?us-ascii?Q?JUw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?55RbTauFusOU+EWmGG37L4MwHnsbAycLkI8+e3ZeN3+5uZTQWDQIwsnLi98+?=
 =?us-ascii?Q?b7fRO0eL3Cls1ZYT0oEkLESBRlxlQ0zMsvoLilCfPOV/1cutr2CuHnoDSKt7?=
 =?us-ascii?Q?r32rjKOI4gEiVyA5ZNFgI7LVaqfM92cGyl/lHaB2aZQQcxKybwzwqTkPze3r?=
 =?us-ascii?Q?eHK59zBuZ4DTfjKWMfvoVIF00WO4zKtbIFYpyt8ZG0Kn4xK0cZQRLw5Jn0PD?=
 =?us-ascii?Q?JLO1MSeeyP4nnDQ1Zf4nNGBiytry2xGVfCgH5t/7tVZayQ5JMVXxNcqhdviu?=
 =?us-ascii?Q?HGU647cemWJxgvKwu9pW/Aov74mLObljrNmSh43U4nSP3FhP1j/hmDo5ZWuZ?=
 =?us-ascii?Q?O2G7+Dr+RepM7tfoyKx1YpWieXvAqEMlkBTaDEa4llUZjFZ6Nzj2b/jD05Qm?=
 =?us-ascii?Q?IadGnKwirczmOGvrIxKlxWx8K0enNYNVctSQsSiLt68xaiJLUqzAV5iI8A6Q?=
 =?us-ascii?Q?IcefYLJBHDDoCL10f/LvMG6vbqmFPJ9kd5PNYLvF8heWlzMNeFN/zYWmMvVJ?=
 =?us-ascii?Q?nf/hyGIuwQKKa7B2iXlxpWE1UMsX2f8tDRepdD7AisZn81Thpp7S+E/LWfLl?=
 =?us-ascii?Q?zzxYi04AYvk3MshPR59PT4kaltwbO0X5yxhuSy/dc8Gv9SGY3X/cDVt7dhur?=
 =?us-ascii?Q?uxxYg15fDtQvL2VoASpQEdkfHrF/Cfih8a7leeCZAgfOynDcj7uGnwBokWk/?=
 =?us-ascii?Q?Rs6hAuBdFEXW+Anz937zm/OSQoC96BOBBR4p81nTPvtO4BxWHnEq4kjqtqPK?=
 =?us-ascii?Q?HbB0lTR429w6LO7kokAlckcBqjVahPlVQqJ/uYKKzVDbGxsBdUoUXw32aAbo?=
 =?us-ascii?Q?Nk1YgYb9++dx56jRR144oDcwSDH6xnQ70q0oQiappByABUs/P5rs2g7pMjy8?=
 =?us-ascii?Q?8EXhATtWdWAnnQuM/E0QImXveYV4yzCP/fCfR3MYCIaOvODKGcIqZRKsSMes?=
 =?us-ascii?Q?E5Xi3nP5PpAhb2tVRex05tvTDjvE6aQu0lIFcrCeQlswjKguKgGUnjncqcLM?=
 =?us-ascii?Q?bMdvo4QPKkbhDAJx1hp7Zpf8X4U/s3Ix//1y38Zn98ljj5XlyP+BLVTNyUJ8?=
 =?us-ascii?Q?psAzQOa3+r/Nhk/5pDua8h/rVa8BbVhkW4H53HWOcXU+wYMjLY2QY9vVbM7K?=
 =?us-ascii?Q?a/ZPdY3Oy8IwgMflJhN82bpLWa9qU7DVc1UZ8V9BPABg+aByLqwLzVxcLIv7?=
 =?us-ascii?Q?RZwF4kt9WMRQxk2mrhmtVnoyLvL4Dp4gWsRFLLe4SYE1CCr4REyT4kXKvdXf?=
 =?us-ascii?Q?GRHXIpnMWsc25sQmzYmaNnY0MHxLhxEu/wTiRseQiKz6BsDyAEACjhDzBmQa?=
 =?us-ascii?Q?X7BsLYe7fRqFTXGsur04V1SE4dz6iIJeBMjcjpyZ0CG8POVPccl5W2NHZJIY?=
 =?us-ascii?Q?70iFzORUpfW8jtp4d3/k8+TTg6Ng1DLUFgyicp4Q321XTnIUudbbwj31FSVP?=
 =?us-ascii?Q?yC6ANBQebno8t5J3J1IJ6SkgOYXM7hmcZ9GCcoWuXhIjZhmm4yOhn2TWEREu?=
 =?us-ascii?Q?LwgJMEOcc9+R4QpR43tNlpZ1WRlhyqVttfcuokR/HfcvkCjGGzUhd1Ce0htg?=
 =?us-ascii?Q?P70NBanMPoX+EfB+2UCx15yP9w0wgQUGyrT2+mFbPmicV3srn3N+XslEurdz?=
 =?us-ascii?Q?Iw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 646ef364-afcb-4b55-40ee-08dcaa808ca2
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2024 19:00:27.4839 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v4F7iVcpJWNdzPNcB2b0QPqLHvqluxz7grGfEObeDMMeCfikuV26W3BVNu/KxXyPM8w68zVEYqdANWDWarIPwg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB8048
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

On Thu, Jul 18, 2024 at 02:05:48PM -0700, Umesh Nerlige Ramappa wrote:
> xe_file_close triggers an asynchronous queue cleanup and then frees up
> the xef object. Since queue cleanup flushes all pending jobs and the KMD
> stores client usage stats into the xef object after jobs are flushed, we
> see a use-after-free for the xef object. Resolve this by taking a
> reference to xef from xe_exec_queue.
> 
> While at it, revert an earlier change that contained a partial work
> around for this issue.
> 
> v2:
> - Take a ref to xef even for the VM bind queue (Matt)
> - Squash patches relevant to that fix and work around (Lucas)
> 
> v3: Fix typo (Lucas)
> 
> Fixes: ce62827bc294 ("drm/xe: Do not access xe file when updating exec queue run_ticks")
> Fixes: 6109f24f87d7 ("drm/xe: Add helper to accumulate exec queue runtime")
> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1908

Hi Umesh,

first of all thanks for this fix.

But I'd like to ask you for a next time to provide the fix in a single patch
or have the first patch as a dirty fix and a refactor on top, so it gets
easily backported to the fixes and stable branches.

For drm-xe-next-fixes I'm now picking this entire series. But for any
stable we will need to provide a backport that applies there.

Thanks,
Rodrigo.

> Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
> Reviewed-by: Matthew Brost <matthew.brost@intel.com>
> Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_drm_client.c       |  5 +----
>  drivers/gpu/drm/xe/xe_exec_queue.c       | 10 +++++++++-
>  drivers/gpu/drm/xe/xe_exec_queue_types.h |  7 +++----
>  3 files changed, 13 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_drm_client.c b/drivers/gpu/drm/xe/xe_drm_client.c
> index 6a26923fa10e..7ddd59908334 100644
> --- a/drivers/gpu/drm/xe/xe_drm_client.c
> +++ b/drivers/gpu/drm/xe/xe_drm_client.c
> @@ -251,11 +251,8 @@ static void show_run_ticks(struct drm_printer *p, struct drm_file *file)
>  
>  	/* Accumulate all the exec queues from this client */
>  	mutex_lock(&xef->exec_queue.lock);
> -	xa_for_each(&xef->exec_queue.xa, i, q) {
> +	xa_for_each(&xef->exec_queue.xa, i, q)
>  		xe_exec_queue_update_run_ticks(q);
> -		xef->run_ticks[q->class] += q->run_ticks - q->old_run_ticks;
> -		q->old_run_ticks = q->run_ticks;
> -	}
>  	mutex_unlock(&xef->exec_queue.lock);
>  
>  	/* Get the total GPU cycles */
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
> index 3336a01a1006..69867a7b7c77 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> @@ -37,6 +37,10 @@ static void __xe_exec_queue_free(struct xe_exec_queue *q)
>  {
>  	if (q->vm)
>  		xe_vm_put(q->vm);
> +
> +	if (q->xef)
> +		xe_file_put(q->xef);
> +
>  	kfree(q);
>  }
>  
> @@ -649,6 +653,7 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
>  		goto kill_exec_queue;
>  
>  	args->exec_queue_id = id;
> +	q->xef = xe_file_get(xef);
>  
>  	return 0;
>  
> @@ -762,6 +767,7 @@ bool xe_exec_queue_is_idle(struct xe_exec_queue *q)
>   */
>  void xe_exec_queue_update_run_ticks(struct xe_exec_queue *q)
>  {
> +	struct xe_file *xef;
>  	struct xe_lrc *lrc;
>  	u32 old_ts, new_ts;
>  
> @@ -773,6 +779,8 @@ void xe_exec_queue_update_run_ticks(struct xe_exec_queue *q)
>  	if (!q->vm || !q->vm->xef)
>  		return;
>  
> +	xef = q->vm->xef;
> +
>  	/*
>  	 * Only sample the first LRC. For parallel submission, all of them are
>  	 * scheduled together and we compensate that below by multiplying by
> @@ -783,7 +791,7 @@ void xe_exec_queue_update_run_ticks(struct xe_exec_queue *q)
>  	 */
>  	lrc = q->lrc[0];
>  	new_ts = xe_lrc_update_timestamp(lrc, &old_ts);
> -	q->run_ticks += (new_ts - old_ts) * q->width;
> +	xef->run_ticks[q->class] += (new_ts - old_ts) * q->width;
>  }
>  
>  void xe_exec_queue_kill(struct xe_exec_queue *q)
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> index ded9f9396429..1408b02eea53 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
> +++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> @@ -38,6 +38,9 @@ enum xe_exec_queue_priority {
>   * a kernel object.
>   */
>  struct xe_exec_queue {
> +	/** @xef: Back pointer to xe file if this is user created exec queue */
> +	struct xe_file *xef;
> +
>  	/** @gt: graphics tile this exec queue can submit to */
>  	struct xe_gt *gt;
>  	/**
> @@ -139,10 +142,6 @@ struct xe_exec_queue {
>  	 * Protected by @vm's resv. Unused if @vm == NULL.
>  	 */
>  	u64 tlb_flush_seqno;
> -	/** @old_run_ticks: prior hw engine class run time in ticks for this exec queue */
> -	u64 old_run_ticks;
> -	/** @run_ticks: hw engine class run time in ticks for this exec queue */
> -	u64 run_ticks;
>  	/** @lrc: logical ring context for this exec queue */
>  	struct xe_lrc *lrc[];
>  };
> -- 
> 2.38.1
> 
