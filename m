Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76453F364BA
	for <intel-xe@archiver.kernel.org>; Thu,  9 Apr 2026 21:20:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 353AF10E05C;
	Thu,  9 Apr 2026 21:20:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WXUx+mBK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07A3610E05C
 for <intel-xe@lists.freedesktop.org>; Thu,  9 Apr 2026 21:20:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775769653; x=1807305653;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=HSXqALKj2F+sTFRmBqk59yQ/h8uOJI7Ycgd/TiMFXw8=;
 b=WXUx+mBKm7laHp02g57fI+Qo1k3Qy6oTk3mZBDskV5mr9UbkyMUDnF9v
 oe4wdPNe57eIws1X1vN4L7Y36NAdU3RY68JEHszt2qF0ANiO+0TWZnNIo
 BauNlQkMgWLH4s7lRLJoHuWH+8D+Dk/wtubO48rgeu1ifKvGn4CkwjBPL
 iLOVqLWrGt7/lI4C1Axg2C5Oc1aOZwPtPCzqJfWuLni/A+R4kLl3jJ7M3
 l3p4nQUTmQLR4OTS9NAoThSc52+vGiEGu57Fw6MX6fh143QXz+g6YQ6xx
 CEXlgLoWwPEkBK1ySEB8YkMhg/Pekine0qD7n/gKzHscWY8wYgI3OBPmp Q==;
X-CSE-ConnectionGUID: H3mkWJsRTPOQleD1Y5IRSA==
X-CSE-MsgGUID: stFPoW3lQ4W18MGJ0m77Ew==
X-IronPort-AV: E=McAfee;i="6800,10657,11754"; a="79374066"
X-IronPort-AV: E=Sophos;i="6.23,170,1770624000"; d="scan'208";a="79374066"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2026 14:20:52 -0700
X-CSE-ConnectionGUID: hfABPzFhSIKvK8dift0BIQ==
X-CSE-MsgGUID: L6mA4Nv0ReaBjmaNDqbQgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,170,1770624000"; d="scan'208";a="227900907"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2026 14:20:52 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 9 Apr 2026 14:20:52 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 9 Apr 2026 14:20:52 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.30) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 9 Apr 2026 14:20:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HOqyF5D1Oakao8VSfw04FtHlkUJZGMNs9bbcjKB0Gc0y9e9dRg03xxSh3reJJhmyLWT2wIL8C4sOemTyFvSCAPyZNHeJEpaR+jyht1mBnK+tKq05FzJvWzzOMlWaTWnDq+H/C+sBOB/Ggdce1GilWcRnH2EPn+M36Vo85BS1TUK0vnJJZ5yyl9cgiVTcdxpohJBQ50slbZxFS3G8iNQ22W2s3yw9vgOrs9MFHi4UVcXEAy2W3zfT3Zs+K0XRfExVKuBO/U417afKN+OoUk8Nx5IdK0HCEJ++gc/Nwi5MuNQ0u4hAQFZncdajz9+lQNVE0+hB0rTDRtG+M/ks6TnlHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mBcyUxb6nfoOoQLk61LHytNzx3IKmlsiCRMwLMq9Z90=;
 b=d7tCkXB+XrkKkPZtkf/s8sGEmn0jIc4Cxqcej4M9Tn/STnLch3Mf+EVVeNvWKfkgxAsknkNeuVd/5aPFm/wnQmbEqBeAOgwvOgsQNgtqwVDx3cC/DvvrKe14G38FMJOiq1CXONHLtiUaTQVMOty9JokF1fVtQTTOhv6CVl5zAeNjJEQPj1Hex35IJVJcHdy+gzwvsZNr8lsLLU6SbIHStfVd6E4El9biKdY4MHR6x1JpKO2MKySFqrHSza89k/Cj3jr1MsuWlztS5WN/OyRHag4pua7PGy91EmmEm0TC4CMoOMKZ7/QnHpgwo5ESigFg5LBQ5TBAUxQ9yvnXzJyLJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by SA0PR11MB4767.namprd11.prod.outlook.com (2603:10b6:806:97::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.42; Thu, 9 Apr
 2026 21:20:49 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::53c9:f6c2:ffa5:3cb5]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::53c9:f6c2:ffa5:3cb5%7]) with mapi id 15.20.9769.016; Thu, 9 Apr 2026
 21:20:49 +0000
