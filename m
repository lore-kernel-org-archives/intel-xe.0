Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C8B0C52D7C
	for <intel-xe@archiver.kernel.org>; Thu, 15 Aug 2024 13:44:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4C6610E135;
	Thu, 15 Aug 2024 13:44:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VfGoNyKb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9BB210E135
 for <intel-xe@lists.freedesktop.org>; Thu, 15 Aug 2024 13:44:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723729440; x=1755265440;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=59Wjtag85qfU9Wjlp9m5Uk+AkUP+XT6qu74TeMZPrz0=;
 b=VfGoNyKb/SmhDk+yMTA3HvTfMzvwfVAldfD2rfGzJIg2Fo5JDuDa6UoK
 wz5R+Egtbni3YGc+dAOWrwtTj4ajgqF4eBu7SpMHgW0WxbrHht4bx9l1U
 hYxROH0/KNDAOv71Yb6Ez+i2PPX+ZfEudQ71NUw+sw820FRvTXaWzoqEN
 F5bX7+RePoFEqwm4aWBqz9C6ycmERVwPHwYbEmtk3KDMkFoJ7penxElEW
 XzgIEMSS2bYhUPtjLGT6h2hS+guT3AtOPRSZ/e0U59lpLae14ikLV7J4q
 DdjD6QMoA2kYrF+YaS+K/p0uKEmb49gnadiaHhv6ODvAEcr3uO/00sijR Q==;
X-CSE-ConnectionGUID: hCruBy6hRemA5Cm20eulIQ==
X-CSE-MsgGUID: tkx7aTC4RG6XE/VZGKizfg==
X-IronPort-AV: E=McAfee;i="6700,10204,11165"; a="32617319"
X-IronPort-AV: E=Sophos;i="6.10,149,1719903600"; d="scan'208";a="32617319"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Aug 2024 06:44:00 -0700
X-CSE-ConnectionGUID: EBPhWnH2QNugQ05Pxs9byg==
X-CSE-MsgGUID: 6NQ0rdmXS36LqouhuQ9wxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,149,1719903600"; d="scan'208";a="96872045"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Aug 2024 06:44:00 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 15 Aug 2024 06:44:00 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 15 Aug 2024 06:43:59 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 15 Aug 2024 06:43:59 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.172)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 15 Aug 2024 06:43:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tGNmF2MEDdE4TABStWLFeeGomDlqjSTLBWTtE4oKCO5qnsM48P1cJEUZBelCLmdtXqFf0kKHcjlKQoMR5EwP0Cq3D0weLtCjWtb6wprrtrD0vMVAGROzeIOoUuAGlDSooXmcsF67Ypl8CBQxNbG1xd8i0fnAurLupdoU1mHtJkd2V8HCt4PCfmDMjSyszDBDMYP3NEfjzShr+IlEz7vOGHBCcAU26HQ0yDwPPKW5mtZXQX3gFMwfbqZD0mYhEIJmCdr+boR12dkcIwjo4C6udNex6tqR9c//uTJ0PNu3LmqNspzIq/EepVLwomGw+xEeWWob6Iu4/5Y21KocfIGXVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pCazhODS6xkB0EigUfWb/79iYwpDiOvvHY11uy7ZsyQ=;
 b=VzMPw/YLLFmkD3YQt3Z8kjNLEMftNvo1XvuV3QYgT7K3BiLvgIR2KtTFPcsAwF4KirdS5ck639wAIM+cmjxIdN2fduVPyjhZ4EGRuP73rPs0DCDln8iszmxFo3FpcT4ABo2OH4kwUFrg2/r5S8QCrYed97qeG0HZQoP4ahXr/JQNZGHQnu5BKyrMZab4bFB4U7xSRceKpBcN7ZOxBY0OIa/Qs9uH4JivRGXVSBncd2+1LZuzCJUoFLzCsJ0101FavHpzt7q646bzmT8MSVGVXD89SATNNaX1O+OzxAwVw9NrkYTyRtBakGdd/BDGDel4qawfgAQPFrCrIA1MxTpvQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by IA0PR11MB8335.namprd11.prod.outlook.com (2603:10b6:208:493::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.19; Thu, 15 Aug
 2024 13:43:57 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%7]) with mapi id 15.20.7875.016; Thu, 15 Aug 2024
 13:43:57 +0000
