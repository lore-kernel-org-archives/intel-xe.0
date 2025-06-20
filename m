Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8EC8C71155
	for <intel-xe@archiver.kernel.org>; Fri, 20 Jun 2025 13:44:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72AA310EB65;
	Fri, 20 Jun 2025 13:44:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fPgAlvPW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A047110EB65
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Jun 2025 13:44:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750427078; x=1781963078;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=RiljqOiegRNa0i/41DPqtip9b1D/xVYmZ+dRHr/nJs8=;
 b=fPgAlvPWI9Yzq+0WSeMRMUnjhQlIdvZnU4MGHVaATH+5jQsiU4LO1tJI
 J7CYL1vQzwhC8iBopjdpTbGdjHkXmcAI3gUMJL7IZwl3pdGkQLAJg0FpZ
 k0s5kK9md0XaaoKSb8Ro+fLNyC29+FkzFH5BMzi8xcYj7TlC3uMrNHZIX
 FwE8MCguhb/pdjt/MFaW9kpFZ7i9FOc8W3DuKSrQuMY6racFyQCKJ07Wa
 p85DKW3KJhFgcfYMOs2QF5FSmZqzcVBuDrWFQtPCXYGHaujF5gio5kWa1
 fDERAt0jsdShZWAMXx6OHz9Mg2ekyyTHh7lR6X2IELRvWAcIV8M43nmmz Q==;
X-CSE-ConnectionGUID: 2ruJD9N1S3qOJa+G/NId4g==
X-CSE-MsgGUID: o2qII8lWQfWCMUWiUDN6Qw==
X-IronPort-AV: E=McAfee;i="6800,10657,11469"; a="40300428"
X-IronPort-AV: E=Sophos;i="6.16,251,1744095600"; d="scan'208";a="40300428"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jun 2025 06:44:31 -0700
X-CSE-ConnectionGUID: tGRWvNGTTv2+P27p306aTQ==
X-CSE-MsgGUID: +5I/YQI7Q9S/+betDzHLnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,251,1744095600"; d="scan'208";a="156726225"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jun 2025 06:44:31 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 20 Jun 2025 06:44:30 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Fri, 20 Jun 2025 06:44:30 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (40.107.212.68)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 20 Jun 2025 06:44:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cGdoLr7q5PP59EX9MKOfpUl/rJCQz3k+9JsfxMgrUjdOGno3jbbwMXF/O8AahAi04plzGhBke/DuzAJpTrSIufhiszUTZtsEhKDTBlOl/hP60uTiydMmGnJZJCFJtTyvHP27x8r0f0uzsrAnde1xy4X7IehfyPsmox8gdBTk+Vcbr6vGl6uhxCS35peHCy2jB0wFQQErSs+i2K8IKZBUH/WCRp+CO5ljH3OAVAwG5GirD59J5kClog73vuC4rD7Z9rqgRx0Z1bG4elsUoZevmYPoaxWUua0K3VYNwt9+TbKLkSrQ+m+ZkRf1blweaehBALJI3VIFjWNAou0vJzIKuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3d/FexczQEI4WhaPzWRY1zgIdFsFixokpaSbLaWo3R0=;
 b=Casm2jMjEqbW5QCIKu973ZYoY8Kp+fdD0YVVPqs40m3gbdS/qdlaxEFTiKEgmatrZNYnFik6ytLJI/kO62gV69nMmtd22DeYF1YuyMvF/QaBnywzTTFk40EwiqvtlcuU8JBzumHe1xJF35s7zWu/rtwehuwe7lBd5ZUxr7yZPepVdw1URBvDcAg5QWN/EmIM0eLjBXU/2JNsPUKrMudQPGrsGEHAnJiT1A0jIij2LajKMXERIhrt0jFDK7hYrytdgclII5RUN6LkrFXttkUVyJs33SZALAAEN40s281+KUGZl09rZmm2MublOjDZ7j8MOsuFpOr/BC5F2vdADfLPiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by SA3PR11MB7625.namprd11.prod.outlook.com (2603:10b6:806:305::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.25; Fri, 20 Jun
 2025 13:44:05 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%4]) with mapi id 15.20.8857.022; Fri, 20 Jun 2025
 13:44:05 +0000
Date: Fri, 20 Jun 2025 09:44:02 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Vinay Belgaumkar
 <vinay.belgaumkar@intel.com>, Badal Nilawar <badal.nilawar@intel.com>,
 "Stuart Summers" <stuart.summers@intel.com>
