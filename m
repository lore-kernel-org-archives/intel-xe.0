Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F39B4D2444F
	for <intel-xe@archiver.kernel.org>; Thu, 10 Oct 2024 23:04:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF01B10E9F4;
	Thu, 10 Oct 2024 23:04:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CMuZ3r7E";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0042A10E9F4
 for <intel-xe@lists.freedesktop.org>; Thu, 10 Oct 2024 23:04:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728601448; x=1760137448;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=AEVcXxsXyL8SPA+a3HxOOYiIOhbcjXolJsCCImmuZRs=;
 b=CMuZ3r7EBue+b7a50X3XijHmwI7a+4ccCnd8GfWZMIIiv7w0kjFypkus
 g5ppN7zEBMLcGd0PpCipyc3asdx6YoEUVhcX/x7T77AGaxkjlwQJPqfzy
 0SfJ/KhxnlAA94/iwfGrnPCmtTJzSPD1c5FzD+nW90TCoCGhZ/NWekw5O
 9cUCFqNGjHBtYsPhgbogtco6/2BzLl8Bztc8Dxa3IEE7XvVq+RcEsPLSB
 GmVmjXNTp0Q45e3JCooIHwCdAp8iuZiIbL8/YdugotEKgLdTj0GwnTPx4
 isXfesyj9GQst8gpne8qmdlHM28i1XR8ia4XCooX+PyFd+wjIRIrgEGFV g==;