Date: Thu, 9 Apr 2026 14:20:46 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <niranjana.vishwanathapura@intel.com>
Subject: Re: [PATCH 4/5] drm/xe/multi_queue: Use QUEUE_TIMESTAMP as job
 timestamp for multi-queue
Message-ID: <adgYLnHbYkLa52Gw@gsse-cloud1.jf.intel.com>
References: <20260409203714.1887402-7-umesh.nerlige.ramappa@intel.com>
 <20260409203714.1887402-11-umesh.nerlige.ramappa@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260409203714.1887402-11-umesh.nerlige.ramappa@intel.com>
X-ClientProxiedBy: BYAPR07CA0073.namprd07.prod.outlook.com
 (2603:10b6:a03:12b::14) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|SA0PR11MB4767:EE_
X-MS-Office365-Filtering-Correlation-Id: 585a35c8-3a93-421d-0ebb-08de967ddf1d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|56012099003|18002099003|22082099003; 
X-Microsoft-Antispam-Message-Info: dYEIHei7fNsdyP3QeNqRKbNufqmhQCSrxLxaE/IUKJyq34h83yQmd6l2jA71Nr2xQ1IP4VAkv23exhS3n1noO/MrmZmAy+aPo+TzxNm0kDDnRzQIBwXZ5ZmZg3hVDTnjwIHMWAZ4cKzfNbRBfrXupGC7Tq+SPWmBoZH8yoePJFA5rl4Nb8Z2BHHcFMKdL1xo+iNRyJZLyel6QQoWc10CZhISlM8eu9o8xWpPrNMrMEX3zB5DKYrpBuvIpPfjeQI8vuwusQB26tqBP+t6vm2nu6GXS6sdnK2B6Edh7vwZacv+MPcRRQQ7CC22HCmaDUe3dLLBy1+gHXmcj5t3KcW8V65tTmqTH8FAs3iXdKooOeMlLbP/b753zt6cjM9zAzzlTNx9c0VOeHd/+nV1jieT9F27uv8LaY7WFiEpXSAwoW2uy6p1HCEsuV1QtCYrEMoMcaulvh9WtTOpU7RlqB1j3ba6dnL1uFgk64ep7vf8PqR9gqotSG0I3QyQsmk2E1tPFChXXf/oWo8ZfQQOW21mKbu1Zg0yvwUeHKTXd8hHv8lS580AGw7udnh9SWY1sJvI8bOZZHlHyw+eBruNhZGLjP9r8YBbRXyxHi+E43oTa7/2gH2YlP5JOpVaGq1ie66KX6KvmR038UHPSyql1gNN7oXRxJurxlLiche+N7PZXkCPeQRvD7BCzFxBoag3HoweGwchJaZeHEwPW0KCdmcOl3VgTo3ZDNiXxC/ZouCqJyk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(56012099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?46PoubPswPQt4EUuiVmZdnSw+6ZOWusyLIknm6W2AKeANNlGaSRLTNhdTXvY?=
 =?us-ascii?Q?IXWrJSnC91w6xs8XFYOZurv6ck3Yu5jhRQbhZGkZDiN6LeQFis+jaAwWSwli?=
 =?us-ascii?Q?NgpdIQ3ybHbOF8RkyB2eGr3TgUs9DNEC3CDsihbC9rcteISBrqG91c0se8fW?=
 =?us-ascii?Q?TMIgu+psi9lHxf4ImqCRMmYG7HUCOMYopMDfk2H1MWo4at5T7Vp3d3MvtKd5?=
 =?us-ascii?Q?Fm7QQKyQpLt3qHIjRvSf4U5f81iKfA40JrOG5FxwJmThqu+kIRTenKR4MDf9?=
 =?us-ascii?Q?piAxktYYSL1gOtDROK//Gw6OZJa+i/P8GpZR9SNZKOwO5RmEL0JJOP12wg82?=
 =?us-ascii?Q?gmsw3PNC6AlnzQcY+Evz5bu8bk0BaZK0ZMG5GMWQD7T+dDFr7s89jKRxLk2r?=
 =?us-ascii?Q?DCIiXI0iC06NUoaDfFhNzOJr07+1Bmf7sTirYGB1Kzyy8bqcwyjAndmoCCka?=
 =?us-ascii?Q?I1VnCAMQ+DoxXXWZPEE4sZ8b4XyN0i6uGEWkM5OJetxwVwkUlKAMdPmyIrty?=
 =?us-ascii?Q?Lijx9Hp0m51r5stuohirzo67PjB1ntiAEc6Xo0hEU8wLILa5sywF9cKTzww0?=
 =?us-ascii?Q?idiHYmoGGL6/zK8ZVIpAvhWoGFW5osGm2ZHI0xLOnlTJSwDudin6BK7/uqZv?=
 =?us-ascii?Q?dkHcqoDe0206hJsZb+zm7mUiL3ubmkftrOJzGt9xugy9WeCk57aIOzdJhhb/?=
 =?us-ascii?Q?X2xS4Ruk7m4/1CZIvcWAG2a8cblck55CKX+G7hDbUeer9lE+e5E7hywjor74?=
 =?us-ascii?Q?5xA2WE0/yDmm2Dj72EZxV3ZX3go4O8FDoB7Fomxx225FZA2owI4xz0w9c8W9?=
 =?us-ascii?Q?OG9MS1HODs6QZIXfbQqgfbV6QTpa3Vy7OCgrf88RJFMNyfaqr5FIBzKP0CYa?=
 =?us-ascii?Q?Ru2qBvbUDxZWc6tykoBSYMFTyCIUt6NKliBUrqMVn/7hJeD7I13To1/xCRIM?=
 =?us-ascii?Q?Bf/lU8CPN4fSKfgy9s9joT1l2cr+6qreNScEsS8acAcXpiUkZIIY1VAgR2lb?=
 =?us-ascii?Q?0vRQvfNncaHUkAILOYFTp7ivjilAJsWg7rkytr21rIw7MjArMyFl/aEjUNO9?=
 =?us-ascii?Q?l+lbOJ3vQYV2x0QK09/ZC3NO5DgcmhvRI6nw6eQh4+vQhDPFiiyTvxdhJ9vC?=
 =?us-ascii?Q?3BV5Mx3nDnQfKTrqE3rryjOH13BHW2pT35JBMSLrP+rt6+Wz2tKC1Pf/CQPg?=
 =?us-ascii?Q?Ql+fN0s4zyi1hMdgYI9TvLAZfY1mfzzdC/WVWB2+VKMUuuf7PpJqB92wodUu?=
 =?us-ascii?Q?nDQ9JNCtpmPuIyCfTlbRj3tJAJJFfyKLv5BhAak/yUmjIQLsxEHb5awv1qC7?=
 =?us-ascii?Q?xX5TIBZOxLhvExIWNsc9kaWX/9aACJu2Mq42a0s75s3YFcf5WjCCJ3RWfe8z?=
 =?us-ascii?Q?krEt1lqm8cKCdcfAXprRwIX7kSQ1iRsiJ2bGOsYwGl/m3t6AhCVr/CtDdMH3?=
 =?us-ascii?Q?iHMkhnnmNO0Ke6vd0azQfrMiBO1UiX1oh3HJbUEYjHqFVj0OkpQiDrFqYOoP?=
 =?us-ascii?Q?dkFzb6J7Y9I3t14cVPX7pohrlZRggraM0ZKVsptStisB6qRpMcWOHRgK2pqm?=
 =?us-ascii?Q?IhpYgmcGDXULAiztpn9XnaxLak/MwqDrUhlFOas3lDE+dmUC3vaMDTIGoEeV?=
 =?us-ascii?Q?I5K7Tpqr0LF7AGhV3kp5YmeSbokXxsij9wIDvHJ5gwNr7x3CgqyLOarPMa7m?=
 =?us-ascii?Q?+IL4tgEmF1BtUfEX8Ra/7IhzpCMc/tZ+sn0SZwOmv7GuKndBagcFjCa0k6up?=
 =?us-ascii?Q?fOzQhHTBg/6WsVgG7e+9HbhZ6JT1VUs=3D?=
X-Exchange-RoutingPolicyChecked: qbgVZZ6OODlWf+GEgUfp5U2zPqUiTFCIH++L3L+VYufwrdHdwaoGKxk6CzHcxxtHN9fgvC5lycBmXnUDZL1ygw3c7+poPLVDfFh1I82fM47B45ielftjmJC3R/qBPLpGSrwvwHZsWgWWEU+/VKfye3nYuoWQSVlbzIRHa4nh9VbWufwvIbrhKJLP3WcnRjbbYQ8gN/VYj2hgLkf/83qv1yFMiqqMBNt/BPRgaX8MFfwE5bNVhSDOEhxb1jCJf1jHlKCW/WLqFAUFPmGTyGU8gbscriiUla4Ne72dqjQpqpq7WZe2H5bAyabc/ySxN22e9gPZs7Qcq7wW0/bMBc/9NQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 585a35c8-3a93-421d-0ebb-08de967ddf1d
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2026 21:20:49.3112 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: igcpDSzU9BQH8QVngsTc5XhvIXf5bvVj4k1ewvT22PnagOa/aJaEAs7cSdX+a+oxkKds+KcWrCDWzBzCZd31Jw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4767
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

On Thu, Apr 09, 2026 at 01:37:19PM -0700, Umesh Nerlige Ramappa wrote:
> Each queue in a multi queue group has a dedicated timestamp counter. Use
> this QUEUE TIMESTAMP register to capture the start timestamp for the
> job.
> 
> Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_ring_ops.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c b/drivers/gpu/drm/xe/xe_ring_ops.c
> index cfeb4fc7d217..0eea37c0b4b2 100644
> --- a/drivers/gpu/drm/xe/xe_ring_ops.c
> +++ b/drivers/gpu/drm/xe/xe_ring_ops.c
> @@ -269,8 +269,12 @@ static u32 get_ppgtt_flag(struct xe_sched_job *job)
>  static int emit_copy_timestamp(struct xe_device *xe, struct xe_lrc *lrc,
>  			       u32 *dw, int i)
>  {
> +	const struct xe_reg reg = lrc->multi_queue.valid ?
> +				   RING_QUEUE_TIMESTAMP(0) :
> +				   RING_CTX_TIMESTAMP(0);
> +
>  	dw[i++] = MI_STORE_REGISTER_MEM | MI_SRM_USE_GGTT | MI_SRM_ADD_CS_OFFSET;
> -	dw[i++] = RING_CTX_TIMESTAMP(0).addr;
> +	dw[i++] = reg.addr;
>  	dw[i++] = xe_lrc_ctx_job_timestamp_ggtt_addr(lrc);
>  	dw[i++] = 0;
>  
> @@ -281,7 +285,7 @@ static int emit_copy_timestamp(struct xe_device *xe, struct xe_lrc *lrc,
>  	if (IS_SRIOV_VF(xe)) {
>  		dw[i++] = MI_STORE_REGISTER_MEM | MI_SRM_USE_GGTT |
>  			MI_SRM_ADD_CS_OFFSET;
> -		dw[i++] = RING_CTX_TIMESTAMP(0).addr;
> +		dw[i++] = reg.addr;
>  		dw[i++] = xe_lrc_ctx_timestamp_ggtt_addr(lrc);
>  		dw[i++] = 0;
>  	}
> -- 
> 2.43.0
> 
