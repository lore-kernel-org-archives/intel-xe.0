Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 032D7C25B76
	for <intel-xe@archiver.kernel.org>; Wed,  5 Jun 2024 23:13:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9152410E056;
	Wed,  5 Jun 2024 23:13:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gncqDvwJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1729810E056
 for <intel-xe@lists.freedesktop.org>; Wed,  5 Jun 2024 23:13:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717629229; x=1749165229;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=Whz/4NCDqwMAiveSnUg+0p5JQRJ37cdF3pAhMTNLED4=;
 b=gncqDvwJ/6E59VQOwSX4dy8OmXtOe5P/nKixRzYGmDWx6C63cTIgrQ5J
 LOD4sYZ9WqD52de9J5NNNBUeOF3+eZzXLprFr43LEQSIhno49qXTlrMjk
 dbR9BmCzD0waQPbY6lS/MG8D+/VRY9LcRCBPIB2pMfneL0JPf3Lwqct0a
 mOhD7ShB4UvM8tuLqGpGz9lDZEd39RworcvdgmMBBAfeNfmEFa9QRZmqi
 oEIGG6goU+imVl/E3YamxOzn8BsG3VGNjWzyPIaJ3OacI0/esv1PfxCj1
 OBgovPi7yBySBdh847L6WTGezYrv2v7KokV9/wa0MnKQkMMQM74ktxRyI Q==;
X-CSE-ConnectionGUID: VloH3vjQQt+gdkp/+lRRbw==
X-CSE-MsgGUID: qmBGYdD8S6+hvBPPJPGW8g==
X-IronPort-AV: E=McAfee;i="6600,9927,11094"; a="14425664"
X-IronPort-AV: E=Sophos;i="6.08,217,1712646000"; d="scan'208";a="14425664"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2024 16:13:48 -0700
X-CSE-ConnectionGUID: q7VYnbfuQ6ugTIFoaRODrA==
X-CSE-MsgGUID: ++/Kg3pDQt+bKP18GZr41Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,217,1712646000"; d="scan'208";a="38315512"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Jun 2024 16:13:47 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 5 Jun 2024 16:13:47 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 5 Jun 2024 16:13:47 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 5 Jun 2024 16:13:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JvxDv+Egmcag+V0LJFHeRyWpjt3hWIJr8TiQB+XMKIR+hL8fD+zei8RkiVrep2IkFrC9RUQLoNls8SIZu1NQUvsvN8b3QzLmbg9bWYHQ0FPc8q3aBxurVAdF+Ru3+hnkP80EriVxPkFZF7nPEJBya7Q0VnHxHGWpU9DxSrfe2cMxpEdSCOnaTfZSQ24EANduDnjwv+j7jkjHKPWxnag0IuGIqJSEUqjmNwfEwIYWJXiMq9mzJSI5zvykUiR5QUcPNUY6F8tp62atwdetOofCoOxR9KgPIqJ1hYpT7xOHFzX7WicCLgpmEGCkriRRw8Sf+pdr09G90KCJBWhkPc9LCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+MOyMNX+VCM99fWLSepeJb79FjNPnFYrAN+PDqkxSUs=;
 b=jZ6M6KGSs45ptH9wlsFNAaJUETXyTL4cOR9Tw4/hVBLU7/0R72TZdM4N+2hb1vv5tgz0u8MnQKJhbcM5lWNe85Op2tBs4gs7dKNkE0Flgj3WBPlg9cdt5klhya3n2tdg7aROcH1c8Q6EaATAGfQBUZ7ch5mVd607wgoSQhZoOyWTgnH5kZB7wto43CpNeCFWGiepR/vKB6zLjZiZEBa+npR562UQZOd7mmVKfCxYsAbWK8s+rwgFCER4Nt2Punr36fjqV1gmQ1W3hHQlS4NHjtCoZjjIEnLci51Cb8PnjiHFjtdcRov01SydtSedG7aPyfhY+6E2UAAycZvHXf8vGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SJ0PR11MB4847.namprd11.prod.outlook.com (2603:10b6:a03:2d9::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.27; Wed, 5 Jun
 2024 23:13:45 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.7633.021; Wed, 5 Jun 2024
 23:13:45 +0000
Date: Wed, 5 Jun 2024 18:13:42 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Thomas =?utf-8?Q?Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH] drm/xe: Do not dereference NULL job->fence in trace points
Message-ID: <ngmanv6726qo7ggl7w7eb2ifhox3mjvfcug74ljassq224hv6a@edjwmgcr7rmv>
References: <20240605055041.2082074-1-matthew.brost@intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240605055041.2082074-1-matthew.brost@intel.com>
X-ClientProxiedBy: MW4PR03CA0299.namprd03.prod.outlook.com
 (2603:10b6:303:b5::34) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SJ0PR11MB4847:EE_
