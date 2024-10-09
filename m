Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20319CEDD98
	for <intel-xe@archiver.kernel.org>; Wed,  9 Oct 2024 13:51:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDDBC10E722;
	Wed,  9 Oct 2024 13:51:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gqYyp8Ze";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F110310E722
 for <intel-xe@lists.freedesktop.org>; Wed,  9 Oct 2024 13:51:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728481906; x=1760017906;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=eF3T1Je0IQX6C5rkmh5ixCAC93mX6lNNEHUBwxakIR4=;
 b=gqYyp8Ze/riOZ3pFs3V99Wo/IEX9BF3QfurbQRE5gW7aFdoZ9ySjkONL
 pBtJAZX1kk0saNseE3drPh3I3nuPXneBiDAIaSFIeJEzM6AbA40KA7LlV
 VZehE2pFJvXEcMP/Tpxu12fw023g62kPfZukxkUpEGgHLBr9rXK5ybChw
 r1LqxkGHg9jME57NGjo/ka5gFavDGiTXsRvSgenVBMDtK2QhxMfAp0pLy
 MGDAxS5jZ6NjKIAMWMQZeAVBKnUpxmb9Sj3LLePnIsAukZRjfVnR8DX5k
 YgTZaPHh3Sc5QIz+j7VUAptxuKDnRjmAygYZCP42WidUB29pzb8QMMCdp A==;
X-CSE-ConnectionGUID: v0zg3BbdR3iAO8pSjZ7odA==
X-CSE-MsgGUID: 1bZP9Y62SyOfolMC7EzqVg==
X-IronPort-AV: E=McAfee;i="6700,10204,11220"; a="31676951"
X-IronPort-AV: E=Sophos;i="6.11,189,1725346800"; d="scan'208";a="31676951"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2024 06:51:45 -0700
X-CSE-ConnectionGUID: luuVmTP7TX+LQafYCoBzkg==
X-CSE-MsgGUID: iqhX8Ff9SCKmK74/9NuMGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,189,1725346800"; d="scan'208";a="81058206"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Oct 2024 06:51:45 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 9 Oct 2024 06:51:44 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 9 Oct 2024 06:51:44 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 9 Oct 2024 06:51:44 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.44) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 9 Oct 2024 06:51:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yaZoED36oPQWw2m50H/AC977UfI6FWwHutIm1OWKGYc2TIqaIEW4wRB0rNtO6cixh8aoAChL8Mcj+RxN2yp5m2OAPFIV9OJ+IdI8LQidrohosNA8dXZ+vEGCmcaRIgUNeJ9bWcL8F3OPLBQksWcBIq32tWJi0hHg5ReFaor4jz/3LfXX452via1Rp6KkuktFnGfDssoVaNkqYs4iFAwEOqANVEQnn8u8hGO7OAsJjPnb8S9kl598/1TrQB0oS23IuReoBWcG2vW6CkdcuHTM1Wo3cANrmHehwoXb/f5HTI7TqXE4f/xn18Zyhu4nZTogSVdk/kJ5Eoqohw8CqWKW7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8V2MUnPEQ2b77+4bsYaXtOsJYq3MYChFlVhRwQGPj1c=;
 b=BCmxz0W+p0WmCqkcVXl+9JzOLwswxTdqF+1fZ+CIZKBuCwgA3q4s+oLMo8XwMmKdrL+jCh1eCgqy7oF5ROc429iZ8QX/7+Yn47Eaa9hPkZwLN2n+uG460p97cCVP5nA0O/7nT5wTUp10NLPBGDDoeTlwcM7TbtZkoKtwfoiUTrTEj01S901cI8voIYFxNk4f35ZiGOJACMtZMiwU97iAONrVZS66uPWX7n4v8BzFTAINSG+j+Jto5e0imi5hVutKvoPvIfVOOyxeXWIwaT4+nCUNn0ie7xW5GYBF0sKk/CwwmAwOyxVkbXkW99k5orsOCe8sMxzcqSozlKs9lwc1Pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by IA0PR11MB7282.namprd11.prod.outlook.com (2603:10b6:208:43a::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.23; Wed, 9 Oct
 2024 13:51:32 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%6]) with mapi id 15.20.8026.020; Wed, 9 Oct 2024
 13:51:32 +0000
Date: Wed, 9 Oct 2024 06:51:29 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Matt Atwood <matthew.s.atwood@intel.com>
Subject: Re: =?utf-8?B?4pyXIENJLkZVTEw=?= =?utf-8?Q?=3A?= failure for Add Xe3
 and Panther Lake support (rev4)
Message-ID: <20241009135129.GU5725@mdroper-desk1.amr.corp.intel.com>
References: <20241008204626.55802-1-matthew.s.atwood@intel.com>
 <172844584598.1206947.13112648533253348992@2413ebb6fbb6>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <172844584598.1206947.13112648533253348992@2413ebb6fbb6>
X-ClientProxiedBy: BY5PR13CA0019.namprd13.prod.outlook.com
 (2603:10b6:a03:180::32) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|IA0PR11MB7282:EE_
X-MS-Office365-Filtering-Correlation-Id: 40149237-914f-40b8-1d40-08dce8697bb8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?2mAevF57hcC6othXChHVeZDtZitfmteHmMy9aykaB7DKppLAdUjrWCojTJMz?=
 =?us-ascii?Q?2E/zzakZvlwA5H6tDnUBdMA7y0HZKnCpgPD71fK9shYXT3411JNt1IzP3LJZ?=
 =?us-ascii?Q?+Bqs+XUFUJmuXGhHU/sHo1zAbxI0gDkr4sttxzAGYYszE0mv/zHeO6xaCebx?=
 =?us-ascii?Q?GHf6F+xP89Y2ef3G8N9KXwZcXhS/Hcy6EqOp9pJPW7Nf1vMbEO/YU1LDtZe+?=
 =?us-ascii?Q?uovPqoBH6CuGRxogZoVjrcepCNRgu0rJdN0Y58um/WRNkbbk/tU1eiOGeFJP?=
 =?us-ascii?Q?XC7ZuIpMn6hWw55mf9h1b2wVz5PLFc/uGhjmDdv9eAolfVPpYe06UbWSRKt9?=
 =?us-ascii?Q?bwglS9iU76QqJ3wlc8IDzGEp93ockvpCWi32NZNS0OB2M5Gk79Kna02U0Ej0?=
 =?us-ascii?Q?6Oy0MAhErHnkv2SLTD4iOpXyZoRk0HWAZanxSwHL93eXTv38t1mnsB6Nmjut?=
 =?us-ascii?Q?mAz6UK5LXR8LijgmJlSvsUNFuDYb1v8Ys/iOYsqg3dD9MOG9QS+WShZP9xvX?=
 =?us-ascii?Q?vAuU3La2ZPYNKNGPbrrh8lp0ZDwubkhMG3KHRM3CX1kxZbVJepn/Vhf36xiR?=
 =?us-ascii?Q?SBTR2Ums21F3UJeI253p7fUxreAkWdrHVFguhY4fB2kUbktvdVwUoss78ONE?=
 =?us-ascii?Q?OHXEfDmFzfuNsNva8DFZ9IV8mK0EsKlO5X7YCU0RVzJbkrf+UNlNs6zWf9xe?=
 =?us-ascii?Q?ynUGeo9+mB+Zy80I7G5ARxeNotrZj+9ZqiKKpfS+cns4LYFilfLMmOt1Uzq9?=
 =?us-ascii?Q?hzzvr+AiL+tO7vBcwkLY3mobl/8TUvTIr+zS8u50KnhK6Zm5biRAUW8xFOao?=
 =?us-ascii?Q?cWw2sTuDXOENf2fCAVgOANs7xfMw7kCkFrCEHpQ7YhRosHI8Gun/9XyC1edY?=
 =?us-ascii?Q?2XKt2X7Qcld+0BsHrQ1+NWlTD3Q3XPp6wN8JfW3zTOpBeLyKLz6MtyhDq3iU?=
 =?us-ascii?Q?ve9oowv0K5SAIxWYkk5z+w8LkwylHeHbGY2IxTM60nnU21ckSOgUI9JOc0Iq?=
 =?us-ascii?Q?5WiUKjv3Nl4DvL0mioi5xqet4h97wR+jBCnQP4j4JLZng72wkO4LeX4EahuN?=
 =?us-ascii?Q?DorwSm/5VRysAavYcln2XEaq3EykmNWI8sJ793hjjBhmO8WEmK8EHENJuH5u?=
 =?us-ascii?Q?PQVVRxsvq+ewhvG58xA/KTDFwFUMptg6zkZtjQmAaz/rPbeZNfIGtwMSZw5V?=
 =?us-ascii?Q?jN8PioMtDXH59PcVVfZZbeGAvxwXQ1cc4TXBHWnQeTOh/h2Ot/NKg4xDSh4?=
 =?us-ascii?Q?=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?fFCDpckwjZpGDzLKus8SSQp+CPHw1vf2hvunnjP88yQWFsiC+x/nqPb8eo0Z?=
 =?us-ascii?Q?liAPciCL0bfu65IMyjbqtvOeUx6xud/WzjSPj3K8i8is34EmtfPblKn8K5c0?=
 =?us-ascii?Q?EyDTzT/fzkHAMiKQZbP+byDcCmWQDmQEPbiHMbUDpJNjeBV4t8LkGl+YmJAs?=
 =?us-ascii?Q?eJu4tnVllQ+nQLWpP8cwns2sPiAz4YtK8+BbqU/4NRwnSYBLeUeAXECuiicD?=
 =?us-ascii?Q?p0ZL/Z2AChLrL7JNvXHbjNRbBznO4ywP+0BgcS01G1J/MAQyezSNscJtUIl+?=
 =?us-ascii?Q?sCnzKsdQo0q3/oOJFd6Eg7OSMfY5kztr2UTyLuwSTroqy5olpCXgNlMNZSeV?=
 =?us-ascii?Q?mDaFmO1DLHUBeCdEew+sEM9KIBFLRs5VgKrXezWI4IbR6mxARHnqXtDv5wXn?=
 =?us-ascii?Q?xSmSwxUHO5xEtfyfDBrIuD0UvuPNVrqVcgPH8+xPg3hJXpgq/HWL3y4i+DBb?=
 =?us-ascii?Q?5kJwjM6OSqxn8yoRq0NISnLeEjh+7/qyAua868JD+nU6iRW3Pa9ANKob/lXE?=
 =?us-ascii?Q?DPksuV0/qIerHm6+9L0LUCLOBI5ex1b4isIzE+Nr5JEEqQCWbIn2BoG1itgW?=
 =?us-ascii?Q?hAZU+heJ6yXiktSJhRUxxxVZDpxWhpAinj7DVSCxrmmlDwKJ/KonaPipdTYx?=
 =?us-ascii?Q?wd7D6SCDUTS49TtuHJ4QKGC8eONC7HNDIzrP7Xfvs4GQYCUCmhwxwoEjKdhv?=
 =?us-ascii?Q?2GyooKbNU1cqB5y1RYmQ6yh7I+WIzY34umeQDFsOPdzguR1oru6xgpxMl7IG?=
 =?us-ascii?Q?UK25svfNrFhaN6JHrmzeiPbUZPB+g7HCb+pelD1NbAc1yi0xB178Xl9dnHbI?=
 =?us-ascii?Q?d27Oz13PusSR85lZ5wUVmA8bm1ypbKYVS2bOkRizCs5AwjOsq/mra63Ig7nA?=
 =?us-ascii?Q?HhIDgqWdNHw3wd8x9QgXbWKIp72S0vBkTGp6FWYu6Q6sSvMvIQ2/y9QSj+0h?=
 =?us-ascii?Q?yQnyIzdsVaq1LtkrSYjwNzuV+I73/vPhYRRjIR/k/3GeWcNnmQQSKPrHUhkN?=
 =?us-ascii?Q?GWOD/PzRP7kGV7vWFEu8oq+oX7ydeKGftX1Y0p0XbFN5FflkKIBJ/lH6OnMD?=
 =?us-ascii?Q?YuYCFmmE9PuSksNF9hsMy/QdSJ25OjQlQkRgLQjFRpGB3wnHeKt27c4kEuNF?=
 =?us-ascii?Q?UjgULAYry1M1NutVL9atRLaUZ+knf9NOspHUFGaDC0xwRJ0LQlxkqvewPqzL?=
 =?us-ascii?Q?vWUkR0VzOXzdTWD5oO6PZElrPj+XPmvg536j7f300Vr8/2PT49bbsC0cX60G?=
 =?us-ascii?Q?8kizYTLhATkRQok7zKElNQSU0yPOrAMcKCSYdZ/3UzZEfCqSRSkWBbM479mr?=
 =?us-ascii?Q?FvEJW/fet1fTM9vqfDNJR0QWmb7PHfZxwo388b+tP5vxmKoyYBwcfvs8vzyD?=
 =?us-ascii?Q?wJ7fwzoNWUOXJeLbyxJBMuggCXiDCxdIW8lwlLbK+iQJ7zusA7ZB7UmIz2jW?=
 =?us-ascii?Q?AM/AY348JFEKVg8tR33vAu/a7xzOCNOEXKJSTJ/RFSXoRrB5KrryhXvPT2Tr?=
 =?us-ascii?Q?jGSPZZD5sdzTIqUuHRFmEswzEFk3Lt7lSD1kmxOLMY80MyTZOYizdKD4Cdfa?=
 =?us-ascii?Q?4MtRgyQB5lIu9UK+T46QcVlyogbimtBVXdgCMh2NrLrlCI11zo7nrO/n0Pyp?=
 =?us-ascii?Q?0w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 40149237-914f-40b8-1d40-08dce8697bb8
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2024 13:51:32.7307 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0DLpWVZiTlLwe4sU08KqPZjoE32MjhOdkgDWxOrzBBNKnp34Vt23VZqy/Q84FSLxaSyx/FnNusxFczbdMP0OeE8d8GK4gfWJxxz0dy5Bt+Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7282
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

