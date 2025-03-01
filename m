Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E817C282C5
	for <intel-xe@archiver.kernel.org>; Sat,  1 Mar 2025 01:19:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CE3F10E076;
	Sat,  1 Mar 2025 01:19:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZoxlCPme";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 209F410E076
 for <intel-xe@lists.freedesktop.org>; Sat,  1 Mar 2025 01:19:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740791960; x=1772327960;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=vuOi3SQ3llQ7Lz3fxeAQstjsPcoyLT7saTxVYL6zg7A=;
 b=ZoxlCPmerb8FF3lBzMXhF4hcPiye0eGF8SHBBYe92+iHrHNt2ZAPW0vl
 iDka9EAP412OuytJizYDyxb9aMP74x2ESKmG9k9IaeQ9HetDc4mXhS0dB
 v8IAnpnjs0vH41vNA8ILKkdreIOnljI9PhnOlyS+CSCWnFIgZKkjdXbUj
 ZIbmpDIO00ZdH3b3/w1QBwBbmDOv70l+0YNd/lQHuqcYvU5LdKB9Wdgo9
 y28Q6MJhczUmPWu47kBVtSD+i9M2H34OE5+92cP/wvewrZheWC4r1VJwK
 4Ip1H/RcSHxYq/JCO9R1DKM0+AUhKahHS+txvU0fkJhTVyi4n1GHvunDS Q==;
X-CSE-ConnectionGUID: 1kQw4/7dR9yNDo9LIZTpfg==
X-CSE-MsgGUID: 8RbzFxDXRRypdqRMemFa6A==
X-IronPort-AV: E=McAfee;i="6700,10204,11359"; a="45385054"
X-IronPort-AV: E=Sophos;i="6.13,323,1732608000"; d="scan'208";a="45385054"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2025 17:19:19 -0800
X-CSE-ConnectionGUID: wNnEXtmQQTi0A51wFOGcOQ==
X-CSE-MsgGUID: ABUmLjKpREyQ+w+O5wEN9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="121610360"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Feb 2025 17:19:18 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 28 Feb 2025 17:19:17 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Fri, 28 Feb 2025 17:19:17 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.44) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 28 Feb 2025 17:19:17 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aNlC7fXtFYfIOwFA264K14aKNjiuMN9440rxhYQxZNw95SOcTrbeiLFadteJepQlIivpx27mmGxk4u0pSiLptAdivhqwy4c5eQz1zwR4p8cFx5in8WTArDLYaZSpuFtBmBrYIcL1ydV9nY1nMLWdN0cIpt8U/vRMr8YrhnHkdErPtm7USp2TCNVYq8NHUBHytwQ8Q66NVUXPwLOVGUBRLVGYZg2n2oj+NTz15PoRBmDrg81Vzjr5V/oLAane8K3DICgTz0d0SQYqf5b1nk3wJuhHm9zdjoympEXtdTBpmq1bCuVUclbGjSTqNz1Y4Ox6cFkXLSKaTMAsMGzDlMd0Lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Rxfo++ZZKVgV3/DEwbt820B8DlPlmkB5YjDGkCdFPuc=;
 b=Z0wex9nnxxrCGAFuzsp3biCJp+VRbATncfQdYN4xVBpp/aCyLMPf10Db/qU3nFPv0KTGVoa+7C12aBs9XVsePXULzCeOFKJ2gdzynD/7A4Bp0IUNZ1IGUUOGmPeOspcWL9uAF6tbmmO4kPHwfb5QW5FBQoPW3mB3IYwmetm/TRUf4hMJG6V1y8f+iEyd2mkWkI7rK7apdmf2sIW7b6cQVEDaVrPiXqZHmgxXrrKNnks+mh56A9WQINXKD/yNw0ycOHeLcKuRFNqMsbj/F1gXV8qn5cibMfutydc1VrWUHx1zrw5LvLl5dVTX6yGnh+TD1F73/r80QmdtfVak+43ukg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by MW4PR11MB7053.namprd11.prod.outlook.com (2603:10b6:303:221::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.22; Sat, 1 Mar
 2025 01:19:10 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%3]) with mapi id 15.20.8489.018; Sat, 1 Mar 2025
 01:19:10 +0000
Date: Fri, 28 Feb 2025 19:19:05 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Riana Tauro <riana.tauro@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [PATCH v3] drm/xe/pmu: Add GT frequency events
Message-ID: <sgpn7n3tvy2pumhhxzy44xxs2hx5prcyaqasmlmheemqqoco7k@cttb2dr7xosm>
References: <20250213000220.3510885-1-vinay.belgaumkar@intel.com>
 <45qgg5bemip4eihjl6bpen5hbi7babw2itp66q3gjmej2lvs4z@gg5bp37gcweo>
 <d1a12315-878d-4186-aed9-c84662a1a81c@intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d1a12315-878d-4186-aed9-c84662a1a81c@intel.com>
