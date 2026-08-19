Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F010CC5DF7D
	for <intel-xe@archiver.kernel.org>; Wed, 19 Aug 2026 01:01:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A44310E09B;
	Wed, 19 Aug 2026 01:01:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TRLHg2OJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A50EF10E0A6
 for <intel-xe@lists.freedesktop.org>; Wed, 19 Aug 2026 01:01:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787101287; x=1818637287;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=wdFs6ijYikzK8TsniQl25FczfHFVjwQOpORaX6QVEpA=;
 b=TRLHg2OJMSH/BTkAtmyFLCJ1lbvDzpfn71HokHZpBTl2lYRdQA11YV43
 KHTaVz2JKq/OKII8ZseJwun1Wz3Q3xP1z8iTat6RM6QnigjaaUm8Ux/6d
 Z4euP4QUVmNsno1Q1SjMupSOI+IlEDGEEX1tcS3C5f0rSqR9rjWcDHbQa
 Od7l4eiApU6PTiP476/S9/QlFfbsiwKiPFVfF/WolZ/mO+Ee0HbZsxwDI
 2IjuvCuSmxEoi1q6vmTRFI4VtHINLgFG6q0oIdWpF5XG51JfvBNP7KQjU
 Mcam3AAprZFeAzBAMAlLtniKjfLEL0Wd1AsLRbr64hoMRRYBQs0MZ3Tgj A==;
X-CSE-ConnectionGUID: m+IUA3kMTW6butczZgSEvg==
X-CSE-MsgGUID: bTEJPpgOTtu3fFUiJvMeQQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11879"; a="98761126"
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; d="scan'208";a="98761126"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2026 18:01:26 -0700
X-CSE-ConnectionGUID: tf3krPbcS/qjm0tjQK4xrQ==
X-CSE-MsgGUID: WwPyur2jSPiqDZcoyDGhGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; d="scan'208";a="303599222"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2026 18:01:25 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 18 Aug 2026 18:01:24 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Tue, 18 Aug 2026 18:01:24 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.9) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 18 Aug 2026 18:01:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U3v2z5ILe+AKP3qftif7GJ43y5vEKpK2hvor9Y9kPa3jcwxwdJ5YqNeesqzPfhIYChNou22HvPqADpT9rMy+z3IZaI7Qb9C1KLBWdLynngXpbEfC6AyDll/lwHfE7r9oXTHCroQSd16ldFsBuHX1cxfFCqcLMjKK1yrszYMM1zfHcpEftAy+nb6tAmrWStlt2gMNPxq71srttyvbxpa9AFuu5m04Syw6PZkc8py/4R6Q8pP6yyrrDs3P075K5a1nCJh5Wv0t6gvA6kUuxTpTSIJHYQhS4QSAVecAFqNGRvtLdKNtgQbG8WXtCuCKo+gmR02efCFkR4VY3beMERbjjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C77zBHDzaxNV/7E6mqOML5v/thALUQ4N3PmwRHarVAQ=;
 b=lGuPR0T8a0S6RT2ehM089S8PCd2bHiWwZym4C6/3pRB80MGg0QZsXggQgVCmKrDujU20zAZ1K0ypAd1kzp1VHXeZv1eAd6y3GH6rHL1eCYqEdfuICOkmE7ognUEqTZCZG+nEWS4vV0Q1TA96EyIiv08aLaP5dqqqXPMbfoaOMW6Qwq0DtkyzPsja+jlCOLaPjkahtI6obOPwbhjxoC9/81nPd+RL6o7nAtXC4c2XrfOi0SmiUjVBZdcVMVTVAtinXzdFCwG7/3gm6FXMX477TBwcxcIXD8MklS9PjewocHsk2WjfD+/dGS9mah+VHotAJm37Nw4CFh/4l6Ssh+t8XA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH0PR11MB4837.namprd11.prod.outlook.com (2603:10b6:510:41::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Wed, 19 Aug
 2026 01:01:22 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%4]) with mapi id 15.21.0339.007; Wed, 19 Aug 2026
 01:01:22 +0000
