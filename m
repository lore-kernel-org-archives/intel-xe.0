Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9068DC3DA7E
	for <intel-xe@archiver.kernel.org>; Mon, 29 Jul 2024 18:57:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57E7910E470;
	Mon, 29 Jul 2024 18:57:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KnRX1N03";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4598310E470
 for <intel-xe@lists.freedesktop.org>; Mon, 29 Jul 2024 18:57:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722279426; x=1753815426;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=TJtVsn+d2t1SQM+1nFOPY7AS60xxSL8XKYcq5V29Z6A=;
 b=KnRX1N03O9zi6Cq1NCqY63+dda6isvyhhpXa4DRK7tdaJ23iU9PdHnb7
 e50py0HMHYT6YTLs0VMUVadREueJRwmEyu+TNuOD99o8YblGOPhhAu4Dg
 2cKS3CllPjMOgsGqIzMZlXeuog3iTlSBqT93u0Yvd0lHbqO2UEambb2sN
 QdUi8N6bz5VVcQLYphMHAO57rzEa1glyuJypG/M6VmQMblHuVBwGiyZZo
 XpucPEMBX72Sa2Z4R3OmY/OEAUBvgw/D5ypw/f/j52i06bASPwYnSien/
 BaZgn/XCo6bAVvS+NXbCIjuwpsqnp+I+3AvzZgm3bVW6jKjdvswZfpYqB A==;
X-CSE-ConnectionGUID: 0tzNBHtUQjmDKwboQLNwaw==
X-CSE-MsgGUID: tjhdfotWTMacCTDlYZkHHA==
X-IronPort-AV: E=McAfee;i="6700,10204,11148"; a="19657665"
X-IronPort-AV: E=Sophos;i="6.09,246,1716274800"; d="scan'208";a="19657665"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2024 11:57:06 -0700
X-CSE-ConnectionGUID: V3Yzluc1RLeZzoe7dy9S0w==
X-CSE-MsgGUID: bZUTNtdGS0GkGBrSjEle+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,246,1716274800"; d="scan'208";a="53999784"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Jul 2024 11:57:06 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 29 Jul 2024 11:57:05 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 29 Jul 2024 11:57:05 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.45) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 29 Jul 2024 11:57:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u9G/dB3dEM9wet6unOlyBW7uv+Fwqsb4elIrdaFWidcXPXJMAgXCVjJRyQ6lQ73ivKh4XEmyGPTjHC6GuDLNYeey+UM1e6N6+UEz5F517/oxRMh0zcDi3u9IvL75rFazw4tDTDiHWGd1ud1kkSK4xMIYk3M6xXZIgrYXlZi6oJtYxHNPiMlIa3i9IF/zFaqYZNrw9SptP4owNCwKHieXDOAIl5nOZLd8uXt9BFW04Srzd3/66fIG2IK+NsJqGqFRzL0N67+QJdZcSzcHSSgCMEc2zKFz+VZIkCvojhK9j/GpihSCcAA8zpzu2+rj7TDOSIVE6X0AjUbpzkbIFjjRdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Elr9vxQX28oH765bPBNYEc3xMrbo5Yxt7gzT0iGcIwE=;
 b=H0eqdsH5PAz6vJIFp67COyTB7pzWH8CiYC6oQXEA4o91MCloHiZfwPtSuWxk4JlhiWx3mat+p3pQN/RT2z39YYzQ+OATemd7l3CzdcsvYBvR2aWHtWgG2f4kkAvRrjSqUpNgunkW8J1GEYI70cg18MMAur4dgZb5+QjCNsk4Cn/EvyJgceG740xVhq1QkJIfApvXIwHBCdlYDjYEsZ/YHi0ZLEnOhXnwWsr0yhvw3Y5dGirLHG0CzRJ7+qoa/kTD2GiNiq5+IVGJNopnEsSyoacUDEp5wkfINZu+qAQwKVUYyga3kXw9AvuX5Pg89y4E6F0Zm7SbN2e3IlmcRfu+mA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DM6PR11MB4564.namprd11.prod.outlook.com (2603:10b6:5:2a0::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.28; Mon, 29 Jul
 2024 18:57:02 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%7]) with mapi id 15.20.7807.026; Mon, 29 Jul 2024
 18:57:02 +0000
