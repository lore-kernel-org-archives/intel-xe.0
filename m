Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5481DC19F32
	for <intel-xe@archiver.kernel.org>; Wed,  5 Mar 2025 20:26:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11EA610E322;
	Wed,  5 Mar 2025 20:26:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HnZROi3Q";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DADB10E322
 for <intel-xe@lists.freedesktop.org>; Wed,  5 Mar 2025 20:26:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741206396; x=1772742396;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=BqiIVkrMnDYYUrs92k6Z91eGwZKMGj7qnP/zSlSeFaQ=;
 b=HnZROi3QRDLeeytNi7GqQcQ5VQtlUo9Ff9/O0oVxMB9sNbaFcx4DrD+6
 ePcRLnV9DV5xwiQMqSID9axEsBIR8VCqQ4VJuiY1BV4z+A+JTm9MOLtwA
 oi8khjZvGdbwb78puidEx9kG2+TtBxQiSh62lHeDgez0LkDtZsnkXfbKq
 vhPwdL08ww18wd0ria4tiRegYJmUiYPa/NFUUnBpVrwytxjCv7GdjTzAs
 xqkiCcxPBiSGOWJFDWJa+ozdP+ovpiZNDGMStjyOtG1DV+fHx5LbwcFzc
 8rKKPVHHNNeGJeV4g46HnO3Z9n7nGiMrv5kHSD7W+pVex4Thygi0Pc7iQ w==;
X-CSE-ConnectionGUID: 1G//707ySOKSTb+3Qgq2bg==
X-CSE-MsgGUID: LIMHUc/gRHuGcVDr/yPX6g==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="42214167"
X-IronPort-AV: E=Sophos;i="6.14,224,1736841600"; d="scan'208";a="42214167"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2025 12:26:35 -0800
X-CSE-ConnectionGUID: SaJfqID3Q9GBWKhzrfViFA==
X-CSE-MsgGUID: yfRGcnxcQIiOab81yLLl0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,224,1736841600"; d="scan'208";a="123720231"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2025 12:26:34 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 5 Mar 2025 12:26:34 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 5 Mar 2025 12:26:34 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.176)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 5 Mar 2025 12:26:31 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HCGXtlQytODCo+lLmkRJseg/Jk354OCibpL8KyMamWGfqTb54eptT5L7/B//GzX0UuvHPlSBSBB7kn9gbhUEOlsmO3jtyFO/QdDgs/tmRaSoBzznj3gyP6EZGnwsF06mg6e8NOQTsYLBTz1yP/5pQHk4eZvssoFmyBeKqs6VuOkEbo2RWtU+5jTHKB7jsnAoGHGwa0IVVPiKDllBqXurD4j0KwMRd/nNwt/CPAzhojxYQJyogauXEs6W/kSPKfMQsyy4wRlwMU62FEZ0fLDCvuSeARimwLIOC5AQs5EYicOKO+QhNXeUzGMne3MPnanVUqKb3p9BlHjdFNKeHVbT1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DeB46yu1uVOaEX61nIBhbB6go6q1TJmRHiPF13On5Xw=;
 b=TYUBRmoNYpY1duvlAOHQiuAN10mv1HWg2xcVL8dfsIBlxBLfoP24rL2m6arTfG5zIAViJoOpS8iiImL3YklGrKNPM0VP0coiherzjC2wibwK+CHJ2zqNRJ1yMVopXCGZ4Nud6ntH0OgQnGu+zHDy1biqZDv/EvyfqPFmnA9nbpHBTYl7Zp97c8Yt1jR6EF0/7LIqTOq+XU7RBRa+VVz8LCnUDUgJKVdH7wR0OBCSzCTq4FejpubKjpfU0GaWf5GNcnyUWkIhwZKlt3l2AxlKLciZMZ9EI6Jo3jxCwteNPGxiXNKSNFTQlE+9PMHBDL9p1E1Krl1X2nnxt35zMZq7CQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by PH8PR11MB6753.namprd11.prod.outlook.com (2603:10b6:510:1c8::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.29; Wed, 5 Mar
 2025 20:25:45 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%6]) with mapi id 15.20.8511.015; Wed, 5 Mar 2025
 20:25:45 +0000
Date: Wed, 5 Mar 2025 12:25:42 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Gustavo Sousa <gustavo.sousa@intel.com>
Subject: Re: =?utf-8?B?4pyXIFhlLkNJLkZ1bGw=?= =?utf-8?Q?=3A?= failure for
 drm/xe: Unify IP descriptors (rev2)
Message-ID: <20250305202542.GA3701377@mdroper-desk1.amr.corp.intel.com>
References: <20250221-xe-unify-ip-descriptors-v2-0-5bc0c6d0c13f@intel.com>
 <174021480855.715416.9126345099988240771@b555e5b46a47>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <174021480855.715416.9126345099988240771@b555e5b46a47>
X-ClientProxiedBy: SJ0PR05CA0163.namprd05.prod.outlook.com
 (2603:10b6:a03:339::18) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|PH8PR11MB6753:EE_
