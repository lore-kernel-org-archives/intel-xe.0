Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FD4FCCF9F8
	for <intel-xe@archiver.kernel.org>; Fri,  7 Nov 2025 18:18:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E849D10EB55;
	Fri,  7 Nov 2025 18:18:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jJBjvc/m";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92C0B10EB55
 for <intel-xe@lists.freedesktop.org>; Fri,  7 Nov 2025 18:18:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762539512; x=1794075512;
 h=date:from:to:subject:message-id:references:in-reply-to:
 mime-version; bh=dAsD4l8vJ0CU+xcAuyFT3H5I7iryByuEFYl9v6KVWhA=;
 b=jJBjvc/m0An1baL6grUTQqxAmvWlwuigoxQ6eHgwrV5gF/pxFIQun47c
 03LeHfdNo72OI450eSCQPyebR4nSPcLGPAu+vKX7REzWiBvp/bRbLJr02
 wv0Dsy5n2BF8xqEZDu49+CO/Ott54qeRzRe9OWygwQ45zb0daanvWSsMs
 qplRUlAzFYevdJ/px3FfwbdKpTIUT+122k8OwZJrXSYoMZW5KxHYkdAMD
 R7rnUxz3cFkPIK8cpGkzfUEd0jZjzTFD2zgHl2ahWkqwWMKKgGUq1fKj6
 EX9j0zmAkMhTaRQdX4SYLXls0hcLbYFsyGUKFwbBGYUfV8bfDS2zuiCqy g==;
X-CSE-ConnectionGUID: 12JLoz5nSR2V1H7tx6yH5Q==
X-CSE-MsgGUID: 5aWZcukeSemdlP9ewE26Og==
X-IronPort-AV: E=McAfee;i="6800,10657,11606"; a="64608744"
X-IronPort-AV: E=Sophos;i="6.19,287,1754982000"; d="scan'208";a="64608744"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2025 10:18:31 -0800
X-CSE-ConnectionGUID: n0m04HLMR9uCP/fKPqQJDA==
X-CSE-MsgGUID: L8yV7dzsT1KBVy8YwQW3fw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,287,1754982000"; d="scan'208";a="218840285"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2025 10:18:31 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 7 Nov 2025 10:18:30 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 7 Nov 2025 10:18:30 -0800
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.30) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 7 Nov 2025 10:18:30 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OTsvMRzZeIbHoGihUo8aN98Z2h68oOkrAiqNlWYZ7ECKHXr4kSQVAmTQoKQSWygg2xonI+tSW/Wn3nDHHWQthWNFRP0ah27EF3ADXSAiGnWiYZIQEG1jvzP1XvgffYsL9q+9Sl5Z2OPhDIhThRjQ0bzZWGrC6NSzPmznjDW7QjsV3Rz78Da00BG276fFMAJTsRRB+ktrCoTqoAKLLhromEHkaWbqRD9kzutniXpCXSImiltSVscA1454wmbeAojwbnh4KRHfgdqCJcdM9b3neZgTiT+DHAp04zg+n3egWXvboU8VBir3f5sM2FDYPiMv8INuGmbr0W2YTLKVPquz1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XnT/FZDzHAXW8QNhhWwVWEFcR3A79o/uBm3dFpqpEJ8=;
 b=BgoHkUoD5ddcHXVJuivzs4aKGICr51uUSxoqIugLiZlAuN2mbQKzP9Y+dF5le7h29RUqwBSzZvGr41rVDabYWLx9z49FnLazocPKX0yIgFqeutfULzfFg2ZDhlLauCQ1TRICi02W7jGEsxe7JZqUHIsKRnSDNzcucteu+2RocFttlMkugCYrbZZzq0imYSr/rRxxpM0YTADY5dE8XLnYLd7kdPrRn0lyEWpomBImTh5vqbGLQwbovYs28xTh0aTx+qd9P3G1ZlS48AzTX7NTC1m0fQYIPkj9QA5H3OM7L//0TU9vR5JpqfT0CS1q7rHxMubKQTr+Qt1w/RxnU99/QQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by CY8PR11MB7171.namprd11.prod.outlook.com (2603:10b6:930:92::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.12; Fri, 7 Nov
 2025 18:18:27 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%4]) with mapi id 15.20.9298.010; Fri, 7 Nov 2025
 18:18:27 +0000