Date: Mon, 29 Jul 2024 13:56:59 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Mika Kuoppala <mika.kuoppala@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, Andi Shyti <andi.shyti@intel.com>,
 Maciej Patelczyk <maciej.patelczyk@linux.intel.com>, Jonathan Cavitt
 <jonathan.cavitt@intel.com>
Subject: Re: [PATCH 04/21] kernel: export ptrace_may_access
Message-ID: <lhttqxykljzk565vzudn7qzpxuljjcki5ylzuhfthq7tilyq4m@mdnvuj7kvp6f>
References: <20240726140818.54304-1-mika.kuoppala@linux.intel.com>
 <20240726140818.54304-5-mika.kuoppala@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240726140818.54304-5-mika.kuoppala@linux.intel.com>
X-ClientProxiedBy: MW4PR04CA0302.namprd04.prod.outlook.com
 (2603:10b6:303:82::7) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DM6PR11MB4564:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a12ba3b-c695-46ac-96f7-08dcb0003b48
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?zzH0Kq/9rJxOaJu1gMAULGrw69N0fhp61Of1o/2Q18X/DeTc9YmuvlvgcuGk?=
 =?us-ascii?Q?kYPu9MDa1ZvytSMllFdEv8IRANg38I5rkc2D+XOz7tDoaFWpuafo3Zl6KXoe?=
 =?us-ascii?Q?cj8fk+/P2c3hgDBms1a3Ch7vBqDejOfVoRcVBckIaBR7s4u3pcNldDMPaulh?=
 =?us-ascii?Q?CnXJSujPcyVUAPnkGk0yLtKfuMTXFQKGOPswkb2aaUMUdw+gtQyalULnJvMI?=
 =?us-ascii?Q?67KyExOepisZhodNF5fg8RS7vyPzjCSsf6XeKoAYfvScLIyJt2yxM+tG8vKF?=
 =?us-ascii?Q?MbvFykae0aojMUzNeVRetKZBPm7GjnPeiAN86+T/DYd54N45Lo4LZ77MtqWe?=
 =?us-ascii?Q?t3F22bST6Ca23cNHZdRhmdusIDvCwdYgftdgXTJerb/mhtPBayH1ZfOEPsGf?=
 =?us-ascii?Q?2tutvhfF79rDuDnY1ZBpwZuL5++G7ipnJcYcQZi4uC66Ehodwby1Byw+Op5v?=
 =?us-ascii?Q?mi20BHXRkHaXKjWfCSmdKv/pWuirHflpix0Akh0olXXki6Uu5Ht+8JEt9Rv5?=
 =?us-ascii?Q?4AbiUhKI7e9Naa2E4E+tw2/fi9s7VFTuPr0vuEyezxmXblRhRDY9oK80Mptz?=
 =?us-ascii?Q?2G0nsFz9tcUF2Vl2212wN+UX3Yw4HxoVnVqV+b62ZS+MOjdGngFMvzdGuZKM?=
 =?us-ascii?Q?zyPCzeNGQxCqakDY3rbr+HxxpTunc+EyrQrr9mtUYO46KWgyi65XUz4VCv4S?=
 =?us-ascii?Q?EPWfvNK1oM8B3Jvu2Q+S4agJqrxvXBSGtNgJ3X4/zYupfuMoQYqcuz+q8c9I?=
 =?us-ascii?Q?HST1W9JOIFBP2IPQ4egLkFKaR/zYDZWezzcqrjmM5joMxjc8aOpPghKUtL23?=
 =?us-ascii?Q?N5p2AQ4nXFA0JMK9+dKh8Gw4fZqybI5BYiLPa7c25v0ZuM4m8nw+qlu7RPAz?=
 =?us-ascii?Q?IspZ2qU/4BxdfMnmz+zZDLECSum2QdBPpP/VZ2A6AmxTvg/OKO3wA9K25GEj?=
 =?us-ascii?Q?HC5leFzM4eTvf0OxC2jEXT9wzSQ/4nmfR5HuKJcymqOWLRGAzYRTB7ayb6KH?=
 =?us-ascii?Q?btaxbeV3NdLspvKAMAVfZGGdk2wjferZ0pFtXTDzoPPc/fXmtC1PSuf1OBH9?=
 =?us-ascii?Q?SZKEa7AiTV+7h38Yok8JkNw2xsk9A78cCGwMBlXp6qIJt7X1pBzbGMIksYA3?=
 =?us-ascii?Q?yrBDvpYQmbpWepdhFzxZcpnAiCP/uJOovuyxN+6J68fV8qagsYkEiNOA39EK?=
 =?us-ascii?Q?UFiz+roxM4ZcIS+mPpO4uitCQGG3V0H10S91O96zk7CemMsKJqqbtcTLmx/y?=
 =?us-ascii?Q?Dx7VVUSGIhOzpm11hnedg77A4TtqDBzijmg3Ovl0jEI08n8LKJ+AG33JNGgo?=
 =?us-ascii?Q?FutWn8JQmtbbMzHVxhzSz/sMfp43DeKgiaPi6H/vELhDcA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?uOv27dnf3ZBsZuOI3KJ9AIFBZW7ABq9pOmh9ItHKyaQelXhPVVOyhxFAJdSI?=
 =?us-ascii?Q?gMOXYzKfSPMM2ugIrxUHRzklofqJaie8CukeeoNXsri2myWxIAvCmEtDEfQk?=
 =?us-ascii?Q?HUr/Z0menEhLwq9MmYb28F1UnedRbgX2b/lD8yUK2G92Si8Ngl9b96EuDjNS?=
 =?us-ascii?Q?LQdu8oxwLhlmpoCw6Uw5UfslK4Iqa+MPdWC5HyB8PTqTmWG9BQed2MlQ3Fj9?=
 =?us-ascii?Q?6Wk4ErX9N+RmMim2ORB3MgDSIOXCEDcS5bMSAqduMkhw3MtMq8fNIrcRJud7?=
 =?us-ascii?Q?9xZl+zotuMO0vC6SHob8BqU208RpuazCtQieWGfAQOSZnBjMesAUzFQJ3cqA?=
 =?us-ascii?Q?3mzuE3mCi7l4XD3A6OyjAXkmPkxJY4NPohcAj5sqsHGhGvSndsahA7W2ipTp?=
 =?us-ascii?Q?S3EpngNIvK5/vWXOAofGgsKipeoDMXJzL52pMHMHZ9ajHo9vOwWSiV+rSyud?=
 =?us-ascii?Q?Y64djOUqu6h5vV42BbjQ58I97k/yOHWwa2VwaK15UQi8TrZtSMTewaQYwO9G?=
 =?us-ascii?Q?VqC7rv17/nZBKP8rQcl9pKhRQgI+ZB3eAEymd9YbXv2krIAuLUBYc0GuEUYA?=
 =?us-ascii?Q?aeF9R24AXAOOSjjqVk9WIX0AJoGbcCaNNOWzLWlfT+wb4b4ww12PSmjxcc4E?=
 =?us-ascii?Q?+orQauUFkzhTaB1VEYKcThtmZfRrifC52I9rPIybwdoTjtSlSy3BoOp3myzV?=
 =?us-ascii?Q?QI6QNM+5O+QaW8GSx0cJ3BRUE7718KOqDHTSx+iAJ4fw3HcQLiQMTzgxk8dK?=
 =?us-ascii?Q?UOygJDYW82ZL78fdRhgZbHBC1bhfNN5r2RDHHj78JtG64uemHx/OBcfHXEZV?=
 =?us-ascii?Q?+Lw/txqZAvFYwBeZEMvYMbnZy6sYHeg5gRupxacOmPnHeYpNxOwqgAeozxqH?=
 =?us-ascii?Q?ONEMKpTBUf3HtM8NNqvXfsOD9K+RYuYx4761YXOg+LB+7fNDwz1dVTIO+B24?=
 =?us-ascii?Q?GOtwj5N1BkKsXiaRA9X2PmY5Lkc4Pcr3AAnwG/RvQM1IVsmN3YuDdUL7YR5i?=
 =?us-ascii?Q?TPGt9pTZy4FMTz0krkWBeev7n96h1nfMVJehWUnErw4eDsNiuBckcqqpGrCJ?=
 =?us-ascii?Q?nJaFxsrlgIH8SjWwZTkr3ZRUeVGjyV18iANpuIbOkbgUdGFSwqtakgaZeAEP?=
 =?us-ascii?Q?xACx2brbHKqMouTP8Ev+ptvq8930KVtD/g7WEyyJVAjTzyBR6rCt8G43nWmm?=
 =?us-ascii?Q?DQbS142yZa+tTGzc3w3Vo3qaNzkjiyU684m/Ksbc77eA3e7Fr8fqGAmwhaQi?=
 =?us-ascii?Q?tQOGA+iq5wJ0swXWPJuUexBAYbFhDskX8hWhd/jGt4tHURtVf1bqtw8rp0F7?=
 =?us-ascii?Q?48/n062GSUWC0P3EE2j55qvg5gkLMJrtnSIjQinaddQmpIxKrcM8snrfCLFO?=
 =?us-ascii?Q?nIP8yBMRZYb282p8WVzYtBLZGgbjsokp8Vbi78WaIFPlczCT6MAoZiRkJnqQ?=
 =?us-ascii?Q?1HMgwj6n+wOKfdzDGgZrO0jwgnxYx00Y2lRVIzBY/80SUAHJniiycYkdhScg?=
 =?us-ascii?Q?xjOv0CtSRZ0mUg6URT3wbQFtkB1MdEgIeagO9MN4R4B+RzlfgOaGlQvRji97?=
 =?us-ascii?Q?9nEZj1UDdgHhzaT8OayKmWi3ohE7/JE9ZySeDRS4APId5bRXlL0wpde52QkC?=
 =?us-ascii?Q?Yw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a12ba3b-c695-46ac-96f7-08dcb0003b48
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2024 18:57:02.2992 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HABPcyhsNBwQcBYfRo4eyIwE4oNBBdM3w1DIPnmxlhXFSN5bSSn/NoTg6xUZ29q02+ymtP1D4jUvQjnMXZ+fZGJIIoFQUR9A6EgwM7+CPdw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4564
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

