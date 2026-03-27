Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B090610ED677
	for <intel-xe@archiver.kernel.org>; Fri, 27 Mar 2026 13:20:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F2CC10EE50;
	Fri, 27 Mar 2026 13:20:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HZarcGaY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76A2310EE50
 for <intel-xe@lists.freedesktop.org>; Fri, 27 Mar 2026 13:20:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774617602; x=1806153602;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Mm0FTqLk8MNNAPFV7uM3KNusPTISGuBd/gw7i5cacwI=;
 b=HZarcGaY+2WdVXCnUnzvMpqumnFghd2dYY5V6NhVLahEqj6Rg/2rrRe1
 9CT+bqYC4G05ncOJqaGdrdgb/WLKcszGOpvVvJ5JAceyfD10tbbDwF3Po
 2ZN1Fkuz2gaTGzbjAm/5nqWthKyXok92IdxrswohYPk5mZg6IW3msBPfz
 Oag803vOtkqGc5ymzknQ4lj0sYKx4Qo9Mu0stAQl2KQWQYRrzc/LbIZN7
 gUe4dw9qipP0UaCBpa2uVVf0wLYWbM7JRehhVIxElvutf0VT+Y4kgH2TB
 f9lT6SrnSZ+AfZ7PU64Soks74Z9AYEKZ57U6vvysNqfi0/eheLsrgIt9Y A==;
X-CSE-ConnectionGUID: 6tuV9iS+RQ6sAZ9QFVQ9NQ==
X-CSE-MsgGUID: 8+5U8S/jSPiISb4Fwvf62Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11741"; a="78285273"
X-IronPort-AV: E=Sophos;i="6.23,144,1770624000"; d="scan'208";a="78285273"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2026 06:20:02 -0700
X-CSE-ConnectionGUID: hVsI4vB+R1iDQOtEWpMI+A==
X-CSE-MsgGUID: GPjS/aSJRYKkDKGTP0HPsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,144,1770624000"; d="scan'208";a="248617660"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2026 06:19:59 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 27 Mar 2026 06:19:58 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 27 Mar 2026 06:19:58 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.12) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 27 Mar 2026 06:19:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VSYHACCAtcf17K5h2xUFe+3VZU38zzN8dXGZ4renI/g9h8zmoo7XsE88h5zfySz6fwZQ/oZmT7jcIY6tRbT1hvuKZ5AZwRFFsKmzJfMShI0JVAejc4w03Ft1rFlBuX/Aur2zkrjGPR8mGDn/6f+9Qw/eZy6m3yM914YI7qwxY9AdDnhCvxEXoC0hJoTiTYhn4QuEJtdhvpqTP8kPb84EHAHoDkG6DwZg3t6qYDZ2G12Fvwd7/9bZMJfte12/L3ft3LV3aUkVC3NAtI/uHyk41wwU89SNLXxKb+b+290DipvauIjJo2mOWAnNjVm+ysq2bjwqxA4dOhFU1eVCr3D80g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/1/VtpcVWwY8t0iX4X1GzJv40cEPEG4pBipvkCFwap4=;
 b=kDeEUHs5b7aHfGma7tVtF1zDBGyjF6gfBDnu5bwOJbjiDodhcOFHkVLtR5TGjDU333qvuowVh7zee+uXnp5ACvXr34xFdKn7hXFU2IlkdK9C6+WsxsZBO7fy6S7Qg9udqbJpw6DrSqJiFg/P7NpBHF6ZccNMIc4POY9oLbh7s7xKn5J9/+PCEZ/Cm4iSvLqoeoLQ8EqTqsz4Z1p5D2Z8zu5sS2BVLYP7ehAqRql4FC0xgXJW+UweAdlPIAf5yVIIdSqrwE5/F6t+77gS/owDSZXNHQqqUSSeAOoBP3yk//+Tja6tnGbnQYdvM4vm37/JO055ErUVYbXbrCH6wUbWqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by CO1PR11MB4947.namprd11.prod.outlook.com (2603:10b6:303:99::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.11; Fri, 27 Mar
 2026 13:19:55 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::1d86:a34:519a:3b0d]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::1d86:a34:519a:3b0d%5]) with mapi id 15.20.9769.011; Fri, 27 Mar 2026
 13:19:54 +0000