Date: Fri, 7 Nov 2025 10:18:24 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 00/33] Scope-based forcewake and runtime PM
Message-ID: <20251107181824.GH3905809@mdroper-desk1.amr.corp.intel.com>
References: <20251107181315.631642-35-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251107181315.631642-35-matthew.d.roper@intel.com>
X-ClientProxiedBy: SJ0PR05CA0026.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::31) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|CY8PR11MB7171:EE_
X-MS-Office365-Filtering-Correlation-Id: efbf7ea9-c42b-44ae-f09b-08de1e2a0bdd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ZOBOcTPy+jxFYIREm/Dsw4JHSUHzQn9ywBCJdDq7f50awExNPDhncFq1g0Cw?=
 =?us-ascii?Q?12aqGnqnL1Mr8I9nJhro+X6OPUBOLLlL57VlMIMqG4i2yft3wc6wfskn/I1D?=
 =?us-ascii?Q?w69ygN69DB8TTUxcouGh8txhQmThdxIc3Jkp1mkSiVlcApZtprgEI8a4jbjR?=
 =?us-ascii?Q?kryHZ77M4Ax36CFv/Isqy76H/dfAaAAFYApijYv1elPC1jg56BAMQ2Fzig+w?=
 =?us-ascii?Q?yHBT/nXu2Oj2NnJjc5AQ3QVNIXbhd/kYfq6U4/i71avfdYR+rN41YNVPUxH1?=
 =?us-ascii?Q?ryBYjU+RYHHPnFdMTw2in3Q0EmR8yH/chMIrZnmQWTRnjnaQft6IFO2xUsoD?=
 =?us-ascii?Q?TJrIGwSn+PxU+7UDWRVpsqN+EEikPdYNlFaW8vKd0Y97MZeHjXmCfGcxqKv0?=
 =?us-ascii?Q?WGC3VbSW8Ac926cw3nWD79Lq0hQ8OiYgR880R9jg53b22kqY1/Nzln5GVHTD?=
 =?us-ascii?Q?BEWJ+5gc+L4BTekuorBDRmHe6P5+Y7abVfjYiCiIipxAG9n0DzPLdENuQ6/i?=
 =?us-ascii?Q?8NOgub500P4FZ/uAwWprm6tl6wpT8RWHa322MHWjwWRB1U4JfyegFECKAbg2?=
 =?us-ascii?Q?xLOTqfeZidkwbA9DCiy57uPD0fes6cYzB37lUT2f/NoT1Rf9CaJ1QjbckTuJ?=
 =?us-ascii?Q?mMV72UE2RFcAPwzioKbwKUqfhkY2XFa6C9c99eCwhlomDhD1kDqJ5/roqEMv?=
 =?us-ascii?Q?MeOFuTtE6tMgv15vynOCdYaJaN19RBDYzSbUs58lTaXyk0DzrRWFCHLZqvyh?=
 =?us-ascii?Q?1hU9Edj+/nPPGMOt6hhxih9n25k6iMebbzf9ti92rrf9TiL5TK28DaBkYsMK?=
 =?us-ascii?Q?FMu3B6pU5Hzp4gF0fPjMPTr8c1L0Lv1lHdGU1iKa2r9sZxnbmlAF4nl6MGXB?=
 =?us-ascii?Q?VtaHvXbyY2wXst59byLnR36Uhe2MdQuRWasYKVL7lEBx3r5Iki7PZ7Qff6Cx?=
 =?us-ascii?Q?be3JFj8qY0KAcrA2TZ54pg6PKEfjuTDVrZVn3emMULuPMwqjE2kUBI2xw/FS?=
 =?us-ascii?Q?ch2Rozte6Cq0e3l7MV6oCItBdqKt0K/5DXrN/G5TPlvwlNB8CA0uqfqXSUZu?=
 =?us-ascii?Q?busSdYr9LjckBJk6LVh+eYAND2obpDlwsgLww9vXrb7IjLtnd6yAStyvd+8S?=
 =?us-ascii?Q?TnE2A/Ig7fwx4zVksdjZ3mUz7e157qltmOjA/dKw1RNAfdecs4X9VnzKEbUt?=
 =?us-ascii?Q?AmnVTx3BgTH6d6vxa6QP5WVRJhqH4yfPwsuTtXGmjv7x0fGzJBGFJrg7omho?=
 =?us-ascii?Q?3wbiQGFEUka8vy8aIZM3ER6+SfEfLAQ6Ft2oYEAEqhjbnBK9/pdxjwklgocD?=
 =?us-ascii?Q?K9AGIOT2975ZT/izAXg+FLvZW2uOgkdvOtwgE2W6AiugQrcGo+VrZG+pvkA6?=
 =?us-ascii?Q?8yHZJp0Lp4i2aEFPzIrNwPyRpuAtNMHStnr6NNmiOg+gqlJ52qfMg8IJQ8hD?=
 =?us-ascii?Q?ZtvIP20WNcq8dHAL8ITohthAdXII1WnDUqs2c2LDp/IdC4H657VMqw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?NFyFOkf3v309aJ8mANB2sz8fAAwgDCFgCpBg8cSD1PjVi9x6gR+YhOtIYHJ/?=
 =?us-ascii?Q?lfN+Xl6RFmiBu7Il93vOOcUWv+qGnci8clD/DAY0koK2P6sMl3LcP+IPq6l8?=
 =?us-ascii?Q?pwtnbpc7dU6Bi7NRsWNjQXBd3Spjx/N6pryNjURz1d1ahvj+7j9xlF4PEx3L?=
 =?us-ascii?Q?Vfwl13B9AKd5wba+BOkXUSgcf5y1BPAouQgXXpe2r7hjJomzn+LdjGrq5pZb?=
 =?us-ascii?Q?KqDQsBSH92HXxAclI1SSObp9b7UBpnvXCBAmjZ4hoFEh2s9+PncaBGpISYGF?=
 =?us-ascii?Q?4HzxdLd5+m8Qoal88hDAxG7oj6BYmXBqSDPELwpXYVPJEcYoHdBjkiDCvfOr?=
 =?us-ascii?Q?1bvaVKSKQprSg6VN4cEc8O+ok8X7WbW2Ww+uTkd2a0w/VxcEROhpcVI6OxaN?=
 =?us-ascii?Q?jG0Jz3sfqTvv5dqc9dvIJE++LGeCd3XT/H5ww0kIja+zM1ezLRXbkSJXgS16?=
 =?us-ascii?Q?FLZx9LVx4Y7NXuYlIHigZEltN790vpn3Z9amvv2+3YZGQL3oHC0Nq8YRzTeM?=
 =?us-ascii?Q?rBBfJq/C2NguX2ymok4gmjGp0GAJ+RNUnI9YDh/USpCA8VInS2yDX2SpdSJo?=
 =?us-ascii?Q?lr4JhoNuRW+LtpxsqmhL/Rbt/YVE3QMkSXs2zcZeEzP7W5IDjCp1lHxpqir4?=
 =?us-ascii?Q?koxNP7PO2m6yNYSkImq81CxOPRfRci+VEy89gWCYi+X04rYlHbXyYd5KN5PF?=
 =?us-ascii?Q?TTuaq7HAj75+OpSsuLyFCJERScxKbheQmyMM3+HUnUfBFbXzvmmL5cfpEc4y?=
 =?us-ascii?Q?xxthkrQ72zzhp9WR8igLI2zMG+ZFGnfUHItv4FEXd5FSRzYjUVrHe/HcYuDc?=
 =?us-ascii?Q?aSaGOibLH4PNjqr/P/ntE/PQw6Ba3M39U3TarfyYZm+kCM7uol4VEVubFhMY?=
 =?us-ascii?Q?9uUj2IcxAVQ+kyrBQkDrDs/l2nPpSJgpTYtFqnyF3TEyN8vDO4ohvvBwL7RJ?=
 =?us-ascii?Q?RLRMfcebI4VtD/xO2Xba9VsgSxPYcgnqUX6pSQ+26zEUr/f3BHvQKQ1BP8uH?=
 =?us-ascii?Q?ffOb2leV384YtrRH2GHEsOr61NMql4AZ9EpiTnOk1axhtUowvanU4FTmwEM7?=
 =?us-ascii?Q?WExD/GkfAPLB8mCzY/DomFAs5Z+cYQgIb80AaCIEzQyPHrPLlNa78m4dhyYu?=
 =?us-ascii?Q?tYxRNy8ePx66pPK+yl6hHBcA3I8c9e4H9dSlOV8yvLQNVp0KiaiIiqTjx3MZ?=
 =?us-ascii?Q?oFRIbQ7GRrzfsRQVs3F75PCSbMQZxCcwhuWdIesu68j+DyrPdRMVmhfrOzbH?=
 =?us-ascii?Q?8bciH86BgcNohemjxEqOFHIqS201jBT4MIn1KU26q8ZOsdXXZbuW0rm6t1ax?=
 =?us-ascii?Q?/JQAEFSXBHdNAfZt4tJX00w8TmSAteApH72fI4nikHLyc6mZ8BMo/wTrDzki?=
 =?us-ascii?Q?Q0SWt4xPwhEFptEBUCxfWn9k5e1G04PrcSSF7O0WbpTK4q3PTbie4H3QDNvP?=
 =?us-ascii?Q?17w3xLNqApnrpKyjTIswvClf5+oef3Ng1yR5LL62wKP7z54Hm3dyZ9jK4PQd?=
 =?us-ascii?Q?XrttrMbLUlIfU2jmfwlcR9KklCOQNjJRMsNXxSNfsOUDDFHq4O5jiaGgN2z9?=
 =?us-ascii?Q?kZ2qM1K0Vnh7tIahL/kVjn+ISD0t5y2PfUE7GEjRICsCDfR1w4sC64NxHwlh?=
 =?us-ascii?Q?iA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: efbf7ea9-c42b-44ae-f09b-08de1e2a0bdd
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2025 18:18:27.1004 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yh2+C6DT+c4ott50aVvHAdY0OWI+1mrcvyjtHh7DI3qlnQzxmCSf6aV0FJ+BxeTwZjkEmGOThA4LesENlL4iZDUDDN0ShICH1TbsAhl7pvY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7171
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

