Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5284C8303C
	for <intel-xe@archiver.kernel.org>; Tue,  8 Jul 2025 07:53:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75A5F10E5BB;
	Tue,  8 Jul 2025 07:53:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fWiok7X9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A39B110E5BE
 for <intel-xe@lists.freedesktop.org>; Tue,  8 Jul 2025 07:52:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751961179; x=1783497179;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=X9Bi+w0hNfYa5IFZ0sENGhcRywA3Tsu5jGLJJQVX8P0=;
 b=fWiok7X9IU3QrTwcn53G9aKCJIVueORVRzUVUZvKqUlYvVkgXbR4cT9I
 2gssmlxXbPcR4L73auUEUWP7Z6h2cknMxIUufDswme6RbGe52o0FZx3xV
 uBMRzLu5PDbtPoOp0Cu1RmNw5WSMbH3I1Gw6zgnHpbk/ytaPB7uYVpMdI
 psQD2gpZK8edlfq80z0uL6V0z7aJDOqxhLLNkjKkcY9BpYoq2d5aYobJ7
 j1OfhbNagzVV/vE8BdbxnYR0V3P2EcxawbLdldfO4NV7knir4Ine4oDZX
 dVahm3TU+kZOwqxNrfjVNlIcxHibqQdThy/Y2atJJPufNzDcN2oKDaxT7 w==;