Subject: Re: [PATCH v5 4/4] drm/xe/bmg: Update Wa_22019338487
Message-ID: <aFVlov4N8CNn3LhS@intel.com>
References: <20250618-wa-22019338487-v5-0-b888388477f2@intel.com>
 <20250618-wa-22019338487-v5-4-b888388477f2@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250618-wa-22019338487-v5-4-b888388477f2@intel.com>
X-ClientProxiedBy: SJ0P220CA0004.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::9) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|SA3PR11MB7625:EE_
X-MS-Office365-Filtering-Correlation-Id: 36ecf3d2-ebc6-4757-4970-08ddb0008632
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?/ANDmoGI2tqHKO99AWwTpoG5CikOpo4szvG26rlBgF0a6z/75M2mcKza55UG?=
 =?us-ascii?Q?shaX/ZFePcbkQLmxpcOerSYqTPp9FbU3gPiPCsEd07+e3z14CyGiUgsB1vOg?=
 =?us-ascii?Q?r4bEPz4zeCE1i8euX5zVTHwTm7sM4T+Eblzs0LCkYGV6KhzsnL4Crmcl42Pr?=
 =?us-ascii?Q?+lY8qEKm2S/55wtYjoDMR+rcKWpQuOuMCu70UnbJnVclWN7Jzwjx0681xGLe?=
 =?us-ascii?Q?WqZPYcUGubK/MMaga7m5ZkA0hStNPnKoFqwlOaQKPrF3qfIVcJwiUTnF9mFJ?=
 =?us-ascii?Q?v3LtqpQFkCEy6/2pdHP44Q4r82UZTRpeap15LCwjpWDIQ0iRbVsGBKrnWcBu?=
 =?us-ascii?Q?54uchPCZYfCZGypSSfhfuqiUCTUiPq9IYciwtAxopjNTOF8dzwOxwn+RNMQa?=
 =?us-ascii?Q?moyctSwnPNdO5ScDi4gVw2vixwStDgJvXhvixxGizVUgd9tra8a804uZlI6X?=
 =?us-ascii?Q?muv0cxlW5JcUuDS5sMh08f2fnkcnebow7WsnXhkRxt46OZGgdqoa1a98Qc71?=
 =?us-ascii?Q?ZBGYJSe2ErfGpiU848xVZsAhRN0l6trggd9ifpG6phBStgOxUNSK1k2QDnNY?=
 =?us-ascii?Q?K9R3LyPq4NhhHbjSmhnY5EHf4+jUywP4mlIdwpEYlmO0J47xLIR6qIRMygt0?=
 =?us-ascii?Q?j3RkLa3EXiEchSf8uqxlnQWoe85ZB3qcBC97y4YPksM8lFd4/lmiyklI/tOg?=
 =?us-ascii?Q?VB+WOZR5O0mMPlJ44XxTuV7yKtiB53+6ULsKaSZrm6BnkSYTyAPuCGyqeEDu?=
 =?us-ascii?Q?BJFSK9DLxdmI3frqPfW+gEvyL4Qd/0rSBDjkwfW0TUJD4mEl+3ZH7hVLhdW4?=
 =?us-ascii?Q?3nyCBxOBRxEI5dzcPtynwCBpcqiQrG3Zegqsgavh4c7b/TMRjrgK0RSS20R3?=
 =?us-ascii?Q?7hSIhJz3lJBYcfdBMwlomAuzlJ1HnNNiGlQedpyfxKzlUZfJtyerLF/KjxNp?=
 =?us-ascii?Q?jxGYFMPmFPwvNTJ2DXVv5ZKbw20JJAYiGw9F7abYEBbHOZQnJ+djXFm2usSx?=
 =?us-ascii?Q?X+N7PHhf6zqOnqy7EBYewcOtzridekUrnPmc1LgKY24pNOuf/zsiHRK1ihR9?=
 =?us-ascii?Q?+EzEPkK/HRfTfIpZ3EgtlAEvAEFAk1TDc4dZ8NtNszGo9Y1iZ8YLp5xcVptV?=
 =?us-ascii?Q?NRMj3g+wp5QZYpEzDd5s1RWYiAg1lcLP26ifvRC8u7982NQ8lBaEx3yjxTR6?=
 =?us-ascii?Q?yt9iepG4FX6zUbqLodbLosVut0J4U+4QmZK/E7BEyJ5VZHXZNxWhtQXf3azX?=
 =?us-ascii?Q?h2F0665lrKO1AijHAt4tD2bssdA6emeoYKPx+FS+sXxTCZhaL8bCzGj01e65?=
 =?us-ascii?Q?Z3wOf7K/MjAgiwaKjcnlrJTsxj6hI3gi0zk9ChzLm1zUkv3dkAK+6ycVu8SM?=
 =?us-ascii?Q?VqEYZr+eZaPXtmN4fbAUGTnH7aks4ogjiP/8To+hLspIuInPStPFkNYDkQLz?=
 =?us-ascii?Q?RvK6+kQtI/Y=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?u56TkxcdPmT6fwKeYAP0YXMo/YvluoFhCAOMXaaq5Og/0rwPcCGAYJN4aqga?=
 =?us-ascii?Q?cQQfwbBAbIy0wntXrt2MeyIWw7DOBP+BUlUfJb4YBi5kJ3BSQPdZUlL6u3Z0?=
 =?us-ascii?Q?rg2B1zOhAP+HJ7zddCmBgsFTdU8G+e4VdFZ3zI47UyG0RDNCuaw7AW1CxLav?=
 =?us-ascii?Q?xEO2mrdC1nsWR1UaFtwBsfwQ48ZlUkL1GgLHG4WaejY/DXHmu6LyErCU3G+i?=
 =?us-ascii?Q?akCMU13vcr0v7bPySv8T0nJESpjYrkXqhJb+j999J2TLfhrAnh6Ykwyj5USe?=
 =?us-ascii?Q?SsaIx+gZDD7EpXXSPF4rmL71AcqORorWY1SsKSj3QrdyBM8KuYxy24IFCL06?=
 =?us-ascii?Q?5vK8dLfvF5hx8wWKGCeIYmCobYpdnks577l/7y/6zSUnOq8XQzxo8XO7Lnq3?=
 =?us-ascii?Q?0FZJgMwPc2gQMQv426QlIsYSPPUikk6RGWMciER6u8NiNXha0pssp9SVZqjz?=
 =?us-ascii?Q?2OAoJypo3OPs24d9w1zluETijK87aMOqm6uDMAubjScO+ArQfifxFBMrbvK0?=
 =?us-ascii?Q?J//WquKxudobMFP5wivcWzOytDpKomdB8T5PSizZa9GAQmlR3yqEiAuJkQUu?=
 =?us-ascii?Q?B2FjBEczeITS7csdvE/0gaztJbjYm1e6yP4NkLLpkbPwYhcr+bvi6RxUMD0M?=
 =?us-ascii?Q?XZL0/0qZT+D8/MVBU9H7C3+e70F5A6yzQe5eRFseF7InUgbBn7Aix88ebN0E?=
 =?us-ascii?Q?XEv87MX3zeQhAYkDX4cIus15sXTKkXUAouGQ8ckmX7uI/cWPNLmmtV8+WhPg?=
 =?us-ascii?Q?Zf5sHspofrruKCT5RbO6SXuC/ur/Fn7sxwWIW3T6r65+nr72h/yl50nYB8RY?=
 =?us-ascii?Q?/GGmDnpeNpOyWXI0DotIPS+AlLrT4dAIS3BWLyXQk0kfFl7Pn7Sfy8JF+CXF?=
 =?us-ascii?Q?21yOt2vkGTsihNYmGpHaaHzYO0KP+blZTvyin76MrAkmReUAky6/yHJIERIA?=
 =?us-ascii?Q?9VH4ybng8tVB3zfO8e4tcFnJIOhuTbfhyEE56YCGRM+g93UTRxq6HNSQDgYv?=
 =?us-ascii?Q?xblU/FTIVgxWvFZfKzcrsOesrnAgJlezEfHEGdTOY9ZL5KRRj6deaGe/bdn9?=
 =?us-ascii?Q?nasCg4d+pzzrNJNMo5ABE4eYoG005QG68UIqIm4bPpf6YLkFAaTT8eZ1p0OY?=
 =?us-ascii?Q?tDb7zddB/H8LCyusj2R05tCJaVc9GOZFtuxo9XEmLi1Vc1Wd9kk6vRBQRlBd?=
 =?us-ascii?Q?cJ5e1GWpt/uBEUPYubeLZ2YMxB1okZhYxleNwc0QlNDeDF4NCXoiXDtAA0hu?=
 =?us-ascii?Q?EsDKXQyK4GvxijDvAlxWafr9sqnoxh4UXFzj6VdoCe6SyJ/hsqrhCtqOnRXp?=
 =?us-ascii?Q?owevJGqAxaG6c5iX+gR6he/O14eQ4HAuDpzxWQRbX1r/zh0GlTfc7MsTezYJ?=
 =?us-ascii?Q?y6LrpCsWiVaRqQWViTuzLE26sT5iwhDzZ7t4SUBx7k3ruHuIaVTOUIFJ/8dw?=
 =?us-ascii?Q?UnWwiRcEjclXEgdDYymIAxOFH+C9lgNrR9eOqnQ2mWk4SY4yOZTqHPEgIBrW?=
 =?us-ascii?Q?v/QF3nr4O03PotqZfD3JpH3KufQH+eW+cTYvgMeoyDQywmIxwqMijnSMT6CT?=
 =?us-ascii?Q?V8fVUJyYY8iGvar2+6n5er4iXA4ICPyPq7Oc8T8C?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 36ecf3d2-ebc6-4757-4970-08ddb0008632
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2025 13:44:05.6643 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X9y6YCH2q9qR7QLc1HbrWzt4DM2ftt54m+HxVF9IfyUhZKFlBo7a6Jrd+4hFrUkyrQBXf4Qt890e+qyNCj5MEg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7625
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