On Fri, Nov 07, 2025 at 10:13:16AM -0800, Matt Roper wrote:
> Forcewake and runtime PM both follow reference-counted get/put models;
> when used in functions that can encounter errors and return early, it's
> easy for developers to make mistakes and fail to drop a reference on all
> of the error paths.  Cleanup of these reference counts is often
> addressed by goto-based error handling which is somewhat ugly and
> subject to its own set of mistakes once we accumulate too many error
> labels in a function.
> 
> Scope-based cleanup ([1][2]) has been gaining increasing popularity in
> the Linux kernel for cleaning up various kinds of resources in a more
> automated way when code has lots of error paths and early exits.  Let's
> add scope-based cleanup for both forcewake and runtime PM, based on the
> mechanisms provided in include/linux/cleanup.h.  Scope-based cleanup
> allows cleanup destructors to be executed automatically when the current
> scope is exited by any means (end of block, return, break, etc.).
> 
> For xe_runtime_pm_{get,put} pairs that were grabbed and released within
> a single function or block, the preferred replacement is now just
> 
>         guard(xe_pm_runtime_noresume)(xe);
> 
> which will take care of releasing the runtime PM reference
> automatically.  scoped_guard() can be used instead if the reference
> should only be held over part of the block.  There are also guard
> variants added for xe_pm_runtime_noresume and xe_pm_runtime_ioctl that
> allow replacement of those alternate functions as well.
> 
> Unlike runtime PM, where all reference tracking is done within the
> object parameter itself, forcewake is currently a model where get
> operations return a cookie that needs to be passed back to put
> operations.  That necessitates a slightly different type of cleanup
> helper (CLASS instead of guard), although the underlying mechanisms are
> the same.  For forcewake that is grabbed and released within a single
> function or block, the preferred form is now:
> 
>         CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt), XE_FW_GT);
> 
> which, like the runtime PM equivalent, will cause the forcewake
> reference to be dropped automatically.  If forcewake needs to be held
> over only a subset of the current block,
> 
>         xe_with_force_wake(fw_ref, gt_to_fw(gt), XE_FW_GT) { ... }
> 
> can be used in the same way scoped_guard() is used for runtime PM.
> 
> The first few patches in this series make some general cleanups and
> restructuring of the existing force wake code.  Then the new guards and
> classes for runtime PM and forcewake are defined.  Finally, most of the
> existing runtime PM and forcewake usage in the driver is converted to
> the scope-based form in the remainder of the series.  Some of the
> conversions eliminate goto-based cleanup models and/or significantly
> simplify the code.  Other conversions don't significantly simplify the
> code (aside from a slight reduction in line count), but are still useful
> for consistency across our codebase.
> 
> An advantage of doing the conversion everywhere possible, not just the
> places where it noticeably simplifies the code, is that it helps
> highlight the remaining get/put usage as special cases where wake
> references follow more complicated lifetimes (e.g., obtained in one
> function and released in a different one, often tied to some other type
> of resource or operation).  With fewer direct get/put calls overall, its
> easier to identify the ones that remain as special cases and make sure
> they truly are paired up properly.
> 
> There's other areas where scope-based cleanup could potentially be
> applied in the future (e.g., mutex locks, bo locking, etc.), but this
> series does not try to address those, even in places where those
> resources are also part of the same error handling cleanup paths as
> forcewake and runtime PM.  We can potentially think about converting
> other types of resources to scope-based cleanup down the road if it
> winds up working well here for forcewake and PM.
> 
> 
> References:
>  [1] https://www.kernel.org/doc/html/next/core-api/cleanup.html
>  [2] https://lwn.net/Articles/934679/
> 
> 
> Matt Roper (33):
>   drm/xe/forcewake: Improve kerneldoc
>   drm/xe/eustall: Store forcewake reference in stream structure
>   drm/xe/oa: Store forcewake reference in stream structure
>   drm/xe/forcewake: Create dedicated type for forcewake references
>   squash! drm/xe/forcewake: Create dedicated type for forcewake
>     references
>   squash! squash! drm/xe/forcewake: Create dedicated type for forcewake
>     references

