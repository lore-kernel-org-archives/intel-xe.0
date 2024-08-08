Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20D3BC52D71
	for <intel-xe@archiver.kernel.org>; Thu,  8 Aug 2024 18:28:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC8C310E7CD;
	Thu,  8 Aug 2024 18:28:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="A+eA9fPH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A33FC10E7CC
 for <intel-xe@lists.freedesktop.org>; Thu,  8 Aug 2024 18:28:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723141725; x=1754677725;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=EQ2W0HDo1xRABJS9KJqG04VfTnpHm7MnY4lm9DaZUrs=;
 b=A+eA9fPHTTw8PEJMEEhFp2hAGqxMhvtPs1+VKQYRwWCimmbbvsDmH5l8
 fYi8adYEgaJ2eIdEUE3WFZHEk0cKLbeNDjvOoH62PBuVdFklX/snsVd9F
 PoVLOh2txqrhNmbmNmo4IL5omyj2jtIqKLiKtHSJGrORsyJpPVXId9jgZ
 VDpJpVOJY8JTS+SJRG/WHKTfxBGRAiALOczcAacnQKFnI4AL2Vx5ENKPE
 n9gYneOC1U85rApJdqViD/Kn7txU+WVKhSWX3metUii0OCZVt4v3ibrwA
 kZbwcg1OJ8UKkp+Y4Xfl1EbXZ+ASSCt3r3ETr4TBtiTT3Rt+A74j9Wbvm Q==;
X-CSE-ConnectionGUID: xv5artwGS7qpbnk5imSrdg==
X-CSE-MsgGUID: YcSH7ruMRsy2gobc4YHPVA==
X-IronPort-AV: E=McAfee;i="6700,10204,11158"; a="21262577"
X-IronPort-AV: E=Sophos;i="6.09,273,1716274800"; d="scan'208";a="21262577"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2024 11:28:45 -0700
X-CSE-ConnectionGUID: FD0OKPJ7RJKduuiEQtBJDQ==
X-CSE-MsgGUID: o6XaB5i5TmydfIDCB4cw/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,273,1716274800"; d="scan'208";a="56971617"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Aug 2024 11:28:46 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 8 Aug 2024 11:28:44 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 8 Aug 2024 11:28:44 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 8 Aug 2024 11:28:44 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.47) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 8 Aug 2024 11:28:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Vz1iN0bGX9ArrZSVy6cSIFyH8kL2K8U69HANxfDTE8h6hzFkWiFQLTTv6vh8CNYRw1GDHksKKMi2SAYhJsCsS+Iws7n8+TeavefQVv3Izs/UPMclLognX/dhG7rZjYB8N97e6PZhx8YDsbuXcpOS6EpcwZo+KAWl4jBuxnpoqNmKWg2CaNR1mRYO9U+OKbZ1qDpQSyk3z+GS6XrpoSpoixmG8/W2IBJY1/hoq2zNZa8LaR9/tqMK/ppgQ/x2ykdsx3DJ4TX1x/70nT2kuYHZfo30YM2nEWrFyhx+hx4LxYganDxQYpdIAXCbCJ+YaiUFdQvD/0cOhXA+QcSotl+lrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1Mh7aH07afTQFfj8EXPjJvGjdMCOWVz9EZZmDWvOS30=;
 b=puvjoXG1XkrGffoDZ1mux4W9OAignUNa5UjY5tvF5aqVpcxfUeyewVWAX6wM4MajmGJYVN0F110HotE6GkPasMFnRHgL9YCKfoi2obMuvQti74PEdOPWZ8DSp6jUpOKBlVi7Yf1bj0ms31jvtP0bNHrHwyVBT5s5Tb8ZN/e07tP99ptDl7eTXIcE2Vx8f9Ah0TQR4XZuPwrWhjXisnvzVkqD1HkZzHnm4E6H+zjJ8n5mjmG5PIcveUF6mfnvNIsRH5ejw+Vv79nwDodhdzgGLDtMz3bXRahQC2csjO9NnBFYcZLsWrCNlMeRhnSNnNGvjAdikZpG9Jx/ZuCchpRPOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7828.namprd11.prod.outlook.com (2603:10b6:930:78::8)
 by MW4PR11MB6809.namprd11.prod.outlook.com (2603:10b6:303:1e9::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.26; Thu, 8 Aug
 2024 18:28:40 +0000
Received: from CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d]) by CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d%5]) with mapi id 15.20.7828.023; Thu, 8 Aug 2024
 18:28:40 +0000