X-CSE-ConnectionGUID: 7lZ74v2OSGuVl8YC9WcU/A==
X-CSE-MsgGUID: q1AUaEgSRXGSSfd4IvLVaA==
X-IronPort-AV: E=McAfee;i="6700,10204,11221"; a="28100362"
X-IronPort-AV: E=Sophos;i="6.11,194,1725346800"; d="scan'208";a="28100362"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2024 16:04:07 -0700
X-CSE-ConnectionGUID: gpCC2CHWQGWc5P3XI8X67g==
X-CSE-MsgGUID: Hl/zLqlyTs6RUEEKonKuOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,194,1725346800"; d="scan'208";a="76831227"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Oct 2024 16:04:06 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 10 Oct 2024 16:04:05 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 10 Oct 2024 16:04:05 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.47) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 10 Oct 2024 16:04:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cjshqa3u8ujSXpSk0dwAdRRsumRI+OxeyUR18keEdhyIQe3rV7gDhX4/hnF1HdkeyUIgmqTT8nl1rod/6cx8cQr5WArPcymz2CU8vi7oU+IEvsZYEbwp9Eny2TM3pCcsiNd9j9jw4VXoPKaA1vY4RNtJrvZbIZ1ZXFg4mBNwYL+hvTYphIOLCbOv+oPNqw4Tvvqk+olVd8iOqx2gKWdELIBanyB2136R0oO77RrqqHY0UoulDZFNmjZJULGqIVXXXvHr1kjaNg+7qUEHMCQEHdrS0zujYfFrFiU1GKuMAkP3zVMPs15mAWkQuURDWNtMp8IXEQIuCfo6iBgiBSuABQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GHDJtgUrcPkdmmQ/H7UjRJSTeOSdWuqAlmCFiLq2PJo=;
 b=Jkn4muYWMJHNhz1mXDOc73Rc9Fq3j2+7FUvA6pbA0WB49l7pChAUdDMDDfWR4Dh/BSUv47hwE4sRIgNf43gBGotsPKA0qAiCdpK3NtUAqV77S5zd55qbXbh485gF0YCd9JhUg+NVgfN2afSBwWrf1Wf1vUpYyQObTmOhYA7lKVie/sLp2TM1+gX4U2dQPKl2mwdsPgB1FivzIxXy47I4qomzD8T0Ci7ysyjinNsUI3xAMO0gvS3FTor2N+fCJ0HFwwD9R7/wifddOkYcmvHHsso1YbrV6AzJ+EGXx2JC0aCW4V9h3F9s4Pc64ZzY5oSMgGn5CKhH1VInQDpx/yCv7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by IA1PR11MB7294.namprd11.prod.outlook.com (2603:10b6:208:429::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.18; Thu, 10 Oct
 2024 23:04:00 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.8048.017; Thu, 10 Oct 2024
 23:04:00 +0000
Date: Thu, 10 Oct 2024 23:03:40 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: John Harrison <john.c.harrison@intel.com>
CC: Badal Nilawar <badal.nilawar@intel.com>, <intel-xe@lists.freedesktop.org>, 
 <anshuman.gupta@intel.com>, <rodrigo.vivi@intel.com>,
 <matthew.auld@intel.com>
Subject: Re: [PATCH 1/3] drm/xe/guc/ct: Improve g2h request handling during
 async gt reset
Message-ID: <ZwhdTFlMNYidCa8u@DUT025-TGLU.fm.intel.com>
References: <20241009105645.1416588-1-badal.nilawar@intel.com>
 <20241009105645.1416588-2-badal.nilawar@intel.com>
 <8fc6387c-90cb-46b0-8d4e-5c2a933df911@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <8fc6387c-90cb-46b0-8d4e-5c2a933df911@intel.com>
X-ClientProxiedBy: BYAPR01CA0035.prod.exchangelabs.com (2603:10b6:a02:80::48)
 To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|IA1PR11MB7294:EE_
X-MS-Office365-Filtering-Correlation-Id: a9377f9a-285b-45c6-1ddd-08dce97fd39e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?SLCC3Kv4Fm7aiVxKLV5x33Yt0mAQ3s3KGUoOT3U/qLbQjQ5qxkYqApwbZ3T7?=
 =?us-ascii?Q?97mdQufonMLCiTJeJ06l7AK4zPG2DtVuZPVfgNQkXLzw0bIcrsnqRoTiKdN5?=
 =?us-ascii?Q?t8fPN0Ff7EMg67hHbIhD+2zQ1EoskgtMNytx7XzeAgtEv4yxZlTLk8S+CB6a?=
 =?us-ascii?Q?6DUbgTaDGfT50erkzU9+kDEeREwuUONfPH/YAZ7hLCAs/Yd2h1ZdoZcmPSgZ?=
 =?us-ascii?Q?ZemfcdS7KBUZDenKoOzFKnkLJxI9hDqqiIs49NsHauzdexIm+OByK5kZTwNo?=
 =?us-ascii?Q?EOrOG7vh7WZUfSeZoB+MVq1QWDq0MncMZfaGmC5Obrsl2GxFWH0IGKtmWyuf?=
 =?us-ascii?Q?3Ol1WujVKS4B1WlnfB/DXrx956WD0syKw5592AkVCQ/uZQ0EBVyAgHKTRWb+?=
 =?us-ascii?Q?lgwfN7ERop1Bj3oSBJD2qdNBcq5L0jyR115YeaO9+PU2E7OqwEmCnKEcik0q?=
 =?us-ascii?Q?E92zRaM2bNhadWU8cvXf11OxceAq/avkIAJdo0sTgkbppekmImIttK46X6yj?=
 =?us-ascii?Q?4J0JYzfErn+jWmplQHHI2q8gcaxRkt3sXP0MWE2DPBq93n+kpYdkCN7bsg6o?=
 =?us-ascii?Q?/KiXpXeMerJQUWf20PhSnpR5fRFpdVlxpBrxfx5ETbm6f4U3o8yYMsM2ugyl?=
 =?us-ascii?Q?26f0hvHYZVFk8uk7SEyUnQ3rVbN7AYITvbKC8Nk2bu5QsBdRnfUSh5dneKlj?=
 =?us-ascii?Q?Tc54Eleyvgp+sU/WFYR3gjnPW0Qrn1fNIvqOZ2IqkHZrpauGXuxXaJiJNKy8?=
 =?us-ascii?Q?12mawMfJQFCcLI2gKypK37+R03FP6UIUYJrOx8a07Ds+SxJZhwUjSTJrxAxD?=
 =?us-ascii?Q?lM0Ng3hHKBTVNVE5P3+3QFPfzIlRyjjyGJDo8mWXMbnusK4HRO78Wf59W/bV?=
 =?us-ascii?Q?4fofaVjdCV8Rg9bu3Z1n0tzEfeny21wQyVZBzbF16aJfOgyNnSAXEqp6e3oh?=
 =?us-ascii?Q?TRd2hgrOZzQO0TxSVYm4yHK+JJiHAGguva7LDPoRma1m5uRtTbyUwveH8QQD?=
 =?us-ascii?Q?Nc7w/mtsUIftyTNQkGua5hsfZ1NBrUdwQmvi2+gVZSmUlqElgH7crKxyKVOV?=
 =?us-ascii?Q?7x+V93Hdyk41q5M9OJfZHsWfa0By8hi3J4w/X1bG1WcbHSnMdXhqM9t/x8v6?=
 =?us-ascii?Q?oID/rqCTZ3pq75qu2bLYNWViZY2Z6YqssejWp7N3DVq5S4qxUCFhIQB1v6uM?=
 =?us-ascii?Q?+hwZwLiW1mADaZkNaiwuaM6CpqA8k4rx7xPU0taPSDgs0Jtuz65+7YKGc58h?=
 =?us-ascii?Q?ku3XgkvODwW69fOhRJYJrgVl55WIz2OnnRRQ7i0Y0w=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?IVMMh07sIEz46u3k8+UcI34Idt23l5i6AnexHrXSgUGCL1dqGCoYT/2cAKJT?=
 =?us-ascii?Q?5XvzxfF9eUMw5U1P8gQKrtaAeCg+J/M2GuaXhL4uELPdbPZK5Y8VCXgsurG5?=
 =?us-ascii?Q?JDfMI68zgA/e99GuSXaJqTljiNl5N6AduFsVtKWK1+pz9k/c6jsafc2A6IIm?=
 =?us-ascii?Q?bHvqIiM7zjlW8uXxM9pe28LkW5qW4srzVq7f3aJ4AN3PyckM59LNaaU8cVz8?=
 =?us-ascii?Q?t0apHUVr37b4NGbcGUtXRlOjLNVRZekIHA+DtPbcsNVfsdzIyyCQhgm5aUKB?=
 =?us-ascii?Q?XGRyWlhSVjDNiqkPTDd6B/JUV6EhROGCAgWUlJGvYtjW0F0LTMvhF4Z6vilk?=
 =?us-ascii?Q?FIYDZZB2rtyfzI/b6waNWwQu834VuljUmyLkDzTbE6mHtmvHtivomWahzkaO?=
 =?us-ascii?Q?ojuoduH0GaVH9xnPiOd7QjAzgt5uBNm7CCFSd1nCVUtD83f5H5URV8epBsYv?=
 =?us-ascii?Q?ErgPu3sIQN1Wsi1uiYcBcfDwmTkwXVxnpsDKSuwgDDxyms4j1A2fzknYoyig?=
 =?us-ascii?Q?rLtcffERTmKJdtjYNLelYXPerdmSxhzoJA5S+ktiE0gkFAV3wTiKcuou4JNR?=
 =?us-ascii?Q?8H7WtFCamXd0WEAStRUgnLV/l+/CkXuLsYLLOauPbsfNYq2qANSPsPcHswOu?=
 =?us-ascii?Q?mwZjM9J3gIeHa9r/QC0rrv58Oe7eMC2ItngGpr4d1qontM7PeDm3PfzF9MCl?=
 =?us-ascii?Q?YOpWHw3MPVZEnSRDdgpKr9rXFu6YCKSxopfQIPy/Ud0vCMIAVrX5P/PCy3Nv?=
 =?us-ascii?Q?zFbAmefY7VQM/OcnFxLq+dPSiJVd6r36piW/crmHaS0y/7z7ISQy3nayvN6b?=
 =?us-ascii?Q?XKIVWDG3VV/8QeYqBE9PSK7Ek6igzm0NPYqCXpg23S8oLus7trSFGFlv735P?=
 =?us-ascii?Q?Mlpbkw0O2N+dNUsiarWLnAWvV9+84/7hHaAeXRkNjI5hdX/CDOayFdQcK5/3?=
 =?us-ascii?Q?Xo+WPRZjIf3X+GFPTYBnFmQRGGmasJRpI0ZhWk1wR1HOs49ZI0/bhwYK+m0H?=
 =?us-ascii?Q?PHTqH69wjQAoHWhHWnWfZEe6G1el14r3wWrd8U8TA802ZvjncgqUxVsrjy2Q?=
 =?us-ascii?Q?BIDLWvxNtglj9UFJ8SJZM69xpJ/UTvp3I9cbJLhIet2X+AI9FIEyjejVKhSK?=
 =?us-ascii?Q?2JYAbG+TqcxdI6Ob9BvjBcxxf+KEKG41FhhMq7lGCeBFy8BE41OoXm577cX+?=
 =?us-ascii?Q?N1C4KGD5Gf4mfoHanw63LORGjotoxAuka9dyGp6/T0n9LGCoJUxan5TpWEAX?=
 =?us-ascii?Q?Bq6q2uvYPaxfvhY3RPa9GmWGKnTA51n39Kwk6Tc4gP0eNFnEbwL4w5cJ/kR2?=
 =?us-ascii?Q?zcdmrLeC8U9J6XXfJNAUYxqCPqWkhxvjUc6M/w1L6yf+NRb8H6jb9bddZmvw?=
 =?us-ascii?Q?nvFH55tkRwf9bZ15flVb3CRjZtzRIFKnqCg7h1Dyd9inIkecNEWuDlvlmYxO?=
 =?us-ascii?Q?wI11ihm+jC3q/HYI7KaLlmaWKO18c8IGBBFyvt3te0Dvl61JhEY36EOoKPs6?=
 =?us-ascii?Q?lRGJilbwOy3Ri6Ax3L8TiKEa1oaw4sYFJ8uA3CLrDSNkGf2+JbU6DHq5pOkC?=
 =?us-ascii?Q?5IXRfdjmA1fLVWTUVapqf7ILIfUOTxkp9jlIW5BGhHFhBsTx/iSqhqhq8esh?=
 =?us-ascii?Q?Cw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a9377f9a-285b-45c6-1ddd-08dce97fd39e
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2024 23:04:00.1278 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gi5Iemr24RPpMehXcblxe9MmfsRAIdemI6ernSQ6caeZdsq+HZ4ZkohblCt8On/3fNnhJN0dF6He6p6V6Sh43A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7294
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

On Wed, Oct 09, 2024 at 12:41:36PM -0700, John Harrison wrote:
> On 10/9/2024 03:56, Badal Nilawar wrote:
> > It is possible that a g2h request may be cancelled while waiting for a
> > response due to an asynchronous gt reset. This commit ensures that in
> > such cases, caller will be notified by returning -ECANCELED.
> > 
> > Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
> > Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
> > Cc: Matthew Brost <matthew.brost@intel.com>
> > Cc: Matthew Auld <matthew.auld@intel.com>
> > Cc: John Harrison <John.C.Harrison@Intel.com>
> > ---
> >   drivers/gpu/drm/xe/xe_guc_ct.c | 16 ++++++++++++++++
> >   1 file changed, 16 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> > index c7673f56d413..b93b2821e4e8 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> > @@ -512,6 +512,9 @@ void xe_guc_ct_stop(struct xe_guc_ct *ct)
> >   {
> >   	xe_guc_ct_set_state(ct, XE_GUC_CT_STATE_STOPPED);
> >   	stop_g2h_handler(ct);
> > +
> > +	/* Notify callers that CT stopped and G2H requests are cancelled */
> > +	wake_up_all(&ct->g2h_fence_wq);
> >   }
> >   static bool h2g_has_room(struct xe_guc_ct *ct, u32 cmd_len)
> > @@ -1018,6 +1021,19 @@ static int guc_ct_send_recv(struct xe_guc_ct *ct, const u32 *action, u32 len,
> >   	ret = wait_event_timeout(ct->g2h_fence_wq, g2h_fence.done, HZ);
> > +	/*
> > +	 * It is possible that the g2h request may be cancelled while waiting for a response due
> > +	 * to an asynchronous gt reset. In such cases, return -ECANCELED.
> > +	 */
> > +	mutex_lock(&ct->lock);
> > +	if (ct->state == XE_GUC_CT_STATE_STOPPED) {
> > +		xe_gt_dbg(gt, "H2G action %#x canceled as GT reset is in progress\n",
> > +			  action[0]);
> > +		mutex_unlock(&ct->lock);
> > +		return -ECANCELED;
> > +	}
> > +	mutex_unlock(&ct->lock);
> Is the lock worth while? It only protects a single read of a single
> variable. Or is the intention to serialise against any other operations that
> might be in progress and holding the lock? If the latter, it would be better
> to include a comment to that effect.
> 
> Also, the very next statement in this function is 'mutex_lock(&ct->lock);'.
> So now you have unlock/lock back to back which seems redundant.

See my reply to Badal, this flow doesn't look right.

Matt

> 
> John.
> 
> > +
> >   	/*
> >   	 * Ensure we serialize with completion side to prevent UAF with fence going out of scope on
> >   	 * the stack, since we have no clue if it will fire after the timeout before we can erase
> 