Date: Tue, 18 Aug 2026 18:01:20 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
CC: Jagmeet Randhawa <jagmeet.randhawa@intel.com>,
 <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2] drm/xe/guc: Fix race around q->guc->suspend_pending
 access
Message-ID: <aoUAYKkua2E065zU@gsse-cloud1.jf.intel.com>
References: <20260818183838.273486-2-jagmeet.randhawa@intel.com>
 <aoTJBly70vnRnrwK@gsse-cloud1.jf.intel.com>
 <aoTqUiIq8DMoT1dK@nvishwa1-desk>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <aoTqUiIq8DMoT1dK@nvishwa1-desk>
X-ClientProxiedBy: BY1P220CA0009.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:59d::7) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH0PR11MB4837:EE_
X-MS-Office365-Filtering-Correlation-Id: c3fc5383-aaea-45ec-7f06-08defd8d629c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|23010399003|10067099003|56012099006|6133799003|5023799004|4143699003|22082099003|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info: pv6XK3FAf8iOGc0DFhpQ08xNKeqX21mfQUz9zUtTrSJDiTu0kLrJ0boyXD1Ov3Ma79Xda/vTJdwQ33qu+eMMeN9n+pN65fqTVP1pXYlzEOt3Q6xRCnsWH36PViVaZo7DP6EnDzOud9higgERIUoVRTFa49vhMYgeSKDuL7Ypowb892OqXOseI7JtVvZLZ8wQbjDBU6kjWg5IuvwLZQitEVv19uSXutXGQXqHwRHgnabwzUdJ4nOz60aFsfZqbSNDtkaKZPFgo4FUfF8IOIb+lA4KvQ7s2EitgZXRq0E+5uu46VVC3ZscaFLd0/y+JOGMW/mjgNGQwYepVKrc4TCYcyghUBBrWOUd6YvDA4HXXp+auM5+sLhsnl1eTAaSQsvdJtzwcXgwZ0kohgjI531ljNGhSJaKV7K0gl2hALdzv3jt3sNoDTxXPACqYIdu1qHaCdpmGGgjQ9HNmLaj4xbk1ejSV5k1AsAqeTf1tWxarR4LZnn0XfF2UB4vcc0sB2ldlm9+RntJBkEgzWNygtI6aQhmIPY62/ty5nkrs5OUIK4+NwPluSPWv903aId2sKMHhL5bk6IsRGSCQYXmdH30ksk9RoGdDv6z3ZelGSCBUFThxmECzJEeCdjli0LoecepwjDEvyqaVCTun+lyMGK7KTjd4vDo8HZygAsQOjpXZoo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(10067099003)(56012099006)(6133799003)(5023799004)(4143699003)(22082099003)(11063799006)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?6Vd1h8ZotIEwi+tdEDMxTDgfgCHi/ylFZDYqToXQdmMDqPB1KM/0Ce1HMyWP?=
 =?us-ascii?Q?JO8e0+SBva0uzyYWNtdDD2oCUxSsZPE3nPNiGGH2E3guKtt1GN/oz/ps3ggy?=
 =?us-ascii?Q?W4Ph4o1XVVMbijlj6bmvyRwiyYHlcl8ieiFIBVzEWIi8K5/fkPG8wZJCMg4l?=
 =?us-ascii?Q?2Mpfs1UtV+uWAY3YQspGIwU0Ly5io44iZBWxVQnexzKuvBH0Md3RpYrOlqQA?=
 =?us-ascii?Q?ADMsf6Vl53MjrLGXF5Knb+5NfsBmsHUhohhqtbvhyWaCkW6POQH2/zxtfgBl?=
 =?us-ascii?Q?IKbmHveOthjea4JCrK4t0pw5ukvNR4Um+xBlB/VPqDEqt0Qt+jYeAnk6XC5v?=
 =?us-ascii?Q?V+qDOIGwgt01wGDesROYGCYDLcH13ttsXAHp4T0E6beSEUrDV9T+HxFHa2ie?=
 =?us-ascii?Q?VkQ02KD1C5bv/PXzxu1BlJk3ldD3h0NXzHSeAXs6LtOcfPo3tYZETKMMsJ+n?=
 =?us-ascii?Q?nXHwLETSxdpbw3ih7n21LFqck+IaHQXr0Uc9Rr8DxG6StZbwgrDIuxZcJsh7?=
 =?us-ascii?Q?DMtyoPF/zeJyKuZXPaT2mHvwNUGZ9gESlqxpthZLB2k0XNwiTslXklqNRTbF?=
 =?us-ascii?Q?7mJAO6xXDwIAeAdz4K1cu4AGh7Zsdv8lJ1DUfmVfOKDLKAAOhm1f8xC+MZWt?=
 =?us-ascii?Q?QzBaCM0jFIaTCp/V14B97nMscRKQ9kTGWjWtvNS6Jm8nRoYFcmtRtocvel+H?=
 =?us-ascii?Q?ovvcS6ioxzMnCwkU4IV95W7JUoaFf7YOg0Gw2f1rQiRmVuInu6zeqiMSPMWb?=
 =?us-ascii?Q?gD6PNrnedccnd/DPmPYOCyJeMLBJzkzyGiLQsK7CmSS9qbgxU2nnROOxRiJQ?=
 =?us-ascii?Q?RDza5mS46Zc0es4XGM2edDzDSxIGyp8QYc420YK8vXSVvVvRZbLj01YVCf4z?=
 =?us-ascii?Q?WwZ/UcMw9lhjMYBFZ49zdzlCY7LfkQC68udSPNZchF5ZQCxUL9LcFxDgVg/Z?=
 =?us-ascii?Q?JRGySt6ZCEmk88SQXmxGhe0N8/8ApS17ILigNeG744DTahYDZqOKWKgCeR0l?=
 =?us-ascii?Q?0T81BqsBNukB7j1FqC5FOK2n4oryI6T0yoDQtBfcNeWsiOClDsfbakG5Yy86?=
 =?us-ascii?Q?Rg3/7BsA8ouEDjFYgIM4VwkGnv/dXrDAWMHBrIvWudbS/PNhy4iJCS/jZSK8?=
 =?us-ascii?Q?kELrWGX4CoxDyz3yhhciHJ7lBbPTbrpht5FzQn/ayudh8nW4kPb6xNt9OwIq?=
 =?us-ascii?Q?6QbO5TjvlX9Az0at6QvUTki154jtYJl+zqVfLMVPvCZ0wbrEnqeoO5vqjoGU?=
 =?us-ascii?Q?JnehxoE2VhhYclc0eaX/GIpVViTRPNhC2I14USmOUEJ0Um9zuITnpIcI3UDO?=
 =?us-ascii?Q?WgocpOB8Fq0vC8Qle32H9A7Xd9l8LUKh49hurp9gLl7Z8hMT5TnNYW8hC/Ei?=
 =?us-ascii?Q?YgaR5O4IOfnX7woJuG9COSc5BAR9rCSlqYDmbyzQNCeiksQrLnfxcnRl5g/a?=
 =?us-ascii?Q?m8iDGMLLUyj+AJS/UimR2n9DvgpXe0hnWSLDZ5smv+2O3srlD5vOP9bNi9+8?=
 =?us-ascii?Q?nBCYVveDt5NAay4SV12FkXG91u2pUBUHHgrDZhweAq4WcIoH7pcD7bEjyLKc?=
 =?us-ascii?Q?CQSSmI7Kq3YOSTts54ocVrj6Wq8TfUSkjuh81Rml2+VWu43uFKlV79fK7A03?=
 =?us-ascii?Q?KrhOmYo92yZqdGwXQN+8UYUUk87e0pabv2mVnDiwn58WstuvijQZZmrJMC2m?=
 =?us-ascii?Q?ni/S3PfXa0xaQ2w2tuCcKORge4cJdMxnFBR13V+9qcxc2hh8/tksnrqtj7H3?=
 =?us-ascii?Q?OX7Mno9WE0leGA7sIUhlQPUooyTVofM=3D?=
