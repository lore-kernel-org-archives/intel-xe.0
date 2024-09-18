Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F58FCCD1A3
	for <intel-xe@archiver.kernel.org>; Wed, 18 Sep 2024 12:55:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D44CE10E0F2;
	Wed, 18 Sep 2024 12:55:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dK4to7s3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE2B410E0F2
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Sep 2024 12:55:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726664137; x=1758200137;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=QoXFJeXm6FSTzhXFZm0gnU9qAjrySSlP9JkRymb99ow=;
 b=dK4to7s3HrPKjEVE9eUyMwvwXq3YHi0MsHJWW3K79i453w9azJYngjoF
 Q10Dqg0ysavaMVWSnhC2ceEEYOnSPgBL6OUfeOsAnRYjS8ZjMVJOg26K5
 IyHrl6Ot37Q5Env6fhPsI7btBZCN3dsZR/C0PW9zLg/dN2hbWLHlQbmhX
 tjH7OPF/qkCr6vqxu7/CEl9mXMgrloQdduPCBlrmT2uYCqU/wW6KYvRle
 6sR6tXVvAkiE5THiGSwvSBc/vQxv9U7fVVg2p7LHFrYx9fAIAWkRtMPHZ
 wFQw3IwdugDhYWn//9H6XYue+GlUycJr1vSBp4fFmCnNA/bnQjZOMgRAn A==;
X-CSE-ConnectionGUID: Pl+kH7RCSkeFGAVA47idTg==
X-CSE-MsgGUID: P2UeGHoGRdmHsrtsSye9iQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11199"; a="25665483"
X-IronPort-AV: E=Sophos;i="6.10,238,1719903600"; d="scan'208";a="25665483"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2024 05:55:37 -0700
X-CSE-ConnectionGUID: 8VHSdjzTSb2T5QEcBL/R+Q==
X-CSE-MsgGUID: tctxZPH3QAO1PvUuidU4AA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,238,1719903600"; d="scan'208";a="73935364"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Sep 2024 05:55:36 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 18 Sep 2024 05:55:35 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 18 Sep 2024 05:55:35 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 18 Sep 2024 05:55:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mdgfAF4tjhRBz/myEpW1liE7S685y2y8eoL6h3Dw47rHrGvZSBXNcvzY8Q06kyGFGnfBwJo0ZaDGIeDV+I2/9Vbx7wRJtygWC5efYVuIegqwVvKj2OnZvyeSewCtjyjTslv7RJ634ugeQ2xqkUlZOU1b9iL493byZNdJK3KWCJtP7papC/EUAL44LidCQMbdMEaOC7Lw8N/SQ9G3lbe/U3eWKF2G7j6c3kDri/D/0jL8n4O1elVXVrbrcLA98L4Fc6qNTNRtG6vMEXrTURAg/yTmf8AxusiM/WcTe2v34ApXwH/JLKQkRj4DxI34UYuaJGxZ1fe6KQRij7Q3r8p8Aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=820jM125eWwD8d3SZ1xl27fhXI2gD9HE4eoV3wnOvME=;
 b=X7rmFgHWA9fxU8BT9ckeBrZrCWJZpu7YcZ9/t05Xa32z3D/GbEHDYHzZOfsrwl/1ZIqIGQ5KIlv2IH1sVS1qYsW2SCykxc2PDjla4eyED3Xd37MZ1Jam7Qli+1ruHjbJLNxAmDRFsnvG7RLwTy/bhzYvbN3xx4obT+P9qYwdk94M6f8QUM7OyKwiENm3tEl73XYcc5bNblV4TJ5NssT+Sa8yYlDansEsNuz5/5yEPIBTSn9fatM8AXdvAx9rVpeazExncke35jQ0/D1AFEFU7tZwPKtF41bdMb2nwNqZCpCnHnEEKTsnGxhZB3Q1yEmuoi4DeHgvwu2tAx8aVe8MQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7828.namprd11.prod.outlook.com (2603:10b6:930:78::8)
 by SA2PR11MB5161.namprd11.prod.outlook.com (2603:10b6:806:fa::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.17; Wed, 18 Sep
 2024 12:55:33 +0000
Received: from CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d]) by CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d%3]) with mapi id 15.20.7962.022; Wed, 18 Sep 2024
 12:55:33 +0000
