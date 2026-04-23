Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D72EFDEE50
	for <intel-xe@archiver.kernel.org>; Thu, 23 Apr 2026 21:31:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 507FA10F2C8;
	Thu, 23 Apr 2026 21:31:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VA0MWJSC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF6C410F2C8
 for <intel-xe@lists.freedesktop.org>; Thu, 23 Apr 2026 21:31:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776979868; x=1808515868;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=StT1TdT5SxqYem3GHSWnd5MOtlVhKj5BBU20NU3LWE8=;
 b=VA0MWJSCPLc49S1CMTc1uez74tEn3ijZPPRoiwZpJaXWgiWioIjXFNZN
 g0lDgQmWbpntAWR+cfOLitPb0nhdPRjERITevcXVILWTmmqbJDBNaW0Uc
 ktUQ1hOLWssZU7//ifubHvmXkjzjtTjWLqWzQIvkNmOsCsYNGb4BZLU0w
 MCzIv4SphituOIQ+8Uef8ZkDt2NFy6paFqSpHIWJJmIGCkcd0ajiLol9i
 0klkAQyXuBNlkz8LW/3uyJLMdH9s1KttV8dyZGSGqYu6bDazoLhp84QsF
 OIbtCvNRKZn92U+gmEVDCjded5hBsz5y1ABuS6K2hDSM04nAJNpmlqfMk w==;
X-CSE-ConnectionGUID: ySjujdqgR1+IdZzw9A3kyw==
X-CSE-MsgGUID: dOP8A6oeRzuTNDlQm9/Uyw==
X-IronPort-AV: E=McAfee;i="6800,10657,11765"; a="78021770"
X-IronPort-AV: E=Sophos;i="6.23,195,1770624000"; d="scan'208";a="78021770"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2026 14:31:07 -0700
X-CSE-ConnectionGUID: I4+qlamAQLKLij4FgSy6Dg==
X-CSE-MsgGUID: 1NzqhnKSQfyCTgp0SP3O0Q==
X-ExtLoop1: 1
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2026 14:31:07 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 23 Apr 2026 14:31:07 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 23 Apr 2026 14:31:07 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.54) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 23 Apr 2026 14:31:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mOkLl8BksbYiO8rsjZPJ+NKe5ZmunLJY9o0QL1bYYQtMwWrd4O2IlJhjObE5zANvAVkUevsSg0ruwvZgij/3wlGYXg/mbzsegTXbjM4tRZmKEmVj+lQukrTCqm8k5I3J9vBclYS2ub/bwN1+rqpDjc0ja07350mAjEPb5kRpJGU2Ge9ro8J9/qvRcbLMDrEBAA9WXE7/SveG+gF/Q5CMeNZZZVizrL1Y1Ce1A5jVYYCXz0z+sfFjq1P3AY9WZ1ACb+94BYJfeHLW56qAjaPzY+u9LBT8KZUud7MODpPCQE6Gkojd+n9KNPWFvkdrkqDbNKHW+Q/OVfog5sVBWqMafw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xxjN+R7tuh331FGfJedofafeoxqzQUcJMUz+wxc/9kY=;
 b=ExJ6VzQDot7PljZ5WCIFaT9BITZkuJPqS1BhFx1rP4xrDWXJbfc33ZOvhAgjqWWVP+xkoqHJrV0+cqOvq+ubBTUNOuYeC++lHyCUTYt0M1K8RCQp4iVQxd6r0naBMOmq2V5/kIU+JlKQhIONU8NYoIU1oAh1dMwVCuoRfMRFJVBdVWomMAGbTdbfdFiWpP1cgniU4nPJEMioaeNeqA5YLAtQv4/6JjSbkmrUpHy9UYLAEm8JBzc4Bd6D9EiWoBrb989cL8qXwBd5AJrS5JS6VUSyqagJkS0I7H3NXIKwkB+eXAQhIk5tO9dK7betdRhx6+xtDv5cGSLfQRK4P40EQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH0PR11MB5112.namprd11.prod.outlook.com (2603:10b6:510:3b::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.20; Thu, 23 Apr
 2026 21:31:00 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%7]) with mapi id 15.20.9846.021; Thu, 23 Apr 2026
 21:31:00 +0000
Date: Thu, 23 Apr 2026 14:30:57 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [RFC 1/4] drm/xe/multi_queue: Remove redundant assignment in
 guc_exec_queue_run_job
Message-ID: <aeqPkQoS3oXu6tGE@gsse-cloud1.jf.intel.com>
References: <20260423024954.1665095-6-niranjana.vishwanathapura@intel.com>
 <20260423024954.1665095-7-niranjana.vishwanathapura@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260423024954.1665095-7-niranjana.vishwanathapura@intel.com>
