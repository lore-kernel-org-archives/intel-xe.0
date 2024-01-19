Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C4DBC4725D
	for <intel-xe@archiver.kernel.org>; Fri, 19 Jan 2024 20:38:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E859C10EA6E;
	Fri, 19 Jan 2024 20:38:42 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F73710EA6E
 for <intel-xe@lists.freedesktop.org>; Fri, 19 Jan 2024 20:38:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705696722; x=1737232722;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=PfEQoWqYRK7v27KxWm2PQy5iBdXpXEwZBnXybgmoy9Q=;
 b=JZDgbvXbOfzRJqQnKvG/g/ayjPdEPYUXCSj/yofso1yFFGm8OrwKpJ50
 mcg3ykgio5KS8PEMe5+6jewm834SQirs0thBaSCd5WubRADPuIRjSAR0e
 0N3j0OXvY2b88Y8B7MmLREMGtMm6M1AjTRADs5mkCHCrbKPm9fUqangph
 n2F1VC6AZo/osWz4aNUERNo8AahEbFRJQSG1VUkRXWORzuSHi8P6aeKao
 ztzoC2otQ6UQ+1QNp7rY3KC3rWdcpjnXG+Z5cri1p0t+Wyl4WegFikVHw
 DALAjqXrRG998Y6EsL+4tUPtC51lPiAiekD4Au1/SyAb/IrUgKEzUmGoZ w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10957"; a="8214331"
X-IronPort-AV: E=Sophos;i="6.05,206,1701158400"; 
   d="scan'208";a="8214331"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2024 12:38:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10957"; a="875448770"
X-IronPort-AV: E=Sophos;i="6.05,206,1701158400"; d="scan'208";a="875448770"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by FMSMGA003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Jan 2024 12:38:41 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 19 Jan 2024 12:38:40 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 19 Jan 2024 12:38:39 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 19 Jan 2024 12:38:39 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 19 Jan 2024 12:38:39 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V4nNu8aN8rBaxwwEIrmVvyPL9KXoZ+QXc2Zd7K3hM8pggH1/b/EU/aq97ftPNjGVYLpsn++/GRX15SwqFXFNK6SuL8safnssKbHLh9EsjqEMorHKMBb+Kn8+umLY7dNYzY/z1IFxs5/WicUg+q1wauv1PF3/mo9CWCdaIT4lOw+D7zS0kyrJ68XXZ4X64QSuJ8UGAU/mmLvtod1x/2J2aK2K+6PseiZ6klMh59EFLgQ4/1gqNlXV/XcgqNvNppw7WpRn5fxKliIWZKC6O1QYC4QxW7zbdRxUMV0Nw5psOo4GHU7PSIZqKJL1UwTb4hPdOKrmIfkWad31lfLZkzFArg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WHnqzJn8UwmfwVQmMNqlyREobKZ83Tvo7T2/LgP6mwo=;
 b=oFOMsc7NtrV7JQ3JLpdtIN4/olXPEaFzTh6VsmNqU7AUDzNkEyWs2F0m2gPs8qItPK6bbzWQP2LiKFxkBj9Fphb5V5LLaGoangYlxRHBVHkdsFhxAKquYGUOUOAINdnGEkJKOIrzJev5Or5mGr//IWowHXiLsVb/7qfufxhi1HHW7dAKo1uRKFKF1ywZq8K0dneRiTYIHE7RmYHEO2oqPdvitoC53hKrmllWUtlMKr1FD+pyWjnAzhMJkAd8OWLoBq5DBj5bzk3Hx1iqGPuc5ZUwz9NpQ5WTsjnwupY+6m6u6ycMVOl7We4NR3/okfHr3qfZ4qdFTiW6XPybJ65EHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DM6PR11MB4625.namprd11.prod.outlook.com (2603:10b6:5:2a8::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.26; Fri, 19 Jan
 2024 20:38:37 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::b9a8:8221:e4a1:4cda]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::b9a8:8221:e4a1:4cda%4]) with mapi id 15.20.7202.026; Fri, 19 Jan 2024
 20:38:37 +0000
