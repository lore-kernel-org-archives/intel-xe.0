Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4276FEB362B
	for <intel-xe@archiver.kernel.org>; Mon,  2 Mar 2026 18:13:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C17AC10E4B9;
	Mon,  2 Mar 2026 18:13:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jvqYrEr9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A779710E4B9
 for <intel-xe@lists.freedesktop.org>; Mon,  2 Mar 2026 18:13:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772475237; x=1804011237;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=6SJg/WrQwIaemcRfVZBR8YUf+Z7y4sSK/bbEvkgsvNs=;
 b=jvqYrEr9ihWG+Qje/7+rCe5Ytamr68domR136Z1RdgBrN4k/joC/j617
 71draDmto2FrH6TjNC97sSS+7HIsXmqYphT3L76pwVRJKtQUucbbTHnJi
 LVzZG6CA0GxwdPmjhDGafDWOocMWdnbUHq12XG9PLgEzMqt6ZeF9EAf0y
 jy145BjD0ViQRW1DWFkPGKZkuTYi0XAWrv0GMkZkRK/Wwe8mz2caLp58A
 zd+UUsT6xsjJ7oYol5Dq1yTXZmXQOglNJJ569PD4rxjoPhTrr7poi/bzL
 bMf78U0VkrsBlX/tEm+rsUzMoy8NjJbg63eBGFQxPcdfj4l+kp6SsO4pF Q==;
X-CSE-ConnectionGUID: EYuEhvRmTo6LXHdWDPL7OQ==
X-CSE-MsgGUID: DBwXi9npQie+e7rrmIgzNg==
X-IronPort-AV: E=McAfee;i="6800,10657,11717"; a="91067939"
X-IronPort-AV: E=Sophos;i="6.21,320,1763452800"; d="scan'208";a="91067939"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2026 10:13:56 -0800
X-CSE-ConnectionGUID: nbBzrBHrSUK+D3/ZquL5dg==
X-CSE-MsgGUID: 0Le66tPKTCa4CTEfXvSl/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,320,1763452800"; d="scan'208";a="244744331"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2026 10:13:56 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 2 Mar 2026 10:13:55 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 2 Mar 2026 10:13:55 -0800
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.41) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 2 Mar 2026 10:13:55 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oxjbhl24SipLfNVCjGG6wzD2wYnZTHE33LwkAoHdk9ZHfcJS8LBsBplu8NKp/GdP5beFyDdQ81RLxrRvf2v5Lv3p1qDLWRKcMNT8dE64Lu5poa6v9c1+L3OBI0/FKsfqWSAaQB4B7Hf1hHaG24cw6DUyTl9sylk//gTraf3Qc6Gs0Pk/LLNIElw+tV0DcgaTJxG6JWmFHHomTT8l9D53nTpqAN2JBOFX0y1vzATxEhM6kjL9adhPvKd36LKXO32uzyefWzCNhFWdbg9c9MmQoYs9gCEDEA7jxVthUDsRZF4OfNeJ/EkBUY1nfNlMAZt6w4mG74+dz0xerRas/mPBpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GP9UZWFvGG+QuWjxZA9Vvzh72GcHpsx+XhDwRJQ3ki0=;
 b=WqlIvck2e1wMAs7xo0ErpR5lThv7nn+UnA9ABaFGmOR9LCEc3l/OIYmUd5e8z1zLnxpXzBq8sj105LEgI0JpuQ5C8Ip0hTRzXMYp2T2t0lyIKoRmMZpAHwXzbLd+ujAcEsgIqppGSiiXcADMqPIj+P5EdUTOj1FHcf83M0moBKCzm2p3Rd2GDANJY0yQCN4zX7r4nY9G2sEUHAWzNAdkDh3QiT7j8yqztx+h/b3U9WfTC7EY18Q3sZQfkdEzHQDUJXlkCN72HthZSJIVr9ZrlR/K3i6nse/jDrJIpM6mEvX3xRKR2dxZgLmySSCkX9VfmAg57GwS/InL+Nz8he3QUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH0PR11MB5096.namprd11.prod.outlook.com (2603:10b6:510:3c::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.21; Mon, 2 Mar
 2026 18:13:52 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%4]) with mapi id 15.20.9654.020; Mon, 2 Mar 2026
 18:13:52 +0000