X-Exchange-RoutingPolicyChecked: slh+sfKOwxPx8e1Xgwm38wdP8YbHehMlxktBavtaNhsSoSZMtZUrhkLY0lAvCuH4jwIDk/jpZXvX0X/ZGue9DlcaOxvcgrPkP/5GO2eURveIn1PH5dZfvG3616mo7FeW3+LwBH1Sbgu2zSHd+VOURkThe231wYpHVF+0TmOnFejqitB25UsupczOEtulPATPdaN/mDusYkbhLsSIx4EzFaPa4ph85Ivr0VEswOd7N7e6+MHsXhTDmM4f+TrpZUDzR7QujiWHkF+936ynkMSK379eBrjK1lnAd8YvVRP/Eq7yAqBXOjMNxnM+zwBhbcnbeb/iKaEpHG6X2NHQ2nge8g==
X-MS-Exchange-CrossTenant-Network-Message-Id: c3fc5383-aaea-45ec-7f06-08defd8d629c
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2026 01:01:22.2572 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t0kh8fBS16GJY8DaXzK8LwaY62bOqhqIYMjIJ4fNppJagJJNE7Ma4NwvWlMxErWyD6qGdjkviJln21Wh5qOYnA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4837
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

On Tue, Aug 18, 2026 at 04:27:14PM -0700, Niranjana Vishwanathapura wrote:
> On Tue, Aug 18, 2026 at 02:05:10PM -0700, Matthew Brost wrote:
> > On Wed, Aug 19, 2026 at 02:38:39AM +0800, Jagmeet Randhawa wrote:
> > 
> > This is designed to be lockless.
> > 
> > > q->guc->suspend_pending is accessed without any common lock.
> > > __suspend_fence_signal(), called from guc_exec_queue_kill() and the
> > 
> > This is actually the problem. __suspend_fence_signal shouldn't be called
> > from guc_exec_queue_kill(). This can prematurely signal a suspend fence
> > while the hardware is still executing.
> > 
> > __suspend_fence_signal should be called in two possible places:
> > 
> > - Naturally in G2H handler (handle_sched_done)
> > - Or in global event that takes down the GuC firmware
> >  (guc_exec_queue_stop)
> > 
> > With that, a lock isn't need because the state machine / firmware
> > interaction ensures everything is race free.
> > 
> > So I think the solution is ensure __suspend_fence_signal is called in
> > the correct places rather than adding protection via a lock.
> > 
> 
> Matt,
> 
> I think it is probably not as trivial as dropping __suspend_fence_signal()
> from guc_exec_queue_kill() for following reasons.

