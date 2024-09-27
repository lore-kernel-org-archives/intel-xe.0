Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E62F2CDD1D3
	for <intel-xe@archiver.kernel.org>; Fri, 27 Sep 2024 18:26:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD18C10E346;
	Fri, 27 Sep 2024 18:26:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YdHlbaFK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 537C010E346
 for <intel-xe@lists.freedesktop.org>; Fri, 27 Sep 2024 18:26:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727461608; x=1758997608;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=k1Ty6n+ZlusmyxUMqD6bKrZHrV6Ba0yRUP0LUNmP0w8=;
 b=YdHlbaFKRmnXah+mD/GMliLjk7qkw59CTraGonEhkoyTm9VDEB6k9hAJ
 /lyrm94sTsDEJAl/3qWYKXZK1h4cfjW3ZPqduhPZqytw0ODJa8o1e+N8l
 RzA7XjmxNGm0nI9wfLgpQuAVJq6tUBCYb3J11jf8Cbo5JC8vL8gEe94fW
 mndpf2ZaEf1fBhUlcls3bTxdSlhIvRcYRD75qbjugSw8bR4V0Rri2+e8Z
 GhAsgizEv/GUlaTWKdUYufk6SIq0ZoAkrFsn2Gry3fqTsiCQLEhvxb88j
 JiL4RundFglmwBlivoM9kPueLtitb8Z86TAuHh22EADJ85sqUsRDQHXbY A==;
