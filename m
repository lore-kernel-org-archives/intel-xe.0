Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 958C1C88E53
	for <intel-xe@archiver.kernel.org>; Fri, 11 Sep 2026 20:45:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F16510E534;
	Fri, 11 Sep 2026 20:45:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SjudjTOf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 149D010E534
 for <intel-xe@lists.freedesktop.org>; Fri, 11 Sep 2026 20:45:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789159530; x=1820695530;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Hl5VhQwXtHt20jNULkO7K+mn+HNn7EUqCoRAIFO37fo=;
 b=SjudjTOffMuhqv7wpP4UIjUmc6O/x8F3bSHMnSrmFS1sKxUMunTRN43v
 PbtGRpdCYINbSsh8gJw+XBZiKITQncuiVSP7s4GKt9i0JI5owNkT1YA5p
 YMNirsKWp6k4k6aGVtDh1IMfwg4Hwc7O4K9R7RMHwnc9L429h1FW31xKx
 6DF/CsJfYSS1MQ5Q/gMBgtekFTxdpXvUcxLzMg2+iDoQ04jBSZ2DE3e+Q
 H6nI+F52M3fP6RaD68gjxTpcLHEsajFGiQSls/3cHmzsUiWhsJE5dE7Ko
 dR2Kvm2VB+YB5oqK93zzfukUyT1sMGU/zqbIo/zY0waCZE9FTE00iqJo9 A==;
