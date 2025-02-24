Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 168B0C021B3
	for <intel-xe@archiver.kernel.org>; Mon, 24 Feb 2025 03:50:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C83B910E051;
	Mon, 24 Feb 2025 03:50:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eNKHkyDR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8744410E051
 for <intel-xe@lists.freedesktop.org>; Mon, 24 Feb 2025 03:50:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740369004; x=1771905004;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=7QRPM6zgBPrjshzVdxlV140wgtP+G+X3spcsHz9LgN0=;
 b=eNKHkyDR6IrFtbBtZj7FBG9LwGaC9Q5MGmPm5CEGf+IKq/qCUtijwt//
 9rUngE50foOAKJs1NrP/QV7TmoN1WssuRrH70vsJIza+mRRw+eFH5/+ua
 Xlp3c/1l5z/t+/jDgYNjPpf2YuhU9uk3PJ1YtshpAw6HVEF1eS/Q9Qp7d
 IstUO7m3nsDcYZ+4xljzxNClV18Mk9aoL+/V7SaUTPyri31+GPHJ3MzAJ
 clJy/133cW8eXTQr/J5AmQrqFme2pQAsKvdJdkVJjfKdkYdaWkEtHKHqk
 A8ldk+cEfVzyhPBrkcWSVzbTHqnxLaxq2sP9ntwIRBA5QUrN0tVGP9i1/ w==;
