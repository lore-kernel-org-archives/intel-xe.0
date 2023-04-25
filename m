Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31964C77B7C
	for <intel-xe@archiver.kernel.org>; Tue, 25 Apr 2023 23:13:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DE4510E1F0;
	Tue, 25 Apr 2023 23:13:18 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A87C210E1F0
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Apr 2023 23:13:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682464396; x=1714000396;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=cfe2AsSuCCqmSSRFfx8RdpFFCEg1tIoLHVqiSPleU68=;
 b=Er06jcvmHjTKtNwqvY9928IocfEkmOx1/3XQ4QkvsasLkPsbOU3tXZcK
 C/LgJdWzWzz3qhjiNV6/EvzIO710pluLNhgk0OkmRy/WLIpwLOkOYzrYA
 /eweoniNaAHLVpe98QzB33tuvZuA6c7dP/OytZujHjL4+deW5m8FAt1s4
 YnExbVkM0TtkkjeISj6+aNAozyPkBOpUEA8Qa89RVVKQvO8uxZ6mAAgjB
 9bMBKeDONIjnORszZ8kxQQe8QJmBoSGP5zUib38fCkNu69R8mji69j2q6
 Xeio2GCaTxIpLqL7Awa/Sc4sulK54DNlLxtrjEv8i1QFQfAKZwHdUF3pV w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10691"; a="327241802"
X-IronPort-AV: E=Sophos;i="5.99,226,1677571200"; d="scan'208";a="327241802"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2023 16:13:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10691"; a="696387996"
X-IronPort-AV: E=Sophos;i="5.99,226,1677571200"; d="scan'208";a="696387996"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga007.fm.intel.com with ESMTP; 25 Apr 2023 16:13:15 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 25 Apr 2023 16:13:14 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Tue, 25 Apr 2023 16:13:14 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.104)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Tue, 25 Apr 2023 16:13:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wd36okFwR7+d8k/jgxasjWxzhxGoofFe+12O4+jDHVeSu3+tS6+wopAVIojMQtTsx71DZHUOInL46FWG1wHHHZCywuQ3waEWFkxqzI7Ewpf0HEzjXK20+7exqC6o8ZjmgEHzfFb0J1qqFDH6KASjgZ9kqjiIUheiO7iiPKuI3SmkHLmYYWRv/r+h+Zhfp+sAW1+oTfdcJutfc37fNS1T4jRsvAecPtZNcAiUO4ABXvpKUKobl1c4c6WUm85ojdgaGqPaCQi1bsn0+CLU7XQ4jolBf4G/oovTr4lgNSAXdGyW+7r7seWwa8c3icSqdAKQuzuQqXzd6dH/kI7GYcNMOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fYVRrL+6YC4g9xrU/qJ+aDWWvHs9vyYIkOZypZwJkAI=;
 b=i4pHUHv1WTTao1SrnRNGWUBT3U7AZCU4/DD7FKc0ilyVVtodpx+6E1QpsLAVstdRXTrtd18eZ89eQ5ssycCgW4c+MQFNJC0H+xh7pozwyWIC87TOLBS+5OlWlbiJzqezPfugL3ef63tTehceFjZuSCVjnwT/F0AjLQjuSaXGDs+u1lgUgMK8Um4Q++3Q9Nuyp3funfmB2Mq7VDuwK3e+a6i6WJfSKOMv3URELD/3IUumEwOEG7C3ybBfSshkP+sxOaLv6SASra3KBkclWlKvVUonyF7qPZzbwtGqPg/GpN90XL1Q1ZgnD0wOGBSNRxmi+QYEh/voNcb+KLgI19bb2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DM4PR11MB6144.namprd11.prod.outlook.com (2603:10b6:8:af::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.34; Tue, 25 Apr
 2023 23:13:12 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4%3]) with mapi id 15.20.6319.034; Tue, 25 Apr 2023
 23:13:12 +0000
