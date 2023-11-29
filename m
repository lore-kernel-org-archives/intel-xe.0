Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63131C4167B
	for <intel-xe@archiver.kernel.org>; Thu, 30 Nov 2023 01:18:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29D9B10E6A0;
	Thu, 30 Nov 2023 01:18:31 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF5F910E6A0
 for <intel-xe@lists.freedesktop.org>; Thu, 30 Nov 2023 01:18:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701307109; x=1732843109;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=G7lrhYmwvS9S9FCHFtg0IiXR1agjBo9Rcot5+667EJg=;
 b=Yww+h+pNICB55n/P3ewIwut4+lbePjGiUHuY2agTh+OpJxG1si7aqqN7
 nqUBZSzQBkXnuKEvJGOkhquaBKkkJlhcgc9wAVek3093gFumjpSxZt/ln
 0hSMBvlaxLcCv1W5TxOaMEPK0YpzcuujdOx15HCtR5Sjor39+Zp9SHJjF
 dldyfcgWg6aNqJG+HIGGSQK01t/INkD/cEtIpn0gsACO2f5dUGLa2ZzXQ
 aNHvFs68nsj7lD01qcVSz6SZcaRmuP3NJ4IYcD+enquXHNNqPa7+AF5Rj
 uwPIlS55TjI62HXrK7rVWjHjWivWxlJexPAIcjTUEn0TS3p793Tf4JnVy A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="6464819"
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; 
   d="scan'208";a="6464819"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2023 17:18:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="803472046"
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; d="scan'208";a="803472046"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Nov 2023 17:18:28 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 29 Nov 2023 17:18:27 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 29 Nov 2023 17:18:27 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Wed, 29 Nov 2023 17:18:27 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Wed, 29 Nov 2023 17:18:27 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bHV+kr2lJxtvOLn5QAx5T43mvVmyu8rRBypVj/IZ5pQs0S81SDy1KtVhkMOHUrhSJByJk7w/CS8SnTMurVerxUSbrolgmf/IjTKU52CZpmCs+fluj5LhMEApTghe6vZ1n0ZBQyV7z7Jxqyq5paacQYFh5MUOnfUpkG2oK2VEZ3hO3hrlCeiCwjzGHs9JI4rYamOPQVkhm+nTEaILS37gXr91pq9XIwF8HdJGjIc42x8Rw5kSf3+iNzbkxXVMjR/vkMmSi4OKpaOWD4JbyGQIMXgIxab9r9enqsYmZIG+Wv7OW8bOjlTLbMrB80ZqxKrhEw/8u0NE5+j5pYS/7puEIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4RF8gA+6vB+CIV9w4jEPjoEl+rLdcoFV30xIIuz+56w=;
 b=QxQjz17p3RvGeROIAZQqZSmfgkcKfeZDvJtBF0JD+RDJRsdyYaAoRDRKQCJdf5Y6pFVOMS26ZdlZaNOC4AAuwkr85uKxD44rRtT6z9N/W7uHblEqANp1hutyIAASPvEQeR5zVex7ms0anKWcntXJ9Qnkj+3m+GTkt7eHllDl6XsqYpwWiFIAwZgl0J5mRELVibl26BJ0Crr7tPXA//+xjoS6RBwNmDkSkaQQCtwFtxCKlzhFdFHl/bBEmTRuSd4I+7jQDTp8/F2h4eXyjvlGp/XdbiKh5vrhc5sBDuEIsx7wFfyfodJGgtu+e5BYdLlM55y9zJStb3+dFNjv9CrC0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CO1PR11MB5169.namprd11.prod.outlook.com (2603:10b6:303:95::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.23; Thu, 30 Nov
 2023 01:18:25 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::b9a8:8221:e4a1:4cda]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::b9a8:8221:e4a1:4cda%4]) with mapi id 15.20.7046.015; Thu, 30 Nov 2023
 01:18:25 +0000
