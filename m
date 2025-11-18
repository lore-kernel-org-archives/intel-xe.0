Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B03A2CEDDA4
	for <intel-xe@archiver.kernel.org>; Tue, 18 Nov 2025 16:56:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 741FB10E4FC;
	Tue, 18 Nov 2025 16:56:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nTxXzfvH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16CD810E4FC
 for <intel-xe@lists.freedesktop.org>; Tue, 18 Nov 2025 16:56:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763484964; x=1795020964;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=8ni2IZyl/4cpMliEO8eG9wUuyZ80Hr+4bk7g/bAaQOE=;
 b=nTxXzfvH41aNYc4Jjkxq7YQSdZwXrd10h2fqcLIjqMzUoq6A5dEoI0p3
 sshSq+Y4oaNpYDpIWopVN7OtHzvnQ4jCFaPNbNN2Qb7809bIvjnCe1jKf
 EuGNqnh8GhnxCw4yEF9wu0NdvLpPEUb4evO8WRzVfKXMwgxBz50wsBqrD
 60XCCX/UqH6cqUKjnDf58DUE//upqgXdjuAaDA5e3TlqHz/ft5NboIK90
 l/QjiaLcvZBzPedMq+FLwJ8JB2691h7uelLLXNPkOF8oRxuOdTBA6twEO
 +/QU0/0fXuT//4Y/O3aM5sojMUHR9D3ymRsGZxpddzrPpTY7v51LU+wA+ g==;
