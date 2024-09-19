Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26E21CF3973
	for <intel-xe@archiver.kernel.org>; Thu, 19 Sep 2024 22:10:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB63610E126;
	Thu, 19 Sep 2024 22:10:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UxItHCfY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BC4F10E778
 for <intel-xe@lists.freedesktop.org>; Thu, 19 Sep 2024 22:10:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726783843; x=1758319843;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=B6HKPNicGSoaSvmBecdQ6SKy86to3lbKKHn+XrW3yNw=;
 b=UxItHCfYbBp31i+Le6YrAktpkZecJLMm4dnlfM9FAgy5+WP7fZGS9FBj
 /t8Y12CPXF56PxPebqREExV7K20ZRzBlVZE9f42zHGezKE1RFgp9ifIP/
 DJ0cW4Cp7iwZ7bGZeSU5Jos8VCLAqqy03GkadwdTzJHF3wMIpKfmuH21B
 Y/xRFHPmu0kbM8oMHKgfaey0HUWveiX8opq9ls1xoXGmrTdDWcuJcwcPn
 6VUnHnPf14MCtMV7kNY2hSek5u19pAhmXPQQzYrjKlzExvrik+mRUq3lo
 p2UWz18t71ekVRSZgGWG3B/rGpwX5EQZcADnLeI/iUKIPQDTOjeCxE96J Q==;
X-CSE-ConnectionGUID: 8z6VI69GS7i0eVnpNCS0kw==
X-CSE-MsgGUID: CBIiK9SxSLywAaO19HtlnQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11200"; a="25648768"
X-IronPort-AV: E=Sophos;i="6.10,243,1719903600"; d="scan'208";a="25648768"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2024 15:10:43 -0700
X-CSE-ConnectionGUID: ZRu3SIMiQL63RdQQC+9WYw==
X-CSE-MsgGUID: wSIzi1lYS8+naJt5VQAvug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,243,1719903600"; d="scan'208";a="70105245"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Sep 2024 15:10:43 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 19 Sep 2024 15:10:42 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 19 Sep 2024 15:10:42 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 19 Sep 2024 15:10:42 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.174)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 19 Sep 2024 15:10:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Gm8Hz2+4OZ7kqMo+Fv0cKPQUSXPfOWlIrzBodd/WkJ2UajjOSP4ppNe8RdNnr4yK6irR7Pz178wfMTkpjyMjmp25ZQQk3RHP8tiayDEJtiVwg+R6He+bkT1d9zlEv+EiDdfR7GS21M9Jsfh78lG6eTx2r4ltN5FavtFK5oNn4Y/bFU9JTFPCDJDnkhR/wUSeSgdzq32FvVttaWRHitMsYbYdD9DUviMBpjiThAJqJYKhdze/dNBir/BN/am20/9thsqrkYlVzq8T4Nxxt4KO0GIDYKRUT9ltJOfcHSIcy00NPmmNHzITzKId4r684iFPm643paq2Sk0Z5KVxATGk0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xJ0fYYRI5a1ZJHVFmisldQtMQXh/8uHq0NYqCNvvr0s=;
 b=WjTXPJ+ojYohK/Sni5XHvvHZ35tTPXB1vP73gP4WYYbEZx2t3zm3aB21zEy4R0dkhPpchx5okKk6To5Sv/GyGeY4sZml6M6YNXUaYlv/4OKGsJSvWGrS5neeeteFI6EMUwIsnLgMOq7RmMXTr5W0tGc0ZYqAiUjJitumQCrhywFeKCXXiwX+7zyBE5powl76hJ7BtA3MAW/2BVzTg5cQkDWh4zSFqkyx9QsfLSnLI4pjxREnn8E6sMcGmdnuWfnDFTbRj46zTpDbetjLawYw4ybjjotT+XAqcgJblBjEYSZyByJlycSKzrQuqxOc393ld2FPM+cn/gDAE5x+HduOWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by IA1PR11MB7812.namprd11.prod.outlook.com (2603:10b6:208:3f7::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.17; Thu, 19 Sep
 2024 22:10:38 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%5]) with mapi id 15.20.7962.022; Thu, 19 Sep 2024
 22:10:38 +0000