Date: Thu, 15 Aug 2024 08:43:52 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
CC: Francois Dugast <francois.dugast@intel.com>,
 <intel-xe@lists.freedesktop.org>, Matthew Brost <matthew.brost@intel.com>
Subject: Re: [PATCH v4] drm/xe: Add driver load error injection
Message-ID: <k7rpccpor5xtaj3mgx3kqoe3w2lawpimxnlqwwnw4frcegl7ly@55vv2h37swle>
References: <20240814192322.604388-1-francois.dugast@intel.com>
 <87h6blykn7.fsf@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <87h6blykn7.fsf@intel.com>
X-ClientProxiedBy: MW4PR03CA0169.namprd03.prod.outlook.com
 (2603:10b6:303:8d::24) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|IA0PR11MB8335:EE_
X-MS-Office365-Filtering-Correlation-Id: 5e59166a-8d0c-43b1-c76b-08dcbd304f6f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?BrsDDKf+PfG5gYUH2vGDZ2ppWVx4IvVzHeElWWyu4x4D5Fx0jC+PL2/j8xqM?=
 =?us-ascii?Q?z+L0CZuwjrVrlUf4E6fn8Of1c5ooxmr7wfI7l751a0I9TPlmGTxCHABcggwQ?=
 =?us-ascii?Q?KKDIWQY4d5Eiw5AmCKw8vqTKhMUmgz1fWmWPgyqWTuudgOnc4XEjjAryX7Pv?=
 =?us-ascii?Q?Rm6F9pjLAwvFPxrCoiHXafuC+Iw2kA52Wlzcxvun3iFZ2gyjovMbaSUj0BFP?=
 =?us-ascii?Q?6AfbR09Y/hEPZodVeTIFpObgrl9lxNqqW7SsV5DRTeq76Bto59NZyCfM+UXJ?=
 =?us-ascii?Q?04QRBVAbpm1umjYjz5OzFO6cn61W/bl9rf7zPcaqsyodGdAf265Rv2yXEg1h?=
 =?us-ascii?Q?e26dCgndnevNK0vMfR6DeUr599IFOMEk+QYjGbfXK726MF0CqFUBcixjxCt8?=
 =?us-ascii?Q?sfo17p4rxg5J8t8vMJfG1Tfu1smy7+GZO0+YwuVqYEr9JoCMwxsFM++PCrzC?=
 =?us-ascii?Q?2vVSca/NAP3/qVQEOGZIN9tl1ZlpVdSLynnFK8ux0wdEJ5gDUfiOi01+yClQ?=
 =?us-ascii?Q?0dehyuA5DIe7+e/hekofs0L3W4Bk8TYBd7AebeLxDjIr2X72DQmpRY9Np0pI?=
 =?us-ascii?Q?jnYYRHqUGpim5CLhy4rOpTJ+iEax7/zq5Wkcmm7aC3iLBSYe6j3FpwtoDdu6?=
 =?us-ascii?Q?3zsj/8QyX95/bSLRlmyZILw7GvkqRAepXKTw0vrzqMuuztBgV6hf8+CNiOJZ?=
 =?us-ascii?Q?dlFVSNf0rMiIVyGQs7wLfWo7QmpOpYBX82wAvLNylyX3ahffaOl6mQxtUKMc?=
 =?us-ascii?Q?MLuBtIxMiUTUWxfuOREVRgI9iJlHSInjhUBobdFHm7MhCTOWT5SvtC9gtrfQ?=
 =?us-ascii?Q?VOVz3UNqhkfUVB9V0eivUQoVEjwPXvXghfHsutPmTHWsaYN4vH/u84ZMKbW6?=
 =?us-ascii?Q?RvYSGEKzBKLIKBfqLTfT0MLUxvnMR+brUM56Dqdb6SwH9nTHe4Obl3hDEts9?=
 =?us-ascii?Q?/RB8cKJ2tj3Xrnp2NK9WIGAo12ZazOplk0zR1O1wrFjRb2xP+LJSb2aX7b5t?=
 =?us-ascii?Q?FsfhmliuqmUcJvciGMakINXso7WyFa41hmrQkUIk3iucuLP6qnE7hu3R0x7f?=
 =?us-ascii?Q?7kcvI+8ome1sApW0EkpRlst6L6BCbo9gZLN+/5ea5ytouMw3tqJTficQT3Yo?=
 =?us-ascii?Q?cQ0FswWg9if68o6a4lmxpbRcDNNoeZEKGtUkqPbXVV9N7OJyoTMYkmfk6U9Q?=
 =?us-ascii?Q?JO9Bvum8PEc26uvpdKF656gmzIhEB0IToQulQKoavGgpJEHBJ2hh+aGU8gBF?=
 =?us-ascii?Q?ZRviwkeO38eHvgcg59+5zQd6rRJjqAM2PUlUldtlAhL9KNCQoW3+CLffnvYf?=
 =?us-ascii?Q?0U7fW5Eqs8LycqUzqvQ9D+5gqK/cQBHCKl/T8FULk8EyaltlfUTJl8lHUfvr?=
 =?us-ascii?Q?DXLtn8s=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?N7YwIxkIoH0sM2bbgXZeVvcJNqsxB7s7OAygSxkOq2mfuroq94PvdS8IRQ0X?=
 =?us-ascii?Q?FffizuHSpHpz9lG8m/npHrJmXZc1TAA9fpHmQqHvlNfFvi+POW5ywGuOAhoi?=
 =?us-ascii?Q?2mlbvCCW6YrNXkNmoZgxwuFdUWOjyUhR4rK5lzy6ROJnNOWW7RRw1uwQ0UeC?=
 =?us-ascii?Q?+ew8d9VdAI/8TeHc8Zx829Efysvxjut84R+n6vr56vQduWAKimj8ZsFrUL0/?=
 =?us-ascii?Q?9emw2AfWpDTPh+eqe+77fKHyg9Bb2XsBWaR2lGhWA5O2sb7Z71g9ucKQ9ivF?=
 =?us-ascii?Q?x3c5AGLlZ+zWsvgpD7v8rp0ZNgnGRJVIGGHHuVnLXcGdRmHK0La2SnZ7rnuJ?=
 =?us-ascii?Q?LPKMslsGukYDyg0aJWDJ8fboGnJjOiCw/rYO+pG00Gx1q24m2asZfLfGQ912?=
 =?us-ascii?Q?VDmeF7+4Jqpwgzf1Jge+q7oWmeDbPOwY5+yQYK8oFXySzNSHKY8LglcGY9Zt?=
 =?us-ascii?Q?+jRNVWk4sBe7m4dGFSuG1/S+YL3DuVwdPd6v5MudFzMw2/eDeXhaToG1vSvu?=
 =?us-ascii?Q?0BvzGIXKtdlSuuC0SR61NUnK3Nf6eB9tTAvBeXSX/s/cIt5wl+g8NFKuSpGU?=
 =?us-ascii?Q?07G6h8n6jByA11eLz1g7Ncg5mMyzryXc5bj6BKSnwQsRbUDix8iqEMxzWnjk?=
 =?us-ascii?Q?LEm+JHKkSx4HLF3x399nbQSaXT5/Fh8r59MMjgKbJkcDzoqOVR5kSBojUT53?=
 =?us-ascii?Q?xu0RxKn7E7IhYRmXyHL/5GjYfkZ7JD7m1CIqLIcUbliwp6bIVkec9BA0Mkui?=
 =?us-ascii?Q?ti1xhAE9YifcLLgYihZJF/VYNz7Scclj16E3mwg7X2cnjVAvH0qJFcpsYtW+?=
 =?us-ascii?Q?Izo+1t/QZBuX/UYJ6XsU534LvAo1MjhTsQDXQO8e5s+EI0rvcmGc5zBtIPKx?=
 =?us-ascii?Q?XlHcOWyOQyswm31A7iXhMU+8VQ5yQi0sbsuqwJWW4Em2n8hqPJU9y068vyMs?=
 =?us-ascii?Q?/fTp/UMuANm3YkcoGRk1Gck9rD+KqyaSxakUD1We/aGpT1dxweNVAUQyQDFR?=
 =?us-ascii?Q?y8VejZlAK4YZg4t8/P7atKEEE+qtrpz7rDE6EJ1OK6TMiDITAKQqxDVEFwki?=
 =?us-ascii?Q?YUcxy8rolkVl5mSrr6YuUhC1pszvznPP0n2HEjR9HJrvcgmJZAUmzGnRbERo?=
 =?us-ascii?Q?T17lryKhqeu8f8w0RgHYzocVwT4OtJ3eLs7fp1yMASp2P0+n4g59AHzvUSsH?=
 =?us-ascii?Q?BUzZ41htWF6KWFHWbdUD9a+diXnxjxDL+5UOQIjnQMlQ43TH66mx9w88iIBw?=
 =?us-ascii?Q?2vyrOpZnjjAVnUGUtprIi6NruuM7fwJQ7T0mHc5zgDzErGVeQOVkP4752uSc?=
 =?us-ascii?Q?U6FfW7Hdhd4tn9BALM8EnYBCsaQzTMaU6JnvCmzRdh5rtz7ua72ckvfpkVYY?=
 =?us-ascii?Q?SHamx97A2c1I1s3OED7F52VvLpmHSEF+c88BHaT7g+eRTkyIZZYOq8lDBXuV?=
 =?us-ascii?Q?2XCWXiWWHirXRRTGOmzSKtP7t9vTAM4xeUTVdvKNYOnwO/88taFJgrq62j9X?=
 =?us-ascii?Q?a/lW1c7HOITlKttFUgoxszC5kClBqBYQEuncQkKLYrViKvTXXTCyVwuD5BCf?=
 =?us-ascii?Q?4VoB88LsknRKUk14nL3riANKpBOpWJR7uP8F+RWC6khr7P6GzckCR5iXaoF1?=
 =?us-ascii?Q?/w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e59166a-8d0c-43b1-c76b-08dcbd304f6f
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2024 13:43:57.0337 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6TT6WSNZlxyfWZNidz/ClI1YHQeYbKBYTbMiia7wXy1uSO23lOtx3nHIzPRdMw2s0EIVzFTbVmpu9c4w0V/MNwjQwB+rnb5HhaQcnCLpeTQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB8335
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

