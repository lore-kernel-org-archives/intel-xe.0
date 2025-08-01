Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 740CAC87FCA
	for <intel-xe@archiver.kernel.org>; Fri,  1 Aug 2025 21:09:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2697010E065;
	Fri,  1 Aug 2025 21:09:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TYMwu3d5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0887A10E065
 for <intel-xe@lists.freedesktop.org>; Fri,  1 Aug 2025 21:09:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754082579; x=1785618579;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=HruKLIdSjfnBAdTCCkFN2WbcQjdRJaHT+GQzoKeWJms=;
 b=TYMwu3d5MI9SYjqHBiarepeW5efE3zqQTE/5w8YfF/F7SEXKGLbyp1dF
 L/9N+kW97UQHB31Elrglu/PgjLzLAIwCICCgicHVB6fS1hvb8tCIDi3wr
 UDR4fte5JARo/btaD5VRbWoofPwlT9WFtfuC4m/rHYjAvqCYfWkQII5YP
 NuCGywHmrwN65K64isuI3OBJfRNKe5eYw7TLQgm70/3eiwc2VvVOdWouI
 gmr43W/UIgmynSZ5OkK9wbcXwY/K5ovEsp4kR9t0cmS3EVYDaW0q083n/
 J1GVbF74xje46myTyyQZawWdFW1rD1TKDCOmx4T9LZNMlRAgTElxWPkNf w==;
X-CSE-ConnectionGUID: gvP8O8VnTgWePFoMJYrIcg==
X-CSE-MsgGUID: ilx6aKlxS1ynobZ1zVDwdw==
X-IronPort-AV: E=McAfee;i="6800,10657,11508"; a="73895996"
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; d="scan'208";a="73895996"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2025 14:09:37 -0700
X-CSE-ConnectionGUID: j5bpjSn7Rc2Hd/0UzSSPtA==
X-CSE-MsgGUID: V21cm8n8TgqRKLVKzWrZ4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; d="scan'208";a="167845866"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2025 14:09:36 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Fri, 1 Aug 2025 14:09:35 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Fri, 1 Aug 2025 14:09:35 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (40.107.92.58) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Fri, 1 Aug 2025 14:09:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=THeEWPZZCWwqvo3XLr7h9S4MRVyiNm9lfTp58kbkN6UUTC3+wMAwX0yL/EdZt3cbUpE8fgvwPWfRaCDNo/xDHXS38HA5eQFB2FT6crb/wo8x6Wx/YTvRqZS9ob0yjdYuH5G/35B2eJndqypbqnP+FxDkAf1HYzwlrN8TPv4NjF/4e5VSACEJD7VA1fcVlCErQ8VPdNqPkGVcvOWlmkWlLzTLXMJzOkA93t2XOrDAx+HkFi8SgCQ4QgKDB9mfNybEST20Cw9XZDkD5c+1MJcF3nZEejGdf9/B/aj30IwPV+psHLJEKnWFvgD39+jhv3y/OWSfzooRnQQn7Nf8O/Xeuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CXm2jlyfk5+hQ2q5wxDmbBYIwwMjbWmy0t5FwuFuWBE=;
 b=yyVpSK0/muobgvh+lrGPelCMsa5AoeTWZC+iNcaAS8zqbHdZsoZGmMg6KAg58DKEXMw0htNwGcQVZrT5a5h9x/BB441sZneMUDpb5Cti35Eev7Fx1HsSjF8LA8+mypcHxxUOZLSCLHg7qx4FY+3MBbM4YPtcYc0CZa+ku9JaKwPiO5rxItZQwvnOec3kVWjXnWsiyaakGLuaAz8g6NEi8YGwwnMWJGh1YRQpvusZVrOt6lZkcCr9JX95po39Tf6KOyU+QPLo6rlnTTyZqMOJCqtC4BagZy+sRR/kAoSPd1jStDbg09mxhp7yArbRxFVDSM9LVVCtIBKvuKF7YNPvtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by CY5PR11MB6211.namprd11.prod.outlook.com (2603:10b6:930:25::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.11; Fri, 1 Aug
 2025 21:08:52 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%5]) with mapi id 15.20.8989.011; Fri, 1 Aug 2025
 21:08:52 +0000