Date: Mon, 2 Mar 2026 10:13:49 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: "Summers, Stuart" <stuart.summers@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: Re: Xe.CI.FULL: failure for CPU binds and ULLS on migration queue
 (rev3)
Message-ID: <aaXTXfUhXgZ6qfdi@lstrano-desk.jf.intel.com>
References: <20260228013501.106680-1-matthew.brost@intel.com>
 <177228714198.299251.9878264072669608574@a3b018990fe9>
 <fd5a852545ea98ac0a11bb38fee03fd38c476a13.camel@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fd5a852545ea98ac0a11bb38fee03fd38c476a13.camel@intel.com>
X-ClientProxiedBy: MW4PR03CA0280.namprd03.prod.outlook.com
 (2603:10b6:303:b5::15) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH0PR11MB5096:EE_
X-MS-Office365-Filtering-Correlation-Id: cf4c1e3c-6523-489f-7a9c-08de78877586
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: by04h60AkP48ADM0jjnw580G4hJBpT9TW5G+Omttwy4JNzoXfpel4pO7nZ2gfHtY25MKECFzk2hKbZpkrtJge1n8vbMw7JNVXySeyDFzFb/X/6lv0FNs9EJfK3jyFuW0YCu0ClCC/l2NONOrzJqOlslloBpXAQni3FQ23H+KZ6LO51FF9+kU+gJGR24kZN3VtUJAGt/dNscvzuMrylujm6PbR9c4vvz+vbHzkC1d6S8OChUQyGplezEMGz/2mVnxh3ZplkI3BMaAHDNs2IOZDoywJ2GrYoQiK6yde5svovU9ZcPZsmPyPpQnO8R5FB4v7nHYGs+y3HSfq+z0Kqtlh9c+Ui0SkyfJi3BtdEsQnETexCJI5oOKxpGx3khVyDKNWRRWCtT8iERMXvXEC3lBcsqw437/oglt21hwqNP+CapgrOjzJedp2RSTdvvKCRTRF47U4zu8GMHZZ6BOiKzw4TEGbonM8zaSYNnVTsinX08B049TrW5x/ZIYgL1XRQMw5Grdew/6ov4bjIERecWlwopbm0AOXV7+Jm34S6lGOoEMSrGfdNE7WJxuqLkQmtjAutH4IOK2/BYL1rC2kPoF+SzmZpzh+dW2ago5kwWeBCaPUkSjCSQGFdUu2RQF3UqKL06LlHJpiRQVtq2/MjVFL5cEJJ2xbpA2wj1oih9z/dEa8xBT6RjBuYOwg7XQ2N2G
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?zmt/jZAc7hO9kVY1raDBO1mxZJkMRUOPztZ2K4IFPUwQWJWHBiBFPe5eDy?=
 =?iso-8859-1?Q?IRTUvv3Lc+h9dDD7prXIm1VRRfHVVTERugFWNWavDb7yN0/YDa8JwG9KCt?=
 =?iso-8859-1?Q?UgGNDFH1WcjifPLK9SZknKQXSB15jK0ElNMVpseN5YoOJL7ubMZOZEfPOh?=
 =?iso-8859-1?Q?iGeR8INHBdQjr6svmf9GUc+vRvkc0fFwJxVDkm1RvySkNK07p4J/w08HGK?=
 =?iso-8859-1?Q?ltXQekyYoh9uVxu82bb1KO1a6w0GKPD8SfjfK/VHjQtm15xpFVRXWMUvt9?=
 =?iso-8859-1?Q?0bKzJPhiRQx285pcDJwf7Z12rub3Hx1Akgz4As9YIhdFgUrVgKI1QX4GqN?=
 =?iso-8859-1?Q?EDRP3mUzqls1+yOgBxwvAncS+nzAr5q6vgle/jP45dhnzwuCPXOP0Db4UT?=
 =?iso-8859-1?Q?8OQwUZHAqHkcyu5w+wrum10IjOjH61YMp2liClGYs4WqvMxIbawpqekmK9?=
 =?iso-8859-1?Q?gGC5UEhATI8eXBLeK5+ZEZx8rMAxN/DsARG4z1zDBBs4W2yGEf7vcrNdtt?=
 =?iso-8859-1?Q?+F82EZZVtWB5NIoK9g1WaYOOm5v4ykM34kLQSExj787a8biB/kz1wm58Mx?=
 =?iso-8859-1?Q?Qmz2GJ+OJNTlUXwjBEp3LpHxEKJVo3XHPWUfWZ2DM1R/bsK7xaI6hLnIg5?=
 =?iso-8859-1?Q?4U6CC/wIDZL+Q3BqEWCBJzWebmY2aQZX0jDoznN1lO0phd5gHvPwCtjqSb?=
 =?iso-8859-1?Q?gD+iKPCUr9VHZPTSVRVUZXN6nBwM6feOP6t6AvImbKaJ9B5gey9PFPDIWN?=
 =?iso-8859-1?Q?N0YL1eiI47dMjj7gmgljAcko+yLV3jXxri9x0bmiwIU0BlMXZkpAeU7OHo?=
 =?iso-8859-1?Q?7jLxDh8vLCts0A7TXegsUqg0AeqBElrrFW/L2XDEzSIMCzGz2mwyVHaaB5?=
 =?iso-8859-1?Q?oFT20iw+DWt5caYeygIRXLk+oy6eGfl0IW61YqTzcpfkSNCrlLshx66fs9?=
 =?iso-8859-1?Q?Y5XILSiWm/F/sGO+WnyHZBciKzEjSAn3SvUDTm7yYuE+DoXIPXawpr9m5W?=
 =?iso-8859-1?Q?OjL/9XxcDqrFtlEg3l31VOuQcGoFKioQrM7M40ALNiU7qHxSNcg6or2GRp?=
 =?iso-8859-1?Q?+POo7Ev0s3Txs9R9A96FTHcjveoOCezm9PlcwdFNuwVlRrbZurqKxjZlLn?=
 =?iso-8859-1?Q?DbGmmX6YNBpsInV1XojaBE0xXyGlRn3z1e7/p4H+PTrFolfuaSRqRX+RWw?=
 =?iso-8859-1?Q?v7wqXyn9iwaeiq9dFSQC90iAcVOUAeYopfgBtQbHz6b5L8K3Gw5IvWu1Es?=
 =?iso-8859-1?Q?RjV9VCw75fh6JFC97tXPA8LnHBfz2dxpJpM654RgO3brWGfAxEDkwwJHXA?=
 =?iso-8859-1?Q?0YeBnfWjyrlGbYUgynBCRPeAc0k1CdkakFowDf0VXloW4fRNItIgijdlhH?=
 =?iso-8859-1?Q?6GCu1lStbHQSHLI6NdkgFTMphEi7MW3Ywdi2tuH8JxzRHMDIphk7jI354n?=
 =?iso-8859-1?Q?gNUMZxgSaCjIISe1dYM638zjn6Wno6vinnyQ9Cjlm/Y+JaHg645elI6Kxf?=
 =?iso-8859-1?Q?5NRLt2QAJ8HlXA/u/26+G0MlYwUhTy1lGK7tQ+P51iOI6cLeYm/gJl1szz?=
 =?iso-8859-1?Q?aWYg4k9FFTIpjw4C7VoFXFl9CUah1Ja62Jtxp7VjgqH8APQnaBQMBLd+0Z?=
 =?iso-8859-1?Q?wtdbveUj4Tw0TpzN0mWRPgDDrakRvAtOuo2NvLk0YXW3w64XFaXhhdxjpK?=
 =?iso-8859-1?Q?VxpbMy7YE9aQRm5RwCzK16kVZ3Lx+B5fp04llpAOUNpmjJ5eRCXS6c8OUm?=
 =?iso-8859-1?Q?pGZjwbBZhNnAC/vXDlo/pgULIKiRP5E5Da4l45p9WczX0xbbAsDUHMvkAM?=
 =?iso-8859-1?Q?R+o5TlMVguP5KB6TUkfrXTzkNefde7U=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cf4c1e3c-6523-489f-7a9c-08de78877586
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2026 18:13:52.2609 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mKuiT6vV1tORNuLcMH1SIhhnBRtKtq2vdjqqamOafZ0K93owc1SxIQ1yPgvqdsXOAsGkNzqqbAV3AKjVPrlUAQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5096
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