X-ClientProxiedBy: MW4PR04CA0041.namprd04.prod.outlook.com
 (2603:10b6:303:6a::16) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|MW4PR11MB7053:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c9a97fd-92c6-4722-2c09-08dd585f11ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?tUq4fDJXmIe8F7MmJ2i0VOv+NUIQRIJtPfXlHzlxHJgdfb3pkwjkxqWpup?=
 =?iso-8859-1?Q?xYYiMUg/E6jrDFBegAw2/gSpMUCp9zc84dh+6teNeHJyvXnTxXg/7oxIsP?=
 =?iso-8859-1?Q?cU6eEAorXxiY/mmJtpJqVFTTJzc+5EHRvRzH+Aef/oMbjHWLnZe/ZdWKcc?=
 =?iso-8859-1?Q?XPSws7kOlM/6oIePrsnnf82scyN/k/dLYYnkIPKGKGYDQrckLL00tu3zl5?=
 =?iso-8859-1?Q?Bm+R48euxQTj8g1QuRaOeUwtYAKyHiQTLdMKfHvtThTvDBYij6otvabKWQ?=
 =?iso-8859-1?Q?M+qrQiFEXwuCX4dVoki+xtXIN1aVv9GJ8J7JVpM6XOqifW6AoszMKNpk4Y?=
 =?iso-8859-1?Q?SsLzZcLF5XgvyZNJh3HjzX+V8fpJ0aJxqMp4AzaDwV3T1RGJMNMrkSeCKs?=
 =?iso-8859-1?Q?yhp9hpT8r/jmbT2PeH6h6Up+3Hv25FjaKW8DvfO00EFNztzPwaD3+2Lxye?=
 =?iso-8859-1?Q?D+hrxPMidQZtbp/s28glqGQW43/ztqn8dAy3DHbSoYc7YZjGaxusrgT4on?=
 =?iso-8859-1?Q?xw+ktTsxUh06L+85A9PvOMdA/dYNA18My8RYOpHiMJFGtggPYR65fDe3GM?=
 =?iso-8859-1?Q?3ZdwpzA2izmU3ZL0d7LorBfpayioDdOw5O7olVB+XyQLtMBsaQZHBS5Zcb?=
 =?iso-8859-1?Q?6sM3+rtlG0UNz0ISXzaTNUivwM2qwW7zWr+tdjJYSmoffhMHeWRo5d6YKL?=
 =?iso-8859-1?Q?DOaygLdVlg2/CX6JbljBMK86fvsYCz+KM3OqfaCS04P9iNC0GKa3zSg3o0?=
 =?iso-8859-1?Q?QY922UdsPob0zvXmyv2hkcOwqnLgpkMKeTweWUkHxv9vDz1jUNjmaHoGu0?=
 =?iso-8859-1?Q?PNH8E+vxPQob/8Z1TmzbhrLzfwxmAhkKj59OpJH8rLUGgIDw93GFSl1RCs?=
 =?iso-8859-1?Q?78KdiBHfCxuYUKI9NC5x5HuiOCRlRTzUi5jnXb1DeqIyVzDgDkAupVZOHj?=
 =?iso-8859-1?Q?IzryfgvtdgMDHB3/pJVWGTV1KMfpQqbXVncntvNMJVzUMrpSzs2ikz9Hxa?=
 =?iso-8859-1?Q?bpJ6JxpgTeZT+ouok8sXYe7RHTnnOs9372s6GBD6T/l2V4L9AVZJPc5S0j?=
 =?iso-8859-1?Q?YVcu36YX/V4Dw8vxObsva25O0e/vH1dru+T+4AqzufrVauiovHW2GxwHLh?=
 =?iso-8859-1?Q?RLtDkkorp1KFXK4XUf7g897raBaNicMj/7pcxnJjGSUB0DO0u4bnFOAvVi?=
 =?iso-8859-1?Q?G/D2ssF/xEcFqCGJ03vFFkwf7o/3q+30MPPnsr9HuBnjl9auSDxrTxPgJp?=
 =?iso-8859-1?Q?xab6C9BXh+erUJrWCAPLdFh2OcIXGxRXxItoZa1ObklpByP9N0Kxs2srZu?=
 =?iso-8859-1?Q?2WoiFYnd2y3qNUow4T19RptFOvogHlYd+QsKJf7qCbo1DVq9Lm+2PC+PB9?=
 =?iso-8859-1?Q?7+7rAb0L05wXCvbcumWBdqlGo8iRoctR5xgBxvSxPIwdJuZv2vddAkZjO/?=
 =?iso-8859-1?Q?IgW8P8B3iDmho5yB?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?orW+ztiowRPOdctrR/gKFEyO5+38Ewx6a4/Vsrd3xxBd33C7rZik/sVgKo?=
 =?iso-8859-1?Q?QJbtGCcnH8CdNtJ8o2PkiFRYiLIRzM+9OUGjnrrbr8+QUwBqPLNZYIp4QG?=
 =?iso-8859-1?Q?GsO68+1DrY/VkB5vh5aOuJOCYLgjNvt0pP2jANsqhwqTcsSxzaj/oZjBJJ?=
 =?iso-8859-1?Q?wz9KY7ZM2Rd9FT/6t9qXc4lYikyeFdwseCQ2dgc0ItHTH8/eS+ps3EOJ2E?=
 =?iso-8859-1?Q?0jcjy2/f2fRUBr3VCh5eV2xEmcQ3F7UfE7nC7WM3kYMaFETKuuxUOYu08d?=
 =?iso-8859-1?Q?iUPbqLZK+uN4Ht8rxi+S6aFl18LGPV3dEYlWFDWyuVwXctUnAdQnKxx+SJ?=
 =?iso-8859-1?Q?SSM9Q+cXvGOtSP6TKy91LLVKLBrcQ9raKdSoHfL2ZDckWtOTi1psmQyOBo?=
 =?iso-8859-1?Q?GYYhxeXNhNkxmZbcUuY3z6ns/MKltQ0jKdntC7c85t5OcHpp9Y6lOTwWTy?=
 =?iso-8859-1?Q?g6KDLrexUjzdxaZB2c/odAyj0ZuwKxz8OJenR/JOGVlGURFtyUU4YirUsX?=
 =?iso-8859-1?Q?3e4kHkQSak8JUCoC0SnsNQT4E4aVYgZ+jSyo7LEyCFWyE7TolTsIygNNc7?=
 =?iso-8859-1?Q?+mcLF7Zryz6Con+YV6WFXSs+okdYN+fk8Vs428bMT1Fvdj7cOC4u+zI3KR?=
 =?iso-8859-1?Q?iF36gbNM7LtS2XwX1fso6LfWKdJ3BsRTEysZdwbFcUa5uClXicPF3BBffT?=
 =?iso-8859-1?Q?FSg2ALxkqWez+qCrIcB0m3s4xQKYU+MRfn9dUpGPflVnfi4f/OksPKIjHt?=
 =?iso-8859-1?Q?VCLDuijSJevcK3QZd+zZUznPOn04FV0EW1xYVW0bbLJpQRH1FbIiGi42nL?=
 =?iso-8859-1?Q?OWhjg/4ngxhkTm6qeRIlT8qgM3y9If6t2fp2ZUuoiyBjNvfIdFztbXqd88?=
 =?iso-8859-1?Q?bfLQRmSwUecpW0FmPdZQxvurIwyfjB0TZjzytGZJuKYM5wRcOGB5pQPv/T?=
 =?iso-8859-1?Q?/9dzLgXaT++DLU7LtQscyY0yPsYRi4XdPdjlV1iyYHgCvdd2E5oL3kOGOr?=
 =?iso-8859-1?Q?BpiZlppPE60nF4Ha5QWu6RXfGP81ElEizzvoPO54+o/OG/0+SYakuvUHCQ?=
 =?iso-8859-1?Q?WPBDBDVD/p0/+IcpROlkDJjYb4E1X/nfMDVoMLPxS2vEgrcumE/sa7Qobr?=
 =?iso-8859-1?Q?hTk5rt+15NwQjGL8FQ7fySvS++sE7xWxA2eFFA7hH57PB6rVEWivGAZj5p?=
 =?iso-8859-1?Q?q3f/PncFMagpoK61y+W04ocwNanrhfe8xapKSiPG9xhFMz5UQIyUazxtuQ?=
 =?iso-8859-1?Q?hlPU/tnHPFdIJn888cSDKZvrw7a2vSVP58HZXoTpolw8Bdgsvt64y03Mbw?=
 =?iso-8859-1?Q?tj65avtIEbf7mbQ1JPJi7u0zV6z5d1bY4lSXCwOQh/ndXmGLyergMIMKRY?=
 =?iso-8859-1?Q?D1PFl39ED5vjRoJPwOV6yqP+ZeIzQAyZsGfeluOCKX4uoJjGdmMUNGCYwd?=
 =?iso-8859-1?Q?l7GbRHK6Lmj6JpmTZOJ6KjbL3xdPwFFYGw1whNl+uzOjLTMdH3A7Rp9u7t?=
 =?iso-8859-1?Q?qOHuIuDFLJgIk9d9zLX07NM5hqwueb4Xu5QpvKecUSvE3vsntbhohudijH?=
 =?iso-8859-1?Q?0VOIqf87keOB1VA6bQ1T6q8kMT98D0gcz68TRYGZEtuwyvhT+cX5ib14Xv?=
 =?iso-8859-1?Q?WMX34HtK8fR11Dd/GaglLrqtdQpszsd8rtZ1pztrxMN7vHrdwu/iYukA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c9a97fd-92c6-4722-2c09-08dd585f11ac
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Mar 2025 01:19:10.0522 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yRu8CKewNe6TbIC52EK8gcvbyPsFDvTDoooqyTWdB39VEfNc5K2WjsVxuSjj59BZalKeq7Su5Mh1Mcodi1/7klPgKq2UJpOx1dncvc8SgbI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7053
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