Date: Tue, 25 Apr 2023 16:13:10 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
Message-ID: <jaoxg7iio733vdhbfxeqrl3efq6dt6ojirbcvtazcg2sepj34w@6z76cml323df>
X-Patchwork-Hint: comment
References: <20230421223258.128781-1-lucas.demarchi@intel.com>
 <20230421223258.128781-13-lucas.demarchi@intel.com>
 <3286caad-48f5-01e0-6e15-4e15c69e3a3a@intel.com>
 <fk47pjv5rnfsnxac4goeqhwlolffa3wnsyejjn23b2ji2ud6ma@llik644c37ma>
 <475b902a-b734-53b6-cab1-4a78838a5a68@intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <475b902a-b734-53b6-cab1-4a78838a5a68@intel.com>
X-ClientProxiedBy: SJ0PR03CA0209.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::34) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DM4PR11MB6144:EE_
X-MS-Office365-Filtering-Correlation-Id: a80de77c-92aa-4500-dd50-08db45e2a44c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: flevAhTYvUEMCqkVIx8JWGE/AIVkEvSObIP6kABBf9/eo2+RApwIbM3nmioz7yTUlV0lcIeOa5crZt5KO1g/5VZQtbwJ2A9kNMtDz2sJuSSya/6rUw/dN8hAVDd/kzA1U6h4nRw8s90OQdKsHJv48PYme4GhEVUuyAG02j7yuJe28M9l+su4BtbSh4qPAP/XX7aIkgfQThY3ov8W7YaHWvP0LSvndTfMfKBecXsZeIYpKRU10hGiXHzpZG4l0SNGjorFhDOeqZz26q6ZHgaMCaG+KwgFSNFbDcWBHbM9aP7uP9P+ga/nLmUVmUQ4i0ll+ZpJHIaYuOnhaJVc57n2Vq9GK1+ffM8luVWJZjHzCDPFmy+yPk1nyb3LgT1GB327yIg8mVI3zWB1M0IntyrE99KafcmrTOP4nriMjlbgnj71hkjIx4vqqt33fFMmYpeqYNdlcfR2uR+lmD4nmw1gZ7p+WIoK9qg+hfN92jcFyoyd6e0NeC8vCgxYpPW58eFUpKu34XBdFjaVpLchKZKFtosUSJvS6OigOujiW00sx67GfshshlEyhpTDu5rkyf8q
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(366004)(136003)(346002)(396003)(39860400002)(376002)(451199021)(4326008)(66946007)(66556008)(6636002)(66476007)(5660300002)(316002)(41300700001)(8936002)(6862004)(2906002)(30864003)(8676002)(478600001)(83380400001)(54906003)(86362001)(6486002)(26005)(6506007)(6512007)(9686003)(53546011)(107886003)(186003)(33716001)(82960400001)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?6fqg+f84SlNcCTINRrY/JhZAUmcCpKXqavsvtGvxnSYlcWmDeUNmsaueHM?=
 =?iso-8859-1?Q?gFeSMy8+Eo8MM1axHJDVlaDYsEtZBaATOYa7q+Z+8xOcclN5QSlYaISOHb?=
 =?iso-8859-1?Q?9ii2+Sp+7MRelAlKCfaumgah2IzlyzZv6mzNAEZzc6Cke7psdEvun7FrSw?=
 =?iso-8859-1?Q?yTlLirQFVu3kDMfQoGOllSWAAOUTAzHHhZGiqPmEZJMRfW+eZe295ar9pq?=
 =?iso-8859-1?Q?7CgHmmavxFhPQmH7DkX7fdqSQWgeM/tbGG8V0fe4qhulvtITXA/vIl+zmB?=
 =?iso-8859-1?Q?IKlrD3QzFGPBurmQlB8Gg3ZROWBeOWioQJn8z6j4fjf5SF/uxgi/95UFSq?=
 =?iso-8859-1?Q?SHYR0vHKYHHdFyOZelj+tqhl+I7rmfmG8F6dS+FLffSNu9Dh157muy8G2s?=
 =?iso-8859-1?Q?ebx4V6Vp9qkd4EK7W7XIu1XNR1PlPeIAuqXkcYmROmAmdMTIPFZnGwmBOj?=
 =?iso-8859-1?Q?hZR1x0L9kc2VMkw2c4f3VwTwz3tAbTUqb/qWcxtzGtYmoMrLfyE2K/fWyP?=
 =?iso-8859-1?Q?PnTzwfJgehPxAdEJZxeyhRoNTQapK2ImxsN7Qjqp2/2krNctX628DMdZGT?=
 =?iso-8859-1?Q?+wNo9jYasaEWU7Nws5ySj40mmVzEyqrydOAQRPoxX9ZP3Tevv1A03DZgro?=
 =?iso-8859-1?Q?1wvpOQof4Hs7ab6dw7YVsWXlVbEhW3kV6aQ3po7WXbX5YE1Sr1Zlxn9dfj?=
 =?iso-8859-1?Q?AGsEtgS1R/RkXbIsujLheFfadBpYpKYtfNaJmfS3WJG798PXzruTl0tYf6?=
 =?iso-8859-1?Q?rX0EfMD/HsG0kvsfAenFa1EYyAQAqs3t8Py453NNpYnaR/ha9SFgL0nSmy?=
 =?iso-8859-1?Q?9LZ2cbpelDmP01WKjQUA/iBPhDv5ewxvGfjN7d3uqwN8zA3GHxF6m+efpU?=
 =?iso-8859-1?Q?Y2QLBBR2+rOwyoEZv6JvdYO+D9wdV2Fl6ZN+0kGWkCqG4HvQwnVh5g55Xv?=
 =?iso-8859-1?Q?A4T0VHTz1vcnFK9LMcDc1q/aR2cQ9XaaUWkDfXZHwfuA29hkjr5eDZ5bpL?=
 =?iso-8859-1?Q?Td9ERq9CrvriJLdd/uTyVqCZhzYYkd5HW7of4uVvdsLXYfjSMSgzGgDOos?=
 =?iso-8859-1?Q?ycaqT2xoLlB/gETxkCYYjWtDt6aG19vFrXk15CgD/COe2DKDOmH5VaHCrw?=
 =?iso-8859-1?Q?NgrSbBSN2eazC5wcTlQaaXXeQxqb3diM5CebDs7bSye/CTHkg0ep4eEMgr?=
 =?iso-8859-1?Q?qfy7gzYD3uWhHnvfkFAs8o7L96H+TXFtwVHFCxoloNehRHUR30v//KIYvr?=
 =?iso-8859-1?Q?bEoZ4onDNEpQePI9Gutb33Ad/rmLHZRvTbXjgR1iQ5J32/9R8fq9R9IpBq?=
 =?iso-8859-1?Q?czSgKsHxo4CWvURH4321nqiP1wFQkooXk/wU6W36EFc5mGgh7lOtsdpNvq?=
 =?iso-8859-1?Q?4HwoBqr9MoAJFAOsZD6aW1/k9wDL6DjMJlp1KoGOqRduX0kUHwPDQaAaob?=
 =?iso-8859-1?Q?Vq6CsTPVnCIELU7ixtM4ovyp7sE1yL+0RPAgGp9e/ASspozNs8MZ1Dxu9C?=
 =?iso-8859-1?Q?v0oXcZlcWqxVjVoBvaYY41fYbloC4IhEXb8+FZQKyZQNXppi/oEm2Ve2YN?=
 =?iso-8859-1?Q?5Vimg28HG8z1S9UNsRWndX41U4amTm5GKp23Ka+DWunABP9TjYIWutctHv?=
 =?iso-8859-1?Q?mhFnd6q5iCbIEh4TVZDljUX/43/gCULtKeIMicq5WaFXaPaeHWyKDWbw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a80de77c-92aa-4500-dd50-08db45e2a44c
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Apr 2023 23:13:12.6462 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zRjVi2QT59XMRKsd6ZjByjR0rY2dSaGAn6aQMueCEU8kyiT46xpvNVzsvWB4Bk1PltJNs1dI3uaIa7Kbnwh09pL9nfL1j1NeOekufE1P6kw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6144
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 12/17] drm/xe/rtp: Improve magic macros
 for RTP tables
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
Cc: Matt Roper <matthew.d.roper@intel.com>, intel-xe@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, Apr 25, 2023 at 07:00:31PM +0200, Michal Wajdeczko wrote:
>
>
>On 25.04.2023 15:17, Lucas De Marchi wrote:
>> On Tue, Apr 25, 2023 at 01:03:54PM +0200, Michal Wajdeczko wrote:
>>>
>>>
>>> On 22.04.2023 00:32, Lucas De Marchi wrote:
>>>> The macros for writing the rtp tables have some downsides:
>>>>
>>>>     1) They are fragile, and when making a typo it's hard to know
>>>>        where it's failing for someone not used to them
>>>>     2) They polute the global scope. The CONCAT/COUNT_ARGS/etc only
>>>>        work because they are defined exactly the same as the ones in
>>>>        kernel.h.
>>>
>>> hmm, I wonder why they were defined locally in first place ?
>>> Can't you always use definitions from kernel.h ?
>>
>> I didn't want to include kernel.h for the 2 macros it would use
>> when people are actually trying to reduce the size of kernel.h due to
>> being kind of what our i915_reg.h became. Also the count args to 12 is
>> not exactly what we want.
>
>sorry, but I still don't follow
>
>if a ready to use macro is defined, I see no reason to define own copy
>just because we don't like to include header where it was added/defined
>
>if size of the kernel.h is a real problem, then I would expect moving
>CONCAT/COUNT macros to linux/concat.h/count.h rather then creating its
>own macros in private header (unless they are really non-generic)