One thing I forgot to mention in the cover letter...patches 4-6 should
be squashed together before merging.  But since patch #5 is generated by
Coccinelle from smpl rule, I wanted to keep those changes separate for
ease of review and to make it clear what was a human change vs an
automated change.


Matt

>   drm/xe/forcewake: Add scope-based cleanup for forcewake
>   drm/xe/pm: Add scope-based cleanup helper for runtime PM
>   drm/xe/gt: Use scope-based cleanup
>   drm/xe/gt_idle: Use scope-based cleanup
>   drm/xe/guc: Use scope-based cleanup
>   drm/xe/guc_pc: Use scope-based cleanup
>   drm/xe/mocs: Use scope-based cleanup
>   drm/xe/pat: Use scope-based forcewake
>   drm/xe/pxp: Use scope-based cleanup
>   drm/xe/gsc: Use scope-based cleanup
>   drm/xe/device: Use scope-based cleanup
>   drm/xe/devcoredump: Use scope-based cleanup
>   drm/xe/display: Use scoped-cleanup
>   drm/xe: Create scoped cleanup class for force_wake_get_any_engine()
>   drm/xe/drm_client: Use scope-based cleanup
>   drm/xe/gt_debugfs: Use scope-based cleanup
>   drm/xe/huc: Use scope-based forcewake
>   drm/xe/query: Use scope-based forcewake
>   drm/xe/reg_sr: Use scope-based forcewake
>   drm/xe/vram: Use scope-based forcewake
>   drm/xe/bo: Use scope-based runtime PM
>   drm/xe/ggtt: Use scope-based runtime pm
>   drm/xe/hwmon: Use scope-based runtime PM
>   drm/xe/sriov: Use scope-based runtime PM
>   drm/xe/tests: Use scope-based runtime PM
>   drm/xe/sysfs: Use scope-based runtime power management
>   drm/xe/debugfs: Use scope-based runtime PM
> 
>  drivers/gpu/drm/xe/display/xe_fb_pin.c        |  24 ++-
>  drivers/gpu/drm/xe/display/xe_hdcp_gsc.c      |  25 +--
>  drivers/gpu/drm/xe/tests/xe_bo.c              |  10 +-
>  drivers/gpu/drm/xe/tests/xe_dma_buf.c         |   3 +-
>  drivers/gpu/drm/xe/tests/xe_migrate.c         |  10 +-
>  drivers/gpu/drm/xe/tests/xe_mocs.c            |  27 +---
>  drivers/gpu/drm/xe/xe_bo.c                    |   3 +-
>  drivers/gpu/drm/xe/xe_debugfs.c               |  39 +++--
>  drivers/gpu/drm/xe/xe_devcoredump.c           |  26 ++-
>  drivers/gpu/drm/xe/xe_device.c                |  35 ++--
>  drivers/gpu/drm/xe/xe_device_sysfs.c          |  33 ++--
>  drivers/gpu/drm/xe/xe_drm_client.c            |  77 +++++----
>  drivers/gpu/drm/xe/xe_eu_stall.c              |   8 +-
>  drivers/gpu/drm/xe/xe_force_wake.c            |  19 ++-
>  drivers/gpu/drm/xe/xe_force_wake.h            |  23 ++-
>  drivers/gpu/drm/xe/xe_force_wake_types.h      |  41 ++++-
>  drivers/gpu/drm/xe/xe_ggtt.c                  |   3 +-
>  drivers/gpu/drm/xe/xe_gsc.c                   |  28 ++--
>  drivers/gpu/drm/xe/xe_gsc_debugfs.c           |   3 +-
>  drivers/gpu/drm/xe/xe_gsc_proxy.c             |  17 +-
>  drivers/gpu/drm/xe/xe_gt.c                    | 149 ++++++------------
>  drivers/gpu/drm/xe/xe_gt_debugfs.c            |  29 +---
>  drivers/gpu/drm/xe/xe_gt_freq.c               |  27 ++--
>  drivers/gpu/drm/xe/xe_gt_idle.c               |  32 ++--
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c   |  12 +-
>  drivers/gpu/drm/xe/xe_gt_throttle.c           |   3 +-
>  drivers/gpu/drm/xe/xe_guc.c                   |  13 +-
>  drivers/gpu/drm/xe/xe_guc_debugfs.c           |   3 +-
>  drivers/gpu/drm/xe/xe_guc_log.c               |  10 +-
>  drivers/gpu/drm/xe/xe_guc_pc.c                |  62 ++------
>  drivers/gpu/drm/xe/xe_guc_submit.c            |   9 +-
>  drivers/gpu/drm/xe/xe_guc_tlb_inval.c         |   4 +-
>  drivers/gpu/drm/xe/xe_huc.c                   |   7 +-
>  drivers/gpu/drm/xe/xe_huc_debugfs.c           |   3 +-
>  drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c |   6 +-
>  drivers/gpu/drm/xe/xe_hwmon.c                 |  16 +-
>  drivers/gpu/drm/xe/xe_mocs.c                  |  18 +--
>  drivers/gpu/drm/xe/xe_oa.c                    |   9 +-
>  drivers/gpu/drm/xe/xe_oa_types.h              |   3 +
>  drivers/gpu/drm/xe/xe_pat.c                   |  36 ++---
>  drivers/gpu/drm/xe/xe_pci_sriov.c             |   3 +-
>  drivers/gpu/drm/xe/xe_pm.h                    |  17 ++
>  drivers/gpu/drm/xe/xe_pmu.c                   |  10 +-
>  drivers/gpu/drm/xe/xe_pxp.c                   |  49 ++----
>  drivers/gpu/drm/xe/xe_query.c                 |  16 +-
>  drivers/gpu/drm/xe/xe_reg_sr.c                |  17 +-
>  drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c      |   6 +-
>  drivers/gpu/drm/xe/xe_sriov_pf_sysfs.c        |   6 +-
>  drivers/gpu/drm/xe/xe_sriov_vf_ccs.c          |   5 +-
>  drivers/gpu/drm/xe/xe_tile_debugfs.c          |   3 +-
>  drivers/gpu/drm/xe/xe_tile_sriov_pf_debugfs.c |   3 +-
>  drivers/gpu/drm/xe/xe_vram.c                  |   7 +-
>  52 files changed, 422 insertions(+), 625 deletions(-)
> 
> -- 
> 2.51.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