X-CSE-ConnectionGUID: BAtLxPBkQ86MeOQZtZCHYg==
X-CSE-MsgGUID: XyiY0wMlSnm6/lgkisSx0w==
X-IronPort-AV: E=McAfee;i="6800,10657,11487"; a="54284545"
X-IronPort-AV: E=Sophos;i="6.16,296,1744095600"; d="scan'208";a="54284545"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2025 00:52:56 -0700
X-CSE-ConnectionGUID: 8Ta975JSQcm+KrzEOo3v2g==
X-CSE-MsgGUID: n1FscYOCRtSfCT4ij6btZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,296,1744095600"; d="scan'208";a="159765423"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2025 00:52:57 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 8 Jul 2025 00:52:56 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 8 Jul 2025 00:52:56 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (40.107.237.88)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 8 Jul 2025 00:52:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Lxxn+4awmGEHKk4N4QpH47HD8W1mvJnPbaxi/hKU7vR9blOj69tuabUlC7OkFgu9QovtS7Pc8VUPhPUxFTdtld1ZAV0M0VAoaftcPQpTsK55sv2RLbuO82NDqHwNwAQfRo2LqGNuMZ6DFV10Kyrj1uyvWy3hI19mrmtfvLT9/22sG42rpSQKf2LxclAqwmYE4C238/I7ON6pJVNRuVry3rOiwpBZKxNwJWLogN1gAQfphbALH1PDg1HHkLtcbYf2Cflp6ddy9+mT4zOwI/CxPD6mqncbhvt7Vvihp0l5EUe/BauLyxRYdR99nwu4MOp8umH+X+xgxplkFt+uaUho5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2ycshlqQwBZ7l9uKggcoXOuV81Y9hPzjXkH/ZQLPhVQ=;
 b=pY1CKlhw7oZqVpgjrTwTHksTvcjqvb542wbYtP/b7nqZqUmL6jOUUnFk+8oQKj7ZawyOSCuj8g1SBllsENBelsB32W0YcIqEsCKHK3rnTgQ7UbXBrRojG8gphKtb6ny3QRzZAp0tdfqdvYA54xJl7JJ9sH1zQ9v7JNaQvrcev8m/SyASwggIrk1g4QVL+FWtArdEAIxywSI0XdTwDZhtnCumuA1P8D1vsivkQRfFMreCLqf9+pg7etdMwxaf6NqZsTa6WHVgDI6nkjns6p06wwE3zJuUXH8il25yM9emlurcnzzZy6AZqx7fwBqrIcHVv7NgXrV4lQ9KNg4jQkLKdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DM4PR11MB8159.namprd11.prod.outlook.com (2603:10b6:8:17d::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.23; Tue, 8 Jul
 2025 07:52:25 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.8901.018; Tue, 8 Jul 2025
 07:52:24 +0000
Date: Tue, 8 Jul 2025 00:54:08 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Tvrtko Ursulin
 <tvrtko.ursulin@igalia.com>, Umesh Nerlige Ramappa
 <umesh.nerlige.ramappa@intel.com>
Subject: Re: [PATCH 7/7] drm/xe: Waste fewer instructions in emit_wa_job()
Message-ID: <aGzOoH5SBRbSSYQo@lstrano-desk.jf.intel.com>
References: <20250703-lrc-refactors-v1-0-6aa22f174041@intel.com>
 <20250703-lrc-refactors-v1-7-6aa22f174041@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250703-lrc-refactors-v1-7-6aa22f174041@intel.com>
X-ClientProxiedBy: MW4P221CA0016.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:303:8b::21) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DM4PR11MB8159:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c36cb88-1f12-421d-79ca-08ddbdf460a9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?2GW5rXXAbNG3WzeHthfpzsk+ho4ZH0vM/9gZ0gdFuMkuhFHmVKDKboENz3rh?=
 =?us-ascii?Q?4Uug8676LAMzBzE9f8hergcViZd98FmMHDcMgVW+VNDP/TRDvGyDZfwpVxib?=
 =?us-ascii?Q?xzqC4DO16E6BKybwLHGe0sAhEKjAF7x5idS7bW/UYmRHfBPu8YU3wjwtsR7v?=
 =?us-ascii?Q?fofL0AjaOvxNLDZ/YxpCUa5lIjc9iPh95r1O2gJJ3S3nozsVEpJdlVMbu4dp?=
 =?us-ascii?Q?YTIavgOwN7fCxKr+7hpe8zcN1FdGw24CTj1pVNe/eLthhmvTaxszKovcDelF?=
 =?us-ascii?Q?w4fY+YEwQ1jbYk7pKiyF79nE1UbARa/EafJfM68IuLmNOw1NjIKwdFWhfNJb?=
 =?us-ascii?Q?i+d6Wn/Y5XzGcwg0s7LLWcXlvsfv/6YwKhfgpKp5kp0kGuJb8PPfVTJDZm9M?=
 =?us-ascii?Q?7jtVWVWEnSDrXioWs1KfpEjymszO7AOzHy/02QikyUJ/4Xx8vmldJDWaDCkB?=
 =?us-ascii?Q?q1UQxxTd4a30rizMP/2qWyF6m4lnyqDaPs86eib2i0Hm22hHTDd7c45UuxIa?=
 =?us-ascii?Q?ZoSXueG/ifUnSqEC5HyU6/EBl5JgCBmEhTq+3oCaH/8sBPmS5tzZetk/BMXk?=
 =?us-ascii?Q?LMCo4K1FFF1Dez2lmKdUPso+IYPCtMAfbUJErZ7J+q5PQVAA/eQKkt/HNjzw?=
 =?us-ascii?Q?5YQkhepnKWiSU7vCJx26IA/cMxfNMLQxsYMttLk7BxVqduyPFctQecsbrLWc?=
 =?us-ascii?Q?CU4cD3e64+Im5oqJl3Hm17NouRNH5Ap7TZCyjh6oMoq48DCQoXRmwMUDj7cO?=
 =?us-ascii?Q?NU6lx4hsP0qHfnJ1wLgz6J44QQodVOwRqi/Gv2tu8W39a6jz2GQLq7ky3ur6?=
 =?us-ascii?Q?PZQ3lu65SprKlMW1QsljcekvO121c9g9YMhxxc+QCXLyfXZlH7sJxch8qFSj?=
 =?us-ascii?Q?/DbYv930LWbrbF/WSFeBwHCa53VW2xbMYRYr6fr2y/o2/dsVlo69knEu/5tU?=
 =?us-ascii?Q?nWBhKGfAczU7BiyG1qUUlbmt1YdIh2o1lU6Ys9uOmTW2fWgWG0Q3SDmCvaAk?=
 =?us-ascii?Q?xsDgMqxDRJkADQhccNZWHiuFC9iX4DUyQCSs+IIxnIg8pFnXKgm0WeqUK90/?=
 =?us-ascii?Q?Dpg5IbxxULT+TP4Zb8Tei0BSTYQWDJYaU01Zj8J58uuN/7It0CmtVi9dcBd5?=
 =?us-ascii?Q?S+yPBpWJwdX9xTxrciUFUE1Gal/TSTBmqTpFxBurDw7TlEIpDn+qKNPumHT0?=
 =?us-ascii?Q?mypVGLfqMVnZ+WrpGYJTJFSTQh29P5UKQMip5Xb1E3hcV6VwXCwEYNMV7IPw?=
 =?us-ascii?Q?TMNFezs8dU3n2T4B/p+msxPdF6/r124xOUTttnGcY7dDWPgGiQGGOIV/GpRu?=
 =?us-ascii?Q?YQnc016jOx5O8jZ4rqR4mg40Mq6+G8SQnLlsZ28qvs0Yfijp79p3N7NGdqn/?=
 =?us-ascii?Q?+4J7LUecfPI0I7oCQdECox+hLY5jhF/lq5IeKrHPrh4gwAzRh1oTnLA7HOmg?=
 =?us-ascii?Q?HpGtCpXMij0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/pVDa/3dKEgzFo3lLy0GM489ZRa+ytuyfuSp5AL1uy7orNDJ4mm6exrsBL4A?=
 =?us-ascii?Q?CYLO7rBbchL09lcxWG6LEIgb+0EA250PJJ4Lc5xYNerPwQX0ATYkPRXAe72a?=
 =?us-ascii?Q?0txnUC0oHDFMT6pr9YDfEkQ1QHZrb3raQW4YY0oN3ArlYAip/5c7dH4Vq6hL?=
 =?us-ascii?Q?5UWe+jMvU3F2pu9WdMnlJEDiDlofO0fChIBP748/I6OdmsiOqWHRHufbyXPS?=
 =?us-ascii?Q?7oNM+413JCTTZbR3qCFdJPKnPuo/Zctx+/RMopa1KdsYzNtNCWc9av4p0+5q?=
 =?us-ascii?Q?6DqYUnPa1XncYYdY0UKqe0fv5668ydrvSO0UIN7J7NwAiB0g+fmkbwljwVzO?=
 =?us-ascii?Q?+AXmWFtV4dtenCGODlJPdSxrgVtqU74fTVtAzssASKNx9S/R4eHHY1LPravR?=
 =?us-ascii?Q?i7tA5CWYB7HDhimr0mHvMIk8UpHwQaxUl3RmeSDjuVBwSuDH4otmyG4NSJJG?=
 =?us-ascii?Q?+v5SYQcX/hjGHHhziqU8bbHRumXCzZT8MSmz9uVCK+Pyt34+O4LEgU78gr8c?=
 =?us-ascii?Q?phNH0v2CKdY7w3iGwkuU9iPHf2TnuEQIhvvyippULsq0N5aOHpioyxVS1yBZ?=
 =?us-ascii?Q?7Cx8Ew9P2mGP95E7RZ3Yo4GBDev3GCmv9OxlivnfGblMmQmzettKdFju40NE?=
 =?us-ascii?Q?eQMFhBvNBp+3fCeG2uixw1ND1+RuIujlY9fnSIBw1+MTlvYg/o4epZ1TELit?=
 =?us-ascii?Q?/9dEPL6k2T4pCi8ght/zOey+UGutCB3uGNwWWwaozn1LQ+HHUyOJkCJGZvYm?=
 =?us-ascii?Q?N2DfkA1niiGQxRSQ4G4ajr4n5l3nUgRbex3rZFCtAQD0p4/SGTj+FFlSNyHL?=
 =?us-ascii?Q?oFVopXSnhtatYzyY9V+5tZhrXXZL10szPJ+t/NTLR4zLbTlWI0HSl//JdTQu?=
 =?us-ascii?Q?PFxpTcvbVlC2LjjuxmXubtXXXGO6Me9n0vmO0HA4vxEm9GQm88cQdF30L3v6?=
 =?us-ascii?Q?rZqsG6WmcT6IU4IBxGeEj1O9UhGk9uFFRcAXggJpTFsNyUgCoaLYLgE2n02Y?=
 =?us-ascii?Q?7uP/PoLco8+4SifFxWzZK+spPGZ8ijGOmGl9YRw/1sk2Cjd5UI8IoQKQy8sE?=
 =?us-ascii?Q?oQJXLdx67Ap+1q/3HJqExHGz6BALLcqJO8xZXJcUDF+YL5trE2rtqYRRHWpu?=
 =?us-ascii?Q?y8OHbBm2NufVZmaw8CAwKGpLeV4I9ryy3kHm2rdYxC+wPzGbZ+1uuTqBhqAd?=
 =?us-ascii?Q?iZQvRzidmvrKvdzAZ1OU6QWjqOTcLRzPysTzxGljPjz2St3BBtDU4nLj+Ghl?=
 =?us-ascii?Q?iMT4QRUMbsmd8dqGT3ni7kh4Ag27EJkCd24WrYpl1PwXO96eBzzttQ9jQEx0?=
 =?us-ascii?Q?o7XdoYaMsucJqgHvKKh94YOIsJMgsw8YjoSX/HQX1tXEE2TGkGrPqLm/dCbq?=
 =?us-ascii?Q?LvHEeI69w29mEOy0vOEpoGCZJVF4QWGLHfP00VnOL3owT/OZeIuKvWI+ab46?=
 =?us-ascii?Q?/hIqfYWunz0Vkz7UI8je/Oq9umfJwkwLmsrcCGkFuWG6+rYDzRzbQWofbmta?=
 =?us-ascii?Q?qV1k2cfqzfq26qb60WxWf3oiGRvTTPtIPA3PXJLeqJdJDqthu82V4NlezNtb?=
 =?us-ascii?Q?pOv5GYiw45JUdqPYFKDBgPU5xO9Ze8A9QyvjbYCN3r/szJnXRJL9ulnsQFFA?=
 =?us-ascii?Q?Ow=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c36cb88-1f12-421d-79ca-08ddbdf460a9
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2025 07:52:24.9390 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S1+fRz67q6155yrZKhQOCtdSE6x2f5rGd3wWWk8GvB7hNvHkNUShRSfjslTelhPJ+7rsdi6wTyy4HVUB7ex3hQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB8159
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