On Mon, Mar 02, 2026 at 10:54:56AM -0700, Summers, Stuart wrote:
> On Sat, 2026-02-28 at 13:59 +0000, Patchwork wrote:
> > Patch Details
> > Series: CPU binds and ULLS on migration queue (rev3) URL:
> > https://patchwork.freedesktop.org/series/149888/ State: failure
> > Details:
> > https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v3/index.html 
> > CI Bug Log - changes from xe-4635-
> > a0a6a2fc5a08dc2e936c43e5d181dd0975a251a1_FULL -> xe-pw-
> > 149888v3_FULLSummaryFAILURE
> > Serious unknown changes coming with xe-pw-149888v3_FULL absolutely
> > need to be
> >  verified manually.
> > If you think the reported changes have nothing to do with the changes
> >  introduced in xe-pw-149888v3_FULL, please notify your bug team
> > (I915-ci-infra@lists.freedesktop.org) to allow them
> >  to document this new failure mode, which will reduce false positives
> > in CI.
> > Participating hosts (2 -> 2)No changes in participating hosts
> > Possible new issuesHere are the unknown changes that may have been
> > introduced in xe-pw-149888v3_FULL:
> > IGT changesPossible regressions *
> > igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-d-dp-2:shard-
> > bmg: PASS -> INCOMPLETE
> >  * igt@xe_module_load@many-reload:shard-bmg: PASS -> ABORT +1 other
> 
> Haven't looked through all the patches yet, but wondering if this might
> be related here...
> 

