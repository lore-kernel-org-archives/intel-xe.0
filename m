Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D99D2606A31A
	for <intel-xe@archiver.kernel.org>; Tue, 20 Oct 2026 16:27:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=PZ5xn5yj
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5C5910E4D3;
	Tue, 20 Oct 2026 16:27:48 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91B0210E4D3
 for <intel-xe@lists.freedesktop.org>; Tue, 20 Oct 2026 16:27:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792513663; x=1824049663;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=NiNP+vAMHu+USCXkIDqp+tJgLDLoXe9bkH7BSEFuxjo=;
 b=PZ5xn5yjb1MtfPMiXxmXstFz46fY6IZCJrSf5S0r9M3e0BMEUoLzhEKW
 Ex9X52hzMXLwnTkr/wfJgtz/GcBaKgykE6QCaR63tihhFKWXPeNL3UC1d
 OB0RzOikUGvP/oEewKcX+oILNWSZc4AIbBq3X6zAuon7VKoR/t2OlKZMa
 36UwL7KTLXjhJ5M43aZ3yoR+Fomue3ywxji8Y0Oxmec1JqXdDjRezieiS
 mdnUhJEihzbKZImRRh5VBg+kIIV2eUk5i5bfgKb/l3PeAqLvPTXBWGGuS
 757+m5FuhlfF0+B/8G9XKmkUCeXGHC6WFTrec2jHVdSnOJ1szUyCMgIwK w==;