X-MS-Office365-Filtering-Correlation-Id: 3cd56ed3-b3d4-4a87-d0e0-08dd5c23e845
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|366016|1800799024|376014|13003099007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?V5sMCPEVSes3UabuNTbVc03bz4HchOEU2ktmHamJA7vZUOnzmr4siuHgYSuk?=
 =?us-ascii?Q?Tk0/iue0aFiJIK4GBAFsjPF6HomQQbsy6y2jv7Mfqiuc+CHDDTjm24ixPuPf?=
 =?us-ascii?Q?fEH7RndBRvj4TtAnYGiTS7/5MOXeNLD2OaGNg2JLytOZwkxSMiLf0qOPXbnN?=
 =?us-ascii?Q?Mj4EUc0r/pQCv35cAX4tuY5WDKWPVqjG+oZz11OdNLZVsFCsIqL75bh8a/vE?=
 =?us-ascii?Q?Xmtd9ZEjNSOqyiQ39gFoVJ152ShxtWcFeQlDcM+fm1cF04kPjdLN3H1iQw3C?=
 =?us-ascii?Q?XIA1DjyZTnHmibxm9hVW6grq4pPE4DTjpJonij6Yw1nnkL6ggq80yYEbmJQ/?=
 =?us-ascii?Q?jwFh0jLAzl1r0NT7uAEBxv5I/ik2VhAhMWtH8Q8gFKnNX++qRj5rR053bgdl?=
 =?us-ascii?Q?/oQW6wcmdr679LcoXZ72p5eJVezkKzmAWT8JGcaezBOPsQGLDiJokfVFQjSi?=
 =?us-ascii?Q?Z/s4gk4khDOrmu1nIjFfIQH+0oQxiRWzApRGGuN/eeJ/Sp5IsYLnwamRviLX?=
 =?us-ascii?Q?PeKa96ZSgtScAXKyJ0rxKfYgudbhjE+0pqTDdAhj/6GmTqrz7PmyMYKNG/yX?=
 =?us-ascii?Q?6m6WJ2hHkyIvHTFRpG6F5Pg45hLUIrPjLNmWU1OpP2heUDZSeME5bv7iwwSa?=
 =?us-ascii?Q?pS5xlnKE/fHW0sNTTWyZYtUSAHc6bAk9JVg+5QE7nkDi+8z2hM7+4nTkj5gS?=
 =?us-ascii?Q?MiqEx+5/oys6uLnTv7kOzVKkwQD6jU9diRPzgCP/EAS4MXQDnRpHh6Mm4Oo0?=
 =?us-ascii?Q?guAEu31hkiU50v9q+qbC6PiUnZ7udcXLMAOM/hJ/qqe6Y/tsH6zZbXVaUzYV?=
 =?us-ascii?Q?jaERAjz159rjzy45JAhdblPczE+OJ51f9W7d9C8pFyA6zpsrlT2COk5xsa2W?=
 =?us-ascii?Q?yPIS25sBrwHZPTzmY+nchQZc0AIKZvHG5rii4zxl7tKnOPMAB4e4tiP7N3Kr?=
 =?us-ascii?Q?nLL1L3TXAPFALx46h+PfZQNfFXF4QUbv3Aq2b1DRLXpL9nEbqlD2nuqCrkTL?=
 =?us-ascii?Q?6pPJQwIjoSMeQBFxUkcXihlpPHiQND1pgiQIdTZ+EgEeuU+/BWNn92WTEwT9?=
 =?us-ascii?Q?1LIf2GhfgEIVY+MAbYRgbvON1XGomarz5rc3qRqOHtLTI9XJL0PvPboWPU8w?=
 =?us-ascii?Q?MEAW9zZrGbHO6CYy6o/Y/g1WZ4yUv887HaQHIFROc/el7n3dgpNpTdr4FPiu?=
 =?us-ascii?Q?6lqLhWO7rZYaVPbnbN+3d70ARx1l3Aw2B+kwg8n8xR50yqYGKaw3ypVeHkm/?=
 =?us-ascii?Q?niDVM/Iwh+CENe1IGypGay1yw+TxnfRGOseqsLBcdwmxOENEGIEcNZ7d24k5?=
 =?us-ascii?Q?FrjDYA91hgYKTLxXC3mM/Zb9?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(13003099007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?sXwxFb9tKWMlzBkVAh5HtLshQb+yPCLXKfNeiH20YGZmgSk1X5p43GqDuZJl?=
 =?us-ascii?Q?Q15RPX0q2gPsnXQVZa9YOzzyMmuF+Fk98RdKifTer0VPE/KCADZctf3YTqJ1?=
 =?us-ascii?Q?AHMQj4kNxBEBKEYdCO154OPshdBEoOQPx7pNDR8iqUVcrwLYKisAZpQA7LNt?=
 =?us-ascii?Q?FpCQ8fFZL+6Dcv/tMfdnYYbGq1ObR4NgOVn4a1oDj/WrO/sW1yJ6t51S5psA?=
 =?us-ascii?Q?gyF5K1UAv96jOIAHeN6B0BK8kgT23CWLsA7RTwxiISg8wUNVzaUa1XpLRR5i?=
 =?us-ascii?Q?ctb6zG3zueC2Uop5zOpVa+I48UQtPdwx8WliEvy72Th94FLHQpgdc46dWl8t?=
 =?us-ascii?Q?IpYu+8IfcCHMtMoarvaLbc2wgVrBcCR80Daa6gxCFXWJ93zo15vKtAjvk+2u?=
 =?us-ascii?Q?biMl6YlOpwvTQ71fBLWg+EjvRm5dTElF+yJSn7q2scuLbTlNCLriJBt1BOT/?=
 =?us-ascii?Q?gPo8YjioOmVpIvUbuXu2t34e7RmQXOWdVTFPpdkw/03A2A8DHSPIsiQPzmLB?=
 =?us-ascii?Q?oMm4PUxUxKwtgKmbfqfxOhXO9mwDn57JbusOOpXEq1tSOoqCM1Lcb8hAEwEx?=
 =?us-ascii?Q?bsHHQVd5AwQwmFJJEEb9j0ic4j0nTkJNfZri000MKHdTX14x4ab0cidCEZoE?=
 =?us-ascii?Q?ca2+ZAmEmf0DHCK43ZAXFy6MgkavaMVcIDQQh65fSYn/2mibyV1AFvS3TpeM?=
 =?us-ascii?Q?/o4ISJSv9dgDfg83LPYSDa6JqQ8Q/phbW/OQ6cjM2iKIb8gVmCMAZWjOqI/j?=
 =?us-ascii?Q?Rpe1pVs+1uMO/nWrkUCgM9mMKIccgbdh/v+fW7EPkMW4gjLdA37FtNVr1285?=
 =?us-ascii?Q?VFC1OoyVfENDU2t3PMIYSJSR63IZuaf3f0U9EKYAcXf4QEEkzVrRUa7ScDXM?=
 =?us-ascii?Q?dhaf/CRdG41pAwHzAPrd9jhe0GsS7aV9iI34ygG6MYsfmaeS0nt8eZS5d6tg?=
 =?us-ascii?Q?sFIgM39BJADXZReTKV9AkzDeNMk4Ymi/3rkhC4FwRIy8EJKN4lRCgo9m9CUw?=
 =?us-ascii?Q?/3LUXOiv7WpmUGbJhQTdNQ4Wr2lphJsK+6EPzuulssjwSqQchqC9His0es2O?=
 =?us-ascii?Q?190hMqGwcTvjOehiCSphEmhKYALWWZuBtZTUFuaxV0tON/LkesnnWUZ4iAUB?=
 =?us-ascii?Q?5Hh2EAU+0yGMWb54f3CpmxLfAOSeWCVM82uajVKln7uBTE42dZaEdgPgol6e?=
 =?us-ascii?Q?LYcKu18gqcxDgK7RG7m2Ort6mCQXu5vd9e0uw5l2CnDIVufW69VU8fVEDVjs?=
 =?us-ascii?Q?y+qUU9J61dSPYP24cJ72bNKxZw84c1o/xsSV3HEt2q419GybMhOjUgKhyTOO?=
 =?us-ascii?Q?rrKivxD7ivMnLZwv2cQE7EVJYVq8G1ACyuPpp8Og5ldnHffeOh0eWfFYIhIp?=
 =?us-ascii?Q?K5kJxmwBLoLYFTfz6qe0sSd4TWOnV+x9/aftWcp+MBx9KebGc/aH8U0ik2Lc?=
 =?us-ascii?Q?61eZX4dumakeF1Rv8sG+unkq1+o4DnxzJKDGasuRGdADFOsNXwRvlLxWgSQ2?=
 =?us-ascii?Q?IKGuTHoel+7qDoZLbhSFkCcqAo8LVdp9q2jSbjrSJRmiS4jj2OEJyTFrZzFA?=
 =?us-ascii?Q?Maex514t4RG9TSwYE9aukuZ4BEedD3n50j6kxVakOEwtY5hXCCegK4Z93FGJ?=
 =?us-ascii?Q?0Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3cd56ed3-b3d4-4a87-d0e0-08dd5c23e845
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2025 20:25:45.0326 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XdaIUDlc/u9yrA9pEi1R1pl68LsOFDl1vdc5isl24PXtp44qrVbkEkeVdbnUZmAeAk+laHyOhCnQViVThAoEDNnTQk1opI2uHMJ5CQDtOCk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6753
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

On Sat, Feb 22, 2025 at 09:00:08AM -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: drm/xe: Unify IP descriptors (rev2)
> URL   : https://patchwork.freedesktop.org/series/145188/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from xe-2699-3ef8736446933ce5e8ccbec2f85922ca1ed3b706_full -> xe-pw-145188v2_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with xe-pw-145188v2_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in xe-pw-145188v2_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   
> 
> Participating hosts (4 -> 4)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in xe-pw-145188v2_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
>     - shard-adlp:         [PASS][1] -> [DMESG-WARN][2] +1 other test dmesg-warn
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2699-3ef8736446933ce5e8ccbec2f85922ca1ed3b706/shard-adlp-3/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145188v2/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/4173

> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-2 (NEW):
>     - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][3] +2 other tests incomplete
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145188v2/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-2.html

<3> [497.084619] xe 0000:03:00.0: [drm] *ERROR* [CRTC:82:pipe A] DSB 2 GTT fault
<3> [497.084636] xe 0000:03:00.0: [drm] *ERROR* [CRTC:82:pipe A] DSB 2 response timeout
<3> [497.084640] xe 0000:03:00.0: [drm] *ERROR* [CRTC:82:pipe A] DSB 2 poll error
<3> [497.168773] xe 0000:03:00.0: [drm] *ERROR* CPU pipe A FIFO underrun
<3> [497.168845] xe 0000:03:00.0: [drm] *ERROR* [CRTC:82:pipe A] PIPEDMC fault

Display faults here aren't related to the core driver's IP matching
code.

> 
>   * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][4]
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145188v2/shard-dg2-432/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2.html

Skip due to monitor capabilities.

> 
>   * igt@xe_module_load@reload:
>     - shard-dg2-set2:     [PASS][5] -> [ABORT][6]
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2699-3ef8736446933ce5e8ccbec2f85922ca1ed3b706/shard-dg2-433/igt@xe_module_load@reload.html
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145188v2/shard-dg2-464/igt@xe_module_load@reload.html

Appears to be a bad pointer reference while reading G2H messages.  Not
related to the IP descriptor stuff here.


Series applied to drm-xe-next.  Thanks for the patches.


Matt