On Thu, Aug 15, 2024 at 04:34:52PM GMT, Jani Nikula wrote:
>On Wed, 14 Aug 2024, Francois Dugast <francois.dugast@intel.com> wrote:
>> Those new macros inject errors by overriding return codes. They must
>> manually be called, typically by turning this pattern:
>>
>>     err = foo();
>>     if (err)
>>         return err;
>>
>> into:
>>
>>     err = foo();
>>     err = xe_device_inject_driver_probe_error(xe, err);
>>     if (err)
>>         return err;
>>
>> When CONFIG_DRM_XE_DEBUG is not set, this has no effect.
>>
>> When CONFIG_DRM_XE_DEBUG is set, the error code at checkpoint X will
>> be overridden when the module argument inject_driver_load_error is
>> set to value X. By doing so, it is possible to test proper error
>> handling and improve robustness for current and future code. A few
>> injection points are added in this patch but more need to be added.
>> One way to use this error injection at driver probe is:
>>
>>     for i in {1..200}; do echo "Run $i"; modprobe xe inject_driver_probe_error=$i; rmmod xe; done
>>
>> In the future this is expected to be replaced by the infrastructure
>> provided by fault-inject.h
>
>See my comment on a previous version [1].
>
>BR,
>Jani.
>
>[1] https://lore.kernel.org/r/87wmkkzold.fsf@intel.com

yeah, I missed that too. Having the display side covered as well from
the beginning would be good.

Lucas De Marchi