X-CSE-ConnectionGUID: tg8SfzsGSW2x7YlLLU6gZQ==
X-CSE-MsgGUID: spM+DVIqTSubpfz/4XLVlQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11941"; a="1108769"
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="1108769"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2026 09:27:42 -0700
X-CSE-ConnectionGUID: BlmaRcxvTbmKXZMkRA4pCw==
X-CSE-MsgGUID: QD3xDSJ2R/2b2JJPao7YHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="2747615"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2026 09:27:42 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 20 Oct 2026 09:27:41 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Tue, 20 Oct 2026 09:27:41 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.43) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 20 Oct 2026 09:27:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V5Iq7pTQ1GW03iETjnAdUiD94pX/oyKM+v67oiwVIchjAFmvlUeQ/DVmvUOVsxhX7k2DoSsgxRAJop2AsR/RDDVG5G1zjDTAGoSkhNEVXhyWIftS6yBMDruxbkm20niA9Ig2clr7Y6i5YtDZYOV3v3L28ZJMi+Qx9BmoqVkUoK02xWymmVXAbQf/tUkJyxjzFnm3LcRJUKL4n3iIHXUluXLAIPq2vDgY+dM58mW27QBeJwckUADJU1BZy4f+WHbfh8klvfnncZQ4HsXqNvv18TRyEZwXuEgQOvvvK4uGGtQdtq1x8uppKGJWdglsjdmS+KI2i4vtApClsMGo0E3vPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YRxg06O1g7UNSGqkno7Pd2Jj0HSn1ivu9yuKQb6MQck=;
 b=bTShDEwOLuDg6pvaPNJGMetDxZ2SRgv13ChxevU0g9n5sTs8MShgGGLDoa5rNLRbxhRQw7m/ByhDlQWFfNds4YK7NjniRuCiSODamGDzqIqyamJS+YGmBCpRfMm4BmcWwpZ3SMhk18l/AxDci3BSSF/GHo3XCqLkgp3JI2kBUg9IiCah6nQp/E2SmbBcDcdDK8aCJdLLKyUiLo+72Ek4vb7N5YPv6Cgr2v+b5a2x9T688byFBNAk3LNHTqi6djHnSxsPlcjc5oDTj5bLvp1M1MyBZP8VQtz7LNdHVHnatES08yTdRkFi2m8Q9q7IhKcAMzl6nznsvpDNZ4dX9Hn0rQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB4787.namprd11.prod.outlook.com (2603:10b6:303:95::23)
 by PH8PR11MB6998.namprd11.prod.outlook.com (2603:10b6:510:222::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.14; Tue, 20 Oct
 2026 16:27:39 +0000
Received: from CO1PR11MB4787.namprd11.prod.outlook.com
 ([fe80::e7eb:a872:53d1:21fd]) by CO1PR11MB4787.namprd11.prod.outlook.com
 ([fe80::e7eb:a872:53d1:21fd%4]) with mapi id 15.21.0546.012; Tue, 20 Oct 2026
 16:27:39 +0000
Date: Tue, 20 Oct 2026 09:27:37 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Shuicheng Lin <shuicheng.lin@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe: Mark xe_vma_ops_alloc() noinline for error
 injection
Message-ID: <ateWecuALiJPYpnF@gsse-cloud1.jf.intel.com>
References: <20261007222426.1350374-1-shuicheng.lin@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20261007222426.1350374-1-shuicheng.lin@intel.com>
X-ClientProxiedBy: MW4PR03CA0284.namprd03.prod.outlook.com
 (2603:10b6:303:b5::19) To CO1PR11MB4787.namprd11.prod.outlook.com
 (2603:10b6:303:95::23)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4787:EE_|PH8PR11MB6998:EE_
X-MS-Office365-Filtering-Correlation-Id: fe3db2c9-9835-4acb-90da-08df2ec70eb4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|1800799024|366016|10067099003|18002099003|22082099003|11063799006|261009223027099003|56012099006;
X-Microsoft-Antispam-Message-Info: BS4F6GLcizS2kpHV2t2mNEJNaSnYf2RdSkIcKiLCtxM4lLd9jhXthlhjGTr9XwvA90U6gXgxGwrjeaTKaqXf4nvS+0dfqbuxl4ZCcLr/+f2ItVqCF48aovPAgGQxQgGLP352jCiYeDQW7rPQKBogPJuaJ3fkt7nVCGGRZT/8YCBZJTu9m2PjO1kds4jSEr1ibqS/9lp2/z7srx7InmDhtrr4YcflDajiZuQOh2mrdSqdGmnW2uME5mwhWwkJfmR3WbnbFIubMmTBbZeGESCENyNwhvca+9DS6iqEUC2wMf64rzD6WCkv7x8sLhJP25zItE9Ip7cUeKBRdDq7cG+jE+Jamjl7izyRd0eI2DbH5EGgMnh9a3V1wI+bMvrXPprsJEIetNunWO3LDXXNbXr4ajXNrJasGFpmyQW1oxWMtxsIHDGbXpV4J1sZmF/5FNGueYe+Rj0wWWF5w59++kqeS5qVurQZu4X7FNJL9tlFTzCHoWojYwKFgakrTYeCy5a4/dM3VqmIRvNqMN5pHlaJU27x6j1yzsDfJ/MmBM0iww8cG9LSUjOtvTL3jMTqVsf47Y2TQSrwL2P/tfBiFZKwLVf9rI7T+8NlSjT/PAW+KU7p9v5LR4LgDEJbOjWq9H7C
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB4787.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(10067099003)(18002099003)(22082099003)(11063799006)(261009223027099003)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?SClLpHQ/TzHQG+4oursRepWlBi96iCU1P/4amvdC0jeNSsX1TUBgD6P4+IY/?=
 =?us-ascii?Q?rRPfnfTd+TWEWjJsa/62YCnJRD5N+dDTREr9BgG9qnsuxBOyRPcvb2bqc0t+?=
 =?us-ascii?Q?bCPF+XUEsZkGQ34sSYgcOdmL3r76HrgUpx64RY/w6P+MphgIBgNw2rflUyr3?=
 =?us-ascii?Q?ZCiWgURIDy8+bBYvAbt6pXvxKOsWig1ZjhJHaMYuG3BcF7mqqqF//K08a1cK?=
 =?us-ascii?Q?KztW/twMUd1sWg7YMqBsUVqhZHxqjjzBScbFNqzl+57uJdghiirVwIy7L9iQ?=
 =?us-ascii?Q?LlKxhhgZplMxiCcnm8y2LPXfiGMYdSYJQLys+vLAd7NYIoDGwyqCTY6K6QTj?=
 =?us-ascii?Q?cVEVo5UmAXb/XIQv0VJ16ZftipNzL+fzJoUH7kK1E4Z3syaZ6twxDX8pzAFR?=
 =?us-ascii?Q?SJYAazjLX0N40UpQObJa6doGTT7NbdJ1pAfWmnS+SY44q6kO2AAjt6uMBNwk?=
 =?us-ascii?Q?AndsEk77jP9ql1SIRqUglNm96ekUd2nylli7EK6NJG4PB+Lq34+Bkkiobviu?=
 =?us-ascii?Q?rJblmw0GdcaHaxtAjs7KII/3oCMNc6cIlTGdapEk+52SrgD/TyerQJyCxO/w?=
 =?us-ascii?Q?ul2EqbavHwHDp53z6IIYZRy1cvPuDAI1dSplyBxb15/UlC/HCAJcuaBThw6O?=
 =?us-ascii?Q?X5NfXIv5vgFl4OU2+m1+qcDAUF0OHCLZ4UksJDoe91B6fHJ+O3HARJU2sOqh?=
 =?us-ascii?Q?/L23k/zizM2EAygX6KTanyBCj8oS4cg3Z3vY1V8VRTzsHNAZcj+3gxUsf6bp?=
 =?us-ascii?Q?2qrrrhJy5E5X1Jgr9PPgTGQ4PquL7VcbIuhIEPrU1Po28B8WSqwUw2Si8RH4?=
 =?us-ascii?Q?cBK5s78UpLvOVc9ZHqIwUmdPdm6KXCrBTp8o95i3/yA8wJ8M4IS2v+CV8xEu?=
 =?us-ascii?Q?fy4RX+0nBAHn5iU0eQycy1EsZqcisOulSrX/FFmDzMF+SSg63Ogevjhorc2r?=
 =?us-ascii?Q?vlBfObnVgZhVuBgQibOmZhdDi8J04fN9vPxlZF139JSBgeR2noXqh3vwl9Vg?=
 =?us-ascii?Q?tg/0NNRgGvtk84zp0Jy/Tdg4C7MdDBBkDADQurePcwDUrCz32sToUVz9OpZO?=
 =?us-ascii?Q?MARhH9VxlE7Yzv487qxrkP5I+kwaegIffsUPahIiQtYBrLH1eIUfbobDwi1Q?=
 =?us-ascii?Q?jBHl62Nxn97UVrVDGEAix58GNP1Vj+vNwKXeRn0MwvIRWkMLJpYnYiTL7UtR?=
 =?us-ascii?Q?nx6JJyfGr9b3f7HS8amHwRb5u9fw4sOUYHc/EuFvq8CC7vpQ74NuNRu71qe3?=
 =?us-ascii?Q?7pt5U6kJ+X4Oh34Mu0bmKHr+hmHvungPeZAHpXXfpfQf1AgK0lWvovSo9+wH?=
 =?us-ascii?Q?0rXHSm04MKbSEaT+RCPRPbJkoI4Kuk86oNathulgbHILNzLPFRFlSXg+Aedw?=
 =?us-ascii?Q?hb/hJn0bFaJhiRgO5CguvryWn0TtBGgnhKhFqad7A3BwXp1LKSDrWjVnmTtu?=
 =?us-ascii?Q?cKK2oT1UANB5BiwTlHksgMqqkYrwQ8fUVoSpHEiXBMN6PJFzl2VD+gR2nHkE?=
 =?us-ascii?Q?7XCbhJbpnh8DT1nGZmFLeCu+MPknN8Bfib5Yf5xYnZks3+2neb6s1h25qafd?=
 =?us-ascii?Q?wirNHIOSDBLzHNVwpi36IrMUpm2JSiPxFs4K7H9HU+Tz0BTeH8GsTSZxkAos?=
 =?us-ascii?Q?V3fuZd7n3n8l6QAy4twHwSZgVcbWE05flRVTgrMfbJ6KAztcF98RGXOW4igx?=
 =?us-ascii?Q?7j94PIrSdLf46H82Sq9AX1ehk7X5GZMI/Q6ZjITy2nuYSgj1TR/a9dhgx00F?=
 =?us-ascii?Q?a1ZsQMCz/w=3D=3D?=
X-Exchange-RoutingPolicyChecked: MOnNoM2MRSxtVt2Fx4yFoIH3JPn/K6gTCVp9Mfjk/cqXhUEWOeFdTPMguWjZie7YpRuP4ztHBMfQ3IvOAvWb3A0fK6Z85n1YE/jeknGtyZ4AIvjFNGzW6ncJyH7mLa+fNh8Y7XPxETWmxmCl+yLxytamqpmFCiFWYTpD1jCd4I8mXwv5BDJ7UQ+RzECLkIApgaSbJ72LBethf8VQ5XoQn5v3Pg44N/h/KTOJGWoRQf2JyZoD07MdwPrc7JHEfOsUCfaSWo5hvZWcM/ADpVBu1iFeSafRTKCQTs627kl4+wG2uC2gUEQtjQgoo8hB9/2ASmv84M5aUVxrWPLBqby2LQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: fe3db2c9-9835-4acb-90da-08df2ec70eb4
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4787.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2026 16:27:39.1381 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aL9Gkhke9/zf9duf1Rt2zEuY+KTMdH5Ys5bQ1lKbIsTTF07T29YOMrjkOLK3h8VLg4AiCSjk4sE6CZe0ax2MBQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6998
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Oct 07, 2026 at 10:24:26PM +0000, Shuicheng Lin wrote:
> Since xe_vma_ops_alloc() was reduced to a loop around
> xe_pt_job_ops_alloc(), the compiler inlines it into all of its
> callers, including xe_vm_bind_ioctl(). ALLOW_ERROR_INJECTION() only
> keeps an out-of-line copy of the function alive for the kprobe, so
> fail_function injection on xe_vma_ops_alloc is armed on a copy that is
> never called and the bind IOCTL succeeds.
> 
> This is seen with the nodebug kernel config used in CI, where
> igt@xe_fault_injection@vm-bind-fail-xe_vma_ops_alloc fails with:
> 
>   Failed assertion: simple_vm_bind(fd, vm) != 0
> 
> Mark xe_vma_ops_alloc() noinline so callers go through the injectable
> function.
> 
> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/work_items/9432
> Fixes: 0e33330f1238 ("drm/xe: Add struct xe_pt_job_ops")
> Cc: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> Assisted-by: LLM
> Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_vm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 761bc136145f..8e2110e11368 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -676,7 +676,7 @@ static void xe_vm_clear_fault_entries(struct xe_vm *vm)
>  	vm->faults.len = 0;
>  }
>  
> -static int xe_vma_ops_alloc(struct xe_vma_ops *vops, bool array_of_binds)
> +static noinline int xe_vma_ops_alloc(struct xe_vma_ops *vops, bool array_of_binds)
>  {
>  	int i;
>  
> -- 
> 2.43.0
> 