> 
>   
> #### Warnings ####
> 
>   * igt@kms_pm_rpm@legacy-planes-dpms@plane-68:
>     - shard-bmg:          [DMESG-WARN][7] ([Intel XE#4330]) -> [DMESG-WARN][8]
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2699-3ef8736446933ce5e8ccbec2f85922ca1ed3b706/shard-bmg-8/igt@kms_pm_rpm@legacy-planes-dpms@plane-68.html
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145188v2/shard-bmg-6/igt@kms_pm_rpm@legacy-planes-dpms@plane-68.html
> 
>   
> New tests
> ---------
> 
>   New tests have been introduced between xe-2699-3ef8736446933ce5e8ccbec2f85922ca1ed3b706_full and xe-pw-145188v2_full:
> 
> ### New IGT tests (81) ###
> 
>   * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs@pipe-a-hdmi-a-1:
>     - Statuses : 1 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-1:
>     - Statuses : 1 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs@pipe-c-hdmi-a-1:
>     - Statuses : 1 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs@pipe-d-hdmi-a-1:
>     - Statuses : 1 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs-cc@pipe-a-dp-4:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.00] s
> 
>   * igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.00] s
> 
>   * igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs-cc@pipe-b-dp-4:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-6:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs-cc@pipe-c-dp-4:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs-cc@pipe-d-dp-4:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.00] s
> 
>   * igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs-cc@pipe-d-hdmi-a-6:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.00] s
> 
>   * igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs@pipe-a-hdmi-a-2:
>     - Statuses : 1 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2:
>     - Statuses : 1 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs@pipe-c-hdmi-a-2:
>     - Statuses : 1 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs@pipe-d-hdmi-a-2:
>     - Statuses : 1 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs@pipe-a-hdmi-a-2:
>     - Statuses : 1 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-2:
>     - Statuses : 1 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-2:
>     - Statuses : 1 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs@pipe-d-hdmi-a-2:
>     - Statuses : 1 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_ccs@bad-rotation-90-4-tiled-mtl-mc-ccs@pipe-a-dp-4:
>     - Statuses : 1 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_ccs@bad-rotation-90-4-tiled-mtl-mc-ccs@pipe-b-dp-4:
>     - Statuses : 1 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_ccs@bad-rotation-90-4-tiled-mtl-mc-ccs@pipe-c-dp-4:
>     - Statuses : 1 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_ccs@bad-rotation-90-4-tiled-mtl-mc-ccs@pipe-d-dp-4:
>     - Statuses : 1 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs@pipe-a-dp-4:
>     - Statuses : 1 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs@pipe-a-hdmi-a-6:
>     - Statuses : 1 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs@pipe-b-dp-4:
>     - Statuses : 1 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-6:
>     - Statuses : 1 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs@pipe-c-dp-4:
>     - Statuses : 1 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-6:
>     - Statuses : 1 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs@pipe-d-dp-4:
>     - Statuses : 1 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs@pipe-d-hdmi-a-6:
>     - Statuses : 1 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs@pipe-a-hdmi-a-2:
>     - Statuses : 1 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-2:
>     - Statuses : 1 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-2:
>     - Statuses : 1 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs@pipe-d-hdmi-a-2:
>     - Statuses : 1 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs@pipe-a-dp-4:
>     - Statuses : 1 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs@pipe-b-dp-4:
>     - Statuses : 1 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs@pipe-c-dp-4:
>     - Statuses : 1 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs@pipe-d-dp-4:
>     - Statuses : 1 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-a-dp-4:
>     - Statuses : 1 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6:
>     - Statuses : 1 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-b-dp-4:
>     - Statuses : 1 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-6:
>     - Statuses : 1 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-c-dp-4:
>     - Statuses : 1 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6:
>     - Statuses : 1 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-4:
>     - Statuses : 1 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-6:
>     - Statuses : 1 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_ccs@crc-primary-rotation-180-y-tiled-ccs@pipe-a-hdmi-a-1:
>     - Statuses : 1 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_ccs@crc-primary-rotation-180-y-tiled-ccs@pipe-b-hdmi-a-1:
>     - Statuses : 1 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_ccs@crc-primary-rotation-180-y-tiled-ccs@pipe-c-hdmi-a-1:
>     - Statuses : 1 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_ccs@crc-primary-rotation-180-y-tiled-ccs@pipe-d-hdmi-a-1:
>     - Statuses : 1 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs@pipe-a-dp-4:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.54] s
> 
>   * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs@pipe-b-dp-4:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.51] s
> 
>   * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs@pipe-c-dp-4:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.51] s
> 
>   * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs@pipe-d-dp-4:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.50] s
> 
>   * igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs-cc@pipe-a-hdmi-a-2:
>     - Statuses : 1 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs-cc@pipe-b-hdmi-a-2:
>     - Statuses : 1 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs-cc@pipe-c-hdmi-a-2:
>     - Statuses : 1 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-2:
>     - Statuses : 1 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-2:
>     - Statuses : 1 incomplete(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs@pipe-a-dp-4:
>     - Statuses : 1 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs@pipe-b-dp-4:
>     - Statuses : 1 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs@pipe-c-dp-4:
>     - Statuses : 1 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs@pipe-d-dp-4:
>     - Statuses : 1 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs@pipe-a-dp-4:
>     - Statuses : 1 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs@pipe-a-hdmi-a-6:
>     - Statuses : 1 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs@pipe-b-dp-4:
>     - Statuses : 1 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-6:
>     - Statuses : 1 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs@pipe-c-dp-4:
>     - Statuses : 1 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-6:
>     - Statuses : 1 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs@pipe-d-dp-4:
>     - Statuses : 1 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs@pipe-d-hdmi-a-6:
>     - Statuses : 1 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-a-dp-4:
>     - Statuses : 1 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-a-hdmi-a-6:
>     - Statuses : 1 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-b-dp-4:
>     - Statuses : 1 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-b-hdmi-a-6:
>     - Statuses : 1 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-c-dp-4:
>     - Statuses : 1 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-c-hdmi-a-6:
>     - Statuses : 1 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-d-dp-4:
>     - Statuses : 1 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-d-hdmi-a-6:
>     - Statuses : 1 skip(s)
>     - Exec time: [0.0] s
> 
>   
> 
> Known issues
> ------------
> 
>   Here are the changes found in xe-pw-145188v2_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@kms_big_fb@4-tiled-32bpp-rotate-0:
>     - shard-bmg:          NOTRUN -> [INCOMPLETE][9] ([Intel XE#3225])
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145188v2/shard-bmg-1/igt@kms_big_fb@4-tiled-32bpp-rotate-0.html
> 
>   * igt@kms_big_fb@x-tiled-64bpp-rotate-90:
>     - shard-bmg:          NOTRUN -> [SKIP][10] ([Intel XE#2327])
>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145188v2/shard-bmg-7/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html
> 
>   * igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
>     - shard-bmg:          NOTRUN -> [SKIP][11] ([Intel XE#607])
>    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145188v2/shard-bmg-7/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html
> 
>   * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180:
>     - shard-bmg:          NOTRUN -> [SKIP][12] ([Intel XE#1124]) +1 other test skip
>    [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145188v2/shard-bmg-7/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180.html
> 
>   * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][13] ([Intel XE#1124])
>    [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145188v2/shard-dg2-433/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
> 
>   * igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:
>     - shard-bmg:          [PASS][14] -> [SKIP][15] ([Intel XE#2314] / [Intel XE#2894])
>    [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2699-3ef8736446933ce5e8ccbec2f85922ca1ed3b706/shard-bmg-8/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html
>    [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145188v2/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html
> 
>   * igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][16] ([Intel XE#2191])
>    [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145188v2/shard-dg2-433/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html
>     - shard-adlp:         NOTRUN -> [SKIP][17] ([Intel XE#2191])
>    [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145188v2/shard-adlp-2/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html
> 
>   * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs@pipe-a-hdmi-a-2 (NEW):
>     - shard-dg2-set2:     NOTRUN -> [SKIP][18] ([Intel XE#787]) +64 other tests skip
>    [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145188v2/shard-dg2-432/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs@pipe-a-hdmi-a-2.html
> 
>   * igt@kms_ccs@crc-primary-rotation-180-y-tiled-ccs@pipe-c-hdmi-a-1 (NEW):
>     - shard-adlp:         NOTRUN -> [SKIP][19] ([Intel XE#787]) +5 other tests skip
>    [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145188v2/shard-adlp-3/igt@kms_ccs@crc-primary-rotation-180-y-tiled-ccs@pipe-c-hdmi-a-1.html
> 
>   * igt@kms_ccs@crc-primary-rotation-180-y-tiled-ccs@pipe-d-hdmi-a-1 (NEW):
>     - shard-adlp:         NOTRUN -> [SKIP][20] ([Intel XE#455] / [Intel XE#787]) +3 other tests skip
>    [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145188v2/shard-adlp-3/igt@kms_ccs@crc-primary-rotation-180-y-tiled-ccs@pipe-d-hdmi-a-1.html
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:
>     - shard-bmg:          NOTRUN -> [SKIP][21] ([Intel XE#2887]) +1 other test skip
>    [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145188v2/shard-bmg-3/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html
> 
>   * igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-d-dp-4 (NEW):
>     - shard-dg2-set2:     NOTRUN -> [SKIP][22] ([Intel XE#455] / [Intel XE#787]) +12 other tests skip
>    [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145188v2/shard-dg2-436/igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-d-dp-4.html
> 
>   * igt@kms_cdclk@mode-transition@pipe-a-hdmi-a-1:
>     - shard-adlp:         NOTRUN -> [SKIP][23] ([Intel XE#314]) +2 other tests skip
>    [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145188v2/shard-adlp-3/igt@kms_cdclk@mode-transition@pipe-a-hdmi-a-1.html
> 
>   * igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-1:
>     - shard-adlp:         NOTRUN -> [SKIP][24] ([Intel XE#314] / [Intel XE#455]) +1 other test skip
>    [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145188v2/shard-adlp-3/igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-1.html
> 
>   * igt@kms_chamelium_audio@hdmi-audio:
>     - shard-bmg:          NOTRUN -> [SKIP][25] ([Intel XE#2252]) +1 other test skip
>    [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145188v2/shard-bmg-7/igt@kms_chamelium_audio@hdmi-audio.html
> 
>   * igt@kms_color@ctm-0-25@pipe-c-hdmi-a-3:
>     - shard-bmg:          [PASS][26] -> [DMESG-WARN][27] ([Intel XE#877]) +4 other tests dmesg-warn
>    [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2699-3ef8736446933ce5e8ccbec2f85922ca1ed3b706/shard-bmg-6/igt@kms_color@ctm-0-25@pipe-c-hdmi-a-3.html
>    [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145188v2/shard-bmg-7/igt@kms_color@ctm-0-25@pipe-c-hdmi-a-3.html
> 
>   * igt@kms_color@ctm-0-50@pipe-d-hdmi-a-6:
>     - shard-dg2-set2:     [PASS][28] -> [DMESG-WARN][29] ([Intel XE#4330]) +9 other tests dmesg-warn
>    [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2699-3ef8736446933ce5e8ccbec2f85922ca1ed3b706/shard-dg2-433/igt@kms_color@ctm-0-50@pipe-d-hdmi-a-6.html
>    [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145188v2/shard-dg2-464/igt@kms_color@ctm-0-50@pipe-d-hdmi-a-6.html
> 
>   * igt@kms_content_protection@atomic-dpms@pipe-a-dp-2:
>     - shard-dg2-set2:     NOTRUN -> [FAIL][30] ([Intel XE#1178]) +1 other test fail
>    [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145188v2/shard-dg2-432/igt@kms_content_protection@atomic-dpms@pipe-a-dp-2.html
> 
>   * igt@kms_content_protection@lic-type-0@pipe-a-dp-4:
>     - shard-dg2-set2:     NOTRUN -> [FAIL][31] ([Intel XE#3304])
>    [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145188v2/shard-dg2-436/igt@kms_content_protection@lic-type-0@pipe-a-dp-4.html
> 
>   * igt@kms_content_protection@uevent@pipe-a-dp-2:
>     - shard-bmg:          NOTRUN -> [FAIL][32] ([Intel XE#1188])
>    [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145188v2/shard-bmg-7/igt@kms_content_protection@uevent@pipe-a-dp-2.html
> 
>   * igt@kms_cursor_crc@cursor-offscreen-64x64@pipe-d-hdmi-a-2:
>     - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][33] ([Intel XE#4330]) +2 other tests dmesg-warn
>    [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145188v2/shard-dg2-432/igt@kms_cursor_crc@cursor-offscreen-64x64@pipe-d-hdmi-a-2.html
> 
>   * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic:
>     - shard-bmg:          NOTRUN -> [INCOMPLETE][34] ([Intel XE#3226])
>    [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145188v2/shard-bmg-3/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html
> 
>   * igt@kms_cursor_legacy@cursora-vs-flipb-legacy:
>     - shard-bmg:          [PASS][35] -> [SKIP][36] ([Intel XE#2291]) +3 other tests skip
>    [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2699-3ef8736446933ce5e8ccbec2f85922ca1ed3b706/shard-bmg-8/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html
>    [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145188v2/shard-bmg-6/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html
> 
>   * igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:
>     - shard-dg2-set2:     [PASS][37] -> [SKIP][38] ([Intel XE#309]) +3 other tests skip
>    [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2699-3ef8736446933ce5e8ccbec2f85922ca1ed3b706/shard-dg2-436/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html
>    [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145188v2/shard-dg2-464/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html
> 
>   * igt@kms_display_modes@extended-mode-basic:
>     - shard-dg2-set2:     [PASS][39] -> [SKIP][40] ([Intel XE#4302])
>    [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2699-3ef8736446933ce5e8ccbec2f85922ca1ed3b706/shard-dg2-433/igt@kms_display_modes@extended-mode-basic.html
>    [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145188v2/shard-dg2-464/igt@kms_display_modes@extended-mode-basic.html
> 
>   * igt@kms_dp_aux_dev:
>     - shard-dg2-set2:     [PASS][41] -> [SKIP][42] ([Intel XE#3009])
>    [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2699-3ef8736446933ce5e8ccbec2f85922ca1ed3b706/shard-dg2-436/igt@kms_dp_aux_dev.html
>    [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145188v2/shard-dg2-464/igt@kms_dp_aux_dev.html
> 
>   * igt@kms_dsc@dsc-with-output-formats-with-bpc:
>     - shard-bmg:          NOTRUN -> [SKIP][43] ([Intel XE#2244])
>    [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145188v2/shard-bmg-7/igt@kms_dsc@dsc-with-output-formats-with-bpc.html
> 
>   * igt@kms_flip@2x-absolute-wf_vblank:
>     - shard-bmg:          [PASS][44] -> [SKIP][45] ([Intel XE#2316]) +1 other test skip
>    [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2699-3ef8736446933ce5e8ccbec2f85922ca1ed3b706/shard-bmg-8/igt@kms_flip@2x-absolute-wf_vblank.html
>    [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145188v2/shard-bmg-6/igt@kms_flip@2x-absolute-wf_vblank.html
> 
>   * igt@kms_flip@2x-dpms-vs-vblank-race-interruptible:
>     - shard-dg2-set2:     [PASS][46] -> [SKIP][47] ([Intel XE#310]) +7 other tests skip
>    [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2699-3ef8736446933ce5e8ccbec2f85922ca1ed3b706/shard-dg2-434/igt@kms_flip@2x-dpms-vs-vblank-race-interruptible.html
>    [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145188v2/shard-dg2-464/igt@kms_flip@2x-dpms-vs-vblank-race-interruptible.html
> 
>   * igt@kms_flip@2x-flip-vs-modeset-vs-hang:
>     - shard-adlp:         NOTRUN -> [SKIP][48] ([Intel XE#310])
>    [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145188v2/shard-adlp-3/igt@kms_flip@2x-flip-vs-modeset-vs-hang.html
> 
>   * igt@kms_flip@flip-vs-expired-vblank-interruptible:
>     - shard-dg2-set2:     [PASS][49] -> [FAIL][50] ([Intel XE#301])
>    [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2699-3ef8736446933ce5e8ccbec2f85922ca1ed3b706/shard-dg2-432/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
>    [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145188v2/shard-dg2-436/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
> 
>   * igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp4:
>     - shard-dg2-set2:     NOTRUN -> [FAIL][51] ([Intel XE#301]) +7 other tests fail
>    [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145188v2/shard-dg2-436/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp4.html
> 
>   * igt@kms_flip@flip-vs-expired-vblank@a-dp2:
>     - shard-bmg:          [PASS][52] -> [FAIL][53] ([Intel XE#3321]) +4 other tests fail
>    [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2699-3ef8736446933ce5e8ccbec2f85922ca1ed3b706/shard-bmg-8/igt@kms_flip@flip-vs-expired-vblank@a-dp2.html
>    [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145188v2/shard-bmg-5/igt@kms_flip@flip-vs-expired-vblank@a-dp2.html
> 
>   * igt@kms_flip@flip-vs-suspend-interruptible:
>     - shard-adlp:         [PASS][54] -> [DMESG-WARN][55] ([Intel XE#2953]) +1 other test dmesg-warn
>    [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2699-3ef8736446933ce5e8ccbec2f85922ca1ed3b706/shard-adlp-3/igt@kms_flip@flip-vs-suspend-interruptible.html
>    [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145188v2/shard-adlp-8/igt@kms_flip@flip-vs-suspend-interruptible.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render:
>     - shard-bmg:          NOTRUN -> [SKIP][56] ([Intel XE#2311]) +8 other tests skip
>    [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145188v2/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt:
>     - shard-bmg:          NOTRUN -> [SKIP][57] ([Intel XE#4141]) +3 other tests skip
>    [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145188v2/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-plflip-blt:
>     - shard-dg2-set2:     [PASS][58] -> [SKIP][59] ([Intel XE#656]) +8 other tests skip
>    [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2699-3ef8736446933ce5e8ccbec2f85922ca1ed3b706/shard-dg2-433/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-plflip-blt.html
>    [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145188v2/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-plflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][60] ([Intel XE#651]) +2 other tests skip
>    [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145188v2/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-msflip-blt:
>     - shard-bmg:          NOTRUN -> [SKIP][61] ([Intel XE#2313]) +6 other tests skip
>    [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145188v2/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-msflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][62] ([Intel XE#653]) +2 other tests skip
>    [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145188v2/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc.html
> 
>   * igt@kms_joiner@basic-force-ultra-joiner:
>     - shard-bmg:          NOTRUN -> [SKIP][63] ([Intel XE#2934])
>    [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145188v2/shard-bmg-7/igt@kms_joiner@basic-force-ultra-joiner.html
> 
>   * igt@kms_joiner@invalid-modeset-force-big-joiner:
>     - shard-bmg:          [PASS][64] -> [SKIP][65] ([Intel XE#3012])
>    [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2699-3ef8736446933ce5e8ccbec2f85922ca1ed3b706/shard-bmg-8/igt@kms_joiner@invalid-modeset-force-big-joiner.html
>    [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145188v2/shard-bmg-6/igt@kms_joiner@invalid-modeset-force-big-joiner.html
> 
>   * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
>     - shard-bmg:          NOTRUN -> [SKIP][66] ([Intel XE#2501])
>    [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145188v2/shard-bmg-7/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
> 
>   * igt@kms_plane_cursor@viewport:
>     - shard-dg2-set2:     [PASS][67] -> [FAIL][68] ([Intel XE#616]) +1 other test fail
>    [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2699-3ef8736446933ce5e8ccbec2f85922ca1ed3b706/shard-dg2-464/igt@kms_plane_cursor@viewport.html
>    [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145188v2/shard-dg2-436/igt@kms_plane_cursor@viewport.html
> 
>   * igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-2:
>     - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][69] ([Intel XE#4212]) +1 other test dmesg-warn
>    [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145188v2/shard-dg2-432/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-2.html
> 
>   * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-c:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][70] ([Intel XE#2763]) +2 other tests skip
>    [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145188v2/shard-dg2-433/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-c.html
> 
>   * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][71] ([Intel XE#2763] / [Intel XE#455]) +1 other test skip
>    [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145188v2/shard-dg2-433/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d.html
> 
>   * igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-b:
>     - shard-bmg:          NOTRUN -> [SKIP][72] ([Intel XE#2763]) +4 other tests skip
>    [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145188v2/shard-bmg-7/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-b.html
> 
>   * igt@kms_pm_backlight@brightness-with-dpms:
>     - shard-adlp:         NOTRUN -> [SKIP][73] ([Intel XE#2938])
>    [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145188v2/shard-adlp-3/igt@kms_pm_backlight@brightness-with-dpms.html
> 
>   * igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area:
>     - shard-bmg:          NOTRUN -> [SKIP][74] ([Intel XE#1489])
>    [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145188v2/shard-bmg-7/igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area.html
> 
>   * igt@kms_psr2_sf@pr-plane-move-sf-dmg-area:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][75] ([Intel XE#1489])
>    [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145188v2/shard-dg2-433/igt@kms_psr2_sf@pr-plane-move-sf-dmg-area.html
> 
>   * igt@kms_psr@fbc-pr-suspend:
>     - shard-bmg:          NOTRUN -> [SKIP][76] ([Intel XE#2234] / [Intel XE#2850]) +2 other tests skip
>    [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145188v2/shard-bmg-7/igt@kms_psr@fbc-pr-suspend.html
> 
>   * igt@kms_psr@fbc-psr-primary-page-flip:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][77] ([Intel XE#2850] / [Intel XE#929])
>    [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145188v2/shard-dg2-433/igt@kms_psr@fbc-psr-primary-page-flip.html
> 
>   * igt@kms_setmode@invalid-clone-single-crtc-stealing:
>     - shard-bmg:          [PASS][78] -> [SKIP][79] ([Intel XE#1435])
>    [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2699-3ef8736446933ce5e8ccbec2f85922ca1ed3b706/shard-bmg-8/igt@kms_setmode@invalid-clone-single-crtc-stealing.html
>    [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145188v2/shard-bmg-6/igt@kms_setmode@invalid-clone-single-crtc-stealing.html
> 
>   * igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1:
>     - shard-lnl:          [PASS][80] -> [FAIL][81] ([Intel XE#899])
>    [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2699-3ef8736446933ce5e8ccbec2f85922ca1ed3b706/shard-lnl-4/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html
>    [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145188v2/shard-lnl-7/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html
> 
>   * igt@kms_vrr@flipline:
>     - shard-lnl:          [PASS][82] -> [FAIL][83] ([Intel XE#1522]) +1 other test fail
>    [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2699-3ef8736446933ce5e8ccbec2f85922ca1ed3b706/shard-lnl-7/igt@kms_vrr@flipline.html
>    [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145188v2/shard-lnl-6/igt@kms_vrr@flipline.html
> 
>   * igt@xe_eudebug@basic-vm-bind-metadata-discovery:
>     - shard-bmg:          NOTRUN -> [SKIP][84] ([Intel XE#2905]) +2 other tests skip
>    [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145188v2/shard-bmg-7/igt@xe_eudebug@basic-vm-bind-metadata-discovery.html
> 
>   * igt@xe_eudebug@basic-vm-bind-ufence-reconnect:
>     - shard-bmg:          NOTRUN -> [SKIP][85] ([Intel XE#3889])
>    [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145188v2/shard-bmg-3/igt@xe_eudebug@basic-vm-bind-ufence-reconnect.html
> 
>   * igt@xe_eudebug_online@interrupt-other:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][86] ([Intel XE#2905])
>    [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145188v2/shard-dg2-433/igt@xe_eudebug_online@interrupt-other.html
> 
>   * igt@xe_exec_basic@many-rebind:
>     - shard-bmg:          [PASS][87] -> [DMESG-WARN][88] ([Intel XE#4330]) +10 other tests dmesg-warn
>    [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2699-3ef8736446933ce5e8ccbec2f85922ca1ed3b706/shard-bmg-1/igt@xe_exec_basic@many-rebind.html
>    [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145188v2/shard-bmg-3/igt@xe_exec_basic@many-rebind.html
> 
>   * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-rebind:
>     - shard-bmg:          NOTRUN -> [SKIP][89] ([Intel XE#2322]) +2 other tests skip
>    [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145188v2/shard-bmg-1/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-rebind.html
> 
>   * igt@xe_exec_basic@multigpu-once-bindexecqueue:
>     - shard-dg2-set2:     [PASS][90] -> [SKIP][91] ([Intel XE#1392]) +3 other tests skip
>    [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2699-3ef8736446933ce5e8ccbec2f85922ca1ed3b706/shard-dg2-464/igt@xe_exec_basic@multigpu-once-bindexecqueue.html
>    [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145188v2/shard-dg2-432/igt@xe_exec_basic@multigpu-once-bindexecqueue.html
> 
>   * igt@xe_exec_fault_mode@invalid-va:
>     - shard-adlp:         NOTRUN -> [SKIP][92] ([Intel XE#288]) +1 other test skip
>    [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145188v2/shard-adlp-3/igt@xe_exec_fault_mode@invalid-va.html
> 
>   * igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:
>     - shard-bmg:          NOTRUN -> [SKIP][93] ([Intel XE#2229])
>    [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145188v2/shard-bmg-7/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html
> 
>   * igt@xe_live_ktest@xe_mocs:
>     - shard-bmg:          [PASS][94] -> [SKIP][95] ([Intel XE#4322])
>    [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2699-3ef8736446933ce5e8ccbec2f85922ca1ed3b706/shard-bmg-5/igt@xe_live_ktest@xe_mocs.html
>    [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145188v2/shard-bmg-6/igt@xe_live_ktest@xe_mocs.html
> 
>   * igt@xe_pm@s2idle-vm-bind-unbind-all:
>     - shard-bmg:          NOTRUN -> [DMESG-WARN][96] ([Intel XE#4330]) +4 other tests dmesg-warn
>    [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145188v2/shard-bmg-3/igt@xe_pm@s2idle-vm-bind-unbind-all.html
> 
>   * igt@xe_pm@s4-multiple-execs:
>     - shard-adlp:         NOTRUN -> [ABORT][97] ([Intel XE#4268])
>    [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145188v2/shard-adlp-3/igt@xe_pm@s4-multiple-execs.html
> 
>   * igt@xe_pm@vram-d3cold-threshold:
>     - shard-bmg:          NOTRUN -> [SKIP][98] ([Intel XE#579])
>    [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145188v2/shard-bmg-7/igt@xe_pm@vram-d3cold-threshold.html
> 
>   * igt@xe_wedged@basic-wedged:
>     - shard-adlp:         [PASS][99] -> [DMESG-WARN][100] ([Intel XE#4173]) +3 other tests dmesg-warn
>    [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2699-3ef8736446933ce5e8ccbec2f85922ca1ed3b706/shard-adlp-2/igt@xe_wedged@basic-wedged.html
>    [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145188v2/shard-adlp-4/igt@xe_wedged@basic-wedged.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@kms_async_flips@invalid-async-flip@pipe-c-hdmi-a-1:
>     - shard-adlp:         [DMESG-WARN][101] ([Intel XE#4330]) -> [PASS][102] +1 other test pass
>    [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2699-3ef8736446933ce5e8ccbec2f85922ca1ed3b706/shard-adlp-4/igt@kms_async_flips@invalid-async-flip@pipe-c-hdmi-a-1.html
>    [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145188v2/shard-adlp-8/igt@kms_async_flips@invalid-async-flip@pipe-c-hdmi-a-1.html
> 
>   * igt@kms_atomic@plane-primary-legacy@pipe-a-dp-2:
>     - shard-bmg:          [INCOMPLETE][103] -> [PASS][104] +4 other tests pass
>    [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2699-3ef8736446933ce5e8ccbec2f85922ca1ed3b706/shard-bmg-1/igt@kms_atomic@plane-primary-legacy@pipe-a-dp-2.html
>    [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145188v2/shard-bmg-1/igt@kms_atomic@plane-primary-legacy@pipe-a-dp-2.html
> 
>   * igt@kms_atomic_transition@plane-all-modeset-transition-fencing:
>     - shard-adlp:         [FAIL][105] ([Intel XE#3908]) -> [PASS][106] +1 other test pass
>    [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2699-3ef8736446933ce5e8ccbec2f85922ca1ed3b706/shard-adlp-1/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html
>    [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145188v2/shard-adlp-1/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html
> 
>   * igt@kms_color@ctm-signed:
>     - shard-bmg:          [DMESG-WARN][107] ([Intel XE#877]) -> [PASS][108] +1 other test pass
>    [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2699-3ef8736446933ce5e8ccbec2f85922ca1ed3b706/shard-bmg-3/igt@kms_color@ctm-signed.html
>    [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145188v2/shard-bmg-7/igt@kms_color@ctm-signed.html
> 
>   * igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:
>     - shard-dg2-set2:     [SKIP][109] ([Intel XE#309]) -> [PASS][110] +4 other tests pass
>    [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2699-3ef8736446933ce5e8ccbec2f85922ca1ed3b706/shard-dg2-464/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html
>    [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145188v2/shard-dg2-432/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html
> 
>   * igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:
>     - shard-bmg:          [SKIP][111] ([Intel XE#2291]) -> [PASS][112] +2 other tests pass
>    [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2699-3ef8736446933ce5e8ccbec2f85922ca1ed3b706/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html
>    [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145188v2/shard-bmg-7/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html
> 
>   * igt@kms_cursor_legacy@torture-move:
>     - shard-adlp:         [DMESG-WARN][113] -> [PASS][114] +1 other test pass
>    [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2699-3ef8736446933ce5e8ccbec2f85922ca1ed3b706/shard-adlp-2/igt@kms_cursor_legacy@torture-move.html
>    [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145188v2/shard-adlp-1/igt@kms_cursor_legacy@torture-move.html
> 
>   * igt@kms_cursor_legacy@torture-move@pipe-d:
>     - shard-dg2-set2:     [DMESG-WARN][115] -> [PASS][116] +1 other test pass
>    [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2699-3ef8736446933ce5e8ccbec2f85922ca1ed3b706/shard-dg2-433/igt@kms_cursor_legacy@torture-move@pipe-d.html
>    [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145188v2/shard-dg2-434/igt@kms_cursor_legacy@torture-move@pipe-d.html
> 
>   * igt@kms_dither@fb-8bpc-vs-panel-6bpc:
>     - shard-dg2-set2:     [SKIP][117] ([Intel XE#455]) -> [PASS][118] +1 other test pass
>    [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2699-3ef8736446933ce5e8ccbec2f85922ca1ed3b706/shard-dg2-464/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html
>    [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145188v2/shard-dg2-432/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html
> 
>   * igt@kms_dp_aux_dev:
>     - shard-bmg:          [SKIP][119] ([Intel XE#3009]) -> [PASS][120]
>    [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2699-3ef8736446933ce5e8ccbec2f85922ca1ed3b706/shard-bmg-6/igt@kms_dp_aux_dev.html
>    [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145188v2/shard-bmg-7/igt@kms_dp_aux_dev.html
> 
>   * {igt@kms_dp_link_training@non-uhbr-sst}:
>     - shard-dg2-set2:     [SKIP][121] -> [PASS][122]
>    [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2699-3ef8736446933ce5e8ccbec2f85922ca1ed3b706/shard-dg2-464/igt@kms_dp_link_training@non-uhbr-sst.html
>    [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145188v2/shard-dg2-432/igt@kms_dp_link_training@non-uhbr-sst.html
> 
>   * igt@kms_feature_discovery@display-2x:
>     - shard-bmg:          [SKIP][123] ([Intel XE#2373]) -> [PASS][124]
>    [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2699-3ef8736446933ce5e8ccbec2f85922ca1ed3b706/shard-bmg-6/igt@kms_feature_discovery@display-2x.html
>    [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145188v2/shard-bmg-7/igt@kms_feature_discovery@display-2x.html
>     - shard-dg2-set2:     [SKIP][125] ([Intel XE#702]) -> [PASS][126]
>    [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2699-3ef8736446933ce5e8ccbec2f85922ca1ed3b706/shard-dg2-464/igt@kms_feature_discovery@display-2x.html
>    [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145188v2/shard-dg2-436/igt@kms_feature_discovery@display-2x.html
> 
>   * igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3:
>     - shard-bmg:          [FAIL][127] ([Intel XE#3321]) -> [PASS][128] +1 other test pass
>    [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2699-3ef8736446933ce5e8ccbec2f85922ca1ed3b706/shard-bmg-5/igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3.html
>    [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145188v2/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3.html
> 
>   * igt@kms_flip@2x-plain-flip-fb-recreate:
>     - shard-bmg:          [SKIP][129] ([Intel XE#2316]) -> [PASS][130] +6 other tests pass
>    [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2699-3ef8736446933ce5e8ccbec2f85922ca1ed3b706/shard-bmg-6/igt@kms_flip@2x-plain-flip-fb-recreate.html
>    [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145188v2/shard-bmg-7/igt@kms_flip@2x-plain-flip-fb-recreate.html
>     - shard-dg2-set2:     [SKIP][131] ([Intel XE#310]) -> [PASS][132] +4 other tests pass
>    [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2699-3ef8736446933ce5e8ccbec2f85922ca1ed3b706/shard-dg2-464/igt@kms_flip@2x-plain-flip-fb-recreate.html
>    [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145188v2/shard-dg2-436/igt@kms_flip@2x-plain-flip-fb-recreate.html
> 
>   * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:
>     - shard-lnl:          [FAIL][133] ([Intel XE#301]) -> [PASS][134]
>    [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2699-3ef8736446933ce5e8ccbec2f85922ca1ed3b706/shard-lnl-6/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html
>    [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145188v2/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html
> 
>   * igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a6:
>     - shard-dg2-set2:     [FAIL][135] ([Intel XE#301]) -> [PASS][136] +7 other tests pass
>    [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2699-3ef8736446933ce5e8ccbec2f85922ca1ed3b706/shard-dg2-433/igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a6.html
>    [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145188v2/shard-dg2-434/igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a6.html
> 
>   * igt@kms_flip@flip-vs-expired-vblank@b-dp4:
>     - shard-dg2-set2:     [FAIL][137] ([Intel XE#301] / [Intel XE#3321]) -> [PASS][138] +1 other test pass
>    [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2699-3ef8736446933ce5e8ccbec2f85922ca1ed3b706/shard-dg2-433/igt@kms_flip@flip-vs-expired-vblank@b-dp4.html
>    [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145188v2/shard-dg2-434/igt@kms_flip@flip-vs-expired-vblank@b-dp4.html
> 
>   * igt@kms_flip@plain-flip-ts-check@a-edp1:
>     - shard-lnl:          [FAIL][139] ([Intel XE#886]) -> [PASS][140] +1 other test pass
>    [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2699-3ef8736446933ce5e8ccbec2f85922ca1ed3b706/shard-lnl-7/igt@kms_flip@plain-flip-ts-check@a-edp1.html
>    [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145188v2/shard-lnl-8/igt@kms_flip@plain-flip-ts-check@a-edp1.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-onoff:
>     - shard-dg2-set2:     [SKIP][141] ([Intel XE#656]) -> [PASS][142] +8 other tests pass
>    [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2699-3ef8736446933ce5e8ccbec2f85922ca1ed3b706/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-onoff.html
>    [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145188v2/shard-dg2-432/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-onoff.html
> 
>   * igt@kms_plane@plane-position-covered@pipe-b-plane-5:
>     - shard-bmg:          [DMESG-WARN][143] ([Intel XE#4330]) -> [PASS][144] +6 other tests pass
>    [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2699-3ef8736446933ce5e8ccbec2f85922ca1ed3b706/shard-bmg-8/igt@kms_plane@plane-position-covered@pipe-b-plane-5.html
>    [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145188v2/shard-bmg-6/igt@kms_plane@plane-position-covered@pipe-b-plane-5.html
> 
>   * igt@kms_pm_rpm@dpms-non-lpsp:
>     - shard-dg2-set2:     [SKIP][145] ([Intel XE#836]) -> [PASS][146] +1 other test pass
>    [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2699-3ef8736446933ce5e8ccbec2f85922ca1ed3b706/shard-dg2-464/igt@kms_pm_rpm@dpms-non-lpsp.html
>    [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145188v2/shard-dg2-432/igt@kms_pm_rpm@dpms-non-lpsp.html
> 
>   * igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1:
>     - shard-lnl:          [FAIL][147] ([Intel XE#899]) -> [PASS][148] +1 other test pass
>    [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2699-3ef8736446933ce5e8ccbec2f85922ca1ed3b706/shard-lnl-4/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html
>    [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145188v2/shard-lnl-7/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html
> 
>   * igt@kms_vrr@negative-basic:
>     - shard-bmg:          [SKIP][149] ([Intel XE#1499]) -> [PASS][150]
>    [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2699-3ef8736446933ce5e8ccbec2f85922ca1ed3b706/shard-bmg-6/igt@kms_vrr@negative-basic.html
>    [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145188v2/shard-bmg-1/igt@kms_vrr@negative-basic.html
> 
>   * igt@xe_ccs@block-copy-compressed-inc-dimension@tile64-compressed-compfmt0-vram01-vram01-511x511:
>     - shard-dg2-set2:     [DMESG-WARN][151] ([Intel XE#4330]) -> [PASS][152] +11 other tests pass
>    [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2699-3ef8736446933ce5e8ccbec2f85922ca1ed3b706/shard-dg2-436/igt@xe_ccs@block-copy-compressed-inc-dimension@tile64-compressed-compfmt0-vram01-vram01-511x511.html
>    [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145188v2/shard-dg2-464/igt@xe_ccs@block-copy-compressed-inc-dimension@tile64-compressed-compfmt0-vram01-vram01-511x511.html
> 
>   * igt@xe_exec_basic@multigpu-no-exec-null-defer-bind:
>     - shard-dg2-set2:     [SKIP][153] ([Intel XE#1392]) -> [PASS][154] +1 other test pass
>    [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2699-3ef8736446933ce5e8ccbec2f85922ca1ed3b706/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-null-defer-bind.html
>    [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145188v2/shard-dg2-436/igt@xe_exec_basic@multigpu-no-exec-null-defer-bind.html
> 
>   * igt@xe_exec_sip@sanity-after-timeout:
>     - shard-dg2-set2:     [INCOMPLETE][155] -> [PASS][156] +1 other test pass
>    [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2699-3ef8736446933ce5e8ccbec2f85922ca1ed3b706/shard-dg2-436/igt@xe_exec_sip@sanity-after-timeout.html
>    [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145188v2/shard-dg2-433/igt@xe_exec_sip@sanity-after-timeout.html
> 
>   * igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init:
>     - shard-adlp:         [DMESG-WARN][157] ([Intel XE#4173]) -> [PASS][158] +1 other test pass
>    [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2699-3ef8736446933ce5e8ccbec2f85922ca1ed3b706/shard-adlp-2/igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init.html
>    [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145188v2/shard-adlp-1/igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init.html
> 
>   * igt@xe_live_ktest@xe_bo:
>     - shard-bmg:          [SKIP][159] ([Intel XE#4322]) -> [PASS][160]
>    [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2699-3ef8736446933ce5e8ccbec2f85922ca1ed3b706/shard-bmg-6/igt@xe_live_ktest@xe_bo.html
>    [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145188v2/shard-bmg-7/igt@xe_live_ktest@xe_bo.html
> 
>   
> #### Warnings ####
> 
>   * igt@kms_async_flips@async-flip-suspend-resume:
>     - shard-bmg:          [INCOMPLETE][161] -> [DMESG-WARN][162] ([Intel XE#4330])
>    [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2699-3ef8736446933ce5e8ccbec2f85922ca1ed3b706/shard-bmg-1/igt@kms_async_flips@async-flip-suspend-resume.html
>    [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145188v2/shard-bmg-3/igt@kms_async_flips@async-flip-suspend-resume.html
> 
>   * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-6:
>     - shard-dg2-set2:     [SKIP][163] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][164] ([Intel XE#787]) +2 other tests skip
>    [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2699-3ef8736446933ce5e8ccbec2f85922ca1ed3b706/shard-dg2-464/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-6.html
>    [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145188v2/shard-dg2-436/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-6.html
> 
>   * igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-mc-ccs@pipe-d-hdmi-a-6:
>     - shard-dg2-set2:     [SKIP][165] ([Intel XE#787]) -> [SKIP][166] ([Intel XE#455] / [Intel XE#787]) +12 other tests skip
>    [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2699-3ef8736446933ce5e8ccbec2f85922ca1ed3b706/shard-dg2-436/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-mc-ccs@pipe-d-hdmi-a-6.html
>    [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145188v2/shard-dg2-464/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-mc-ccs@pipe-d-hdmi-a-6.html
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:
>     - shard-dg2-set2:     [INCOMPLETE][167] ([Intel XE#1727] / [Intel XE#3113]) -> [INCOMPLETE][168] ([Intel XE#2705])
>    [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2699-3ef8736446933ce5e8ccbec2f85922ca1ed3b706/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html
>    [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145188v2/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html
> 
>   * igt@kms_cdclk@mode-transition-all-outputs:
>     - shard-dg2-set2:     [FAIL][169] -> [SKIP][170] ([Intel XE#314])
>    [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2699-3ef8736446933ce5e8ccbec2f85922ca1ed3b706/shard-dg2-464/igt@kms_cdclk@mode-transition-all-outputs.html
>    [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145188v2/shard-dg2-432/igt@kms_cdclk@mode-transition-all-outputs.html
> 
>   * igt@kms_content_protection@atomic-dpms:
>     - shard-dg2-set2:     [SKIP][171] ([Intel XE#455]) -> [FAIL][172] ([Intel XE#1178]) +1 other test fail
>    [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2699-3ef8736446933ce5e8ccbec2f85922ca1ed3b706/shard-dg2-464/igt@kms_content_protection@atomic-dpms.html
>    [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145188v2/shard-dg2-432/igt@kms_content_protection@atomic-dpms.html
> 
>   * igt@kms_content_protection@uevent:
>     - shard-dg2-set2:     [FAIL][173] ([Intel XE#1188]) -> [SKIP][174] ([Intel XE#455])
>    [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2699-3ef8736446933ce5e8ccbec2f85922ca1ed3b706/shard-dg2-436/igt@kms_content_protection@uevent.html
>    [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145188v2/shard-dg2-464/igt@kms_content_protection@uevent.html
>     - shard-bmg:          [SKIP][175] ([Intel XE#2341]) -> [FAIL][176] ([Intel XE#1188])
>    [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2699-3ef8736446933ce5e8ccbec2f85922ca1ed3b706/shard-bmg-6/igt@kms_content_protection@uevent.html
>    [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145188v2/shard-bmg-7/igt@kms_content_protection@uevent.html
> 
>   * igt@kms_flip@2x-flip-vs-dpms:
>     - shard-bmg:          [DMESG-WARN][177] ([Intel XE#2955]) -> [SKIP][178] ([Intel XE#2316])
>    [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2699-3ef8736446933ce5e8ccbec2f85922ca1ed3b706/shard-bmg-8/igt@kms_flip@2x-flip-vs-dpms.html
>    [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145188v2/shard-bmg-6/igt@kms_flip@2x-flip-vs-dpms.html
>     - shard-dg2-set2:     [DMESG-WARN][179] ([Intel XE#2955]) -> [SKIP][180] ([Intel XE#310])
>    [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2699-3ef8736446933ce5e8ccbec2f85922ca1ed3b706/shard-dg2-436/igt@kms_flip@2x-flip-vs-dpms.html
>    [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145188v2/shard-dg2-464/igt@kms_flip@2x-flip-vs-dpms.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff:
>     - shard-dg2-set2:     [SKIP][181] ([Intel XE#651]) -> [SKIP][182] ([Intel XE#656]) +15 other tests skip
>    [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2699-3ef8736446933ce5e8ccbec2f85922ca1ed3b706/shard-dg2-436/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff.html
>    [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145188v2/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc:
>     - shard-bmg:          [SKIP][183] ([Intel XE#2311]) -> [SKIP][184] ([Intel XE#2312]) +10 other tests skip
>    [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2699-3ef8736446933ce5e8ccbec2f85922ca1ed3b706/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc.html
>    [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145188v2/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt:
>     - shard-bmg:          [SKIP][185] ([Intel XE#2312]) -> [SKIP][186] ([Intel XE#4141]) +6 other tests skip
>    [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2699-3ef8736446933ce5e8ccbec2f85922ca1ed3b706/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt.html
>    [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145188v2/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt:
>     - shard-bmg:          [SKIP][187] ([Intel XE#4141]) -> [SKIP][188] ([Intel XE#2312]) +7 other tests skip
>    [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2699-3ef8736446933ce5e8ccbec2f85922ca1ed3b706/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt.html
>    [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145188v2/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:
>     - shard-bmg:          [SKIP][189] ([Intel XE#2312]) -> [SKIP][190] ([Intel XE#2311]) +10 other tests skip
>    [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2699-3ef8736446933ce5e8ccbec2f85922ca1ed3b706/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html
>    [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145188v2/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt:
>     - shard-dg2-set2:     [SKIP][191] ([Intel XE#656]) -> [SKIP][192] ([Intel XE#651]) +9 other tests skip
>    [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2699-3ef8736446933ce5e8ccbec2f85922ca1ed3b706/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt.html
>    [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145188v2/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-wc:
>     - shard-bmg:          [SKIP][193] ([Intel XE#2312]) -> [SKIP][194] ([Intel XE#2313]) +8 other tests skip
>    [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2699-3ef8736446933ce5e8ccbec2f85922ca1ed3b706/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-wc.html
>    [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145188v2/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt:
>     - shard-dg2-set2:     [SKIP][195] ([Intel XE#653]) -> [SKIP][196] ([Intel XE#656]) +14 other tests skip
>    [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2699-3ef8736446933ce5e8ccbec2f85922ca1ed3b706/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt.html
>    [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145188v2/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc:
>     - shard-bmg:          [SKIP][197] ([Intel XE#2313]) -> [SKIP][198] ([Intel XE#2312]) +11 other tests skip
>    [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2699-3ef8736446933ce5e8ccbec2f85922ca1ed3b706/shard-bmg-8/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc.html
>    [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145188v2/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc:
>     - shard-dg2-set2:     [SKIP][199] ([Intel XE#656]) -> [SKIP][200] ([Intel XE#653]) +9 other tests skip
>    [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2699-3ef8736446933ce5e8ccbec2f85922ca1ed3b706/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html
>    [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145188v2/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html
> 
>   * igt@kms_hdr@brightness-with-hdr:
>     - shard-bmg:          [SKIP][201] ([Intel XE#3374] / [Intel XE#3544]) -> [SKIP][202] ([Intel XE#3544])
>    [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2699-3ef8736446933ce5e8ccbec2f85922ca1ed3b706/shard-bmg-8/igt@kms_hdr@brightness-with-hdr.html
>    [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145188v2/shard-bmg-6/igt@kms_hdr@brightness-with-hdr.html
> 
>   * igt@kms_plane_scaling@intel-max-src-size:
>     - shard-dg2-set2:     [DMESG-WARN][203] ([Intel XE#2705] / [Intel XE#4212]) -> [DMESG-WARN][204] ([Intel XE#4212])
>    [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2699-3ef8736446933ce5e8ccbec2f85922ca1ed3b706/shard-dg2-464/igt@kms_plane_scaling@intel-max-src-size.html
>    [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145188v2/shard-dg2-432/igt@kms_plane_scaling@intel-max-src-size.html
> 
>   * igt@kms_tiled_display@basic-test-pattern:
>     - shard-dg2-set2:     [SKIP][205] ([Intel XE#362]) -> [FAIL][206] ([Intel XE#1729])
>    [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2699-3ef8736446933ce5e8ccbec2f85922ca1ed3b706/shard-dg2-464/igt@kms_tiled_display@basic-test-pattern.html
>    [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145188v2/shard-dg2-436/igt@kms_tiled_display@basic-test-pattern.html
> 
>   * igt@xe_module_load@load:
>     - shard-adlp:         ([PASS][207], [PASS][208], [PASS][209], [PASS][210], [PASS][211], [PASS][212], [SKIP][213], [PASS][214], [PASS][215], [PASS][216], [PASS][217], [PASS][218], [PASS][219], [PASS][220], [PASS][221], [PASS][222], [PASS][223], [PASS][224], [PASS][225], [PASS][226], [PASS][227], [PASS][228], [PASS][229], [PASS][230], [PASS][231]) ([Intel XE#378]) -> ([PASS][232], [PASS][233], [PASS][234], [PASS][235], [PASS][236], [PASS][237], [PASS][238], [PASS][239], [PASS][240], [SKIP][241], [PASS][242], [PASS][243], [PASS][244], [PASS][245], [PASS][246], [PASS][247], [PASS][248], [PASS][249], [PASS][250], [PASS][251], [PASS][252], [DMESG-WARN][253], [PASS][254], [PASS][255], [PASS][256], [PASS][257]) ([Intel XE#378] / [Intel XE#4173])
>    [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2699-3ef8736446933ce5e8ccbec2f85922ca1ed3b706/shard-adlp-8/igt@xe_module_load@load.html
>    [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2699-3ef8736446933ce5e8ccbec2f85922ca1ed3b706/shard-adlp-8/igt@xe_module_load@load.html
>    [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2699-3ef8736446933ce5e8ccbec2f85922ca1ed3b706/shard-adlp-8/igt@xe_module_load@load.html
>    [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2699-3ef8736446933ce5e8ccbec2f85922ca1ed3b706/shard-adlp-1/igt@xe_module_load@load.html
>    [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2699-3ef8736446933ce5e8ccbec2f85922ca1ed3b706/shard-adlp-2/igt@xe_module_load@load.html
>    [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2699-3ef8736446933ce5e8ccbec2f85922ca1ed3b706/shard-adlp-2/igt@xe_module_load@load.html
>    [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2699-3ef8736446933ce5e8ccbec2f85922ca1ed3b706/shard-adlp-2/igt@xe_module_load@load.html
>    [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2699-3ef8736446933ce5e8ccbec2f85922ca1ed3b706/shard-adlp-8/igt@xe_module_load@load.html
>    [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2699-3ef8736446933ce5e8ccbec2f85922ca1ed3b706/shard-adlp-6/igt@xe_module_load@load.html
>    [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2699-3ef8736446933ce5e8ccbec2f85922ca1ed3b706/shard-adlp-2/igt@xe_module_load@load.html
>    [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2699-3ef8736446933ce5e8ccbec2f85922ca1ed3b706/shard-adlp-2/igt@xe_module_load@load.html
>    [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2699-3ef8736446933ce5e8ccbec2f85922ca1ed3b706/shard-adlp-2/igt@xe_module_load@load.html
>    [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2699-3ef8736446933ce5e8ccbec2f85922ca1ed3b706/shard-adlp-1/igt@xe_module_load@load.html
>    [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2699-3ef8736446933ce5e8ccbec2f85922ca1ed3b706/shard-adlp-1/igt@xe_module_load@load.html
>    [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2699-3ef8736446933ce5e8ccbec2f85922ca1ed3b706/shard-adlp-6/igt@xe_module_load@load.html
>    [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2699-3ef8736446933ce5e8ccbec2f85922ca1ed3b706/shard-adlp-6/igt@xe_module_load@load.html
>    [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2699-3ef8736446933ce5e8ccbec2f85922ca1ed3b706/shard-adlp-3/igt@xe_module_load@load.html
>    [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2699-3ef8736446933ce5e8ccbec2f85922ca1ed3b706/shard-adlp-4/igt@xe_module_load@load.html
>    [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2699-3ef8736446933ce5e8ccbec2f85922ca1ed3b706/shard-adlp-4/igt@xe_module_load@load.html
>    [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2699-3ef8736446933ce5e8ccbec2f85922ca1ed3b706/shard-adlp-4/igt@xe_module_load@load.html
>    [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2699-3ef8736446933ce5e8ccbec2f85922ca1ed3b706/shard-adlp-3/igt@xe_module_load@load.html
>    [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2699-3ef8736446933ce5e8ccbec2f85922ca1ed3b706/shard-adlp-3/igt@xe_module_load@load.html
>    [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2699-3ef8736446933ce5e8ccbec2f85922ca1ed3b706/shard-adlp-4/igt@xe_module_load@load.html
>    [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2699-3ef8736446933ce5e8ccbec2f85922ca1ed3b706/shard-adlp-6/igt@xe_module_load@load.html
>    [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2699-3ef8736446933ce5e8ccbec2f85922ca1ed3b706/shard-adlp-1/igt@xe_module_load@load.html
>    [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145188v2/shard-adlp-3/igt@xe_module_load@load.html
>    [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145188v2/shard-adlp-8/igt@xe_module_load@load.html
>    [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145188v2/shard-adlp-1/igt@xe_module_load@load.html
>    [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145188v2/shard-adlp-8/igt@xe_module_load@load.html
>    [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145188v2/shard-adlp-8/igt@xe_module_load@load.html
>    [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145188v2/shard-adlp-1/igt@xe_module_load@load.html
>    [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145188v2/shard-adlp-1/igt@xe_module_load@load.html
>    [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145188v2/shard-adlp-3/igt@xe_module_load@load.html
>    [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145188v2/shard-adlp-2/igt@xe_module_load@load.html
>    [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145188v2/shard-adlp-4/igt@xe_module_load@load.html
>    [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145188v2/shard-adlp-2/igt@xe_module_load@load.html
>    [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145188v2/shard-adlp-2/igt@xe_module_load@load.html
>    [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145188v2/shard-adlp-6/igt@xe_module_load@load.html
>    [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145188v2/shard-adlp-4/igt@xe_module_load@load.html
>    [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145188v2/shard-adlp-4/igt@xe_module_load@load.html
>    [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145188v2/shard-adlp-4/igt@xe_module_load@load.html
>    [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145188v2/shard-adlp-6/igt@xe_module_load@load.html
>    [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145188v2/shard-adlp-6/igt@xe_module_load@load.html
>    [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145188v2/shard-adlp-6/igt@xe_module_load@load.html
>    [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145188v2/shard-adlp-6/igt@xe_module_load@load.html
>    [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145188v2/shard-adlp-1/igt@xe_module_load@load.html
>    [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145188v2/shard-adlp-1/igt@xe_module_load@load.html
>    [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145188v2/shard-adlp-1/igt@xe_module_load@load.html
>    [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145188v2/shard-adlp-3/igt@xe_module_load@load.html
>    [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145188v2/shard-adlp-3/igt@xe_module_load@load.html
>    [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145188v2/shard-adlp-2/igt@xe_module_load@load.html
> 
>   * igt@xe_pm@s4-multiple-execs:
>     - shard-dg2-set2:     [ABORT][258] ([Intel XE#4268]) -> [ABORT][259] ([Intel XE#4054])
>    [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2699-3ef8736446933ce5e8ccbec2f85922ca1ed3b706/shard-dg2-434/igt@xe_pm@s4-multiple-execs.html
>    [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145188v2/shard-dg2-434/igt@xe_pm@s4-multiple-execs.html
> 
>   
>   {name}: This element is suppressed. This means it is ignored when computing
>           the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
>   [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
>   [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
>   [Intel XE#1188]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188
>   [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
>   [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
>   [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
>   [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
>   [Intel XE#1522]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1522
>   [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
>   [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
>   [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
>   [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
>   [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
>   [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
>   [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
>   [Intel XE#2291]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291
>   [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
>   [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
>   [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
>   [Intel XE#2314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314
>   [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
>   [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
>   [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
>   [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
>   [Intel XE#2373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2373
>   [Intel XE#2501]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2501
>   [Intel XE#2705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
>   [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
>   [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
>   [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
>   [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
>   [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
>   [Intel XE#2905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905
>   [Intel XE#2934]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2934
>   [Intel XE#2938]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2938
>   [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
>   [Intel XE#2955]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2955
>   [Intel XE#3009]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3009
>   [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
>   [Intel XE#3012]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3012
>   [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
>   [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
>   [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
>   [Intel XE#314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/314
>   [Intel XE#3225]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3225
>   [Intel XE#3226]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3226
>   [Intel XE#3304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304
>   [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
>   [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
>   [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
>   [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
>   [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
>   [Intel XE#3889]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3889
>   [Intel XE#3908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3908
>   [Intel XE#4054]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4054
>   [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
>   [Intel XE#4173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173
>   [Intel XE#4212]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212
>   [Intel XE#4268]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4268
>   [Intel XE#4302]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4302
>   [Intel XE#4322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4322
>   [Intel XE#4330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4330
>   [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
>   [Intel XE#579]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/579
>   [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
>   [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
>   [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
>   [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
>   [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
>   [Intel XE#702]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/702
>   [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
>   [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
>   [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
>   [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
>   [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
>   [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
> 
> 
> Build changes
> -------------
> 
>   * Linux: xe-2699-3ef8736446933ce5e8ccbec2f85922ca1ed3b706 -> xe-pw-145188v2
> 
>   IGT_8245: 822e95b2560133bc21aa3065f70d7148f23f87cf @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   xe-2699-3ef8736446933ce5e8ccbec2f85922ca1ed3b706: 3ef8736446933ce5e8ccbec2f85922ca1ed3b706
>   xe-pw-145188v2: 145188v2
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145188v2/index.html

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
