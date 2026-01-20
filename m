Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02F2ACA5FBB
	for <intel-xe@archiver.kernel.org>; Tue, 20 Jan 2026 17:51:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB71910E63E;
	Tue, 20 Jan 2026 17:51:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ST0gMi84";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAFA010E643
 for <intel-xe@lists.freedesktop.org>; Tue, 20 Jan 2026 17:51:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768931507; x=1800467507;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=BWOdswBfGn3Uj9y0av47J6rpNEidy/1pHoZjoKFGUYI=;
 b=ST0gMi84KxzHNwUuKdzY1j2Oua9PCpkylOw3l1OrBU8yl376pWcqgAKl
 Eab+RMeueWN5CQZhg+yZsgDSAMn426mNs0LEE1B4AsgsKKt2t/n5AvZa8
 8K01ay9PhSAdXO/dGM5CkU/972zDeJSCQCxAkIEmEu49ofPofTPAlCq3j
 cA1JsXh4ixzK9UYVlhTxHluNkAyxiTlLrtWk7e0WZshVcNIaMX3vbJXu/
 yXlRtlQmc+xfm0bYt4X3egmSkqhCpAi9hrJ3jH/7+5JGaJE3bjOGZ+onQ
 svpzjqWXzGjLIh+f+iW+tuN2QKhl5S3Ha5wHCM0SYFEHMgycRzU+747NG Q==;