On Wed, Jun 18, 2025 at 11:50:01AM -0700, Lucas De Marchi wrote:
> From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> 
> Limit GT max frequency to 2600MHz and wait for frequency to reduce
> before proceeding with a transient flush. This is really only needed for
> the transient flush: if L2 flush is needed due to 16023588340 then
> there's no need to do this additional wait since we are already using
> the bigger hammer.
> 
> v2: Use generic names, ensure user set max frequency requests wait
> for flush to complete (Rodrigo)
> v3:
>  - User requests wait via wait_var_event_timeout (Lucas)
>  - Close races on flush + user requests (Lucas)
>  - Fix xe_guc_pc_remove_flush_freq_limit() being called on last gt
>    rather than root gt (Lucas)
> v4:
>  - Only apply the freq reducing part if a TDF is needed: L2 flush trumps
>    the need for waiting a lower frequency
> 
> Fixes: aaa08078e725 ("drm/xe/bmg: Apply Wa_22019338487")
> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com> # v3
> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
> 
> Rodrigo, since the change in v4 changed it considerably, please let me
> know if your review still stands

It does. I'm glad we could reduce the scope and impact of this w/a here.

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_device.c       |   8 ++-
>  drivers/gpu/drm/xe/xe_guc_pc.c       | 125 +++++++++++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_guc_pc.h       |   2 +
>  drivers/gpu/drm/xe/xe_guc_pc_types.h |   2 +
>  4 files changed, 135 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 8396612b68d4b..c3aee79aa1acb 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -40,6 +40,7 @@
>  #include "xe_gt_printk.h"
>  #include "xe_gt_sriov_vf.h"
>  #include "xe_guc.h"
> +#include "xe_guc_pc.h"
>  #include "xe_hw_engine_group.h"
>  #include "xe_hwmon.h"
>  #include "xe_irq.h"
> @@ -1066,11 +1067,14 @@ void xe_device_td_flush(struct xe_device *xe)
>  		return;
>  
>  	root_gt = xe_root_mmio_gt(xe);
> -	if (XE_WA(root_gt, 16023588340))
> +	if (XE_WA(root_gt, 16023588340)) {
>  		/* A transient flush is not sufficient: flush the L2 */
>  		xe_device_l2_flush(xe);
> -	else
> +	} else {
> +		xe_guc_pc_apply_flush_freq_limit(&root_gt->uc.guc.pc);
>  		tdf_request_sync(xe);
> +		xe_guc_pc_remove_flush_freq_limit(&root_gt->uc.guc.pc);
> +	}
>  }
>  
>  u32 xe_device_ccs_bytes(struct xe_device *xe, u64 size)
> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
> index 538b4ea61c17c..eb3552baa6029 100644
> --- a/drivers/gpu/drm/xe/xe_guc_pc.c
> +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
> @@ -7,7 +7,9 @@
>  
>  #include <linux/cleanup.h>
>  #include <linux/delay.h>
> +#include <linux/jiffies.h>
>  #include <linux/ktime.h>
> +#include <linux/wait_bit.h>
>  
>  #include <drm/drm_managed.h>
>  #include <drm/drm_print.h>
> @@ -53,9 +55,11 @@
>  #define LNL_MERT_FREQ_CAP	800
>  #define BMG_MERT_FREQ_CAP	2133
>  #define BMG_MIN_FREQ		1200
> +#define BMG_MERT_FLUSH_FREQ_CAP	2600
>  
>  #define SLPC_RESET_TIMEOUT_MS 5 /* roughly 5ms, but no need for precision */
>  #define SLPC_RESET_EXTENDED_TIMEOUT_MS 1000 /* To be used only at pc_start */
> +#define SLPC_ACT_FREQ_TIMEOUT_MS 100
>  
>  /**
>   * DOC: GuC Power Conservation (PC)
> @@ -143,6 +147,36 @@ static int wait_for_pc_state(struct xe_guc_pc *pc,
>  	return -ETIMEDOUT;
>  }
>  
> +static int wait_for_flush_complete(struct xe_guc_pc *pc)
> +{
> +	const unsigned long timeout = msecs_to_jiffies(30);
> +
> +	if (!wait_var_event_timeout(&pc->flush_freq_limit,
> +				    !atomic_read(&pc->flush_freq_limit),
> +				    timeout))
> +		return -ETIMEDOUT;
> +
> +	return 0;
> +}
> +
> +static int wait_for_act_freq_limit(struct xe_guc_pc *pc, u32 freq)
> +{
> +	int timeout_us = SLPC_ACT_FREQ_TIMEOUT_MS * USEC_PER_MSEC;
> +	int slept, wait = 10;
> +
> +	for (slept = 0; slept < timeout_us;) {
> +		if (xe_guc_pc_get_act_freq(pc) <= freq)
> +			return 0;
> +
> +		usleep_range(wait, wait << 1);
> +		slept += wait;
> +		wait <<= 1;
> +		if (slept + wait > timeout_us)
> +			wait = timeout_us - slept;
> +	}
> +
> +	return -ETIMEDOUT;
> +}
>  static int pc_action_reset(struct xe_guc_pc *pc)
>  {
>  	struct xe_guc_ct *ct = pc_to_ct(pc);
> @@ -689,6 +723,11 @@ static int xe_guc_pc_set_max_freq_locked(struct xe_guc_pc *pc, u32 freq)
>   */
>  int xe_guc_pc_set_max_freq(struct xe_guc_pc *pc, u32 freq)
>  {
> +	if (XE_WA(pc_to_gt(pc), 22019338487)) {
> +		if (wait_for_flush_complete(pc) != 0)
> +			return -EAGAIN;
> +	}
> +
>  	guard(mutex)(&pc->freq_lock);
>  
>  	return xe_guc_pc_set_max_freq_locked(pc, freq);
> @@ -889,6 +928,92 @@ static int pc_adjust_requested_freq(struct xe_guc_pc *pc)
>  	return ret;
>  }
>  
> +static bool needs_flush_freq_limit(struct xe_guc_pc *pc)
> +{
> +	struct xe_gt *gt = pc_to_gt(pc);
> +
> +	return  XE_WA(gt, 22019338487) &&
> +		pc->rp0_freq > BMG_MERT_FLUSH_FREQ_CAP;
> +}
> +
> +/**
> + * xe_guc_pc_apply_flush_freq_limit() - Limit max GT freq during L2 flush
> + * @pc: the xe_guc_pc object
> + *
> + * As per the WA, reduce max GT frequency during L2 cache flush
> + */
> +void xe_guc_pc_apply_flush_freq_limit(struct xe_guc_pc *pc)
> +{
> +	struct xe_gt *gt = pc_to_gt(pc);
> +	u32 max_freq;
> +	int ret;
> +
> +	if (!needs_flush_freq_limit(pc))
> +		return;
> +
> +	guard(mutex)(&pc->freq_lock);
> +
> +	ret = xe_guc_pc_get_max_freq_locked(pc, &max_freq);
> +	if (!ret && max_freq > BMG_MERT_FLUSH_FREQ_CAP) {
> +		ret = pc_set_max_freq(pc, BMG_MERT_FLUSH_FREQ_CAP);
> +		if (ret) {
> +			xe_gt_err_once(gt, "Failed to cap max freq on flush to %u, %pe\n",
> +				       BMG_MERT_FLUSH_FREQ_CAP, ERR_PTR(ret));
> +			return;
> +		}
> +
> +		atomic_set(&pc->flush_freq_limit, 1);
> +
> +		/*
> +		 * If user has previously changed max freq, stash that value to
> +		 * restore later, otherwise use the current max. New user
> +		 * requests wait on flush.
> +		 */
> +		if (pc->user_requested_max != 0)
> +			pc->stashed_max_freq = pc->user_requested_max;
> +		else
> +			pc->stashed_max_freq = max_freq;
> +	}
> +
> +	/*
> +	 * Wait for actual freq to go below the flush cap: even if the previous
> +	 * max was below cap, the current one might still be above it
> +	 */
> +	ret = wait_for_act_freq_limit(pc, BMG_MERT_FLUSH_FREQ_CAP);
> +	if (ret)
> +		xe_gt_err_once(gt, "Actual freq did not reduce to %u, %pe\n",
> +			       BMG_MERT_FLUSH_FREQ_CAP, ERR_PTR(ret));
> +}
> +
> +/**
> + * xe_guc_pc_remove_flush_freq_limit() - Remove max GT freq limit after L2 flush completes.
> + * @pc: the xe_guc_pc object
> + *
> + * Retrieve the previous GT max frequency value.
> + */
> +void xe_guc_pc_remove_flush_freq_limit(struct xe_guc_pc *pc)
> +{
> +	struct xe_gt *gt = pc_to_gt(pc);
> +	int ret = 0;
> +
> +	if (!needs_flush_freq_limit(pc))
> +		return;
> +
> +	if (!atomic_read(&pc->flush_freq_limit))
> +		return;
> +
> +	mutex_lock(&pc->freq_lock);
> +
> +	ret = pc_set_max_freq(&gt->uc.guc.pc, pc->stashed_max_freq);
> +	if (ret)
> +		xe_gt_err_once(gt, "Failed to restore max freq %u:%d",
> +			       pc->stashed_max_freq, ret);
> +
> +	atomic_set(&pc->flush_freq_limit, 0);
> +	mutex_unlock(&pc->freq_lock);
> +	wake_up_var(&pc->flush_freq_limit);
> +}
> +
>  static int pc_set_mert_freq_cap(struct xe_guc_pc *pc)
>  {
>  	int ret;
> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.h b/drivers/gpu/drm/xe/xe_guc_pc.h
> index 0a2664d5c8114..52ecdd5ddbff2 100644
> --- a/drivers/gpu/drm/xe/xe_guc_pc.h
> +++ b/drivers/gpu/drm/xe/xe_guc_pc.h
> @@ -38,5 +38,7 @@ u64 xe_guc_pc_mc6_residency(struct xe_guc_pc *pc);
>  void xe_guc_pc_init_early(struct xe_guc_pc *pc);
>  int xe_guc_pc_restore_stashed_freq(struct xe_guc_pc *pc);
>  void xe_guc_pc_raise_unslice(struct xe_guc_pc *pc);
> +void xe_guc_pc_apply_flush_freq_limit(struct xe_guc_pc *pc);
> +void xe_guc_pc_remove_flush_freq_limit(struct xe_guc_pc *pc);
>  
>  #endif /* _XE_GUC_PC_H_ */
> diff --git a/drivers/gpu/drm/xe/xe_guc_pc_types.h b/drivers/gpu/drm/xe/xe_guc_pc_types.h
> index 2978ac9a249b5..c02053948a579 100644
> --- a/drivers/gpu/drm/xe/xe_guc_pc_types.h
> +++ b/drivers/gpu/drm/xe/xe_guc_pc_types.h
> @@ -15,6 +15,8 @@
>  struct xe_guc_pc {
>  	/** @bo: GGTT buffer object that is shared with GuC PC */
>  	struct xe_bo *bo;
> +	/** @flush_freq_limit: 1 when max freq changes are limited by driver */
> +	atomic_t flush_freq_limit;
>  	/** @rp0_freq: HW RP0 frequency - The Maximum one */
>  	u32 rp0_freq;
>  	/** @rpa_freq: HW RPa frequency - The Achievable one */
> 
> -- 
> 2.49.0
> 