Date: Thu, 8 Aug 2024 20:28:33 +0200
From: Francois Dugast <francois.dugast@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v6 10/13] drm/xe/guc_submit: Allow calling
 guc_exec_queue_resume with pending resume
Message-ID: <ZrUOUVJi34Gvv0mc@fdugast-desk>
References: <20240806192739.1076344-1-francois.dugast@intel.com>
 <20240806192739.1076344-11-francois.dugast@intel.com>
 <ZrQ/EU2pnJr0ElpW@DUT025-TGLU.fm.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ZrQ/EU2pnJr0ElpW@DUT025-TGLU.fm.intel.com>
Organization: Intel Corporation
X-ClientProxiedBy: BE1P281CA0061.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:26::6) To CY8PR11MB7828.namprd11.prod.outlook.com
 (2603:10b6:930:78::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7828:EE_|MW4PR11MB6809:EE_
X-MS-Office365-Filtering-Correlation-Id: 90059df0-c62a-42cc-1721-08dcb7d7ed59
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?3rWsHnee04Q073YtVKz1Wj6iUdNj60YzD/F6hqzzsJdCsCbcJVMhmUmF1YZu?=
 =?us-ascii?Q?84zZRicUaDSOp5slZi3QyFmibFrSlRyPn24UCCB0YTJIVfO/CYNnco5CmuyS?=
 =?us-ascii?Q?kZxr20ZccWZP09S62ErytV4IhXR6wWjfYaPJeqVQ7FT8cKoCD8JhNiKUDu2k?=
 =?us-ascii?Q?q1d8azhnInHl8WBJPqTbP3RKPzRuzfutGQQ6LhF8D/W+q/VClZzVeYBvLEpK?=
 =?us-ascii?Q?A7SQLksG08j++tEcnIUJzVWwZ3CyWneiVygzE9WjDl9w+RC/6hGaJ1REyf3+?=
 =?us-ascii?Q?kuUIuxltK5cGdYtdG+72kUzoj3ijXX1bgaAodLlno3wCHO12audMmKrDwyCM?=
 =?us-ascii?Q?6YdqsbH74st4IIVp7jKc6Vhd/DHhbdGASWAMPKOxGxR2hEMhAqFxzrPvxmxW?=
 =?us-ascii?Q?QiqP1ahQ3Tzyd2X10hIy3z5a//imJMfkHzc73HxOOJ0MvAWypRA4o6dDh+OR?=
 =?us-ascii?Q?o5zhaC7vihJjjfKpVsnp8+DJq99p0wC3GszKuucmL/8SKB9N+dKyzjGeoDAE?=
 =?us-ascii?Q?Vb4oLfPIkSHu7hjTZScjJN7AJnsF1l8ki04Sm4IwTlHTpt7u2DbeZBnJIOEQ?=
 =?us-ascii?Q?uTYRJN7J+Ah+LLoynk2C1g+9tk8e/PbKJAfPtCI7+M6oFNN6xEvPUB1uIxDX?=
 =?us-ascii?Q?7D4ku1/JMaFBmM+0LNSm0W2HqrL7mYh54UiyEoILjUgtvwJeiqY697y7D4dv?=
 =?us-ascii?Q?/y+Qa9RjQRXxjFYC3b0tUlwfrxWwIcsPh1yajhO+U15lTq4KhdakII26I3CP?=
 =?us-ascii?Q?s/Z3QZp3KBmk2ZSDGdRk+u7xbI0NJpa32WVmp6Wofq+tk5Sn8OavFQU0cCkf?=
 =?us-ascii?Q?4qhSOOybvBvQ8iEkBGQlJq/O7t9ja7SVFDBc93Yk1Xa8ktpEQ66/Jgo6hffB?=
 =?us-ascii?Q?0pe2nGWtCUQMm74DFBuDA95wt72Rt6sU0qGBObtACl+1yHLgBvu+LLpksdFl?=
 =?us-ascii?Q?kla3MGwEZyXvavr5oCboHhsiUZhCwF704DXmF/HLpgwNdma6RoYL6+p6TscZ?=
 =?us-ascii?Q?X/zSfjnARPMiHHVRY3JcZloqCqZmv/MMTpXqCyj/DVjdtHgWzuw5BeeZryxN?=
 =?us-ascii?Q?2q1UK0Wkf6zsftivC0b5Y8rLsfQmYy85TB87n+EUi/JI1nmTy8fywaV81iCc?=
 =?us-ascii?Q?ynwuiaIxet18/8DdZlb3kMkjEbD8vUtBI/3s4VDv8BE5reNuPjQe1O8WpByf?=
 =?us-ascii?Q?lBlF/XLsKIDxNeSjdO1QXr3GoDWeacJEdZagP5uktYBcpWyUsd/DZuq8+jxj?=
 =?us-ascii?Q?GXeJ3zJboZgGzOyfkAHPcLTcBC166sDj8JoJX0Kky3Deu10FBNtoWR0amEPM?=
 =?us-ascii?Q?FEM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7828.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?31VOwGa759aYa6UovA9FNOBWH8b6ND4QzdCw8a/M1SfwyWI2Ig6GwVpjx6P0?=
 =?us-ascii?Q?IMjBI87f7SfPpRcbFnWoZzU8m2U7nOUOaCRSK+BcHkW2LRklvVRTkaUh4jEh?=
 =?us-ascii?Q?fhWTMSd3ByiXZWOH3LLpbmC4mBtxqau5v9ucnT+3go/S2fTKSfC90IlOTKX3?=
 =?us-ascii?Q?nRa3IybA2GPcX4z8uNImnRdwYo+TKm3jb8sSgvzrGv34QNgJeL8777lvfpCn?=
 =?us-ascii?Q?1yw82Srof1/TO4+AzEtHJjev4yp3SetnHCHxbmR9F9b+g9VMs6cmqvoZJGcq?=
 =?us-ascii?Q?jnDh6up6sZLsql9xdJJA2nsCgHeHL9We2USGFPm5VCKGuvpH5SJ9IZy0DQEy?=
 =?us-ascii?Q?iP/m00c4k68F1aUj6jMotBgtehtNWfTNo99t+ro1weDc5lUDqVKipaV7Ue/l?=
 =?us-ascii?Q?0HUNqtcjuDuMp8zScZAiSzo19ucj2PwHHSAGDPU5upwSberGgy1awJSwMxj3?=
 =?us-ascii?Q?XvADHGRjtojV6INIfnqBD38Y5AEFTsoHUdULH24QcHcV3biNPknNeIcHGcYJ?=
 =?us-ascii?Q?dDNOHhlM4FAeyb9izVP3zj/GO+9C+juT5MTDZuqt2y1ys/r/vEYJBPz7E5W1?=
 =?us-ascii?Q?LI0q3cWniKJS4ClFXFggwIA4m1ILpypqX5q4udK87z1byxSk+XUkaJvuFqEg?=
 =?us-ascii?Q?RHILFBavS/omez6pJ4TcZMVBttdDBG/Mf9GyP8/Fxz/s3asDDdb41Nyvy+rS?=
 =?us-ascii?Q?sBCk9hVBcyyoHma69zLuJLxgj5UFCfpMHqJu+gK0oBNkKfkIRrPD0FkPE0dO?=
 =?us-ascii?Q?w25y5lE1rXd51q6VXmmVfO66SCjnYP4o3TvZ94ojTVNhzwcTuWtMeTeBajqn?=
 =?us-ascii?Q?7B6N5ZYpoSOvpb8UTTsdEX7T5ovYySvFVn3IuXuZHxbiGBJMKxE53VGydqKi?=
 =?us-ascii?Q?bIUJsOcTpa2JWNc5aQ7mAaYxc/GB5eS71IA+vmkWYL+zuKnS/TJyPe5ksORa?=
 =?us-ascii?Q?BJhZ+eSOzNnpYX8208hAJP1+2cfTxgcqpF/Qg+5ETNdz2mcPckYO+YGpPUXc?=
 =?us-ascii?Q?pzwK91thZkXOAjFjBk7/99CixJ+ws833XSAEbojgrxJiQpnGRPJ1JvSMDsWS?=
 =?us-ascii?Q?PkVSlSPRXLpZ6srlzh+nEs+lKszeotbENxnxp6n7KGs95MG4mgvW8aAu0v8c?=
 =?us-ascii?Q?MRLJT+ZGCx0WVa6Zo8ikguLTBjp4Q9nqJT/NYGOBBHagNO0WoZTd7hoYUXGA?=
 =?us-ascii?Q?WqnGCdp00IrTNCcR4HaQ7CmnKqJ0e7rK++ogOkXPNRkIl7DrsxiGp2jyAZNz?=
 =?us-ascii?Q?3JN9eddut5xFyNB/D6kulERRDwondgJIQrghMhKI7Bb86ONDixUJYVZ8jbbr?=
 =?us-ascii?Q?ahE3tXGe9HG1pfAvHYIdy1V1L/nTAGhquYEefaBWVtT0YMh9l7YxB371ml0m?=
 =?us-ascii?Q?gU8ZJwVkJGQiphbwCsQUJPmzX4QRY/T0ljxhST4JZ3+YaoLrhpWCwYXc/JzC?=
 =?us-ascii?Q?r0YUVQNzoUdPlfJDw2TlL5750DyOxQqg4bm69LjI7C6fuUeyb9aBJDPC7YUQ?=
 =?us-ascii?Q?spEMIARAtBbuel6fUBydvvPFrUTSgDZl+T4O9yvfMS4FqiWMpdQf+GPqoISe?=
 =?us-ascii?Q?fptsP9LvpYUji13nofoV/Frej8IptSKOTsH7ryokY5DjJ7bc2NOBZwH38KWk?=
 =?us-ascii?Q?Dg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 90059df0-c62a-42cc-1721-08dcb7d7ed59
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7828.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2024 18:28:40.8798 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EAaMtjvgB4mIZZ0cPD2OP8lVZzDgYJg/0K0TokqC+O2reBrSnWiLo2l6NHd7VRQUT3Xv48Cr99vY6KnJYzRMD3qektpuCNILg2rldoiMYjA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6809
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

On Thu, Aug 08, 2024 at 03:44:17AM +0000, Matthew Brost wrote:
> On Tue, Aug 06, 2024 at 09:27:08PM +0200, Francois Dugast wrote:
> > Make it safe to have multiple calls to guc_exec_queue_resume() for the
> > same exec queue. This allows the use of this function from a context where
> > knowledge about prior calls is missing. In this case the function does
> > nothing but at least it does not fail on assert.
> > 
> > Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_guc_submit.c | 5 ++---
> >  1 file changed, 2 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> > index 50013e1e7455..782561b21d24 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> > @@ -1623,10 +1623,9 @@ static int guc_exec_queue_suspend_wait(struct xe_exec_queue *q)
> >  static void guc_exec_queue_resume(struct xe_exec_queue *q)
> >  {
> >  	struct xe_sched_msg *msg = q->guc->static_msgs + STATIC_MSG_RESUME;
> > -	struct xe_guc *guc = exec_queue_to_guc(q);
> > -	struct xe_device *xe = guc_to_xe(guc);
> >  
> > -	xe_assert(xe, !q->guc->suspend_pending);
> 
> I think the existing assert is correct. We certainly don't want to call
> resume until suspend_wait returns (sets q->guc->suspend_pending ==
> false). 

In the end this was a workaround for this issue [1] which is now fixed
so I will drop this patch in the next revision.

Francois

[1] https://patchwork.freedesktop.org/patch/606817/?series=136192&rev=5#comment_1103293

> 
> I think if we want to make this safe to be called multiple times we need
> a new function 'guc_exec_queue_try_add_msg'. This function would check the
> msg->link link under lock for empty and if empty add the message. It is
> harmless for __guc_exec_queue_process_msg_resume to be called multple
> times, it is not harmless to use the list twice.
> 
> Matt
> 
> > +	if (q->guc->suspend_pending)
> > +		return;
> >  
> >  	guc_exec_queue_add_msg(q, msg, RESUME);
> >  }
> > -- 
> > 2.43.0
> > 