On Fri, Feb 28, 2025 at 04:59:56PM -0800, Belgaumkar, Vinay wrote:
>
>On 2/25/2025 9:47 AM, Lucas De Marchi wrote:
>>On Wed, Feb 12, 2025 at 04:02:20PM -0800, Vinay Belgaumkar wrote:
>>>Define PMU events for GT frequency (actual and requested). This is
>>>a port from the i915 driver implementation, where an internal timer
>>>is used to aggregate GT frequencies over certain fixed interval.
>>>Following PMU events are being added-
>>>
>>> xe_0000_00_02.0/gt-actual-frequency/              [Kernel PMU event]
>>> xe_0000_00_02.0/gt-requested-frequency/           [Kernel PMU event]
>>>
>>>Standard perf commands can be used to monitor GT frequency-
>>> $ perf stat -e xe_0000_00_02.0/gt-requested-frequency,gt=0/ -I1000
>>>
>>>    1.001175175                700 M xe/gt-requested-frequency,gt=0/
>>>    2.005891881                703 M xe/gt-requested-frequency,gt=0/
>>>    3.007318169                700 M xe/gt-requested-frequency,gt=0/
>>>
>>>Actual frequencies will be reported as 0 when GT is in C6.
>>>
>>>v2: Use locks while storing/reading samples, keep track of multiple
>>>clients (Lucas) and other general cleanup.
>>>
>>>Cc: Riana Tauro <riana.tauro@intel.com>
>>>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>>>Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>>Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
>>>---
>>>drivers/gpu/drm/xe/xe_pmu.c       | 211 ++++++++++++++++++++++++++++--
>>>drivers/gpu/drm/xe/xe_pmu_types.h |  29 ++++
>>>2 files changed, 230 insertions(+), 10 deletions(-)
>>>
>>>diff --git a/drivers/gpu/drm/xe/xe_pmu.c b/drivers/gpu/drm/xe/xe_pmu.c
>>>index 3910a82328ee..ed76756403ea 100644
>>>--- a/drivers/gpu/drm/xe/xe_pmu.c
>>>+++ b/drivers/gpu/drm/xe/xe_pmu.c
>>>@@ -8,6 +8,8 @@
>>>
>>>#include "xe_device.h"
>>>#include "xe_gt_idle.h"
>>>+#include "xe_guc_pc.h"
>>>+#include "xe_macros.h"
>>>#include "xe_pm.h"
>>>#include "xe_pmu.h"
>>>
>>>@@ -37,6 +39,17 @@
>>>
>>>#define XE_PMU_EVENT_GT_MASK        GENMASK_ULL(63, 60)
>>>#define XE_PMU_EVENT_ID_MASK        GENMASK_ULL(11, 0)
>>>+#define XE_HRTIMER_INTERVAL_NS        5000000
>>>+
>>>+static struct xe_pmu *event_to_pmu(struct perf_event *event)
>>>+{
>>>+    return container_of(event->pmu, typeof(struct xe_pmu), base);
>>>+}
>>>+
>>>+static struct xe_device *event_to_xe(struct perf_event *event)
>>>+{
>>>+    return container_of(event->pmu, typeof(struct xe_device), 
>>>pmu.base);
>>>+}
>>
>>we shouldn't add refactors like this in the same patch you are adding a
>>new feature, it creates noise in the patch and makes it harder to see
>>what's going on. Please drop both event_to_pmu() and event_to_xe().
>ok, will add as a separate patch later.
>>
>>>
>>>static unsigned int config_to_event_id(u64 config)
>>>{
>>>@@ -49,10 +62,12 @@ static unsigned int config_to_gt_id(u64 config)
>>>}
>>>
>>>#define XE_PMU_EVENT_GT_C6_RESIDENCY    0x01
>>>+#define XE_PMU_EVENT_GT_ACTUAL_FREQUENCY    0x02
>>>+#define XE_PMU_EVENT_GT_REQUESTED_FREQUENCY    0x03
>>
>>this will need a rebase
>yes.
>>
>>>
>>>static struct xe_gt *event_to_gt(struct perf_event *event)
>>>{
>>>-    struct xe_device *xe = container_of(event->pmu, typeof(*xe), 
>>>pmu.base);
>>>+    struct xe_device *xe = event_to_xe(event);
>>>    u64 gt = config_to_gt_id(event->attr.config);
>>>
>>>    return xe_device_get_gt(xe, gt);
>>>@@ -70,7 +85,7 @@ static bool event_supported(struct xe_pmu *pmu, 
>>>unsigned int gt,
>>>
>>>static void xe_pmu_event_destroy(struct perf_event *event)
>>>{
>>>-    struct xe_device *xe = container_of(event->pmu, typeof(*xe), 
>>>pmu.base);
>>>+    struct xe_device *xe = event_to_xe(event);
>>>
>>>    drm_WARN_ON(&xe->drm, event->parent);
>>>    xe_pm_runtime_put(xe);
>>>@@ -79,7 +94,7 @@ static void xe_pmu_event_destroy(struct 
>>>perf_event *event)
>>>
>>>static int xe_pmu_event_init(struct perf_event *event)
>>>{
>>>-    struct xe_device *xe = container_of(event->pmu, typeof(*xe), 
>>>pmu.base);
>>>+    struct xe_device *xe = event_to_xe(event);
>>>    struct xe_pmu *pmu = &xe->pmu;
>>>    unsigned int id, gt;
>>>
>>>@@ -104,6 +119,8 @@ static int xe_pmu_event_init(struct perf_event 
>>>*event)
>>>    if (has_branch_stack(event))
>>>        return -EOPNOTSUPP;
>>>
>>>+    XE_WARN_ON(id >= XE_PMU_MAX_EVENT_TYPES);
>>
>>I was going to say that we don't need the other ones. But then I noticed
>>XE_PMU_MAX_EVENT_TYPES == 64, which is a lot more than we currently
>>support.
>>
>>I suggested it before, but what's the issue of keeping a linked list of
>>the events like rapl_pmu::active_list?
>ok, will add the active_list. However, still need the 
>XE_PMU_MAX_EVENT_TYPES, since I am storing the samples in an array 
>based on event_id -  u64 
>event_sample[XE_PMU_MAX_GT][XE_PMU_MAX_EVENT_TYPES].

can't you simply walk the list updating the values in place? we are
likely going to have 1 or very few active events:

a) read hw, which may involve locks/forcewake, and get the sample
b)
	raw_spin_lock(pmu->lock);
		walk the list of active events, update with the new
		sample
	raw_spin_unlock(pmu->lock);

I didn't try it though... may be missing something.

Considering we now even get the forcewake for other events on event
init... does it make sense to still do this with a hrtimer? Are we
trying to smooth the curve out instead of reporting the instantaneous
value?

Lucas De Marchi

>>
>>>+
>>>    if (!event->parent) {
>>>        drm_dev_get(&xe->drm);
>>>        xe_pm_runtime_get(xe);
>>>@@ -113,16 +130,50 @@ static int xe_pmu_event_init(struct 
>>>perf_event *event)
>>>    return 0;
>>>}
>>>
>>>+static u64
>>>+xe_get_pmu_sample(struct xe_pmu *pmu, unsigned int gt_id, uint32_t id)
>>>+{
>>>+    unsigned long flags;
>>>+    u64 val;
>>>+
>>>+    raw_spin_lock_irqsave(&pmu->lock, flags);
>>>+    val = pmu->event_sample[gt_id][id];
>>>+    raw_spin_unlock_irqrestore(&pmu->lock, flags);
>>>+
>>>+    return val;
>>>+}
>>>+
>>>+static void
>>>+xe_store_pmu_sample(struct xe_pmu *pmu, uint32_t gt_id, uint32_t id,
>>>+            uint32_t val, uint32_t period)
>>>+{
>>>+    unsigned long flags;
>>>+
>>>+    raw_spin_lock_irqsave(&pmu->lock, flags);
>>>+    pmu->event_sample[gt_id][id] += mul_u32_u32(val, period);
>>>+    raw_spin_unlock_irqrestore(&pmu->lock, flags);
>>>+}
>>>+
>>>static u64 __xe_pmu_event_read(struct perf_event *event)
>>>{
>>>    struct xe_gt *gt = event_to_gt(event);
>>>+    struct xe_device *xe = event_to_xe(event);
>>
>>gt_to_xe() avoids the additional helper and you don't even need it.
>>You are intested in the pmu, not xe... so you could just have used
>>
>>    pmu = container_of(event->pmu, typeof(struct xe_pmu), base);
>>
>>... like is done in other places.
>ok.
>>
>>>+    struct xe_pmu *pmu = &xe->pmu;
>>>+    unsigned long id;
>>>
>>>    if (!gt)
>>>        return 0;
>>>
>>>-    switch (config_to_event_id(event->attr.config)) {
>>>+    id = config_to_event_id(event->attr.config);
>>>+
>>>+    switch (id) {
>>>    case XE_PMU_EVENT_GT_C6_RESIDENCY:
>>>        return xe_gt_idle_residency_msec(&gt->gtidle);
>>>+    case XE_PMU_EVENT_GT_ACTUAL_FREQUENCY:
>>>+    case XE_PMU_EVENT_GT_REQUESTED_FREQUENCY:
>>>+        return div_u64(xe_get_pmu_sample(pmu, gt->info.id,
>>>+                   id),
>>
>>keep in the line above, it doesn't help readability.
>ok.
>>
>>>+                   USEC_PER_SEC /* to MHz */);
>>
>>why is the unit nsec -> usec when storing, couldn't we just use
>>NSEC_PER_SEC here?
>Yup.
>>
>>
>>>    }
>>>
>>>    return 0;
>>>@@ -143,7 +194,7 @@ static void xe_pmu_event_update(struct 
>>>perf_event *event)
>>>
>>>static void xe_pmu_event_read(struct perf_event *event)
>>>{
>>>-    struct xe_device *xe = container_of(event->pmu, typeof(*xe), 
>>>pmu.base);
>>>+    struct xe_device *xe = event_to_xe(event);
>>>    struct xe_pmu *pmu = &xe->pmu;
>>>
>>>    if (!pmu->registered) {
>>>@@ -154,8 +205,105 @@ static void xe_pmu_event_read(struct 
>>>perf_event *event)
>>>    xe_pmu_event_update(event);
>>>}
>>>
>>>+static bool gt_pmu_event_active(struct xe_pmu *pmu, uint32_t id, 
>>>uint32_t gt_id)
>>>+{
>>>+    return pmu->active_mask[gt_id] & BIT_ULL(id);
>>>+}
>>>+
>>>+static bool pmu_needs_timer(struct xe_pmu *pmu)
>>>+{
>>>+    struct xe_device *xe = container_of(pmu, typeof(*xe), pmu);
>>>+    struct xe_gt *gt;
>>>+    int i;
>>>+
>>>+    for_each_gt(gt, xe, i)
>>>+        if (gt_pmu_event_active(pmu, 
>>>XE_PMU_EVENT_GT_ACTUAL_FREQUENCY, i) ||
>>>+            gt_pmu_event_active(pmu, 
>>>XE_PMU_EVENT_GT_REQUESTED_FREQUENCY, i))
>>>+            return true;
>>>+
>>>+    return false;
>>>+}
>>>+
>>>+static void xe_pmu_start_timer(struct xe_pmu *pmu, uint32_t gt_id)
>>>+{
>>>+    /* Timer is per device */
>>>+    if (!pmu->timer_enabled && pmu_needs_timer(pmu)) {
>>>+        pmu->timer_enabled = true;
>>>+        pmu->timer_last = ktime_get();
>>>+        hrtimer_start_range_ns(&pmu->timer,
>>>+                       ns_to_ktime(XE_HRTIMER_INTERVAL_NS), 0,
>>>+                       HRTIMER_MODE_REL_PINNED);
>>>+    }
>>>+}
>>>+
>>>+static void
>>>+xe_sample_gt_frequency(struct xe_gt *gt, uint32_t period_ns)
>>>+{
>>>+    struct xe_device *xe = gt_to_xe(gt);
>>>+    struct xe_pmu *pmu = &xe->pmu;
>>>+    uint32_t act_freq, cur_freq;
>>>+    int ret;
>>>+
>>>+    if (gt_pmu_event_active(pmu, 
>>>XE_PMU_EVENT_GT_ACTUAL_FREQUENCY, gt->info.id)) {
>>>+
>>
>>drop this line
>ok.
>>
>>>+        /* Actual freq will be 0 when GT is in C6 */
>>>+        act_freq = xe_guc_pc_get_act_freq(&gt->uc.guc.pc);
>>>+        xe_store_pmu_sample(pmu, gt->info.id, 
>>>XE_PMU_EVENT_GT_ACTUAL_FREQUENCY,
>>>+                 act_freq, period_ns / NSEC_PER_USEC);
>>>+    }
>>>+
>>>+    if (gt_pmu_event_active(pmu, 
>>>XE_PMU_EVENT_GT_REQUESTED_FREQUENCY, gt->info.id)) {
>>>+        ret = xe_guc_pc_get_cur_freq(&gt->uc.guc.pc, &cur_freq);
>>>+        if (!ret)
>>>+            xe_store_pmu_sample(pmu, gt->info.id, 
>>>XE_PMU_EVENT_GT_REQUESTED_FREQUENCY,
>>>+                     cur_freq, period_ns / NSEC_PER_USEC);
>>>+    }
>>>+}
>>>+
>>>+static enum hrtimer_restart xe_sample(struct hrtimer *hrtimer)
>>>+{
>>>+    struct xe_pmu *pmu = container_of(hrtimer, struct xe_pmu, timer);
>>>+    struct xe_device *xe = container_of(pmu, typeof(*xe), pmu);
>>>+    u64 time_diff_ns;
>>>+    struct xe_gt *gt;
>>>+    ktime_t now;
>>>+    int i;
>>>+
>>>+    if (!READ_ONCE(pmu->timer_enabled))
>>>+        return HRTIMER_NORESTART;
>>>+
>>>+    now = ktime_get();
>>>+    time_diff_ns = ktime_to_ns(ktime_sub(now, pmu->timer_last));
>>>+    pmu->timer_last = now;
>>>+
>>>+    /*
>>>+     * The passed in period includes the time needed for grabbing 
>>>the forcewake.
>>
>>I don't think this is true anymore, is it?
>>
>>xe_sample()
>>  1. calculate time_diff at the beginning of the function
>>  2. for each gt, readout freq samples, using the time_diff, may include
>>     delays on forcewake, but that is not included in the time_diff
>>  3. htimer is adjusted to timer_last + period
>yup, makes sense.
>>
>>>+     */
>>>+    for_each_gt(gt, xe, i)
>>>+        xe_sample_gt_frequency(gt, time_diff_ns);
>>>+
>>>+    hrtimer_forward(hrtimer, now, ns_to_ktime(XE_HRTIMER_INTERVAL_NS));
>>>+
>>>+    return HRTIMER_RESTART;
>>>+}
>>>+
>>>static void xe_pmu_enable(struct perf_event *event)
>>>{
>>>+    struct xe_pmu *pmu = event_to_pmu(event);
>>>+    struct xe_gt *gt = event_to_gt(event);
>>>+    uint32_t id = config_to_event_id(event->attr.config);
>>>+    unsigned long flags;
>>>+
>>>+    raw_spin_lock_irqsave(&pmu->lock, flags);
>>>+
>>>+    /* Update event mask */
>>>+    pmu->active_mask[gt->info.id] |= BIT_ULL(id);
>>>+    pmu->n_active[gt->info.id][id]++;
>>>+
>>>+    /* Start a timer, if needed, to collect samples */
>>>+    xe_pmu_start_timer(pmu, gt->info.id);
>>>+
>>>+    raw_spin_unlock_irqrestore(&pmu->lock, flags);
>>>    /*
>>>     * Store the current counter value so we can report the 
>>>correct delta
>>>     * for all listeners. Even when the event was already enabled 
>>>and has
>>>@@ -166,7 +314,7 @@ static void xe_pmu_enable(struct perf_event *event)
>>>
>>>static void xe_pmu_event_start(struct perf_event *event, int flags)
>>>{
>>>-    struct xe_device *xe = container_of(event->pmu, typeof(*xe), 
>>>pmu.base);
>>>+    struct xe_device *xe = event_to_xe(event);
>>>    struct xe_pmu *pmu = &xe->pmu;
>>>
>>>    if (!pmu->registered)
>>>@@ -176,26 +324,53 @@ static void xe_pmu_event_start(struct 
>>>perf_event *event, int flags)
>>>    event->hw.state = 0;
>>>}
>>>
>>>+static void xe_pmu_disable(struct perf_event *event)
>>>+{
>>>+    struct xe_device *xe = event_to_xe(event);
>>>+    struct xe_pmu *pmu = &xe->pmu;
>>>+    unsigned long flags;
>>>+    uint32_t id = config_to_event_id(event->attr.config);
>>>+    uint32_t gt_id = config_to_gt_id(event->attr.config);
>>>+
>>>+    raw_spin_lock_irqsave(&pmu->lock, flags);
>>>+
>>>+    if (--pmu->n_active[gt_id][id] == 0) {
>>>+        pmu->active_mask[gt_id] &= ~BIT_ULL(id);
>>>+        pmu->timer_enabled &= pmu_needs_timer(pmu);
>>>+    }
>>>+
>>>+    raw_spin_unlock_irqrestore(&pmu->lock, flags);
>>>+}
>>>+
>>>static void xe_pmu_event_stop(struct perf_event *event, int flags)
>>>{
>>>-    struct xe_device *xe = container_of(event->pmu, typeof(*xe), 
>>>pmu.base);
>>>+    struct xe_device *xe = event_to_xe(event);
>>>    struct xe_pmu *pmu = &xe->pmu;
>>>+    uint32_t id = config_to_event_id(event->attr.config);
>>>+
>>>+    XE_WARN_ON(id >= XE_PMU_MAX_EVENT_TYPES);
>>
>>if not using a linked list as suggested, please drop this. Instead block
>>the event init from succeeding.
>
>ok.
>
>Thanks,
>
>Vinay.
>
>>
>>>
>>>-    if (pmu->registered)
>>>+    if (pmu->registered) {
>>>        if (flags & PERF_EF_UPDATE)
>>>            xe_pmu_event_update(event);
>>>
>>>+        xe_pmu_disable(event);
>>>+    }
>>>+
>>>    event->hw.state = PERF_HES_STOPPED;
>>>}
>>>
>>>static int xe_pmu_event_add(struct perf_event *event, int flags)
>>>{
>>>-    struct xe_device *xe = container_of(event->pmu, typeof(*xe), 
>>>pmu.base);
>>>+    struct xe_device *xe = event_to_xe(event);
>>>    struct xe_pmu *pmu = &xe->pmu;
>>>+    uint32_t id = config_to_event_id(event->attr.config);
>>>
>>>    if (!pmu->registered)
>>>        return -ENODEV;
>>>
>>>+    XE_WARN_ON(id >= XE_PMU_MAX_EVENT_TYPES);
>>
>>ditto.
>>
>>Lucas De Marchi
>>
>>>+
>>>    if (flags & PERF_EF_START)
>>>        xe_pmu_event_start(event, flags);
>>>
>>>@@ -270,6 +445,10 @@ static ssize_t event_attr_show(struct device *dev,
>>>    XE_EVENT_ATTR_GROUP(v_, id_, &pmu_event_ ##v_.attr.attr)
>>>
>>>XE_EVENT_ATTR_SIMPLE(gt-c6-residency, gt_c6_residency, 
>>>XE_PMU_EVENT_GT_C6_RESIDENCY, "ms");
>>>+XE_EVENT_ATTR_SIMPLE(gt-actual-frequency, gt_actual_frequency,
>>>+             XE_PMU_EVENT_GT_ACTUAL_FREQUENCY, "Mhz");
>>>+XE_EVENT_ATTR_SIMPLE(gt-requested-frequency, gt_requested_frequency,
>>>+             XE_PMU_EVENT_GT_REQUESTED_FREQUENCY, "Mhz");
>>>
>>>static struct attribute *pmu_empty_event_attrs[] = {
>>>    /* Empty - all events are added as groups with .attr_update() */
>>>@@ -283,6 +462,8 @@ static const struct attribute_group 
>>>pmu_events_attr_group = {
>>>
>>>static const struct attribute_group *pmu_events_attr_update[] = {
>>>    &pmu_group_gt_c6_residency,
>>>+    &pmu_group_gt_actual_frequency,
>>>+    &pmu_group_gt_requested_frequency,
>>>    NULL,
>>>};
>>>
>>>@@ -290,8 +471,11 @@ static void set_supported_events(struct 
>>>xe_pmu *pmu)
>>>{
>>>    struct xe_device *xe = container_of(pmu, typeof(*xe), pmu);
>>>
>>>-    if (!xe->info.skip_guc_pc)
>>>+    if (!xe->info.skip_guc_pc) {
>>>        pmu->supported_events |= BIT_ULL(XE_PMU_EVENT_GT_C6_RESIDENCY);
>>>+        pmu->supported_events |= 
>>>BIT_ULL(XE_PMU_EVENT_GT_ACTUAL_FREQUENCY);
>>>+        pmu->supported_events |= 
>>>BIT_ULL(XE_PMU_EVENT_GT_REQUESTED_FREQUENCY);
>>>+    }
>>>}
>>>
>>>/**
>>>@@ -306,6 +490,8 @@ static void xe_pmu_unregister(void *arg)
>>>    if (!pmu->registered)
>>>        return;
>>>
>>>+    hrtimer_cancel(&pmu->timer);
>>>+
>>>    pmu->registered = false;
>>>
>>>    perf_pmu_unregister(&pmu->base);
>>>@@ -334,6 +520,11 @@ int xe_pmu_register(struct xe_pmu *pmu)
>>>    if (IS_SRIOV_VF(xe))
>>>        return 0;
>>>
>>>+    raw_spin_lock_init(&pmu->lock);
>>>+
>>>+    hrtimer_init(&pmu->timer, CLOCK_MONOTONIC, HRTIMER_MODE_REL);
>>>+    pmu->timer.function = xe_sample;
>>>+
>>>    name = kasprintf(GFP_KERNEL, "xe_%s",
>>>             dev_name(xe->drm.dev));
>>>    if (!name)
>>>diff --git a/drivers/gpu/drm/xe/xe_pmu_types.h 
>>>b/drivers/gpu/drm/xe/xe_pmu_types.h
>>>index f5ba4d56622c..cd68cba58693 100644
>>>--- a/drivers/gpu/drm/xe/xe_pmu_types.h
>>>+++ b/drivers/gpu/drm/xe/xe_pmu_types.h
>>>@@ -10,6 +10,7 @@
>>>#include <linux/spinlock_types.h>
>>>
>>>#define XE_PMU_MAX_GT 2
>>>+#define XE_PMU_MAX_EVENT_TYPES    64
>>>
>>>/**
>>> * struct xe_pmu - PMU related data per Xe device
>>>@@ -34,6 +35,34 @@ struct xe_pmu {
>>>     * @supported_events: Bitmap of supported events, indexed by 
>>>event id
>>>     */
>>>    u64 supported_events;
>>>+    /**
>>>+     * @lock: Lock protecting enable mask and sampling
>>>+     */
>>>+    raw_spinlock_t lock;
>>>+    /**
>>>+     * @active_mask: Bit representation of active events
>>>+     */
>>>+    u64 active_mask[XE_PMU_MAX_GT];
>>>+    /**
>>>+     * @n_active: Counts for the enabled events
>>>+     */
>>>+    unsigned int n_active[XE_PMU_MAX_GT][XE_PMU_MAX_EVENT_TYPES];
>>>+    /**
>>>+     * @timer: Timer for sampling GT frequency.
>>>+     */
>>>+    struct hrtimer timer;
>>>+    /**
>>>+     * @timer_last: Timestmap of the previous timer invocation.
>>>+     */
>>>+    ktime_t timer_last;
>>>+    /**
>>>+     * @timer_enabled: Should the internal sampling timer be running.
>>>+     */
>>>+    bool timer_enabled;
>>>+    /**
>>>+     * @event_sample: Store freq related counters.
>>>+     */
>>>+    u64 event_sample[XE_PMU_MAX_GT][XE_PMU_MAX_EVENT_TYPES];
>>>};
>>>
>>>#endif
>>>-- 
>>>2.38.1
>>>