On Fri, Jul 26, 2024 at 05:08:01PM GMT, Mika Kuoppala wrote:
>We need to export ptrace_may_access to be able to
>allow debugger connection to check for debuggee access and
>at the same time allow xe.ko module build.

I don't follow this explanation, particularly this last line.
Based on other patches you want to export the function because it would
cause the calling process to manipulate another process. Like described
in Documentation/process/adding-syscalls.rst.

The reason to export this function is that this comes as an ioctl to the
xe driver, which may be built as a module.

>
>CC: Lucas De Marchi <lucas.demarchi@intel.com>
>Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
>CC: Andi Shyti <andi.shyti@intel.com>
>CC: Maciej Patelczyk <maciej.patelczyk@linux.intel.com>
>Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>

$ ./scripts/get_maintainer.pl  kernel/ptrace.c
Oleg Nesterov <oleg@redhat.com> (maintainer:PTRACE SUPPORT)
linux-kernel@vger.kernel.org (open list)

and I don't see these Cc'ed. Also the commit title should likely start
with "ptrace:" rather than "kernel:"

Lucas De Marchi

>---
> kernel/ptrace.c | 1 +
> 1 file changed, 1 insertion(+)
>
>diff --git a/kernel/ptrace.c b/kernel/ptrace.c
>index d5f89f9ef29f..86be1805ebd8 100644
>--- a/kernel/ptrace.c
>+++ b/kernel/ptrace.c
>@@ -354,6 +354,7 @@ bool ptrace_may_access(struct task_struct *task, unsigned int mode)
> 	task_unlock(task);
> 	return !err;
> }
>+EXPORT_SYMBOL_GPL(ptrace_may_access);
>
> static int check_ptrace_options(unsigned long data)
> {
>-- 
>2.34.1
>