X-CSE-ConnectionGUID: gOZTs27BQripjss7szt5iQ==
X-CSE-MsgGUID: 9WacITdSQ86wW+jA4DLQGw==
X-IronPort-AV: E=McAfee;i="6800,10657,11617"; a="65452630"
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; d="scan'208";a="65452630"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2025 08:56:04 -0800
X-CSE-ConnectionGUID: jFq/zbsIT2ucx5omCpr9KA==
X-CSE-MsgGUID: Sjaj0+QUQpi4GFBmSPhy7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; d="scan'208";a="191587921"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2025 08:56:04 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 18 Nov 2025 08:56:03 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 18 Nov 2025 08:56:03 -0800
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.42) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 18 Nov 2025 08:56:03 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jz640ufV3D9qpLxmis/VynGfBs/pfgJ59L0UpacsGmBjPMSiYhnIFQUF2tccLzUQMOVD9WOyIxiJThAGpyUBi/I3Pq+V8HLLMcBM3FYgQsT7W0u8eIKv85Bv7jkzaJ8ggQrIKipXfuanpvPLA6LL41bHLiFtBfPNEbQGFhxpgVgI9I1ikuk7UFl2QzDYHJW1FfVHhCHxjZ/yLjZX0O+EFc6oEzvj0F1PyH+FE8s5EamZnFLaCwCC6u6RVpfU42zQjneX8b7w4ase18MHaKC4aGgBlr7g28CmlRx7vYEp/2W6MS1nkA0N8h/FX4Z1F4zKhcHXiRSa0PLinlUMK4E8tA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/P6oYR0oykgSP3596RpDZU2xeDbUfxEoZczCBZI6JAY=;
 b=cKTCCtBUeEPjK19ENCB7QlP6MCoN7pLYTjdv3/dMlh81WWvYZ/C0ABm+tJOEgBGvTAbPt2KH9zab3294bs95KKJDtShKNDlVajmQWetOK9BF7vbaB6O1V9XfqNwI7d9cPnvg+2ZtCq4h4pG5NBqc5RgumaHClUnBrm0z3VX7pXZUqStJ7FpL0Yk1SGiEvilRGjzhkpArcoOix4lNPDuJMPJDoj8uGHlyiWnH3oBsT5i0oCsO6mOa9D4G+VqcD43S0Xznui8fBYJbpXAv2AopEccajI+AS8JWrggH1AWiOTFsgOG5fQ8QPIeHSMWhkqaxx2RzflMCpnNl1XA73CoRrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CYYPR11MB8431.namprd11.prod.outlook.com (2603:10b6:930:c7::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.22; Tue, 18 Nov
 2025 16:56:00 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.9320.021; Tue, 18 Nov 2025
 16:56:00 +0000
Date: Tue, 18 Nov 2025 08:55:57 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>, Matthew Auld <matthew.auld@intel.com>
Subject: Re: [PATCH v3 2/2] drm/xe/vf: Shadow buffer management for CCS
 read/write operations
Message-ID: <aRylHQbFN3ZwmkFC@lstrano-desk.jf.intel.com>
References: <20251118120745.3460172-1-satyanarayana.k.v.p@intel.com>
 <20251118120745.3460172-3-satyanarayana.k.v.p@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251118120745.3460172-3-satyanarayana.k.v.p@intel.com>
X-ClientProxiedBy: MW4PR03CA0338.namprd03.prod.outlook.com
 (2603:10b6:303:dc::13) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CYYPR11MB8431:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a92fecc-1224-48bf-ad67-08de26c359a8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?i7DNgMAU9UTjR+dWmeDFW8GMePgCM45lA/LdA6X0WYfl8SbDDtlMVWyQ0zbC?=
 =?us-ascii?Q?Dx0jvSIzt3/4eP2I0ahum4Awi4gQ3Kv8LfcoK0/5O2KFQu4jKTR0L9uFgU7M?=
 =?us-ascii?Q?ZTATYeInO8PRDQNwR1IDRIigXWHFqT5Hzhx+afXtR5MwSAIDGTK3V9Ngbxsi?=
 =?us-ascii?Q?6VOqLgCWKUVGjacqGawLLsRDlvLuxenbJvux+WRD6SjHK9OpWoREPA+80BVW?=
 =?us-ascii?Q?3QEBcicghw6QipVHYluJteWhPj2BVtPP6hxtFAJZDFu0Jl59HN0Yn0IEvfzR?=
 =?us-ascii?Q?QirUnF8YUEgEJwMOQfmI2oCMnAFSy0256nOT7+89dtA8+M2L6tjRRf7o093w?=
 =?us-ascii?Q?lkVet+lLRjbOEVWROMRQfzPQkfYqFXoaQfG/gum2vt9adaagDd8dyx7tCqlY?=
 =?us-ascii?Q?MuoivW9fSGCUDyBsywvDi7l1IGb5ChXXwwqFELugJsNEvfX6iScx3+L2t9eR?=
 =?us-ascii?Q?qHH+R+GWkrqwU7i3pukJ7gASsTTAYprDVmaoeKot/RsKPRLnUeXRqbyu2aQF?=
 =?us-ascii?Q?33mmnKHFku4kCR7lg86ze73vHRABmJMaopP98U0sYheaBc7cQdp1rRvKHNZV?=
 =?us-ascii?Q?MYkqmKttx46FxK/kYCBYpZbChfvchS1UvYNhFc9t4Mj1yPt0DSXcHFUTCrKT?=
 =?us-ascii?Q?BaL8QHTzGVTgajoih54Ikun1s44k3E5yyT2tiWm2r7ySUIm4eMsT+dWCTT0X?=
 =?us-ascii?Q?t7Sw6QQQK53l+3KJbf0tFbpu3/d0CtHZGWmUCNjNcJIqciWnvYlTpMgVt2P0?=
 =?us-ascii?Q?7EuetMU3wg5VEk0LLjroBVobqPRa6vTgXBqasKT+vCq9bN8oQ0ZCoCB40ufQ?=
 =?us-ascii?Q?pYAJ3N2MlzRPYae5tJZxNCF1DzJxud0n5/311jlgcxPl1dZyxJzr5JlQFSYo?=
 =?us-ascii?Q?ahkiQLR+8ACVfiaMnVZH1RzPiHd56Q+hn6FrMWbIt1mRHdh8JGVlNgSYJSg0?=
 =?us-ascii?Q?97+bjS7mcnJTneATcjm7K/KYJc/TjYXmAzmhxv71Uftz71xTpO1SE5tG3TvJ?=
 =?us-ascii?Q?p8n3vyjtwZM2hE12q994gujr/luOTArWacvo+y79Ml7XG6VkKC2HLymzpHWO?=
 =?us-ascii?Q?EZCbfda1old2Cm3v1KW2ibAUAjtNBY8YnoyLEuIWKUerx/yg2b6BVEzmDAi9?=
 =?us-ascii?Q?QB6mtBA2wJa9GfevNMlFXyq6wEHTstm3RTQbyv9Yd0bJyHyMi76VOnkZL+/G?=
 =?us-ascii?Q?MZoNbA9e62fYUhlyBfGzI10HVFyOTUTuf1WUGltaX8RXMfS23pqHN1MppTRS?=
 =?us-ascii?Q?VDIegX4XKqyY5Yq4mgFaL7zG0OcvDU4rNXCL0r20OUyDHybHWkdLUjYCm7Wb?=
 =?us-ascii?Q?VKPK1GvTkEPl8Y/n57QHvWk4E7ZgtonKNkzKxZUyGNFpxHNQpvmjT3zsDzAr?=
 =?us-ascii?Q?Uh/EtViMd0Dqxaz75AbTkPVxZ2kAUVedDTNALkO+v9RRJ9NO5o4X8jXqgi+M?=
 =?us-ascii?Q?cuRsyA5D9o4bXni1Hgjsy289/BSZpVhg?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?GvV0RrvfQdQChNcxVKx9fxX5IaWgP9W80LSIuEid1tXDdXrsb/CjfWSWORlX?=
 =?us-ascii?Q?85+es8JqxiOzjb13ZGHLuAaV7B6ogEdlsqNlJO5T7F4oJmZNkfhzTMMwL6bo?=
 =?us-ascii?Q?dBq41rSqLbZK5hPNL+bgZE7vSGeLUwvrjHFrHfdOFQbkii+wwQ7bedrfk3nL?=
 =?us-ascii?Q?8tsrfRnZb/MIcKY/ECzlFxxc0gdW7RRIKKee14/XUFmrrrgjSZPV1chVy4Gc?=
 =?us-ascii?Q?3mlcsJOVrMrFaO/ZhNTcVLshKvs5nULB9mEX7XK7xWnQ1c3KI+Eff4dtVRls?=
 =?us-ascii?Q?TW28ZVTm0YlAcxLKvGaRKX+aPe0eGQihZ49mIUjqGUXCVXmgIoqQYyZxckuq?=
 =?us-ascii?Q?1opxfCwb1bpGponT/+EfSBF3fbqDPqbmkLH91Qwowds2FY4Qy1Ft2w1LT/RB?=
 =?us-ascii?Q?fqoZHqOfag7Nyxk2BE0K14Kims/+w0RqxFaY9m9gLULjGm/tOBJaqDEHBoZA?=
 =?us-ascii?Q?YZr+mRYJh8Thvp09Fp1ipKuLyZUeLoUOnaHUmtaUmGQl4/P/Ukgh3qGuD5Es?=
 =?us-ascii?Q?SxlPfwbTeupVdWHwmK1iLF5eCkpn/fj3X0lu8UMwMjJmC1ir3PmZCafK/dW7?=
 =?us-ascii?Q?OhmlqmkfGQ9682KNUwIokKfZbXJ9b90ClFV8R/QpTpeeCpENN1XGnT5VtoUr?=
 =?us-ascii?Q?+XmPQOnR4fx5m0qMUmOlppjr6mE8DXGu6JPJ7C146jATZqJc/zJXqntYuNN4?=
 =?us-ascii?Q?D7DAp2vs2/bqVToy06L71YDbzTxIbQ6COp4s/DGI5AsN9sEq/nd+OTxlmeg9?=
 =?us-ascii?Q?zIZLbNyHQK9JIBFH/CzYb164za4Frif1S7uCLXM/G13b+hTdHc+5HAA+tjyl?=
 =?us-ascii?Q?r32Uf9kPrdFdKzi8NvccVR54jMtKcd/lyCKq6M+XRyxXq4KAxHMox7MV96Ot?=
 =?us-ascii?Q?cYyZROhmI3KE4zIDiQqeucNjg0n2OpASOAeCc+TBP5MsdJzAPZ2EfpvXxksg?=
 =?us-ascii?Q?SX8tYkukA9cHfK6L04WQP2HWo18nexiqeuATSbJTZWLXDuU9UcNlbrZyUKkH?=
 =?us-ascii?Q?+Mb1RBaaMHmFAL2UU9D611iHokrbDIaXML2M62InC8q74CeJWcHB1L3+cwkV?=
 =?us-ascii?Q?0vY2dyAXiVCGbl9hWeSqYS1w1iPHkdekqO+x/Ab8disfmmbe0nFx9uG4Jw/B?=
 =?us-ascii?Q?cdAZ92EIkC26iD6u+JPt45epkyWPkvsfJ1+8N3Rew6IN960DnsbPeBN4/baZ?=
 =?us-ascii?Q?wJCQaI8KwlIz77kBedIC8+erHxCIkwSIN/Wy83umnkIgIl+XXbjYiNhONjYQ?=
 =?us-ascii?Q?4fg6/UPOXUnZ1VSCpiKUnG2fcYVlAiLImOcjiHGtdMeiNC9Kxr6dbgDvi81g?=
 =?us-ascii?Q?89PCFhtD/e1NQ3F1dayr1qUjhalkvvtwxCfjWWDhujr16TY0jBFco3hY0Fgx?=
 =?us-ascii?Q?fnU/ohHwD8pyPCTMRVtngUfU8mgahW3jtqqTk/Me+GO+SoyNN51TREcwDikz?=
 =?us-ascii?Q?0CQPVzwQJp0FUIO0CAkMyVVSgABtfAt+gnC5Fka4g9BY0DhW49QHV6gaaqSh?=
 =?us-ascii?Q?7fFQUFZ5iSDqpQa5SIAxUjMVBpVLpjjdgNDXgbTS0jl9oSHPDTME0IHoHZRD?=
 =?us-ascii?Q?1tEWF/yS+emT84ppsXtY5bNzU9ifROJutNVRSfvx1rl2gWfrvNf/GQqrdk/z?=
 =?us-ascii?Q?bQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a92fecc-1224-48bf-ad67-08de26c359a8
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2025 16:56:00.2125 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lQAlcxDkyBjHsI8FuLfO3dmGlMXSOvOiig7m0dJlHJfq2zlruTcfVXJ4DaHXedaVFxtimQXJXXbR9xupZJc2KA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR11MB8431
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

On Tue, Nov 18, 2025 at 12:07:45PM +0000, Satyanarayana K V P wrote:
> CCS copy command consist of 5-dword sequence. If vCPU halts during
> save/restore operations while these sequences are being programmed,
> incomplete writes can cause page faults during IGPU CCS metadata saving.
> 
> Use shadow buffer management to prevent partial write issues during CCS
> operations.
> 
> Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> Suggested-by: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Matthew Auld <matthew.auld@intel.com>
> 
> ---
> V2 -> V3:
> - Removed `goto` in xe_migrate_ccs_rw_copy() and returned error (Matt B).
> 
> V1 -> V2:
> - Updated xe_sa_bo_swap_guard_lock() to use guard(mutex) class (Michal W).
> - Moved xe_device_wmb() into xe_sriov_vf_ccs_rw_update_bb_addr() (Matt B).
> ---
>  drivers/gpu/drm/xe/xe_migrate.c      | 57 ++++++++++++++++++++++++++--
>  drivers/gpu/drm/xe/xe_migrate.h      |  3 ++
>  drivers/gpu/drm/xe/xe_sriov_vf_ccs.c | 19 ++++++++--
>  drivers/gpu/drm/xe/xe_sriov_vf_ccs.h |  1 +
>  4 files changed, 73 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> index 2184af413b91..f3b66b55acfb 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -34,6 +34,7 @@
>  #include "xe_res_cursor.h"
>  #include "xe_sa.h"
>  #include "xe_sched_job.h"
> +#include "xe_sriov_vf_ccs.h"
>  #include "xe_sync.h"
>  #include "xe_trace_bo.h"
>  #include "xe_validation.h"
> @@ -1103,12 +1104,16 @@ int xe_migrate_ccs_rw_copy(struct xe_tile *tile, struct xe_exec_queue *q,
>  	u32 batch_size, batch_size_allocated;
>  	struct xe_device *xe = gt_to_xe(gt);
>  	struct xe_res_cursor src_it, ccs_it;
> +	struct xe_sriov_vf_ccs_ctx *ctx;
> +	struct xe_sa_manager *bb_pool;
>  	u64 size = xe_bo_size(src_bo);
>  	struct xe_bb *bb = NULL;
>  	u64 src_L0, src_L0_ofs;
>  	u32 src_L0_pt;
>  	int err;
>  
> +	ctx = &xe->sriov.vf.ccs.contexts[read_write];
> +
>  	xe_res_first_sg(xe_bo_sg(src_bo), 0, size, &src_it);
>  
>  	xe_res_first_sg(xe_bo_sg(src_bo), xe_bo_ccs_pages_start(src_bo),
> @@ -1141,11 +1146,15 @@ int xe_migrate_ccs_rw_copy(struct xe_tile *tile, struct xe_exec_queue *q,
>  		size -= src_L0;
>  	}
>  
> +	bb_pool = ctx->mem.ccs_bb_pool;
> +	guard(mutex) (xe_sa_bo_swap_guard(bb_pool));
> +	xe_sa_bo_swap_shadow(bb_pool);
> +
>  	bb = xe_bb_ccs_new(gt, batch_size, read_write);
>  	if (IS_ERR(bb)) {
>  		drm_err(&xe->drm, "BB allocation failed.\n");
>  		err = PTR_ERR(bb);
> -		goto err_ret;
> +		return err;
>  	}
>  
>  	batch_size_allocated = batch_size;
> @@ -1194,10 +1203,52 @@ int xe_migrate_ccs_rw_copy(struct xe_tile *tile, struct xe_exec_queue *q,
>  	xe_assert(xe, (batch_size_allocated == bb->len));
>  	src_bo->bb_ccs[read_write] = bb;
>  
> +	xe_sriov_vf_ccs_rw_update_bb_addr(ctx);
> +	xe_sa_bo_sync_shadow(bb->bo);
>  	return 0;
> +}
>  
> -err_ret:
> -	return err;
> +/**
> + * xe_migrate_ccs_rw_copy_clear() - Clear the CCS read/write batch buffer
> + * content.
> + * @src_bo: The buffer object @src is currently bound to.
> + * @read_write : Creates BB commands for CCS read/write.
> + *
> + * Directly clearing the BB lacks atomicity and can lead to undefined
> + * behavior if the vCPU is halted mid-operation during the clearing
> + * process. To avoid this issue, we use a shadow buffer object approach.
> + *
> + * First swap the SA BO address with the shadow BO, perform the clearing
> + * operation on the BB, update the shadow BO in the ring buffer, then
> + * sync the shadow and the actual buffer to maintain consistency.
> + *
> + * Returns: None.
> + */
> +void xe_migrate_ccs_rw_copy_clear(struct xe_bo *src_bo,
> +				  enum xe_sriov_vf_ccs_rw_ctxs read_write)
> +{
> +	struct xe_bb *bb = src_bo->bb_ccs[read_write];
> +	struct xe_device *xe = xe_bo_device(src_bo);
> +	struct xe_sriov_vf_ccs_ctx *ctx;
> +	struct xe_sa_manager *bb_pool;
> +	u32 *cs;
> +
> +	xe_assert(xe, IS_SRIOV_VF(xe));
> +
> +	ctx = &xe->sriov.vf.ccs.contexts[read_write];
> +	bb_pool = ctx->mem.ccs_bb_pool;
> +
> +	guard(mutex) (xe_sa_bo_swap_guard(bb_pool));
> +	xe_sa_bo_swap_shadow(bb_pool);
> +
> +	cs = xe_sa_bo_cpu_addr(bb->bo);
> +	memset(cs, MI_NOOP, bb->len * sizeof(u32));
> +	xe_sriov_vf_ccs_rw_update_bb_addr(ctx);
> +
> +	xe_sa_bo_sync_shadow(bb->bo);
> +
> +	xe_bb_free(bb, NULL);
> +	src_bo->bb_ccs[read_write] = NULL;
>  }
>  
>  /**
> diff --git a/drivers/gpu/drm/xe/xe_migrate.h b/drivers/gpu/drm/xe/xe_migrate.h
> index 260e298e5dd7..464c05dde1ba 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.h
> +++ b/drivers/gpu/drm/xe/xe_migrate.h
> @@ -134,6 +134,9 @@ int xe_migrate_ccs_rw_copy(struct xe_tile *tile, struct xe_exec_queue *q,
>  			   struct xe_bo *src_bo,
>  			   enum xe_sriov_vf_ccs_rw_ctxs read_write);
>  
> +void xe_migrate_ccs_rw_copy_clear(struct xe_bo *src_bo,
> +				  enum xe_sriov_vf_ccs_rw_ctxs read_write);
> +
>  struct xe_lrc *xe_migrate_lrc(struct xe_migrate *migrate);
>  struct xe_exec_queue *xe_migrate_exec_queue(struct xe_migrate *migrate);
>  struct dma_fence *xe_migrate_vram_copy_chunk(struct xe_bo *vram_bo, u64 vram_offset,
> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
> index 9959d619addc..33f4238604e1 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
> +++ b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
> @@ -150,7 +150,8 @@ static int alloc_bb_pool(struct xe_tile *tile, struct xe_sriov_vf_ccs_ctx *ctx)
>  	xe_sriov_info(xe, "Allocating %s CCS BB pool size = %lldMB\n",
>  		      ctx->ctx_id ? "Restore" : "Save", bb_pool_size / SZ_1M);
>  
> -	sa_manager = xe_sa_bo_manager_init(tile, bb_pool_size, SZ_16);
> +	sa_manager = __xe_sa_bo_manager_init(tile, bb_pool_size, SZ_4K, SZ_16,
> +					     XE_SA_BO_MANAGER_FLAG_SHADOW);
>  
>  	if (IS_ERR(sa_manager)) {
>  		xe_sriov_err(xe, "Suballocator init failed with error: %pe\n",
> @@ -384,6 +385,18 @@ int xe_sriov_vf_ccs_init(struct xe_device *xe)
>  	return err;
>  }
>  
> +#define XE_SRIOV_VF_CCS_RW_BB_ADDR_OFFSET	(2 * sizeof(u32))
> +void xe_sriov_vf_ccs_rw_update_bb_addr(struct xe_sriov_vf_ccs_ctx *ctx)
> +{
> +	u64 addr = xe_sa_manager_gpu_addr(ctx->mem.ccs_bb_pool);
> +	struct xe_lrc *lrc = xe_exec_queue_lrc(ctx->mig_q);
> +	struct xe_device *xe = gt_to_xe(ctx->mig_q->gt);
> +
> +	xe_device_wmb(xe);
> +	xe_map_wr(xe, &lrc->bo->vmap, XE_SRIOV_VF_CCS_RW_BB_ADDR_OFFSET, u32, addr);
> +	xe_device_wmb(xe);
> +}
> +
>  /**
>   * xe_sriov_vf_ccs_attach_bo - Insert CCS read write commands in the BO.
>   * @bo: the &buffer object to which batch buffer commands will be added.
> @@ -444,9 +457,7 @@ int xe_sriov_vf_ccs_detach_bo(struct xe_bo *bo)
>  		if (!bb)
>  			continue;
>  
> -		memset(bb->cs, MI_NOOP, bb->len * sizeof(u32));
> -		xe_bb_free(bb, NULL);
> -		bo->bb_ccs[ctx_id] = NULL;
> +		xe_migrate_ccs_rw_copy_clear(bo, ctx_id);
>  	}
>  	return 0;
>  }
> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.h b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.h
> index f8ca6efce9ee..00e58b36c510 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.h
> +++ b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.h
> @@ -20,6 +20,7 @@ int xe_sriov_vf_ccs_detach_bo(struct xe_bo *bo);
>  int xe_sriov_vf_ccs_register_context(struct xe_device *xe);
>  void xe_sriov_vf_ccs_rebase(struct xe_device *xe);
>  void xe_sriov_vf_ccs_print(struct xe_device *xe, struct drm_printer *p);
> +void xe_sriov_vf_ccs_rw_update_bb_addr(struct xe_sriov_vf_ccs_ctx *ctx);
>  
>  static inline bool xe_sriov_vf_ccs_ready(struct xe_device *xe)
>  {
> -- 
> 2.43.0
> 