my thought was: it *is* happening. Slowly. Over time. Let's not add one
more dependency on it.

At the same time, there is no good reason to block the rest of the
changes (and actually the entire xe module being merged upstream)
by attempting to create those headers. Yes, that could happen in
parallel and go through the right upstream branch. That branch is not
drm-next though.

We have only 3 macros that were typed over and over in the last 30 years
in slightly different forms.  Once we have a concat.h / count.h we can
easily migrate to them.  Example: `git log --grep str_yes_no`: such
common infra takes time and synchronization between several trees.

See:
d2a8ebbf8192 ("kernel.h: split out container_of() and typeof_member() macros")

And the disclaimer in the header itself:

/*
  * NOTE:
  *
  * This header has combined a lot of unrelated to each other stuff.
  * The process of splitting its content is in progress while keeping
  * backward compatibility. That's why it's highly recommended NOT to
  * include this header inside another header file, especially under
  * generic or architectural include/ directory.
  */



>
>>
>>>
>>>>     3) They are not compatible with rules/actions with registers
>>>>        passing additional options
>>>>
>>>> This new implementation fixes (2) and (3).
>>>>
>>>> For (2), prefix everything with "_XE", so there is less chance of
>>>> clashes. Also, the maximum number of rules and actions is 4, so there is
>>>> no need to make the helper macros go until 12: reduce that to 5, so if
>>>> more arguments is passed, the compiler gives an error that there is not
>>>> definition with _5 suffix.
>>>
>>> I'm not convinced that adding local definitions with XE_ prefix that
>>> mimics functionality already defined in kernel.h is the right way to go
>>
>> see above
>>
>>>
>>>>
>>>> For (3), change the implementation to concentrate on "pasting a prefix
>>>> to each argument" rather than the more general "call any macro for each
>>>> argument". Hopefully this will avoid trying to extending this infra and
>>>> making it more complex. The new changes to how the arguments are
>>>> constructed using tuples will allow extending the interface where it's
>>>> needed: passing additional register fields to allow creating our own
>>>> xe_reg_t.
>>>>
>>>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>>>> ---
>>>>  drivers/gpu/drm/xe/xe_rtp.h | 68 ++++++++++++++++++-------------------
>>>>  1 file changed, 33 insertions(+), 35 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/xe/xe_rtp.h b/drivers/gpu/drm/xe/xe_rtp.h
>>>> index a3be7c77753a..53650f09efe9 100644
>>>> --- a/drivers/gpu/drm/xe/xe_rtp.h
>>>> +++ b/drivers/gpu/drm/xe/xe_rtp.h
>>>> @@ -22,43 +22,42 @@ struct xe_reg_sr;
>>>>  /*
>>>>   * Helper macros - not to be used outside this header.
>>>>   */
>>>> -/* This counts to 12. Any more, it will return 13th argument. */
>>>> -#define __COUNT_ARGS(_0, _1, _2, _3, _4, _5, _6, _7, _8, _9, _10,
>>>> _11, _12, _n, X...) _n
>>>> -#define COUNT_ARGS(X...) __COUNT_ARGS(, ##X, 12, 11, 10, 9, 8, 7, 6,
>>>> 5, 4, 3, 2, 1, 0)
>>>> +#define _XE_ESC(...) __VA_ARGS__
>>>> +#define _XE_COUNT_ARGS(...)
>>>> _XE_ESC(__XE_COUNT_ARGS(__VA_ARGS__,5,4,3,2,1,))
>>>> +#define __XE_COUNT_ARGS(_,_5,_4,_3,_2,X_,...) X_
>>>>
>>>> -#define __CONCAT(a, b) a ## b
>>>> -#define CONCATENATE(a, b) __CONCAT(a, b)
>>>> +#define _XE_CONCAT(a, b) __XE_CONCAT(a, b)
>>>> +#define __XE_CONCAT(a, b) a ## b
>>>>
>>>> -#define __CALL_FOR_EACH_1(MACRO_, x, ...) MACRO_(x)
>>>> -#define __CALL_FOR_EACH_2(MACRO_, x, ...)                    \
>>>> -    MACRO_(x) __CALL_FOR_EACH_1(MACRO_, ##__VA_ARGS__)
>>>> -#define __CALL_FOR_EACH_3(MACRO_, x, ...)                    \
>>>> -    MACRO_(x) __CALL_FOR_EACH_2(MACRO_, ##__VA_ARGS__)
>>>> -#define __CALL_FOR_EACH_4(MACRO_, x, ...)                    \
>>>> -    MACRO_(x) __CALL_FOR_EACH_3(MACRO_, ##__VA_ARGS__)
>>>> +#define _XE_FIRST(...) _XE_ESC(__XE_FIRST(__VA_ARGS__,))
>>>> +#define __XE_FIRST(x_,...) x_
>>>> +#define _XE_TUPLE_TAIL(...) _XE_ESC(__XE_TUPLE_TAIL(__VA_ARGS__))
>>>> +#define __XE_TUPLE_TAIL(x_,...) (__VA_ARGS__)
>>>>
>>>> -#define _CALL_FOR_EACH(NARGS_, MACRO_, x, ...)                    \
>>>> -    CONCATENATE(__CALL_FOR_EACH_, NARGS_)(MACRO_, x, ##__VA_ARGS__)
>>>> -#define CALL_FOR_EACH(MACRO_, x, ...)                        \
>>>> -    _CALL_FOR_EACH(COUNT_ARGS(x, ##__VA_ARGS__), MACRO_, x,
>>>> ##__VA_ARGS__)
>>>> +#define __XE_PASTE_SEP_COMMA        ,
>>>> +#define __XE_PASTE_SEP_BITWISE_OR        |
>>>> +#define __XE_PASTE(prefix_, sep_, args_)
>>>> _XE_ESC(_XE_CONCAT(__XE_PASTE_,_XE_COUNT_ARGS args_)(prefix_, sep_,
>>>> args_))
>>>> +#define __XE_PASTE_1(prefix_, sep_, args_) prefix_ args_
>>>> +#define __XE_PASTE_2(prefix_, sep_, args_) prefix_(_XE_FIRST args_)
>>>> __XE_PASTE_SEP_ ## sep_ __XE_PASTE_1(prefix_, sep_, _XE_TUPLE_TAIL
>>>> args_)
>>>> +#define __XE_PASTE_3(prefix_, sep_, args_) prefix_(_XE_FIRST args_)
>>>> __XE_PASTE_SEP_ ## sep_ __XE_PASTE_2(prefix_, sep_, _XE_TUPLE_TAIL
>>>> args_)
>>>> +#define __XE_PASTE_4(prefix_, sep_, args_) prefix_(_XE_FIRST args_)
>>>> __XE_PASTE_SEP_ ## sep_ __XE_PASTE_3(prefix_, sep_, _XE_TUPLE_TAIL
>>>> args_)
>>>>
>>>> -#define _XE_RTP_REG(x_)    (x_), XE_RTP_REG_REGULAR
>>>> -#define _XE_RTP_MCR_REG(x_) (x_), XE_RTP_REG_MCR
>>>> +#define _XE_RTP_REG(x_)        (x_), XE_RTP_REG_REGULAR
>>>> +#define _XE_RTP_MCR_REG(x_)    (x_), XE_RTP_REG_MCR
>>>>
>>>>  /*
>>>>   * Helper macros for concatenating prefix - do not use them directly
>>>> outside
>>>>   * this header
>>>>   */
>>>> -#define __ADD_XE_RTP_ENTRY_FLAG_PREFIX(x)
>>>> CONCATENATE(XE_RTP_ENTRY_FLAG_, x) |
>>>> -#define __ADD_XE_RTP_ACTION_FLAG_PREFIX(x)
>>>> CONCATENATE(XE_RTP_ACTION_FLAG_, x) |
>>>> -#define __ADD_XE_RTP_RULE_PREFIX(x) CONCATENATE(XE_RTP_RULE_, x) ,
>>>> -#define __ADD_XE_RTP_ACTION_PREFIX(x) CONCATENATE(XE_RTP_ACTION_, x) ,
>>>> +#define __XE_PASTE_XE_RTP_ENTRY_FLAG_(x_)   
>>>> _XE_CONCAT(XE_RTP_ENTRY_FLAG_, x_)
>>>> +#define __XE_PASTE_XE_RTP_ACTION_FLAG_(x_)   
>>>> _XE_CONCAT(XE_RTP_ACTION_FLAG_, x_)
>>>> +#define __XE_PASTE_XE_RTP_ACTION_(x_)    _XE_CONCAT(XE_RTP_ACTION_, x_)
>>>> +#define __XE_PASTE_XE_RTP_RULE_(x_)    _XE_CONCAT(XE_RTP_RULE_, x_)
>>>
>>> maybe local macros should be defined with full XE_RTP prefix and be
>>> tailored for your specific RTP usecases:
>>>
>>> #define _XE_RTP_CONCAT(a, b) __XE_RTP_CONCAT(a, b)
>>> #define __XE_RTP_CONCAT(a, b) XE_RTP_ ## a ## _ ## b
>>
>> these are not to be used throughout the source code. The only difference
>> I see from this and what I did is the prefix being *XE_RTP_ rather than
>
>also the actual outcome of the macro includes "XE_RTP" prefix being
>added automatically (making this a non-generic concat macro)
>
>> *XE_.  Since this is not to be used outside the header, I'm not seeing
>> much value in make it even longer.
>>
>>>
>>> #define __XE_PASTE_XE_RTP_ACTION_(x_)    _XE_RTP_CONCAT(ACTION, x_)
>>> #define __XE_PASTE_XE_RTP_RULE_(x_)    _XE_RTP_CONCAT(RULE, x_)
>>
>> this contradicts what you said and following that would make it very
>> ugly:
>>
>> #define __XE_RTP_PASTE_XE_RTP_ACTION_(x_)    _XE_RTP_CONCAT(ACTION, x_)
>> #define __XE_RTP_PASTE_XE_RTP_RULE_(x_)        _XE_RTP_CONCAT(RULE, x_)
>
>or
>
>#define __XE_RTP_PASTE_ACTION(a)    _XE_RTP_CONCAT(ACTION, a)
>#define __XE_RTP_PASTE_RULE(r)      _XE_RTP_CONCAT(RULE, r)

humn... if this works, then it seems to be cleaner. My previous attempt
on trying a similar thing ended up with the preprocessor not pasting it
on all args, but I think that was still when I was using the
CALL_FOR_EACH macro. I will try with this one.

thanks
Lucas De Marchi

>
>>
>>
>> Lucas De Marchi
>>
>>>
>>> then there will be no complains about overlapping functionality with
>>> macros from kernel.h
>>>
>>>>
>>>>  /*
>>>>   * Macros to encode rules to match against platform, IP version,
>>>> stepping, etc.
>>>>   * Shouldn't be used directly - see XE_RTP_RULES()
>>>>   */
>>>> -
>>>>  #define _XE_RTP_RULE_PLATFORM(plat__)                        \
>>>>      { .match_type = XE_RTP_MATCH_PLATFORM, .platform = plat__ }
>>>>
>>>> @@ -315,8 +314,8 @@ struct xe_reg_sr;
>>>>   *        ...
>>>>   *    };
>>>>   */
>>>> -#define XE_RTP_ENTRY_FLAG(f1_, ...)                        \
>>>> -    .flags = (CALL_FOR_EACH(__ADD_XE_RTP_ENTRY_FLAG_PREFIX, f1_,
>>>> ##__VA_ARGS__) 0)
>>>> +#define XE_RTP_ENTRY_FLAG(...)                            \
>>>> +    .flags = (__XE_PASTE(__XE_PASTE_XE_RTP_ENTRY_FLAG_, BITWISE_OR,
>>>> (__VA_ARGS__)))
>>>>
>>>>  /**
>>>>   * XE_RTP_ACTION_FLAG - Helper to add multiple flags to a struct
>>>> xe_rtp_action
>>>> @@ -338,8 +337,8 @@ struct xe_reg_sr;
>>>>   *        ...
>>>>   *    };
>>>>   */
>>>> -#define XE_RTP_ACTION_FLAG(f1_, ...)                        \
>>>> -    .flags = (CALL_FOR_EACH(__ADD_XE_RTP_ACTION_FLAG_PREFIX, f1_,
>>>> ##__VA_ARGS__) 0)
>>>> +#define XE_RTP_ACTION_FLAG(...)                            \
>>>> +    .flags = (__XE_PASTE(__XE_PASTE_XE_RTP_ACTION_FLAG_, BITWISE_OR,
>>>> (__VA_ARGS__)))
>>>>
>>>>  /**
>>>>   * XE_RTP_RULES - Helper to set multiple rules to a struct
>>>> xe_rtp_entry entry
>>>> @@ -361,16 +360,15 @@ struct xe_reg_sr;
>>>>   *        ...
>>>>   *    };
>>>>   */
>>>> -#define XE_RTP_RULES(r1, ...)                            \
>>>> -    .n_rules = COUNT_ARGS(r1, ##__VA_ARGS__),                \
>>>> +#define XE_RTP_RULES(...)                            \
>>>> +    .n_rules = _XE_COUNT_ARGS(__VA_ARGS__),                    \
>>>>      .rules = (const struct xe_rtp_rule[]) {                    \
>>>> -        CALL_FOR_EACH(__ADD_XE_RTP_RULE_PREFIX, r1, ##__VA_ARGS__)    \
>>>> +        __XE_PASTE(__XE_PASTE_XE_RTP_RULE_, COMMA, (__VA_ARGS__))    \
>>>>      }
>>>>
>>>>  /**
>>>>   * XE_RTP_ACTIONS - Helper to set multiple actions to a struct
>>>> xe_rtp_entry
>>>> - * @a1: Action to take. Last part of XE_RTP_ACTION_*
>>>> - * @...: Additional rules, defined like @r1
>>>> + * @...: Actions to be taken
>>>>   *
>>>>   * At least one rule is needed and up to 4 are supported. Multiple
>>>> rules are
>>>>   * AND'ed together, i.e. all the rules must evaluate to true for the
>>>> entry to
>>>> @@ -388,10 +386,10 @@ struct xe_reg_sr;
>>>>   *        ...
>>>>   *    };
>>>>   */
>>>> -#define XE_RTP_ACTIONS(a1, ...)                            \
>>>> -    .n_actions = COUNT_ARGS(a1, ##__VA_ARGS__),                \
>>>> +#define XE_RTP_ACTIONS(...)                            \
>>>> +    .n_actions = _XE_COUNT_ARGS(__VA_ARGS__),                \
>>>>      .actions = (const struct xe_rtp_action[]) {                \
>>>> -        CALL_FOR_EACH(__ADD_XE_RTP_ACTION_PREFIX, a1,
>>>> ##__VA_ARGS__)    \
>>>> +        __XE_PASTE(__XE_PASTE_XE_RTP_ACTION_, COMMA,
>>>> (__VA_ARGS__))    \
>>>>      }
>>>>
>>>>  void xe_rtp_process(const struct xe_rtp_entry *entries, struct
>>>> xe_reg_sr *sr,