X-CSE-ConnectionGUID: 30CsITVoRUif5ZCNKp7xBg==
X-CSE-MsgGUID: uq+glwFkTI2tIpmxpNp/xg==
X-IronPort-AV: E=McAfee;i="6700,10204,11354"; a="58659403"
X-IronPort-AV: E=Sophos;i="6.13,309,1732608000"; d="scan'208";a="58659403"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2025 19:50:04 -0800
X-CSE-ConnectionGUID: rA9SrjJCQhqZp6RGKwhNNA==
X-CSE-MsgGUID: ff6nZOkFRJaKs77UmB0cJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,309,1732608000"; d="scan'208";a="115669329"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2025 19:50:04 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.1544.14; Sun, 23 Feb 2025 19:50:03 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Sun, 23 Feb 2025 19:50:03 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.175)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Sun, 23 Feb 2025 19:50:03 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tU0m8RFJ24mvai9vR+SynD9aodz3H4blzqLOz/6aovFDF2y9Ocic/CnoaOB8rT1ov+Yn57xOa/lBK4j45gTxZo906eVBgi2KQmNVVdZaivrXlJlfFVR+l3Mq/wI0wQr6pdjYUzwVefhAqHRELq+SjIpGtho6addghIi5o7zFQoE8+vEByTS2+Mw18uadZU5Z/UTeJ2uezYEPIx1iyux7Y0oAmQxucPgIhK4Rp0h0riRgDKbNw1/In3V8Xl6HJux9tqAiuuDEN9SZNMDi7+gSTQvHDg2R8xMN0xBvhHQ5e8a6nr1ED8fuE0lwMEvw2rTIXLniCiXeUSauLGwnsykmzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ToUgb572KX1EDH/WGugAyR/VYjCRMXUYAeCXZ8Qj7TE=;
 b=wkKAycwnpcvViXQyGtRRXtKrc7XKjtsHvnuEoYRLUl5n5PiRHCKXjQvuLwYLBasPxdTwxGE/O6W7clfbPOGgH7p1eqSG4J1cHnekZghSf/fd6Kvq3ocYxkaptCg4aCnINnQME/3JN4W2AVxh94HJOUMiyq8l3dJ4aNUPDauKngSNErpWlzVomr5wY26NX6YYdpGPuthUKP4YY92uID9ynTCuK636vaJvruyM3DG4FqaGMM63MBVm1tMv8nNLurvDvct/Y5wylLOHK1goki8k9BoIVhqobdY20/UCLuMMoQCyyC3IYRJjZuhsY85adiD3eVV2TkTlttFRQfRswacEbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH0PR11MB7421.namprd11.prod.outlook.com (2603:10b6:510:281::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.19; Mon, 24 Feb
 2025 03:49:17 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.8466.016; Mon, 24 Feb 2025
 03:49:16 +0000
Date: Sun, 23 Feb 2025 19:50:20 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>, "Nilawar, Badal"
 <badal.nilawar@intel.com>
Subject: Re: [PATCH] drm/xe: Make sure scheduler is ready before submission
Message-ID: <Z7vsfEZsAotWoSmm@lstrano-desk.jf.intel.com>
References: <20250220123859.291523-1-tejas.upadhyay@intel.com>
 <Z7i2szvi1T19KQnR@lstrano-desk.jf.intel.com>
 <SJ1PR11MB62049A747DD815101D9DEB7381C62@SJ1PR11MB6204.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <SJ1PR11MB62049A747DD815101D9DEB7381C62@SJ1PR11MB6204.namprd11.prod.outlook.com>
X-ClientProxiedBy: MW4PR04CA0294.namprd04.prod.outlook.com
 (2603:10b6:303:89::29) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH0PR11MB7421:EE_
X-MS-Office365-Filtering-Correlation-Id: 078b4242-a09e-4b10-120f-08dd54863627
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?gGTc3mouD7XsgO0XSX6PN0e0KKVivaxAUCXUhKn1ugrmPM2HyQluquATSYHM?=
 =?us-ascii?Q?wpCPjj1YuphC4a+HpRE0sUbbEycYSnO/pfm/2XwlNU1Ya2D+INcKZli0o0qm?=
 =?us-ascii?Q?VfyAQ6wGO+rZK/baH4sNeyjpY4gIBN7IlQKpc4rh/BBojsdcJ/NTPR2AWdJ0?=
 =?us-ascii?Q?yiRFB2G2FHQPfLnqGxMK5YGEHjXvmQZZjUWsF16LBnZMN+256rKrXfMXGmO/?=
 =?us-ascii?Q?xw3wQe3rO/+Ps0WFA/mCQIkhk7Kex57fzFPROvomeglk/TRCw+Hte3SlbnFG?=
 =?us-ascii?Q?0rETjPXRg4P2BukLDtsExIRWCCriQ7WOUeMO91gytVL7e+2iRk4puR7J4ZYj?=
 =?us-ascii?Q?KGIu7Wfg1az13GjIO27MbfgLlQGa2jA8QSDy6FU2r/y2DNMSck/xpqerk7YZ?=
 =?us-ascii?Q?vdeK9dVKT0hXcL9LZR98VQy+fiZnZh2SPwPp+8EG4e53iPJbn8mOJ7/zFEh8?=
 =?us-ascii?Q?w2R+Nn9G6QBzD1vKVu0HNdim4DlH7VCdqWbKcYscDL/E26B3np9+lN8XfmRn?=
 =?us-ascii?Q?11UncUu13vwIHpMFU+f+ugiMmSozEZftBLzyQCpHP6qulgomz0ABm0NbtuSi?=
 =?us-ascii?Q?rViMjvFuF19ZF0vH3j3XGzvwU3RuH0Zo2iQPkdB4fh1W5op5sMrAY8FhzSEu?=
 =?us-ascii?Q?mBuV/IAweYN/WOOY57rc0GE3ZsUU3LEUfvaKKzvuGnz/r40VrWtppaMlyKw+?=
 =?us-ascii?Q?RBfhJYwhZsD+RRSPszOHSxPJsdh9b7DmS2Q35UCL8wekPtEK/osYzowARb5H?=
 =?us-ascii?Q?RyQ1YkBgm+Dbx2zwL0B+MwW9bq6zJPKT0fSevo+QUexEMb40aKJWV5BPI9a4?=
 =?us-ascii?Q?tvF2zPKyB2YLdVFWYueS748STbeie/LaEBzNqIGmC3C1MDHRsS56qyPDFpsx?=
 =?us-ascii?Q?jrj3WVX/aIhQBgDkXQoyLZtR9kNX8nQWyFLws/KV/Me3BQf+fcJHnTRx/dpj?=
 =?us-ascii?Q?h6h6k+aH6NAGFlxetwyPGmCjgM+u74eD12vW7GRgKeBV31j0jWH5qBSmMIAg?=
 =?us-ascii?Q?UYvIIqPkbeWruJk2SBLw+Hv5JVA0Z1owCAiS23mfxuv7QnFdrJf5AxxJk3p1?=
 =?us-ascii?Q?U/gBBHYHG3BArl0m27Pvnru5DnmxSENQa80bU4/AiF7XcDtuynAjJdvdxMHd?=
 =?us-ascii?Q?xjtfGxIv+eviMrtYV6psPfdfp99tIKgfo6I8Im9sCc8QX9oqzaJqWMbiUh+n?=
 =?us-ascii?Q?NaOTKqwHZ8TJZp0nzDIp5OJnqY0mPV8LMWjnBMwFkg1ILsH4zxKFnOZA9j68?=
 =?us-ascii?Q?+zA8/X1AqgXEyafAqsUwGLMUFH2qptfkrE3VhqSP/wsIo3oKIKJKsi6VIQDV?=
 =?us-ascii?Q?Dzmuvd4ZPkRMfEsl1GPCquNippocpcKVHFzATX6qFzVxkQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?bK73LkmrbN4kjCxSZRT0uIIp3OUC80lVuEmbm75lGJi/HFHxV2Nkm2axEqjB?=
 =?us-ascii?Q?+COrdqNfy7xPnOw44U+f6k7JZRbRrEN8385JHyUCRYK07XmV4NeUef96jTiv?=
 =?us-ascii?Q?MHOpqwQ2EeZLQQdkEYaK1UqbcbMnvcJx9PAw3oCfX99vS3y5ByR8cD/tCz2T?=
 =?us-ascii?Q?jhMCmwQalxIknJR5XXlexq81baqEMik7BqypwHFGR13czotMUB1otGSHRb/M?=
 =?us-ascii?Q?R2pxYu8tEZ8DI+5s7d2C1ILC8tDwxnESIikwAAFwvARYveMrUuP3ufG71AAf?=
 =?us-ascii?Q?eCmTpYhGrae70u5IUGgOjarfh4hl39T3OxR2wjvhEfo8jGED6uelAq4yFFRW?=
 =?us-ascii?Q?rpzWfCnaT/ot5rHjLaPNI6yHeDdtNXZIvMHpj4Q8LTRjFG62WXb4Mh/J03TU?=
 =?us-ascii?Q?XOmVfNO8+sZ4vupynWouK7iRtP7Fs0oQIzx+AFOixBuvqTyBnPwmlayZhXzy?=
 =?us-ascii?Q?ahsXGJvtInpb35gYdc1P/Vbn34k10JLGqs0Buj5MaAItz84CDPPM0zWs2/2/?=
 =?us-ascii?Q?g0J5Z0dvSNCrSkfG4UtdEBbYdaJMxIHRyo4lF6KdPwhoJWMtFOTEJ7fq5Fxx?=
 =?us-ascii?Q?2YjECbyTlL5coFI5wFUDdReFZHB9LAaD3hMdSziVtCf6SfTmD/FTNiOw+ayu?=
 =?us-ascii?Q?y5+ZVaNq7tvsrr1PCNKq8ZImqkP1nDB89Gc0gYoLxFrRzbGiwT2tB7/TkZja?=
 =?us-ascii?Q?RNVu30cQRY4INlUoXXH1I6S/aPj1jMigxjxQNTksKpledYY3j+rnxOH0wTO1?=
 =?us-ascii?Q?78/dc+tF5Q3QnEOJ6wluLtmafaL6zzGEGXWEvGI6u3kBByyF6+LwJPbWoXxS?=
 =?us-ascii?Q?EnDvd8WqVO3bU2s/ThioM6YzW4KTZkpO5fYUNeYf4j8hds2dz4wIxhvdrFBM?=
 =?us-ascii?Q?CxEXkt7TBx/3yQoFi2UyDuf7MZ0xXvz3rTAgc6JVD2Am2rMtyYKIMP4eGPVb?=
 =?us-ascii?Q?izLZZrB0c+ea+2Bz3zpv81i9E2ta0h6csqCuS+GjQeJ/mttOC3Dtb1L0pYb8?=
 =?us-ascii?Q?hY7bBOvqOLAA79Jfdgm0PQjx6DFh+cu9uQJwP43c0TGfa/bNW1vu0e8tGzpz?=
 =?us-ascii?Q?qfWfLPhU8O0aC2g5U9AEHHL8/u6bjnsi42Z7jnMLDoHMSEqxBESprDd0VAMG?=
 =?us-ascii?Q?C76jwuPUToJCfuRJxO6ij4Mx4UJJ17YV3vv3AkaeDx5+Me/e0sNQ3Noczku5?=
 =?us-ascii?Q?F1hpUf3kIOOK+kdtqF6Y6YaT4IcYyqAQuLt6vV8Nm51pc2epG9kFS2d+ZWvz?=
 =?us-ascii?Q?kBfntcrNjQOYFhP22+ZWls3W3t7wK8PCs22NXxvX3VtafSwpEy0H4U3S1acR?=
 =?us-ascii?Q?OZoZJf6r45iqDwQad85bUmegZCuLSrft3OVQxEVCipgvNX0CS3VGFWDYON7g?=
 =?us-ascii?Q?Gl3XtBzkDc0faTObe1IHUvuCQS/mIqE31QtPNf5Pn4S6W5vjEHyBMHIuhCm2?=
 =?us-ascii?Q?yuNYMWyXnP31Q4/wjxIXGw3zft6ZQoDYYBS2sBOX9G/1Wb6wQMKX6HRPEQun?=
 =?us-ascii?Q?Cr/zo/pOeFrRmrY6rvvLNSmRopfeAUszQh8Yay2IEjF7GrP2qtwwkYVIGoNx?=
 =?us-ascii?Q?hxY7JyT/dawd25066SMCq3abdgh8oZZpgf1Szu6GcTsndHnQbPtwnlUwhnSm?=
 =?us-ascii?Q?Tg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 078b4242-a09e-4b10-120f-08dd54863627
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2025 03:49:16.8912 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IKemlTmfec8CEBy/1+jMpGocsHDsyqnANBBwKJJ6aefqmoswbDefGqdb+cENmm4+m002fkeqOJSBkxglV9NIWw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7421
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

On Sat, Feb 22, 2025 at 12:17:51AM -0700, Upadhyay, Tejas wrote:
> 
> 
> > -----Original Message-----
> > From: Brost, Matthew <matthew.brost@intel.com>
> > Sent: Friday, February 21, 2025 10:54 PM
> > To: Upadhyay, Tejas <tejas.upadhyay@intel.com>
> > Cc: intel-xe@lists.freedesktop.org; Ghimiray, Himal Prasad
> > <himal.prasad.ghimiray@intel.com>; Nilawar, Badal
> > <badal.nilawar@intel.com>
> > Subject: Re: [PATCH] drm/xe: Make sure scheduler is ready before submission
> > 
> > On Thu, Feb 20, 2025 at 06:08:59PM +0530, Tejas Upadhyay wrote:
> > > Async call to __guc_exec_queue_fini_async frees scheduler while some
> > > scheduler submission would have already started.
> > > To handle such small window race case, submission should only start
> > > when scheduler is ready.
> > >
> > > It will help to solve below which is not easily reproducible,
> > > https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/4223
> > >
> > 
> > I don't think this help. We can only enter xe_sched_submission_start if exec
> > queue is in &guc->submission_state.exec_queue_lookup and remove the exec
> > queue under a mutex in release_guc_id before we call xe_sched_fini which flips
> > the ready state to false. We then immediately free the scheduler - we'd be
> > getting a UAF in xe_sched_submission_start anyways.

This assessment isn't exactly correct. Rather we should not be calling
start after we call stop in xe_exec_queue_fini. 

> > 
> > The gitlab issue looks like a memory corruption. Basically it is saying a variable
> > which is a bool is reading 107 which shouldn't be possible.
> 
> It gets issue, while accessing drm_sched_rq *rq, look at below,
> 
> static struct drm_sched_entity *
> drm_sched_rq_select_entity_fifo(struct drm_gpu_scheduler *sched,
>                                 struct drm_sched_rq *rq)
> {
>         struct rb_node *rb;
> 
>         spin_lock(&rq->lock); --> here it crashes
> 
> Async free of sched_rq happens at,
>  void xe_sched_fini(struct xe_gpu_scheduler *sched)
> {
>         xe_sched_submission_stop(sched);
>         drm_sched_fini(&sched->base); --> here it frees sched_rq and marks sched_ready = false)
> }
> 
> It looks like inbetween drm_sched_fini and xe_exec_queue_fini we are hitting this issue, which might be avoided with check mentioned here in patch. I saw similar check being done but other drivers look below in drivers/gpu/drm/amd/amdgpu/amdgpu_job.c,

We shouldn't be calling start after xe_exec_queue_fini here. If we are,
that is the bug.

>                         if (amdgpu_ring_sched_ready(ring))
>                                 drm_sched_start(&ring->sched, 0);
> 
> 
> Dump stack details :
> [ 1481.378550] ==================================================================
> [ 1481.385791] BUG: KASAN: slab-use-after-free in __lock_acquire (kernel/locking/lockdep.c:5089)
> [ 1481.392598] Read of size 8 at addr ffff88812352a7a0 by task kworker/u128:11/2827
> 
> [ 1481.401506] CPU: 17 UID: 0 PID: 2827 Comm: kworker/u128:11 Not tainted 6.13.0xe-ptl+ #1
> [ 1481.409475] Hardware name: Intel Corporation Raptor Lake Client Platform/RPL-S ADP-S DDR5 UDIMM CRB, BIOS RPLSFWI1.R00.5045.A00.2401260733 01/26/2024
> [ 1481.422824] Workqueue:  drm_sched_run_job_work [gpu_sched]
> [ 1481.428348] Call Trace:
> [ 1481.430803]  <TASK>
> [ 1481.432913] dump_stack_lvl (lib/dump_stack.c:123)
> [ 1481.436589] print_report (mm/kasan/report.c:379 mm/kasan/report.c:489)
> [ 1481.440206] ? __virt_addr_valid (./arch/x86/include/asm/preempt.h:94 ./include/linux/rcupdate.h:964 ./include/linux/mmzone.h:2058 arch/x86/mm/physaddr.c:65)
> [ 1481.444511] ? __lock_acquire (kernel/locking/lockdep.c:5089)
> [ 1481.448527] kasan_report (mm/kasan/report.c:604)
> [ 1481.452141] ? __lock_acquire (kernel/locking/lockdep.c:5089)
> [ 1481.456181] __lock_acquire (kernel/locking/lockdep.c:5089)
> [ 1481.460030] ? check_chain_key (kernel/locking/lockdep.c:3967)
> [ 1481.464137] ? __lock_acquire (kernel/locking/lockdep.c:5240)
> [ 1481.468240] ? __pfx___lock_acquire (kernel/locking/lockdep.c:5077)
> [ 1481.472604] lock_acquire (kernel/locking/lockdep.c:467 kernel/locking/lockdep.c:5851 kernel/locking/lockdep.c:5814)
> [ 1481.476331] ? drm_sched_run_job_work (drivers/gpu/drm/scheduler/sched_main.c:344 drivers/gpu/drm/scheduler/sched_main.c:1068 drivers/gpu/drm/scheduler/sched_main.c:1199) gpu_sched
> [ 1481.482099] ? __pfx_lock_acquire (kernel/locking/lockdep.c:5817)
> [ 1481.486292] ? lock_acquire (kernel/locking/lockdep.c:467 kernel/locking/lockdep.c:5851 kernel/locking/lockdep.c:5814)
> [ 1481.490143] ? process_one_work (kernel/workqueue.c:3212)
> [ 1481.494360] _raw_spin_lock (./include/linux/spinlock_api_smp.h:134 kernel/locking/spinlock.c:154)
> [ 1481.498061] ? drm_sched_run_job_work (drivers/gpu/drm/scheduler/sched_main.c:344 drivers/gpu/drm/scheduler/sched_main.c:1068 drivers/gpu/drm/scheduler/sched_main.c:1199) gpu_sched
> [ 1481.503825] drm_sched_run_job_work (drivers/gpu/drm/scheduler/sched_main.c:344 drivers/gpu/drm/scheduler/sched_main.c:1068 drivers/gpu/drm/scheduler/sched_main.c:1199) gpu_sched

This worker is flushed via xe_sched_submission_stop in xe_sched_fini.
Again we shouldn't be calling xe_sched_submission_start after this. If
we are, this is a bug. We'd still get a UAF if we did this too as the
scheduler memory is immediately freed after calling xe_sched_fini too.

Matt

> [ 1481.509428] process_one_work (kernel/workqueue.c:3236)
> [ 1481.513477] ? __pfx_lock_acquire (kernel/locking/lockdep.c:5817)
> [ 1481.517693] ? __pfx_process_one_work (kernel/workqueue.c:3138)
> [ 1481.522275] ? __list_add_valid_or_report (lib/list_debug.c:32)
> [ 1481.527155] worker_thread (kernel/workqueue.c:3311 kernel/workqueue.c:3398)
> [ 1481.530966] ? __pfx_worker_thread (kernel/workqueue.c:3344)
> [ 1481.535243] kthread (kernel/kthread.c:389)
> [ 1481.538510] ? kthread (kernel/kthread.c:374)
> [ 1481.541824] ? __pfx_kthread (kernel/kthread.c:342)
> [ 1481.545569] ret_from_fork (arch/x86/kernel/process.c:147)
> [ 1481.549203] ? __pfx_kthread (kernel/kthread.c:342)
> [ 1481.552986] ret_from_fork_asm (arch/x86/entry/entry_64.S:257)
> [ 1481.556918]  </TASK>
> 
> [ 1481.560615] Allocated by task 8713:
> [ 1481.564099] kasan_save_stack (mm/kasan/common.c:48)
> [ 1481.564104] kasan_save_track (./arch/x86/include/asm/current.h:49 mm/kasan/common.c:60 mm/kasan/common.c:69)
> [ 1481.564108] __kasan_kmalloc (mm/kasan/common.c:398)
> [ 1481.564112] drm_sched_init (drivers/gpu/drm/scheduler/sched_main.c:1314) gpu_sched
> [ 1481.564121] guc_exec_queue_init (drivers/gpu/drm/xe/xe_guc_submit.c:1445 (discriminator 6)) xe
> [ 1481.564349] xe_exec_queue_create (drivers/gpu/drm/xe/xe_exec_queue.c:152 drivers/gpu/drm/xe/xe_exec_queue.c:183) xe
> [ 1481.564563] xe_exec_queue_create_ioctl (drivers/gpu/drm/xe/xe_exec_queue.c:687) xe
> [ 1481.564777] drm_ioctl_kernel (drivers/gpu/drm/drm_ioctl.c:796) drm
> [ 1481.564859] drm_ioctl (drivers/gpu/drm/drm_ioctl.c:894) drm
> [ 1481.564937] xe_drm_ioctl (drivers/gpu/drm/xe/xe_device.c:210) xe
> [ 1481.565149] __x64_sys_ioctl (fs/ioctl.c:51 fs/ioctl.c:906 fs/ioctl.c:892 fs/ioctl.c:892)
> [ 1481.565154] do_syscall_64 (arch/x86/entry/common.c:52 arch/x86/entry/common.c:83)
> [ 1481.565159] entry_SYSCALL_64_after_hwframe (arch/x86/entry/entry_64.S:130)
> 
> Tejas
> > 
> > Matt
> > 
> > > Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> > > ---
> > >  drivers/gpu/drm/xe/xe_gpu_scheduler.c | 8 ++++++++
> > >  1 file changed, 8 insertions(+)
> > >
> > > diff --git a/drivers/gpu/drm/xe/xe_gpu_scheduler.c
> > > b/drivers/gpu/drm/xe/xe_gpu_scheduler.c
> > > index 50361b4638f9..42ca3c4a299a 100644
> > > --- a/drivers/gpu/drm/xe/xe_gpu_scheduler.c
> > > +++ b/drivers/gpu/drm/xe/xe_gpu_scheduler.c
> > > @@ -80,6 +80,14 @@ void xe_sched_fini(struct xe_gpu_scheduler *sched)
> > >
> > >  void xe_sched_submission_start(struct xe_gpu_scheduler *sched)  {
> > > +	/* Async call to __guc_exec_queue_fini_async frees scheduler
> > > +	 * while some scheduler submission would have already started.
> > > +	 * To handle such small window race case, submission should only
> > > +	 * start when scheduler is ready.
> > > +	 */
> > > +	if (!drm_sched_wqueue_ready(&sched->base))
> > > +		return;
> > > +
> > >  	drm_sched_wqueue_start(&sched->base);
> > >  	queue_work(sched->base.submit_wq, &sched->work_process_msg);
> > }
> > > --
> > > 2.34.1
> > >