Date: Fri, 1 Aug 2025 17:08:49 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Jani Nikula <jani.nikula@intel.com>
CC: <intel-xe@lists.freedesktop.org>, "De Marchi, Lucas"
 <lucas.demarchi@intel.com>
Subject: Re: [PATCH] drm/xe: fix stale comment about unordered_wq usage
Message-ID: <aI0s4dq8rpw3hyZu@intel.com>
References: <20250731111214.1130130-1-jani.nikula@intel.com>
 <133ec65ccd361b81193e7f5d8ef4d4854b0e89b1@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <133ec65ccd361b81193e7f5d8ef4d4854b0e89b1@intel.com>
X-ClientProxiedBy: BYAPR11CA0086.namprd11.prod.outlook.com
 (2603:10b6:a03:f4::27) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|CY5PR11MB6211:EE_
X-MS-Office365-Filtering-Correlation-Id: f8441e5d-6307-48d9-4b6a-08ddd13f9e07
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?lOfyVlS3Aj7nGwfiLl7neAdXSs1f7FHFYnTPgYVnJt5GspqDnz3xP8RgF3XG?=
 =?us-ascii?Q?bw4Xtr0iEzbJFyFA2egDbsH035luzzDY/hnKN+5nj2Q+caeV9sxaTyMnOs3+?=
 =?us-ascii?Q?IUzoRffV5lczEXbrc54zJ7fSOspjuoDkT9BB3IslAd0IwiuOctoaS1SvctMA?=
 =?us-ascii?Q?PnjeNqiOiR9C0WehA62z7I1+THbWK8NatVWfFX492UFOdLV+0OzFS1hDeTMm?=
 =?us-ascii?Q?KHomD5BIUD0WjfGzZm+FBuqxx7zZ3WPgsaWhB3IJYI+7zzj/tFL5ZZNrTfeM?=
 =?us-ascii?Q?vLjR+TzIaIREdhN9Tn/dK4cyxdEYaNfpmVeIhOOGFCbs3/dW+0D/ryV0dH0r?=
 =?us-ascii?Q?DZ8z+jEjx2Ws6j/76/Shay5vLtD0h5td5UwW+QW5BiMK9nzPiifN1T04bSk1?=
 =?us-ascii?Q?sHBPzNSvVLEJMy3y0oZMoyfcg0+uOetGxvRaclo+ljrfuKtKU0Wn0wZIoTln?=
 =?us-ascii?Q?7aF6Z8p7WDRivXXDO+a/CvH9g/bkkiGZc49633Qi4wokDQHl+fDIK0H0I720?=
 =?us-ascii?Q?NHibZ77DgQAFvrSi7FFHfgk3O/6+IcmvHlad0eY26eYOfdHdAbckxgCrE9ae?=
 =?us-ascii?Q?CLapTUYBKKMz9FyST9jvcGGIdKnmtbE6oR94KLMR5NuIiIxWOsd6Ra83h/9B?=
 =?us-ascii?Q?RjXLEzxjD66sEgZG0UXN7fssh8SWyqVYowhaD4YAxbIsiXFfrapKE/tQ+grk?=
 =?us-ascii?Q?R5kdSmZ5jcnpgTf6t0nQ65OuVKR75CpescDhurDCvYsasOmg5XM0qvvGse6B?=
 =?us-ascii?Q?+kDP+CSJkVe8cbgReXRPQq+LMvEz3mZG1/lafkClvc7e1NgoXSvSTK6iRVTr?=
 =?us-ascii?Q?PlKTwok/eW1zl+6BhVBM/vHfkQ3TEWtS0zJiIuWpcogcvQdpb0UBsXEx2FMs?=
 =?us-ascii?Q?ih2p3fEbjI+mTGlItjjwoCMzD9pknhvWAyzhxhml3dj8Sn+CGVPxVjVMSNo5?=
 =?us-ascii?Q?uKqKAvUBSEuksXUURZH0gdMprJqSKAXMLODdI9bFNA2wmydW6GIHrOeMv1UT?=
 =?us-ascii?Q?XjtuxtUbi9oPZsT/Z3DwXa6yT4CXrZIO3dX1swHsQYkWQecYwRk7TfT3o3gv?=
 =?us-ascii?Q?SmLpR/qos66NSlIQU4elvBzbgP7TwUs4TIJSfGnzABNA4WnhlKI/FL76p5WX?=
 =?us-ascii?Q?38vgVk6V9LWVVncoBHd355oE4I3EAVWwGfRvp3mvoIB7WycgcnfByf05cYE9?=
 =?us-ascii?Q?9Rm1vBYBCSRssa1C9HXzOry3gQFXwbNyINXnJotdB5efiGGwP5FHiQnMeeme?=
 =?us-ascii?Q?tKs1i4cUiYU5H3fBQknqyoueZ/23jJ+1g8+xvTFowTxIcV/pY16OT+p+JTNF?=
 =?us-ascii?Q?NMNAl/5MjsvFpIXUqijbCyjUqiQh9CVhX/8JxNNapZUQIdSPSQQxIBBXyiBd?=
 =?us-ascii?Q?uEG5R1Jv9CwVTQdEsYaYhuN4/2oMRQ5dl1hjTFslMr6iLTeXxAkoquEXQA6n?=
 =?us-ascii?Q?Xe/4LqpK610=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Mcsyj4eK4hQwtFT6yjG1fZhT3HoPGJCU838sJ4RywMyJxK1WM8T8KWQ6iE8+?=
 =?us-ascii?Q?UhU6ug6LrlxD3ucw91izKHKkEUnJ63/2Ic7GcSxQfzeNZjjRcIeb5y0Nbrhq?=
 =?us-ascii?Q?sNENnkx1gshmUX/1otRRkIyQZ/tJ44rN2OGijAxxVAXkTPZQzUWtCoFLeKAX?=
 =?us-ascii?Q?YFT7DJcZI+hFV0REN5TTDNN2zzMrCjjdUKN/dJjjCCYBLWnxDd4bcSSVV4On?=
 =?us-ascii?Q?oakxwXuooZAHMtopC1jwK5lH6CeUhwng/IC4jrV5b/cPRVs5ZQkUnheTLrzn?=
 =?us-ascii?Q?NuiDFo84rT1FlDG+ZnmuE4CsWZLEnSUWWVS2kPJ7tvJ1Xow5FZyweE6v60xx?=
 =?us-ascii?Q?SNc0Y5RSyKgEhcVOKm78dqMqCOaqCrCy8I+q1bKn8cqqfURelEWX/MPheNyb?=
 =?us-ascii?Q?o/6aeNK3GP/nwZN2pA3SGN0KHUPi7x/x3vztlw33j9Panti/TSy7tbv2wNh0?=
 =?us-ascii?Q?S8f7nEW6ihyAyr5vcQn0emkvgULYy4mrZmo4RwUfogo2gRZabEC5ksAfVyhp?=
 =?us-ascii?Q?lc/hDX4i8PU/Tw/b1qmvcaRxT2l4X67Umc/2/dta67fuAkn1R2+6XNkrQ8dv?=
 =?us-ascii?Q?wUXueCElDcRQFndDhgZLy+TUiBehNGrYA4X9nzFG6J97Qnl29nPYzEqHaotQ?=
 =?us-ascii?Q?lAaYUW4gO+iq5U1Th8bOKGnfjzLe8ifx41HiBbNkurIaM+mrsPmsKeO7m3vF?=
 =?us-ascii?Q?2fv4lH0TfWE4BPmQXHruiTR4KJzMQoEWgLVexlW8wx4jQvWX0UpyiGp1zTwh?=
 =?us-ascii?Q?zDAmFsHjJ3Zp1ED9H1vCPcfpGFxCA+d+i73xIQidZbzmQX+jYoDrCDWjMzJI?=
 =?us-ascii?Q?aZMWEMFZM4uSYESdADvjSkRwx8WVob2b6kSatYjznFP6ogEHJkJ80LhmKgbg?=
 =?us-ascii?Q?b7qWgsp/A+sN1r//aMeV34jUOscYkp9LWcwSFbpdgXMvR6VS7KTtWUByUq3E?=
 =?us-ascii?Q?8xppGhMXJbugasFgGw7eaWqozidHccHKcLvlSnnrGHr/fmAkJ1uSQSoi2z/I?=
 =?us-ascii?Q?Ce5YuGVxbsVC8wCrbeWGqJt4doQE34PyeBnfqvdtRJ89FY+UcB0e+RbWmE2M?=
 =?us-ascii?Q?vr6Bw39z0IIXLL6yskgQh2jYMP2XscDCMwZYIAc1F0pf5ivObFlbTlpAvPsU?=
 =?us-ascii?Q?U3sQgE/KM+w/wbAzqEDaUtQ1y/4PzVaL/ziFlaB5xbJrVPi69ttsn3RVlVfV?=
 =?us-ascii?Q?ax+eqGIP+sJ/8UR2ReW5cNstXCfliyK0i2nAQj+KmvGAj7laALlRyJ+BeRS7?=
 =?us-ascii?Q?O94vQMIus7p/ceR/BHkiwzg4b3TA+V5yi5Hw2k94cOkTBshxInZOCDbm4b1M?=
 =?us-ascii?Q?j73bFy0hj8e6FR5qWf9qq0LcGTY/NgKmE2HAtSSLHWaGcWTMUW9SgJRkwIxu?=
 =?us-ascii?Q?NxtiOG84sRNAPpydo3L01yziUBcrmJfAdr/jeG/hltY5IQfuujyzcrOb1RQG?=
 =?us-ascii?Q?gQ1FIUTETettEOIQ9RJirCJTZpRc1IQpSAoh8grtOdA/FT3h3/Pli7QTtuCr?=
 =?us-ascii?Q?PHNLOd+QVMc9U9dkeoq7z79A3jRzGbW3kTRmuMdwL6ohOApeXViOsI3/4Kp2?=
 =?us-ascii?Q?mgZqsz7VPdx1LZNXVb8H9QffUCs6ObunY/w8svtKupRjGukOqvCj7vP8Krhn?=
 =?us-ascii?Q?qw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f8441e5d-6307-48d9-4b6a-08ddd13f9e07
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2025 21:08:52.3008 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0zoBMso94O2QahgdxtiEhmSBAD3Y/0hXF+4E8caK7vyt6wKvgmHOCCiBBRAUVmmNZTWdHWhQKeGFUOC5+SK5Ow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6211
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