On Wed, Oct 09, 2024 at 03:50:45AM -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: Add Xe3 and Panther Lake support (rev4)
> URL   : https://patchwork.freedesktop.org/series/138349/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from xe-2026-8752b50cc6ea4e90f3caa68dd1cc169112ac4b34_full -> xe-pw-138349v4_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with xe-pw-138349v4_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in xe-pw-138349v4_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
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
>   Here are the unknown changes that may have been introduced in xe-pw-138349v4_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_async_flips@async-flip-suspend-resume:
>     - shard-adlp:         NOTRUN -> [ABORT][1] +1 other test abort
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v4/shard-adlp-4/igt@kms_async_flips@async-flip-suspend-resume.html

pmc_core BUG during suspend/resume.  Not coming from or caused by the
graphics driver.

> 
>   * igt@kms_big_fb@linear-16bpp-rotate-180:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][2]
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v4/shard-dg2-464/igt@kms_big_fb@linear-16bpp-rotate-180.html
> 
>   * igt@kms_big_fb@x-tiled-8bpp-rotate-0:
>     - shard-dg2-set2:     [PASS][3] -> [SKIP][4] +5 other tests skip
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2026-8752b50cc6ea4e90f3caa68dd1cc169112ac4b34/shard-dg2-436/igt@kms_big_fb@x-tiled-8bpp-rotate-0.html
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v4/shard-dg2-464/igt@kms_big_fb@x-tiled-8bpp-rotate-0.html

These skips look like IGT isn't properly finding the discrete card on
the system.  Not related to this Xe3 GT workaround patch.

> 
>   * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:
>     - shard-adlp:         NOTRUN -> [FAIL][5]
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v4/shard-adlp-1/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html
> 
>   * igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a6:
>     - shard-dg2-set2:     [PASS][6] -> [FAIL][7] +2 other tests fail
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2026-8752b50cc6ea4e90f3caa68dd1cc169112ac4b34/shard-dg2-435/igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a6.html
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v4/shard-dg2-466/igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a6.html

Display timing failures in these tests aren't related to the Xe3 GT
workarounds.

> 
>   * igt@kms_joiner@invalid-modeset-force-ultra-joiner:
>     - shard-adlp:         NOTRUN -> [SKIP][8] +1 other test skip
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v4/shard-adlp-1/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html

I believe this is an expected skip.  I don't think ADL-P supports the
ultra joiner.

> 
>   * igt@kms_psr@psr-suspend@edp-1:
>     - shard-lnl:          [PASS][9] -> [INCOMPLETE][10] +1 other test incomplete
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2026-8752b50cc6ea4e90f3caa68dd1cc169112ac4b34/shard-lnl-6/igt@kms_psr@psr-suspend@edp-1.html
>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v4/shard-lnl-5/igt@kms_psr@psr-suspend@edp-1.html

System simply never returned from suspend.  LNL shouldn't be impacted by
the Xe3 GT workarounds here.