Date: Wed, 18 Sep 2024 14:55:25 +0200
From: Francois Dugast <francois.dugast@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Matthew Brost <matthew.brost@intel.com>, "Michal
 Wajdeczko" <michal.wajdeczko@intel.com>
Subject: Re: [RFC v1] drm/xe: Use fault injection infrastructure to find
 issues at probe time
Message-ID: <ZurNvbT5aSZzLtjR@fdugast-desk>
References: <20240913143305.2262927-1-francois.dugast@intel.com>
 <ZuSdddkrFZgCDkqt@intel.com> <ZufwMSTB4IlNcOKX@fdugast-desk>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZufwMSTB4IlNcOKX@fdugast-desk>
Organization: Intel Corporation
X-ClientProxiedBy: WA2P291CA0024.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::15) To CY8PR11MB7828.namprd11.prod.outlook.com
 (2603:10b6:930:78::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7828:EE_|SA2PR11MB5161:EE_
X-MS-Office365-Filtering-Correlation-Id: caeb4728-50c5-46a5-3676-08dcd7e12e7f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?TMpzV47T3/EwGmfUnLOxeoA2JlIt7eHZpVI7jTLa3N0mbyRWURkISB2YEP?=
 =?iso-8859-1?Q?oJQYpiCV16rCn1BkIJE/Sgn2hmCwY11wqoQ6ujLVvAYMzt5hBld46ISe2N?=
 =?iso-8859-1?Q?dVaizGbH0rcixooDeLFUq0vMEt43i/jMSf0r8t0Lj7My5VzgwGogAPh9aZ?=
 =?iso-8859-1?Q?Oii4gGmPXk9hoimALZ6ZVraFbqj6ADK/MKSCDv3O0QkT5j/GQxLVkwhCP4?=
 =?iso-8859-1?Q?fPqxpggXicANds1+zsgNE8+1SEdX8N1HxwluZ+vzm0jdRgEcZHR1sdmrVQ?=
 =?iso-8859-1?Q?9w65v5lIIUxpt+5usNfKT0KD+pgT5uE6+dSqaUucEF7k49ryXEqQkgBjsR?=
 =?iso-8859-1?Q?aFVg20F5YBjLK8uxdD/3FnVfONik976rTIGUByLOGbeprAHwV4TsYKD5+X?=
 =?iso-8859-1?Q?cLJFHEUHIwYsivwblE3CUT8F7mZGUnR02mTJE60nfuso/9P2cmUKCOevnz?=
 =?iso-8859-1?Q?T65IRa6xi4PCfL3n4yMTxj4ZjkyqdkKLZdgIA8VWFB/xjRctjnSvTY/uEA?=
 =?iso-8859-1?Q?icBfBR1fg9BnNSk3lkxXmOimuGHVcU45vU7Y7qtatdE3s3kvArWEPfRPgm?=
 =?iso-8859-1?Q?QiKM1FqVINRzywWZlJfncr4zGLKEQY7LzkW4W3yWJ9j6YIKWF/mHbRgxSf?=
 =?iso-8859-1?Q?roOBVzojoLAvHW2mfIS7zby3K0lOQLTaj8bS+rk914QUvfy7fj29T8RD7x?=
 =?iso-8859-1?Q?f8+zvvWiBwYu0EkFNsnygkE350tyhej8EiBiBpMLoU+mMPQRt5EoUlzaic?=
 =?iso-8859-1?Q?GkQZU8GpCQnRcgJ0F9WGPNvuGZvoJWElUJu2WwEleYgCNWNsswn4XEwI+3?=
 =?iso-8859-1?Q?cVrloko1kGu1tWrxeP1w5svUKYS1vf94pPTo0UQcEjNqpHz2QeWPyOOw9c?=
 =?iso-8859-1?Q?H01CbUdY4Xr1sRFy/jtGk9MGB084fYW08//7kbgOvaZBsIIwbFofO+oYRb?=
 =?iso-8859-1?Q?DMF4X+DuwlUri01gWyazTac04ghT/AST/L1Eegx3FTWfQxh8YCX9KW9rHK?=
 =?iso-8859-1?Q?MlFdUhJJ+XlgT/PNxDFu+ZNB5UoxV5TBMrrjSrxBZQCffs8hgS1c8wZOaj?=
 =?iso-8859-1?Q?8VV9CFSdhtJwmxFJc6aPZRQNKrQP4pK+Sp6Q8tg9alZhlpvjCSVB+IoOEF?=
 =?iso-8859-1?Q?lMXaRliiBihoCV24fFvApdHBpSy2+2woHBGBx2RjwQCPpGPkgGZrGfNPdN?=
 =?iso-8859-1?Q?K+tCCpO8WVjqwNJMA8Cl+kCBcKSmdViQf+LyJEnk0wjWgE6GFOoD1cmyW4?=
 =?iso-8859-1?Q?PYd0GUME4to5N8b3E5atxpqTmZmAxT/1UDXdmG90m0wZJS0o6nSEmKDlut?=
 =?iso-8859-1?Q?hxNOr8E8gxnhgs2ez8My+jVBV3ht7mrOsPabs1+ffVoFAqM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7828.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?ATIjL3MDpTmE6heRaukJYwVXE1M7XjpIyr3xVkWaP/iEVR65iYNeLSqyD7?=
 =?iso-8859-1?Q?B2sxdiCVQUju6DEcxHhQiPF8dHWA2XxHZ5EO0L8j+w+moJgRfJMk0+xOHD?=
 =?iso-8859-1?Q?9h+24A2X47FrLt6qeDick0gdaJZWl/95KmOL0cqVGjBTy0MPhSL0feV2Ka?=
 =?iso-8859-1?Q?6U8dyufhI9Nb7/oK96F0RjZT9rAtDCl2Qy+PzxVn7uy237pkYoqiWgT5Fs?=
 =?iso-8859-1?Q?79rLy/3nlczmPqnApNcR26ilfEbsJaqti+peKxc2knd7ZwVgwoaCMbqa44?=
 =?iso-8859-1?Q?nCIe/Af47Tj+SG1kheCOMkBrizGqWSgctTyMpZRRWFagsYl6Gea5HurSnK?=
 =?iso-8859-1?Q?lpB6Bv75YY9WtV+YEbkSS4hul5VsY0b2rei31Xia88XkIttcrCvb7x70KH?=
 =?iso-8859-1?Q?S2AFYz3FuoeXzBV2T9tQ4sGjiyJL8OYDPgT0hsnS4nlc7V0iSizUsTp2T6?=
 =?iso-8859-1?Q?Ylouyw1gXA6k7lVEXYg7twt8vVnPF4q0pcvkfEJXYZc/TbaIOMKyLd0jBN?=
 =?iso-8859-1?Q?lmrUwM4XDA977cw/aiFNgTHdgyaNr3KwQnWcmvpsVh2m3tZE9E6afZfnuv?=
 =?iso-8859-1?Q?ECj3QZLiyZdFXjw+6ZFNcUemXUPqC3/7TpDbQHGYHgbTmqi1M8z6YGCxvv?=
 =?iso-8859-1?Q?4EypWhxs/x145HDTZDrOtS8PQbxOAU7yFpr8F7sLkBoRpH6pfxFPj7SSYR?=
 =?iso-8859-1?Q?NNZ+1caEqol1FZYs+lHKuNFoNSHrsnYGKDeFKD76UFQubegpMPeoJIsv2w?=
 =?iso-8859-1?Q?gvm2YI/cUXbSwZ9DPFo2cDpG7Mi+Tw7nb+I+1Tmq4D/4Aku2T0+1l+xxEb?=
 =?iso-8859-1?Q?FY/8n6tD8SRgyXh63ZLaNrq0fWAQspbTMFUHZE/BJjUImo8VdGzTgf0XFv?=
 =?iso-8859-1?Q?Fk3rWIPrt9qqzMAWLWN10nObmGmc6dApSWU1BDxT04oUwI5Sw/amya9K5p?=
 =?iso-8859-1?Q?Ibn8dDqHnMFZeMjdzLybODHoExi4BLw+v1FUnUB+zHb0Chvn5VEcpKC7Ui?=
 =?iso-8859-1?Q?kl92LXsgpyCnbHzQ4dJ/YLxl58jqRRGiCfzJYpv9blvoXx0972es+YIGwk?=
 =?iso-8859-1?Q?X1XJ69zIK+qpbdLsqhkYEvK63ETtx5yOoBigIO72X10rv5tpWGCC4HHP2K?=
 =?iso-8859-1?Q?78NOzhPCv189Yw1YWHKfVsNAWCSEK5pjlXTPySW7DDnBovQNHMjet6ZZQf?=
 =?iso-8859-1?Q?NMkPjb0uSddQtGpjVtMJgovpu27JsQxo0vL7GOcL4KvdOQIWtVWztLAt7O?=
 =?iso-8859-1?Q?otiX9OLEPc2ksocuGl0FRTihglK8nAmnBNxDJ5li7keuKKmMWbmum7wOFj?=
 =?iso-8859-1?Q?L2WL9ytInByweIi1WGyLtsdYg79c8GR5a5xzxkn1rD+LsDis487Z56eRBE?=
 =?iso-8859-1?Q?hJ+ewg9JnFWxi8Uki7ze4qswU593EX7IefGtNE/z9pOdxl4mieVcLmCHPG?=
 =?iso-8859-1?Q?OEI83tantKa4d4/liJUIJrEhYkjemIMX1NFA22n3+ovssqmYtQoUgnkavl?=
 =?iso-8859-1?Q?B1T+kNS+6UNXWnA6dxbdGtCVcdc20GkW+Ln5ptQex7tBUQjfNtfOhbun8c?=
 =?iso-8859-1?Q?elPVNt+wP31sqgAqWRaalENqKUJ6bRRLpE2qKfi6d/bV1FL9H1MQpmSgHO?=
 =?iso-8859-1?Q?GVXqHILaS5WW+xEEEYL6Myfhux+D0+IzvSGuXqzwcH0b6Ory9XCZDcTw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: caeb4728-50c5-46a5-3676-08dcd7e12e7f
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7828.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2024 12:55:33.0210 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6lyKSYoOTBCf5Trinolm7kKMjdPASBuG5VJERwFiQESZBm9Dxm531l90rIzigw87Ihny31LNRRV5PigmzlvPKXHGtw8FehK/Ihf3U7kZLpg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5161
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

On Mon, Sep 16, 2024 at 10:45:37AM +0200, Francois Dugast wrote:
> On Fri, Sep 13, 2024 at 04:15:49PM -0400, Rodrigo Vivi wrote:
> > On Fri, Sep 13, 2024 at 04:33:05PM +0200, Francois Dugast wrote:
> > > This RFC is a rework of https://patchwork.freedesktop.org/series/137314/
> > > but instead of importing custom macros from i915, it makes use of the
> > > standard kernel fault injection infrastructure, see fault-injection.rst.
> > > 
> > > In particular, it leverages error injectable functions with the macro
> > > ALLOW_ERROR_INJECTION(). This macro requires minimal code changes to the
> > > faulting function, if it meets the injectable functions requirements:
> > > fault-injection.html#requirements-for-the-error-injectable-functions
> > > 
> > > Unfortunately this is not the case in most of the injection points of the
> > > original series, so a wrapper is added if needed. Only a few examples are
> > > shown in this RFC to discuss the proper pattern to apply.
> > > 
> > > The return code of the functions using ALLOW_ERROR_INJECTION() can be
> > > conditionnally modified at runtime by tuning some debugfs entries. This
> > > requires CONFIG_FUNCTION_ERROR_INJECTION (among others).
> > > 
> > > One way to use fault injection at probe time by making each of those
> > > functions fail one at a time is:
> > > 
> > >     FAILTYPE=fail_function
> > >     DEVICE="0000:00:08.0" # depends on the system
> > >     ERRNO=-12 # -ENOMEM, other value might be needed depending on error handling
> > > 
> > >     echo N > /sys/kernel/debug/$FAILTYPE/task-filter
> > >     echo 100 > /sys/kernel/debug/$FAILTYPE/probability
> > >     echo 0 > /sys/kernel/debug/$FAILTYPE/interval
> > >     echo -1 > /sys/kernel/debug/$FAILTYPE/times
> > >     echo 0 > /sys/kernel/debug/$FAILTYPE/space
> > >     echo 1 > /sys/kernel/debug/$FAILTYPE/verbose
> > > 
> > >     modprobe xe
> > >     echo $DEVICE > /sys/bus/pci/drivers/xe/unbind
> > > 
> > >     grep -oP "^.* \[xe\]" /sys/kernel/debug/$FAILTYPE/injectable | cut -d ' ' -f 1 | while read -r FUNCTION ; do
> > >         echo "Injecting fault in $FUNCTION"
> > >         echo "" > /sys/kernel/debug/$FAILTYPE/inject
> > >         echo $FUNCTION > /sys/kernel/debug/$FAILTYPE/inject
> > >         printf %#x $ERRNO > /sys/kernel/debug/$FAILTYPE/$FUNCTION/retval
> > >         echo $DEVICE > /sys/bus/pci/drivers/xe/bind
> > >     done
> > > 
> > >     rmmod xe
> > > 
> > > Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> > > Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> > > Cc: Matthew Brost <matthew.brost@intel.com>
> > > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>

+ Michal

Any thoughts on this approach?

> > > ---
> > >  drivers/gpu/drm/xe/xe_device.c | 37 +++++++++++++++++++++++++++++++---
> > >  drivers/gpu/drm/xe/xe_tile.c   | 18 +++++++++++++++++
> > >  drivers/gpu/drm/xe/xe_wopcm.c  |  3 +++
> > >  3 files changed, 55 insertions(+), 3 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> > > index 4d3c794f134c..2db62aa45b39 100644
> > > --- a/drivers/gpu/drm/xe/xe_device.c
> > > +++ b/drivers/gpu/drm/xe/xe_device.c
> > > @@ -6,6 +6,7 @@
> > >  #include "xe_device.h"
> > >  
> > >  #include <linux/delay.h>
> > > +#include <linux/fault-inject.h>
> > >  #include <linux/units.h>
> > >  
> > >  #include <drm/drm_aperture.h>
> > > @@ -300,6 +301,37 @@ static void xe_device_destroy(struct drm_device *dev, void *dummy)
> > >  	ttm_device_fini(&xe->ttm);
> > >  }
> > >  
> > > +/* Wrapper for fault injection */
> > > +static noinline int device_create_ttm_device_init(struct xe_device *xe)
> > > +{
> > > +	/*
> > > +	 * In case of error injection, the flow is modified because ttm_device_init()
> > > +	 * executes (likely without error) but the return code is overridden in any
> > > +	 * case to indicate an error in ttm_device_init(), which likely did not
> > > +	 * occur.
> > > +	 */
> > > +	return ttm_device_init(&xe->ttm, &xe_ttm_funcs, xe->drm.dev,
> > > +			       xe->drm.anon_inode->i_mapping,
> > > +			       xe->drm.vma_offset_manager, false, false);
> > > +
> > > +	/*
> > > +	 * The alternative below would also change the flow because in case of error
> > > +	 * injection, ttm_device_init() would not be executed at all.
> > > +	 *
> > > +	 * int err = device_create_ttm_device_init_inject_fault();
> > > +	 * if (err)
> > > +	 *	return err;
> > > +	 * return ttm_device_init(&xe->ttm, &xe_ttm_funcs, xe->drm.dev,
> > > +	 *		       xe->drm.anon_inode->i_mapping,
> > > +	 *		       xe->drm.vma_offset_manager, false, false);
> > > +	 *
> > > +	 * ...
> > > +	 * static noinline int device_create_ttm_device_init_inject_fault() { return 0; }
> > > +	 * ALLOW_ERROR_INJECTION(device_create_ttm_device_init_inject_fault, ERRNO);
> > > +	 */
> > > +}
> > > +ALLOW_ERROR_INJECTION(device_create_ttm_device_init, ERRNO);
> > > +
> > >  struct xe_device *xe_device_create(struct pci_dev *pdev,
> > >  				   const struct pci_device_id *ent)
> > >  {
> > > @@ -316,9 +348,7 @@ struct xe_device *xe_device_create(struct pci_dev *pdev,
> > >  	if (IS_ERR(xe))
> > >  		return xe;
> > >  
> > > -	err = ttm_device_init(&xe->ttm, &xe_ttm_funcs, xe->drm.dev,
> > > -			      xe->drm.anon_inode->i_mapping,
> > > -			      xe->drm.vma_offset_manager, false, false);
> > > +	err = device_create_ttm_device_init(xe);
> > 
> > I believe the function name could be simplified to xe_device_init_ttm...
> 
> Yes indeed.
> 
> > 
> > >  	if (WARN_ON(err))
> > >  		goto err;
> > >  
> > > @@ -550,6 +580,7 @@ static int wait_for_lmem_ready(struct xe_device *xe)
> > >  
> > >  	return 0;
> > >  }
> > > +ALLOW_ERROR_INJECTION(wait_for_lmem_ready, ERRNO);
> > 
> > I liked how simple that is....
> 
> It is quite straightforward when the function is error injectable, which is
> often not the case. Especially this requirement is often not met: "The
> function does not execute any code which can change any state before the first
> error return."
> 
> This is why other examples in this patch require an extra wrapper, see below.
> 
> > 
> > >  
> > >  static void update_device_info(struct xe_device *xe)
> > >  {
> > > diff --git a/drivers/gpu/drm/xe/xe_tile.c b/drivers/gpu/drm/xe/xe_tile.c
> > > index dda5268507d8..22c0a42af9c2 100644
> > > --- a/drivers/gpu/drm/xe/xe_tile.c
> > > +++ b/drivers/gpu/drm/xe/xe_tile.c
> > > @@ -3,6 +3,8 @@
> > >   * Copyright © 2023 Intel Corporation
> > >   */
> > >  
> > > +#include <linux/fault-inject.h>
> > > +
> > >  #include <drm/drm_managed.h>
> > >  
> > >  #include "xe_device.h"
> > > @@ -99,6 +101,12 @@ static int xe_tile_alloc(struct xe_tile *tile)
> > >  	return 0;
> > >  }
> > >  
> > > +static noinline int tile_init_early_inject_fault(void)
> > > +{
> > > +	return 0;
> > > +}
> > > +ALLOW_ERROR_INJECTION(tile_init_early_inject_fault, ERRNO);
> > > +
> > >  /**
> > >   * xe_tile_init_early - Initialize the tile and primary GT
> > >   * @tile: Tile to initialize
> > > @@ -117,6 +125,16 @@ int xe_tile_init_early(struct xe_tile *tile, struct xe_device *xe, u8 id)
> > >  	tile->xe = xe;
> > >  	tile->id = id;
> > >  
> > > +	/*
> > > +	 * The flow is modified because xe_tile_init_early() fails before the
> > > +	 * first possible error, from xe_tile_alloc(). It is does not match the
> > > +	 * 2nd requirement of
> > > +	 * fault-injection.html#requirements-for-the-error-injectable-functions
> > > +	 */
> > 
> > I'm afraid I didn't understand this.
> 
> In this example we end up returning an error from an artificial code location:
> 
>     err = tile_init_early_inject_fault();
>     if (err)
>         return err;
> 
> ... before even starting to execute the first statement which could return a
> real error, xe_tile_alloc(). Not focusing on this particular example but in
> general this can have side effects and create false positives if the state
> is not changed as expected, either because the first statement that can fail
> was not executed at all, or because all was executed successfully but still
> reported as error.
> 
> Not sure if this is overthinking, after all this issue is also present with
> the i915 macro for error injection and maybe the pros outweigh the cons.
> 
> Francois
> 
> > 
> > and the name could perhaps start with fault_inject?!
> > 
> > or maybe:
> > 
> > xe_fault_inject_tile_init_early();
> 
> Sure, whatever helps easily identify wrappers only added for fault
> injection. Maybe we can even remove the xe_ prefix as the function can be
> static?
> 
> Francois
> 
> > 
> > > +	err = tile_init_early_inject_fault();
> > > +	if (err)
> > > +		return err;
> > > +
> > >  	err = xe_tile_alloc(tile);
> > >  	if (err)
> > >  		return err;
> > > diff --git a/drivers/gpu/drm/xe/xe_wopcm.c b/drivers/gpu/drm/xe/xe_wopcm.c
> > > index 93c82825d896..88a201122a22 100644
> > > --- a/drivers/gpu/drm/xe/xe_wopcm.c
> > > +++ b/drivers/gpu/drm/xe/xe_wopcm.c
> > > @@ -5,6 +5,8 @@
> > >  
> > >  #include "xe_wopcm.h"
> > >  
> > > +#include <linux/fault-inject.h>
> > > +
> > >  #include "regs/xe_guc_regs.h"
> > >  #include "xe_device.h"
> > >  #include "xe_force_wake.h"
> > > @@ -268,3 +270,4 @@ int xe_wopcm_init(struct xe_wopcm *wopcm)
> > >  
> > >  	return ret;
> > >  }
> > > +ALLOW_ERROR_INJECTION(xe_wopcm_init, ERRNO);
> > > -- 
> > > 2.43.0
> > > 