Date: Fri, 27 Mar 2026 09:19:51 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 2/2] drm/xe: Drop registration of guc_submit_wedged_fini
 from xe_guc_submit_wedge()
Message-ID: <acaD9w2mi8I5mcrD@intel.com>
References: <20260326210116.202585-1-matthew.brost@intel.com>
 <20260326210116.202585-3-matthew.brost@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260326210116.202585-3-matthew.brost@intel.com>
X-ClientProxiedBy: SJ0PR13CA0062.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::7) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|CO1PR11MB4947:EE_
X-MS-Office365-Filtering-Correlation-Id: 35f7bc45-eb1e-4ed7-97fa-08de8c038911
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|18002099003|22082099003|56012099003; 
X-Microsoft-Antispam-Message-Info: 3E7nQ1MzeLdF2BbYwTzTDDMAeIRiLFnhkhYXnp8eTRpshUMpyaa1PhEntX3Whn03QVRJEoJvfx48ngx94wss0OJZ2FnSvpXapmuMny+Myurs8Cyr+dHH4PnIE9uowUHsPI0u0s0UsbEHhLGx9WKhKKVgl7eHaNX0BHFMf7a3xC83xwGP0MIMJCO/a+iPntvlXTnoPLu/Vw38hE1+zWPA7iBulntgOSdZ4AtQIo2EPq5D85bjcNv4Rsx6MBd5ifvOo7FxWBo8mO2eyc6L1P1oVi5swYD2ElmVWDKJCRU1wOzQ9UMqrk4Fb7+zZvU6lnaYXmdChD8a+XXflk3CauqnL6te8TN3cUvLaML99/iuqt7Pr7nmXoRt3I/janTIPihuQE56pyOIomHP3hOeuk3dt0zFa6Z5hq4iOwqzppUWLQYu54wvdbb5DjM1zEamLTyRmvVJyRD0/Fg2cxn0WwaX9kx7aR1PlbokTmrb+snVO3CjyyLYY8hh3IDJOFAG6Ak1cASOjduxTZ1Qp89HJzrHdYXbYm3QgppN2t7o3t0y5pkpPmruBcirNdh36bx3oeYV+Yo2V5/ZRoDO0px/ShocyaOvokAS6FD+MlUH1jqTDY67mj1KsAr4w9pIH8Zhg9LnimQSGt6Hevq0/UL66QYYcbWunezSkH4n+Q5xlZWW61F45LJECD7y3Ayc4Nqwh9P2/ITc+sd8Q81AxK2o17sv3qpibFuhZTH5Fj5mfCA1NMg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(18002099003)(22082099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?h9inGoMPr5Oo175zMlyGaWOCucQAD+5gENDZC6shx5qJ9cGkj8HVpomP5jae?=
 =?us-ascii?Q?iPDtUiPggfGCerrJKQtVyKsQL/PcPCSQ0FSCw63m4jCfCipwiw7fnhpx59lm?=
 =?us-ascii?Q?jTd3UzAYDCqtuYHx/iC2NcOeuVtqpNyMuLExXk6xB8m5dZnwDGVu4WQANtol?=
 =?us-ascii?Q?ge5u+wtMOF7kuiRX7hoCJfFu/YevNRe/HqY+hmMuE544u0UylEIZ4arrXPFp?=
 =?us-ascii?Q?rHXEvDy7qMh9fi3dvPq9aDW9T17zbFHdkT2XpGYlJmNafuLKDIjgJYoGFlGJ?=
 =?us-ascii?Q?8pEKnfbIXtoOdKlL94PpgBHXb1CK2rEhLDWvVUImR73Og9vsG6sXhUuExydW?=
 =?us-ascii?Q?c7CPfGCNdSGxY5wKwW4IW7xQfy1jJuJm7ohqzp0Fsd2q5t8mO+IoRuIwNSl7?=
 =?us-ascii?Q?MJ1CdC83hMk/By5hJthi1FJ22eS8nQ0xe4MqEyovUY77qzXKZmqkck3fcQLi?=
 =?us-ascii?Q?mYnCs+3OGgfhJxJ7NeBvosN8jkeDTIea3b0WW7EpdqVaXAOVyBg6V1Err2cO?=
 =?us-ascii?Q?kuf367N0hdtHmz2MoDUGVnd5bTT+3wwP3yOdHoCiMcnRsJq7YQapzyYtTkmZ?=
 =?us-ascii?Q?VmNTIoHndmlwKef+fdcrTFgh5TPQjbPb5Xyg+XJBkTwhonBagR/2Wyzq3uxf?=
 =?us-ascii?Q?6iNY5txeUdSAl2NlxPl1tFcqZWKIEFgeenf3SKZbmZc+z+yYlYhe6Slk6vGn?=
 =?us-ascii?Q?H224CcHE/FgDSPslPPcCKFTsXuSPKFgdykCfXXmOzzlDeYG8IMNxs80UO0cF?=
 =?us-ascii?Q?mtrFiobKnPItVw0b5/XUu1VxpMaeIVNaYwelBHb8CsoukrTyy3TjHKixiFTT?=
 =?us-ascii?Q?fREt9l4RNxcUXhfcTHpAEEfme+LY6jzgudntfRFemjee9G6FPCzKd8VPVrIy?=
 =?us-ascii?Q?eL6sBj7ybf+qVVSz6skYn+uAX1p+A6EhaGXPASEzEHYRDgqPgafe5HFy6ujm?=
 =?us-ascii?Q?r2FCmQaxhZpc1XE+ft2opIvr8bVjIhfMh9JAIx1snEeDKQDFxf3ZqFkfLKjz?=
 =?us-ascii?Q?5z+j+KisfAY9dPlsK+CJA+XnRpac/2ZV6wbtz9uHPYl6oOayTBjc4kHgplB8?=
 =?us-ascii?Q?8G0VsfN34ZI1XPnSQ1otaewrSegsZyaYQ+6o0tLzPURxr5sn5lIOLGJaf6ax?=
 =?us-ascii?Q?OWZ+rMyLluRPcX8P24A3aKTFVKYwgGk6KvLNjl/FYkrvFqD3PkoX5TBXXoXt?=
 =?us-ascii?Q?HLVK64Mg5KzyGdT2V5JfLld5pFEEFcuIhRW0V83hVJkIJdac9zhKnPmxMTlm?=
 =?us-ascii?Q?3iIdysD0gQf/zEfcICvXCXLkpWjAlrH/akCBm91NoNlsM59nj7X4ewwuTJMN?=
 =?us-ascii?Q?TChN3kcGwW000MRtszb4oxKhB58K8wgV5E0nr9I2ABEL5VeBu/AmX/ciRJrb?=
 =?us-ascii?Q?VgXOYqXi2yObmfXNrh3evf3KjF0Tw4kvrsJF5OktdVygGOjl7S2xPNtCfUF4?=
 =?us-ascii?Q?39x+L0lrNUAP0Gj/ovgyBpnJeh4+UZJGxO4kadQsl6+O1YKucYBsvhvwmY3+?=
 =?us-ascii?Q?2d4tA5Z9qLJKhX0kDqSSEku/XvuIutHFbQlX0SF1XoJ1SvJ6YZ24A7GUbuU9?=
 =?us-ascii?Q?BBi5FiWHy2cVFqry5MBdzNHi85lTAFrgkxi2SbC7DVCHzBb7CmNyDgU1/sPO?=
 =?us-ascii?Q?/aI3Nk9EddY9gVtAVKz7QzWDr5noB5qj1zwRE51Ct7nCwB8RTlM33BeeJPk1?=
 =?us-ascii?Q?PQt/bnYByd81dDoH6SD9cBLSb0VY2sk03B/gvUQjhYlr9A1pE12codAOlPdF?=
 =?us-ascii?Q?+3/OvleCtg=3D=3D?=
X-Exchange-RoutingPolicyChecked: kIL1ciedM39fquQeJ2gd24WebY43QyJPBRMaAUdzrjdNgqtGYK6MpikwyITB9S51iyyVjLJBs+d2/K2eumaLKakk30Wx8udRMF0q8Iucn6Un9pATwzSo3NZEn0NmytbQ9RAnFblCodexYRfPYxg/Oz8i4x57HU1S9avnej2yw3Igld8o2cAa13G+pdx6LcNzlP888P5rZ6X2ZcbEmstRmsH4ZLcsgrT6uxVdIghMvtD3Ff2zzj1T58mJ/9Yz4UJ58dbMRKz3jYfon2ZmUBg4CKObWDhDl8jhf9SvmoGkapvXyZ6CuHEvL4vE1VQN4WbtAQmA8otppV4T4jsvJsxKMQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 35f7bc45-eb1e-4ed7-97fa-08de8c038911
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2026 13:19:54.8583 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pDuBbbImktEf41coXzGCNBfWrSgS4/Q5+1LAae+rrSNY0k1Xb2z37qlH8nrwEUc6V3smQ1ygO2YN3bd0IIRCvA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4947
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

On Thu, Mar 26, 2026 at 02:01:16PM -0700, Matthew Brost wrote:
> xe_guc_submit_wedge() runs in the DMA-fence signaling path, where
> GFP_KERNEL memory allocations are not permitted. However, registering
> guc_submit_wedged_fini via drmm_add_action_or_reset() triggers such an
> allocation.
> 
> Avoid this by moving the logic from guc_submit_wedged_fini() into
> guc_submit_fini(), where wedged exec queue references are dropped during
> normal teardown.

interesting and easier than I had imagined.

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> 
> Fixes: 8ed9aaae39f3 ("drm/xe: Force wedged state and block GT reset upon any GPU hang")
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc_submit.c | 33 ++++++++----------------------
>  1 file changed, 9 insertions(+), 24 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index a145234f662b..10556156eaad 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -259,24 +259,12 @@ static void guc_submit_sw_fini(struct drm_device *drm, void *arg)
>  }
>  
>  static void guc_submit_fini(void *arg)
> -{
> -	struct xe_guc *guc = arg;
> -
> -	/* Forcefully kill any remaining exec queues */
> -	xe_guc_ct_stop(&guc->ct);
> -	guc_submit_reset_prepare(guc);
> -	xe_guc_softreset(guc);
> -	xe_guc_submit_stop(guc);
> -	xe_uc_fw_sanitize(&guc->fw);
> -	xe_guc_submit_pause_abort(guc);
> -}
> -
> -static void guc_submit_wedged_fini(void *arg)
>  {
>  	struct xe_guc *guc = arg;
>  	struct xe_exec_queue *q;
>  	unsigned long index;
>  
> +	/* Drop any wedged queue refs */
>  	mutex_lock(&guc->submission_state.lock);
>  	xa_for_each(&guc->submission_state.exec_queue_lookup, index, q) {
>  		if (exec_queue_wedged(q)) {
> @@ -286,6 +274,14 @@ static void guc_submit_wedged_fini(void *arg)
>  		}
>  	}
>  	mutex_unlock(&guc->submission_state.lock);
> +
> +	/* Forcefully kill any remaining exec queues */
> +	xe_guc_ct_stop(&guc->ct);
> +	guc_submit_reset_prepare(guc);
> +	xe_guc_softreset(guc);
> +	xe_guc_submit_stop(guc);
> +	xe_uc_fw_sanitize(&guc->fw);
> +	xe_guc_submit_pause_abort(guc);
>  }
>  
>  static const struct xe_exec_queue_ops guc_exec_queue_ops;
> @@ -1320,10 +1316,8 @@ static void disable_scheduling_deregister(struct xe_guc *guc,
>  void xe_guc_submit_wedge(struct xe_guc *guc)
>  {
>  	struct xe_device *xe = guc_to_xe(guc);
> -	struct xe_gt *gt = guc_to_gt(guc);
>  	struct xe_exec_queue *q;
>  	unsigned long index;
> -	int err;
>  
>  	xe_gt_assert(guc_to_gt(guc), guc_to_xe(guc)->wedged.mode);
>  
> @@ -1335,15 +1329,6 @@ void xe_guc_submit_wedge(struct xe_guc *guc)
>  		return;
>  
>  	if (xe->wedged.mode == XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET) {
> -		err = devm_add_action_or_reset(guc_to_xe(guc)->drm.dev,
> -					       guc_submit_wedged_fini, guc);
> -		if (err) {
> -			xe_gt_err(gt, "Failed to register clean-up on wedged.mode=%s; "
> -				  "Although device is wedged.\n",
> -				  xe_wedged_mode_to_string(XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET));
> -			return;
> -		}
> -
>  		mutex_lock(&guc->submission_state.lock);
>  		xa_for_each(&guc->submission_state.exec_queue_lookup, index, q)
>  			if (xe_exec_queue_get_unless_zero(q))
> -- 
> 2.34.1
> 