Date: Thu, 19 Sep 2024 18:10:35 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
CC: Anshuman Gupta <anshuman.gupta@intel.com>, <rafael@kernel.org>,
 <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe: Restore pci state upon resume
Message-ID: <ZuyhW3fymwZhoKaz@intel.com>
References: <20240912190530.435976-1-rodrigo.vivi@intel.com>
 <ZuQbnRfh-wkuMR83@intel.com> <ZuRduLqXs4za8_PN@intel.com>
 <ZuRuSgnnjGSr8xI_@intel.com> <ZunPQeJb2zoVbNSN@intel.com>
 <ZunwFEelVu441Mtg@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZunwFEelVu441Mtg@intel.com>
X-ClientProxiedBy: MW4PR03CA0218.namprd03.prod.outlook.com
 (2603:10b6:303:b9::13) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|IA1PR11MB7812:EE_
X-MS-Office365-Filtering-Correlation-Id: be2db384-517f-4bae-932a-08dcd8f7e47c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?FBUzU3UEZpEmKQ01PRA42C7l7wlMUi0wKqI9/1L2A5gbYqguwKIsPzDs/M?=
 =?iso-8859-1?Q?v2v5MWzsQGmS4kHmXIIUstcnpF9RXKP7BsLDUdgSqP4Jz6t5xCQo836bWg?=
 =?iso-8859-1?Q?95EhLAi4FgvcfkY3Bk1zu4nlljdQhkhRD5xWshzUtod5loup5JiyiQk+fB?=
 =?iso-8859-1?Q?ZRLvZLKLwFW4Jm2cIr6Tr36DADNVeRtncBhXknm/O+aCr/yKyq9khxL0CT?=
 =?iso-8859-1?Q?JhR5WHTFEdkinjsi+eF+wDcf+PPSRVV2mwOjRFkG/3c7fxGgqNwLcewxpQ?=
 =?iso-8859-1?Q?ZHOMNpk5OQo7fbwflEXqbof/eQksxRMlJwgXFXS2zUSDuK5bQpbvi3Ht1S?=
 =?iso-8859-1?Q?mNhkBRvNyoZ1Z3pizUaPsBqUdhhBNwfyjkyZp6LvjssEFwph1+weaH2O83?=
 =?iso-8859-1?Q?JldSEZfRFUW3HtKpGm5TRxZZXTfLSAU1icmUHlJOF+RQwcAVGyQQuJiMoT?=
 =?iso-8859-1?Q?GVzYK5mVtzSAEaXvhk2+4KQpzckzRIjECwAwxuhQGEMxwF38Uooo1Qgvc8?=
 =?iso-8859-1?Q?h4Hlk820m6m/0X6B6m0TCi7pUum+7dZLqPkycaQIXviJUS3TF5jG2kYTz5?=
 =?iso-8859-1?Q?EOmBUClPCT9PhP07rr5bsQ4E2AYOyHAaZqWrqCF0/vXY6P+EowrWO6QQkO?=
 =?iso-8859-1?Q?GnJ8xRIV7W/oKsN1s4lMjNzoH3IxB7s8+yb9Strz7t91qzKAwq4uni2jdC?=
 =?iso-8859-1?Q?OOGliynI2xHPO3rKvVwZYwPRyzpVSe+CXzLV+j04uoJDNdHA99zt0yfbgq?=
 =?iso-8859-1?Q?NDAsylgH/h4wbIDllffJluW9R4UszHRNny+SzTPQ5Z7ZYsRngbMH0dsp4I?=
 =?iso-8859-1?Q?O+WTB/s+SD8XwubjsDdCHm8UYEskwFGfN72uWAcdOahHwuwyqPWxzdA4fI?=
 =?iso-8859-1?Q?x0FT4gMygX0xN9YDVHui4gqv2zOLDqtsEQKkDoLW5t8rCLVwvO2FyktZ7V?=
 =?iso-8859-1?Q?c4K0IGkOWcD2v9jGZhAwRs+wEqyMADQ3cO2zyB57Vk5d1JSCEG/1XmLxiU?=
 =?iso-8859-1?Q?VDN73MdpeJ+QJjp7dVAb8DD7ejJMga9MdQFM+PBEymmqaKbVaqynAYEV2P?=
 =?iso-8859-1?Q?NlLLQDGpss6SkOhz+aVhBR7JE2mWwKZR24H9tgpSGe82pmKqUEkQOYbest?=
 =?iso-8859-1?Q?oyLe2isz0ZJl0YckaniXUHyRVzXVATM3fc2jJf0TfveX5yl0RDQ5xeL+Na?=
 =?iso-8859-1?Q?wbjpPfORkYLK9zO/E1U+yZ5lMRaAIHies3Wy6npljm7p2UKteLLEWWEIvN?=
 =?iso-8859-1?Q?T2apGfufk/MkKhDOF9qVwB+vHb6zoAbYpgbAMwu6XwdlF5CFZOonHEKl81?=
 =?iso-8859-1?Q?jKhAIaUktUhnnQylBpRVlTk6aZ3StUOmWz+JmgW1FjKcK9+8YY5Bqy87qc?=
 =?iso-8859-1?Q?cJrI7U7+DJ56n8Memz2tIUkBq8ntfCzCc0aZhm/tYeObzp9lEyapo=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?ZSxG74FNqvKyVijm3+XsX9700yZYJznjjbt6W5A7Vd1MBmHaLYttNOGI7L?=
 =?iso-8859-1?Q?BzRRkH+q4avMhIOSXlNOIyTQf+2crG0arMDsN6cbNdgcd5ijBdTq2J/iIH?=
 =?iso-8859-1?Q?Y+zYwBAQs65fpByBPqEvZBvkrNwAKLQddxTxpcHGGymDNQqnWdmHzkElwS?=
 =?iso-8859-1?Q?DhkwOg8J0ir2Bhhls6qszSc1vdVq73w0bNKfd7cc2r1nR2pwk78A6mV3VK?=
 =?iso-8859-1?Q?mT0JesP1KVTT9Wkf6Em1WJUWIJ3P7JO8VvwjXqOA+4S5TExfO9fxUjHbqi?=
 =?iso-8859-1?Q?AH9xHtVDJKbzh3W52vir8s0Kbueom0qBPp7oTkAHFmXpbZUzgEGMn/O7CH?=
 =?iso-8859-1?Q?A2PwcljKntgTjvuBUYPr9hkckUgpaNLjHGDrwwV/xlhuAq2+oqpUKsZ0qQ?=
 =?iso-8859-1?Q?qk/5dv703yA1ifwYoxurYaIh1bAw+Nd/nuCbiaucmC3FADuGRmywYoHDm8?=
 =?iso-8859-1?Q?NZy1rZBgTfHXrJSI5fgHtn0ZhF8EanaQqW1Hnw/4yH/co8BSV5sPxxyMd+?=
 =?iso-8859-1?Q?uKeM8t0XxcOEkn4bGdBN6SDsIrwbkgsT1Op8ePAyEdh/Ks9fdNugpIK8cd?=
 =?iso-8859-1?Q?+UVvPD9nxGepJOCKAH/OPlGhyF87/XllPtUAUsgVUld9461SrpnXzMP3b0?=
 =?iso-8859-1?Q?BPGFx/bejzHhgv4NDlnjoz8fEwtGZ12PxN0R12gg7C6fiHO5DyrneU6U6d?=
 =?iso-8859-1?Q?BgkpdY1zfyyMSGK/DDKbrW+tRPA97A0fE0CZxYierBcFp488/IdknHOyGg?=
 =?iso-8859-1?Q?8d2/MozzYtQbxq9X0TzmmvlpE9njp7M1hgSiL1Q126YaC/T+5VTB0krPy0?=
 =?iso-8859-1?Q?RW0iGi1lbb1YviSg0UfLThDJWJ8oanVFD0plD/ixgjKXW/buzFkjIgPoRl?=
 =?iso-8859-1?Q?DM6jdxvfIf79mKSBfD6tCm9mMSfkMjXqjkB2D602RlzvOem0Olw6zOAx0m?=
 =?iso-8859-1?Q?JXw24KDdzCgQRfNTbxjJwoXCt38Z0m8/kBWeHtTiXYMep2zdwXDmpEiJL8?=
 =?iso-8859-1?Q?bDO1EGkCQ6BHCrrGrPCm99PA32mXBrx+wnWzSFFKP6svCVWRVSBYu+97W9?=
 =?iso-8859-1?Q?C3hCny90Bsv34lTTdfHjT6bCvFvGL1I/OW7pmF9wn8f8rYYfaVUBnVvJND?=
 =?iso-8859-1?Q?bA0p0iatqEEJdgAidV2oAa8/XUL2j42Ct4YDqx6qIOIIxLa2DnBUuWf6iO?=
 =?iso-8859-1?Q?tGocApLMWL9EK85U+EK3J5JMC7nw//bDv/+F139qx90JM3L7q3Hzir9WlT?=
 =?iso-8859-1?Q?oUCvEYBemEo396/yf1UbJnFwfuJEn0jXCUmX2HqzcMjA5m8VXximUUnKy0?=
 =?iso-8859-1?Q?Ja0c7n2nZ5f5ZuSoygUU0pL0hRlW+gjd2awx6qWoys+9HzdGJXTlzX+sf/?=
 =?iso-8859-1?Q?DDIVKzlJf8QpnljSPIoV7ozaYi00kWHND1yp+Ba+uu7pB+bvG2tU4yvm5p?=
 =?iso-8859-1?Q?/4PveT8g/u+bfJynMFUK461C10pa7dnvRaq8czhWkmWNp+TOk4oS/5Dwup?=
 =?iso-8859-1?Q?xk/8UneC6oiJlJ2VIx/ajb1ipCnc1bOce6WaTJUFb6cimvjAO0cKGEVmWm?=
 =?iso-8859-1?Q?wDr1NoWcfXeTeAWU1Vx7TgSKU/JV9tsExaocngD1zMgWSPEh9PPGTtfwVl?=
 =?iso-8859-1?Q?nWb5ghFT0z1EDt57hJa08ts4RBg3QlaTVv9QJKlPgniu7EIx6HP1Lqdg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: be2db384-517f-4bae-932a-08dcd8f7e47c
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2024 22:10:38.4481 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Cjtkd74FNhcFvZUNuDpgn70rcR6kShFithVMVI+KyXVUr+5W91UCvUzBsf+4pOVYSzGCwwV9Z8i73bwXGhuvSQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7812
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

