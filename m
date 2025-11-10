Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6400CCFA13
	for <intel-xe@archiver.kernel.org>; Mon, 10 Nov 2025 15:18:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACD0C10E400;
	Mon, 10 Nov 2025 15:18:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UfD6Ni2O";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5556610E401
 for <intel-xe@lists.freedesktop.org>; Mon, 10 Nov 2025 15:18:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762787900; x=1794323900;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 in-reply-to:mime-version;
 bh=RIT7J3bLWIOonWiVMgDTpDW9sgvCZj6D6foG2KyXDSM=;
 b=UfD6Ni2ONm5Q8MHZ+IxV+glwwQwbrgeqorcV4Mqzb9ahSVb+jSBcqlCV
 G3kpO7HCgSdLiYhzCNh8OsitWQYmC3CS+BxJU/AlGRX6vKGUpUqZVtX5W
 BwWJ93yJ2UgJoRjQBvs8guaGDhuohLyCQyjkNMpDAh28unJkS/xY4ULM1
 j1nSfV/cACQcqXhmLu6S0q/8hSZ9wMgj0jg1eHiS+gu2oRDaReuuswgGI
 UU3SMuICG8m568UOwFaZTC0xW7PNJvMyab7JKT/L1VXQ5TkAlnFfyuZE3
 odJ/gl6YA1b19YR1blSX8ObAa0zYaqlLhJPBZnmZ9Rd2/w2ZTonVYTOMC g==;
X-CSE-ConnectionGUID: Kj4CDBWhQDSn4ifoOpcHVA==
X-CSE-MsgGUID: fqpJomOQTKSMuJeRypLhXA==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="64749684"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="64749684"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2025 07:18:19 -0800
X-CSE-ConnectionGUID: SVhQzVFJTCqfFvFHp/+BoA==
X-CSE-MsgGUID: INy0T9wgRXaTn8DNUnd9Yg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,293,1754982000"; d="scan'208";a="188940638"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2025 07:18:19 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 10 Nov 2025 07:18:18 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 10 Nov 2025 07:18:18 -0800
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.71)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 10 Nov 2025 07:18:18 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jqA/q4a2EqME6sG135CniY7Fb8OXesJINrmZ2YPeCnekwAMxvtHx6qZ+aQmSZIc7KL40p4pormR18Q9KZd1inmtUomoJyDn6foJYk0tSnGRTBrYVMjSO90ka8LxvzDFhIuzJbw7SOq0ypEr3nVCLVPZ5//DEOnIzxf65be9YCNxvten3zISaMWjX3G2YM2Dblnyi+raZ/WJptemH0wDCQ+fRe47OgI/0ib2dsrcabfGCQZrKoMyTf2vbhE02cK7ffq1n8IzrxHXs6FtCWkAKkvif2AlYBJsVr9st0NynxRCotPHl9DKVLoIMCTwvl729wVdvdgBG2ZJhcK5PhqgDOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P87c/75tBXQrKgpMjsIVC4UzLmNNUWcqcAi1VStSwxY=;
 b=VWmaHuluC8LcJ6Kw779eAlCwufBNnpU7jgMg8piIER9z0yMQpWAFxdEEA7JPILQCWtb3iCacv9vXnUpZKnwv71O4P8RoisBZunPwGGS6pRNNdnMLWSlHIBp4zPcsYW14W1skGMu483cVL6BBQSDLWqEfPTtCEGEKzCfvZa+PGx3fT9r052hJW73MtrQUgK9g6++uEMt4ugkBhIhl35fDPDmd5lChQPkAARxDbMqBtRZ6hBgyWlDowIo5Mm+tuqRZX1Q+lwFcwJdD9+wfn/GOH85yvHPFJ1wcgD75Za2X/hKrJtRE/M74O2YCCl5ii04eVu2iVnrxIcXiFLLM9OQ4Yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com (2603:10b6:a03:2d1::10)
 by PH0PR11MB4824.namprd11.prod.outlook.com (2603:10b6:510:38::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Mon, 10 Nov
 2025 15:18:11 +0000
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::8900:d137:e757:ac9f]) by SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::8900:d137:e757:ac9f%3]) with mapi id 15.20.9298.015; Mon, 10 Nov 2025
 15:18:10 +0000