Date: Fri, 19 Jan 2024 20:36:52 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: Re: [PATCH v3 1/3] drm/xe/guc: Add more GuC CT states
Message-ID: <ZardZMTwpnO8jifn@DUT025-TGLU.fm.intel.com>
References: <20240118192442.1480073-1-matthew.brost@intel.com>
 <20240118192442.1480073-2-matthew.brost@intel.com>
 <eac30fee-2c78-4366-bba9-8e66688c60d6@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <eac30fee-2c78-4366-bba9-8e66688c60d6@intel.com>
X-ClientProxiedBy: BY3PR05CA0039.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::14) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DM6PR11MB4625:EE_
X-MS-Office365-Filtering-Correlation-Id: 843752b7-859e-4f02-68cf-08dc192e9cec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2OiAhBFvWxMBMMLaKK9u01PRXGXW6PcIFaNjLN5HEvRNuB3js8wsWz1psqkDIpYjssVgyWeePXPM9IPIMPhjn+qtRqgyg3bND3SfMoFBLa9kOOs7NloTqmWHnnUpY+BqOmjBuejP3r3Nu8MgxfAxRi7lR7Yb6w4LFpvG3UCXAoaseFD0Ja00BYId5QFFf2ntGVaCD6XVndOBvPMo/3ZITgYsdlHLUCvK/o3sn0hYBG4Wznl8zWpDeJLQgUjLpy1xMG8YcHSfuleLV/XHvRrz9UY8gFOniILaBFqawQt9yHvjc4510GCp8Yl0euqliqjag4eQ6qYGfXgM1JIqgj/i4DiJ4L2BOHP5ymBmo5Drd9iYt3v03Pei0TcsjvpPls2gh51xn9VIzwuJtkHGKs8nLLShn26395f7kg+bBtYwzXaO1m0n2Ra4lQAhRhL/CS7nbWR+rLCp1fIP3em8T05/rUI99TBF5FzqLttchhKjlrioUdeJLGG+00PgNSnuEWal+5Niw8jsLKPK9g0Ccx2vjG/EzxPyjJlgveULp8CnysRYhTEaUKIS3FuXmek3ViSA
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(39860400002)(396003)(366004)(346002)(136003)(230922051799003)(1800799012)(186009)(451199024)(64100799003)(316002)(26005)(5660300002)(6636002)(2906002)(66556008)(66946007)(30864003)(6512007)(6666004)(6862004)(6486002)(66476007)(478600001)(6506007)(8936002)(8676002)(4326008)(53546011)(44832011)(107886003)(82960400001)(83380400001)(38100700002)(86362001)(41300700001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?LuUYHDHvpNCVZ0VndSTHCYY+n65ARyjIYDGqJYGoLpsC1vy67iCGAmmkFdOD?=
 =?us-ascii?Q?29JcgMQmRL87fc2Qv9G4VmqW0bfzX6sLaTOkAU9xIh3YMwDTlJJK/WlBcfbL?=
 =?us-ascii?Q?w+RkPqGxMY4dV9YidxeaykWdxuFznQZOOzaORJCvv9v09ld8iBCbUJAd1Eq8?=
 =?us-ascii?Q?eFcOTQIbW3RANucXNTjhkfZ3SMVvUOMfPuFtESYbLF661NQjbzhtAaRqaQEl?=
 =?us-ascii?Q?eirRPc6WE3/+AghxAUPyHDLsKGBqg0ciz7yHijzOzjLugyFEunHH8XYZ5mhE?=
 =?us-ascii?Q?WgfDrL6bxJNOejGPzR3xfrxyIk3KO5r3zOqIX1PPSRDuawf78orZK2nFj/kA?=
 =?us-ascii?Q?lM8d95qVZQ4hyTJwFL7xNh/3A8bIJtsvvXkGisdWUjsjlAlUF50aRBTlYXri?=
 =?us-ascii?Q?/kTCyLuk3VTN2nrK4Ly8EwWRizJLkF65jNDyc8nMAg/t3xBmEOHIhuQ9qWFb?=
 =?us-ascii?Q?gLYhvggagrYweIf14zPxYrG3gzISRqJ5GPFDgOIulIN+wrdyEzW8pgZub1ou?=
 =?us-ascii?Q?2lYVIQk8Z+8HFSDo6L8zcMXRERKNxDv2c1wWYOfG0ko78hB4/F0wW/GMku3F?=
 =?us-ascii?Q?dnTIQB6wZw4QrBL0qIvCnN4BW1Jmyb/2JnIb1+/gdRTV6m3DdG66Yajqxz2W?=
 =?us-ascii?Q?AAu1JiaKNVPaHZ6UVlyKUD3tuUv1Q1j8xbGshqKXgkXcY4fTBVWWSsW17ub2?=
 =?us-ascii?Q?PpPNH60AS1o/avcev+edkGxXt97cT7kZOc0aRXufqQdwZkNIkAHs/vHxA5zF?=
 =?us-ascii?Q?Ou/PCefOdzUt9Cf81itjkEBuclCVZ4JW8rrVqu6joXvQhO0m4ydhNX+UNR71?=
 =?us-ascii?Q?1/rXuZwIR62KvJJ11MFts89P8C3oHBbajSYX4xPviL98gLuB4CRpva32/5wd?=
 =?us-ascii?Q?n8Ah8aLadfpSSRBnEquMn/OAt8DxMV8iobZ+FPFbhW8n4/fU3lNGlVPpgWFP?=
 =?us-ascii?Q?jsjeiCfFSvj1nMgbTHPaEb2FVhgd261opyKWAaGkKDBwTIyqN9LezTOHFJzg?=
 =?us-ascii?Q?lDCkWezGdM0O4d1oaXBUJYrh9zu+X4gscou+lRdRT/sZv3Py7ceccKtkkXO9?=
 =?us-ascii?Q?gzpguQD7Vgk7UkJ4/nIpCv0q+ml0dXfVtDrQDVbebFgGm1xuR6OkEZ5BP4iK?=
 =?us-ascii?Q?uBmWUwQggYC+Cc9/yAaVKWaejpuN6HldFKxLM+/zwMpvphgvqa8QNug3FCBv?=
 =?us-ascii?Q?CwmegOrTWlKHjns5y3t2YsMZExiRxJEVQl7Pg1EzT4of+thefVzXwnwfscwv?=
 =?us-ascii?Q?dZ38il7uYJ+k91LFmrIX2hWJpEaBWxXBRN2qRlXWnusjSL0fhdtkoGIdcqDl?=
 =?us-ascii?Q?y9jW+HDiuUQtsviSv1FOxR0MgQIi63x7NMkdmhMgw1/mDLIOC1IPzNai6ZJW?=
 =?us-ascii?Q?NDcSl9aPumsatUl8psEaJ4SaUwBpUoKTxnkCR/PK7kCVhlXd1EJxt7Lq55qz?=
 =?us-ascii?Q?J9S7m7gl0BY/KdUMxUSxtNWn1v87iAgUAgd2x/MGUpodjZCGM+lAGu4Mr7k5?=
 =?us-ascii?Q?6uVXX2SVf6BC2Bc49t71ztAk/+76C8QvvHRwOCrDMuhpvazywWrv0ojual7s?=
 =?us-ascii?Q?RA9qP1HkSxC7kh57UMJdLDg1TwxiK+a3AhGq2moWbODtvsAyC8n+SGG7QyhY?=
 =?us-ascii?Q?SQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 843752b7-859e-4f02-68cf-08dc192e9cec
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2024 20:38:37.2881 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ff13zAvATZcgLTMjhVoCTq6pyfze+Lo7ERG5kxkfiYD/cjTEeoZI/BZYYwEfwgM1VNZWNqPUgxWGkjTJ+AEudA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4625
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
Cc: intel-xe@lists.freedesktop.org, rodrigo.vivi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, Jan 18, 2024 at 11:22:09PM +0100, Michal Wajdeczko wrote:
> 
> 
> On 18.01.2024 20:24, Matthew Brost wrote:
> > The Guc CT has more than enabled / disables states rather it has 4. The
> > 4 states are not initialized, disabled, stopped, and enabled. Change the
> > code to reflect this. These states will enable proper return codes from
> > functions and therefore enable proper error messages.
> > 
> > v2:
> > - s/XE_GUC_CT_STATE_DROP_MESSAGES/XE_GUC_CT_STATE_STOPPED (Michal)
> > - Add assert for CT being initialized (Michal)
> > - Fix kernel for CT state enum (Michal)
> > 
> > v3:
> > - Kernel doc (Michal)
> > - s/reiecved/received (Michal)
> > - assert CT state not initialized in xe_guc_ct_init (Michal)
> > - add argument xe_guc_ct_set_state to clear g2h (Michal)
> > 
> > Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> > Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_guc.c          |  4 +-
> >  drivers/gpu/drm/xe/xe_guc_ct.c       | 79 ++++++++++++++++++++++------
> >  drivers/gpu/drm/xe/xe_guc_ct.h       |  8 ++-
> >  drivers/gpu/drm/xe/xe_guc_ct_types.h | 18 ++++++-
> >  4 files changed, 87 insertions(+), 22 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> > index 2891b0cc4f7f..c2a85117f3bf 100644
> > --- a/drivers/gpu/drm/xe/xe_guc.c
> > +++ b/drivers/gpu/drm/xe/xe_guc.c
> > @@ -687,7 +687,7 @@ int xe_guc_mmio_send_recv(struct xe_guc *guc, const u32 *request,
> >  
> >  	BUILD_BUG_ON(VF_SW_FLAG_COUNT != MED_VF_SW_FLAG_COUNT);
> >  
> > -	xe_assert(xe, !guc->ct.enabled);
> > +	xe_assert(xe, !xe_guc_ct_enabled(&guc->ct));
> >  	xe_assert(xe, len);
> >  	xe_assert(xe, len <= VF_SW_FLAG_COUNT);
> >  	xe_assert(xe, len <= MED_VF_SW_FLAG_COUNT);
> > @@ -873,7 +873,7 @@ int xe_guc_stop(struct xe_guc *guc)
> >  {
> >  	int ret;
> >  
> > -	xe_guc_ct_disable(&guc->ct);
> > +	xe_guc_ct_stop(&guc->ct);
> >  
> >  	ret = xe_guc_submit_stop(guc);
> >  	if (ret)
> > diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> > index b2cc3f993eb6..41e9320914e9 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> > @@ -164,6 +164,8 @@ int xe_guc_ct_init(struct xe_guc_ct *ct)
> >  	if (err)
> >  		return err;
> >  
> > +	xe_assert(xe, ct->state == XE_GUC_CT_STATE_NOT_INITIALIZED);
> > +	ct->state = XE_GUC_CT_STATE_DISABLED;
> >  	return 0;
> >  }
> >  
> > @@ -283,12 +285,34 @@ static int guc_ct_control_toggle(struct xe_guc_ct *ct, bool enable)
> >  	return ret > 0 ? -EPROTO : ret;
> >  }
> >  
> > +static void xe_guc_ct_set_state(struct xe_guc_ct *ct,
> > +				enum xe_guc_ct_state state,
> > +				bool clear_g2h_outstanding)
> > +{
> > +	struct xe_device *xe = ct_to_xe(ct);
> > +
> > +	mutex_lock(&ct->lock);		/* Serialise dequeue_one_g2h() */
> > +	spin_lock_irq(&ct->fast_lock);	/* Serialise CT fast-path */
> > +
> > +	if (clear_g2h_outstanding) {
> > +		ct->g2h_outstanding = 0;
> > +		xa_destroy(&ct->fence_lookup);
> > +	} else {
> > +		xe_assert(xe, ct->g2h_outstanding == 0);
> > +	}
> 
> since it looks that now you always expect no outstanding g2h after any
> state change, and that explicit clear is needed only when stopping, then
> maybe we can drop this extra param and just always do:
> 
> 	xe_gt_assert(ct_to_gt(ct),
> 		ct->g2h_outstanding == 0 ||
> 		state == XE_GUC_CT_STATE_STOPPED);
> 

I went back and forth on having an argument or not. Either way works but
if you prefer this way I change it. Note that once we add the broken
state it will change to:

 	xe_gt_assert(ct_to_gt(ct),
 		ct->g2h_outstanding == 0 ||
 		state == XE_GUC_CT_STATE_STOPPED ||
		state == XE_GUC_CT_STATE_BROKEN);

Matt 

> 	ct->g2h_outstanding = 0;
> 	xa_destroy(&ct->fence_lookup);
> 
> everything else LGTM
> 
> > +
> > +	ct->state = state;
> > +
> > +	spin_unlock_irq(&ct->fast_lock);
> > +	mutex_unlock(&ct->lock);
> > +}
> > +
> >  int xe_guc_ct_enable(struct xe_guc_ct *ct)
> >  {
> >  	struct xe_device *xe = ct_to_xe(ct);
> >  	int err;
> >  
> > -	xe_assert(xe, !ct->enabled);
> > +	xe_assert(xe, !xe_guc_ct_enabled(ct));
> >  
> >  	guc_ct_ctb_h2g_init(xe, &ct->ctbs.h2g, &ct->bo->vmap);
> >  	guc_ct_ctb_g2h_init(xe, &ct->ctbs.g2h, &ct->bo->vmap);
> > @@ -305,12 +329,7 @@ int xe_guc_ct_enable(struct xe_guc_ct *ct)
> >  	if (err)
> >  		goto err_out;
> >  
> > -	mutex_lock(&ct->lock);
> > -	spin_lock_irq(&ct->fast_lock);
> > -	ct->g2h_outstanding = 0;
> > -	ct->enabled = true;
> > -	spin_unlock_irq(&ct->fast_lock);
> > -	mutex_unlock(&ct->lock);
> > +	xe_guc_ct_set_state(ct, XE_GUC_CT_STATE_ENABLED, false);
> >  
> >  	smp_mb();
> >  	wake_up_all(&ct->wq);
> > @@ -324,15 +343,26 @@ int xe_guc_ct_enable(struct xe_guc_ct *ct)
> >  	return err;
> >  }
> >  
> > +/**
> > + * xe_guc_ct_disable - Set GuC to disabled state
> > + * @ct: the &xe_guc_ct
> > + *
> > + * Set GuC CT to disabled state, no outstanding g2h expected in this transition
> > + */
> >  void xe_guc_ct_disable(struct xe_guc_ct *ct)
> >  {
> > -	mutex_lock(&ct->lock); /* Serialise dequeue_one_g2h() */
> > -	spin_lock_irq(&ct->fast_lock); /* Serialise CT fast-path */
> > -	ct->enabled = false; /* Finally disable CT communication */
> > -	spin_unlock_irq(&ct->fast_lock);
> > -	mutex_unlock(&ct->lock);
> > +	xe_guc_ct_set_state(ct, XE_GUC_CT_STATE_DISABLED, false);
> > +}
> >  
> > -	xa_destroy(&ct->fence_lookup);
> > +/**
> > + * xe_guc_ct_stop - Set GuC to stopped state
> > + * @ct: the &xe_guc_ct
> > + *
> > + * Set GuC CT to stopped state and clear any outstanding g2h
> > + */
> > +void xe_guc_ct_stop(struct xe_guc_ct *ct)
> > +{
> > +	xe_guc_ct_set_state(ct, XE_GUC_CT_STATE_STOPPED, true);
> >  }
> >  
> >  static bool h2g_has_room(struct xe_guc_ct *ct, u32 cmd_len)
> > @@ -507,6 +537,7 @@ static int __guc_ct_send_locked(struct xe_guc_ct *ct, const u32 *action,
> >  	u16 seqno;
> >  	int ret;
> >  
> > +	xe_assert(xe, ct->state != XE_GUC_CT_STATE_NOT_INITIALIZED);
> >  	xe_assert(xe, !g2h_len || !g2h_fence);
> >  	xe_assert(xe, !num_g2h || !g2h_fence);
> >  	xe_assert(xe, !g2h_len || num_g2h);
> > @@ -518,11 +549,18 @@ static int __guc_ct_send_locked(struct xe_guc_ct *ct, const u32 *action,
> >  		goto out;
> >  	}
> >  
> > -	if (unlikely(!ct->enabled)) {
> > +	if (ct->state == XE_GUC_CT_STATE_DISABLED) {
> >  		ret = -ENODEV;
> >  		goto out;
> >  	}
> >  
> > +	if (ct->state == XE_GUC_CT_STATE_STOPPED) {
> > +		ret = -ECANCELED;
> > +		goto out;
> > +	}
> > +
> > +	xe_assert(xe, xe_guc_ct_enabled(ct));
> > +
> >  	if (g2h_fence) {
> >  		g2h_len = GUC_CTB_HXG_MSG_MAX_LEN;
> >  		num_g2h = 1;
> > @@ -710,7 +748,8 @@ static bool retry_failure(struct xe_guc_ct *ct, int ret)
> >  		return false;
> >  
> >  #define ct_alive(ct)	\
> > -	(ct->enabled && !ct->ctbs.h2g.info.broken && !ct->ctbs.g2h.info.broken)
> > +	(xe_guc_ct_enabled(ct) && !ct->ctbs.h2g.info.broken && \
> > +	 !ct->ctbs.g2h.info.broken)
> >  	if (!wait_event_interruptible_timeout(ct->wq, ct_alive(ct),  HZ * 5))
> >  		return false;
> >  #undef ct_alive
> > @@ -1009,14 +1048,20 @@ static int g2h_read(struct xe_guc_ct *ct, u32 *msg, bool fast_path)
> >  	u32 action;
> >  	u32 *hxg;
> >  
> > +	xe_assert(xe, ct->state != XE_GUC_CT_STATE_NOT_INITIALIZED);
> >  	lockdep_assert_held(&ct->fast_lock);
> >  
> > -	if (!ct->enabled)
> > +	if (ct->state == XE_GUC_CT_STATE_DISABLED)
> >  		return -ENODEV;
> >  
> > +	if (ct->state == XE_GUC_CT_STATE_STOPPED)
> > +		return -ECANCELED;
> > +
> >  	if (g2h->info.broken)
> >  		return -EPIPE;
> >  
> > +	xe_assert(xe, xe_guc_ct_enabled(ct));
> > +
> >  	/* Calculate DW available to read */
> >  	tail = desc_read(xe, g2h, tail);
> >  	avail = tail - g2h->info.head;
> > @@ -1318,7 +1363,7 @@ struct xe_guc_ct_snapshot *xe_guc_ct_snapshot_capture(struct xe_guc_ct *ct,
> >  		return NULL;
> >  	}
> >  
> > -	if (ct->enabled) {
> > +	if (xe_guc_ct_enabled(ct)) {
> >  		snapshot->ct_enabled = true;
> >  		snapshot->g2h_outstanding = READ_ONCE(ct->g2h_outstanding);
> >  		guc_ctb_snapshot_capture(xe, &ct->ctbs.h2g,
> > diff --git a/drivers/gpu/drm/xe/xe_guc_ct.h b/drivers/gpu/drm/xe/xe_guc_ct.h
> > index 9ecb67db8ec4..5083e099064f 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_ct.h
> > +++ b/drivers/gpu/drm/xe/xe_guc_ct.h
> > @@ -13,6 +13,7 @@ struct drm_printer;
> >  int xe_guc_ct_init(struct xe_guc_ct *ct);
> >  int xe_guc_ct_enable(struct xe_guc_ct *ct);
> >  void xe_guc_ct_disable(struct xe_guc_ct *ct);
> > +void xe_guc_ct_stop(struct xe_guc_ct *ct);
> >  void xe_guc_ct_fast_path(struct xe_guc_ct *ct);
> >  
> >  struct xe_guc_ct_snapshot *
> > @@ -22,9 +23,14 @@ void xe_guc_ct_snapshot_print(struct xe_guc_ct_snapshot *snapshot,
> >  void xe_guc_ct_snapshot_free(struct xe_guc_ct_snapshot *snapshot);
> >  void xe_guc_ct_print(struct xe_guc_ct *ct, struct drm_printer *p, bool atomic);
> >  
> > +static inline bool xe_guc_ct_enabled(struct xe_guc_ct *ct)
> > +{
> > +	return ct->state == XE_GUC_CT_STATE_ENABLED;
> > +}
> > +
> >  static inline void xe_guc_ct_irq_handler(struct xe_guc_ct *ct)
> >  {
> > -	if (!ct->enabled)
> > +	if (!xe_guc_ct_enabled(ct))
> >  		return;
> >  
> >  	wake_up_all(&ct->wq);
> > diff --git a/drivers/gpu/drm/xe/xe_guc_ct_types.h b/drivers/gpu/drm/xe/xe_guc_ct_types.h
> > index d814d4ee3fc6..b966506cae09 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_ct_types.h
> > +++ b/drivers/gpu/drm/xe/xe_guc_ct_types.h
> > @@ -72,6 +72,20 @@ struct xe_guc_ct_snapshot {
> >  	struct guc_ctb_snapshot h2g;
> >  };
> >  
> > +/**
> > + * enum xe_guc_ct_state - CT state
> > + * @XE_GUC_CT_STATE_NOT_INITIALIZED: CT not initialized, messages not expected in this state
> > + * @XE_GUC_CT_STATE_DISABLED: CT disabled, messages not expected in this state
> > + * @XE_GUC_CT_STATE_STOPPED: CT stopped, drop messages without errors
> > + * @XE_GUC_CT_STATE_ENABLED: CT enabled, messages sent / received in this state
> > + */
> > +enum xe_guc_ct_state {
> > +	XE_GUC_CT_STATE_NOT_INITIALIZED = 0,
> > +	XE_GUC_CT_STATE_DISABLED,
> > +	XE_GUC_CT_STATE_STOPPED,
> > +	XE_GUC_CT_STATE_ENABLED,
> > +};
> > +
> >  /**
> >   * struct xe_guc_ct - GuC command transport (CT) layer
> >   *
> > @@ -96,8 +110,8 @@ struct xe_guc_ct {
> >  	u32 g2h_outstanding;
> >  	/** @g2h_worker: worker to process G2H messages */
> >  	struct work_struct g2h_worker;
> > -	/** @enabled: CT enabled */
> > -	bool enabled;
> > +	/** @state: CT state */
> > +	enum xe_guc_ct_state state;
> >  	/** @fence_seqno: G2H fence seqno - 16 bits used by CT */
> >  	u32 fence_seqno;
> >  	/** @fence_lookup: G2H fence lookup */
