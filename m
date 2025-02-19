Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF4DBC021AA
	for <intel-xe@archiver.kernel.org>; Wed, 19 Feb 2025 17:57:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7314310E36A;
	Wed, 19 Feb 2025 17:57:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kKIohGZn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7410F10E36A
 for <intel-xe@lists.freedesktop.org>; Wed, 19 Feb 2025 17:57:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739987850; x=1771523850;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=hVvybH6x3v7IQs40CmqC/ctUnMEFsIcIxva31Hp5cIs=;
 b=kKIohGZnBQ0AMGMk032KhyDFXKmQbZRtOAAWFkp6m/8d7Kac6heYjyX1
 ZH4CUOGib4PGYHT90HMf+U2wqWv3/Bv8dY9j3KyEku5mS+0mJAi/ZgYdu
 qT2pjdGttdZEcm05mNhdXalgx5JfhHerqiAnHxzbPxKkerxqdDXGBRZDQ
 QA3OarXr/x6r5bpjii8WMU8ZhxP/27BBQQotzyDtnQsWYOW5fOUysz91J
 dxahPeWunm5CjY+rVyX3J1JB9B0LCxqGHKi+GymXzFL2dDUDBBcBNzqxY
 AubM678L7Q6F655KjeqrwJWs9Y2bH8jhMIGgzohUKaQDai/iUX/XhSKq4 w==;