I don't see obvious in the series which relates to this and I can't
recreate this locally. I'm putting this one in early rc cycle bugs for
now but will keep an eye on it if it pops up in future revs.

Matt 

> 4> [73.639432] Oops: general protection fault, probably for non-
> canonical address 0x6b6b6b6b6b6b6b9b: 0000 [#1] SMP NOPTI
> <4> [73.639448] CPU: 11 UID: 0 PID: 2750 Comm: xe_module_load Tainted:
> G S   U              7.0.0-rc1-lgci-xe-xe-pw-149888v3-debug+ #1
> PREEMPT(lazy) 
> <4> [73.639459] Tainted: [S]=CPU_OUT_OF_SPEC, [U]=USER
> <4> [73.639462] Hardware name: ASUS System Product Name/PRIME Z790-P
> WIFI, BIOS 1645 03/15/2024
> <4> [73.639468] RIP: 0010:kernfs_root+0x3e/0x1b0
> <4> [73.639476] Code: 31 c9 45 31 c0 48 8d 05 00 00 00 00 50 b9 02 00
> 00 00 31 f6 48 c7 c7 e0 5b 5c 83 e8 6c c2 ac ff e8 37 87 f6 00 5a 85 c0
> 75 62 <49> 8b 5c 24 30 e8 28 87 f6 00 85 c0 0f 85 f9 00 00 00 48 85 db
> 49
> <4> [73.639485] RSP: 0018:ffffc900045cb7e8 EFLAGS: 00010202
> <4> [73.639491] RAX: 0000000000000001 RBX: 6b6b6b6b6b6b6b6b RCX:
> 0000000000000000
> <4> [73.639496] RDX: ffffffff819c2880 RSI: 0000000000000000 RDI:
> 0000000000000000
> <4> [73.639500] RBP: ffffc900045cb800 R08: 0000000000000000 R09:
> 0000000000000000
> <4> [73.639505] R10: 0000000000000000 R11: 0000000000000000 R12:
> 6b6b6b6b6b6b6b6b
> <4> [73.639509] R13: 0000000000000000 R14: ffffffffa12018cf R15:
> ffff88812ed6ee40
> <4> [73.639513] FS:  00007360f3e40940(0000) GS:ffff8888db21b000(0000)
> knlGS:0000000000000000
> <4> [73.639520] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> <4> [73.639524] CR2: 00005bc7ecde6708 CR3: 0000000120b07002 CR4:
> 0000000000f72ef0
> <4> [73.639530] PKRU: 55555554
> <4> [73.639533] Call Trace:
> <4> [73.639536]  <TASK>
> <4> [73.639540]  kernfs_remove_by_name_ns+0x27/0xc0
> <4> [73.639547]  sysfs_remove_link+0x19/0x50
> <4> [73.639555]  action_rm_device_link+0x15/0x20 [xe]
> <4> [73.639818]  devm_action_release+0x15/0x30
> <4> [73.639825]  release_nodes+0x44/0x160
> <4> [73.639830]  ? trace_hardirqs_on+0x22/0x100
> <4> [73.639839]  devres_release_all+0x96/0xd0
> <4> [73.639847]  device_unbind_cleanup+0x12/0xb0
> <4> [73.639855]  device_release_driver_internal+0x23a/0x280
> <4> [73.639860]  ? bus_find_device+0xa5/0xe0
> <4> [73.639867]  device_driver_detach+0x14/0x20
> <4> [73.639872]  unbind_store+0xac/0xc0
> <4> [73.639879]  drv_attr_store+0x24/0x50
> <4> [73.639884]  sysfs_kf_write+0x4d/0x80
> <4> [73.639892]  kernfs_fop_write_iter+0x188/0x240
> <4> [73.639899]  vfs_write+0x283/0x540
> <4> [73.639910]  ksys_write+0x6f/0xf0
> <4> [73.639917]  __x64_sys_write+0x19/0x30
> <4> [73.639923]  x64_sys_call+0x259/0x26e0
> <4> [73.639930]  do_syscall_64+0xdd/0x1470
> <4> [73.639937]  ? check_bytes_and_report+0x59/0x150
> <4> [73.639944]  ? find_held_lock+0x31/0x90
> <4> [73.639950]  ? free_to_partial_list+0x46d/0x640
> <4> [73.639956]  ? lock_release+0xd0/0x2b0
> <4> [73.639962]  ? _raw_spin_unlock_irqrestore+0x51/0x80
> <4> [73.639970]  ? free_to_partial_list+0x46d/0x640
> <4> [73.639975]  ? trace_hardirqs_on+0x22/0x100
> <4> [73.639981]  ? _raw_spin_unlock_irqrestore+0x51/0x80
> <4> [73.639987]  ? free_to_partial_list+0x46d/0x640
> <4> [73.639992]  ? putname+0x41/0x90
> <4> [73.640000]  ? __slab_free+0x129/0x2b0
> <4> [73.640005]  ? __pcs_replace_full_main+0x29a/0x660
> <4> [73.640013]  ? putname+0x41/0x90
> <4> [73.640019]  ? kmem_cache_free+0x165/0x510
> <4> [73.640025]  ? putname+0x41/0x90
> <4> [73.640031]  ? do_sys_openat2+0x85/0xd0
> <4> [73.640038]  ? __x64_sys_openat+0x54/0xa0
> <4> [73.640043]  ? trace_hardirqs_on_prepare+0xe1/0x100
> <4> [73.640050]  ? do_syscall_64+0x22e/0x1470
> <4> [73.640055]  ? trace_hardirqs_on_prepare+0xe1/0x100
> <4> [73.640061]  ? do_syscall_64+0x22e/0x1470
> <4> [73.640067]  ? do_syscall_64+0x22e/0x1470
> <4> [73.640072]  ? trace_hardirqs_on_prepare+0xe1/0x100
> <4> [73.640079]  ? do_syscall_64+0x22e/0x1470
> <4> [73.640084]  ? trace_hardirqs_on_prepare+0xe1/0x100
> <4> [73.640090]  ? do_syscall_64+0x22e/0x1470
> <4> [73.640096]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
> <4> [73.640102] RIP: 0033:0x7360f611c5a4
> <4> [73.640107] Code: c7 00 16 00 00 00 b8 ff ff ff ff c3 66 2e 0f 1f
> 84 00 00 00 00 00 f3 0f 1e fa 80 3d a5 ea 0e 00 00 74 13 b8 01 00 00 00
> 0f 05 <48> 3d 00 f0 ff ff 77 54 c3 0f 1f 00 55 48 89 e5 48 83 ec 20 48
> 89
> <4> [73.640117] RSP: 002b:00007ffc58eed568 EFLAGS: 00000202 ORIG_RAX:
> 0000000000000001
> <4> [73.640124] RAX: ffffffffffffffda RBX: 0000000000000000 RCX:
> 00007360f611c5a4
> <4> [73.640129] RDX: 000000000000000c RSI: 0000561d73ef2e83 RDI:
> 0000000000000006
> <4> [73.640134] RBP: 000000000000000c R08: 00007360f6203b20 R09:
> 0000000000000000
> <4> [73.640138] R10: 0000000000000000 R11: 0000000000000202 R12:
> 0000561d73ef2e83
> <4> [73.640143] R13: 0000000000000006 R14: 0000561d6256fcf8 R15:
> 00007360f6485000
> <4> [73.640151]  </TASK>
> 
> > test abort
> >  * igt@xe_vm@bind-array-enobufs:shard-lnl: PASS -> FAILshard-bmg:
> > PASS -> FAIL
> > Known issuesHere are the changes found in xe-pw-149888v3_FULL that
> > come from known issues:
> > IGT changesIssues hit *
> > igt@kms_big_fb@x-tiled-16bpp-rotate-270:shard-lnl: NOTRUN -> SKIP
> > (Intel XE#1407)
> >  * igt@kms_big_fb@y-tiled-64bpp-rotate-270:shard-lnl: NOTRUN -> SKIP
> > (Intel XE#1124) +2 other tests skip
> >  * igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:shard-
> > lnl: NOTRUN -> SKIP (Intel XE#2191)
> >  * igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs:shard-lnl: NOTRUN
> > -> SKIP (Intel XE#2887) +3 other tests skip
> >  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-a-dp-
> > 1:shard-bmg: NOTRUN -> SKIP (Intel XE#2652) +3 other tests skip
> >  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:shard-bmg: PASS ->
> > INCOMPLETE (Intel XE#7084)
> >  * igt@kms_chamelium_frames@hdmi-crc-fast:shard-lnl: NOTRUN -> SKIP
> > (Intel XE#373) +1 other test skip
> >  * igt@kms_content_protection@atomic-dpms:shard-lnl: NOTRUN -> SKIP
> > (Intel XE#3278 / Intel XE#6973)
> >  * igt@kms_content_protection@legacy-hdcp14@pipe-a-dp-2:shard-bmg:
> > NOTRUN -> FAIL (Intel XE#1178 / Intel XE#3304)
> >  * igt@kms_content_protection@lic-type-0@pipe-a-dp-1:shard-bmg:
> > NOTRUN -> FAIL (Intel XE#3304) +2 other tests fail
> >  * igt@kms_cursor_crc@cursor-onscreen-128x42:shard-lnl: NOTRUN ->
> > SKIP (Intel XE#1424) +1 other test skip
> >  * igt@kms_cursor_crc@cursor-sliding-512x170:shard-lnl: NOTRUN ->
> > SKIP (Intel XE#2321)
> >  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic:shard-lnl: NOTRUN ->
> > SKIP (Intel XE#309)
> >  * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests:shard-
> > lnl: NOTRUN -> SKIP (Intel XE#4422)
> >  * igt@kms_flip@2x-flip-vs-expired-vblank:shard-bmg: PASS -> FAIL
> > (Intel XE#3149 / Intel XE#3321)
> >  * igt@kms_flip@2x-flip-vs-expired-vblank@cd-dp2-hdmi-a3:shard-bmg:
> > PASS -> FAIL (Intel XE#3149)
> >  * igt@kms_flip@2x-wf_vblank-ts-check-interruptible:shard-lnl: NOTRUN
> > -> SKIP (Intel XE#1421) +1 other test skip
> >  * igt@kms_flip@flip-vs-suspend-interruptible:shard-bmg: PASS ->
> > INCOMPLETE (Intel XE#2049 / Intel XE#2597) +3 other tests incomplete
> >  * igt@kms_frontbuffer_tracking@drrs-slowdraw:shard-lnl: NOTRUN ->
> > SKIP (Intel XE#6312 / Intel XE#651) +2 other tests skip
> >  * igt@kms_frontbuffer_tracking@fbc-2p-rte:shard-lnl: NOTRUN -> SKIP
> > (Intel XE#656) +8 other tests skip
> >  * igt@kms_frontbuffer_tracking@psr-abgr161616f-draw-blt:shard-lnl:
> > NOTRUN -> SKIP (Intel XE#7061) +1 other test skip
> >  * igt@kms_joiner@invalid-modeset-force-ultra-joiner:shard-lnl:
> > NOTRUN -> SKIP (Intel XE#6900)
> >  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:shard-lnl:
> > NOTRUN -> SKIP (Intel XE#356)
> >  * igt@kms_plane@pixel-format-4-tiled-modifier@pipe-a-plane-5:shard-
> > lnl: NOTRUN -> SKIP (Intel XE#7130) +1 other test skip
> >  * igt@kms_plane_lowres@tiling-y:shard-lnl: NOTRUN -> SKIP (Intel
> > XE#599)
> >  * igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-a:shard-
> > lnl: NOTRUN -> SKIP (Intel XE#2763 / Intel XE#6886) +3 other tests
> > skip
> >  * igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf:shard-lnl: NOTRUN ->
> > SKIP (Intel XE#2893)
> >  * igt@kms_psr@pr-sprite-render:shard-lnl: NOTRUN -> SKIP (Intel
> > XE#1406) +2 other tests skip
> >  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:shard-lnl:
> > NOTRUN -> SKIP (Intel XE#3414 / Intel XE#3904)
> >  * igt@kms_vrr@negative-basic:shard-lnl: NOTRUN -> SKIP (Intel
> > XE#1499)
> >  * igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1:shard-lnl:
> > PASS -> FAIL (Intel XE#2142) +1 other test fail
> >  * igt@xe_configfs@survivability-mode:shard-lnl: NOTRUN -> SKIP
> > (Intel XE#6010 / Intel XE#7317)
> >  * igt@xe_eudebug@read-metadata:shard-lnl: NOTRUN -> SKIP (Intel
> > XE#4837) +3 other tests skip
> >  * igt@xe_evict@evict-mixed-threads-large-multi-vm:shard-lnl: NOTRUN
> > -> SKIP (Intel XE#6540 / Intel XE#688) +2 other tests skip
> >  * igt@xe_exec_balancer@twice-cm-parallel-rebind:shard-lnl: NOTRUN ->
> > SKIP (Intel XE#7482) +4 other tests skip
> >  *
> > igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalida
> > te-race:shard-lnl: NOTRUN -> SKIP (Intel XE#1392) +2 other tests skip
> >  * igt@xe_exec_fault_mode@twice-multi-queue-prefetch:shard-lnl:
> > NOTRUN -> SKIP (Intel XE#7136) +2 other tests skip
> >  * igt@xe_exec_multi_queue@one-queue-basic:shard-lnl: NOTRUN -> SKIP
> > (Intel XE#6874) +6 other tests skip
> >  *
> > igt@xe_exec_threads@threads-multi-queue-fd-userptr-invalidate:shard-
> > lnl: NOTRUN -> SKIP (Intel XE#7138) +2 other tests skip
> >  * igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit:shard-lnl: NOTRUN ->
> > SKIP (Intel XE#2229)
> >  * igt@xe_multigpu_svm@mgpu-concurrent-access-basic:shard-lnl: NOTRUN
> > -> SKIP (Intel XE#6964)
> >  * igt@xe_pm@d3cold-mmap-system:shard-lnl: NOTRUN -> SKIP (Intel
> > XE#2284 / Intel XE#366) +1 other test skip
> > Possible fixes *
> > igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic@pi
> > pe-b-edp-1:shard-lnl: DMESG-FAIL (Intel XE#1727) -> PASS +1 other
> > test pass
> >  * igt@kms_cursor_legacy@flip-vs-cursor-atomic:shard-bmg: FAIL (Intel
> > XE#7480) -> PASS
> >  * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:shard-
> > lnl: FAIL (Intel XE#301) -> PASS +1 other test pass
> >  * igt@kms_pm_dc@dc6-dpms:shard-lnl: FAIL (Intel XE#7340) -> PASS
> >  * igt@xe_evict@evict-mixed-many-threads-small:shard-bmg: INCOMPLETE
> > (Intel XE#6321) -> PASS
> >  * igt@xe_pm_residency@aspm_link_residency:shard-bmg: SKIP (Intel
> > XE#7258) -> PASS
> > Warnings * igt@kms_hdr@brightness-with-hdr:shard-bmg: SKIP (Intel
> > XE#3544) -> SKIP (Intel XE#3374 / Intel XE#3544)
> >  * igt@kms_tiled_display@basic-test-pattern:shard-bmg: SKIP (Intel
> > XE#2426) -> FAIL (Intel XE#1729)
> >  *
> > igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-single-vma:
> > shard-lnl: FAIL -> FAIL (Intel XE#5625)
> > Build changes * Linux: xe-4635-
> > a0a6a2fc5a08dc2e936c43e5d181dd0975a251a1 -> xe-pw-149888v3
> > IGT_8775: 8775
> >  xe-4635-a0a6a2fc5a08dc2e936c43e5d181dd0975a251a1:
> > a0a6a2fc5a08dc2e936c43e5d181dd0975a251a1
> >  xe-pw-149888v3: 149888v3
> 