X-MS-Office365-Filtering-Correlation-Id: f1f978e9-9e05-4b3f-c8e7-08dc85b525e5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|376005|366007;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?KmPkw32kdB8sbjzwQDFzK+ruJve+DO8nb/JdjN2rhIOgCFvhUWz+yji2lD?=
 =?iso-8859-1?Q?v+5IfCfK093cQkpCUDD+iPxL0KpjvQcXIt1hmAU91vbjS9ialHPP9L6TU4?=
 =?iso-8859-1?Q?AvURVzBMkguW2ZakBvTHYrkI0vTC/GxYmIxBETjmiuyojdLlvMnxREYLui?=
 =?iso-8859-1?Q?YWC+Or888xH32YJrvWa+3nkEF59Z1kfSCGhn+a6O9UK/xC0M0lOHznPyGj?=
 =?iso-8859-1?Q?YN8p1DyDvXxHR7ltC25lt7Hvwl+8nAryynp6mzu0oBdtkGw0xV2eOhZ0WU?=
 =?iso-8859-1?Q?HUjkCwHjcRxZLeyLMbQJd0drLRBD6uiWD2+GMoY9hnk4LumS6tiM0BoONs?=
 =?iso-8859-1?Q?cYQUbgrl4WD9tUUBZI1GHxBsgQqUpyXrHftvKelBUWXxQIw2+wLbBJxuSp?=
 =?iso-8859-1?Q?IAb16yJj3+Qz+iLJ/2X6hoTwCttMhe7PHvCH9xRb5aSwAhzQdxysKfYjR8?=
 =?iso-8859-1?Q?I1TrbjZ1qGMEWQE8l0tNQzxkXpujqcRupsOWFgpadDNYXILnsHUtJXgIZ2?=
 =?iso-8859-1?Q?m2rDxCoyF1BJWBMKRpI1W52a2G+B6wUykNPGk80iw7wl4+OuUCQ0BnnSoU?=
 =?iso-8859-1?Q?8lxwOBtialZdlOJ3BrRDe7kd3TfcEh2b1yRK5Lbbl82PknuoSqU8e/gSWE?=
 =?iso-8859-1?Q?w/VmjJBK31CSClc6nzV5sp6pJdbh2V5JgaPyvIYqBlxNcrTpPG737HzNY4?=
 =?iso-8859-1?Q?KAoEWHu7WZARVHlIcVmS0CrX0/0bU0nfScZYtWIByDhEvBfAuIMTGk4SO/?=
 =?iso-8859-1?Q?BvvKGgdzT5LunmM8KwLr47YRk994ktAshdk9mdZFETCbF9Wk+eopVNnyc1?=
 =?iso-8859-1?Q?r0e2JLl1OGVILyKTS7xOnmH7fKh9S2ZDx2QbJn6pJqyMunekCruuaXUHHZ?=
 =?iso-8859-1?Q?g+dGp/V7QtmSbuSc8Wi/ZH4oTnXc4LkJdZLdsB0wPkpAeyd2CSyc/OWE5Y?=
 =?iso-8859-1?Q?LtAnbJHoMBw27iZsxeMtx9yfQoN9rPt81cTxokadAwEj0naKs20PeLyJrK?=
 =?iso-8859-1?Q?U9WgfMTERpXMEPvvkFVu5v77ZwX8Y4nTM5C0p0ASn4oRw+BQJQ0RuKoGD+?=
 =?iso-8859-1?Q?hjtHFA4JUJAG/jD6tRvLKT6EOPu7B1EbB9QJHMQ6bmnjsRtl8h9ob2EBOG?=
 =?iso-8859-1?Q?hDNvvg0OrxR4yLty65kDFqIHf0tDXy9lV584tQnEX7Dz0g+tvMCJ7ViHn/?=
 =?iso-8859-1?Q?GFElKAGyNSQ5aHUAwr/nRrSW93tZqCBuJ6Xp7yWwUhU95jKfoilU+b5qIW?=
 =?iso-8859-1?Q?SX6ECMq8W58YLUPETTCMq/10OdDUqPz5pCqq6Iix2JXDkRs1ndZkkrZ6Re?=
 =?iso-8859-1?Q?ufH/sqRkmA8HoMmuB3GymZK6rw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?TdCr2WMo+Bi3cl2vg0dnPF2HTEhn/v42RCVC90nrq/b1dnstFpnlPrP4rZ?=
 =?iso-8859-1?Q?qVl2nNkTUMkcpOUJfuxwufEp2lNpuQSPqH9buChaoxwA7y9mQnESBzojfo?=
 =?iso-8859-1?Q?nbcxPGnp/ULlNtKi4ue+7aSpPINpPwgfNu9+2KX1GjJUuegmN1lsRCle+y?=
 =?iso-8859-1?Q?DwP9vQN0eRJ3Z2Un7jIdW2rSWVFXaQcTLiLwHGzTUj97xR6EFl/bfEDGrC?=
 =?iso-8859-1?Q?IdkGllosPMiwfhJksa1gWFbVCd4c0xYmJsteb0o4elE3xGPwcU/7/55fKB?=
 =?iso-8859-1?Q?p4reBB9DA65xWTkbmJuM9XwL3Hy5DZnhPXiM+h07z3Iqao2UbFYFiZfr6P?=
 =?iso-8859-1?Q?8FbY80pTywrrJKQ8VLDmvkxeOjXVbqD2sKgm3mB6ACLu07bDRIPwXa0tgn?=
 =?iso-8859-1?Q?ipZKCFdnPC/HEk8fxLspfsBK6gfencYtSVRWHEP5G18rzBlMRzK/J5ZvyV?=
 =?iso-8859-1?Q?FZavRb4SdYoctZLbnWU2EGy4XRN1G1xVByrpDwPDGtvXFFW0vYoHZedA2f?=
 =?iso-8859-1?Q?yMEkqyvhuCrmVzGdEYA9TXF55zkk0yZY1iEL01QR8759YqmCG2ySmW4T0b?=
 =?iso-8859-1?Q?uuNuFnKIWYwXCDValQPS6yiAp9UywzQAbPSHmcximJEcFM4ZlNodfmauzh?=
 =?iso-8859-1?Q?KZqAEklxixz0TT0C3BDU+AU0qS3KB/trVVFIAq24DZ6F4jJ1MINPJO2FX+?=
 =?iso-8859-1?Q?+GLRgONXcwqEj5OR5wCroripqKBWEfgyNt9Qa9CYBuWYWEYaWPFpWb1OHm?=
 =?iso-8859-1?Q?jVt3qpsySe7Ghn+CbO2bmqGhDybaLPlkfyJ0Hjxfl//K5YZE0l8vUxCUDG?=
 =?iso-8859-1?Q?emNHvZTvgOkc+UXC23Z4TxtdXILPDlMfJEk5Exbgl30AkfMUATWbM30wlm?=
 =?iso-8859-1?Q?G2YhJn+3CnaDpHIait2BFb2EPrZKmdqKZiMXlwXI5gjO0WWuZ8FPYjZeKe?=
 =?iso-8859-1?Q?eri97ohvs4fIJDWWnnbBDmLriM+txbn6G2j/yPwm1pao+1Ry97T53fxRdC?=
 =?iso-8859-1?Q?tYqHZhRMvHhn3TuqN973LyObMJ/7xzF2Yhr+KxzoGV03Y4po8zs+MJoKMx?=
 =?iso-8859-1?Q?oUje2A7cyGyU3GcRhceeOjxxeqDxU5o0NnAMu6lVuEdFURt0PXxGuxkyjr?=
 =?iso-8859-1?Q?8Tt0hCjLqUP0cqEI/9wU5vRuIUji7lf22Pjj/AjstHTNPjXPk5SzwxDrMk?=
 =?iso-8859-1?Q?kynLpAXGAWCABlC845w4JsSCu+yJRFl9YeyWG83EYN29Y8mJNQKKozwVCL?=
 =?iso-8859-1?Q?45QNxlOIh4ouC2WXhq9GECRQUdMMyZ6N4P5xBV/m33esJT3IQsuDe12MZz?=
 =?iso-8859-1?Q?Ir83Fnxt95AIRPKm1aRxXVzV2/enIVCeSSM74vK4G5z1DqrJAJqFEUgpFm?=
 =?iso-8859-1?Q?CyuuoYlyefPNu2UQwck/8MZkQoEXepuCX33T15btySULA1LkP7EdiJT6cO?=
 =?iso-8859-1?Q?aj3YJfxggFh8HsM4HLDqZ4eZ4xrxF02K6XPuJXeCrTdnf4FPwnQVgQ+c/h?=
 =?iso-8859-1?Q?PBrrm7oWyFr26UWr294GuELQ++43ep/mWUJlenMIIMU+oyWpzYEqvIwe0b?=
 =?iso-8859-1?Q?oAfsUeUVeqUUpv2zZSM7hFdkgApn4Wq3kL3wiGYte1+gFRypLaX4dLejMc?=
 =?iso-8859-1?Q?lIUDx23kvRQUXOiVjTC1jZwXfVyCiMDoXIW3Mo2ZDgl71D6AuL7nhXYQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f1f978e9-9e05-4b3f-c8e7-08dc85b525e5
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2024 23:13:45.2584 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: leQhm87ALhTyHSWW1+cMM6J9PElgx7dyYFeReZQaz3yoXcvDRl+K4yBdJIRMRZiJPQ0G/q1InZrKTuD4QHsfPAP6/2MRt5JuS34se/41Ots=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4847
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

