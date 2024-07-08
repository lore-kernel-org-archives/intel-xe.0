Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0911C3271E
	for <intel-xe@archiver.kernel.org>; Mon,  8 Jul 2024 21:33:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA46310E3CF;
	Mon,  8 Jul 2024 21:33:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KJFqV6gv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F34310E41E
 for <intel-xe@lists.freedesktop.org>; Mon,  8 Jul 2024 21:33:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720474386; x=1752010386;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=HmYdCSGESF0S1LM8tPQfTdibnFwA+EVsPNDDw4rGr/c=;
 b=KJFqV6gv89BFsjPRmq9LIrd0HHU7ZsUU9LdqU+KLWF7HiJkWCs5Fp7K9
 m0aEY174LZ4XgIp2bSdT1B0t/+eq2sjYRV5mF51ootuuotjiKMUUeM6zz
 tunowedsnQkR9eVHET7AAraXb/7WcKjorFJ6TkgX/YNaS7A6N5qTjkgoq
 Vky49dXEHUNVMvsU2twl8YRysNO0KH6T76SGFXyYB4GJMoO6jC+s+RjKW
 onDOYoklPVQtss0ab9+IO2f9XSyNQc8UzO1D5zlh1JFfWEr05cULgNdUv
 rzk0EqsAu/Jps6VswuD16T+l+YUtlCPiSaE4dNRlWTKGEuk7mxyPNpbso w==;
X-CSE-ConnectionGUID: hdZpqJizRVKJwi7lTBNV7w==
X-CSE-MsgGUID: 4y/JCwjZQeqau47Cgt4fmg==
X-IronPort-AV: E=McAfee;i="6700,10204,11127"; a="17336329"
X-IronPort-AV: E=Sophos;i="6.09,193,1716274800"; d="scan'208";a="17336329"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2024 14:33:06 -0700
X-CSE-ConnectionGUID: AeyfvYTITdu0sMLg2zYbyg==
X-CSE-MsgGUID: YWiFAXdVSe+vApOuc4LxCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,193,1716274800"; d="scan'208";a="70843427"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Jul 2024 14:33:06 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 8 Jul 2024 14:33:05 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 8 Jul 2024 14:33:05 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.175)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 8 Jul 2024 14:33:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N/denCgvU8ISfhHCl3EWgFv6/II+4G7kNM5ujRwhDvRl3+WD1B7U5UuZqvZEBQE0BXyHCZaUZxHqarumaYe1s31HQQGezE1RBApnxvLpqa3wyJ7ivgKMJ0c8hKwXpYZPdLRoDsolj9pg+woKaFBajN23Dgedb09wATK20W5BCFT8F2IjIfQrYYioKUvcGxpNY4/0Opi0Cpk2oOIF8WnH3i8xPlrDfu96J2jfqNcf9dT6wVqhzdsD2XdPTuv+/oglECEK7wryNrtYWchL3nqZffEbqh3LGbslumpKMTRfdSlJ4DK5yVYzRkNCdgtpQkbf01SE4/9bRG89XKoJvGfi9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xVU1saS4u3Q+fQqABRTdnetgn9/Y69ipgF/nKl569yE=;
 b=Ui4Tp18sZar7BBq/uxZpf0+ebvbcw+nf2aXoWFGWoSLu+dnLb4VCUi814get2HGpbi+zEYy+XUAqp+9qRCWwDbgooZDeiHZsIGrRbkvIO6qHeFapZcjEOx9Jwpn0K5iBCAc2AJ06Lj74KNk+QZLKCXNs3ur4VbDOwQTcOzxDnyo4wHL+K6MHmCATAIfMj4uAwAGC3LFMAIuK5ZpCszATr5tcnKqJJQm/bdkL/YFMwX60f311MyX5CfCVF5R/WI35xTTHhHRX9Vr5HaBHbxQOP72cdNOyorfgPdWdx5LQeSQB8tQ+ouJb+4XD5lFEIUn19LHoc4MUDhlRtlX8xJ+KWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by SJ0PR11MB6695.namprd11.prod.outlook.com (2603:10b6:a03:44e::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.35; Mon, 8 Jul
 2024 21:33:01 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51%4]) with mapi id 15.20.7741.017; Mon, 8 Jul 2024
 21:33:00 +0000