X-ClientProxiedBy: BY5PR03CA0008.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::18) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH0PR11MB5112:EE_
X-MS-Office365-Filtering-Correlation-Id: ac884cba-c1e3-45d9-e7a0-08dea17f9cf6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|18002099003|22082099003|56012099003; 
X-Microsoft-Antispam-Message-Info: ntIDNBN0bZvZf2egmsyGwC3PPEWoUdGT483fzxwM6BcD99txNKjANEKP1nK8PHoVe4ZLrQxPXSNlqpvFzqc0i5BjuKlOwBM0zez/+5hUdbALN+5cx3+Mt5REBuYcEgh1oxEZ1yJrr4un4wMV3IJRLIdfp5SztixYQFsFr4/f+d+vMhDWVgIce+AUM2ZjdFPIX8vbmuugX+moCg4XvMdDkrSbJfKPsV7ovR7xEoJfejf/Ysb4FxV1QEsmsmz3uGxHF1Ukd88pZS0V7w9zmVlbD0dZCnyEVxhQSRB6AzXGUFVbPpPZEcRo7hsAKRaqdXYfpZg6BM37aQfqveYQMocdQ634cujB1VH+zXwm4MF0/MvAM2ISmdkDZ0JjX779yJANOBXhjpBt0SpzSoHkINP2iJz/dCh82zFM1WHEznJn1LqwW8uI/isKGHxxFNtuu82Hso4W5rcGGxOFNWQntXgpda7rwmJYNieo5+xRX0v4f9YLtucxKbKJSOM82sXwoC8qbeRMv6tRO8nqerLsJhvHr6gCRgCXEg0qcsS86lZBfxpzhrHHdlAsudWsU9s0AkGHW2PzZol9BUNQXL/q9V1sTiRkR89l7FMGJ3TIhi9mq7AXCUVo4MHF7DHYgXZ67cQBm5l80/Bfgxr6hJ1xDNLNhAkMDhsGmxshooC3MefG5fpx3i1toYWczvIhBt5AHmOXR6pw7eUjwtjtJyywt2QRG1l1lCiOuHFEIoN5ZhohEdo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(18002099003)(22082099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?R+1vVbp82TpKlSGRNRURV8K3zn3eT2cb6CXoAUB2EGuEf+o3IM7NDaJbp0OF?=
 =?us-ascii?Q?fSn7hV/VKUZYnjVOpLSJXD/OdvPMaH1Cd+Tzogwd5dP6ASEhWhqGSlosT3Vp?=
 =?us-ascii?Q?rqihJC+kmatNpShdufiPTc03BCRR1YQhDOk2YKm6c++caC9GKvk6+1h5nsO+?=
 =?us-ascii?Q?RoIABOhNRgazwyVL4vwjeIN/GpixRuM4LnBCoSOmesbCZfTp8uw8u4MMNLtv?=
 =?us-ascii?Q?Q4iE55XGYcWpCGxq9UohwV87N0P56VL3M56HAQJ3uNELGZxomZgpAidngy4u?=
 =?us-ascii?Q?Hf71rDVI+J7lFaifx7AKGQGrI5m4bnUFcTmQ/xDLJFk29IPRt3o5gjHsB8oS?=
 =?us-ascii?Q?cHGGn/i9hGi6WYV7Qx+0f+FtcE4WimwswxcCF4rz0NgoaSDvGAoAydOi+ZtN?=
 =?us-ascii?Q?AM6j62sglO9IJ0avBxr3n2kPKYRcADnOrUvTRyTe+4YVMjM9E8ui/cv8cLRK?=
 =?us-ascii?Q?R11GOai9PmmyGmETnrycBwmvsxp+kX3tdpzJAgbik0Bu3kzGKUPTAfsT7XWw?=
 =?us-ascii?Q?lfzH2lllVyTKl//SOlIWLvciphGtF8trTCY/PFTZc6G0vut88xVS0bc75I5F?=
 =?us-ascii?Q?sG1FJ+cI9dPGBsGRjKEeSV9WyNMytZD3TQTHHWzrxkhDVsXYVESNAhPH7MAt?=
 =?us-ascii?Q?8QsNq3I3r5+io9oNFF/a4e5CZK14AJmiUprLow4J1s+KHq5PBirX+LYYDa1x?=
 =?us-ascii?Q?46WaqMdKjjVlbhfywnebRNhPsJqSP24S9sV8Bai97PrRaBa6DqBBDVEKxpch?=
 =?us-ascii?Q?J/hS5Ixp3Z/DdfefnNCbo5FMtlkOpgGfdAWZYeOjipyI/hMKpLVKeYz3UnDa?=
 =?us-ascii?Q?4/TOWFyAr4hYhK+eX10cPMOH4+1Ezfs+dbQd9OtZkGzWbVjoOX+AG1UfQMit?=
 =?us-ascii?Q?ofozpnixnPOm9U4IjcLlctVfle4LbudG5KmM9xunoUz/pQkJAs2pATMR/POs?=
 =?us-ascii?Q?fq9dWV7WcBJ1qvGeTtrZt024z7R7xnMhj7bgAvty1+D+m0UG2hOJf2apGRq9?=
 =?us-ascii?Q?74PSKsdPAgANP+xTFAvBwG1x0resaNGvZjnm/mUxCBRIzhIBs87Ud57LsLUf?=
 =?us-ascii?Q?MaUAXgk3dCtPHq8X6tF/aQPQyGcL7Zfni/gLuDwW5HqHnswXybhEK9/o6GXj?=
 =?us-ascii?Q?F8TqrhBtogpYHmhjm9+COxF2Va4xEUg0CoiWfn6nXAy9SRtzG5K/fPOeGlb4?=
 =?us-ascii?Q?xm/gAD7hok13jPJhWy9HhOaiDCm4La0ZlRMtF33iYsSmw48tO49NFF93ekNK?=
 =?us-ascii?Q?tUqkXIEDEskVBvWZQVz5HGl3R2NmWWs8OcP8ImJmFT90In3xMSxJaXs+yqxI?=
 =?us-ascii?Q?a9VU4MVVLeZmfJeVAKVVUe34v2j+XrzATaBRlaKRswrtfpQdTKtMPYzXtsvD?=
 =?us-ascii?Q?g0iFrJ1CBTDpq0TtebHbFDzHphwA1N9G9pa4z0qJb7U95Cs72oWEW6tOelVD?=
 =?us-ascii?Q?hD5J+RMSmvxIuXlydoqjLGBnL1JiBNjBklzjiYXV5ASBaU0oIQA88nscMaaF?=
 =?us-ascii?Q?mt0CZSNqeLzQylFiGBnsrdwmlPLAGpL8wLqwagdyzYR7LPEySyFFYjH2eWxF?=
 =?us-ascii?Q?rJs7YVAx1OWbPomzvQN1aTExAvpMBP+n6rqKP6nhHQmJBQOc4au1ckpTez8t?=
 =?us-ascii?Q?FmOK8S+D98wxnZdhaLdL1HfAEeN/AEpVz/vCZfs4NE5k9e9quHqcnZVbMu7v?=
 =?us-ascii?Q?0+gP6vxWh4UZOAxqzZI2yFmAq1X3IkL/2cbgTNJFTd2PQEIlcydM3nvX5pwI?=
 =?us-ascii?Q?F5X3JRzNfw=3D=3D?=
X-Exchange-RoutingPolicyChecked: L4ds9Tsj+ehGGjkat/X9518eYGl2oia5SOdPc9TlOuJdTlmxm6b2bBvFK76JuOUx9THBYJzygFuPuIWqR9MCecn+JP7T8yJ8OM8aI0KuY80T99vF+nvFdDIrYvXLsJX+7oLbgsF06f7NKC/I9hWjDXTw0omKxVGCs7obJh0gyYxKeHN/MRbJ95y0Mi4sr3ojVuZ9J02CKTCZunRjVIYFp3qDWTpshk0AaC2gg8qh9vSRh/JGeT2oPT4jAOGH2c/HKML/vrf1FWw2JesPgL8SnwgEqpgPZG0v00SSBkY76EnSOGRyadZ8j14Eobx3WM8cJnq+irhsT/9vPonwfunsHg==
X-MS-Exchange-CrossTenant-Network-Message-Id: ac884cba-c1e3-45d9-e7a0-08dea17f9cf6
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2026 21:31:00.0923 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BEe4Bkn4ad+maDkt769YkNl679viqfbgxCTsSf2GKK/a4llVE7GU9yf7gEdjvy6M+lkHCgAlZZRQruCohgNhfg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5112
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

On Wed, Apr 22, 2026 at 07:49:53PM -0700, Niranjana Vishwanathapura wrote:
> The 'killed_or_banned_or_wedged = true' assignment is redundant
> since the variable is never read after that point.
> 
> Assisted-by: GitHub Copilot:claude-sonnet-4.6
> Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_guc_submit.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index b1222b42174c..104e65913dff 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -1216,10 +1216,8 @@ guc_exec_queue_run_job(struct drm_sched_job *drm_job)
>  		if (xe_exec_queue_is_multi_queue_secondary(q)) {
>  			struct xe_exec_queue *primary = xe_exec_queue_multi_queue_primary(q);
>  
> -			if (exec_queue_killed_or_banned_or_wedged(primary)) {
> -				killed_or_banned_or_wedged = true;
> +			if (exec_queue_killed_or_banned_or_wedged(primary))
>  				goto run_job_out;
> -			}
>  
>  			if (!exec_queue_registered(primary))
>  				register_exec_queue(primary, GUC_CONTEXT_NORMAL);
> -- 
> 2.43.0
> 