On Fri, Aug 01, 2025 at 12:28:05PM +0300, Jani Nikula wrote:
> On Thu, 31 Jul 2025, Jani Nikula <jani.nikula@intel.com> wrote:
> > Display has switched to its own workqueue, no longer using
> > xe->unordered_wq.
> 
> Lucas, Rodrigo, the change was done in 7c377900772d ("drm/i915/display:
> move unordered works to new private workqueue"), which is in drm-next
> and Linus' upstream but not in drm-xe-next yet. It's a minor detail, but
> do you care if this patch gets merged to xe before the backmerge with
> that?

I don't have any issue myself with cherry-picking that to avoid us having to
wait couple weeks until we reconcile the branches, if that is needed to
unblock any of your display clean-ups.

Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> 
> BR,
> Jani.
> 
> 
> >
> > Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_device_types.h | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> > index 38c8329b4d2c..01e8fa0d2f9f 100644
> > --- a/drivers/gpu/drm/xe/xe_device_types.h
> > +++ b/drivers/gpu/drm/xe/xe_device_types.h
> > @@ -427,7 +427,7 @@ struct xe_device {
> >  	/** @ordered_wq: used to serialize compute mode resume */
> >  	struct workqueue_struct *ordered_wq;
> >  
> > -	/** @unordered_wq: used to serialize unordered work, mostly display */
> > +	/** @unordered_wq: used to serialize unordered work */
> >  	struct workqueue_struct *unordered_wq;
> >  
> >  	/** @destroy_wq: used to serialize user destroy work, like queue */
> 
> -- 
> Jani Nikula, Intel