Date: Mon, 8 Jul 2024 21:32:16 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <lucas.demarchi@intel.com>
Subject: Re: [PATCH 4/5] drm/xe: Take a ref to xe file when user creates a VM
Message-ID: <Zoxa4KMFC1Bifsoe@DUT025-TGLU.fm.intel.com>
References: <20240708202103.3347869-1-umesh.nerlige.ramappa@intel.com>
 <20240708202103.3347869-5-umesh.nerlige.ramappa@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240708202103.3347869-5-umesh.nerlige.ramappa@intel.com>
X-ClientProxiedBy: SJ0PR13CA0042.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::17) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|SJ0PR11MB6695:EE_
X-MS-Office365-Filtering-Correlation-Id: d66fc3ce-cf8c-4b86-bb29-08dc9f958a47
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?FuiizNCoNTPTDmwD7kctxEuVWxzqlpJAr2WBQAedZ/mOMN+oyUlhy6yZ+Uuj?=
 =?us-ascii?Q?bLT1d4EzcHqOAOUTSMvMqKD1BTyIidqUicG4fx5MdJTb/9IwiKLzPt5KYMYQ?=
 =?us-ascii?Q?QvjFhyca9VnGSqxhIRkSekU1O4sjGZ/RmWGNluPKQzIb1dqCSBHBIgdKhc4w?=
 =?us-ascii?Q?7HB2djmdkK/V3+zEq5Gk/DyLA9fs3r7WpAWizU2oBR1FFMzRBH9PSR0nYeRa?=
 =?us-ascii?Q?tpM8u4Qg38zrz2BYqLXUOTaLqYsqxT5HIHYE/guU3x4SchaEAxXjF5oN7fqT?=
 =?us-ascii?Q?iyBK0Ei709Thnek4yiSllv8n3aFL8DvUL484Jjde2HFWK2PEIiThyqj44vcO?=
 =?us-ascii?Q?PS7RohUG+2uT4K+CKvFqI0uSjAiG/3OTKKNIUGiGB5Zphv6oML0zgUakdqEs?=
 =?us-ascii?Q?2fchziAI8IPp9sPVLRS+3PvAhHmyKB11wGCu8VFAPs8jBp+Z+R9J+lmmnONZ?=
 =?us-ascii?Q?Q+5tm8E34Tto6TzBTrNlUHTD1/yn4URDAxQ4+z9FaILfTiHSr0uFn64gQAjZ?=
 =?us-ascii?Q?bfZKnr3enyZWTMK/pyDbkRKcjmYOWU6ajTP//D1ksSTqMQv7JmM2Z/qILJO1?=
 =?us-ascii?Q?Nj8dFzu827FsJUahuxxAxChQ4MOvPkKw0iYWZqI1n0i8E544Ri0iFPUAWRP3?=
 =?us-ascii?Q?x4JKA5Sn6iUMdpjAmrsnYSQ+GnV7CSYH3KQL0PuEA0OFwlyBwLVkSzXcK1OM?=
 =?us-ascii?Q?w1pYu7HbqDB579lf3SsKNDWYiGcvubuOiAlm576ef9bJvpV8HiXnqUPuAX5J?=
 =?us-ascii?Q?aiVzLqjHcODpV05s3h0QnqPbFx144P1n42Tajit7uPhWDVF3M7QivGVgrITD?=
 =?us-ascii?Q?jmwKlyqwXMq+hSwR6sQqfMp5tHzUr9zcUAClsBB9YtTFN+oCfR7ry42BXyHW?=
 =?us-ascii?Q?zVEeO4JB9yd1E/kTGwUBWUbkd127Jhe3z57ALWeW4FsAnxmECvtcpn7gnCMS?=
 =?us-ascii?Q?bBleILf4MXO9kH1k1Y8XwkbymK6OuyYVkzVr+5BWEgl/sa7qpZZPyFbSyrEo?=
 =?us-ascii?Q?3p8OKrWvLsozBkifUM5mK/5JZfPwo4hD7vP4+3sMHlYAvnq4m/JXYIh5kuhx?=
 =?us-ascii?Q?eAvI7ZO1uHbNxKUzJK8BjJdO3FWVgyf8EwNT4NCLsAmiW1V/ZFtyfdCMWESq?=
 =?us-ascii?Q?EqNvwX3Kk8UoM1xhoJkwrFoSjRn2A7hF9zKAmW4jZi+KPbN64VcMaPWtivB0?=
 =?us-ascii?Q?n6YuvQkRhW0Y8n9iIbWY8MDiuJ5WlfXfNb5ZNCBl3pBKc6Q70RDqG6MVOBok?=
 =?us-ascii?Q?b3wYLmMNkCWxYkyO+CcPt1chy03S7buhKzHlse5tyup8dZ++WXuxjPO/SVb/?=
 =?us-ascii?Q?U+kjoL9CK3tvTahXvAiNco550HScmF0MMDdpp1piivkdIg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?0tfiVJuLP9KD8MgHBmBlRgHJrlucSz1oxAdxjvPvAluKWlcaIbZjBEWorPPx?=
 =?us-ascii?Q?w3RZN7XlUOh33/nIHX+536K6UdeUE4haqE4XRtskR63GV8l3uVRnzoFrqXA7?=
 =?us-ascii?Q?vXaIibfg9Y+p090mMaGhnY9kmRX2KD2mCumb5n0jVbEW/QaAzxjtaVDjm5QO?=
 =?us-ascii?Q?rpGd9l4+teMwPjboUyFBzPUFwMBfCAHo+n+ywhVfEPJ5yGLhRcXle6FMAHY7?=
 =?us-ascii?Q?JB6STPHpvi9SnU7c/ANBmqNLIinxZoqgPzt0BejbKtkUGuOhRntNZNd7/gCy?=
 =?us-ascii?Q?K3Fxl6C9vlQSBB+NgtDJErR6U6a6pM6Eb8Keq6iMXbUuYrACVdhMG1E1ESxf?=
 =?us-ascii?Q?patqOi2o9gFMrdaiwtgBYq4kYHihU/ULGy8Ujfc7VntSZF4bNguRDH3pqbS1?=
 =?us-ascii?Q?XOpuNyzrwW/gGdEb0KtmLtJ7IjFc6y8G+1Qu93JfF48APhtemfAE/GYB9tZU?=
 =?us-ascii?Q?nporLUvdxVgcr4QGUIQDe2lN9r+miZ/zLavWpi//UFgXfCp6COFSGCNKi8qg?=
 =?us-ascii?Q?UcbG+LIOltXj61iULm3m7vd12ky0qLWTkz97E/tB710Git3EpHKYG6ikS2WZ?=
 =?us-ascii?Q?ouJHhmRfELToBIF1aFPuInK46o+3Df0obgXS9Tv3+HrXg85dQFKFVe+vwcta?=
 =?us-ascii?Q?gVwoFL/KSTBOpgjOQKkyUtALYaX+Toq5W7Vs+2ZNb6tmaXwYSkTVbKkXpsax?=
 =?us-ascii?Q?g2gzadlI2QT5QMTBfEiazOI3UiyjAahyilwDbFdVM8IQ+ghF6jgNTdQnfOP/?=
 =?us-ascii?Q?78aPv+AjVxdgb7Dh6fu7Kamzwj/aeTW6ZteoNWLYGKqthtzUMf4pG1ywSypT?=
 =?us-ascii?Q?d5JUQjqYdalllZIgmzqUC3BdYbUtBJlkNMCZ1O4td2edm9ZtllC6x5FMzGNQ?=
 =?us-ascii?Q?cogi7ufSEzCQ0QjJhYavRm34zeHwsFB77s+eGkBQdDN0bGW7QZKsZyu7+3Mq?=
 =?us-ascii?Q?dMPSF6F9pVBQMqXgFgeG2GRCdaKx1d3nS2QywXjVL4IusJux0/5bYvAvToRz?=
 =?us-ascii?Q?3w6dEYda5i1gamnSMHRT3cOjHiCSruZkBYTQcwT2XhsgnufF0RBBizdIXeVi?=
 =?us-ascii?Q?p9FTAMeqegytmR3bLaY7SlRZWzfCdUU6Qm6BBF9imJsA4zf/FVU2D9cgqwmQ?=
 =?us-ascii?Q?ij6xK8ztzpJkLo85x/dRuovUezO1CfVYYaX5/So/bYHoKqV6Sz9efA1xIO+x?=
 =?us-ascii?Q?y61Bu2UC4wXSM5PjMDyhmS5bCzmaaLZ03u9yqxIQFpcxi1YuNu4d2eMw+gmV?=
 =?us-ascii?Q?vsyWwFPMqpPEqhVUqNPv2hDxPV+I0bngdG/atRE7NJXviMM8xWh/JBqcoSKj?=
 =?us-ascii?Q?LdtamJ2vaMJ8uCtwNp/fox5pf7/uOR5xJL+B87ceGq0Qqspby0VW05dZGdq+?=
 =?us-ascii?Q?JEG4KfHD69L7wr+S7pOQqLy+RM+mVBR7QXd+YLKBEpoiP7tasPRtjlpzz4Cf?=
 =?us-ascii?Q?1Rk0h58zqKT/PaDz5lguKaLwp17nCtaaoYwzcIejFgIC18NQQAy5pSdO7qAg?=
 =?us-ascii?Q?hI7BaU9WgOfgd+suXQGQ/a7OFhD0oVKd3CjY//t+RuXAIipw+YHfHv7+FSO2?=
 =?us-ascii?Q?uKyhPggqViJpcKOjgrSyRgYJwkHMRuiMzysppLID6z9YFQt+ip3rRVsngM4c?=
 =?us-ascii?Q?Bg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d66fc3ce-cf8c-4b86-bb29-08dc9f958a47
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2024 21:33:00.0093 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qeRAftVODL4aC6NqSPTbN3lLjN9/mP20ZCD0WC+GylKgSs5wOXGZ5WYpOv49PAT5RJLDXAcx4GryhNHVAqtxUw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6695
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

On Mon, Jul 08, 2024 at 01:21:02PM -0700, Umesh Nerlige Ramappa wrote:
> Take a reference to xef when user creates the VM and put the reference
> when user destroys the VM.
> 

Oh you do take a ref in the VM. The idea is right idea but my comment
about xe_file_close calling xe_vm_close_and_put still stands. 

This patch LGTM to though, with that:
Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_vm.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 0c764647a552..67b4c2467b78 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -1611,6 +1611,9 @@ static void vm_destroy_work_func(struct work_struct *w)
>  		XE_WARN_ON(vm->pt_root[id]);
>  
>  	trace_xe_vm_free(vm);
> +
> +	if (vm->xef)
> +		xe_file_put(vm->xef);
>  	kfree(vm);
>  }
>  
> @@ -1926,7 +1929,7 @@ int xe_vm_create_ioctl(struct drm_device *dev, void *data,
>  	}
>  
>  	args->vm_id = id;
> -	vm->xef = xef;
> +	vm->xef = xe_file_get(xef);
>  
>  	/* Record BO memory for VM pagetable created against client */
>  	for_each_tile(tile, xe, id)
> -- 
> 2.38.1
> 