On Wed, Sep 18, 2024 at 12:09:40AM +0300, Ville Syrjälä wrote:
> On Tue, Sep 17, 2024 at 02:49:37PM -0400, Rodrigo Vivi wrote:
> > On Fri, Sep 13, 2024 at 07:54:34PM +0300, Ville Syrjälä wrote:
> > > On Fri, Sep 13, 2024 at 11:43:52AM -0400, Rodrigo Vivi wrote:
> > > > On Fri, Sep 13, 2024 at 02:01:49PM +0300, Ville Syrjälä wrote:
> > > > > On Thu, Sep 12, 2024 at 03:05:30PM -0400, Rodrigo Vivi wrote:
> > > > > > The pci state was saved, but not restored. Restore
> > > > > > right after the power state transition request like
> > > > > > every other driver.
> > > > > > 
> > > > > > Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
> > > > > > Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > > > > > ---
> > > > > >  drivers/gpu/drm/xe/xe_pci.c | 2 ++
> > > > > >  1 file changed, 2 insertions(+)
> > > > > > 
> > > > > > diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> > > > > > index 5ba4ec229494..6d29ef4b396f 100644
> > > > > > --- a/drivers/gpu/drm/xe/xe_pci.c
> > > > > > +++ b/drivers/gpu/drm/xe/xe_pci.c
> > > > > > @@ -949,6 +949,8 @@ static int xe_pci_resume(struct device *dev)
> > > > > >  	if (err)
> > > > > >  		return err;
> > > > > >  
> > > > > > +	pci_restore_state(pdev);
> > > > > 
> > > > > Why is xe even doing this stuff by hand instead of letting
> > > > > the pci core handle it?
> > > > 
> > > > That's a fair question, given that there's not much documentation
> > > > around it.
> > > > 
> > > > Looking the pci code, it looks that the pci core is not calling itself
> > > > for the restoration of the config space anywhere and looking to
> > > > other drivers around it looks like a safe thing to do.
> > > > 
> > > > And the pci_restore_state is paired with the pci_save_state.
> > > > Both i915 and Xe are doing the pci_save_state and not restoring
> > > > it.
> > > 
> > > i915 needs it because (as a side effect) it prevents the pci
> > > code from automagically sticking the device into D3, which
> > > apparently breaks hibernation on some old crappy laptops.
> > > But xe shouldn't need that.
> > 
> > Hmm, doing some archaeology here, it looks like the
> > both pci_save and pci_restore were added together on
> > regular system suspend-resume by Jesse from the very
> > beginning:
> > 
> > ba8bbcf6ff46 ("i915: add suspend/resume support")
> 
> Pretty sure it was initially just cargo culted. Or perhaps 
> the pci code didn't do stuff back then. Shrug.
> 
> > Then, later pci_restore was removed by Zhenyu on
> > b7e53aba2f0e ("drm/i915: remove restore in resume")
> > because it was hanging some platforms.
> > 
> > The only reference to d3 related issues that I could find
> > was this one:
> > https://lore.kernel.org/intel-gfx/1497281047-25204-5-git-send-email-animesh.manna@intel.com/
> > 
> > but that was trying to add the support to the the save/restore
> > in the runtime pm side and not here in the regular system suspend/resume.
> > 
> > Am I missing anything?
> 
> commit ab3be73fa7b4 ("drm/i915: gen4: work around hang during
> hibernation")

but this is about the pci_set_power_state not the pci_save_state
or pci_restore_state.

For the set_power we are pairing them together.
My concern is that for the save restore we are not.
So we either remove the save or we add the restore.

Pending more to remove it after Anshuman showed the log.

> 
> > Empirically Anshuman showed us that PCI subsystem is indeed taking
> > care of the save/restore.
> > 
> > Ville, my question to you now is: can I go ahead and simply remove
> > the pci_save_state() call from i915? Or you still believe some
> > hibernation somewhere could be broken?
> 
> Unless someone can figure out a way to fix those cursed 
> BIOSes (or they magically fixed themselves in the meantime)
> it needs to stay.
> 
> > I believe we should either remove both save and restore for both
> > drivers or add both to both.
> 
> I think we should try to get as close to the standard 
> driver/pci behaviour as possible. AFAICS that would be
> achieved by moving pci_save_state()+pci_set_power() 
> (and nothing else) into the .suspend_noirq() and 
> .poweroff_noirq() hooks. And then xe wouldn't even
> need to hook those up.

yeap, but our state machinery was never good with that.

> 
> But that does require some actual thougha as it would
> change our current behaviour to not go to D3 in
> .freeze_late() (the pci code won't put the device into
> D3 in .freeze_noirq() either). I suppose this would
> also let us nuke the pci_set_power_state(D0) from
> i915_drm_resume_early()...
> 
> And the switcheroo stuff would presumably need some
> changes. Just calling the noirq() stuff from the
> switcheroo suspend hook should hopefully suffice.
> Hmm, and I guess we'd need the pci_set_power_state(D0)
> for it stll in the resume path.
> 
> Another thing I realized is that we never restore the
> config space in the switcheroo resume path. I suppose
> for our integrated GPUs it doesn't get clobbered in
> D3 anyway so shouldn't really matter. So we could
> technically also skip the pci_save_state() in the
> switcheroo suspend path.

yeap, not only in the switcheroo, but we are saving
but never restoring...

I have this patch that remove the save in some refactor that I'm planning:
https://github.com/rodrigovivi/linux/tree/display-pm-reconcile

> 
> We could also consider quirking the hibernate vs. 
> D3 stuff in drivers/pci. Would just need a new flag
> on the pci_dev to skip the pci_set_power_state(),
> or something.
> 
> -- 
> Ville Syrjälä
> Intel