Let's take a step back, has existing code been linked to any bugs?

> 
> 1. __suspend_fence_signal() is also called from
>    guc_exec_queue_suspend_timeout_ban() if suspend_wait times out.
> 

Yes, this is another example of where this should not be called.

> 2. Calling __suspend_fence_signal() wakes up any suspend_wait(),
>    which otherwise will have to wait 5 seconds before timing out.
>    If in guc_exec_queue_kill(), if we just try to wake up suspend_wait,
>    without clearing suspend_pending, then a resume() might run before
>    TDR kicks in and hits the !suspend_pending assert.
> 

Don't do a wake here.

> 3. Even if we drop __suspend_pending_signal() from guc_exec_queue_kill()
>    and guc_exec_queue_suspend_timeout_ban(), we still have
>    handle_sched_done() and guc_exec_queue_stop() which can race against
>    each other in accessing suspend_pending and clearing it.

I don't think this part can race.

 - __guc_exec_queue_process_msg_suspend, this is only there for GT
   resets racing (I think). This should be executed before or after
   guc_exec_queue_stop() but not in parallel.
 - guc_exec_queue_wait_suspend_done(), this on wait queue and we don't
   have lock upon reading, at least in this patch. So if justification
   is all readers need a lock, then this is missing in this patch.
 - guc_exec_queue_stop() touch this but this code is only reachable
   when GuC exec queue is stopped and CTs are down. I guess a new
   suspend could come in and race, so maybe in a lock is needed here.

> 
> So, probably this locking extention patch here might be simpler and
> effective.