X-CSE-ConnectionGUID: k0o79r5gQRS8ZirBXcL4vg==
X-CSE-MsgGUID: 8z7k49X2Qjy1/RQeqgGxIQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11350"; a="39971136"
X-IronPort-AV: E=Sophos;i="6.13,299,1732608000"; d="scan'208";a="39971136"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2025 09:57:17 -0800
X-CSE-ConnectionGUID: mnTqVrgqQ3OEPphArjUZFw==
X-CSE-MsgGUID: R2Bj2rL9T+28aP0X9U3JMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,299,1732608000"; d="scan'208";a="114763012"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2025 09:57:15 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.1544.14; Wed, 19 Feb 2025 09:57:14 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Wed, 19 Feb 2025 09:57:14 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.174)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 19 Feb 2025 09:57:14 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EAUpCMyQGCFMktJmTc6TssGRUd7BpZnW1wj5XDuM+OCgr22Q4ZH9VdjEITr0GaJXLQ728yCrdrAWRDoihE7ip9kMsESqV6qaAWhxXtjDMTaUGZGF+NjyYYkq0FjUDUWGXid/uNYgD8R9sHGpXuGRqhShSKAB29dlkDVOsw2lA8VMjXA11g7kagWlYzSAXk+R5u//VDTUDY/lNcmI/IWKWiByftjOyGPkYIswT+xmM4g8K9Qzn2Nvrb7FqukGLid2k7nHpcqSaV6KbsZ+Kr/ctOH+kjbSHZPfYkn218EZhEs7DKU/k0IZQjoIKIqz263gXoXoQyP1yHUHW/R02HSLcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NxEylnX2OPq5GPbu820VTKW1O82JYQ7EFdZ1pqduAVc=;
 b=pZE6y6ghtn34N2OVb8kRwX3UReW1zzkH67AdhTabiXKOjN9BOZHLrGJOnZCd6BpzNTsOlSzKbJ/28Tz9qmV1jcgyVrK5RinZOxWU+EJEZOTzb+SKT1wYRF/7+TaC8mImVhbv8dfouC/PY0knJXrU1Sr8OvB3pJwkbO8CdNZbx9bPOCgZI7WJz8bpncEer2FC7Wd9o3oDPQXQgdzww+Ll531fFESCb06bbP1jd4GOqcbxc0VMYFTvhDQFEaaRK8pcBOS3yPWACmUqugnM1wlpWlGNyJQNZKOfadc7DB1q0d34OQxE/fHs0dI5X/4WyqGPkdr5rdrvhB6xm16fXJ/8gQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA1PR11MB7037.namprd11.prod.outlook.com (2603:10b6:806:2ba::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.17; Wed, 19 Feb
 2025 17:57:12 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.8445.017; Wed, 19 Feb 2025
 17:57:12 +0000
Date: Wed, 19 Feb 2025 09:58:14 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
CC: <intel-xe@lists.freedesktop.org>, <michal.wajdeczko@intel.com>
Subject: Re: [bug report] drm/xe: Introduce a new DRM driver for Intel GPUs
Message-ID: <Z7YbtkkHPT134nh6@lstrano-desk.jf.intel.com>
References: <5fd5a4b9-88ee-47f1-ac3e-32a20960c5b0@stanley.mountain>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <5fd5a4b9-88ee-47f1-ac3e-32a20960c5b0@stanley.mountain>
X-ClientProxiedBy: MW4PR04CA0215.namprd04.prod.outlook.com
 (2603:10b6:303:87::10) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA1PR11MB7037:EE_
X-MS-Office365-Filtering-Correlation-Id: 5819b981-733c-498c-5aca-08dd510ed61f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Fg8U66x3kaVdmfKWh4Ne1shPiu0qXsbx0Ewtw5hvlLTEPKGAlA7a/lYXLvfU?=
 =?us-ascii?Q?S+b6SkXfU981nwREzOjx0V85Zpie4o/DIgaJ9O2g97StuD5xuMKtKx5VVB78?=
 =?us-ascii?Q?1ZRLyCaeD/2/AH+yXfQKC4fG0SdfloxCP9WQyRV2ykHn/f+3KSbYu0Y4T6Ia?=
 =?us-ascii?Q?7q+IfknmJW8z5eeF0BmVN1da5c+y39HR8XKv7xxlgj63tyjlf4hDNP33VkIR?=
 =?us-ascii?Q?uz708EKTndxRl1RbncgROOul1LSjtIBfZ1Cutorr+5xuI1/MEXhnexdnzg1e?=
 =?us-ascii?Q?BXyGxfJN2sTyxpg8P9A0XFYlpjfWRnn4l+N8Ifz+OxiZ+C3S73Fb7u1Mixxa?=
 =?us-ascii?Q?wi5o+fbewhT5+Si2FPwlA61WngqttdmunGaTS/reIxKaYh+f8kDfQfdPwZm0?=
 =?us-ascii?Q?D+VYG+sIh1DRSV2FvSVJ84E9SWVM5JvvnJWGlgfLjlozRgF4Tdd6GOq7pHN4?=
 =?us-ascii?Q?cp76J1JoIl0IAvnj2QJXP6Yq8r/20E5qIiX4JLvBEeCIJeaNfOP+Geuh7OFD?=
 =?us-ascii?Q?rwtI6NbqmGmNRPv7bomQbJ5HRic3bKnQ80DakoyxY3uNoRofoU0ZDgtsT0G8?=
 =?us-ascii?Q?a7uAf6jH7/3BhAiO4+OJCTa4O9SKrfsSEar0x/hXymGxPwQ3eG8+R96usl0j?=
 =?us-ascii?Q?wsOD5jpXsTlnZxD5x/hUI+b+y8yuu3bVYnlRvM85GNAz/Fd3Z7ezByq0YNXC?=
 =?us-ascii?Q?76xgz46vf2yN/oP6WzG8VzFixrj5w9qTP5pctCj6aGA+Mypmshmg+ke8wCOy?=
 =?us-ascii?Q?spJvbiPYutQI+Vs8zNECx9pAWxSmZCDkRIYpvpyY4dTLXExw6id7b/CT586P?=
 =?us-ascii?Q?5/BQj5wZQAvzOL1E+ur+uMe1SeQwKIK2OkOl0b9nm49lILc3JZqPLhyO2T6x?=
 =?us-ascii?Q?JdH6m843aeQZI3qDiqZcDkj9Bh33k8/8glZuxry9Y7ig3HjLr8peFMaIHWh8?=
 =?us-ascii?Q?2Ziia8iWuwy0m5ic2QYR8ixH4iEHKYrU2xYbyvVGBFoRyK3cMkOtRJMHK+j8?=
 =?us-ascii?Q?PRd6NKgLTN4C7y5mklwiezfLUvyPOYa9fzC+vjRH42XFwXVUm75hmTQSndub?=
 =?us-ascii?Q?FntCBBLuXJo5rxe/oh2xPynjbp3cCkkh6XfGiZMegOv6xk2j8zD2kapuo3yI?=
 =?us-ascii?Q?ks+rJdD2rEhy5oc4AWh4n0HnhsHyeauZ74lDo8ba/x7f68dD5ANnw1nK2n51?=
 =?us-ascii?Q?3w+YqgoAEItMlm4tgc+QDqI6McV7Dc2GXFu6R/sbq8m9E4B7Pwd/7zb0Wc+b?=
 =?us-ascii?Q?l/OioNgaPb4clWDSKbNYCx2F3i2q3Z1QhSFH88XIKZODjH+adpynLaVqdoCp?=
 =?us-ascii?Q?Nx4vrZcMruU7ZNYytw3Fe+AugqPS/C+QC4Odq1iOmb+lwiwFjEGN00wX21LA?=
 =?us-ascii?Q?TLYxoSOOyF1UaZXlfVSSg3jsiVHQ?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?KpRRtDo+ZDjVm9btAXP1PIRWov/uiAaFunzM+kKci7fo1i0mKbaAWZsz5s3W?=
 =?us-ascii?Q?pbKWR1GMF0vT5Go3h9oyCdyd84aWz7gBTRYN7xrnPebzpqF5Y+Z0hZw07pZQ?=
 =?us-ascii?Q?ZRqrEBjmi+c6z7G/06HGPVtGVgTeTNuVArFcExFMBX6EYbrJx6dUJZVkuUCv?=
 =?us-ascii?Q?NamHO53uEiMxUwYkRALY4/MVv8dBg7CE2SUW8Y+Imo6CQNR4lH0e3pXjqt9z?=
 =?us-ascii?Q?LC5XRzAle/WO4WR+DfeWHwP3dRle4C4u3ZSEA6+1noNzwZUEy92LR7ot2CmF?=
 =?us-ascii?Q?X9Y9tQXGTVQnb4G0UYaOSl0Z3l2eeI9yI2JCiGcPpZjdNI2uxKEpxg6yPrtU?=
 =?us-ascii?Q?mSY9V9rwzlq0WrBSXdFqJdxOb0qK4gWmqhOMbEtOEkNKAAfkzOJV7TL8NMLh?=
 =?us-ascii?Q?bUkmiu6qXYAzfwYTirZnymELU2D158bH0gvx+dzBk+Y1Y6i6DJKcq7b5Omw6?=
 =?us-ascii?Q?0F7C5FXs4HNxUfSDGWvwUnufzRr7WABZYNpT0kZTiHVOCFGpOIaZa6b+aF6t?=
 =?us-ascii?Q?fsOTa9iP3n1v/nZmvsuVUT85WApRECmNnDNcmSQu61K3mV2Pv12VHNbM0iUz?=
 =?us-ascii?Q?Z6IsYh5BG8f9HK7YX5NpS3TNqHObxpKwLbP/SCdvuU/0MH8nVDvwhP/ShXVT?=
 =?us-ascii?Q?q0DjG75r5tUWrlDO2YwkdBckjkLzEMqoRmpqfo/ra7JUMZrMuHmvhn3wvXAD?=
 =?us-ascii?Q?jCeh9mE1iDzQeP8/cr1iMCiAX1jp+4SuknMPh1R8EbDDS0NnRiVe7qbiLH+m?=
 =?us-ascii?Q?70uhdgxNzrDjg3oGVoWGHWAkvh09AA5T5KwF0WTTW9iV9Uj+ST1BaDu/M8pO?=
 =?us-ascii?Q?xJo+FNJHd2StVXcaWRKdgz+lh+TBq5gfliRKTeWAXAoWEHqmr0lMH9PkHZi2?=
 =?us-ascii?Q?zn1HbNo/zMeEb3l+cNQILmqJQNDG4SfyIDfxwf4GO5bYQrsUhgPSs3szuthF?=
 =?us-ascii?Q?vmOmYQv7aW9zoJzT+1JMbFHjq74t+vIPb0EC3rP4Dr7AC94Iffhz7zlLq7pJ?=
 =?us-ascii?Q?XQD/OP9TUh/5bHhtOv3TzsAQ37rVuDw0WrQ3TCeiI2p8G8L9jxIrdDy79ltJ?=
 =?us-ascii?Q?CJzmTn7rwtALpupnkneEIL8dN0ZBBS4S2wm0tFRCplBHGpTBykWWjlWCXg8I?=
 =?us-ascii?Q?3wmvZoPocifobuyiJsVGtqg4z7rij6nAFd93hZY5b29XNnPYHbi28uSIrZwy?=
 =?us-ascii?Q?Cf/79ewDzcrjQ4Q49JRnODT5f7lkQDRzQjM+v6t/axz+IP7Amnq2pgRqLyQR?=
 =?us-ascii?Q?3eqxu6isEK1/dNynIdTQYmqy9lo/q3ngLWKWfsgwO94LfSlyTHtI6MqStE03?=
 =?us-ascii?Q?J9TYva9iQ+vacyJceKPCD8y9UnjCEOzzaFUmrI+yBAkJl1k83bvpxn8LmXiP?=
 =?us-ascii?Q?o9ar8kjfD99jWEYPvDgLeYbTpFYQSaDaQ8FleON2lw7xUk1+ybuczv0olHAN?=
 =?us-ascii?Q?PyPocXODzDCz+KPWZwTmhR610MU98z53nHsHRsOYZVlSUMqEV+/J5UMvOHe8?=
 =?us-ascii?Q?DNHPmn0awQY60CuHaSyFc9lyeb1zqDhx8XEyJH6YRfFWgNech+iTQ1kEWKJZ?=
 =?us-ascii?Q?9jGMEI+oTEBPtMYOmfykJwTyfn35FpGMBkxiaJHb+e76F+sp1PAdT/vIjMVB?=
 =?us-ascii?Q?kw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5819b981-733c-498c-5aca-08dd510ed61f
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2025 17:57:12.1641 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oQQXnN48bqjsw2mebWfvIFvw3//O5jEinPaJjfFZU/zlfsUiDqF0XUyn1ax2ABWskVx2JFFXlL2x5v4SZoKXJw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB7037
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

On Wed, Feb 19, 2025 at 12:29:13PM +0300, Dan Carpenter wrote:
> Hello Matthew Brost,
> 
> Commit dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel
> GPUs") from Mar 30, 2023 (linux-next), leads to the following Smatch
> static checker warning:
> 
> drivers/gpu/drm/xe/xe_guc.c:1241 xe_guc_suspend() warn: passing possitive error code '(-110),(-71),(-6),1-268435455' to 'ERR_PTR'
> drivers/gpu/drm/i915/gt/uc/intel_guc.c:698 intel_guc_suspend() warn: passing non-max range '1-268435455' to 'ERR_PTR'
> 
> drivers/gpu/drm/xe/xe_guc.c
>     1231 int xe_guc_suspend(struct xe_guc *guc)
>     1232 {
>     1233         struct xe_gt *gt = guc_to_gt(guc);
>     1234         u32 action[] = {
>     1235                 XE_GUC_ACTION_CLIENT_SOFT_RESET,
>     1236         };
>     1237         int ret;
>     1238 
>     1239         ret = xe_guc_mmio_send(guc, action, ARRAY_SIZE(action));
> 
> The xe_guc_mmio_send() function returns this:
> 
>   1388          /* Use data from the GuC response as our return value */
>   1389          return FIELD_GET(GUC_HXG_RESPONSE_MSG_0_DATA0, header);
> 
> All we know about it is that it's a positive number between 0-0xfffffff.
> 
>     1240         if (ret) {
> --> 1241                 xe_gt_err(gt, "GuC suspend failed: %pe\n", ERR_PTR(ret));
>                                                                             ^^^
> passing positives to ERR_PTR() is verboten.
> 

This looks like a problem. git blame shows this commit though:

12f95f9900c0 drm/xe/guc: Prefer GT oriented logs for GuC messages

Any reason this bug report is indicating 'Introduce a new DRM driver for Intel GPUs'?

Matt

>     1242                 return ret;
>     1243         }
>     1244 
>     1245         xe_guc_sanitize(guc);
>     1246         return 0;
>     1247 }
> 
> regards,
> dan carpenter