X-CSE-ConnectionGUID: a9X7BRs8Qt2MBdLzvYpCrw==
X-CSE-MsgGUID: udp0VOtTSnWWeVov7d3EGQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11208"; a="26714137"
X-IronPort-AV: E=Sophos;i="6.11,159,1725346800"; d="scan'208";a="26714137"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2024 11:26:48 -0700
X-CSE-ConnectionGUID: WHvnHFFQRBGlXrhm4LY25g==
X-CSE-MsgGUID: YpVzvOR6QB+U9kQkF2POCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,159,1725346800"; d="scan'208";a="77554517"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 Sep 2024 11:26:47 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 27 Sep 2024 11:26:47 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 27 Sep 2024 11:26:47 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 27 Sep 2024 11:26:47 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.45) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 27 Sep 2024 11:26:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S9UQ37fKFGZZ7KY/MfwuROMTcMjluYDOm8itsGAk1j2YZvMRv2Zipur4v2YM3hDpQpsjZ3lqA4pOaiVzFP9VDk3H4d0p17A1OSKGEfuCHGKFwSYMVwWyCvcOhKVis+5SJwT+CQYwhC5Aaq5hvyxHu8mmVgscnPy4a7VO0Irc3JTMU3bt3f/5KG383UR0k8EbwkSaCvphRZKjmyqisuvfE8OSW/eZpvAJNtFEHSf7kGbu10gLTWbOdN8D8xoCyEYNrp6WdDFtfGgp9L7C44ZDOG6QM+EfdlwiI67CxAQ4TPzDIZGwMO/9Wl0Fot6Ui8GJ5gsefWJ++6UX4hO9c9bIOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wKYFVCKFp3bIXiyGg2WWDJmrem0NEHhoNlkRGRrM5oM=;
 b=Gu+8RB84Aj3xOnJDWcobPt2tDJ0Z/y8KuYKtWIlWJfo+E7rE+2krXy5A29WZBuUON7X8QVQLYo/MUYnQ75D7LC+CE+RMN4zFr5Qmvq9mMsCFZPrJqwSf39fYQMT6dxeiH6FhOVmhv3ID2dxy45p1gQoWfHaC8z45jqDcieM8ixbWtNkrl9DsLF6ia0OwBauV+/+SRl3upVUvrmdIQg6PNKYUmnG9Xb89hbSP3swB6qt7HRebIsrerKSTp2gy3EKGuozv/rGOlhm9yHVPZvZp+AnVF5IlufPX5SyJHGpVgIDZUpOcHTNnggLUqhL1AUwHX6xwkOB5OHN8bLZ/y2mZ/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN6PR11MB2864.namprd11.prod.outlook.com (2603:10b6:805:63::26)
 by SN7PR11MB6875.namprd11.prod.outlook.com (2603:10b6:806:2a6::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.22; Fri, 27 Sep
 2024 18:26:43 +0000
Received: from SN6PR11MB2864.namprd11.prod.outlook.com
 ([fe80::c58f:66d9:46c0:d83d]) by SN6PR11MB2864.namprd11.prod.outlook.com
 ([fe80::c58f:66d9:46c0:d83d%6]) with mapi id 15.20.7982.016; Fri, 27 Sep 2024
 18:26:43 +0000
Date: Fri, 27 Sep 2024 14:26:38 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Aravind Iddamsetty
 <aravind.iddamsetty@linux.intel.com>, Bommu Krishnaiah
 <krishnaiah.bommu@intel.com>, Riana Tauro <riana.tauro@intel.com>
Subject: Re: [PATCH 1/3] drm/xe/pmu: Enable PMU interface
Message-ID: <Zvb43kW5pt4628HK@intel.com>
References: <20240927002344.2565250-1-vinay.belgaumkar@intel.com>
 <20240927002344.2565250-2-vinay.belgaumkar@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240927002344.2565250-2-vinay.belgaumkar@intel.com>
X-ClientProxiedBy: MW4PR04CA0384.namprd04.prod.outlook.com
 (2603:10b6:303:81::29) To SN6PR11MB2864.namprd11.prod.outlook.com
 (2603:10b6:805:63::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR11MB2864:EE_|SN7PR11MB6875:EE_
X-MS-Office365-Filtering-Correlation-Id: d34b868d-9dd9-4016-2ea7-08dcdf21ef2e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?0EMeYPrKnNYn5YaYv9nHsfFpYv3oaOY4Ymlu/sal4klmu7B05Rq6Kdab4E?=
 =?iso-8859-1?Q?qXEnPUKGuKhyo2N4lBWnArO9e/xfJo9rfPfxGoAByPK58UyYS2JGASAO/L?=
 =?iso-8859-1?Q?FxbU422Wced8iWAnHG8w9S6bHVyQAWInNHYdWBQljKpe6gtqS2Eeme+YJS?=
 =?iso-8859-1?Q?rFh/1qDd6WbZv+RPj/UMSONdw1LzKW+N1F61WnKfxRFiX+dqb2BmM2C3V3?=
 =?iso-8859-1?Q?mkrqXUfcnZO5h28ecZYTXOp/tkIpGHqP43Eu8CbYbspqOd9jR2neJzY5G/?=
 =?iso-8859-1?Q?n0s9l2rzIW1kBTwYW9qb3ZFKlqR5BQlpfR7gzQri2B8Ssxw9ic5FPSz0R9?=
 =?iso-8859-1?Q?pycInHpvAY0tsHLfcbauZP5PKPDwbthSfsTuuE3B0yEmUKX4E7pBbRx3rB?=
 =?iso-8859-1?Q?fa2FYlgMoYXWnmfz4se9ON2ZhbYJa5heBgX0xEN8wHSEwi2Z0DupqFLBsf?=
 =?iso-8859-1?Q?dr7mn3gqRZNu1siZs6oCYDyIvTdI9ZPqB64L+AMQynTaHHnPYIFcqs1FEV?=
 =?iso-8859-1?Q?2GbzoOHE9L0OjaHKbazvLTKmlQF+8PCU5ZNFU/Qfy0GuuuHZdTMT0iIT6k?=
 =?iso-8859-1?Q?Q9E6AbmgVjzMxqzhtYzxqNP06f/27XXbRHbPrMhEFomPO/0qs3dHWU3j40?=
 =?iso-8859-1?Q?BD3GgEFbWP+xWxK80AzI6NNGjceYOulLpoUiMla4EuEZqxMGjlJdN488P6?=
 =?iso-8859-1?Q?7H5Cyw9ISjfZkfXqrd8vVpd7odbK6Y7JKnMXBFPFgqZxSW3lPaRsHLLJKP?=
 =?iso-8859-1?Q?AmOaMmJA1XkcF6Mfj8a52kR8/1kFsIBl5X6RCfFSRILIjWisRd2J7QwRtP?=
 =?iso-8859-1?Q?qp/1sryP7vO6RT/CB+SWVjuTftOUgIXDUvhgtA8msUDqc12HmLgok3tWR/?=
 =?iso-8859-1?Q?3YOjB7EwiDrFGxsIjfPRRP62nvYD/dbaUsPCsJvBZ1Id1G37oIaDviQ0wI?=
 =?iso-8859-1?Q?yOhnG/rp5/MmJFYR66Qi+adjZ/Q5686JRL50KNFX1cqhkzlLcKdooyRVkD?=
 =?iso-8859-1?Q?5GPCeVBp2ws7gQ4TGvGrwu0EznmbT0wS6U8ml4GMGl6V9MxBxP5Zv76O7A?=
 =?iso-8859-1?Q?uCJveVuU2CnAPV+kgGZlsfB7HtHeOq19Jvi1eZfsWfOzsdPFQxYcjuqGAg?=
 =?iso-8859-1?Q?AAI89WJY+5Rcj5QZYl3/m5Orjt1Jj10I4/8E/FORRuygZnjI6816IG9ocU?=
 =?iso-8859-1?Q?cKPQLL07joJyjQDVFVi1on1MIrIIfRe6W/aJQ/dViEb42o9T3nGdc5bOkQ?=
 =?iso-8859-1?Q?IqlxKQWR6tAzXHMrIniQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR11MB2864.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?Ft+pRdgOO/HFDqFbfUnnw3ZfxqdKV0rzpFmdrksSx0TCvdGxftskdLO4Gt?=
 =?iso-8859-1?Q?KUzpPpxzkvE/aClEWCqPhWkGoM0UrZYdo0LnvJjOmTdfnDNFnR/9mPPUmZ?=
 =?iso-8859-1?Q?VJo4Wde/5LDMc3XGJGngEwzRBOsdqSYMgi3iduiWmvbJKQldvQjZ01c0F0?=
 =?iso-8859-1?Q?rIelqYX7dtRpYI/io4sdFV8Ywulqzm4F2uzT/XIU0/KlaCPAcD7bcNzH2J?=
 =?iso-8859-1?Q?M17mO00YKIIy4SVzgHEhduhbEZ0LIAUKTh5NZnuYNH0duvqMtWARUWvZLw?=
 =?iso-8859-1?Q?1vd3tOSznbmW+287c7ciWrCzq0cfVNRBTL7aviR5a856lZ5AvI3dTItf4S?=
 =?iso-8859-1?Q?iW2J7/GXMNy7fFufqPAIQT4i3Fho42h0Xv1Uzu5a8DdcazRFwv+xz6kVrM?=
 =?iso-8859-1?Q?AqEyDYjw0lwnWvrGDUsWmkiXJZRd7bSjZ+Jrb1rMW2XjU483IesPVN+LqB?=
 =?iso-8859-1?Q?YgJtl+1yL37AQc0sw5xhh9eo/ss+NRvVzKVRD+qF1H4qsDTBPPaKNqDgGM?=
 =?iso-8859-1?Q?C6C91izE7Wv3IHSCQBfi5a1On53sgoMVCXEi4G7lmWgqjstscMYKHTDdRD?=
 =?iso-8859-1?Q?egvKYwrhgJZQYfpN3df/2oHCc76HGjjK2fn8uceRWmD39YIMzSiFu/Tfcy?=
 =?iso-8859-1?Q?BiEW3OKDIgEG5KQB6lcFIlOfgZU1G9DBV/SO5+2P5ahkgXVhs7vo76ws4l?=
 =?iso-8859-1?Q?89RtwYIRHr9PGyn5U+zHcLWzpJyNsZARiVb2lqo0aDemnZIdS0yrgazFec?=
 =?iso-8859-1?Q?Pc8zZ6aHsOvMPy6vzej2WrZ4NNxxiyZd731aETvBY0rGRSI6hiABy82MFT?=
 =?iso-8859-1?Q?IvMUT0dK+pbUcuCWD/KdpULePGYYBxbx+rXn7AGePlpckkCaQp/ixEtlml?=
 =?iso-8859-1?Q?Lg12yLUxdsgJENemATk5HNeBAPjD//wVi9lOIto/Z+7OO2jWQ5PxiICttE?=
 =?iso-8859-1?Q?2G3ne3TzcX219RxjgonQYGc8kmfqFQ2XGw0EXXuzKIuzUwoVX11oY5P1Gg?=
 =?iso-8859-1?Q?bit7om2Q+B1aR6e4aApEIqbru4LsQ7+dGa/ScsIzSwFzCHLvMpm3jsj2BC?=
 =?iso-8859-1?Q?icBHXHZhIo7/T1HBYjKkSH9G4kVBjUO7/LeIPkVogXMm3Jbg55w7Szqi9j?=
 =?iso-8859-1?Q?vxV+kul42fqhb/LXUz0tjvirzjdA6AM+wSHHNuQ/oWEb1oQND8LTwXh6zG?=
 =?iso-8859-1?Q?C/xAs6Yt+D3VAcPhJRqeaTPM2WV0KYfB6uJbhEf3AUpv6iE7gyf5VSs4n4?=
 =?iso-8859-1?Q?78060uvlFUDnBmrTHKKDrzfb4Tln1C81kjev4hFB0L4dFghX2g7oUR3Fr6?=
 =?iso-8859-1?Q?zgZt1jm+n+6im3Cak6gkNai//bpcBMxcbbfk3qWbqlYCksG9yhl0+/6M75?=
 =?iso-8859-1?Q?kOOPOamJ9/mSsVjIjloovovjDqs/9nsS8acO9sTxwfMG/U+NC1DqdDujSQ?=
 =?iso-8859-1?Q?fOw2VswIRicxzCvodPVSGTndMIrAw4rh4rwCzFfKfpm4wj2yz/cVyMaBwL?=
 =?iso-8859-1?Q?iVGxuIZJ1P5sjfCeizBLEYXPcNJvcK7FKEpkRsEMoTg3i9X1xjkW1wm/Wq?=
 =?iso-8859-1?Q?3LRCuga5usMnFCYzGGmaATsyp2CDO1xqzPVJIGCGUbTnAthLHqjHREp96Q?=
 =?iso-8859-1?Q?4fzSckckAc/KNVUUNoRb/wF+gYOGAQa7gNmtAKhdAJL/1d+DpWlYoQGA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d34b868d-9dd9-4016-2ea7-08dcdf21ef2e
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB2864.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2024 18:26:43.4754 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F3buQL336Y9Vm+RQojpEqYivlB6zequiTT37sf5Yq0AGMPf5n30j781re4CtabvlanGFZTm03hTnNMj4NN63uw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6875
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

On Thu, Sep 26, 2024 at 05:23:42PM -0700, Vinay Belgaumkar wrote:
> From: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
> 
> Basic PMU enabling patch. Setup the basic framework
> for adding events/timers. This patch was previously
> reviewed here -
> https://patchwork.freedesktop.org/series/119504/
> 
> The pmu base implementation is still from the
> i915 driver.
> 
> v2: Review comments(Rodrigo) and do not init pmu for VFs
> as they don't have access to freq and c6 residency anyways.

sorry for the slow review and for not going through it all
in a single pass.

> 
> v3: Fix kunit issue, move xe_pmu entry in Makefile (Jani)
> 
> Co-developed-by: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
> Signed-off-by: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
> Signed-off-by: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> ---
>  drivers/gpu/drm/xe/Makefile          |   2 +
>  drivers/gpu/drm/xe/xe_device.c       |   6 +
>  drivers/gpu/drm/xe/xe_device_types.h |   4 +
>  drivers/gpu/drm/xe/xe_module.c       |   5 +
>  drivers/gpu/drm/xe/xe_pmu.c          | 570 +++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_pmu.h          |  26 ++
>  drivers/gpu/drm/xe/xe_pmu_types.h    |  63 +++
>  include/uapi/drm/xe_drm.h            |   8 +
>  8 files changed, 684 insertions(+)
>  create mode 100644 drivers/gpu/drm/xe/xe_pmu.c
>  create mode 100644 drivers/gpu/drm/xe/xe_pmu.h
>  create mode 100644 drivers/gpu/drm/xe/xe_pmu_types.h
> 
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index ae245fbd91ee..3a3eabc0e0a3 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -293,6 +293,8 @@ ifeq ($(CONFIG_DEBUG_FS),y)
>  		i915-display/intel_pipe_crc.o
>  endif
>  
> +xe-$(CONFIG_PERF_EVENTS) += xe_pmu.o
> +
>  obj-$(CONFIG_DRM_XE) += xe.o
>  obj-$(CONFIG_DRM_XE_KUNIT_TEST) += tests/
>  
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index cb5a9fd820cf..027a796d7431 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -762,6 +762,9 @@ int xe_device_probe(struct xe_device *xe)
>  	for_each_gt(gt, xe, id)
>  		xe_gt_sanitize_freq(gt);
>  
> +	if (!IS_SRIOV_VF(xe))
> +		xe_pmu_register(&xe->pmu);
> +
>  	return devm_add_action_or_reset(xe->drm.dev, xe_device_sanitize, xe);
>  
>  err_fini_display:
> @@ -806,6 +809,9 @@ void xe_device_remove(struct xe_device *xe)
>  
>  	xe_heci_gsc_fini(xe);
>  
> +	if (!IS_SRIOV_VF(xe))
> +		xe_pmu_unregister(&xe->pmu);
> +
>  	for_each_gt(gt, xe, id)
>  		xe_gt_remove(gt);
>  }
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 5ad96d283a71..51485d2eadcf 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -18,6 +18,7 @@
>  #include "xe_memirq_types.h"
>  #include "xe_oa.h"
>  #include "xe_platform_types.h"
> +#include "xe_pmu.h"
>  #include "xe_pt_types.h"
>  #include "xe_sriov_types.h"
>  #include "xe_step_types.h"
> @@ -513,6 +514,9 @@ struct xe_device {
>  		int mode;
>  	} wedged;
>  
> +	/** @pmu: performance monitoring unit */
> +	struct xe_pmu pmu;
> +
>  #ifdef TEST_VM_OPS_ERROR
>  	/**
>  	 * @vm_inject_error_position: inject errors at different places in VM
> diff --git a/drivers/gpu/drm/xe/xe_module.c b/drivers/gpu/drm/xe/xe_module.c
> index 77ce9f9ca7a5..1bf2bf8447c0 100644
> --- a/drivers/gpu/drm/xe/xe_module.c
> +++ b/drivers/gpu/drm/xe/xe_module.c
> @@ -14,6 +14,7 @@
>  #include "xe_hw_fence.h"
>  #include "xe_pci.h"
>  #include "xe_pm.h"
> +#include "xe_pmu.h"
>  #include "xe_observation.h"
>  #include "xe_sched_job.h"
>  
> @@ -96,6 +97,10 @@ static const struct init_funcs init_funcs[] = {
>  		.init = xe_sched_job_module_init,
>  		.exit = xe_sched_job_module_exit,
>  	},
> +	{
> +		.init = xe_pmu_init,
> +		.exit = xe_pmu_exit,
> +	},
>  	{
>  		.init = xe_register_pci_driver,
>  		.exit = xe_unregister_pci_driver,
> diff --git a/drivers/gpu/drm/xe/xe_pmu.c b/drivers/gpu/drm/xe/xe_pmu.c
> new file mode 100644
> index 000000000000..bdaea9ca1065
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_pmu.c
> @@ -0,0 +1,570 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2024 Intel Corporation
> + */
> +
> +#include <drm/drm_drv.h>
> +#include <drm/drm_managed.h>
> +#include <drm/xe_drm.h>
> +
> +#include "regs/xe_gt_regs.h"
> +#include "xe_device.h"
> +#include "xe_force_wake.h"
> +#include "xe_gt_clock.h"
> +#include "xe_mmio.h"
> +#include "xe_macros.h"
> +#include "xe_pm.h"
> +
> +static cpumask_t xe_pmu_cpumask;
> +static unsigned int xe_pmu_target_cpu = -1;

Please no global variables. Think the case where we have
more then 1 device in the same cpu.

> +
> +/**
> + * DOC: Xe PMU (Performance Monitoring Unit)
> + *
> + * Expose events/counters like C6 residency and GT frequency to user land.
> + * Perf tool can be used to list and record these counters from the command
> + * line.
> + *
> + * Example commands to list/record supported perf events-
> + *
> + * >> perf list

perhas '$' instead of '>>' ?

> + * >> ls /sys/bus/event_source/devices/xe_0000_00_02.0/events/

perhaps ls -ld /sys/bus/event_source/devices/xe_*

to first know which devices are available?

> + *
> + * To record events-
> + * >> perf stat -e <event_name> -I <interval>

Could you please document here on how to ensure that those small incremental
values should be read?
How can I use this perf command and ensure that we get exactly the
same value as our other sysfs entries?
I'd like to do the math back to cross-check at least, but also
this information should be useful to ensure that users of this
are really well informed on the flow.

> + *
> + */
> +
> +static unsigned int config_gt_id(const u64 config)
> +{
> +	return config >> __XE_PMU_GT_SHIFT;
> +}
> +
> +static u64 config_counter(const u64 config)
> +{
> +	return config & ~(~0ULL << __XE_PMU_GT_SHIFT);
> +}
> +
> +static void xe_pmu_event_destroy(struct perf_event *event)
> +{
> +	struct xe_device *xe =
> +		container_of(event->pmu, typeof(*xe), pmu.base);
> +
> +	drm_WARN_ON(&xe->drm, event->parent);
> +
> +	drm_dev_put(&xe->drm);
> +}
> +
> +static int
> +config_status(struct xe_device *xe, u64 config)
> +{
> +	unsigned int gt_id = config_gt_id(config);
> +
> +	if (gt_id >= XE_PMU_MAX_GT)

why do we have new GT defines instead of using the regular GT
numbering and entries?

> +		return -ENOENT;
> +
> +	switch (config_counter(config)) {
> +	default:
> +		return -ENOENT;
> +	}
> +
> +	return 0;
> +}
> +
> +static int xe_pmu_event_init(struct perf_event *event)
> +{
> +	struct xe_device *xe =
> +		container_of(event->pmu, typeof(*xe), pmu.base);
> +	struct xe_pmu *pmu = &xe->pmu;
> +	int ret;
> +
> +	if (pmu->closed)
> +		return -ENODEV;
> +
> +	if (event->attr.type != event->pmu->type)
> +		return -ENOENT;
> +
> +	/* unsupported modes and filters */
> +	if (event->attr.sample_period) /* no sampling */
> +		return -EINVAL;
> +
> +	if (has_branch_stack(event))
> +		return -EOPNOTSUPP;
> +
> +	if (event->cpu < 0)
> +		return -EINVAL;
> +
> +	/* only allow running on one cpu at a time */
> +	if (!cpumask_test_cpu(event->cpu, &xe_pmu_cpumask))
> +		return -EINVAL;
> +
> +	ret = config_status(xe, event->attr.config);
> +	if (ret)
> +		return ret;
> +
> +	if (!event->parent) {
> +		drm_dev_get(&xe->drm);
> +		event->destroy = xe_pmu_event_destroy;
> +	}
> +
> +	return 0;
> +}
> +
> +static u64 __xe_pmu_event_read(struct perf_event *event)
> +{
> +	struct xe_device *xe =
> +		container_of(event->pmu, typeof(*xe), pmu.base);
> +	const unsigned int gt_id = config_gt_id(event->attr.config);
> +	const u64 config = event->attr.config;
> +	struct xe_gt *gt = xe_device_get_gt(xe, gt_id);
> +	u64 val = 0;
> +
> +	switch (config_counter(config)) {
> +	default:
> +		drm_warn(&gt->tile->xe->drm, "unknown pmu event\n");
> +	}
> +
> +	return val;
> +}
> +
> +static void xe_pmu_event_read(struct perf_event *event)
> +{
> +	struct xe_device *xe =
> +		container_of(event->pmu, typeof(*xe), pmu.base);
> +	struct hw_perf_event *hwc = &event->hw;
> +	struct xe_pmu *pmu = &xe->pmu;
> +	u64 prev, new;
> +
> +	if (pmu->closed) {
> +		event->hw.state = PERF_HES_STOPPED;
> +		return;
> +	}
> +again:
> +	prev = local64_read(&hwc->prev_count);
> +	new = __xe_pmu_event_read(event);
> +
> +	if (local64_cmpxchg(&hwc->prev_count, prev, new) != prev)
> +		goto again;
> +
> +	local64_add(new - prev, &event->count);
> +}
> +
> +static void xe_pmu_enable(struct perf_event *event)
> +{
> +	/*
> +	 * Store the current counter value so we can report the correct delta
> +	 * for all listeners. Even when the event was already enabled and has
> +	 * an existing non-zero value.
> +	 */
> +	local64_set(&event->hw.prev_count, __xe_pmu_event_read(event));
> +}
> +
> +static void xe_pmu_event_start(struct perf_event *event, int flags)
> +{
> +	struct xe_device *xe =
> +		container_of(event->pmu, typeof(*xe), pmu.base);
> +	struct xe_pmu *pmu = &xe->pmu;
> +
> +	if (pmu->closed)
> +		return;
> +
> +	xe_pmu_enable(event);
> +	event->hw.state = 0;
> +}
> +
> +static void xe_pmu_event_stop(struct perf_event *event, int flags)
> +{
> +	if (flags & PERF_EF_UPDATE)
> +		xe_pmu_event_read(event);
> +
> +	event->hw.state = PERF_HES_STOPPED;
> +}
> +
> +static int xe_pmu_event_add(struct perf_event *event, int flags)
> +{
> +	struct xe_device *xe =
> +		container_of(event->pmu, typeof(*xe), pmu.base);
> +	struct xe_pmu *pmu = &xe->pmu;
> +
> +	if (pmu->closed)
> +		return -ENODEV;
> +
> +	if (flags & PERF_EF_START)
> +		xe_pmu_event_start(event, flags);
> +
> +	return 0;
> +}
> +
> +static void xe_pmu_event_del(struct perf_event *event, int flags)
> +{
> +	xe_pmu_event_stop(event, PERF_EF_UPDATE);
> +}
> +
> +static int xe_pmu_event_event_idx(struct perf_event *event)
> +{
> +	return 0;
> +}
> +
> +struct xe_ext_attribute {
> +	struct device_attribute attr;
> +	unsigned long val;
> +};
> +
> +static ssize_t xe_pmu_event_show(struct device *dev,
> +				 struct device_attribute *attr, char *buf)
> +{
> +	struct xe_ext_attribute *eattr;
> +
> +	eattr = container_of(attr, struct xe_ext_attribute, attr);
> +	return sprintf(buf, "config=0x%lx\n", eattr->val);
> +}
> +
> +static ssize_t cpumask_show(struct device *dev,
> +			    struct device_attribute *attr, char *buf)
> +{
> +	return cpumap_print_to_pagebuf(true, buf, &xe_pmu_cpumask);
> +}
> +
> +static DEVICE_ATTR_RO(cpumask);
> +
> +static struct attribute *xe_cpumask_attrs[] = {
> +	&dev_attr_cpumask.attr,
> +	NULL,
> +};
> +
> +static const struct attribute_group xe_pmu_cpumask_attr_group = {
> +	.attrs = xe_cpumask_attrs,
> +};
> +
> +#define __event(__counter, __name, __unit) \
> +{ \
> +	.counter = (__counter), \
> +	.name = (__name), \
> +	.unit = (__unit), \
> +}
> +
> +static struct xe_ext_attribute *
> +add_xe_attr(struct xe_ext_attribute *attr, const char *name, u64 config)
> +{
> +	sysfs_attr_init(&attr->attr.attr);
> +	attr->attr.attr.name = name;
> +	attr->attr.attr.mode = 0444;
> +	attr->attr.show = xe_pmu_event_show;
> +	attr->val = config;
> +
> +	return ++attr;
> +}
> +
> +static struct perf_pmu_events_attr *
> +add_pmu_attr(struct perf_pmu_events_attr *attr, const char *name,
> +	     const char *str)
> +{
> +	sysfs_attr_init(&attr->attr.attr);
> +	attr->attr.attr.name = name;
> +	attr->attr.attr.mode = 0444;
> +	attr->attr.show = perf_event_sysfs_show;
> +	attr->event_str = str;
> +
> +	return ++attr;
> +}
> +
> +static struct attribute **
> +create_event_attributes(struct xe_pmu *pmu)
> +{
> +	struct xe_device *xe = container_of(pmu, typeof(*xe), pmu);
> +	static const struct {
> +		unsigned int counter;
> +		const char *name;
> +		const char *unit;
> +	} events[] = {
> +	};
> +
> +	struct perf_pmu_events_attr *pmu_attr = NULL, *pmu_iter;
> +	struct xe_ext_attribute *xe_attr = NULL, *xe_iter;
> +	struct attribute **attr = NULL, **attr_iter;
> +	unsigned int count = 0;
> +	unsigned int i, j;
> +	struct xe_gt *gt;
> +
> +	/* Count how many counters we will be exposing. */
> +	for_each_gt(gt, xe, j) {
> +		for (i = 0; i < ARRAY_SIZE(events); i++) {
> +			u64 config = ___XE_PMU_OTHER(j, events[i].counter);
> +
> +			if (!config_status(xe, config))
> +				count++;
> +		}
> +	}
> +
> +	/* Allocate attribute objects and table. */
> +	xe_attr = kcalloc(count, sizeof(*xe_attr), GFP_KERNEL);
> +	if (!xe_attr)
> +		goto err_alloc;
> +
> +	pmu_attr = kcalloc(count, sizeof(*pmu_attr), GFP_KERNEL);
> +	if (!pmu_attr)
> +		goto err_alloc;
> +
> +	/* Max one pointer of each attribute type plus a termination entry. */
> +	attr = kcalloc(count * 2 + 1, sizeof(*attr), GFP_KERNEL);
> +	if (!attr)
> +		goto err_alloc;
> +
> +	xe_iter = xe_attr;
> +	pmu_iter = pmu_attr;
> +	attr_iter = attr;
> +
> +	for_each_gt(gt, xe, j) {
> +		for (i = 0; i < ARRAY_SIZE(events); i++) {
> +			u64 config = ___XE_PMU_OTHER(j, events[i].counter);
> +			char *str;
> +
> +			if (config_status(xe, config))
> +				continue;
> +
> +			str = kasprintf(GFP_KERNEL, "%s-gt%u",
> +					events[i].name, j);
> +			if (!str)
> +				goto err;
> +
> +			*attr_iter++ = &xe_iter->attr.attr;
> +			xe_iter = add_xe_attr(xe_iter, str, config);
> +
> +			if (events[i].unit) {
> +				str = kasprintf(GFP_KERNEL, "%s-gt%u.unit",
> +						events[i].name, j);
> +				if (!str)
> +					goto err;
> +
> +				*attr_iter++ = &pmu_iter->attr.attr;
> +				pmu_iter = add_pmu_attr(pmu_iter, str,
> +							events[i].unit);
> +			}
> +		}
> +	}
> +
> +	pmu->xe_attr = xe_attr;
> +	pmu->pmu_attr = pmu_attr;
> +
> +	return attr;
> +
> +err:
> +	for (attr_iter = attr; *attr_iter; attr_iter++)
> +		kfree((*attr_iter)->name);
> +
> +err_alloc:
> +	kfree(attr);
> +	kfree(xe_attr);
> +	kfree(pmu_attr);
> +
> +	return NULL;
> +}
> +
> +static void free_event_attributes(struct xe_pmu *pmu)
> +{
> +	struct attribute **attr_iter = pmu->events_attr_group.attrs;
> +
> +	for (; *attr_iter; attr_iter++)
> +		kfree((*attr_iter)->name);
> +
> +	kfree(pmu->events_attr_group.attrs);
> +	kfree(pmu->xe_attr);
> +	kfree(pmu->pmu_attr);
> +
> +	pmu->events_attr_group.attrs = NULL;
> +	pmu->xe_attr = NULL;
> +	pmu->pmu_attr = NULL;
> +}
> +
> +static int xe_pmu_cpu_online(unsigned int cpu, struct hlist_node *node)
> +{
> +	struct xe_pmu *pmu = hlist_entry_safe(node, typeof(*pmu), cpuhp.node);
> +
> +	XE_WARN_ON(!pmu->base.event_init);
> +
> +	/* Select the first online CPU as a designated reader. */
> +	if (cpumask_empty(&xe_pmu_cpumask))
> +		cpumask_set_cpu(cpu, &xe_pmu_cpumask);
> +
> +	return 0;
> +}
> +
> +static int xe_pmu_cpu_offline(unsigned int cpu, struct hlist_node *node)
> +{
> +	struct xe_pmu *pmu = hlist_entry_safe(node, typeof(*pmu), cpuhp.node);
> +	unsigned int target = xe_pmu_target_cpu;
> +
> +	/*
> +	 * Unregistering an instance generates a CPU offline event which we must
> +	 * ignore to avoid incorrectly modifying the shared xe_pmu_cpumask.
> +	 */
> +	if (pmu->closed)
> +		return 0;
> +
> +	if (cpumask_test_and_clear_cpu(cpu, &xe_pmu_cpumask)) {
> +		target = cpumask_any_but(topology_sibling_cpumask(cpu), cpu);
> +
> +		/* Migrate events if there is a valid target */
> +		if (target < nr_cpu_ids) {
> +			cpumask_set_cpu(target, &xe_pmu_cpumask);
> +			xe_pmu_target_cpu = target;
> +		}
> +	}
> +
> +	if (target < nr_cpu_ids && target != pmu->cpuhp.cpu) {
> +		perf_pmu_migrate_context(&pmu->base, cpu, target);
> +		pmu->cpuhp.cpu = target;
> +	}
> +
> +	return 0;
> +}
> +
> +static enum cpuhp_state cpuhp_slot = CPUHP_INVALID;
> +
> +/**
> + * xe_pmu_init() - Setup CPU hotplug state/callbacks for Xe PMU
> + *
> + * Returns: 0 if successful, else error code
> + */
> +int xe_pmu_init(void)
> +{
> +	int ret;
> +
> +	ret = cpuhp_setup_state_multi(CPUHP_AP_ONLINE_DYN,
> +				      "perf/x86/intel/xe:online",
> +				      xe_pmu_cpu_online,
> +				      xe_pmu_cpu_offline);
> +	if (ret < 0)
> +		pr_notice("Failed to setup cpuhp state for xe PMU! (%d)\n",
> +			  ret);
> +	else
> +		cpuhp_slot = ret;
> +
> +	return 0;
> +}
> +
> +/**
> + * xe_pmu_exit() - Remove CPU hotplug state/callbacks for Xe PMU
> + */
> +void xe_pmu_exit(void)
> +{
> +	if (cpuhp_slot != CPUHP_INVALID)
> +		cpuhp_remove_multi_state(cpuhp_slot);
> +}
> +
> +static int xe_pmu_register_cpuhp_state(struct xe_pmu *pmu)
> +{
> +	if (cpuhp_slot == CPUHP_INVALID)
> +		return -EINVAL;
> +
> +	return cpuhp_state_add_instance(cpuhp_slot, &pmu->cpuhp.node);
> +}
> +
> +static void xe_pmu_unregister_cpuhp_state(struct xe_pmu *pmu)
> +{
> +	cpuhp_state_remove_instance(cpuhp_slot, &pmu->cpuhp.node);
> +}
> +
> +/**
> + * xe_pmu_unregister() - Remove/cleanup PMU registration
> + */
> +void xe_pmu_unregister(void *arg)
> +{
> +	struct xe_pmu *pmu = arg;
> +
> +	if (!pmu->base.event_init)
> +		return;
> +
> +	/*
> +	 * "Disconnect" the PMU callbacks - since all are atomic synchronize_rcu
> +	 * ensures all currently executing ones will have exited before we
> +	 * proceed with unregistration.
> +	 */
> +	pmu->closed = true;
> +	synchronize_rcu();
> +
> +	xe_pmu_unregister_cpuhp_state(pmu);
> +
> +	perf_pmu_unregister(&pmu->base);
> +	pmu->base.event_init = NULL;
> +	kfree(pmu->base.attr_groups);
> +	kfree(pmu->name);
> +	free_event_attributes(pmu);
> +}
> +
> +/**
> + * xe_pmu_register() - Define basic PMU properties for Xe and add event callbacks.
> + *
> + */
> +void xe_pmu_register(struct xe_pmu *pmu)
> +{
> +	struct xe_device *xe = container_of(pmu, typeof(*xe), pmu);
> +	const struct attribute_group *attr_groups[] = {
> +		&pmu->events_attr_group,
> +		&xe_pmu_cpumask_attr_group,
> +		NULL
> +	};
> +
> +	int ret = -ENOMEM;
> +
> +	spin_lock_init(&pmu->lock);
> +	pmu->cpuhp.cpu = -1;
> +
> +	pmu->name = kasprintf(GFP_KERNEL,
> +			      "xe_%s",
> +			      dev_name(xe->drm.dev));
> +	if (pmu->name)
> +		/* tools/perf reserves colons as special. */
> +		strreplace((char *)pmu->name, ':', '_');
> +
> +	if (!pmu->name)
> +		goto err;
> +
> +	pmu->events_attr_group.name = "events";
> +	pmu->events_attr_group.attrs = create_event_attributes(pmu);
> +	if (!pmu->events_attr_group.attrs)
> +		goto err_name;
> +
> +	pmu->base.attr_groups = kmemdup(attr_groups, sizeof(attr_groups),
> +					GFP_KERNEL);
> +	if (!pmu->base.attr_groups)
> +		goto err_attr;
> +
> +	pmu->base.module	= THIS_MODULE;
> +	pmu->base.task_ctx_nr	= perf_invalid_context;
> +	pmu->base.event_init	= xe_pmu_event_init;
> +	pmu->base.add		= xe_pmu_event_add;
> +	pmu->base.del		= xe_pmu_event_del;
> +	pmu->base.start		= xe_pmu_event_start;
> +	pmu->base.stop		= xe_pmu_event_stop;
> +	pmu->base.read		= xe_pmu_event_read;
> +	pmu->base.event_idx	= xe_pmu_event_event_idx;
> +
> +	ret = perf_pmu_register(&pmu->base, pmu->name, -1);
> +	if (ret)
> +		goto err_groups;
> +
> +	ret = xe_pmu_register_cpuhp_state(pmu);
> +	if (ret)
> +		goto err_unreg;
> +
> +	ret = devm_add_action_or_reset(xe->drm.dev, xe_pmu_unregister, pmu);
> +	if (ret)
> +		goto err_cpuhp;
> +
> +	return;
> +
> +err_cpuhp:
> +	xe_pmu_unregister_cpuhp_state(pmu);
> +err_unreg:
> +	perf_pmu_unregister(&pmu->base);
> +err_groups:
> +	kfree(pmu->base.attr_groups);
> +err_attr:
> +	pmu->base.event_init = NULL;
> +	free_event_attributes(pmu);
> +err_name:
> +	kfree(pmu->name);
> +err:
> +	drm_notice(&xe->drm, "Failed to register PMU!\n");
> +}
> diff --git a/drivers/gpu/drm/xe/xe_pmu.h b/drivers/gpu/drm/xe/xe_pmu.h
> new file mode 100644
> index 000000000000..d07e5dfdfec0
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_pmu.h
> @@ -0,0 +1,26 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2024 Intel Corporation
> + */
> +
> +#ifndef _XE_PMU_H_
> +#define _XE_PMU_H_
> +
> +#include "xe_pmu_types.h"
> +
> +struct xe_gt;
> +
> +#if IS_ENABLED(CONFIG_PERF_EVENTS)
> +int xe_pmu_init(void);
> +void xe_pmu_exit(void);
> +void xe_pmu_register(struct xe_pmu *pmu);
> +void xe_pmu_unregister(void *arg);
> +#else
> +static inline int xe_pmu_init(void) { return 0; }
> +static inline void xe_pmu_exit(void) {}
> +static inline void xe_pmu_register(struct xe_pmu *pmu) {}
> +static inline void xe_pmu_unregister(void *arg) {}
> +#endif
> +
> +#endif
> +
> diff --git a/drivers/gpu/drm/xe/xe_pmu_types.h b/drivers/gpu/drm/xe/xe_pmu_types.h
> new file mode 100644
> index 000000000000..ca0e7cbe2081
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_pmu_types.h
> @@ -0,0 +1,63 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2024 Intel Corporation
> + */
> +
> +#ifndef _XE_PMU_TYPES_H_
> +#define _XE_PMU_TYPES_H_
> +
> +#include <linux/perf_event.h>
> +#include <linux/spinlock_types.h>
> +#include <uapi/drm/xe_drm.h>
> +
> +enum {
> +	__XE_NUM_PMU_SAMPLERS
> +};
> +
> +#define XE_PMU_MAX_GT 2
> +
> +struct xe_pmu {
> +	/**
> +	 * @cpuhp: Struct used for CPU hotplug handling.
> +	 */
> +	struct {
> +		struct hlist_node node;
> +		unsigned int cpu;
> +	} cpuhp;
> +	/**
> +	 * @base: PMU base.
> +	 */
> +	struct pmu base;
> +	/**
> +	 * @closed: xe is unregistering.
> +	 */
> +	bool closed;
> +	/**
> +	 * @name: Name as registered with perf core.
> +	 */
> +	const char *name;
> +	/**
> +	 * @lock: Lock protecting enable mask and ref count handling.
> +	 */
> +	spinlock_t lock;
> +	/**
> +	 * @sample: Current and previous (raw) counters.
> +	 *
> +	 * These counters are updated when the device is awake.
> +	 */
> +	u64 sample[XE_PMU_MAX_GT][__XE_NUM_PMU_SAMPLERS];
> +	/**
> +	 * @events_attr_group: Device events attribute group.
> +	 */
> +	struct attribute_group events_attr_group;
> +	/**
> +	 * @xe_attr: Memory block holding device attributes.
> +	 */
> +	void *xe_attr;
> +	/**
> +	 * @pmu_attr: Memory block holding device attributes.
> +	 */
> +	void *pmu_attr;
> +};
> +
> +#endif
> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> index b6fbe4988f2e..2c5f258eee3a 100644
> --- a/include/uapi/drm/xe_drm.h
> +++ b/include/uapi/drm/xe_drm.h
> @@ -1389,6 +1389,14 @@ struct drm_xe_wait_user_fence {
>  	__u64 reserved[2];
>  };
>  
> +/*
> + * Top bits of every counter are GT id.
> + */
> +#define __XE_PMU_GT_SHIFT (56)
> +
> +#define ___XE_PMU_OTHER(gt, x) \
> +	(((__u64)(x)) | ((__u64)(gt) << __XE_PMU_GT_SHIFT))
> +
>  /**
>   * enum drm_xe_observation_type - Observation stream types
>   */
> -- 
> 2.38.1
> 