X-CSE-ConnectionGUID: +NxI0eowTuCD4cCwjdVBww==
X-CSE-MsgGUID: fkBCWzIkT26wjoirn4rRxw==
X-IronPort-AV: E=McAfee;i="6800,10657,11902"; a="100223172"
X-IronPort-AV: E=Sophos;i="6.27,97,1787036400"; d="scan'208";a="100223172"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2026 13:45:30 -0700
X-CSE-ConnectionGUID: HRM8ITQrSYyi3VsZ2v01EQ==
X-CSE-MsgGUID: BGrdfxFxQVGLXddUPtN36A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,97,1787036400"; d="scan'208";a="270631506"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2026 13:45:29 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 11 Sep 2026 13:45:29 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Fri, 11 Sep 2026 13:45:29 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.57) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 11 Sep 2026 13:45:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lb5Usz6jDUPvHzxux0NCFhkxpB0PFSfcLH60j0SYmrRWbmNND1YHM4pVpQ0eogj2RZFSCaBn8W3blpAHGEY9mU4bj7suUmZMtW93g7HIEwAFHaKzJ4TdCUtoiULeR5GsutSdU+Ec7jCSNBND7hNS2V1bijYJmSPoVHqojj/S2wKWtfWwLYQU1TCvxsxHgnu1cCAVKSMyc7+wSAdwGk/acicyR7QM7rm0U+qaNW5dZBPHZwExafnYyqTwCirEquw8P5w6lvMMMzMgU2GXgWM2jkmY23fZ1QQSzPIChpHQcKmDqt6LUX2eN/eMMps1aafJORYyodvpnuYKl9ME5dl/rQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oa86oQy43P6p0UZroBqktfFIKqu529hStyVFS9le1WQ=;
 b=eKk8tSnJU1He53KiwCQ5k6cMV38Q6KHh4e3lHl0pxE9Lec55I3MV3NXAzL/a0kDPVy9sBDDROT/yqRMVc7iuSHppaw+s4fLT8CwlhxkZSsl7QlMvxxlsTZjsjwKwfugUZGs9jCgtqhhZ81GFBlhqc9kItMbtcXvnZ0dydnIkd58IIfVzhWzFbj1omqeWosCPc5gumMWxssOkPaPo3v4t0+J/NfWsGI5JqOu7MmZtPKBuq3ibnYtjLx3K0p01lacgj0KZC4CWNeSdlzL1TSt0eKYItCs1Ms/jGqSXiEouTHoAFvYyNXmpFBt9javr2MLGkeQ2F7FBfW143X0qv1xovw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB4787.namprd11.prod.outlook.com (2603:10b6:303:95::23)
 by IA1PR11MB6075.namprd11.prod.outlook.com (2603:10b6:208:3d5::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.9; Fri, 11 Sep
 2026 20:45:16 +0000
Received: from CO1PR11MB4787.namprd11.prod.outlook.com
 ([fe80::e7eb:a872:53d1:21fd]) by CO1PR11MB4787.namprd11.prod.outlook.com
 ([fe80::e7eb:a872:53d1:21fd%3]) with mapi id 15.21.0406.007; Fri, 11 Sep 2026
 20:45:16 +0000
Date: Fri, 11 Sep 2026 13:45:13 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Sanjay Yadav <sanjay.kumar.yadav@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Stuart Summers <stuart.summers@intel.com>
Subject: Re: [PATCH] drm/xe: Don't wedge shared engine on stale faults from
 torn-down VMs
Message-ID: <aqRoWdaMm1VH1OW0@gsse-cloud1.jf.intel.com>
References: <20260911192300.1561972-2-sanjay.kumar.yadav@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260911192300.1561972-2-sanjay.kumar.yadav@intel.com>
X-ClientProxiedBy: MW4PR04CA0210.namprd04.prod.outlook.com
 (2603:10b6:303:86::35) To CO1PR11MB4787.namprd11.prod.outlook.com
 (2603:10b6:303:95::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4787:EE_|IA1PR11MB6075:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f79ef9e-fd98-4205-2801-08df104595b1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|366016|1800799024|10067099003|22082099003|18002099003|56012099006|11063799006|5023799004;
X-Microsoft-Antispam-Message-Info: 0y9kPGz/W7hhOikCWxLZBSfnAHU/0VnuxGiY3KfzBP87601pJXTcftfVXlIE2hX6r2Wm7X8n7jDrnU0NUSvHULPAMZ5Offqv60dAE7M0ChmbrLuUsX51H5RAHD1QxFvJBmJFdVYf5CWg4GevQKt8BLkStCg0uNc4AP40OdOKYqspNVyenpz3lcXPwZhqg7ka1PXFQow7y1F+A0AL15WBTGSp8CPNUBAPFy/6ereR/2LdE/9WPVR5Lp2I+YnIRzmEAho/EhIezfsEzfnf4yiIdXloxLImcydCQm0sSQcW6B4NZy+TBh2F+zV+eImvcm7e/0CADza5Lf9fQCWgu+cio7zbx/27gFV1Z7vnRxAuiLmD9WR0J8ZY9kSWhmcWymzAS3zi9MeWIxRucCvMXFDTviz9UpmAkEJrbX0UZDxa/hufO/nwR7Uzk+vs7NKi/NOHIYzyY18UzCBycup+Do5bfHsA7tVI/nZKmxPxyrDKFJO+bZ6MRFZ6dZQmdkL67+UuTI716BCt/zlXoyIMTjMzIISzFluOQo1uhu2Fe9cFR02Oh47UbhpebiuMSn9vj2ita9wp8S30mbGwYTg4vnLJbr6/Amyp6OF9ZlsEvam2onWHGNfxpAFRNvTPtNMRbHm7YnGBjb4NYodQIfJQdOPE60aet0h/CBWWP7vBNe2fgwk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB4787.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(10067099003)(22082099003)(18002099003)(56012099006)(11063799006)(5023799004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?uMkY73nhG2emnakVBdk6djp6601T1Rzs+B90nWQpJKAJ/jGjG4NYT6QsC8bp?=
 =?us-ascii?Q?ulc6vNwOoKZ1LYRKNJWYOaKNoNYIfslZ3FyyhubI/5jGgGMldiDJede3XPUm?=
 =?us-ascii?Q?xuYSrRDXqppszI3BnbyrCKGhroRDbGayeJy8A3NLuNN7tBVCIHk+AqGHx6VL?=
 =?us-ascii?Q?8+49lWG2y0H7HApI/vx0kBpN+Ie7FTteTeGHJqqnWsIU948watvrJKQ50pZI?=
 =?us-ascii?Q?mKgs7jrbMHVb9kaeEpJd4TrKTtFuenI3DYRxelQXQsLW5vqfUzTsE7aHGYcw?=
 =?us-ascii?Q?SutnFS+JCGBGwUcMue6/5iDYPP8WSwCVNU2W8WIfHUIdEJYvfDVYlm/Y+91O?=
 =?us-ascii?Q?IkzBwZxU63v5dPPZS8WuFKgZBsjZejOG5fwEzUiHue3WnB1Z683P3tbaZtlG?=
 =?us-ascii?Q?tdojEUOKELcyEF6KV5oE2UKHRWIwUYq7ftgaeBrtSFw/Cx4CkgKLh64dnSOL?=
 =?us-ascii?Q?z+WmmajWAgZvt1jxyhoYAMl7izJbcSLxBo5YHofxhjOY89YmpxPGB15rSZYF?=
 =?us-ascii?Q?RIhqdRZVS6rB4VxdIqOAqjnjKnxZ4D85rqgXJijr0iRk0dsM4KHv5tncN+5q?=
 =?us-ascii?Q?yDlBI8Z7owgXUdzuPosII2Xb+Z84gPTRP1eluBwj5/O/gdaHQZEwlXRYoyhR?=
 =?us-ascii?Q?aDY3+zK+kpG6CxWZpqXcA/Wx/W7zYGL7yXMbSHZaCV1WNiQk5Ne3iabCepaW?=
 =?us-ascii?Q?2NP5eHgvpPNPezEThmNOaYm0Idb+mKwxIuID1MF7W/IWaAeUm3Hk8DbUiGkd?=
 =?us-ascii?Q?tfbcpakexSuqe6+L5OvUh9nfxPXL3PUTn2IYzDbkqPNvWq4U76a3paKVuyX1?=
 =?us-ascii?Q?oB4THtjROTodNISyq1fKD4NXdVRMmZLHLZjpQxk+y450P2i6IWwF6PdFVXRU?=
 =?us-ascii?Q?ZV4/VpldjelfymBz3M4MYIjA4/SwGLFs77/0bgHCYdvsd4oAjI4GoNe7YlvR?=
 =?us-ascii?Q?s3ccEQMl/N0dY5kTmHN1axNE3fQ55rBIWz2RNIMZZUa1NJ3C/GmwI/9y1tdN?=
 =?us-ascii?Q?6Mo38wvoFOuk6PAG92+shag1iyRJWxqIt2KJbn/GXqJ/gtyWLlXBT6KzL/YA?=
 =?us-ascii?Q?3kNPgmDdgU/LOTHkAdd/3ogGH1acO7en46PCK2UaCPb8alxqE5G+L8Zxe2Yo?=
 =?us-ascii?Q?HinD5m49auMOWyoxdQ2MgTx5cFJp+KZT2Tdglqnr8BhmLRRsv5SR5l9df/sz?=
 =?us-ascii?Q?9HdhCU38bqu1GbFFKgjAkgWS1jbFphNwseLV3KGM+ZII4Giixo/0gWyBU9Ju?=
 =?us-ascii?Q?7r6R9ojymERidDYy9Jh/fdZHJjSxxBL8kvHbw3LT4s13Q7KiS6cBhzhs3w9N?=
 =?us-ascii?Q?AfjT4HC8ajfk9p8yzs0jetzL0M1O1nqQGbnz3ZBMpWRJ3QeOq9b1kuCHMS+T?=
 =?us-ascii?Q?aXTj8V5edogjcG7OmOhUHdMZf8Fh+h3GqZnCaLPR8mHs2wIGWe1wPLBEsldA?=
 =?us-ascii?Q?w84CYS9ICtoTNC5cyaMcNBBLKElLifjozfv3BKZhrwbfm3b8VhsldqcX4ABG?=
 =?us-ascii?Q?0Rw7xY1O1GAqBYGE/lSi7pLs5ek8DAn8guB6Kuwwb88I/qChklGm7QRKKbEg?=
 =?us-ascii?Q?9LLIBNclomrewPYGMBBDE0x9oTcX/dRjYmVQrJzqBFYXIKTBjlViFhyUJAcp?=
 =?us-ascii?Q?wClZWxOI5/DTleAhJhj4PwQuqvf90S5fBHJKPn1NV1svrAI8epqF4WlXa7eS?=
 =?us-ascii?Q?d3peTroSP2rkR/hHVpalt+ofym/UAK7dHjhGdOQy2FiEdfx8HyIZXTg5MnwA?=
 =?us-ascii?Q?N9Pyv1hSdaywGJm9IPG3tgSELzZlhwU=3D?=
X-Exchange-RoutingPolicyChecked: a1imWN4D2K9AuEzw7S+jJRR/QoRET/ZCZ2aVEN1K6kYjFAw3VFV1BaLpohLoc2N+2710nvToxXIiFqVzg/GSDFSTLfOXlLkvRsSTysbbYMJsomaGEqGq1Yf+iYEit5CVNm/UBTmpTmJn9ahnpMR4xA4YV83qkRqD7L7c/R1UgtTyuyPXJeFFb5Ub4vjCK6kaEXXtS77JP1MoLA0iuHKircDZnudILW7oIXJnfi11+3dwESFhnsRmae5hcXzf02HFLQGeXTsa3UFwoQMaCB4/p+p/HrI2rSAsbplWxWRbg11poXbW/MlvserC5Da0LXLkXdRZNw8cgF0wflrmVnA0ow==
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f79ef9e-fd98-4205-2801-08df104595b1
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4787.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2026 20:45:16.1630 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ocovfj+6H5Ep7Wdq6ZwIspOI/xFwuI+PLCYcM6peQ45xVsuQYcw+YW30fcIf6i59uhDvSC5hGoduaFutZnfqhw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6075
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

On Sat, Sep 12, 2026 at 12:53:01AM +0530, Sanjay Yadav wrote:
> A recoverable page fault generated by a process's completed migrate/BCS
> work can arrive after that process's VM has been closed and its ASID
> removed (abnormal exit while GPU work was in flight).
> xe_pagefault_service() returned an error for such faults, which is
> reported to the GuC/HW as an unsuccessful response. Repeated
> unsuccessful responses eventually escalate to an engine memory CAT
> error. Because the migrate/BCS engine is shared, that CAT error
> wedges it for unrelated processes, which then hang on their own
> copies.

Yikes. Do you have a reproducer for this? I wouldn't expect this
behavior from the hardware, as it appears to violate the expected
process isolation contract.

> 
> Detect stale faults whose owning VM is closed or whose ASID no longer
> maps to a fault-capable VM, and drain them instead of replying
> unsuccessful.
> 
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Stuart Summers <stuart.summers@intel.com>

Fixes, CC stable if this is an issue.

> Assisted-by: GitHub Copilot:claude-opus-4.8
> Signed-off-by: Sanjay Yadav <sanjay.kumar.yadav@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_pagefault.c | 22 +++++++++++++++++++---
>  1 file changed, 19 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pagefault.c b/drivers/gpu/drm/xe/xe_pagefault.c
> index c82b8bc8bc70..2827652ab8a3 100644
> --- a/drivers/gpu/drm/xe/xe_pagefault.c
> +++ b/drivers/gpu/drm/xe/xe_pagefault.c
> @@ -238,8 +238,10 @@ static struct xe_vm *xe_pagefault_asid_to_vm(struct xe_device *xe, u32 asid)
>  	vm = xa_load(&xe->usm.asid_to_vm, asid);
>  	if (vm && xe_vm_in_fault_mode(vm))
>  		xe_vm_get(vm);
> -	else
> +	else if (vm)
>  		vm = ERR_PTR(-EINVAL);
> +	else
> +		vm = ERR_PTR(-ENOENT);
>  	up_read(&xe->usm.lock);
>  
>  	return vm;
> @@ -260,13 +262,27 @@ static int xe_pagefault_service(struct xe_pagefault *pf)
>  		return -EFAULT;
>  
>  	vm = xe_pagefault_asid_to_vm(xe, asid);
> -	if (IS_ERR(vm))
> +	if (IS_ERR(vm)) {
> +		if (PTR_ERR(vm) == -ENOENT) {
> +			drm_info(&xe->drm,
> +				 "xe_pf_debug: drain stale fault (no VM) asid=%u addr=0x%llx\n",
> +				 asid, pf->consumer.page_addr);
> +			xe_pagefault_set_start_addr(pf, pf->consumer.page_addr);
> +			xe_pagefault_set_end_addr(pf, pf->consumer.page_addr);
> +			return 0;

Won't the page walker hotspin on faults until the executing queue is
descheduled from the hardware if we successfully acknowledge them? That
doesn't seem ideal.

Matt

> +		}
>  		return PTR_ERR(vm);
> +	}
>  
>  	down_read(&vm->lock);
>  
>  	if (xe_vm_is_closed(vm)) {
> -		err = -ENOENT;
> +		drm_info(&xe->drm,
> +			 "xe_pf_debug: drain stale fault (closed VM) asid=%u addr=0x%llx\n",
> +			 asid, pf->consumer.page_addr);
> +		xe_pagefault_set_start_addr(pf, pf->consumer.page_addr);
> +		xe_pagefault_set_end_addr(pf, pf->consumer.page_addr);
> +		err = 0;
>  		goto unlock_vm;
>  	}
>  
> -- 
> 2.52.0
> 