Date: Mon, 10 Nov 2025 17:17:54 +0200
From: Imre Deak <imre.deak@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: =?utf-8?B?4pyXIFhlLkNJLkZ1bGw=?= =?utf-8?Q?=3A?= failure for
 drm/i915/dp_mst: Disable Panel Replay
Message-ID: <aRICIjw_j4UzO7eD@ideak-desk>
References: <20251107124141.911895-1-imre.deak@intel.com>
 <176265146623.33229.14392217448285890815@10055242dc62>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <176265146623.33229.14392217448285890815@10055242dc62>
X-ClientProxiedBy: LO6P123CA0051.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:310::7) To SJ0PR11MB4845.namprd11.prod.outlook.com
 (2603:10b6:a03:2d1::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4845:EE_|PH0PR11MB4824:EE_
X-MS-Office365-Filtering-Correlation-Id: 8705a4cd-91a0-4eb9-39e8-08de206c5c13
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|1800799024|10070799003|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?fOWK/xqr8lc2Jll5V0PPtyG4RQ1nF6CbiGQb9u6iCQ73cT/S8P1UHG3UCoBs?=
 =?us-ascii?Q?elrr8S6GRto9GNS+WMnnpYUA/Et0Z4pvgIALt7xTiTyCZx1+LElyDELxm+5o?=
 =?us-ascii?Q?BjEaLG1v1WENOQHMzkmdBYFq3KWPJZs8LLZFfzDWMRhDpgZKr4nWKuZZWKJY?=
 =?us-ascii?Q?9Oh5g4PLiAza+3cFdjpX2lejG8QzznosY74IjmkiaTLjjALNKde0hKWqqpI2?=
 =?us-ascii?Q?nJOwAnxKe63jh4ESFb9SiUq48Ion/hTwnAeoIaey0tlJMN2J3YBr4RemEW6O?=
 =?us-ascii?Q?7c/SRNBeSXQWpSM7KCtcTjnuCUuqlScL34AZSh3bH6ONIJG+fdg1GkDL3k17?=
 =?us-ascii?Q?JQxomlmVuOa7s1uu6HOAxW1qXpNq+o8WA6awZrtfRI07REYI0P54jhWFZG6t?=
 =?us-ascii?Q?PI1kkXgAoyxPQKMekmKAOKZYWyYry/3DrD2Gdkwfl54FgX4Vp/9BacCIs+uJ?=
 =?us-ascii?Q?HSjkMTss6Qayds5f2b5PwYDoGlCyRrzlUg1DwX9ZFAHJFLoRgvYxxVmvMemZ?=
 =?us-ascii?Q?cxNwNNm/TGRJuC1bJLcXSKlQ+xcAHYC6maKlOby3vtuY7X+zlbPWGrRGv60s?=
 =?us-ascii?Q?JjcuGw0dNJavfm3lgDSf7/ADK2w6QwS65tO327OuLpPwgy1KFJZZz7jZsx4U?=
 =?us-ascii?Q?knSeDyImvQ03qk1QLRQ7yD8Yj+h+hBiHoIiUgUxaJWI+0Cn9IAlInPZChVJa?=
 =?us-ascii?Q?BMswJcUsHX4DqFKeBwfPbovZZ1qCNCjHW2jS6JqHK1x6slssenUNqrhKQvx3?=
 =?us-ascii?Q?XUq8v5SegdZHcm04zRllIwM9n6xyh0l11DDnkmjnRuh6hc/HX5kBx3kIr5La?=
 =?us-ascii?Q?NLy0ZoXHtaqS2IpMK2pDNjWq/NNT/URUkDHxDAfTD+40JMby63a4os/eEck7?=
 =?us-ascii?Q?aWIzShOTZidy1frkilaK6EsWRNeCyIiSOFkQkfFzJ3r0rDlFV5BNXGn6tJFe?=
 =?us-ascii?Q?VtiM5Su0PrdFSYYpxrj7ao69WTmE1WS7WVTqH4A73DHp1f04hMznpGXa1Hy6?=
 =?us-ascii?Q?2Qrt5TmC6brvSVnujNZQxG9GSY3GjS6ojpe71J5Dm2OYxoZSswAMQdql//1E?=
 =?us-ascii?Q?huCmpnGzVZPBqXa8nvl3iFOY0ZoA6EI6xDi4ZgOmojoKm6y17iqt1SiavKX1?=
 =?us-ascii?Q?/Mot4v2mlf2RM0i6/JJJdwl0rjUQpwzWqX6GKhwafFNUAd0FnTxCqzoSp5Gr?=
 =?us-ascii?Q?es/8pYfRhZHKafstnIaYmrFQQheOLSXIxAR4jIGspBe1Gl/1xT7QAmTwPtvp?=
 =?us-ascii?Q?0tmV4h/gJsk974LvepbrjYRPuex/O3xj7TmOXug2HAhfJD5vvrEhbir8fmPq?=
 =?us-ascii?Q?OuCkV9xtEhSbzuqIHZ2Ao5/PjjErPnfMtZ6rrt0nccJO31tCq4qbONsuUP3Y?=
 =?us-ascii?Q?uqihciKfZtfQ89cIACF4Uh0Z2X9bngGBuiiZjeb+NTp6IKNBLw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB4845.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(10070799003)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?qhdOBBR0H/3zrEeqFI+hXU8fCln2iaU5JMyN/X0dUzcThj46haa7Akgo36qc?=
 =?us-ascii?Q?J5sRQVFZBWkbDPsat1baqwrIVoGxEIm2fdWvIn3im24JwbT9WcphEk6p0hI2?=
 =?us-ascii?Q?F/NaUPU/vRcgpWXb9j3BPPCdqQxTywMWhk5/OMdDFX/Cy3WweHOgd2De/ajz?=
 =?us-ascii?Q?Mv9zbCIQaHXo17zrkFF0EXFKvVMJLJakmac04vT4GAAPaOJERgnsqi2S4e6S?=
 =?us-ascii?Q?t8kRngPzEGZblmWPVye/OQ8T7hFqLWw+mPNzVR5QAa9g7rQSgDeaRuHHn8+4?=
 =?us-ascii?Q?L5rZo5IVFTroA7dyg7fNXQWhdrGDGNI8l7JyCcOmKh7XY37yM25RFrVnZmUR?=
 =?us-ascii?Q?XE7pmn3iZufZAeazTImP8RMEWq2xY/EJo7Bgc9NjnbIfCtUanF670nujk2Wa?=
 =?us-ascii?Q?eJhqtoVPynVHi77R/M4rUNDSF0C0MI/7MR4jYJxNvq7j7geNMOLycsBVWXDC?=
 =?us-ascii?Q?yWUCJIjS6+qle3KOdghxBpmkNcri/ZI04afPqro/tfGR26fMJi2IYUXUn+xV?=
 =?us-ascii?Q?vlywr2apEGKWEIJmTRXfxo7qYBFWG+yBTthDlPidLGDQNVWqxZQR9McwYn8q?=
 =?us-ascii?Q?LAlQA3EKYJcxkb+o8ZfxR36Pa6EfMmRJMLQDutsPF/VunML9tU3CWm/UomrJ?=
 =?us-ascii?Q?uKUZ5vIUHA43iGOYkQsxtHj7iyg5nAwguvnbMKAyo6LdOeQIUEmAipx8A1Bb?=
 =?us-ascii?Q?CdxEFxg0bnkvE4zBNTx9+0dIwelnAgPJSbWZPENeeFdvyVM2YR/IPHDpaUpA?=
 =?us-ascii?Q?srvCuN1gE/suYkmda5BKwQ/sLuOCurggtOt/f0C3ZgotiKK45M5NZ25UaXTX?=
 =?us-ascii?Q?ITQ/bAV9P64I5uM0PWe0e/R0Sa6A0T1t7m1k1Ki9l85OIKhvvGqmhV82aHwO?=
 =?us-ascii?Q?1CI+mgoHwclw6PdZ75Q66fiXjQ4LQhXYdJUUciAXV6qX71iow8gITRZD1+lF?=
 =?us-ascii?Q?x/bj41GODtVsIRY91z48MD2LLV+kRb+LuaK5d2elRBeDwhXnaHr1PUFA5V/s?=
 =?us-ascii?Q?paL+QIQCynY5aKf3HeczVinnKlEmJCjafPGbOtA0PnPfVyC97R6m5iZKkFA6?=
 =?us-ascii?Q?OwSpilUqPqFd+fLwB7ODg0Hooq052GzCTF4RUBuK3O8LBwq/kokors+0zw5w?=
 =?us-ascii?Q?cPrQyNyx91nkOl8P3KCK1QlTBL3UmnlzzccyqAss3bPKXKDNmymxqoYJZiQ2?=
 =?us-ascii?Q?nO691PYBcrpFuxVyyOpt/vzlMUs8XmQb0r87r/yrkNIQ5jTsl65Lx7FEGqGA?=
 =?us-ascii?Q?2Zo/4GpAqP0NkGT1r9ymPumouoNYixMQYLgYnv0KKCX+4Rzd7Psy7mCcIrWU?=
 =?us-ascii?Q?2X0Kp4cQcQ1f/hJCi4hIx3AJ6y8EF02d3UMiR/GrSStJsXj63XMYk3TWmdLv?=
 =?us-ascii?Q?2WEv9hZxyDQEDdjtdSRvo1IOCzsbQYJP6BdWnBZ8feOBwxmbnjZJf3VR0A1e?=
 =?us-ascii?Q?sc48fAtIGZX53VcbZZzJI+/T8Y9GkA2pFttbzK+61x3+shehFn67uRCwXlOJ?=
 =?us-ascii?Q?TnYTpFggCC4Y03Fsp1lma6oDeJs/P0OoqLTkgcCJwI3nmnwKJGLFyE996FmI?=
 =?us-ascii?Q?J6yYZc0MhrN+hScRR718eKcJQfIpsZvPof9HdR77C9xzGTUt8ZixBpg7cQQe?=
 =?us-ascii?Q?N0W5zcXqFVxBdCuCA1llkxAGzBsKNWDZ3nqjJpncJAMy?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8705a4cd-91a0-4eb9-39e8-08de206c5c13
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4845.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2025 15:18:10.9153 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r1z4TjItS+/cKInUt/76eVRRRP0JnQzcXsezhTMDA91WrpEcfRgmUGKyu6zWrjHrL2KrKnrnm98W0pDPbgLE3Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4824
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
Reply-To: imre.deak@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Hi Matthew,

could you check the failure below?

On Sun, Nov 09, 2025 at 01:24:26AM +0000, Patchwork wrote:
> == Series Details ==
> 
> Series: drm/i915/dp_mst: Disable Panel Replay
> URL   : https://patchwork.freedesktop.org/series/157224/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from xe-4068-35cd059ed9ec8f39c25a160137ba85a150349160_FULL -> xe-pw-157224v1_FULL
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with xe-pw-157224v1_FULL absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in xe-pw-157224v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
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
>   Here are the unknown changes that may have been introduced in xe-pw-157224v1_FULL:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0:
>     - shard-adlp:         NOTRUN -> [ABORT][1] +5 other tests abort
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157224v1/shard-adlp-3/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0.html

It's a memory corruption detected in drm_syncobj_create() AFAICS when
kmallocing a drm_syncobj object. Since the corruption is a 0x6a value
instead of the expected 0x6b object-free-marker value in the first byte
of the object, this looks like a drm_syncobj refcounting issue, i.e. an
extra drm_syncobj_put() somewhere (or lack of a corresponding get).

The issue is not related to change in the patch, but since I checked the
error and noticed your recent "drm/xe: Enforce correct user fence
signaling order using" commit, thought you may have an idea of the root
cause. In the recent CI runs I don't see the issue any more, so it
could've been also fixed already.

>   * igt@kms_flip@nonexisting-fb-interruptible@c-hdmi-a1:
>     - shard-adlp:         NOTRUN -> [DMESG-WARN][2] +1 other test dmesg-warn
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157224v1/shard-adlp-4/igt@kms_flip@nonexisting-fb-interruptible@c-hdmi-a1.html
> 
>   * igt@kms_frontbuffer_tracking@psr-slowdraw:
>     - shard-dg2-set2:     NOTRUN -> [ABORT][3]
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157224v1/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-slowdraw.html
> 
>   * igt@xe_evict@evict-small-external:
>     - shard-dg2-set2:     [PASS][4] -> [ABORT][5]
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4068-35cd059ed9ec8f39c25a160137ba85a150349160/shard-dg2-436/igt@xe_evict@evict-small-external.html
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157224v1/shard-dg2-436/igt@xe_evict@evict-small-external.html
> 
>   * igt@xe_exec_system_allocator@many-stride-mmap-shared-nomemset:
>     - shard-bmg:          NOTRUN -> [ABORT][6] +2 other tests abort
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157224v1/shard-bmg-7/igt@xe_exec_system_allocator@many-stride-mmap-shared-nomemset.html
> 
>   * igt@xe_exec_system_allocator@threads-many-stride-malloc-fork-read-after:
>     - shard-bmg:          [PASS][7] -> [ABORT][8] +2 other tests abort
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4068-35cd059ed9ec8f39c25a160137ba85a150349160/shard-bmg-6/igt@xe_exec_system_allocator@threads-many-stride-malloc-fork-read-after.html
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157224v1/shard-bmg-5/igt@xe_exec_system_allocator@threads-many-stride-malloc-fork-read-after.html
> 
>   * igt@xe_module_load@reload-no-display:
>     - shard-lnl:          [PASS][9] -> [ABORT][10] +2 other tests abort
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4068-35cd059ed9ec8f39c25a160137ba85a150349160/shard-lnl-1/igt@xe_module_load@reload-no-display.html
>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157224v1/shard-lnl-5/igt@xe_module_load@reload-no-display.html
> 
>   
> #### Warnings ####
> 
>   * igt@kms_big_fb@linear-32bpp-rotate-90:
>     - shard-adlp:         [SKIP][11] ([Intel XE#316]) -> [ABORT][12]
>    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4068-35cd059ed9ec8f39c25a160137ba85a150349160/shard-adlp-3/igt@kms_big_fb@linear-32bpp-rotate-90.html
>    [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157224v1/shard-adlp-8/igt@kms_big_fb@linear-32bpp-rotate-90.html
> 
>   * igt@kms_ccs@crc-primary-rotation-180-y-tiled-ccs:
>     - shard-dg2-set2:     [SKIP][13] ([Intel XE#455] / [Intel XE#787]) -> [ABORT][14]
>    [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4068-35cd059ed9ec8f39c25a160137ba85a150349160/shard-dg2-434/igt@kms_ccs@crc-primary-rotation-180-y-tiled-ccs.html
>    [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157224v1/shard-dg2-433/igt@kms_ccs@crc-primary-rotation-180-y-tiled-ccs.html
> 
>   * igt@kms_ccs@crc-primary-rotation-180-y-tiled-ccs@pipe-a-hdmi-a-6:
>     - shard-dg2-set2:     [SKIP][15] ([Intel XE#787]) -> [ABORT][16]
>    [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4068-35cd059ed9ec8f39c25a160137ba85a150349160/shard-dg2-434/igt@kms_ccs@crc-primary-rotation-180-y-tiled-ccs@pipe-a-hdmi-a-6.html
>    [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157224v1/shard-dg2-433/igt@kms_ccs@crc-primary-rotation-180-y-tiled-ccs@pipe-a-hdmi-a-6.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-move:
>     - shard-bmg:          [SKIP][17] ([Intel XE#2312]) -> [ABORT][18]
>    [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4068-35cd059ed9ec8f39c25a160137ba85a150349160/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-move.html
>    [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157224v1/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-move.html
> 
>   * igt@kms_frontbuffer_tracking@psr-slowdraw:
>     - shard-adlp:         [SKIP][19] ([Intel XE#653]) -> [ABORT][20]
>    [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4068-35cd059ed9ec8f39c25a160137ba85a150349160/shard-adlp-4/igt@kms_frontbuffer_tracking@psr-slowdraw.html
>    [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157224v1/shard-adlp-9/igt@kms_frontbuffer_tracking@psr-slowdraw.html
> 
>   * igt@xe_exec_system_allocator@process-many-large-mmap-new-race-nomemset:
>     - shard-adlp:         [SKIP][21] ([Intel XE#4915]) -> [ABORT][22]
>    [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4068-35cd059ed9ec8f39c25a160137ba85a150349160/shard-adlp-8/igt@xe_exec_system_allocator@process-many-large-mmap-new-race-nomemset.html
>    [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157224v1/shard-adlp-6/igt@xe_exec_system_allocator@process-many-large-mmap-new-race-nomemset.html
> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in xe-pw-157224v1_FULL that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@kms_chamelium_frames@hdmi-crc-planes-random:
>     - shard-adlp:         NOTRUN -> [SKIP][23] ([Intel XE#373])
>    [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157224v1/shard-adlp-2/igt@kms_chamelium_frames@hdmi-crc-planes-random.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen:
>     - shard-adlp:         NOTRUN -> [SKIP][24] ([Intel XE#651])
>    [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157224v1/shard-adlp-3/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen.html
> 
>   * igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-reopen:
>     - shard-adlp:         NOTRUN -> [SKIP][25] ([Intel XE#688])
>    [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157224v1/shard-adlp-3/igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-reopen.html
> 
>   * igt@xe_exec_system_allocator@many-stride-mmap-prefetch:
>     - shard-adlp:         NOTRUN -> [SKIP][26] ([Intel XE#4915]) +6 other tests skip
>    [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157224v1/shard-adlp-4/igt@xe_exec_system_allocator@many-stride-mmap-prefetch.html
> 
>   * igt@xe_oa@unprivileged-single-ctx-counters:
>     - shard-adlp:         NOTRUN -> [SKIP][27] ([Intel XE#3573])
>    [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157224v1/shard-adlp-3/igt@xe_oa@unprivileged-single-ctx-counters.html
> 
>   * igt@xe_vm@out-of-memory:
>     - shard-adlp:         NOTRUN -> [SKIP][28] ([Intel XE#5745])
>    [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157224v1/shard-adlp-3/igt@xe_vm@out-of-memory.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@xe_vm@compact-64k-pages:
>     - shard-adlp:         [ABORT][29] -> [PASS][30] +4 other tests pass
>    [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4068-35cd059ed9ec8f39c25a160137ba85a150349160/shard-adlp-9/igt@xe_vm@compact-64k-pages.html
>    [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157224v1/shard-adlp-3/igt@xe_vm@compact-64k-pages.html
> 
>   * igt@xe_vm@mixed-userptr-binds-3145728:
>     - shard-bmg:          [ABORT][31] -> [PASS][32]
>    [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4068-35cd059ed9ec8f39c25a160137ba85a150349160/shard-bmg-1/igt@xe_vm@mixed-userptr-binds-3145728.html
>    [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157224v1/shard-bmg-8/igt@xe_vm@mixed-userptr-binds-3145728.html
> 
>   * igt@xe_vm@unbind-all-2-vmas:
>     - shard-dg2-set2:     [ABORT][33] -> [PASS][34]
>    [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4068-35cd059ed9ec8f39c25a160137ba85a150349160/shard-dg2-466/igt@xe_vm@unbind-all-2-vmas.html
>    [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157224v1/shard-dg2-435/igt@xe_vm@unbind-all-2-vmas.html
> 
>   
> #### Warnings ####
> 
>   * igt@kms_ccs@crc-primary-rotation-180-y-tiled-ccs:
>     - shard-adlp:         [ABORT][35] -> [SKIP][36] ([Intel XE#455] / [Intel XE#787])
>    [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4068-35cd059ed9ec8f39c25a160137ba85a150349160/shard-adlp-4/igt@kms_ccs@crc-primary-rotation-180-y-tiled-ccs.html
>    [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157224v1/shard-adlp-2/igt@kms_ccs@crc-primary-rotation-180-y-tiled-ccs.html
> 
>   * igt@kms_ccs@crc-primary-rotation-180-y-tiled-ccs@pipe-a-hdmi-a-1:
>     - shard-adlp:         [ABORT][37] -> [SKIP][38] ([Intel XE#787])
>    [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4068-35cd059ed9ec8f39c25a160137ba85a150349160/shard-adlp-4/igt@kms_ccs@crc-primary-rotation-180-y-tiled-ccs@pipe-a-hdmi-a-1.html
>    [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157224v1/shard-adlp-2/igt@kms_ccs@crc-primary-rotation-180-y-tiled-ccs@pipe-a-hdmi-a-1.html
> 
>   
>   [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
>   [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
>   [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
>   [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
>   [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
>   [Intel XE#4915]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915
>   [Intel XE#5745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5745
>   [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
>   [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
>   [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
>   [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
> 
> 
> Build changes
> -------------
> 
>   * Linux: xe-4068-35cd059ed9ec8f39c25a160137ba85a150349160 -> xe-pw-157224v1
> 
>   IGT_8613: b542242f5b116e3b554b4068ef5dfa4451075b2b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   xe-4068-35cd059ed9ec8f39c25a160137ba85a150349160: 35cd059ed9ec8f39c25a160137ba85a150349160
>   xe-pw-157224v1: 157224v1
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157224v1/index.html