On Thu, Jul 03, 2025 at 03:41:16PM -0700, Lucas De Marchi wrote:
> From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> 
> I was debugging some unrelated issue and noticed the current code was
> very verbose. We can improve it easily by using the more common batch
> buffer building pattern.
> 

This patch doesn't touch a hot path, but it's still a good cleanup.

xe_ring_ops.c uses this coding pattern and is a hot path, so we should
likely apply the same pattern there as well.

Anyway:
Reviewed-by: Matthew Brost matthew.brost@intel.com

Matt

> Before:
>                 bb->cs[bb->len++] = MI_LOAD_REGISTER_REG | MI_LRR_DST_CS_MMIO;
>      c4d:       41 8b 56 10             mov    0x10(%r14),%edx
>      c51:       49 8b 4e 08             mov    0x8(%r14),%rcx
>      c55:       8d 72 01                lea    0x1(%rdx),%esi
>      c58:       41 89 76 10             mov    %esi,0x10(%r14)
>      c5c:       c7 04 91 01 00 08 15    movl   $0x15080001,(%rcx,%rdx,4)
>                         bb->cs[bb->len++] = entry->reg.addr;
>      c63:       8b 08                   mov    (%rax),%ecx
>      c65:       41 8b 56 10             mov    0x10(%r14),%edx
>      c69:       49 8b 76 08             mov    0x8(%r14),%rsi
>      c6d:       81 e1 ff ff 3f 00       and    $0x3fffff,%ecx
>      c73:       8d 7a 01                lea    0x1(%rdx),%edi
>      c76:       41 89 7e 10             mov    %edi,0x10(%r14)
>      c7a:       89 0c 96                mov    %ecx,(%rsi,%rdx,4)
>  ..etc..
> 
> After:
>                 *cs++ = MI_LOAD_REGISTER_REG | MI_LRR_DST_CS_MMIO;
>      c52:       41 c7 04 24 01 00 08    movl   $0x15080001,(%r12)
>      c59:       15
>                         *cs++ = entry->reg.addr;
>      c5a:       8b 10                   mov    (%rax),%edx
>  ..etc..
> 
> Resulting in the following binary change:
> 
> 	add/remove: 0/0 grow/shrink: 0/2 up/down: 0/-348 (-348)
> 	Function                                     old     new   delta
> 	xe_gt_record_default_lrcs.cold               304     296      -8
> 	xe_gt_record_default_lrcs                   2200    1860    -340
> 	Total: Before=13554, After=13206, chg -2.57%
> 
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt.c  | 76 ++++++++++++++++++++++++---------------------
>  drivers/gpu/drm/xe/xe_lrc.c | 12 ++++---
>  drivers/gpu/drm/xe/xe_lrc.h |  2 +-
>  3 files changed, 49 insertions(+), 41 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index 439e7c703ed84..92c92f8aeae05 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -194,6 +194,7 @@ static int emit_wa_job(struct xe_gt *gt, struct xe_exec_queue *q)
>  	unsigned long idx;
>  	struct xe_bb *bb;
>  	size_t bb_len;
> +	u32 *cs;
>  
>  	/* count RMW registers as those will be handled separately */
>  	xa_for_each(&sr->xa, idx, entry) {
> @@ -221,10 +222,12 @@ static int emit_wa_job(struct xe_gt *gt, struct xe_exec_queue *q)
>  	if (IS_ERR(bb))
>  		return PTR_ERR(bb);
>  
> +	cs = bb->cs;
> +
>  	if (count) {
>  		/* Emit single LRI with all non RMW regs: 2 dw per reg */
>  
> -		bb->cs[bb->len++] = MI_LOAD_REGISTER_IMM | MI_LRI_NUM_REGS(count);
> +		*cs++ = MI_LOAD_REGISTER_IMM | MI_LRI_NUM_REGS(count);
>  
>  		xa_for_each(&sr->xa, idx, entry) {
>  			struct xe_reg reg = entry->reg;
> @@ -239,8 +242,8 @@ static int emit_wa_job(struct xe_gt *gt, struct xe_exec_queue *q)
>  
>  			val |= entry->set_bits;
>  
> -			bb->cs[bb->len++] = reg.addr;
> -			bb->cs[bb->len++] = val;
> +			*cs++ = reg.addr;
> +			*cs++ = val;
>  			xe_gt_dbg(gt, "REG[0x%x] = 0x%08x", reg.addr, val);
>  		}
>  	}
> @@ -252,46 +255,49 @@ static int emit_wa_job(struct xe_gt *gt, struct xe_exec_queue *q)
>  			if (entry->reg.masked || entry->clr_bits == ~0)
>  				continue;
>  
> -			bb->cs[bb->len++] = MI_LOAD_REGISTER_REG | MI_LRR_DST_CS_MMIO;
> -			bb->cs[bb->len++] = entry->reg.addr;
> -			bb->cs[bb->len++] = CS_GPR_REG(0, 0).addr;
> -
> -			bb->cs[bb->len++] = MI_LOAD_REGISTER_IMM | MI_LRI_NUM_REGS(2) |
> -					    MI_LRI_LRM_CS_MMIO;
> -			bb->cs[bb->len++] = CS_GPR_REG(0, 1).addr;
> -			bb->cs[bb->len++] = entry->clr_bits;
> -			bb->cs[bb->len++] = CS_GPR_REG(0, 2).addr;
> -			bb->cs[bb->len++] = entry->set_bits;
> -
> -			bb->cs[bb->len++] = MI_MATH(8);
> -			bb->cs[bb->len++] = CS_ALU_INSTR_LOAD(SRCA, REG0);
> -			bb->cs[bb->len++] = CS_ALU_INSTR_LOADINV(SRCB, REG1);
> -			bb->cs[bb->len++] = CS_ALU_INSTR_AND;
> -			bb->cs[bb->len++] = CS_ALU_INSTR_STORE(REG0, ACCU);
> -			bb->cs[bb->len++] = CS_ALU_INSTR_LOAD(SRCA, REG0);
> -			bb->cs[bb->len++] = CS_ALU_INSTR_LOAD(SRCB, REG2);
> -			bb->cs[bb->len++] = CS_ALU_INSTR_OR;
> -			bb->cs[bb->len++] = CS_ALU_INSTR_STORE(REG0, ACCU);
> -
> -			bb->cs[bb->len++] = MI_LOAD_REGISTER_REG | MI_LRR_SRC_CS_MMIO;
> -			bb->cs[bb->len++] = CS_GPR_REG(0, 0).addr;
> -			bb->cs[bb->len++] = entry->reg.addr;
> +			*cs++ = MI_LOAD_REGISTER_REG | MI_LRR_DST_CS_MMIO;
> +			*cs++ = entry->reg.addr;
> +			*cs++ = CS_GPR_REG(0, 0).addr;
> +
> +			*cs++ = MI_LOAD_REGISTER_IMM | MI_LRI_NUM_REGS(2) |
> +				MI_LRI_LRM_CS_MMIO;
> +			*cs++ = CS_GPR_REG(0, 1).addr;
> +			*cs++ = entry->clr_bits;
> +			*cs++ = CS_GPR_REG(0, 2).addr;
> +			*cs++ = entry->set_bits;
> +
> +			*cs++ = MI_MATH(8);
> +			*cs++ = CS_ALU_INSTR_LOAD(SRCA, REG0);
> +			*cs++ = CS_ALU_INSTR_LOADINV(SRCB, REG1);
> +			*cs++ = CS_ALU_INSTR_AND;
> +			*cs++ = CS_ALU_INSTR_STORE(REG0, ACCU);
> +			*cs++ = CS_ALU_INSTR_LOAD(SRCA, REG0);
> +			*cs++ = CS_ALU_INSTR_LOAD(SRCB, REG2);
> +			*cs++ = CS_ALU_INSTR_OR;
> +			*cs++ = CS_ALU_INSTR_STORE(REG0, ACCU);
> +
> +			*cs++ = MI_LOAD_REGISTER_REG | MI_LRR_SRC_CS_MMIO;
> +			*cs++ = CS_GPR_REG(0, 0).addr;
> +			*cs++ = entry->reg.addr;
>  
>  			xe_gt_dbg(gt, "REG[%#x] = ~%#x|%#x\n",
>  				  entry->reg.addr, entry->clr_bits, entry->set_bits);
>  		}
>  
>  		/* reset used GPR */
> -		bb->cs[bb->len++] = MI_LOAD_REGISTER_IMM | MI_LRI_NUM_REGS(3) | MI_LRI_LRM_CS_MMIO;
> -		bb->cs[bb->len++] = CS_GPR_REG(0, 0).addr;
> -		bb->cs[bb->len++] = 0;
> -		bb->cs[bb->len++] = CS_GPR_REG(0, 1).addr;
> -		bb->cs[bb->len++] = 0;
> -		bb->cs[bb->len++] = CS_GPR_REG(0, 2).addr;
> -		bb->cs[bb->len++] = 0;
> +		*cs++ = MI_LOAD_REGISTER_IMM | MI_LRI_NUM_REGS(3) |
> +			MI_LRI_LRM_CS_MMIO;
> +		*cs++ = CS_GPR_REG(0, 0).addr;
> +		*cs++ = 0;
> +		*cs++ = CS_GPR_REG(0, 1).addr;
> +		*cs++ = 0;
> +		*cs++ = CS_GPR_REG(0, 2).addr;
> +		*cs++ = 0;
>  	}
>  
> -	xe_lrc_emit_hwe_state_instructions(q, bb);
> +	cs = xe_lrc_emit_hwe_state_instructions(q, cs);
> +
> +	bb->len = cs - bb->cs;
>  
>  	if (bb->len)
>  		xe_gt_dbg(gt, "LRC WA %s save-restore batch: %u dw", sr->name, bb->len);
> diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
> index 2c735b3679f86..897aebaf4c1f6 100644
> --- a/drivers/gpu/drm/xe/xe_lrc.c
> +++ b/drivers/gpu/drm/xe/xe_lrc.c
> @@ -1790,7 +1790,7 @@ static const struct instr_state xe_hpg_svg_state[] = {
>  	{ .instr = CMD_3DSTATE_DRAWING_RECTANGLE, .num_dw = 4 },
>  };
>  
> -void xe_lrc_emit_hwe_state_instructions(struct xe_exec_queue *q, struct xe_bb *bb)
> +u32 *xe_lrc_emit_hwe_state_instructions(struct xe_exec_queue *q, u32 *cs)
>  {
>  	struct xe_gt *gt = q->hwe->gt;
>  	struct xe_device *xe = gt_to_xe(gt);
> @@ -1825,7 +1825,7 @@ void xe_lrc_emit_hwe_state_instructions(struct xe_exec_queue *q, struct xe_bb *b
>  	if (!state_table) {
>  		xe_gt_dbg(gt, "No non-register state to emit on graphics ver %d.%02d\n",
>  			  GRAPHICS_VER(xe), GRAPHICS_VERx100(xe) % 100);
> -		return;
> +		return cs;
>  	}
>  
>  	for (int i = 0; i < state_table_size; i++) {
> @@ -1848,12 +1848,14 @@ void xe_lrc_emit_hwe_state_instructions(struct xe_exec_queue *q, struct xe_bb *b
>  		    instr == CMD_3DSTATE_DRAWING_RECTANGLE)
>  			instr = CMD_3DSTATE_DRAWING_RECTANGLE_FAST;
>  
> -		bb->cs[bb->len] = instr;
> +		*cs = instr;
>  		if (!is_single_dw)
> -			bb->cs[bb->len] |= (num_dw - 2);
> +			*cs |= (num_dw - 2);
>  
> -		bb->len += num_dw;
> +		cs += num_dw;
>  	}
> +
> +	return cs;
>  }
>  
>  struct xe_lrc_snapshot *xe_lrc_snapshot_capture(struct xe_lrc *lrc)
> diff --git a/drivers/gpu/drm/xe/xe_lrc.h b/drivers/gpu/drm/xe/xe_lrc.h
> index eb6e8de8c939e..b6c8053c581ba 100644
> --- a/drivers/gpu/drm/xe/xe_lrc.h
> +++ b/drivers/gpu/drm/xe/xe_lrc.h
> @@ -112,7 +112,7 @@ void xe_lrc_dump_default(struct drm_printer *p,
>  			 struct xe_gt *gt,
>  			 enum xe_engine_class);
>  
> -void xe_lrc_emit_hwe_state_instructions(struct xe_exec_queue *q, struct xe_bb *bb);
> +u32 *xe_lrc_emit_hwe_state_instructions(struct xe_exec_queue *q, u32 *cs);
>  
>  struct xe_lrc_snapshot *xe_lrc_snapshot_capture(struct xe_lrc *lrc);
>  void xe_lrc_snapshot_capture_delayed(struct xe_lrc_snapshot *snapshot);
> 
> -- 
> 2.49.0
> 