X-CSE-ConnectionGUID: YmvVZ/ucRIOLT+aq8hXV1Q==
X-CSE-MsgGUID: 56oP6eTMQRyhZZh1V29Cqw==
X-IronPort-AV: E=McAfee;i="6800,10657,11677"; a="87562066"
X-IronPort-AV: E=Sophos;i="6.21,241,1763452800"; d="scan'208";a="87562066"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2026 09:51:47 -0800
X-CSE-ConnectionGUID: ijOKOZCITQ6ohZYqEbhH8Q==
X-CSE-MsgGUID: fBZ1GsLcToujJtdI+j2PrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,241,1763452800"; d="scan'208";a="211057780"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2026 09:51:46 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 20 Jan 2026 09:51:46 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Tue, 20 Jan 2026 09:51:46 -0800
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.38)
 by edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 20 Jan 2026 09:51:45 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZTGuLJqzxpQOz71/DoJB66275odh4YOPmqYX0cl8JHEH+LjgtEtV2llNeR/kb1we7b5GGSXj0MNfreXqIoGPnN7x5PHoLhfvd1IY9itXsI3gG1cEoWbVfCzSsSRZK4Y4lCUQ4ti0W/eXLZxaQpKcgomYvOS0D2HcejxG/N7T0VT7gmuSAT6Tft4NdwbkMydM6y5Lltdv8XWzwqyLDgZ8TvLPeJ5BWdjqPxMitndK0x9R14YxBAikKYNnoVrLD5UxW9hLIg3LYQcEdDX25WpWVuOpkpccGVTztUdQ8YoNoH0sZB2bqDvDOf0y0wHWESOM4i7XhHgzxMgSmh5ChpYnfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rsLFwT/L3t54D7/xZYuJV3yZuYkhsWYPvo1bQDSPFqw=;
 b=ka6WWa+elKMYzVemoPj61/Np+i7IXAdkU5zbKFmIrN5tGVefKh4t0cRXYcRphHJXMSX1TAyTAm3pC9KFS1YaeksT9Vxq8QBwHIDWzRgRsKqe0IXvgdTdiZPy5/vQfqch7baqPbgTDxYSBXLUertoJmDGYMPbbUNIbEVs3tsjIdxLdGJm17jN8+b7jA4jJ2BpeT/QZvTTm/knooHKuC/Qj2pgMfRkf/IFytkVeqU8MFoz0wvX7OH2Robgozu7jOQowB00AX5g259CYSInp/xbmzEiMKo59hd8T+SLCQuP6e2GCaD0BDUc+PDwXzWZQWaOJMmS/IFF9NaKfm4hOd1obg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SJ1PR11MB6226.namprd11.prod.outlook.com (2603:10b6:a03:45b::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Tue, 20 Jan
 2026 17:51:43 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.9456.015; Tue, 20 Jan 2026
 17:51:43 +0000
Date: Tue, 20 Jan 2026 09:51:40 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Arvind Yadav <arvind.yadav@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <himal.prasad.ghimiray@intel.com>,
 <thomas.hellstrom@linux.intel.com>, <pallavi.mishra@intel.com>
Subject: Re: [PATCH v4 7/8] drm/xe/madvise: Block imported and exported
 dma-bufs
Message-ID: <aW/ArJw02DG/6wHv@lstrano-desk.jf.intel.com>
References: <20260120060900.3137984-1-arvind.yadav@intel.com>
 <20260120060900.3137984-8-arvind.yadav@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260120060900.3137984-8-arvind.yadav@intel.com>
X-ClientProxiedBy: MW3PR05CA0001.namprd05.prod.outlook.com
 (2603:10b6:303:2b::6) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SJ1PR11MB6226:EE_
X-MS-Office365-Filtering-Correlation-Id: fd3b85d3-9ece-4cac-991e-08de584c9272
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?mYk06QT52kWXljSoFilJn2P7EElgyaI4FseBzycEF9k5fKWpZj2338hE1x?=
 =?iso-8859-1?Q?DGnkVyaZ8Dwp2zURuAYEsTpvAT1VDzv944sJLvX6cVX9HLwBUjs1/0kCQN?=
 =?iso-8859-1?Q?K6tlMaXdn0wOL1o4kWZ/W1NqAGIVd6F5AjMgYjtCCWwYr9ELGB0Ebg9xRU?=
 =?iso-8859-1?Q?ZLFwQUPhnLtamSxeNAKbLVfiaHTJPi1K2U8NlMFQr8HQo0W9Ht53QTNPcZ?=
 =?iso-8859-1?Q?I1EomZX5BphfJcKXQdNMtpOAG2yWS4MXygpbRl/p3LLHA2PgjpQ1F8e3Bx?=
 =?iso-8859-1?Q?KCsYhLpKb/SXMo64/a42rFIC1TufH5kr3hJARUgXnCOwDg16udx5SlkSW1?=
 =?iso-8859-1?Q?ESKEJeBpJI+46kUBAAKjbF+B1flJWwBkg7sFJ0kdqLLyviLpKBIBil+cqu?=
 =?iso-8859-1?Q?FL7aQ3EgB553vQy5J6OG2+4LqPYz1bdoipITKPztO1kYPVgyy7niNEB5cB?=
 =?iso-8859-1?Q?LLEgaIO3yVVT0YvnF8J0Ha4krvG3NrEq3p26rnXEqh1Y9PpIveTodoW9p0?=
 =?iso-8859-1?Q?P94bbVKo31qQqcCHpPygBgSS/phnA9N1qetsPo1FShUJJFxllgV1tyj0OD?=
 =?iso-8859-1?Q?b2tjFkny7hqvSKjFybfamUeJ2QKeB79icojpp5YfWB/cO9aVvdzIU8ARwA?=
 =?iso-8859-1?Q?fSvQDgCLKJ8bK4dFUHMlwK6q/MrA4HJGm0dq5lXNcDbI9Q8TusS9Ha9sFn?=
 =?iso-8859-1?Q?gqvaI/zaaQH6gtC7AhUODS0En9dwXB0XExVzngmPbLGFUJyuO9JSp0uOmO?=
 =?iso-8859-1?Q?hNd+WHrTAk+IhgI2j2LyCm7YZdAlXIXnjQBQUi3R9Vfkl4RRSWeVRUNT5N?=
 =?iso-8859-1?Q?gd8o3EbGMXK9Y3ALaPJ5VmBehsIrE/lAGi/ltEimsl0o1m1uqYnK2F6dmv?=
 =?iso-8859-1?Q?Zx81iXfFEthOZw86KnIMwAGa1fHqtx9+IgX+Y94FZsuX4NqXvwW6jqxybz?=
 =?iso-8859-1?Q?lr/s4txkNAnJ7TaNW5Dw59zTpdNLO1odCrLC/c+g9SaNTHSWGR4uc9hfo8?=
 =?iso-8859-1?Q?DnqUys+o2soVinHoI0sVlnpWCtCfMz7dg6KvQovNdDtMEUDMRMfchYDJEe?=
 =?iso-8859-1?Q?ba8Fnt8TqDltiyLYmTWQ5gymEk84RT9fJToL8bMh5+7ME/1QAeYaDbjy/m?=
 =?iso-8859-1?Q?JpIEC3B3CbPCFua7RMoEuMT05mIU+aKFOv+EqbSbW8KPO8f3B8Ml34EhCt?=
 =?iso-8859-1?Q?pVaaMe9D2+tKvQRGK46+UxKp8dgW+w8Cks+5szphI4h2Ge8r+fbm50qGxi?=
 =?iso-8859-1?Q?rmrsABgxnAGKRQPtH9GK3NgJWb4LsKH06dxrjCguQgsCSgmjGN3liWAAiR?=
 =?iso-8859-1?Q?4pdVZdyK1VH8yHd85D00f7aiaLy6OlYDXctOORxhVTfnyDAJ1sm6ZNqRua?=
 =?iso-8859-1?Q?6eSgMAPXp4vqLQx+8PQqa9gsLzgaL7hIQWWHzsZiG61wBke2JaEq+lJR49?=
 =?iso-8859-1?Q?d2MjWAXvGU1fWzXUssQqK7fCkr+Vfwv+HUfY0NxzVTkVgWREWY18G3V1LF?=
 =?iso-8859-1?Q?EiQcO4CJI0V2YlkONn7WkDCPVao435T5o6BnW/W80ZM89/mCR8rTtoWJ4E?=
 =?iso-8859-1?Q?P/cdcYOIbLNqRMFQUYSvw4e1pDy1FxXOhWEOxF9QLqeBNSrms37FwfJEMT?=
 =?iso-8859-1?Q?Ikf0Kl8C8Kx2o=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?vLsEWXIHEhTCLkNN0hHlkCBI7bexe2Z9ERz8UYk/1RywNxXHX56uEUfQ8p?=
 =?iso-8859-1?Q?Rs3tjXFMSPWfqek7VB8Qk4GgOAsgQJukBBpkaZzVKng/jS29/AurdP3r3l?=
 =?iso-8859-1?Q?WV6c2HxIeWNH3udnhIPeaukFxyZD1ZBXGdCBmaj+BHJyzfY9hYmdGrEapa?=
 =?iso-8859-1?Q?+5xSymP/9mzv4MqlqmXA+pN46G1fdPAsnxCU3TxPBd76/0IWhaiMkGjhbD?=
 =?iso-8859-1?Q?07rjokWRVOkX5vMJzVlf+LS6LCJPt9JM6mwumoZ3FviQsN58oBlNSGS6+W?=
 =?iso-8859-1?Q?B6MFInoc5QYK468DYmb6Zfp5zhyrD2ULIVaKcgn8FVKLoc1ovP/D/Fg494?=
 =?iso-8859-1?Q?7hkiXG1PXzdpg+fPKFAkvvLMfcsmc3gNg7NYE86IQ4nQM8jPuL2GyQx02k?=
 =?iso-8859-1?Q?eJPqlmLPmD7b9R2lSw97QwLqdVgb6zwCmNGyAqYIflnE2pchMAbmxoWnqp?=
 =?iso-8859-1?Q?jSmDzwAOGsNFxUWZKV8x0/IyUtdaGuQMJxIufNzJzTa5cHspnGegtSnHjp?=
 =?iso-8859-1?Q?NzRkau1ORKwD2UQBYcPZ2PIwkTljVkBOE2GA03btEzReIDtB8r5N8g9eb5?=
 =?iso-8859-1?Q?R/S6makxSdzTyWqhdSeVF6eHCLP4mT6UIDL447btw1zpInkI3Qwe2PfCMb?=
 =?iso-8859-1?Q?BFbPKhM4APm1gnF0alDbdjCP04Pm9fC0Df7Z5SdVZSstWeCzqhVWdToRl2?=
 =?iso-8859-1?Q?qBiv9aWlemiLtR1zly/zZKhHdzgAYiEgk6jH8aha2loW3zkevBuNeY/zlX?=
 =?iso-8859-1?Q?AbLdMPrFElPNTgjpclrcIuLE1GgLnh1zzsmOpDBMGVVoeCT6wixYm0pMry?=
 =?iso-8859-1?Q?iVGzXFmhBReT7kt0n/PaN1G15/zGhjd377ogX5OXyjMh9hHTFZnk65cL38?=
 =?iso-8859-1?Q?Pobzrx3EBIHoJ4vR2nwzyqqKPGl/jXP/fqvfDZ7eLi4CtHhIGWFYK6VzIl?=
 =?iso-8859-1?Q?j5nBzGJPcmLW5cJkbTv2mPcoV4ohJ5/ffrk07tUTCEuWn0TZCBX7982bfV?=
 =?iso-8859-1?Q?D1xxy72EYx8noRNtIuUE39/JpG2jnuvobRRMJlhWHZ/t5Jpk0ppjZtjqI2?=
 =?iso-8859-1?Q?xTzDqwJ93Jj13oPaDlIWgxgVvRUPvO1BLgGGHih5ETqLkzcoOMsZvt6Q27?=
 =?iso-8859-1?Q?UKtVsEJduT1erTCgn3kfNhFxtOn3fow4VW+RtMMFw1DxHG6PxA9OaT/L9h?=
 =?iso-8859-1?Q?5mFWL3OxOMSDQyuV7BHkCMQQ8wTLHVnwZ1cI1DE5zq6e0Ad/vebUv03Ir5?=
 =?iso-8859-1?Q?k1Db0xx/AYIHm33XWHU+dN1DrmrSzigSu5tv/ZsVFxqPHjIDkxSkd+mJWD?=
 =?iso-8859-1?Q?ntkkJDCacAo6VYs0ZHJgbsAyLZZ9S1KaVP0UM9sV4uEh9Sg60y5GMNCQbz?=
 =?iso-8859-1?Q?IU0JraWUh1u4kASjDkXYZK4RfrAqtnGoN4PpS/siFJL5QU7ClE0PnJCJGW?=
 =?iso-8859-1?Q?39ut8qGCrQGghgeInOWLeHVziKA10xsX7fI1o6Kt15NfI/p8p1lQ/on3BR?=
 =?iso-8859-1?Q?fbWpT8K7lb/vvSNYx8AZ95bsLwow0omw6wisiXObfX/lypMOU+/SAsIK/s?=
 =?iso-8859-1?Q?mwUKBkEOnrrlfv8UHHT07Iic67Qc9VY7wVxIFeDuW7LoYMazQTwTXbIN8s?=
 =?iso-8859-1?Q?2iV6Mrq+Wr7wl7UTK3tqVUEVHTXUEU+r1eBN904BGzsgLbtxm3Gj2010Bl?=
 =?iso-8859-1?Q?vWSIIJsT8F+CfMIPOB0GOxdT3Ikm1c3J3APoUBlXFXXDtobJerZnP832Jl?=
 =?iso-8859-1?Q?RavWgvOW5mXyYtHwiyqiukEZRbQB3F/A/BO9DI1zLWWX9/5nPEZ9KFtlK4?=
 =?iso-8859-1?Q?jH9pgnH1BqqRraOJV/tlgVhKa19BaXM=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fd3b85d3-9ece-4cac-991e-08de584c9272
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2026 17:51:43.2445 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nhxWRA5AKclWwJw3NM1c3t4CUnhyssFJKxaYqbqm50MHQPgnFW/9U4U8FkAgMjOl8H7VXUvJD2E+i7Ql/9LPhg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6226
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

On Tue, Jan 20, 2026 at 11:38:53AM +0530, Arvind Yadav wrote:
> Prevent marking imported or exported dma-bufs as purgeable.
> External devices may be accessing these buffers without our
> knowledge, making purging unsafe.
> 
> Check drm_gem_is_imported() for buffers created by other
> drivers and obj->dma_buf for buffers exported to other
> drivers. Silently skip these BOs during madvise processing.
> 
> This follows drm_gem_shmem's purgeable implementation and
> prevents data corruption from purging actively-used shared
> buffers.
> 
> v3:
>    - Addresses review feedback from Matt Roper about handling
>      imported/exported BOs correctly in the purgeable BO
>      implementation.
> 
> v4:
>    - Check should be add to xe_vm_madvise_purgeable_bo.
> 
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>

@Thomas - couple questions below here I need a 2nd opinion on.

> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_vm_madvise.c | 33 ++++++++++++++++++++++++++++++
>  1 file changed, 33 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.c b/drivers/gpu/drm/xe/xe_vm_madvise.c
> index 27b6ad65b314..5808fef89777 100644
> --- a/drivers/gpu/drm/xe/xe_vm_madvise.c
> +++ b/drivers/gpu/drm/xe/xe_vm_madvise.c
> @@ -180,6 +180,31 @@ static void madvise_pat_index(struct xe_device *xe, struct xe_vm *vm,
>  	}
>  }
>  
> +/**
> + * xe_bo_is_external_dmabuf() - Check if BO is imported or exported dma-buf
> + * @bo: Buffer object
> + *
> + * Prevent marking imported or exported dma-bufs as purgeable.
> + * External devices may be accessing these buffers without our
> + * knowledge, making purging unsafe.
> + *
> + * Return: true if BO is imported or exported, false otherwise
> + */
> +static bool xe_bo_is_external_dmabuf(struct xe_bo *bo)
> +{

@Thomas

Should we have this check more generic? e.g., if a BO is not tied to a
VM, we don't allow purablity to be set?

> +	struct drm_gem_object *obj = &bo->ttm.base;
> +
> +	/* Imported from another driver */
> +	if (drm_gem_is_imported(obj))
> +		return true;
> +
> +	/* Exported to another driver */
> +	if (obj->dma_buf)
> +		return true;
> +
> +	return false;
> +}
> +
>  /**
>   * xe_bo_all_vmas_dontneed() - Check if all VMAs of a BO are marked DONTNEED
>   * @bo: Buffer object
> @@ -200,6 +225,10 @@ static bool xe_bo_all_vmas_dontneed(struct xe_bo *bo)
>  
>  	dma_resv_assert_held(bo->ttm.base.resv);
>  
> +	/* External dma-bufs cannot be purgeable */
> +	if (xe_bo_is_external_dmabuf(bo))
> +		return false;
> +
>  	drm_gem_for_each_gpuvm_bo(vm_bo, obj) {
>  		drm_gpuvm_bo_for_each_va(gpuva, vm_bo) {
>  			struct xe_vma *vma = gpuva_to_vma(gpuva);
> @@ -277,6 +306,10 @@ static bool xe_vm_madvise_purgeable_bo(struct xe_device *xe, struct xe_vm *vm,
>  		/* BO must be locked before modifying madv state */
>  		xe_bo_assert_held(bo);
>  
> +		/* Skip external dma-bufs */
> +		if (xe_bo_is_external_dmabuf(bo))
> +			continue;

@Thomas

I think instead of silently continuing here we fail the IOCTL with
-EINVAL?

What do you think?

Matt

> +
>  		/*
>  		 * Once purged, always purged. Cannot transition back to WILLNEED.
>  		 * This matches i915 semantics where purged BOs are permanently invalid.
> -- 
> 2.43.0
> 