On Tue, Jun 04, 2024 at 10:50:41PM GMT, Matthew Brost wrote:
>job->fence is not assigned until xe_sched_job_arm(), check for
>job->fence in xe_sched_job_seqno() so any usage of this function (trace
>points) do not result in NULL ptr dereference. Also check job->fence
>before assigning error in job trace points.
>
>Fixes: 0ac7a2c745e8 drm/xe: ("Don't initialize fences at xe_sched_job_create()")
>Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>---
> drivers/gpu/drm/xe/xe_sched_job.h | 2 +-
> drivers/gpu/drm/xe/xe_trace.h     | 2 +-
> 2 files changed, 2 insertions(+), 2 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_sched_job.h b/drivers/gpu/drm/xe/xe_sched_job.h
>index 002c3b5c0a5c..f362e28455db 100644
>--- a/drivers/gpu/drm/xe/xe_sched_job.h
>+++ b/drivers/gpu/drm/xe/xe_sched_job.h
>@@ -70,7 +70,7 @@ to_xe_sched_job(struct drm_sched_job *drm)
>
> static inline u32 xe_sched_job_seqno(struct xe_sched_job *job)
> {
>-	return job->fence->seqno;
>+	return job->fence ? job->fence->seqno : 0;
> }
>
> static inline u32 xe_sched_job_lrc_seqno(struct xe_sched_job *job)
>diff --git a/drivers/gpu/drm/xe/xe_trace.h b/drivers/gpu/drm/xe/xe_trace.h
>index 450f407c66e8..e4cba64474e6 100644
>--- a/drivers/gpu/drm/xe/xe_trace.h
>+++ b/drivers/gpu/drm/xe/xe_trace.h
>@@ -270,7 +270,7 @@ DECLARE_EVENT_CLASS(xe_sched_job,
> 			   __entry->guc_state =
> 			   atomic_read(&job->q->guc->state);
> 			   __entry->flags = job->q->flags;
>-			   __entry->error = job->fence->error;
>+			   __entry->error = job->fence ? job->fence->error : 0;

we already include xe_sched_job.h in this file and even call
xe_sched_job_lrc_seqno() a few lines above this. Why can't we call the
function you just fixed? With that changed,

	Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>


Lucas De Marchi

> 			   __entry->fence = job->fence;
> 			   __entry->batch_addr = (u64)job->ptrs[0].batch_addr;
> 			   ),
>-- 
>2.34.1
>