Date: Wed, 29 Nov 2023 18:16:47 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>
Message-ID: <ZWeADzMpNKYLZa4I@DUT025-TGLU.fm.intel.com>
References: <20231129223508.1189461-1-michal.winiarski@intel.com>
 <20231129223508.1189461-23-michal.winiarski@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231129223508.1189461-23-michal.winiarski@intel.com>
X-ClientProxiedBy: SJ0PR13CA0089.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::34) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CO1PR11MB5169:EE_
X-MS-Office365-Filtering-Correlation-Id: cd91c118-2b43-41a7-79b5-08dbf1424067
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4iXNA5deNS51s57qRyYA58HqnFUFK+2KoKCdgVsbByVU9l2y8PBbs6Fl2bSH4cbYWD59gixz3wjrfFSBpYJD0/toeacKveEvMf2LziqpyyI1r5UVbjJmDl4FkCexclV45ypTjlX5GYxkMTFdAKzJclvkLdupPNbdHBtIbCHAFMqmZh7ZNwlbpsJkaMorm2oalVDEpNcTgrdhCRacRUseWX5Zbopf1+qGt8s8qs9rR1IY1F37XARo7mBjjRr6IfBS2nP99477QpeAvAF/EXgXXSWtA2EhdpsTmhRWwJnPqRRHHUROebB6vhQbyCW+tPs9EBK1LJhTaf04+rO9HnTlMmozrccMuCXoSyKJJehWca4sZ0KgjI4T1ygHC7QvWpeE9DYzP8O7dftaqcRvpwsKe+rz3m+KGx3ndubwOnSrwYgUN3jkIXkRyarN6USWio6lBJnkMZm2m1SseBBgOLcjm79P0iihf7JKj23sEO/lLvQaignrTQFShTOV8fBd7z6fdy4UiDiumM1rMETP4CaN6KsyEqd4djKcx7lCjEfZxVKQaM3u9sig1JDIwA9mhkQTnLb3Gid19m241rUaOouAwhRFUVxWQ4f0ZP1mO26v9oQdGmQR4h0LSluRClWKBmaB
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(39860400002)(136003)(366004)(346002)(376002)(230922051799003)(64100799003)(1800799012)(186009)(451199024)(478600001)(6512007)(26005)(6486002)(6666004)(6506007)(83380400001)(41300700001)(2906002)(44832011)(5660300002)(54906003)(66946007)(6636002)(66476007)(66556008)(6862004)(8936002)(316002)(8676002)(4326008)(38100700002)(82960400001)(86362001)(202311291699003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UXlCRHNndEVQeEI2Sjd1VXdUNTFjdzJmSFZXelpFbWVhTTJZeGZldVQ0ZzZU?=
 =?utf-8?B?V09tNzBXNDZFeGtISVhhL1QySi9TUjh3WTFvYVQyTmxiSXVDSHBUVHdwRG43?=
 =?utf-8?B?azZ2TXVub3F5T0k0VHhKQU5CK0dQb1FZK3IwV2hRSGJCQ2k4YnhjdG1FZ1dv?=
 =?utf-8?B?Rk5YVXFOdWtnSmxvWlNOa213TzJqM1c5bGJ1SVYvMldUb3dSU0U2allFOXUr?=
 =?utf-8?B?OG9yVFQ1WDRma2hIY2dwUUlGdFdnMG9GNnpydTlEeDNBOUptck8vQ1VWYVho?=
 =?utf-8?B?N3E5ZXExNzROYzVJVlpKU1lDZXdkTVkza0RQZDJ3SWJBbVhGSUFlT0FVdEdh?=
 =?utf-8?B?MU8ydFZZcy94MjN0cUxBQmdpTTQ5NnE0byt6UDdXZGN4SUQrMjZHZTVYMHMx?=
 =?utf-8?B?UnhjRWhiNmtFM1pCQkZZQU9NNGhSL3VIRUZaU2pzOWVhQkRyUms3NTByQ2Zv?=
 =?utf-8?B?WWhDMTc1MHdkc0RYSDJXK0hCYUNRZU01OFZOditnT2Y0RnA2SVNzTzl4cDlk?=
 =?utf-8?B?SktXdkFuM1A0eklyUDZScVB2MDh4YURRS0hSTHQ4cXBzMmFDYnFGa0dxSFRi?=
 =?utf-8?B?N2xkZEtKOWVJUXcwUHBGTlhEMHF0U1pYSmI2TlhaOXppcFZrSjJQU1JyRFB0?=
 =?utf-8?B?MGhKbThsQzFUZG9mWTZsUnlwc3hQSFA4UGZqRHV6bzIzeE1VZ1YvOWQwOU85?=
 =?utf-8?B?S1F3WmlteDBmUUZiNDFWNlk0Vld2cFBEQVVrb0l2ZWF3NDRvNGdsWldVZkFE?=
 =?utf-8?B?enlSbzdWQVJSOFJxa1hnbHhZOXhXaVpsQUV0NDhnNE53QitoTFdmUExYZHVm?=
 =?utf-8?B?Sm5lb0Q1SFZweUE3b0RpTkdWOFhVTFVZRlBPOEtqV2tSeWk5VTBoMjJLQWcw?=
 =?utf-8?B?WExBZlp0cVNibW4rNUhmK2ZjVGtCRE0zN2IvM1AvcHAxdUJoSTZpZFEyd1cx?=
 =?utf-8?B?Vmtzd1M5bk5sM1lqbmZCUE9hNExLQldDZ2tWU2dyNmlnYm9EWVorTzBwWmFu?=
 =?utf-8?B?WnRmUWdEOWpYZWw1YmVGQmpoc0R5RUtmc21GNW81dUFZc1IwM0ZTc1djU0VD?=
 =?utf-8?B?V2trTWQ2djR6VzQ1d21RQklWSEVxeGNXaEJQMDQvWGs3VVZ5SkNwcHhVU0h5?=
 =?utf-8?B?S29vVjQ2OUk3UlpGWVZ2RVdiSG9nMUZBUENGSGJPNG5XZ1dsc3pmUHNHQkFS?=
 =?utf-8?B?dng3UXNoQmlTSnZmNTJGMVFmWmpUQ3JEeUJGdC8xaHJBcE9UeUVubFdUYVJS?=
 =?utf-8?B?VUtnb0RrejVHbU5Ddk12aUFoMUtldjlxQnF0STdPS1RvSXhEd01ua2pWR2ln?=
 =?utf-8?B?dUFJeDlod2RpTkQvZ05RT0tickJRRjQ1bzVjaUpHNUpudFBiaHczcmVBdjho?=
 =?utf-8?B?NWtaUWlJajNYUCtLd0ZtMmJJSUluQUovUjhRZ0VpK3NVOGJIYmlkcjd5dyty?=
 =?utf-8?B?NW5wK1dDWlQwbXg1QSsyMXM4U1VWVXBtYjlLSkdTQmVmZkpYYkNPcm93dkpq?=
 =?utf-8?B?Vjk3U1kyYmxjLzlJM21aZG1kS1M4SzNZdm9Tci9oTy8yNzBEREVIbStLZkh4?=
 =?utf-8?B?N0puaDV5cTJ0Rk1ucHhwclN3d2RWanF5b1k0MW0zTThEUTFYM0ZHKzlLLzcw?=
 =?utf-8?B?bmsyWFd2U1drWXcxbGF2UTh1QU1MNHRmNXo2a3RKT0FPM29HeE5lN01PclRU?=
 =?utf-8?B?U0ZhbHZBRTdwMG1JelRRSFU2TTdGa0pPdXNLS29UdkJNenVTZGJSSWJJNzRS?=
 =?utf-8?B?R0V2VUlScjM5d2s5bjcvN1lQckhpT1g4TTRtaTJQZFp2MlpkMFlhWTN6M0Zo?=
 =?utf-8?B?dEx3L0dUcFc5dU0va0UvTGlCNW9zWDkwZFdRN1ZhT1FzUDVzQ25NZnZVaHlL?=
 =?utf-8?B?L3J4RU80NmUva0J2dWg3WXkrSVphVlpZc240R1d0VjBjY0VYVDVydkRuWXky?=
 =?utf-8?B?Vlp0eTNDb2hac3F1VTBhcmx0UmVTWlZXeGNWWVhNSnRaaXVsTWJHc05Ja1Zz?=
 =?utf-8?B?V0hzVnA0L0FWU2RkbTJBQ3lqUDdHYmxkNVo2MmRNQnI0MTBaNWlkS2tXb0Rn?=
 =?utf-8?B?ei9YdTlrUjFJRzRua3lPYU1yTUNzQXN3N2tjc0hZTUVEU2NTK0c2OEEranJT?=
 =?utf-8?B?cWlZd3B3c1NQWXUyOHNQNlBqa0x0bE9GY0o4UGtod25GbHIxK0xkQ2ZTd3gv?=
 =?utf-8?B?QWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cd91c118-2b43-41a7-79b5-08dbf1424067
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Nov 2023 01:18:25.4679 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z3TFwcG4BU6HUc19DGZT/9ABM7pKdeKrW9Vsl4D/LjqIf3RQEHAamHyObuT0yXoKmWIKiZSk70W2kY6s3roXJw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5169
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v5 22/23] drm/xe/guc: Move GuC power control
 init to "post-hwconfig"
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Matt Roper <matthew.d.roper@intel.com>,
 intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, Nov 29, 2023 at 11:35:07PM +0100, Michał Winiarski wrote:
> SLPC is not used at "hwconfig" stage. Move the initialization of data
> structures used for SLPC to a later point in probe.
> Also - move the xe_guc_pc_init_early to happen just prior to initial
> "hwconfig" load.
> 
> Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
> v3 -> v4:
> - Convert xe_guc_pc_fini to act as drm-managed release function
> 
>  drivers/gpu/drm/xe/xe_gt.c     |  3 ---
>  drivers/gpu/drm/xe/xe_guc.c    | 14 ++++++++------
>  drivers/gpu/drm/xe/xe_guc_pc.c | 16 +++++++++++++---
>  drivers/gpu/drm/xe/xe_guc_pc.h |  1 -
>  4 files changed, 21 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index a9c71da985d30..7498d36a97e44 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -349,9 +349,6 @@ static int gt_fw_domain_init(struct xe_gt *gt)
>  	if (err)
>  		goto err_force_wake;
>  
> -	/* Raise GT freq to speed up HuC/GuC load */
> -	xe_guc_pc_init_early(&gt->uc.guc.pc);
> -
>  	err = xe_uc_init_hwconfig(&gt->uc);
>  	if (err)
>  		goto err_force_wake;
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index b85defa941e85..7dcc438b38436 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -236,7 +236,6 @@ static void guc_fini(struct drm_device *drm, void *arg)
>  	struct xe_guc *guc = arg;
>  
>  	xe_force_wake_get(gt_to_fw(guc_to_gt(guc)), XE_FORCEWAKE_ALL);
> -	xe_guc_pc_fini(&guc->pc);
>  	xe_uc_fini_hw(&guc_to_gt(guc)->uc);
>  	xe_force_wake_put(gt_to_fw(guc_to_gt(guc)), XE_FORCEWAKE_ALL);
>  }
> @@ -309,11 +308,7 @@ int xe_guc_init(struct xe_guc *guc)
>  	if (ret)
>  		goto out;
>  
> -	ret = xe_guc_pc_init(&guc->pc);
> -	if (ret)
> -		goto out;
> -
> -	ret = drmm_add_action_or_reset(&gt_to_xe(gt)->drm, guc_fini, guc);
> +	ret = drmm_add_action_or_reset(&xe->drm, guc_fini, guc);
>  	if (ret)
>  		goto out;
>  
> @@ -349,6 +344,10 @@ int xe_guc_init_post_hwconfig(struct xe_guc *guc)
>  
>  	guc_init_params_post_hwconfig(guc);
>  
> +	ret = xe_guc_pc_init(&guc->pc);
> +	if (ret)
> +		return ret;
> +
>  	return xe_guc_ads_init_post_hwconfig(&guc->ads);
>  }
>  
> @@ -559,6 +558,9 @@ int xe_guc_min_load_for_hwconfig(struct xe_guc *guc)
>  
>  	xe_guc_ads_populate_minimal(&guc->ads);
>  
> +	/* Raise GT freq to speed up HuC/GuC load */
> +	xe_guc_pc_init_early(&guc->pc);
> +
>  	ret = __xe_guc_upload(guc);
>  	if (ret)
>  		return ret;
> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
> index d2605a684b1c5..69fa7a533b75d 100644
> --- a/drivers/gpu/drm/xe/xe_guc_pc.c
> +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
> @@ -952,8 +952,9 @@ int xe_guc_pc_stop(struct xe_guc_pc *pc)
>  	return ret;
>  }
>  
> -void xe_guc_pc_fini(struct xe_guc_pc *pc)
> +static void xe_guc_pc_fini(struct drm_device *drm, void *arg)
>  {
> +	struct xe_guc_pc *pc = arg;
>  	struct xe_device *xe = pc_to_xe(pc);
>  
>  	if (xe->info.skip_guc_pc) {
> @@ -961,10 +962,11 @@ void xe_guc_pc_fini(struct xe_guc_pc *pc)
>  		return;
>  	}
>  
> +	xe_force_wake_get(gt_to_fw(pc_to_gt(pc)), XE_FORCEWAKE_ALL);
>  	XE_WARN_ON(xe_guc_pc_gucrc_disable(pc));
>  	XE_WARN_ON(xe_guc_pc_stop(pc));
>  	sysfs_remove_files(pc_to_gt(pc)->sysfs, pc_attrs);
> -	mutex_destroy(&pc->freq_lock);
> +	xe_force_wake_put(gt_to_fw(pc_to_gt(pc)), XE_FORCEWAKE_ALL);
>  }
>  
>  /**
> @@ -983,7 +985,9 @@ int xe_guc_pc_init(struct xe_guc_pc *pc)
>  	if (xe->info.skip_guc_pc)
>  		return 0;
>  
> -	mutex_init(&pc->freq_lock);
> +	err = drmm_mutex_init(&xe->drm, &pc->freq_lock);
> +	if (err)
> +		return err;
>  
>  	bo = xe_managed_bo_create_pin_map(xe, tile, size,
>  					  XE_BO_CREATE_VRAM_IF_DGFX(tile) |
> @@ -997,5 +1001,11 @@ int xe_guc_pc_init(struct xe_guc_pc *pc)
>  	if (err)
>  		return err;
>  
> +	err = drmm_add_action_or_reset(&xe->drm, xe_guc_pc_fini, pc);
> +	if (err) {
> +		sysfs_remove_files(gt->sysfs, pc_attrs);
> +		return err;
> +	}
> +
>  	return 0;
>  }
> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.h b/drivers/gpu/drm/xe/xe_guc_pc.h
> index 054788e006f32..4cd023d9e8bec 100644
> --- a/drivers/gpu/drm/xe/xe_guc_pc.h
> +++ b/drivers/gpu/drm/xe/xe_guc_pc.h
> @@ -9,7 +9,6 @@
>  #include "xe_guc_pc_types.h"
>  
>  int xe_guc_pc_init(struct xe_guc_pc *pc);
> -void xe_guc_pc_fini(struct xe_guc_pc *pc);
>  int xe_guc_pc_start(struct xe_guc_pc *pc);
>  int xe_guc_pc_stop(struct xe_guc_pc *pc);
>  int xe_guc_pc_gucrc_disable(struct xe_guc_pc *pc);
> -- 
> 2.43.0
> 