> 
>   * igt@xe_exec_compute_mode@many-execqueues-bindexecqueue-userptr-invalidate:
>     - shard-lnl:          [PASS][11] -> [FAIL][12]
>    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2026-8752b50cc6ea4e90f3caa68dd1cc169112ac4b34/shard-lnl-7/igt@xe_exec_compute_mode@many-execqueues-bindexecqueue-userptr-invalidate.html
>    [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v4/shard-lnl-5/igt@xe_exec_compute_mode@many-execqueues-bindexecqueue-userptr-invalidate.html

Another case where LNL would not have been impacted by Xe3-specific GT
workarounds.


Applied to drm-xe-next.  Thanks for the patch.


Matt

> 
>   
> #### Warnings ####
> 
>   * igt@kms_big_fb@y-tiled-64bpp-rotate-0:
>     - shard-dg2-set2:     [SKIP][13] ([Intel XE#1124]) -> [SKIP][14]
>    [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2026-8752b50cc6ea4e90f3caa68dd1cc169112ac4b34/shard-dg2-463/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html
>    [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v4/shard-dg2-464/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html
> 
>   * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-ccs:
>     - shard-dg2-set2:     [SKIP][15] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][16] +1 other test skip
>    [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2026-8752b50cc6ea4e90f3caa68dd1cc169112ac4b34/shard-dg2-436/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-ccs.html
>    [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v4/shard-dg2-464/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-ccs.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
>     - shard-dg2-set2:     [SKIP][17] ([Intel XE#455]) -> [SKIP][18] +2 other tests skip
>    [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2026-8752b50cc6ea4e90f3caa68dd1cc169112ac4b34/shard-dg2-436/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html
>    [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v4/shard-dg2-464/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-mmap-wc:
>     - shard-dg2-set2:     [SKIP][19] ([Intel XE#651]) -> [SKIP][20] +4 other tests skip
>    [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2026-8752b50cc6ea4e90f3caa68dd1cc169112ac4b34/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-mmap-wc.html
>    [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v4/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-pgflip-blt:
>     - shard-dg2-set2:     [SKIP][21] ([Intel XE#653]) -> [SKIP][22] +4 other tests skip
>    [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2026-8752b50cc6ea4e90f3caa68dd1cc169112ac4b34/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-pgflip-blt.html
>    [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v4/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-pgflip-blt.html
> 
>   * igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-sf:
>     - shard-dg2-set2:     [SKIP][23] ([Intel XE#1489]) -> [SKIP][24] +1 other test skip
>    [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2026-8752b50cc6ea4e90f3caa68dd1cc169112ac4b34/shard-dg2-466/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-sf.html
>    [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v4/shard-dg2-464/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-sf.html
> 
>   * igt@kms_psr@fbc-psr-cursor-render:
>     - shard-dg2-set2:     [SKIP][25] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][26] +1 other test skip
>    [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2026-8752b50cc6ea4e90f3caa68dd1cc169112ac4b34/shard-dg2-436/igt@kms_psr@fbc-psr-cursor-render.html
>    [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v4/shard-dg2-464/igt@kms_psr@fbc-psr-cursor-render.html
> 
>   * igt@xe_live_ktest@xe_eudebug:
>     - shard-lnl:          [SKIP][27] ([Intel XE#2833]) -> [SKIP][28]
>    [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2026-8752b50cc6ea4e90f3caa68dd1cc169112ac4b34/shard-lnl-6/igt@xe_live_ktest@xe_eudebug.html
>    [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v4/shard-lnl-4/igt@xe_live_ktest@xe_eudebug.html
> 
>   
> #### Suppressed ####
> 
>   The following results come from untrusted machines, tests, or statuses.
>   They do not affect the overall result.
> 
>   * igt@kms_async_flips@alternate-sync-async-flip:
>     - {shard-bmg}:        [DMESG-WARN][29] ([Intel XE#1033]) -> [SKIP][30]
>    [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2026-8752b50cc6ea4e90f3caa68dd1cc169112ac4b34/shard-bmg-4/igt@kms_async_flips@alternate-sync-async-flip.html
>    [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v4/shard-bmg-7/igt@kms_async_flips@alternate-sync-async-flip.html
> 
>   * igt@kms_async_flips@async-flip-suspend-resume:
>     - {shard-bmg}:        NOTRUN -> [DMESG-WARN][31] +4 other tests dmesg-warn
>    [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v4/shard-bmg-8/igt@kms_async_flips@async-flip-suspend-resume.html
> 
>   * igt@kms_bw@linear-tiling-2-displays-2160x1440p:
>     - {shard-bmg}:        [SKIP][32] ([Intel XE#367]) -> [SKIP][33] +1 other test skip
>    [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2026-8752b50cc6ea4e90f3caa68dd1cc169112ac4b34/shard-bmg-3/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html
>    [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v4/shard-bmg-7/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html
> 
>   * igt@kms_chamelium_color@ctm-0-25:
>     - {shard-bmg}:        [SKIP][34] ([Intel XE#2325]) -> [SKIP][35]
>    [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2026-8752b50cc6ea4e90f3caa68dd1cc169112ac4b34/shard-bmg-2/igt@kms_chamelium_color@ctm-0-25.html
>    [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v4/shard-bmg-7/igt@kms_chamelium_color@ctm-0-25.html
> 
>   * igt@kms_chamelium_frames@hdmi-cmp-planar-formats:
>     - {shard-bmg}:        [SKIP][36] ([Intel XE#2252]) -> [SKIP][37] +1 other test skip
>    [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2026-8752b50cc6ea4e90f3caa68dd1cc169112ac4b34/shard-bmg-3/igt@kms_chamelium_frames@hdmi-cmp-planar-formats.html
>    [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v4/shard-bmg-7/igt@kms_chamelium_frames@hdmi-cmp-planar-formats.html
> 
>   * igt@kms_cursor_legacy@torture-bo:
>     - {shard-bmg}:        [PASS][38] -> [SKIP][39] +11 other tests skip
>    [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2026-8752b50cc6ea4e90f3caa68dd1cc169112ac4b34/shard-bmg-6/igt@kms_cursor_legacy@torture-bo.html
>    [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v4/shard-bmg-7/igt@kms_cursor_legacy@torture-bo.html
> 
>   * igt@kms_plane_multiple@tiling-yf:
>     - {shard-bmg}:        NOTRUN -> [SKIP][40] +4 other tests skip
>    [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v4/shard-bmg-7/igt@kms_plane_multiple@tiling-yf.html
> 
>   * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
>     - {shard-bmg}:        [SKIP][41] ([Intel XE#2330]) -> [SKIP][42]
>    [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2026-8752b50cc6ea4e90f3caa68dd1cc169112ac4b34/shard-bmg-7/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html
>    [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v4/shard-bmg-7/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html
> 
>   * igt@kms_setmode@basic-clone-single-crtc:
>     - {shard-bmg}:        [SKIP][43] ([Intel XE#1435]) -> [SKIP][44]
>    [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2026-8752b50cc6ea4e90f3caa68dd1cc169112ac4b34/shard-bmg-7/igt@kms_setmode@basic-clone-single-crtc.html
>    [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v4/shard-bmg-7/igt@kms_setmode@basic-clone-single-crtc.html
> 
>   * igt@kms_vrr@seamless-rr-switch-drrs:
>     - {shard-bmg}:        [SKIP][45] ([Intel XE#1499]) -> [SKIP][46]
>    [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2026-8752b50cc6ea4e90f3caa68dd1cc169112ac4b34/shard-bmg-4/igt@kms_vrr@seamless-rr-switch-drrs.html
>    [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v4/shard-bmg-7/igt@kms_vrr@seamless-rr-switch-drrs.html
> 
>   * igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:
>     - {shard-bmg}:        NOTRUN -> [FAIL][47] +3 other tests fail
>    [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v4/shard-bmg-7/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html
> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in xe-pw-138349v4_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@intel_hwmon@hwmon-read:
>     - shard-adlp:         NOTRUN -> [SKIP][48] ([Intel XE#1125])
>    [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v4/shard-adlp-8/igt@intel_hwmon@hwmon-read.html
> 
>   * igt@kms_async_flips@async-flip-suspend-resume@pipe-b-hdmi-a-1:
>     - shard-adlp:         NOTRUN -> [DMESG-WARN][49] ([Intel XE#1033]) +1 other test dmesg-warn
>    [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v4/shard-adlp-4/igt@kms_async_flips@async-flip-suspend-resume@pipe-b-hdmi-a-1.html
> 
>   * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y:
>     - shard-adlp:         [PASS][50] -> [DMESG-WARN][51] ([Intel XE#324]) +2 other tests dmesg-warn
>    [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2026-8752b50cc6ea4e90f3caa68dd1cc169112ac4b34/shard-adlp-6/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y.html
>    [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v4/shard-adlp-2/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y.html
> 
>   * igt@kms_big_fb@4-tiled-64bpp-rotate-90:
>     - shard-lnl:          NOTRUN -> [SKIP][52] ([Intel XE#1407]) +2 other tests skip
>    [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v4/shard-lnl-2/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html
> 
>   * igt@kms_big_fb@4-tiled-addfb-size-overflow:
>     - shard-adlp:         NOTRUN -> [SKIP][53] ([Intel XE#610])
>    [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v4/shard-adlp-6/igt@kms_big_fb@4-tiled-addfb-size-overflow.html
> 
>   * igt@kms_big_fb@linear-16bpp-rotate-270:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][54] ([Intel XE#316])
>    [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v4/shard-dg2-464/igt@kms_big_fb@linear-16bpp-rotate-270.html
> 
>   * igt@kms_big_fb@linear-64bpp-rotate-180:
>     - shard-dg2-set2:     [PASS][55] -> [DMESG-WARN][56] ([Intel XE#877])
>    [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2026-8752b50cc6ea4e90f3caa68dd1cc169112ac4b34/shard-dg2-436/igt@kms_big_fb@linear-64bpp-rotate-180.html
>    [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v4/shard-dg2-463/igt@kms_big_fb@linear-64bpp-rotate-180.html
> 
>   * igt@kms_big_fb@linear-8bpp-rotate-270:
>     - shard-adlp:         NOTRUN -> [SKIP][57] ([Intel XE#316]) +2 other tests skip
>    [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v4/shard-adlp-9/igt@kms_big_fb@linear-8bpp-rotate-270.html
> 
>   * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
>     - shard-adlp:         NOTRUN -> [FAIL][58] ([Intel XE#1231])
>    [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v4/shard-adlp-9/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
> 
>   * igt@kms_big_fb@yf-tiled-8bpp-rotate-270:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][59] ([Intel XE#1124]) +4 other tests skip
>    [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v4/shard-dg2-435/igt@kms_big_fb@yf-tiled-8bpp-rotate-270.html
>     - shard-lnl:          NOTRUN -> [SKIP][60] ([Intel XE#1124]) +6 other tests skip
>    [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v4/shard-lnl-6/igt@kms_big_fb@yf-tiled-8bpp-rotate-270.html
> 
>   * igt@kms_big_fb@yf-tiled-addfb:
>     - shard-adlp:         NOTRUN -> [SKIP][61] ([Intel XE#619])
>    [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v4/shard-adlp-2/igt@kms_big_fb@yf-tiled-addfb.html
>     - shard-dg2-set2:     NOTRUN -> [SKIP][62] ([Intel XE#619])
>    [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v4/shard-dg2-466/igt@kms_big_fb@yf-tiled-addfb.html
> 
>   * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0:
>     - shard-adlp:         NOTRUN -> [SKIP][63] ([Intel XE#1124]) +6 other tests skip
>    [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v4/shard-adlp-6/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0.html
> 
>   * igt@kms_bw@connected-linear-tiling-1-displays-3840x2160p:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][64] ([Intel XE#367]) +1 other test skip
>    [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v4/shard-dg2-435/igt@kms_bw@connected-linear-tiling-1-displays-3840x2160p.html
> 
>   * igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p:
>     - shard-lnl:          NOTRUN -> [SKIP][65] ([Intel XE#2191])
>    [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v4/shard-lnl-5/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html
> 
>   * igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][66] ([Intel XE#2191]) +1 other test skip
>    [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v4/shard-dg2-435/igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html
> 
>   * igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p:
>     - shard-adlp:         NOTRUN -> [SKIP][67] ([Intel XE#2191]) +3 other tests skip
>    [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v4/shard-adlp-4/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html
> 
>   * igt@kms_bw@linear-tiling-2-displays-2160x1440p:
>     - shard-adlp:         NOTRUN -> [SKIP][68] ([Intel XE#367]) +3 other tests skip
>    [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v4/shard-adlp-8/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html
> 
>   * igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-1:
>     - shard-adlp:         NOTRUN -> [SKIP][69] ([Intel XE#787]) +47 other tests skip
>    [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v4/shard-adlp-3/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-1.html
> 
>   * igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][70] ([Intel XE#2907])
>    [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v4/shard-dg2-463/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html
> 
>   * igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs:
>     - shard-adlp:         NOTRUN -> [SKIP][71] ([Intel XE#2907]) +1 other test skip
>    [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v4/shard-adlp-9/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html
> 
>   * igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc@pipe-d-hdmi-a-1:
>     - shard-adlp:         NOTRUN -> [SKIP][72] ([Intel XE#455] / [Intel XE#787]) +31 other tests skip
>    [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v4/shard-adlp-4/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc@pipe-d-hdmi-a-1.html
> 
>   * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs:
>     - shard-lnl:          NOTRUN -> [SKIP][73] ([Intel XE#2887]) +14 other tests skip
>    [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v4/shard-lnl-7/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs.html
> 
>   * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][74] ([Intel XE#787]) +27 other tests skip
>    [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v4/shard-dg2-466/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6.html
> 
>   * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-4:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][75] ([Intel XE#455] / [Intel XE#787]) +6 other tests skip
>    [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v4/shard-dg2-466/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-4.html
> 
>   * igt@kms_chamelium_color@ctm-red-to-blue:
>     - shard-adlp:         NOTRUN -> [SKIP][76] ([Intel XE#306]) +1 other test skip
>    [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v4/shard-adlp-9/igt@kms_chamelium_color@ctm-red-to-blue.html
> 
>   * igt@kms_chamelium_color@gamma:
>     - shard-lnl:          NOTRUN -> [SKIP][77] ([Intel XE#306]) +1 other test skip
>    [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v4/shard-lnl-4/igt@kms_chamelium_color@gamma.html
> 
>   * igt@kms_chamelium_hpd@hdmi-hpd-storm-disable:
>     - shard-adlp:         NOTRUN -> [SKIP][78] ([Intel XE#373]) +9 other tests skip
>    [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v4/shard-adlp-4/igt@kms_chamelium_hpd@hdmi-hpd-storm-disable.html
> 
>   * igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][79] ([Intel XE#373]) +4 other tests skip
>    [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v4/shard-dg2-466/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html
>     - shard-lnl:          NOTRUN -> [SKIP][80] ([Intel XE#373]) +6 other tests skip
>    [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v4/shard-lnl-8/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html
> 
>   * igt@kms_content_protection@atomic-dpms@pipe-a-dp-4:
>     - shard-dg2-set2:     NOTRUN -> [FAIL][81] ([Intel XE#1178])
>    [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v4/shard-dg2-436/igt@kms_content_protection@atomic-dpms@pipe-a-dp-4.html
> 
>   * igt@kms_content_protection@dp-mst-type-0:
>     - shard-adlp:         NOTRUN -> [SKIP][82] ([Intel XE#307])
>    [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v4/shard-adlp-3/igt@kms_content_protection@dp-mst-type-0.html
> 
>   * igt@kms_content_protection@mei-interface:
>     - shard-lnl:          NOTRUN -> [SKIP][83] ([Intel XE#1468])
>    [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v4/shard-lnl-5/igt@kms_content_protection@mei-interface.html
> 
>   * igt@kms_cursor_crc@cursor-onscreen-512x512:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][84] ([Intel XE#308]) +1 other test skip
>    [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v4/shard-dg2-464/igt@kms_cursor_crc@cursor-onscreen-512x512.html
>     - shard-lnl:          NOTRUN -> [SKIP][85] ([Intel XE#2321])
>    [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v4/shard-lnl-3/igt@kms_cursor_crc@cursor-onscreen-512x512.html
>     - shard-adlp:         NOTRUN -> [SKIP][86] ([Intel XE#308]) +2 other tests skip
>    [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v4/shard-adlp-4/igt@kms_cursor_crc@cursor-onscreen-512x512.html
> 
>   * igt@kms_cursor_crc@cursor-rapid-movement-64x21:
>     - shard-lnl:          NOTRUN -> [SKIP][87] ([Intel XE#1424]) +4 other tests skip
>    [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v4/shard-lnl-1/igt@kms_cursor_crc@cursor-rapid-movement-64x21.html
> 
>   * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:
>     - shard-adlp:         NOTRUN -> [SKIP][88] ([Intel XE#309]) +4 other tests skip
>    [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v4/shard-adlp-4/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html
> 
>   * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
>     - shard-adlp:         NOTRUN -> [SKIP][89] ([Intel XE#323]) +1 other test skip
>    [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v4/shard-adlp-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html
> 
>   * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:
>     - shard-lnl:          NOTRUN -> [SKIP][90] ([Intel XE#309]) +2 other tests skip
>    [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v4/shard-lnl-2/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html
> 
>   * igt@kms_cursor_legacy@flip-vs-cursor-toggle:
>     - shard-lnl:          [PASS][91] -> [FAIL][92] ([Intel XE#1475]) +1 other test fail
>    [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2026-8752b50cc6ea4e90f3caa68dd1cc169112ac4b34/shard-lnl-6/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html
>    [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v4/shard-lnl-1/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html
> 
>   * igt@kms_dsc@dsc-with-formats:
>     - shard-lnl:          NOTRUN -> [SKIP][93] ([Intel XE#599]) +2 other tests skip
>    [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v4/shard-lnl-5/igt@kms_dsc@dsc-with-formats.html
> 
>   * igt@kms_fbcon_fbt@psr-suspend:
>     - shard-adlp:         NOTRUN -> [SKIP][94] ([Intel XE#776])
>    [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v4/shard-adlp-2/igt@kms_fbcon_fbt@psr-suspend.html
> 
>   * igt@kms_feature_discovery@display-2x:
>     - shard-lnl:          NOTRUN -> [SKIP][95] ([Intel XE#702])
>    [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v4/shard-lnl-2/igt@kms_feature_discovery@display-2x.html
>     - shard-adlp:         NOTRUN -> [SKIP][96] ([Intel XE#702])
>    [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v4/shard-adlp-1/igt@kms_feature_discovery@display-2x.html
> 
>   * igt@kms_flip@2x-flip-vs-blocking-wf-vblank:
>     - shard-adlp:         NOTRUN -> [SKIP][97] ([Intel XE#310]) +8 other tests skip
>    [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v4/shard-adlp-9/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html
> 
>   * igt@kms_flip@2x-plain-flip-ts-check:
>     - shard-lnl:          NOTRUN -> [SKIP][98] ([Intel XE#1421]) +6 other tests skip
>    [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v4/shard-lnl-7/igt@kms_flip@2x-plain-flip-ts-check.html
> 
>   * igt@kms_flip@flip-vs-expired-vblank@d-hdmi-a6:
>     - shard-dg2-set2:     [PASS][99] -> [FAIL][100] ([Intel XE#301]) +1 other test fail
>    [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2026-8752b50cc6ea4e90f3caa68dd1cc169112ac4b34/shard-dg2-435/igt@kms_flip@flip-vs-expired-vblank@d-hdmi-a6.html
>    [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v4/shard-dg2-466/igt@kms_flip@flip-vs-expired-vblank@d-hdmi-a6.html
> 
>   * igt@kms_flip@wf_vblank-ts-check@b-edp1:
>     - shard-lnl:          [PASS][101] -> [FAIL][102] ([Intel XE#886]) +2 other tests fail
>    [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2026-8752b50cc6ea4e90f3caa68dd1cc169112ac4b34/shard-lnl-8/igt@kms_flip@wf_vblank-ts-check@b-edp1.html
>    [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v4/shard-lnl-7/igt@kms_flip@wf_vblank-ts-check@b-edp1.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:
>     - shard-lnl:          NOTRUN -> [SKIP][103] ([Intel XE#1401] / [Intel XE#1745]) +2 other tests skip
>    [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v4/shard-lnl-8/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-default-mode:
>     - shard-lnl:          NOTRUN -> [SKIP][104] ([Intel XE#1401]) +2 other tests skip
>    [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v4/shard-lnl-8/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-default-mode.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling:
>     - shard-lnl:          NOTRUN -> [SKIP][105] ([Intel XE#1397] / [Intel XE#1745])
>    [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v4/shard-lnl-3/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling@pipe-a-default-mode:
>     - shard-lnl:          NOTRUN -> [SKIP][106] ([Intel XE#1397])
>    [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v4/shard-lnl-3/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling@pipe-a-default-mode.html
> 
>   * igt@kms_force_connector_basic@prune-stale-modes:
>     - shard-lnl:          NOTRUN -> [SKIP][107] ([Intel XE#352])
>    [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v4/shard-lnl-6/igt@kms_force_connector_basic@prune-stale-modes.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render:
>     - shard-adlp:         NOTRUN -> [SKIP][108] ([Intel XE#656]) +46 other tests skip
>    [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v4/shard-adlp-9/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-slowdraw:
>     - shard-lnl:          NOTRUN -> [SKIP][109] ([Intel XE#651]) +14 other tests skip
>    [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v4/shard-lnl-2/igt@kms_frontbuffer_tracking@drrs-slowdraw.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt:
>     - shard-adlp:         NOTRUN -> [FAIL][110] ([Intel XE#1861]) +1 other test fail
>    [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v4/shard-adlp-1/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-move:
>     - shard-dg2-set2:     [PASS][111] -> [SKIP][112] ([Intel XE#2351]) +1 other test skip
>    [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2026-8752b50cc6ea4e90f3caa68dd1cc169112ac4b34/shard-dg2-436/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-move.html
>    [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v4/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-move.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-blt:
>     - shard-adlp:         NOTRUN -> [SKIP][113] ([Intel XE#651]) +15 other tests skip
>    [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v4/shard-adlp-3/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][114] ([Intel XE#651]) +11 other tests skip
>    [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v4/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-mmap-wc:
>     - shard-adlp:         NOTRUN -> [SKIP][115] ([Intel XE#653]) +15 other tests skip
>    [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v4/shard-adlp-2/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-move:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][116] ([Intel XE#653]) +17 other tests skip
>    [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v4/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-move.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-blt:
>     - shard-lnl:          NOTRUN -> [SKIP][117] ([Intel XE#656]) +31 other tests skip
>    [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v4/shard-lnl-8/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-blt.html
> 
>   * igt@kms_hdr@invalid-hdr:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][118] ([Intel XE#455]) +7 other tests skip
>    [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v4/shard-dg2-466/igt@kms_hdr@invalid-hdr.html
> 
>   * igt@kms_hdr@invalid-metadata-sizes:
>     - shard-lnl:          NOTRUN -> [SKIP][119] ([Intel XE#1503] / [Intel XE#599])
>    [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v4/shard-lnl-1/igt@kms_hdr@invalid-metadata-sizes.html
> 
>   * igt@kms_joiner@invalid-modeset-ultra-joiner:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][120] ([Intel XE#2927])
>    [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v4/shard-dg2-435/igt@kms_joiner@invalid-modeset-ultra-joiner.html
>     - shard-lnl:          NOTRUN -> [SKIP][121] ([Intel XE#2927])
>    [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v4/shard-lnl-2/igt@kms_joiner@invalid-modeset-ultra-joiner.html
> 
>   * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
>     - shard-adlp:         NOTRUN -> [SKIP][122] ([Intel XE#356])
>    [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v4/shard-adlp-3/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
> 
>   * igt@kms_panel_fitting@legacy:
>     - shard-adlp:         NOTRUN -> [SKIP][123] ([Intel XE#455]) +31 other tests skip
>    [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v4/shard-adlp-2/igt@kms_panel_fitting@legacy.html
> 
>   * igt@kms_plane@pixel-format-source-clamping:
>     - shard-adlp:         NOTRUN -> [INCOMPLETE][124] ([Intel XE#1035] / [Intel XE#1195])
>    [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v4/shard-adlp-2/igt@kms_plane@pixel-format-source-clamping.html
> 
>   * igt@kms_plane@pixel-format-source-clamping@pipe-a-plane-0:
>     - shard-adlp:         NOTRUN -> [WARN][125] ([Intel XE#2078]) +1 other test warn
>    [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v4/shard-adlp-2/igt@kms_plane@pixel-format-source-clamping@pipe-a-plane-0.html
> 
>   * igt@kms_plane@plane-position-covered@pipe-b-plane-4:
>     - shard-lnl:          [PASS][126] -> [DMESG-WARN][127] ([Intel XE#324]) +1 other test dmesg-warn
>    [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2026-8752b50cc6ea4e90f3caa68dd1cc169112ac4b34/shard-lnl-8/igt@kms_plane@plane-position-covered@pipe-b-plane-4.html
>    [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v4/shard-lnl-4/igt@kms_plane@plane-position-covered@pipe-b-plane-4.html
> 
>   * igt@kms_plane@plane-position-hole:
>     - shard-lnl:          NOTRUN -> [DMESG-FAIL][128] ([Intel XE#324]) +1 other test dmesg-fail
>    [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v4/shard-lnl-5/igt@kms_plane@plane-position-hole.html
> 
>   * igt@kms_plane@plane-position-hole@pipe-b-plane-1:
>     - shard-lnl:          NOTRUN -> [DMESG-WARN][129] ([Intel XE#324])
>    [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v4/shard-lnl-5/igt@kms_plane@plane-position-hole@pipe-b-plane-1.html
> 
>   * igt@kms_plane_alpha_blend@coverage-vs-premult-vs-constant:
>     - shard-dg2-set2:     [PASS][130] -> [SKIP][131] ([Intel XE#2423] / [i915#2575]) +13 other tests skip
>    [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2026-8752b50cc6ea4e90f3caa68dd1cc169112ac4b34/shard-dg2-463/igt@kms_plane_alpha_blend@coverage-vs-premult-vs-constant.html
>    [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v4/shard-dg2-464/igt@kms_plane_alpha_blend@coverage-vs-premult-vs-constant.html
> 
>   * igt@kms_plane_lowres@tiling-y@pipe-d-hdmi-a-1:
>     - shard-adlp:         [PASS][132] -> [FAIL][133] ([Intel XE#1874]) +3 other tests fail
>    [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2026-8752b50cc6ea4e90f3caa68dd1cc169112ac4b34/shard-adlp-2/igt@kms_plane_lowres@tiling-y@pipe-d-hdmi-a-1.html
>    [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v4/shard-adlp-3/igt@kms_plane_lowres@tiling-y@pipe-d-hdmi-a-1.html
> 
>   * igt@kms_plane_multiple@tiling-yf:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][134] ([Intel XE#2423] / [i915#2575]) +3 other tests skip
>    [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v4/shard-dg2-464/igt@kms_plane_multiple@tiling-yf.html
> 
>   * igt@kms_plane_scaling@intel-max-src-size:
>     - shard-adlp:         NOTRUN -> [FAIL][135] ([Intel XE#361]) +1 other test fail
>    [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v4/shard-adlp-8/igt@kms_plane_scaling@intel-max-src-size.html
> 
>   * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format:
>     - shard-adlp:         NOTRUN -> [SKIP][136] ([Intel XE#2763] / [Intel XE#455]) +5 other tests skip
>    [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v4/shard-adlp-1/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html
>     - shard-dg2-set2:     NOTRUN -> [SKIP][137] ([Intel XE#2763] / [Intel XE#455]) +5 other tests skip
>    [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v4/shard-dg2-464/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html
> 
>   * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-c:
>     - shard-lnl:          NOTRUN -> [SKIP][138] ([Intel XE#2763]) +15 other tests skip
>    [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v4/shard-lnl-3/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-c.html
> 
>   * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-c:
>     - shard-adlp:         NOTRUN -> [SKIP][139] ([Intel XE#2763]) +8 other tests skip
>    [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v4/shard-adlp-1/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-c.html
> 
>   * igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20@pipe-d:
>     - shard-dg2-set2:     [PASS][140] -> [SKIP][141] ([Intel XE#2763])
>    [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2026-8752b50cc6ea4e90f3caa68dd1cc169112ac4b34/shard-dg2-466/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20@pipe-d.html
>    [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v4/shard-dg2-464/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20@pipe-d.html
> 
>   * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][142] ([Intel XE#2763]) +8 other tests skip
>    [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v4/shard-dg2-466/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b.html
> 
>   * igt@kms_pm_backlight@fade-with-suspend:
>     - shard-adlp:         NOTRUN -> [SKIP][143] ([Intel XE#870])
>    [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v4/shard-adlp-1/igt@kms_pm_backlight@fade-with-suspend.html
> 
>   * igt@kms_pm_dc@dc5-psr:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][144] ([Intel XE#1129])
>    [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v4/shard-dg2-435/igt@kms_pm_dc@dc5-psr.html
> 
>   * igt@kms_pm_rpm@legacy-planes:
>     - shard-dg2-set2:     [PASS][145] -> [SKIP][146] ([Intel XE#2446])
>    [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2026-8752b50cc6ea4e90f3caa68dd1cc169112ac4b34/shard-dg2-466/igt@kms_pm_rpm@legacy-planes.html
>    [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v4/shard-dg2-464/igt@kms_pm_rpm@legacy-planes.html
>     - shard-lnl:          [PASS][147] -> [INCOMPLETE][148] ([Intel XE#1620] / [Intel XE#2864])
>    [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2026-8752b50cc6ea4e90f3caa68dd1cc169112ac4b34/shard-lnl-3/igt@kms_pm_rpm@legacy-planes.html
>    [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v4/shard-lnl-7/igt@kms_pm_rpm@legacy-planes.html
> 
>   * igt@kms_pm_rpm@legacy-planes@plane-59:
>     - shard-lnl:          [PASS][149] -> [DMESG-FAIL][150] ([Intel XE#1620])
>    [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2026-8752b50cc6ea4e90f3caa68dd1cc169112ac4b34/shard-lnl-3/igt@kms_pm_rpm@legacy-planes@plane-59.html
>    [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v4/shard-lnl-7/igt@kms_pm_rpm@legacy-planes@plane-59.html
> 
>   * igt@kms_pm_rpm@modeset-non-lpsp-stress:
>     - shard-adlp:         NOTRUN -> [SKIP][151] ([Intel XE#836]) +1 other test skip
>    [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v4/shard-adlp-6/igt@kms_pm_rpm@modeset-non-lpsp-stress.html
> 
>   * igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
>     - shard-lnl:          NOTRUN -> [SKIP][152] ([Intel XE#1439])
>    [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v4/shard-lnl-6/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html
> 
>   * igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf:
>     - shard-lnl:          NOTRUN -> [SKIP][153] ([Intel XE#2893]) +3 other tests skip
>    [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v4/shard-lnl-5/igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf.html
> 
>   * igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area:
>     - shard-adlp:         NOTRUN -> [SKIP][154] ([Intel XE#1489]) +7 other tests skip
>    [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v4/shard-adlp-4/igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area.html
> 
>   * igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-sf:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][155] ([Intel XE#1489]) +4 other tests skip
>    [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v4/shard-dg2-463/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-sf.html
> 
>   * igt@kms_psr2_su@page_flip-xrgb8888:
>     - shard-adlp:         NOTRUN -> [SKIP][156] ([Intel XE#1122])
>    [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v4/shard-adlp-2/igt@kms_psr2_su@page_flip-xrgb8888.html
> 
>   * igt@kms_psr@fbc-psr2-cursor-blt@edp-1:
>     - shard-lnl:          [PASS][157] -> [FAIL][158] ([Intel XE#2948]) +3 other tests fail
>    [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2026-8752b50cc6ea4e90f3caa68dd1cc169112ac4b34/shard-lnl-1/igt@kms_psr@fbc-psr2-cursor-blt@edp-1.html
>    [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v4/shard-lnl-2/igt@kms_psr@fbc-psr2-cursor-blt@edp-1.html
> 
>   * igt@kms_psr@fbc-psr2-dpms:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][159] ([Intel XE#2850] / [Intel XE#929]) +5 other tests skip
>    [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v4/shard-dg2-464/igt@kms_psr@fbc-psr2-dpms.html
> 
>   * igt@kms_psr@pr-sprite-plane-onoff:
>     - shard-adlp:         NOTRUN -> [SKIP][160] ([Intel XE#2850] / [Intel XE#929]) +11 other tests skip
>    [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v4/shard-adlp-3/igt@kms_psr@pr-sprite-plane-onoff.html
> 
>   * igt@kms_psr@pr-suspend:
>     - shard-lnl:          NOTRUN -> [SKIP][161] ([Intel XE#1406]) +4 other tests skip
>    [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v4/shard-lnl-3/igt@kms_psr@pr-suspend.html
> 
>   * igt@kms_rotation_crc@multiplane-rotation-cropping-bottom:
>     - shard-adlp:         NOTRUN -> [FAIL][162] ([Intel XE#1874]) +9 other tests fail
>    [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v4/shard-adlp-9/igt@kms_rotation_crc@multiplane-rotation-cropping-bottom.html
> 
>   * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
>     - shard-adlp:         NOTRUN -> [SKIP][163] ([Intel XE#1127])
>    [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v4/shard-adlp-8/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html
> 
>   * igt@kms_rotation_crc@sprite-rotation-270:
>     - shard-adlp:         NOTRUN -> [SKIP][164] ([Intel XE#327]) +1 other test skip
>    [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v4/shard-adlp-3/igt@kms_rotation_crc@sprite-rotation-270.html
>     - shard-dg2-set2:     NOTRUN -> [SKIP][165] ([Intel XE#327])
>    [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v4/shard-dg2-436/igt@kms_rotation_crc@sprite-rotation-270.html
> 
>   * igt@kms_setmode@basic@pipe-b-edp-1:
>     - shard-lnl:          [PASS][166] -> [FAIL][167] ([Intel XE#2883]) +2 other tests fail
>    [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2026-8752b50cc6ea4e90f3caa68dd1cc169112ac4b34/shard-lnl-7/igt@kms_setmode@basic@pipe-b-edp-1.html
>    [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v4/shard-lnl-3/igt@kms_setmode@basic@pipe-b-edp-1.html
> 
>   * igt@kms_tiled_display@basic-test-pattern:
>     - shard-adlp:         NOTRUN -> [SKIP][168] ([Intel XE#362])
>    [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v4/shard-adlp-1/igt@kms_tiled_display@basic-test-pattern.html
>     - shard-dg2-set2:     NOTRUN -> [FAIL][169] ([Intel XE#1729])
>    [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v4/shard-dg2-464/igt@kms_tiled_display@basic-test-pattern.html
> 
>   * igt@kms_tv_load_detect@load-detect:
>     - shard-lnl:          NOTRUN -> [SKIP][170] ([Intel XE#330])
>    [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v4/shard-lnl-3/igt@kms_tv_load_detect@load-detect.html
> 
>   * igt@kms_vrr@max-min:
>     - shard-lnl:          [PASS][171] -> [FAIL][172] ([Intel XE#2443]) +1 other test fail
>    [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2026-8752b50cc6ea4e90f3caa68dd1cc169112ac4b34/shard-lnl-3/igt@kms_vrr@max-min.html
>    [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v4/shard-lnl-1/igt@kms_vrr@max-min.html
> 
>   * igt@kms_vrr@seamless-rr-switch-vrr:
>     - shard-lnl:          NOTRUN -> [SKIP][173] ([Intel XE#1499] / [Intel XE#599])
>    [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v4/shard-lnl-7/igt@kms_vrr@seamless-rr-switch-vrr.html
> 
>   * igt@xe_ccs@suspend-resume:
>     - shard-adlp:         NOTRUN -> [SKIP][174] ([Intel XE#455] / [Intel XE#488]) +3 other tests skip
>    [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v4/shard-adlp-3/igt@xe_ccs@suspend-resume.html
> 
>   * igt@xe_ccs@suspend-resume@linear-compressed-compfmt0-system-vram01:
>     - shard-dg2-set2:     NOTRUN -> [ABORT][175] ([Intel XE#2915]) +1 other test abort
>    [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v4/shard-dg2-436/igt@xe_ccs@suspend-resume@linear-compressed-compfmt0-system-vram01.html
> 
>   * igt@xe_compute@ccs-mode-basic:
>     - shard-adlp:         NOTRUN -> [SKIP][176] ([Intel XE#1447])
>    [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v4/shard-adlp-1/igt@xe_compute@ccs-mode-basic.html
>     - shard-dg2-set2:     NOTRUN -> [FAIL][177] ([Intel XE#1050])
>    [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v4/shard-dg2-464/igt@xe_compute@ccs-mode-basic.html
> 
>   * igt@xe_copy_basic@mem-copy-linear-0xfd:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][178] ([Intel XE#1123])
>    [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v4/shard-dg2-463/igt@xe_copy_basic@mem-copy-linear-0xfd.html
> 
>   * igt@xe_eudebug@basic-connect:
>     - shard-lnl:          NOTRUN -> [SKIP][179] ([Intel XE#2905]) +5 other tests skip
>    [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v4/shard-lnl-4/igt@xe_eudebug@basic-connect.html
> 
>   * igt@xe_eudebug_online@debugger-reopen:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][180] ([Intel XE#2905]) +3 other tests skip
>    [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v4/shard-dg2-464/igt@xe_eudebug_online@debugger-reopen.html
> 
>   * igt@xe_eudebug_online@interrupt-other:
>     - shard-adlp:         NOTRUN -> [SKIP][181] ([Intel XE#2905]) +8 other tests skip
>    [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v4/shard-adlp-6/igt@xe_eudebug_online@interrupt-other.html
> 
>   * igt@xe_evict@evict-beng-threads-small:
>     - shard-lnl:          NOTRUN -> [SKIP][182] ([Intel XE#688]) +5 other tests skip
>    [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v4/shard-lnl-8/igt@xe_evict@evict-beng-threads-small.html
> 
>   * igt@xe_evict@evict-small-external-cm:
>     - shard-adlp:         NOTRUN -> [SKIP][183] ([Intel XE#261] / [Intel XE#688]) +12 other tests skip
>    [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v4/shard-adlp-6/igt@xe_evict@evict-small-external-cm.html
> 
>   * igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd:
>     - shard-adlp:         NOTRUN -> [SKIP][184] ([Intel XE#688]) +1 other test skip
>    [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v4/shard-adlp-6/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html
> 
>   * igt@xe_exec_basic@multigpu-once-basic-defer-bind:
>     - shard-adlp:         NOTRUN -> [SKIP][185] ([Intel XE#1392]) +9 other tests skip
>    [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v4/shard-adlp-4/igt@xe_exec_basic@multigpu-once-basic-defer-bind.html
> 
>   * igt@xe_exec_basic@multigpu-once-basic-defer-mmap:
>     - shard-lnl:          NOTRUN -> [SKIP][186] ([Intel XE#1392]) +6 other tests skip
>    [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v4/shard-lnl-6/igt@xe_exec_basic@multigpu-once-basic-defer-mmap.html
> 
>   * igt@xe_exec_fault_mode@many-execqueues-rebind:
>     - shard-adlp:         NOTRUN -> [SKIP][187] ([Intel XE#288]) +20 other tests skip
>    [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v4/shard-adlp-3/igt@xe_exec_fault_mode@many-execqueues-rebind.html
> 
>   * igt@xe_exec_fault_mode@once-invalid-userptr-fault:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][188] ([Intel XE#288]) +11 other tests skip
>    [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v4/shard-dg2-435/igt@xe_exec_fault_mode@once-invalid-userptr-fault.html
> 
>   * igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence:
>     - shard-adlp:         NOTRUN -> [SKIP][189] ([Intel XE#2360])
>    [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v4/shard-adlp-9/igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence.html
>     - shard-dg2-set2:     NOTRUN -> [SKIP][190] ([Intel XE#2360])
>    [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v4/shard-dg2-436/igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence.html
> 
>   * igt@xe_exec_threads@threads-bal-mixed-fd-userptr-invalidate:
>     - shard-dg2-set2:     [PASS][191] -> [SKIP][192] ([Intel XE#1130]) +27 other tests skip
>    [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2026-8752b50cc6ea4e90f3caa68dd1cc169112ac4b34/shard-dg2-463/igt@xe_exec_threads@threads-bal-mixed-fd-userptr-invalidate.html
>    [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v4/shard-dg2-464/igt@xe_exec_threads@threads-bal-mixed-fd-userptr-invalidate.html
> 
>   * igt@xe_exec_threads@threads-cm-fd-userptr-invalidate-race:
>     - shard-lnl:          [PASS][193] -> [DMESG-WARN][194] ([Intel XE#2687])
>    [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2026-8752b50cc6ea4e90f3caa68dd1cc169112ac4b34/shard-lnl-4/igt@xe_exec_threads@threads-cm-fd-userptr-invalidate-race.html
>    [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v4/shard-lnl-7/igt@xe_exec_threads@threads-cm-fd-userptr-invalidate-race.html
> 
>   * igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][195] ([Intel XE#2229]) +1 other test skip
>    [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v4/shard-dg2-464/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html
>     - shard-lnl:          NOTRUN -> [SKIP][196] ([Intel XE#2229]) +1 other test skip
>    [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v4/shard-lnl-7/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html
> 
>   * igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:
>     - shard-adlp:         NOTRUN -> [SKIP][197] ([Intel XE#2229]) +2 other tests skip
>    [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v4/shard-adlp-9/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html
> 
>   * igt@xe_oa@mi-rpc:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][198] ([Intel XE#2541]) +5 other tests skip
>    [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v4/shard-dg2-466/igt@xe_oa@mi-rpc.html
> 
>   * igt@xe_oa@oa-regs-whitelisted@rcs-0:
>     - shard-lnl:          [PASS][199] -> [FAIL][200] ([Intel XE#2514]) +1 other test fail
>    [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2026-8752b50cc6ea4e90f3caa68dd1cc169112ac4b34/shard-lnl-2/igt@xe_oa@oa-regs-whitelisted@rcs-0.html
>    [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v4/shard-lnl-3/igt@xe_oa@oa-regs-whitelisted@rcs-0.html
> 
>   * igt@xe_oa@privileged-forked-access-vaddr:
>     - shard-adlp:         NOTRUN -> [SKIP][201] ([Intel XE#2541]) +5 other tests skip
>    [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v4/shard-adlp-9/igt@xe_oa@privileged-forked-access-vaddr.html
> 
>   * igt@xe_pat@pat-index-xehpc:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][202] ([Intel XE#2838] / [Intel XE#979])
>    [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v4/shard-dg2-463/igt@xe_pat@pat-index-xehpc.html
> 
>   * igt@xe_pat@pat-index-xelpg:
>     - shard-adlp:         NOTRUN -> [SKIP][203] ([Intel XE#979])
>    [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v4/shard-adlp-6/igt@xe_pat@pat-index-xelpg.html
>     - shard-dg2-set2:     NOTRUN -> [SKIP][204] ([Intel XE#979])
>    [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v4/shard-dg2-435/igt@xe_pat@pat-index-xelpg.html
> 
>   * igt@xe_pat@prime-self-import-coh:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][205] ([Intel XE#1130]) +7 other tests skip
>    [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v4/shard-dg2-464/igt@xe_pat@prime-self-import-coh.html
> 
>   * igt@xe_pm@s2idle-basic-exec:
>     - shard-adlp:         NOTRUN -> [ABORT][206] ([Intel XE#1358]) +1 other test abort
>    [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v4/shard-adlp-4/igt@xe_pm@s2idle-basic-exec.html
> 
>   * igt@xe_pm@s2idle-d3cold-basic-exec:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][207] ([Intel XE#2284] / [Intel XE#366])
>    [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v4/shard-dg2-435/igt@xe_pm@s2idle-d3cold-basic-exec.html
>     - shard-lnl:          NOTRUN -> [SKIP][208] ([Intel XE#2284] / [Intel XE#366])
>    [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v4/shard-lnl-8/igt@xe_pm@s2idle-d3cold-basic-exec.html
> 
>   * igt@xe_pm@s2idle-exec-after:
>     - shard-adlp:         NOTRUN -> [ABORT][209] ([Intel XE#1358] / [Intel XE#2915]) +1 other test abort
>    [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v4/shard-adlp-1/igt@xe_pm@s2idle-exec-after.html
> 
>   * igt@xe_pm@s2idle-vm-bind-unbind-all:
>     - shard-adlp:         NOTRUN -> [ABORT][210] ([Intel XE#1694])
>    [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v4/shard-adlp-3/igt@xe_pm@s2idle-vm-bind-unbind-all.html
> 
>   * igt@xe_pm@s4-multiple-execs:
>     - shard-adlp:         [PASS][211] -> [ABORT][212] ([Intel XE#1358] / [Intel XE#1607] / [Intel XE#1794])
>    [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2026-8752b50cc6ea4e90f3caa68dd1cc169112ac4b34/shard-adlp-6/igt@xe_pm@s4-multiple-execs.html
>    [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v4/shard-adlp-9/igt@xe_pm@s4-multiple-execs.html
> 
>   * igt@xe_pm_residency@toggle-gt-c6:
>     - shard-adlp:         NOTRUN -> [FAIL][213] ([Intel XE#958])
>    [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v4/shard-adlp-9/igt@xe_pm_residency@toggle-gt-c6.html
> 
>   * igt@xe_query@multigpu-query-hwconfig:
>     - shard-adlp:         NOTRUN -> [SKIP][214] ([Intel XE#944])
>    [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v4/shard-adlp-3/igt@xe_query@multigpu-query-hwconfig.html
> 
>   * igt@xe_query@multigpu-query-invalid-size:
>     - shard-lnl:          NOTRUN -> [SKIP][215] ([Intel XE#944]) +2 other tests skip
>    [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v4/shard-lnl-8/igt@xe_query@multigpu-query-invalid-size.html
> 
>   * igt@xe_query@multigpu-query-topology:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][216] ([Intel XE#944])
>    [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v4/shard-dg2-463/igt@xe_query@multigpu-query-topology.html
> 
>   * igt@xe_spin_batch@spin-fixed-duration:
>     - shard-adlp:         [PASS][217] -> [FAIL][218] ([Intel XE#1081])
>    [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2026-8752b50cc6ea4e90f3caa68dd1cc169112ac4b34/shard-adlp-8/igt@xe_spin_batch@spin-fixed-duration.html
>    [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v4/shard-adlp-1/igt@xe_spin_batch@spin-fixed-duration.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@fbdev@unaligned-write:
>     - {shard-bmg}:        [SKIP][219] ([Intel XE#2134]) -> [PASS][220]
>    [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2026-8752b50cc6ea4e90f3caa68dd1cc169112ac4b34/shard-bmg-6/igt@fbdev@unaligned-write.html
>    [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v4/shard-bmg-6/igt@fbdev@unaligned-write.html
>     - shard-dg2-set2:     [SKIP][221] ([Intel XE#2134]) -> [PASS][222]
>    [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2026-8752b50cc6ea4e90f3caa68dd1cc169112ac4b34/shard-dg2-435/igt@fbdev@unaligned-write.html
>    [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v4/shard-dg2-466/igt@fbdev@unaligned-write.html
> 
>   * igt@kms_addfb_basic@bo-too-small:
>     - shard-adlp:         [TIMEOUT][223] -> [PASS][224]
>    [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2026-8752b50cc6ea4e90f3caa68dd1cc169112ac4b34/shard-adlp-8/igt@kms_addfb_basic@bo-too-small.html
>    [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v4/shard-adlp-2/igt@kms_addfb_basic@bo-too-small.html
> 
>   * igt@kms_atomic_transition@modeset-transition-nonblocking-fencing:
>     - shard-lnl:          [FAIL][225] ([Intel XE#1701]) -> [PASS][226] +1 other test pass
>    [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2026-8752b50cc6ea4e90f3caa68dd1cc169112ac4b34/shard-lnl-4/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html
>    [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v4/shard-lnl-6/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html
> 
>   * igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0:
>     - {shard-bmg}:        [SKIP][227] ([Intel XE#2231]) -> [PASS][228]
>    [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2026-8752b50cc6ea4e90f3caa68dd1cc169112ac4b34/shard-bmg-6/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0.html
>    [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v4/shard-bmg-3/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0.html
>     - shard-dg2-set2:     [SKIP][229] -> [PASS][230]
>    [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2026-8752b50cc6ea4e90f3caa68dd1cc169112ac4b34/shard-dg2-435/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0.html
>    [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v4/shard-dg2-463/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0.html
> 
>   * igt@kms_big_fb@x-tiled-8bpp-rotate-0:
>     - shard-adlp:         [FAIL][231] ([Intel XE#1874]) -> [PASS][232]
>    [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2026-8752b50cc6ea4e90f3caa68dd1cc169112ac4b34/shard-adlp-1/igt@kms_big_fb@x-tiled-8bpp-rotate-0.html
>    [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v4/shard-adlp-8/igt@kms_big_fb@x-tiled-8bpp-rotate-0.html
> 
>   * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
>     - shard-adlp:         [FAIL][233] ([Intel XE#1231]) -> [PASS][234]
>    [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2026-8752b50cc6ea4e90f3caa68dd1cc169112ac4b34/shard-adlp-6/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
>    [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v4/shard-adlp-9/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs:
>     - {shard-bmg}:        [INCOMPLETE][235] -> [PASS][236] +1 other test pass
>    [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2026-8752b50cc6ea4e90f3caa68dd1cc169112ac4b34/shard-bmg-3/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html
>    [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v4/shard-bmg-4/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html
> 
>   * igt@kms_cursor_legacy@basic-flip-before-cursor-atomic:
>     - shard-lnl:          [FAIL][237] -> [PASS][238]
>    [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2026-8752b50cc6ea4e90f3caa68dd1cc169112ac4b34/shard-lnl-6/igt@kms_cursor_legacy@basic-flip-before-cursor-atomic.html
>    [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v4/shard-lnl-1/igt@kms_cursor_legacy@basic-flip-before-cursor-atomic.html
> 
>   * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
>     - {shard-bmg}:        [DMESG-WARN][239] ([Intel XE#2791] / [Intel XE#877]) -> [PASS][240]
>    [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2026-8752b50cc6ea4e90f3caa68dd1cc169112ac4b34/shard-bmg-3/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
>    [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v4/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
> 
>   * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3:
>     - {shard-bmg}:        [FAIL][241] ([Intel XE#301]) -> [PASS][242] +3 other tests pass
>    [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2026-8752b50cc6ea4e90f3caa68dd1cc169112ac4b34/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html
>    [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v4/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html
> 
>   * igt@kms_flip@flip-vs-absolute-wf_vblank:
>     - shard-dg2-set2:     [SKIP][243] ([Intel XE#2423] / [i915#2575]) -> [PASS][244] +9 other tests pass
>    [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2026-8752b50cc6ea4e90f3caa68dd1cc169112ac4b34/shard-dg2-435/igt@kms_flip@flip-vs-absolute-wf_vblank.html
>    [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v4/shard-dg2-435/igt@kms_flip@flip-vs-absolute-wf_vblank.html
> 
>   * igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp4:
>     - shard-dg2-set2:     [FAIL][245] ([Intel XE#301]) -> [PASS][246] +6 other tests pass
>    [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2026-8752b50cc6ea4e90f3caa68dd1cc169112ac4b34/shard-dg2-466/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp4.html
>    [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v4/shard-dg2-435/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp4.html
> 
>   * igt@kms_flip@flip-vs-expired-vblank-interruptible@c-hdmi-a6:
>     - shard-dg2-set2:     [FAIL][247] ([Intel XE#1204]) -> [PASS][248]
>    [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2026-8752b50cc6ea4e90f3caa68dd1cc169112ac4b34/shard-dg2-466/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-hdmi-a6.html
>    [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v4/shard-dg2-435/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-hdmi-a6.html
> 
>   * igt@kms_flip@flip-vs-suspend:
>     - shard-lnl:          [INCOMPLETE][249] ([Intel XE#2049]) -> [PASS][250] +1 other test pass
>    [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2026-8752b50cc6ea4e90f3caa68dd1cc169112ac4b34/shard-lnl-1/igt@kms_flip@flip-vs-suspend.html
>    [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v4/shard-lnl-1/igt@kms_flip@flip-vs-suspend.html
> 
>   * igt@kms_flip@plain-flip-fb-recreate-interruptible@b-edp1:
>     - shard-lnl:          [FAIL][251] ([Intel XE#886]) -> [PASS][252] +6 other tests pass
>    [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2026-8752b50cc6ea4e90f3caa68dd1cc169112ac4b34/shard-lnl-1/igt@kms_flip@plain-flip-fb-recreate-interruptible@b-edp1.html
>    [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v4/shard-lnl-7/igt@kms_flip@plain-flip-fb-recreate-interruptible@b-edp1.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-wc:
>     - shard-adlp:         [FAIL][253] ([Intel XE#1861]) -> [PASS][254]
>    [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2026-8752b50cc6ea4e90f3caa68dd1cc169112ac4b34/shard-adlp-6/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-wc.html
>    [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v4/shard-adlp-8/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-wc.html
> 
>   * igt@kms_lease@setcrtc-implicit-plane:
>     - {shard-bmg}:        [SKIP][255] -> [PASS][256] +9 other tests pass
>    [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2026-8752b50cc6ea4e90f3caa68dd1cc169112ac4b34/shard-bmg-6/igt@kms_lease@setcrtc-implicit-plane.html
>    [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v4/shard-bmg-5/igt@kms_lease@setcrtc-implicit-plane.html
> 
>   * igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-1:
>     - shard-lnl:          [DMESG-WARN][257] ([Intel XE#324]) -> [PASS][258] +2 other tests pass
>    [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2026-8752b50cc6ea4e90f3caa68dd1cc169112ac4b34/shard-lnl-4/igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-1.html
>    [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v4/shard-lnl-5/igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-1.html
> 
>   * igt@kms_plane_scaling@plane-upscale-20x20-with-pixel-format:
>     - shard-adlp:         [DMESG-WARN][259] -> [PASS][260] +1 other test pass
>    [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2026-8752b50cc6ea4e90f3caa68dd1cc169112ac4b34/shard-adlp-9/igt@kms_plane_scaling@plane-upscale-20x20-with-pixel-format.html
>    [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v4/shard-adlp-2/igt@kms_plane_scaling@plane-upscale-20x20-with-pixel-format.html
> 
>   * igt@kms_pm_rpm@cursor:
>     - shard-lnl:          [DMESG-FAIL][261] ([Intel XE#1620]) -> [PASS][262]
>    [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2026-8752b50cc6ea4e90f3caa68dd1cc169112ac4b34/shard-lnl-3/igt@kms_pm_rpm@cursor.html
>    [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v4/shard-lnl-4/igt@kms_pm_rpm@cursor.html
> 
>   * igt@kms_pm_rpm@dpms-mode-unset-lpsp:
>     - shard-dg2-set2:     [SKIP][263] ([Intel XE#2446]) -> [PASS][264]
>    [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2026-8752b50cc6ea4e90f3caa68dd1cc169112ac4b34/shard-dg2-435/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html
>    [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v4/shard-dg2-436/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html
> 
>   * igt@kms_pm_rpm@universal-planes:
>     - shard-lnl:          [TIMEOUT][265] ([Intel XE#1620]) -> [PASS][266] +1 other test pass
>    [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2026-8752b50cc6ea4e90f3caa68dd1cc169112ac4b34/shard-lnl-1/igt@kms_pm_rpm@universal-planes.html
>    [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v4/shard-lnl-2/igt@kms_pm_rpm@universal-planes.html
> 
>   * igt@kms_psr@fbc-psr2-primary-blt@edp-1:
>     - shard-lnl:          [FAIL][267] ([Intel XE#1649]) -> [PASS][268] +1 other test pass
>    [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2026-8752b50cc6ea4e90f3caa68dd1cc169112ac4b34/shard-lnl-3/igt@kms_psr@fbc-psr2-primary-blt@edp-1.html
>    [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v4/shard-lnl-5/igt@kms_psr@fbc-psr2-primary-blt@edp-1.html
> 
>   * igt@kms_psr@psr2-cursor-plane-move@edp-1:
>     - shard-lnl:          [FAIL][269] ([Intel XE#2948]) -> [PASS][270] +1 other test pass
>    [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2026-8752b50cc6ea4e90f3caa68dd1cc169112ac4b34/shard-lnl-8/igt@kms_psr@psr2-cursor-plane-move@edp-1.html
>    [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v4/shard-lnl-2/igt@kms_psr@psr2-cursor-plane-move@edp-1.html
> 
>   * igt@kms_psr@psr2-suspend@edp-1:
>     - shard-lnl:          [INCOMPLETE][271] -> [PASS][272] +4 other tests pass
>    [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2026-8752b50cc6ea4e90f3caa68dd1cc169112ac4b34/shard-lnl-1/igt@kms_psr@psr2-suspend@edp-1.html
>    [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v4/shard-lnl-5/igt@kms_psr@psr2-suspend@edp-1.html
> 
>   * igt@kms_universal_plane@cursor-fb-leak:
>     - shard-lnl:          [FAIL][273] ([Intel XE#899]) -> [PASS][274] +2 other tests pass
>    [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2026-8752b50cc6ea4e90f3caa68dd1cc169112ac4b34/shard-lnl-5/igt@kms_universal_plane@cursor-fb-leak.html
>    [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v4/shard-lnl-1/igt@kms_universal_plane@cursor-fb-leak.html
> 
>   * igt@kms_vrr@flipline:
>     - shard-lnl:          [FAIL][275] ([Intel XE#2443]) -> [PASS][276] +3 other tests pass
>    [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2026-8752b50cc6ea4e90f3caa68dd1cc169112ac4b34/shard-lnl-1/igt@kms_vrr@flipline.html
>    [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v4/shard-lnl-8/igt@kms_vrr@flipline.html
> 
>   * igt@xe_evict@evict-beng-mixed-many-threads-small:
>     - {shard-bmg}:        [TIMEOUT][277] ([Intel XE#1473]) -> [PASS][278]
>    [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2026-8752b50cc6ea4e90f3caa68dd1cc169112ac4b34/shard-bmg-8/igt@xe_evict@evict-beng-mixed-many-threads-small.html
>    [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v4/shard-bmg-8/igt@xe_evict@evict-beng-mixed-many-threads-small.html
> 
>   * igt@xe_evict@evict-threads-small-multi-vm:
>     - shard-dg2-set2:     [SKIP][279] ([Intel XE#1130]) -> [PASS][280] +14 other tests pass
>    [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2026-8752b50cc6ea4e90f3caa68dd1cc169112ac4b34/shard-dg2-435/igt@xe_evict@evict-threads-small-multi-vm.html
>    [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v4/shard-dg2-466/igt@xe_evict@evict-threads-small-multi-vm.html
> 
>   * igt@xe_exec_reset@parallel-gt-reset:
>     - shard-dg2-set2:     [TIMEOUT][281] ([Intel XE#2105]) -> [PASS][282]
>    [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2026-8752b50cc6ea4e90f3caa68dd1cc169112ac4b34/shard-dg2-436/igt@xe_exec_reset@parallel-gt-reset.html
>    [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v4/shard-dg2-436/igt@xe_exec_reset@parallel-gt-reset.html
> 
>   * igt@xe_exec_threads@threads-hang-shared-vm-userptr-invalidate:
>     - shard-lnl:          [DMESG-WARN][283] -> [PASS][284]
>    [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2026-8752b50cc6ea4e90f3caa68dd1cc169112ac4b34/shard-lnl-8/igt@xe_exec_threads@threads-hang-shared-vm-userptr-invalidate.html
>    [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v4/shard-lnl-6/igt@xe_exec_threads@threads-hang-shared-vm-userptr-invalidate.html
> 
>   * igt@xe_pm@s4-vm-bind-unbind-all:
>     - shard-lnl:          [ABORT][285] ([Intel XE#1794]) -> [PASS][286]
>    [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2026-8752b50cc6ea4e90f3caa68dd1cc169112ac4b34/shard-lnl-2/igt@xe_pm@s4-vm-bind-unbind-all.html
>    [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v4/shard-lnl-6/igt@xe_pm@s4-vm-bind-unbind-all.html
> 
>   * igt@xe_pm@s4-vm-bind-userptr:
>     - shard-adlp:         [ABORT][287] ([Intel XE#1794]) -> [PASS][288]
>    [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2026-8752b50cc6ea4e90f3caa68dd1cc169112ac4b34/shard-adlp-9/igt@xe_pm@s4-vm-bind-userptr.html
>    [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v4/shard-adlp-1/igt@xe_pm@s4-vm-bind-userptr.html
> 
>   * igt@xe_pm_residency@toggle-gt-c6:
>     - shard-lnl:          [FAIL][289] ([Intel XE#958]) -> [PASS][290]
>    [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2026-8752b50cc6ea4e90f3caa68dd1cc169112ac4b34/shard-lnl-3/igt@xe_pm_residency@toggle-gt-c6.html
>    [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v4/shard-lnl-5/igt@xe_pm_residency@toggle-gt-c6.html
> 
>   * igt@xe_spin_batch@spin-basic-all:
>     - {shard-bmg}:        [SKIP][291] ([Intel XE#1130]) -> [PASS][292] +14 other tests pass
>    [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2026-8752b50cc6ea4e90f3caa68dd1cc169112ac4b34/shard-bmg-6/igt@xe_spin_batch@spin-basic-all.html
>    [292]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v4/shard-bmg-4/igt@xe_spin_batch@spin-basic-all.html
> 
>   
> #### Warnings ####
> 
>   * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
>     - shard-adlp:         [TIMEOUT][293] ([Intel XE#402]) -> [FAIL][294] ([Intel XE#1231])
>    [293]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2026-8752b50cc6ea4e90f3caa68dd1cc169112ac4b34/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
>    [294]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v4/shard-adlp-9/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
> 
>   * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
>     - shard-adlp:         [DMESG-WARN][295] ([Intel XE#324]) -> [FAIL][296] ([Intel XE#1231])
>    [295]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2026-8752b50cc6ea4e90f3caa68dd1cc169112ac4b34/shard-adlp-3/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
>    [296]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v4/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
> 
>   * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
>     - shard-dg2-set2:     [SKIP][297] -> [SKIP][298] ([Intel XE#1124])
>    [297]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2026-8752b50cc6ea4e90f3caa68dd1cc169112ac4b34/shard-dg2-435/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html
>    [298]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v4/shard-dg2-436/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html
> 
>   * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip:
>     - shard-dg2-set2:     [SKIP][299] ([Intel XE#1124]) -> [SKIP][300] ([Intel XE#2351]) +1 other test skip
>    [299]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2026-8752b50cc6ea4e90f3caa68dd1cc169112ac4b34/shard-dg2-436/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip.html
>    [300]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v4/shard-dg2-464/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip.html
> 
>   * igt@kms_bw@linear-tiling-2-displays-3840x2160p:
>     - shard-dg2-set2:     [SKIP][301] ([Intel XE#367]) -> [SKIP][302] ([Intel XE#2423] / [i915#2575]) +1 other test skip
>    [301]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2026-8752b50cc6ea4e90f3caa68dd1cc169112ac4b34/shard-dg2-466/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html
>    [302]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v4/shard-dg2-464/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html
> 
>   * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs:
>     - shard-dg2-set2:     [SKIP][303] -> [SKIP][304] ([Intel XE#455] / [Intel XE#787])
>    [303]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2026-8752b50cc6ea4e90f3caa68dd1cc169112ac4b34/shard-dg2-435/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs.html
>    [304]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v4/shard-dg2-435/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs.html
> 
>   * igt@kms_chamelium_color@ctm-0-25:
>     - shard-dg2-set2:     [SKIP][305] ([Intel XE#306]) -> [SKIP][306] ([Intel XE#2423] / [i915#2575])
>    [305]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2026-8752b50cc6ea4e90f3caa68dd1cc169112ac4b34/shard-dg2-464/igt@kms_chamelium_color@ctm-0-25.html
>    [306]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v4/shard-dg2-464/igt@kms_chamelium_color@ctm-0-25.html
> 
>   * igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats:
>     - shard-dg2-set2:     [SKIP][307] ([Intel XE#373]) -> [SKIP][308] ([Intel XE#2423] / [i915#2575]) +1 other test skip
>    [307]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2026-8752b50cc6ea4e90f3caa68dd1cc169112ac4b34/shard-dg2-435/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html
>    [308]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v4/shard-dg2-464/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html
> 
>   * igt@kms_content_protection@atomic-dpms:
>     - shard-dg2-set2:     [SKIP][309] ([Intel XE#2423] / [i915#2575]) -> [FAIL][310] ([Intel XE#1178])
>    [309]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2026-8752b50cc6ea4e90f3caa68dd1cc169112ac4b34/shard-dg2-435/igt@kms_content_protection@atomic-dpms.html
>    [310]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v4/shard-dg2-436/igt@kms_content_protection@atomic-dpms.html
> 
>   * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
>     - shard-dg2-set2:     [SKIP][311] ([Intel XE#2423] / [i915#2575]) -> [SKIP][312] ([Intel XE#323])
>    [311]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2026-8752b50cc6ea4e90f3caa68dd1cc169112ac4b34/shard-dg2-435/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
>    [312]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v4/shard-dg2-463/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
> 
>   * igt@kms_flip@2x-plain-flip-ts-check-interruptible:
>     - shard-adlp:         [TIMEOUT][313] -> [SKIP][314] ([Intel XE#310])
>    [313]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2026-8752b50cc6ea4e90f3caa68dd1cc169112ac4b34/shard-adlp-8/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html
>    [314]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v4/shard-adlp-9/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-indfb-draw-mmap-wc:
>     - shard-dg2-set2:     [SKIP][315] ([Intel XE#2351]) -> [SKIP][316] ([Intel XE#651])
>    [315]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2026-8752b50cc6ea4e90f3caa68dd1cc169112ac4b34/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-indfb-draw-mmap-wc.html
>    [316]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v4/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-indfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-fullscreen:
>     - shard-dg2-set2:     [SKIP][317] ([Intel XE#651]) -> [SKIP][318] ([Intel XE#2351])
>    [317]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2026-8752b50cc6ea4e90f3caa68dd1cc169112ac4b34/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-fullscreen.html
>    [318]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v4/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-fullscreen.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-mmap-wc:
>     - shard-dg2-set2:     [SKIP][319] -> [SKIP][320] ([Intel XE#653])
>    [319]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2026-8752b50cc6ea4e90f3caa68dd1cc169112ac4b34/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-mmap-wc.html
>    [320]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v4/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-plflip-blt:
>     - shard-dg2-set2:     [SKIP][321] ([Intel XE#653]) -> [SKIP][322] ([Intel XE#2351])
>    [321]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2026-8752b50cc6ea4e90f3caa68dd1cc169112ac4b34/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-plflip-blt.html
>    [322]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v4/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-plflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt:
>     - shard-dg2-set2:     [SKIP][323] ([Intel XE#2351]) -> [SKIP][324] ([Intel XE#653]) +2 other tests skip
>    [323]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2026-8752b50cc6ea4e90f3caa68dd1cc169112ac4b34/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html
>    [324]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v4/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html
> 
>   * igt@kms_joiner@invalid-modeset-big-joiner:
>     - shard-dg2-set2:     [SKIP][325] -> [SKIP][326] ([Intel XE#346])
>    [325]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2026-8752b50cc6ea4e90f3caa68dd1cc169112ac4b34/shard-dg2-435/igt@kms_joiner@invalid-modeset-big-joiner.html
>    [326]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v4/shard-dg2-463/igt@kms_joiner@invalid-modeset-big-joiner.html
> 
>   * igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-fully-sf:
>     - shard-dg2-set2:     [SKIP][327] -> [SKIP][328] ([Intel XE#1489]) +1 other test skip
>    [327]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2026-8752b50cc6ea4e90f3caa68dd1cc169112ac4b34/shard-dg2-435/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-fully-sf.html
>    [328]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v4/shard-dg2-436/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-fully-sf.html
> 
>   * igt@kms_psr@fbc-pr-cursor-blt:
>     - shard-dg2-set2:     [SKIP][329] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][330] ([Intel XE#2351]) +1 other test skip
>    [329]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2026-8752b50cc6ea4e90f3caa68dd1cc169112ac4b34/shard-dg2-436/igt@kms_psr@fbc-pr-cursor-blt.html
>    [330]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v4/shard-dg2-464/igt@kms_psr@fbc-pr-cursor-blt.html
> 
>   * igt@kms_psr@pr-primary-render:
>     - shard-dg2-set2:     [SKIP][331] -> [SKIP][332] ([Intel XE#2850] / [Intel XE#929])
>    [331]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2026-8752b50cc6ea4e90f3caa68dd1cc169112ac4b34/shard-dg2-435/igt@kms_psr@pr-primary-render.html
>    [332]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v4/shard-dg2-466/igt@kms_psr@pr-primary-render.html
> 
>   * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
>     - shard-dg2-set2:     [SKIP][333] ([Intel XE#1127]) -> [SKIP][334] ([Intel XE#2423] / [i915#2575])
>    [333]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2026-8752b50cc6ea4e90f3caa68dd1cc169112ac4b34/shard-dg2-466/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html
>    [334]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v4/shard-dg2-464/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html
> 
>   * igt@kms_rotation_crc@sprite-rotation-90:
>     - shard-dg2-set2:     [SKIP][335] ([Intel XE#2423] / [i915#2575]) -> [SKIP][336] ([Intel XE#327])
>    [335]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2026-8752b50cc6ea4e90f3caa68dd1cc169112ac4b34/shard-dg2-435/igt@kms_rotation_crc@sprite-rotation-90.html
>    [336]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v4/shard-dg2-436/igt@kms_rotation_crc@sprite-rotation-90.html
> 
>   * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
>     - shard-dg2-set2:     [SKIP][337] ([Intel XE#362]) -> [SKIP][338] ([Intel XE#1500])
>    [337]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2026-8752b50cc6ea4e90f3caa68dd1cc169112ac4b34/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
>    [338]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v4/shard-dg2-464/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
> 
>   * igt@kms_vrr@seamless-rr-switch-drrs:
>     - shard-dg2-set2:     [SKIP][339] ([Intel XE#455]) -> [SKIP][340] ([Intel XE#2423] / [i915#2575]) +1 other test skip
>    [339]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2026-8752b50cc6ea4e90f3caa68dd1cc169112ac4b34/shard-dg2-435/igt@kms_vrr@seamless-rr-switch-drrs.html
>    [340]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v4/shard-dg2-464/igt@kms_vrr@seamless-rr-switch-drrs.html
> 
>   * igt@xe_create@multigpu-create-massive-size:
>     - shard-dg2-set2:     [SKIP][341] ([Intel XE#944]) -> [SKIP][342] ([Intel XE#1130])
>    [341]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2026-8752b50cc6ea4e90f3caa68dd1cc169112ac4b34/shard-dg2-435/igt@xe_create@multigpu-create-massive-size.html
>    [342]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v4/shard-dg2-464/igt@xe_create@multigpu-create-massive-size.html
> 
>   * igt@xe_eudebug@basic-vms:
>     - shard-dg2-set2:     [SKIP][343] ([Intel XE#2905]) -> [SKIP][344] ([Intel XE#1130])
>    [343]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2026-8752b50cc6ea4e90f3caa68dd1cc169112ac4b34/shard-dg2-436/igt@xe_eudebug@basic-vms.html
>    [344]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v4/shard-dg2-464/igt@xe_eudebug@basic-vms.html
> 
>   * igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race-imm:
>     - shard-dg2-set2:     [SKIP][345] ([Intel XE#1130]) -> [SKIP][346] ([Intel XE#288]) +2 other tests skip
>    [345]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2026-8752b50cc6ea4e90f3caa68dd1cc169112ac4b34/shard-dg2-435/igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race-imm.html
>    [346]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v4/shard-dg2-435/igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race-imm.html
> 
>   * igt@xe_exec_fault_mode@once-userptr-invalidate-race:
>     - shard-dg2-set2:     [SKIP][347] ([Intel XE#288]) -> [SKIP][348] ([Intel XE#1130]) +2 other tests skip
>    [347]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2026-8752b50cc6ea4e90f3caa68dd1cc169112ac4b34/shard-dg2-436/igt@xe_exec_fault_mode@once-userptr-invalidate-race.html
>    [348]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v4/shard-dg2-464/igt@xe_exec_fault_mode@once-userptr-invalidate-race.html
> 
>   * igt@xe_oa@invalid-oa-format-id:
>     - shard-dg2-set2:     [SKIP][349] ([Intel XE#1130]) -> [SKIP][350] ([Intel XE#2541])
>    [349]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2026-8752b50cc6ea4e90f3caa68dd1cc169112ac4b34/shard-dg2-435/igt@xe_oa@invalid-oa-format-id.html
>    [350]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v4/shard-dg2-466/igt@xe_oa@invalid-oa-format-id.html
> 
>   * igt@xe_oa@oa-exponents:
>     - shard-dg2-set2:     [SKIP][351] ([Intel XE#2541]) -> [SKIP][352] ([Intel XE#1130])
>    [351]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2026-8752b50cc6ea4e90f3caa68dd1cc169112ac4b34/shard-dg2-463/igt@xe_oa@oa-exponents.html
>    [352]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v4/shard-dg2-464/igt@xe_oa@oa-exponents.html
> 
>   
>   {name}: This element is suppressed. This means it is ignored when computing
>           the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
>   [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
>   [Intel XE#1035]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1035
>   [Intel XE#1050]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1050
>   [Intel XE#1081]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1081
>   [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
>   [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
>   [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
>   [Intel XE#1125]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1125
>   [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
>   [Intel XE#1129]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129
>   [Intel XE#1130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130
>   [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
>   [Intel XE#1195]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
>   [Intel XE#1204]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204
>   [Intel XE#1231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231
>   [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
>   [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
>   [Intel XE#1397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397
>   [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
>   [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
>   [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
>   [Intel XE#1420]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420
>   [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
>   [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
>   [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
>   [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
>   [Intel XE#1447]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1447
>   [Intel XE#1468]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1468
>   [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
>   [Intel XE#1475]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1475
>   [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
>   [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
>   [Intel XE#1500]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500
>   [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
>   [Intel XE#1607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607
>   [Intel XE#1620]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1620
>   [Intel XE#1649]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1649
>   [Intel XE#1694]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1694
>   [Intel XE#1701]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1701
>   [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
>   [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
>   [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
>   [Intel XE#1861]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861
>   [Intel XE#1874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
>   [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
>   [Intel XE#2078]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2078
>   [Intel XE#2105]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2105
>   [Intel XE#2134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134
>   [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
>   [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
>   [Intel XE#2231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231
>   [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
>   [Intel XE#2236]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2236
>   [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
>   [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
>   [Intel XE#2286]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286
>   [Intel XE#2293]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293
>   [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
>   [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
>   [Intel XE#2314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314
>   [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
>   [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
>   [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
>   [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
>   [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
>   [Intel XE#2328]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2328
>   [Intel XE#2329]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2329
>   [Intel XE#2330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330
>   [Intel XE#2333]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333
>   [Intel XE#2351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351
>   [Intel XE#2360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360
>   [Intel XE#2372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2372
>   [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
>   [Intel XE#2390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390
>   [Intel XE#2392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2392
>   [Intel XE#2413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413
>   [Intel XE#2423]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423
>   [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
>   [Intel XE#2427]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2427
>   [Intel XE#2443]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2443
>   [Intel XE#2446]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446
>   [Intel XE#2450]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2450
>   [Intel XE#2472]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2472
>   [Intel XE#2486]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2486
>   [Intel XE#2504]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2504
>   [Intel XE#2514]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2514
>   [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
>   [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
>   [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
>   [Intel XE#2687]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2687
>   [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
>   [Intel XE#2791]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2791
>   [Intel XE#2833]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2833
>   [Intel XE#2838]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2838
>   [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
>   [Intel XE#2864]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2864
>   [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
>   [Intel XE#2883]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2883
>   [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
>   [Intel XE#2890]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890
>   [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
>   [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
>   [Intel XE#2905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905
>   [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
>   [Intel XE#2915]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2915
>   [Intel XE#2927]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927
>   [Intel XE#2948]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2948
>   [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
>   [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
>   [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
>   [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
>   [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
>   [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
>   [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
>   [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
>   [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
>   [Intel XE#327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/327
>   [Intel XE#330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/330
>   [Intel XE#346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/346
>   [Intel XE#352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/352
>   [Intel XE#356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/356
>   [Intel XE#361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/361
>   [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
>   [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
>   [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
>   [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
>   [Intel XE#402]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/402
>   [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
>   [Intel XE#488]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/488
>   [Intel XE#599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/599
>   [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
>   [Intel XE#619]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/619
>   [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
>   [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
>   [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
>   [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
>   [Intel XE#702]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/702
>   [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
>   [Intel XE#776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
>   [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
>   [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
>   [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
>   [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
>   [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
>   [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
>   [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
>   [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
>   [Intel XE#958]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/958
>   [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979
>   [i915#2575]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575
> 
> 
> Build changes
> -------------
> 
>   * IGT: IGT_8060 -> IGT_8061
>   * Linux: xe-2026-8752b50cc6ea4e90f3caa68dd1cc169112ac4b34 -> xe-pw-138349v4
> 
>   IGT_8060: 9c3e2ca96853ab5f77b60c82a9c66e7e2f2b7358 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   IGT_8061: 8061
>   xe-2026-8752b50cc6ea4e90f3caa68dd1cc169112ac4b34: 8752b50cc6ea4e90f3caa68dd1cc169112ac4b34
>   xe-pw-138349v4: 138349v4
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v4/index.html

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