I'm thinking this need a bit more rework and would like to get this
right in single patch. I'm fine with a lock, but let's at least make
guc_exec_queue_wait_suspend_done() consistent in using a lock and remove
the two places we should not be calling __suspend_pending_signal().

Matt

> 
> Niranjana
> 
> > Matt
> > 
> > > suspend-timeout ban path, clears the flag asynchronously. Meanwhile
> > > handle_sched_done(), guc_exec_queue_stop() and
> > > __guc_exec_queue_process_msg_suspend() check the flag and then call
> > > suspend_fence_signal(), which asserts that it is still set.
> > > 
> > > As the check and suspend_fence_signal() are not atomic, the clear can
> > > land in between and trip the xe_gt_assert(q->guc->suspend_pending).
> > > 
> > > The flag is already set and read under the per-queue msg_lock
> > > (xe_sched_msg_lock()) on the suspend and resume paths. Extend that same
> > > lock to the clear paths (kill and ban) and to the three check-then-act
> > > sites so the check and the signal are atomic with respect to the clear.
> > > In __guc_exec_queue_process_msg_suspend() only the non-sleeping branch is
> > > wrapped, since the other branch waits. In handle_sched_done() the flag is
> > > snapshotted under the lock and deregister_exec_queue() is kept outside it.
> > > 
> > > v2: Document that sched->msg_lock also protects
> > >     guc->suspend_pending, which indicates a suspend message is in
> > >     flight, in addition to the sched->msgs list (Niranjana)
> > > 
> > > Signed-off-by: Jagmeet Randhawa <jagmeet.randhawa@intel.com>
> > > ---
> > >  drivers/gpu/drm/xe/xe_gpu_scheduler_types.h  |  5 +++-
> > >  drivers/gpu/drm/xe/xe_guc_exec_queue_types.h |  5 +++-
> > >  drivers/gpu/drm/xe/xe_guc_submit.c           | 29 ++++++++++++++++----
> > >  3 files changed, 32 insertions(+), 7 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_gpu_scheduler_types.h b/drivers/gpu/drm/xe/xe_gpu_scheduler_types.h
> > > index 63d9bf92583c..78ef2e8ded4f 100644
> > > --- a/drivers/gpu/drm/xe/xe_gpu_scheduler_types.h
> > > +++ b/drivers/gpu/drm/xe/xe_gpu_scheduler_types.h
> > > @@ -47,7 +47,10 @@ struct xe_gpu_scheduler {
> > >  	const struct xe_sched_backend_ops	*ops;
> > >  	/** @msgs: list of messages to be processed in @work_process_msg */
> > >  	struct list_head			msgs;
> > > -	/** @msg_lock: Message lock */
> > > +	/**
> > > +	 * @msg_lock: Protects @msgs and guc->suspend_pending (indicates a
> > > +	 * suspend message is in flight) of exec queues on this scheduler.
> > > +	 */
> > >  	spinlock_t				msg_lock;
> > >  	/** @work_process_msg: processes messages */
> > >  	struct work_struct		work_process_msg;
> > > diff --git a/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h b/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h
> > > index d27826b36649..74b711abe257 100644
> > > --- a/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h
> > > +++ b/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h
> > > @@ -52,7 +52,10 @@ struct xe_guc_exec_queue {
> > >  	u16 id;
> > >  	/** @suspend_wait: wait queue used to wait on pending suspends */
> > >  	wait_queue_head_t suspend_wait;
> > > -	/** @suspend_pending: a suspend of the exec_queue is pending */
> > > +	/**
> > > +	 * @suspend_pending: a suspend of the exec_queue is pending.
> > > +	 * Protected by @sched.msg_lock.
> > > +	 */
> > >  	bool suspend_pending;
> > >  	/**
> > >  	 * @suspend_count: Reference count of active suspend requests. The
> > > diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> > > index 9036f89dff7d..c565c1d32d3a 100644
> > > --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> > > +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> > > @@ -1928,9 +1928,13 @@ static void __guc_exec_queue_process_msg_suspend(struct xe_sched_msg *msg)
> > >  			set_exec_queue_suspended(q);
> > >  			disable_scheduling(q, false);
> > >  		}
> > > -	} else if (q->guc->suspend_pending) {
> > > -		set_exec_queue_suspended(q);
> > > -		suspend_fence_signal(q);
> > > +	} else {
> > > +		xe_sched_msg_lock(&q->guc->sched);
> > > +		if (q->guc->suspend_pending) {
> > > +			set_exec_queue_suspended(q);
> > > +			suspend_fence_signal(q);
> > > +		}
> > > +		xe_sched_msg_unlock(&q->guc->sched);
> > >  	}
> > >  }
> > > 
> > > @@ -2130,7 +2134,9 @@ static void guc_exec_queue_kill(struct xe_exec_queue *q)
> > >  {
> > >  	trace_xe_exec_queue_kill(q);
> > >  	set_exec_queue_killed(q);
> > > +	xe_sched_msg_lock(&q->guc->sched);
> > >  	__suspend_fence_signal(q);
> > > +	xe_sched_msg_unlock(&q->guc->sched);
> > >  	xe_guc_exec_queue_trigger_cleanup(q);
> > >  }
> > > 
> > > @@ -2392,11 +2398,15 @@ static void guc_exec_queue_suspend_timeout_ban(struct xe_exec_queue *q)
> > >  	 */
> > >  	if (xe_exec_queue_is_multi_queue(q)) {
> > >  		set_exec_queue_group_banned(q);
> > > +		xe_sched_msg_lock(&q->guc->sched);
> > >  		__suspend_fence_signal(q);
> > > +		xe_sched_msg_unlock(&q->guc->sched);
> > >  		xe_guc_exec_queue_group_trigger_cleanup(q);
> > >  	} else {
> > >  		set_exec_queue_banned(q);
> > > +		xe_sched_msg_lock(&q->guc->sched);
> > >  		__suspend_fence_signal(q);
> > > +		xe_sched_msg_unlock(&q->guc->sched);
> > >  		xe_guc_exec_queue_trigger_cleanup(q);
> > >  	}
> > >  }
> > > @@ -2614,10 +2624,12 @@ static void guc_exec_queue_stop(struct xe_guc *guc, struct xe_exec_queue *q)
> > >  		if (exec_queue_destroyed(q))
> > >  			do_destroy = true;
> > >  	}
> > > +	xe_sched_msg_lock(sched);
> > >  	if (q->guc->suspend_pending) {
> > >  		set_exec_queue_suspended(q);
> > >  		suspend_fence_signal(q);
> > >  	}
> > > +	xe_sched_msg_unlock(sched);
> > >  	atomic_and(EXEC_QUEUE_STATE_WEDGED | EXEC_QUEUE_STATE_BANNED |
> > >  		   EXEC_QUEUE_STATE_KILLED | EXEC_QUEUE_STATE_DESTROYED |
> > >  		   EXEC_QUEUE_STATE_SUSPENDED,
> > > @@ -3222,13 +3234,20 @@ static void handle_sched_done(struct xe_guc *guc, struct xe_exec_queue *q,
> > >  		smp_wmb();
> > >  		wake_up_all(&guc->ct.wq);
> > >  	} else {
> > > +		bool was_pending;
> > > +
> > >  		xe_gt_assert(guc_to_gt(guc), runnable_state == 0);
> > >  		xe_gt_assert(guc_to_gt(guc), exec_queue_pending_disable(q));
> > > 
> > > -		if (q->guc->suspend_pending) {
> > > +		xe_sched_msg_lock(&q->guc->sched);
> > > +		was_pending = q->guc->suspend_pending;
> > > +		if (was_pending) {
> > >  			clear_exec_queue_pending_disable(q);
> > >  			suspend_fence_signal(q);
> > > -		} else {
> > > +		}
> > > +		xe_sched_msg_unlock(&q->guc->sched);
> > > +
> > > +		if (!was_pending) {
> > >  			if (exec_queue_banned(q)) {
> > >  				smp_wmb();
> > >  				wake_up_all(&guc->ct.wq);
> > > --
> > > 2.53.0
> > > 
