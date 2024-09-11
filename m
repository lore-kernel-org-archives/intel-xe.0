Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F33CEE57D0
	for <intel-xe@archiver.kernel.org>; Wed, 11 Sep 2024 19:53:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BA7D10E0BF;
	Wed, 11 Sep 2024 19:53:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mHN6iDgB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7A8910E0BF
 for <intel-xe@lists.freedesktop.org>; Wed, 11 Sep 2024 19:53:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726084384; x=1757620384;
 h=date:from:to:subject:message-id:references:in-reply-to:
 mime-version; bh=LJ8e9ZGdSlx7RZP3e95LJhVPqSzerx0qeEMWaEWgJvE=;
 b=mHN6iDgB3VczeauzNJhGD6LlBpjSuY0662cbtkJZ4N8FlXuDIGTkGd2m
 sTPmL4ufkVZwb9FUxLnkuCf2i8dLvDqZzc9RGIO6FP+lGxdglbNz7TzwJ
 83MBYpUewQ9KUpYocI/au0PXax2gRRUmEywmrek00vcoYHWbJtrC39M22
 QywmJDkYDwDH1vDWtvh2NbQN3qADgL5c+OgQosbG1mygmNbzvFYLrkKtg
 +QwruSOQ4bM2/tOTir8yT59SZoi/nflBwSI5Wk1lYEm9VSeYe0zPn7JG+
 dN/eRJ8JhjbtGj/+lRlMlfVhIZ/Rj4kvjRwUIRntLq4IDmUZXegxQwna8 g==;
X-CSE-ConnectionGUID: dXJiF3jXQzygkDRjUAvr0A==
X-CSE-MsgGUID: obvcpmwZSy27ZHrOPKindQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11192"; a="28793758"
X-IronPort-AV: E=Sophos;i="6.10,220,1719903600"; d="scan'208";a="28793758"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2024 12:53:04 -0700
X-CSE-ConnectionGUID: +cIt/is8TGWBZQCtT+sXfg==
X-CSE-MsgGUID: nLKxRPN8TGi3yRIgX31clg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,220,1719903600"; d="scan'208";a="67310267"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Sep 2024 12:53:04 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 11 Sep 2024 12:53:03 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 11 Sep 2024 12:53:03 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.44) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 11 Sep 2024 12:53:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uZNyrBVn1M7/ioPhTvCiOToVcrnSHywXHRoskAX+oZXdwRBBHmLls71+EMfAFLZlKelM3F9Z5bU/5Clt/GyDOPvP4QXrhlvCgxgZJLM2cVGj+5biNAqsBW6ZgOzal/2FUb7IjWWxpM4UYPu1v7Ed/wWoGEnKsnzHJ7hHWE2FKxb0MEwHyaQ0baQcPLA20LejAqcenv9ALlhIvuuIiyIMgQE5Ykl8uqBOSr+WD9+HSL0a2j0dLG2KK3Aos9aj7M/qYyYSTQyiL/aSVmGRSUni65ix3DmsqHeho68JwOWDZTl7nKCsaO7fPEK96LwJ+rLGhohhvumG+R7mEHWwOyJ1tA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dI974D7BPr2wTED+EnH2wOWGexQurRkdM0m/8/eZAJ4=;
 b=T6btCdzBvtT/HAYPKWeoC7ayNPqVTL9SwepAKjDk4JbJNlVp6mK6l0hcX5d6LSSKmmeX1HU42OoVAdy4Qr7z2xWtzVB/OaVbbHlpALlDp12dHWulD19q+AxwZmMKxSGzAdPKNtLppMVnO6FKqL6pEWNupX9f/+74OJ7ZfdF5+oR9jiOR+AGl+KvE0KeIT6SNXwpbUWMJ+u5mWqJZGVNpsPbapG11vAxHdCkYhvRMK3vYjJHZN2UKrzE0oXXBaAwDzmLHFQs2lfcnfsEfWImYCAJQeyWSdNf+mL1AvABelogC1CsOqZYyHNRfZaHkYriLx2uqI+YLTj48PJXILkPCTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by PH0PR11MB7422.namprd11.prod.outlook.com (2603:10b6:510:285::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.24; Wed, 11 Sep
 2024 19:52:59 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%6]) with mapi id 15.20.7962.016; Wed, 11 Sep 2024
 19:52:58 +0000
Date: Wed, 11 Sep 2024 12:52:54 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: Re: =?utf-8?B?4pyXIENJLkZVTEw6IGZhaWx1cg==?= =?utf-8?Q?e?= for Stop
 using xe_gt as a register MMIO target (rev3)
Message-ID: <20240911195254.GH5774@mdroper-desk1.amr.corp.intel.com>
References: <20240910234719.3335472-45-matthew.d.roper@intel.com>
 <172602471753.983471.17020027383128250466@2413ebb6fbb6>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <172602471753.983471.17020027383128250466@2413ebb6fbb6>
X-ClientProxiedBy: SJ0PR03CA0095.namprd03.prod.outlook.com
 (2603:10b6:a03:333::10) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|PH0PR11MB7422:EE_
X-MS-Office365-Filtering-Correlation-Id: 8f40f75a-c89c-4b9e-a1d1-08dcd29b55a7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Z0HMkdSNMkm9vBevdWcowPnaJr0lJku/pXZRkEoTCQsHWS5tX6hxP0MDGKHT?=
 =?us-ascii?Q?OkKfrNV5oYB27K/f2ySjNTqnztiI31Jl5SNfk9tsHhg00LlWWw2iw+quCYEa?=
 =?us-ascii?Q?5uNmok8HsrXHSZWL+XSbsyICKnNkgMo25VNJa/uEMEn5AkSDSkNw7KiWbWHm?=
 =?us-ascii?Q?apx6YqEV66dOEy21ZFEzgyigAb7I63ovGko5hofkTBM4sJV4954uGfIbTFow?=
 =?us-ascii?Q?yFXp0Z0XCVU8V/JtgJZkrZAtU0u1dXkk4PpdQ1F0aqV8T2PTL7ybP/OVRYzT?=
 =?us-ascii?Q?0CstJ5NcdHfUfWZ3bChPXRdS65K0EmNgTHOE0N3Ty81KHkzYn3z04VrCKDNt?=
 =?us-ascii?Q?79j04zfIrGZ+TtXydKCDaFptvitwaJS8IW+P5sMCyatzd/fW+RJT7Gtk/bh9?=
 =?us-ascii?Q?/sxqaBl7L/6YF1L8o7U/7WxDCxhlr4074L9tp2iF3WG4z+b4zowS0biiw+J7?=
 =?us-ascii?Q?Y2MdMIEK00MgeEaxKObWJMiiVQdM/1/MkGJ2HVDz68A6NoPyspIZ7Sulgnea?=
 =?us-ascii?Q?C5yQLQyxtMR+FpdacH4zO3CRTDL0BK+J7xM3NO/BoLqfmi/vv4OzQIDhAL3W?=
 =?us-ascii?Q?dMlQFP6UWGpBhQUNC9AjvwrPmW96xgdvJFgRAA44qv/QIKXMGRzjoaTnJIB/?=
 =?us-ascii?Q?rMyXQrdhw2fS6CHcFtX5Po+rtavVtC/XYNIozQ4lnHzMIV02V2SLRruQy71z?=
 =?us-ascii?Q?UDhv4LwBAhIXWf1cCJlR0hXTN5fMetGNkV7v0C5wceR0BV0OdYDP46Sdud9j?=
 =?us-ascii?Q?8ZTKjn3jFFo7wTsAQfWQR5LzQumijjDDstQZv2Lz+A1/ICI947HeKyzp/HGj?=
 =?us-ascii?Q?BLLQItrHrYvW82ZUg+Gyw2vVZx8kDsR5a8Ud7uwVG7QBxQ7ckcfzbM7vSAob?=
 =?us-ascii?Q?lQgdpfVa1Ks/+kxTKUGnRFUGtvfjA08WNSPnuTlosrJ0tvrHdkhjXcTSkrke?=
 =?us-ascii?Q?FE8hjgsHjgnNZQ+cCLsX+/KDbZK7QYsqKDIzHjsT57+nPPVbdaDWWOUHvEfO?=
 =?us-ascii?Q?THU/tW8VMLP4OwsNx7EMzwYe+zh489cYQ1RciwxnpZpCfuJsU/OWhzmLJUQw?=
 =?us-ascii?Q?/EhzcvXydoXsmee6g5OnQhia6pEGEkhwLDWm2ekLTTikl7RenKj3dnnSvu1y?=
 =?us-ascii?Q?5H8OPUA8gMZHtTOXfow6qjL/ybIHOLkQ06RB9HINRyuIP9Pt0+8ci5n1SJSN?=
 =?us-ascii?Q?XFt2MbM5ykE9dNccdFpEhavqZq9Cwrq8eNqsGsxfza7O/YTOmfewCPWIIfqo?=
 =?us-ascii?Q?YW2pjFBeyHXgxfsnJAsTEcrEq64qMRNJ6D1JMh7OlTwwhTvG+0HLNgF7fHBH?=
 =?us-ascii?Q?ybI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?BrmnU+RcLBvoUozlIt4ZsQuAD84S/WvfWLRn6KTxZ4BLX2FVKl+K/ZC0UoSa?=
 =?us-ascii?Q?+9LZLdI2VHaIvWiX7rJ2Zw0HM291tM0jOrWFsSJP/mXtBtguvhUAvwG0kVOM?=
 =?us-ascii?Q?KdxBn+tmIumsaHmDlpaaQsbErt14IzQUs9tvuRPvoi9d2c5PlgsD2Ixp4LEF?=
 =?us-ascii?Q?ym8c+x0HeDNK0w1ZVmbU721aPovga8LBnkJSqdPLf3ehS4g907MKeMCf64wo?=
 =?us-ascii?Q?iaWvdTWyUB41x8ccBzwbge1xV7CQ917R542m3+yUUxoC0V7cAT8akU8dHuDI?=
 =?us-ascii?Q?WVKLaAiR37OTIbVg647A/+JUiSnwwXo52vVw2QnXe95FE86pi80SC8r7wHgF?=
 =?us-ascii?Q?yugoDAwC/ZRc3uCyFzaBVLbTGb1okbuzanDPcWd8b84Sqd2es5wnQh+b63wF?=
 =?us-ascii?Q?UU4q6nAHqR8rIAHJM1lceNJfXXqjfkB7fN9Gny366tjY4jKy71ZYiax52Dtm?=
 =?us-ascii?Q?D6swjwBsZWK0MlO+YN9Ei5itBDsInVzakWONZ6z0OR7vgFWmjUN2o0+y9cdz?=
 =?us-ascii?Q?vXU2PZ2SfT30p+043PtcBbNUd+PIf3dEJwTJvN2jXe/UTSuHPn663ZD95LR9?=
 =?us-ascii?Q?VPglHz+V18xK1HGgWRnJ03tI5POWI55HeDVSco+/bWi83qM5aTCkIrnIX4aD?=
 =?us-ascii?Q?JCBwmPpfhEZdC7IF2ptDi+i4Y15N9dYW3g/CZV4ltkPJH23FJfj5WXWyyb3c?=
 =?us-ascii?Q?tJBbP/XulyRBgNk2hXIqRd4IUoyRv/MS03jQweUW+P804PthicBUboSrGYkw?=
 =?us-ascii?Q?HBSrU3CWshrBczP2wg/nlgCp36JbBZs6N7FyHK1dYlKKFs700LU6pqeu3zBA?=
 =?us-ascii?Q?O6DWHO+/DR642g+wGI1O1eZlQ8nK9NqprUZTwNSntQT2cT/GqdBDOMHeRu0m?=
 =?us-ascii?Q?a8G+EDNfFJ94pXsgZd9nHTJUL4mzcVcfxth9Oq2IaVWfFOjQIUjqhN4H+aJw?=
 =?us-ascii?Q?HQvyzHmocWOAjNBaQaBYmN1KJ31d957ox6RDpqkrqj+he9s3/YW55t/+iEnV?=
 =?us-ascii?Q?I/ovg4VC395t5vkkA/88rSon8qSHVCCYu7vDccOK4PXviWHgRkf1onqAFeJ6?=
 =?us-ascii?Q?aK9aaPfZShC8hcucIR003WHOvnZRGKvT+9g8XbmPAiAon8wP3lEOjI1IKs9s?=
 =?us-ascii?Q?5zPD7gwjiz27Es45LE7mbD6fEo6IYBwyF1WaLy2VQ1svcj2qcPYPGRWrPYxa?=
 =?us-ascii?Q?4d8iwoB73tBYbYRbdCErORoRpTBBb3zqT9vFr0XuJi1LRWqa/YWvsvqunwiL?=
 =?us-ascii?Q?lVeywetPjI2JXyr6eXBh0rhZhi4/c7aUJXXi6/W8/pGhCzZRJfr2KQUmZ6Cs?=
 =?us-ascii?Q?jkBMYHP1hXzqU4qs57MRQrsPx2bmPWguz/heLP9htU+9yr9afjSWlzWUM4cm?=
 =?us-ascii?Q?EoeNIb+nRIyBQ37a/VQKV69DZsRlfYOVHh34T+T23ogHTH56+ONXShfOd8Qd?=
 =?us-ascii?Q?KZw4QbC8v4hD+a3nI7xXc38up4+4PiymYMYNWkiMahdKNTQBEr99SlV/tpPp?=
 =?us-ascii?Q?K2JuSOTxIxfJipd/VmyKF45hNhcpELtJzoZxdW/VVyemcwKGw5A4ubAPjf7H?=
 =?us-ascii?Q?lRJ8g1YkRxH2R9exwGcsGkqEhuHA0bRmMLuy28zguupiSLoKtM2Ym5QB5fBd?=
 =?us-ascii?Q?9w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f40f75a-c89c-4b9e-a1d1-08dcd29b55a7
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2024 19:52:58.1712 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ElqHNEiDCFTWb9S7uIvASXZ1sp3p4KK65zj9OsARpNYZbo4zbQSeJnDsEXCY4DYRQya/5arpA16xlg6tg+NhR4CneZ6c5aMV7GleX190Wx8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7422
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

On Wed, Sep 11, 2024 at 03:18:37AM +0000, Patchwork wrote:
> == Series Details ==
> 
> Series: Stop using xe_gt as a register MMIO target (rev3)
> URL   : https://patchwork.freedesktop.org/series/138168/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3_full -> xe-pw-138168v3_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with xe-pw-138168v3_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in xe-pw-138168v3_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
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
>   Here are the unknown changes that may have been introduced in xe-pw-138168v3_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt:
>     - shard-lnl:          NOTRUN -> [CRASH][1] +6 other tests crash
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138168v3/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html

Starting subtest: fbcpsr-1p-primscrn-spr-indfb-draw-blt
Received signal SIGSEGV.

Already tracked at https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/2749

> 
>   * igt@kms_psr2_sf@fbc-overlay-primary-update-sf-dmg-area:
>     - shard-lnl:          NOTRUN -> [FAIL][2] +1 other test fail
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138168v3/shard-lnl-6/igt@kms_psr2_sf@fbc-overlay-primary-update-sf-dmg-area.html

Also a SIGSEGV.  Seems this test wasn't being run before (or was
skipping due to lack of PSR2 panel).  The failure now that we have a
proper panel attached doesn't appear to be related to the MMIO changes
here.

> 
>   * igt@kms_psr@fbc-psr-sprite-plane-onoff:
>     - shard-lnl:          NOTRUN -> [WARN][3] +1 other test warn
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138168v3/shard-lnl-6/igt@kms_psr@fbc-psr-sprite-plane-onoff.html

Same as above.


Matt

> 
>   
> #### Suppressed ####
> 
>   The following results come from untrusted machines, tests, or statuses.
>   They do not affect the overall result.
> 
>   * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp2:
>     - {shard-bmg}:        [PASS][4] -> [FAIL][5]
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3/shard-bmg-7/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp2.html
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138168v3/shard-bmg-8/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp2.html
> 
>   * igt@kms_plane_scaling@planes-scaler-unity-scaling:
>     - {shard-bmg}:        NOTRUN -> [INCOMPLETE][6] +2 other tests incomplete
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138168v3/shard-bmg-2/igt@kms_plane_scaling@planes-scaler-unity-scaling.html
> 
>   
> New tests
> ---------
> 
>   New tests have been introduced between xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3_full and xe-pw-138168v3_full:
> 
> ### New IGT tests (30) ###
> 
>   * igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-a-hdmi-a-3:
>     - Statuses : 1 pass(s)
>     - Exec time: [18.95] s
> 
>   * igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-b-hdmi-a-3:
>     - Statuses : 1 pass(s)
>     - Exec time: [19.02] s
> 
>   * igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-3:
>     - Statuses : 1 pass(s)
>     - Exec time: [19.06] s
> 
>   * igt@kms_atomic_transition@plane-all-modeset-transition@pipe-b-hdmi-a-3:
>     - Statuses : 1 pass(s)
>     - Exec time: [19.04] s
> 
>   * igt@kms_atomic_transition@plane-all-transition-fencing@pipe-a-hdmi-a-3:
>     - Statuses : 1 pass(s)
>     - Exec time: [3.75] s
> 
>   * igt@kms_atomic_transition@plane-all-transition-fencing@pipe-b-hdmi-a-3:
>     - Statuses : 1 pass(s)
>     - Exec time: [3.75] s
> 
>   * igt@kms_atomic_transition@plane-all-transition-nonblocking-fencing@pipe-a-hdmi-a-3:
>     - Statuses : 1 pass(s)
>     - Exec time: [3.75] s
> 
>   * igt@kms_atomic_transition@plane-all-transition-nonblocking-fencing@pipe-b-hdmi-a-3:
>     - Statuses : 1 pass(s)
>     - Exec time: [3.75] s
> 
>   * igt@kms_atomic_transition@plane-all-transition-nonblocking@pipe-a-hdmi-a-3:
>     - Statuses : 1 pass(s)
>     - Exec time: [3.75] s
> 
>   * igt@kms_atomic_transition@plane-all-transition-nonblocking@pipe-b-hdmi-a-3:
>     - Statuses : 1 pass(s)
>     - Exec time: [3.75] s
> 
>   * igt@kms_atomic_transition@plane-all-transition@pipe-a-hdmi-a-3:
>     - Statuses : 1 pass(s)
>     - Exec time: [3.75] s
> 
>   * igt@kms_atomic_transition@plane-all-transition@pipe-b-hdmi-a-3:
>     - Statuses : 1 pass(s)
>     - Exec time: [3.75] s
> 
>   * igt@kms_atomic_transition@plane-primary-toggle-with-vblank-wait@pipe-a-hdmi-a-3:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.21] s
> 
>   * igt@kms_atomic_transition@plane-primary-toggle-with-vblank-wait@pipe-b-hdmi-a-3:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.21] s
> 
>   * igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-hdmi-a-3:
>     - Statuses : 1 pass(s)
>     - Exec time: [1.24] s
> 
>   * igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-b-hdmi-a-3:
>     - Statuses : 1 pass(s)
>     - Exec time: [1.27] s
> 
>   * igt@kms_atomic_transition@plane-use-after-nonblocking-unbind-fencing@pipe-a-hdmi-a-3:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.10] s
> 
>   * igt@kms_atomic_transition@plane-use-after-nonblocking-unbind-fencing@pipe-b-hdmi-a-3:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.10] s
> 
>   * igt@kms_atomic_transition@plane-use-after-nonblocking-unbind@pipe-a-hdmi-a-3:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.10] s
> 
>   * igt@kms_atomic_transition@plane-use-after-nonblocking-unbind@pipe-b-hdmi-a-3:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.09] s
> 
>   * igt@kms_plane_cursor@primary@pipe-b-dp-4-size-128:
>     - Statuses : 1 pass(s)
>     - Exec time: [2.86] s
> 
>   * igt@kms_plane_cursor@primary@pipe-b-dp-4-size-256:
>     - Statuses : 1 pass(s)
>     - Exec time: [2.85] s
> 
>   * igt@kms_plane_cursor@primary@pipe-b-dp-4-size-64:
>     - Statuses : 1 pass(s)
>     - Exec time: [2.88] s
> 
>   * igt@kms_plane_cursor@viewport@pipe-b-dp-4-size-128:
>     - Statuses : 1 pass(s)
>     - Exec time: [2.92] s
> 
>   * igt@kms_plane_cursor@viewport@pipe-b-dp-4-size-256:
>     - Statuses : 1 pass(s)
>     - Exec time: [2.88] s
> 
>   * igt@kms_plane_cursor@viewport@pipe-b-dp-4-size-64:
>     - Statuses : 1 pass(s)
>     - Exec time: [2.98] s
> 
>   * igt@kms_plane_multiple@tiling-none@pipe-a-dp-4:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.95] s
> 
>   * igt@kms_plane_multiple@tiling-none@pipe-b-dp-4:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.91] s
> 
>   * igt@kms_plane_multiple@tiling-none@pipe-c-dp-4:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.90] s
> 
>   * igt@kms_plane_multiple@tiling-none@pipe-d-dp-4:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.90] s
> 
>   
> 
> Known issues
> ------------
> 
>   Here are the changes found in xe-pw-138168v3_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-x:
>     - shard-adlp:         [PASS][7] -> [DMESG-WARN][8] ([Intel XE#1033])
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3/shard-adlp-2/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-x.html
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138168v3/shard-adlp-2/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-x.html
> 
>   * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
>     - shard-lnl:          NOTRUN -> [FAIL][9] ([Intel XE#1426]) +1 other test fail
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138168v3/shard-lnl-6/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
> 
>   * igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-6:
>     - shard-dg2-set2:     [PASS][10] -> [FAIL][11] ([Intel XE#1426]) +1 other test fail
>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3/shard-dg2-463/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-6.html
>    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138168v3/shard-dg2-435/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-6.html
> 
>   * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
>     - shard-adlp:         NOTRUN -> [SKIP][12] ([Intel XE#1124] / [Intel XE#1201]) +2 other tests skip
>    [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138168v3/shard-adlp-1/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html
> 
>   * igt@kms_big_fb@y-tiled-addfb:
>     - shard-lnl:          NOTRUN -> [SKIP][13] ([Intel XE#1467])
>    [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138168v3/shard-lnl-6/igt@kms_big_fb@y-tiled-addfb.html
> 
>   * igt@kms_big_fb@yf-tiled-8bpp-rotate-270:
>     - shard-lnl:          NOTRUN -> [SKIP][14] ([Intel XE#1124]) +2 other tests skip
>    [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138168v3/shard-lnl-1/igt@kms_big_fb@yf-tiled-8bpp-rotate-270.html
> 
>   * igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:
>     - shard-adlp:         NOTRUN -> [SKIP][15] ([Intel XE#1201] / [Intel XE#2191]) +1 other test skip
>    [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138168v3/shard-adlp-6/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html
> 
>   * igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][16] ([Intel XE#1201] / [Intel XE#2191])
>    [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138168v3/shard-dg2-466/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html
> 
>   * igt@kms_bw@linear-tiling-4-displays-2560x1440p:
>     - shard-lnl:          NOTRUN -> [SKIP][17] ([Intel XE#1512])
>    [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138168v3/shard-lnl-1/igt@kms_bw@linear-tiling-4-displays-2560x1440p.html
> 
>   * igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs:
>     - shard-lnl:          NOTRUN -> [SKIP][18] ([Intel XE#1399]) +2 other tests skip
>    [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138168v3/shard-lnl-1/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs.html
> 
>   * igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-1:
>     - shard-adlp:         NOTRUN -> [SKIP][19] ([Intel XE#1201] / [Intel XE#787]) +17 other tests skip
>    [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138168v3/shard-adlp-6/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-1.html
> 
>   * igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc@pipe-d-hdmi-a-1:
>     - shard-adlp:         NOTRUN -> [SKIP][20] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +11 other tests skip
>    [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138168v3/shard-adlp-1/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc@pipe-d-hdmi-a-1.html
> 
>   * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][21] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +1 other test skip
>    [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138168v3/shard-dg2-466/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs.html
> 
>   * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs@pipe-a-dp-4:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][22] ([Intel XE#1201] / [Intel XE#787]) +6 other tests skip
>    [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138168v3/shard-dg2-466/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs@pipe-a-dp-4.html
> 
>   * igt@kms_chamelium_audio@dp-audio-edid:
>     - shard-lnl:          NOTRUN -> [SKIP][23] ([Intel XE#373]) +1 other test skip
>    [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138168v3/shard-lnl-1/igt@kms_chamelium_audio@dp-audio-edid.html
> 
>   * igt@kms_chamelium_color@degamma:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][24] ([Intel XE#1201] / [Intel XE#306])
>    [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138168v3/shard-dg2-466/igt@kms_chamelium_color@degamma.html
> 
>   * igt@kms_chamelium_hpd@dp-hpd-fast:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][25] ([Intel XE#1201] / [Intel XE#373])
>    [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138168v3/shard-dg2-466/igt@kms_chamelium_hpd@dp-hpd-fast.html
> 
>   * igt@kms_chamelium_hpd@hdmi-hpd:
>     - shard-adlp:         NOTRUN -> [SKIP][26] ([Intel XE#1201] / [Intel XE#373])
>    [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138168v3/shard-adlp-1/igt@kms_chamelium_hpd@hdmi-hpd.html
> 
>   * igt@kms_cursor_crc@cursor-onscreen-512x512:
>     - shard-adlp:         NOTRUN -> [SKIP][27] ([Intel XE#1201] / [Intel XE#308])
>    [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138168v3/shard-adlp-6/igt@kms_cursor_crc@cursor-onscreen-512x512.html
> 
>   * igt@kms_cursor_crc@cursor-rapid-movement-256x85:
>     - shard-lnl:          NOTRUN -> [SKIP][28] ([Intel XE#1424]) +1 other test skip
>    [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138168v3/shard-lnl-1/igt@kms_cursor_crc@cursor-rapid-movement-256x85.html
> 
>   * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions:
>     - shard-lnl:          NOTRUN -> [SKIP][29] ([Intel XE#309]) +2 other tests skip
>    [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138168v3/shard-lnl-1/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions.html
> 
>   * igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:
>     - shard-adlp:         NOTRUN -> [SKIP][30] ([Intel XE#1201] / [Intel XE#309]) +1 other test skip
>    [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138168v3/shard-adlp-6/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html
> 
>   * igt@kms_flip@2x-busy-flip:
>     - shard-adlp:         NOTRUN -> [SKIP][31] ([Intel XE#1201] / [Intel XE#310])
>    [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138168v3/shard-adlp-6/igt@kms_flip@2x-busy-flip.html
> 
>   * igt@kms_flip@2x-plain-flip-ts-check:
>     - shard-lnl:          NOTRUN -> [SKIP][32] ([Intel XE#1421]) +3 other tests skip
>    [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138168v3/shard-lnl-6/igt@kms_flip@2x-plain-flip-ts-check.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-default-mode:
>     - shard-lnl:          NOTRUN -> [SKIP][33] ([Intel XE#1401]) +3 other tests skip
>    [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138168v3/shard-lnl-6/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-default-mode.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling:
>     - shard-lnl:          NOTRUN -> [SKIP][34] ([Intel XE#1401] / [Intel XE#1745]) +3 other tests skip
>    [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138168v3/shard-lnl-6/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling:
>     - shard-adlp:         NOTRUN -> [SKIP][35] ([Intel XE#1201] / [Intel XE#455]) +4 other tests skip
>    [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138168v3/shard-adlp-6/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode:
>     - shard-adlp:         NOTRUN -> [DMESG-FAIL][36] ([Intel XE#324]) +1 other test dmesg-fail
>    [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138168v3/shard-adlp-1/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html
> 
>   * igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-x:
>     - shard-adlp:         [PASS][37] -> [FAIL][38] ([Intel XE#1874]) +2 other tests fail
>    [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3/shard-adlp-2/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-x.html
>    [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138168v3/shard-adlp-2/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-x.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-pgflip-blt:
>     - shard-adlp:         NOTRUN -> [SKIP][39] ([Intel XE#1201] / [Intel XE#651]) +3 other tests skip
>    [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138168v3/shard-adlp-1/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-pgflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-render:
>     - shard-adlp:         NOTRUN -> [SKIP][40] ([Intel XE#1201] / [Intel XE#656]) +3 other tests skip
>    [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138168v3/shard-adlp-1/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc:
>     - shard-dg2-set2:     [PASS][41] -> [FAIL][42] ([Intel XE#1332])
>    [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3/shard-dg2-433/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc.html
>    [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138168v3/shard-dg2-432/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-1p-pri-indfb-multidraw:
>     - shard-lnl:          NOTRUN -> [SKIP][43] ([Intel XE#651]) +4 other tests skip
>    [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138168v3/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcdrrs-1p-pri-indfb-multidraw.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-blt:
>     - shard-lnl:          NOTRUN -> [SKIP][44] ([Intel XE#656]) +8 other tests skip
>    [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138168v3/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-mmap-wc:
>     - shard-adlp:         NOTRUN -> [SKIP][45] ([Intel XE#1201] / [Intel XE#653]) +2 other tests skip
>    [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138168v3/shard-adlp-1/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-mmap-wc.html
> 
>   * igt@kms_hdr@static-toggle-suspend:
>     - shard-lnl:          NOTRUN -> [SKIP][46] ([Intel XE#1503] / [Intel XE#599])
>    [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138168v3/shard-lnl-1/igt@kms_hdr@static-toggle-suspend.html
> 
>   * igt@kms_plane@pixel-format:
>     - shard-adlp:         NOTRUN -> [INCOMPLETE][47] ([Intel XE#1035] / [Intel XE#1195])
>    [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138168v3/shard-adlp-6/igt@kms_plane@pixel-format.html
> 
>   * igt@kms_plane@pixel-format@pipe-a-plane-3:
>     - shard-adlp:         NOTRUN -> [WARN][48] ([Intel XE#2078]) +1 other test warn
>    [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138168v3/shard-adlp-6/igt@kms_plane@pixel-format@pipe-a-plane-3.html
> 
>   * igt@kms_plane_scaling@intel-max-src-size:
>     - shard-lnl:          NOTRUN -> [SKIP][49] ([Intel XE#599]) +1 other test skip
>    [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138168v3/shard-lnl-1/igt@kms_plane_scaling@intel-max-src-size.html
> 
>   * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:
>     - shard-dg2-set2:     [PASS][50] -> [FAIL][51] ([Intel XE#361])
>    [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3/shard-dg2-436/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html
>    [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138168v3/shard-dg2-463/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html
> 
>   * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-b-edp-1:
>     - shard-lnl:          NOTRUN -> [SKIP][52] ([Intel XE#2318]) +3 other tests skip
>    [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138168v3/shard-lnl-6/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-b-edp-1.html
> 
>   * igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:
>     - shard-lnl:          NOTRUN -> [SKIP][53] ([Intel XE#1439])
>    [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138168v3/shard-lnl-1/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html
> 
>   * igt@kms_properties@connector-properties-legacy:
>     - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][54] ([Intel XE#1195]) +1 other test incomplete
>    [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138168v3/shard-dg2-466/igt@kms_properties@connector-properties-legacy.html
> 
>   * igt@kms_psr2_su@page_flip-p010:
>     - shard-lnl:          NOTRUN -> [SKIP][55] ([Intel XE#1128])
>    [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138168v3/shard-lnl-6/igt@kms_psr2_su@page_flip-p010.html
> 
>   * igt@kms_psr@fbc-psr2-cursor-blt:
>     - shard-adlp:         NOTRUN -> [SKIP][56] ([Intel XE#1201] / [Intel XE#929]) +6 other tests skip
>    [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138168v3/shard-adlp-6/igt@kms_psr@fbc-psr2-cursor-blt.html
> 
>   * igt@kms_psr@pr-no-drrs:
>     - shard-lnl:          NOTRUN -> [SKIP][57] ([Intel XE#1406])
>    [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138168v3/shard-lnl-1/igt@kms_psr@pr-no-drrs.html
> 
>   * igt@kms_psr@psr-dpms:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][58] ([Intel XE#1201] / [Intel XE#929])
>    [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138168v3/shard-dg2-466/igt@kms_psr@psr-dpms.html
> 
>   * igt@kms_rotation_crc@bad-pixel-format:
>     - shard-adlp:         NOTRUN -> [SKIP][59] ([Intel XE#1201] / [Intel XE#327])
>    [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138168v3/shard-adlp-6/igt@kms_rotation_crc@bad-pixel-format.html
> 
>   * igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:
>     - shard-lnl:          NOTRUN -> [SKIP][60] ([Intel XE#1437])
>    [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138168v3/shard-lnl-6/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html
> 
>   * igt@kms_tiled_display@basic-test-pattern:
>     - shard-lnl:          NOTRUN -> [SKIP][61] ([Intel XE#362])
>    [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138168v3/shard-lnl-1/igt@kms_tiled_display@basic-test-pattern.html
> 
>   * igt@kms_vrr@flip-basic:
>     - shard-lnl:          NOTRUN -> [FAIL][62] ([Intel XE#2443]) +1 other test fail
>    [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138168v3/shard-lnl-1/igt@kms_vrr@flip-basic.html
> 
>   * igt@kms_vrr@flip-basic-fastset:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][63] ([Intel XE#1201] / [Intel XE#455])
>    [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138168v3/shard-dg2-466/igt@kms_vrr@flip-basic-fastset.html
> 
>   * igt@kms_writeback@writeback-invalid-parameters:
>     - shard-adlp:         NOTRUN -> [SKIP][64] ([Intel XE#1201] / [Intel XE#756]) +1 other test skip
>    [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138168v3/shard-adlp-1/igt@kms_writeback@writeback-invalid-parameters.html
> 
>   * igt@xe_evict@evict-large-external:
>     - shard-adlp:         NOTRUN -> [SKIP][65] ([Intel XE#1201] / [Intel XE#261])
>    [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138168v3/shard-adlp-6/igt@xe_evict@evict-large-external.html
> 
>   * igt@xe_evict@evict-mixed-many-threads-small:
>     - shard-dg2-set2:     [PASS][66] -> [TIMEOUT][67] ([Intel XE#1473])
>    [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3/shard-dg2-434/igt@xe_evict@evict-mixed-many-threads-small.html
>    [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138168v3/shard-dg2-466/igt@xe_evict@evict-mixed-many-threads-small.html
>     - shard-lnl:          NOTRUN -> [SKIP][68] ([Intel XE#688]) +1 other test skip
>    [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138168v3/shard-lnl-6/igt@xe_evict@evict-mixed-many-threads-small.html
> 
>   * igt@xe_evict@evict-small:
>     - shard-adlp:         NOTRUN -> [SKIP][69] ([Intel XE#1201] / [Intel XE#261] / [Intel XE#688])
>    [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138168v3/shard-adlp-1/igt@xe_evict@evict-small.html
> 
>   * igt@xe_evict_ccs@evict-overcommit-standalone-nofree-samefd:
>     - shard-adlp:         NOTRUN -> [SKIP][70] ([Intel XE#1201] / [Intel XE#688])
>    [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138168v3/shard-adlp-6/igt@xe_evict_ccs@evict-overcommit-standalone-nofree-samefd.html
> 
>   * igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate:
>     - shard-lnl:          NOTRUN -> [SKIP][71] ([Intel XE#1392]) +3 other tests skip
>    [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138168v3/shard-lnl-1/igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate.html
> 
>   * igt@xe_exec_basic@multigpu-once-null-defer-bind:
>     - shard-adlp:         NOTRUN -> [SKIP][72] ([Intel XE#1201] / [Intel XE#1392]) +3 other tests skip
>    [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138168v3/shard-adlp-1/igt@xe_exec_basic@multigpu-once-null-defer-bind.html
> 
>   * igt@xe_exec_fault_mode@once-userptr-invalidate:
>     - shard-adlp:         NOTRUN -> [SKIP][73] ([Intel XE#1201] / [Intel XE#288]) +5 other tests skip
>    [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138168v3/shard-adlp-1/igt@xe_exec_fault_mode@once-userptr-invalidate.html
> 
>   * igt@xe_exec_fault_mode@twice-userptr-prefetch:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][74] ([Intel XE#1201] / [Intel XE#288])
>    [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138168v3/shard-dg2-466/igt@xe_exec_fault_mode@twice-userptr-prefetch.html
> 
>   * igt@xe_oa@invalid-oa-exponent:
>     - shard-adlp:         NOTRUN -> [SKIP][75] ([Intel XE#1201] / [Intel XE#2541])
>    [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138168v3/shard-adlp-1/igt@xe_oa@invalid-oa-exponent.html
> 
>   * igt@xe_peer2peer@read:
>     - shard-lnl:          NOTRUN -> [SKIP][76] ([Intel XE#1061])
>    [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138168v3/shard-lnl-1/igt@xe_peer2peer@read.html
> 
>   * igt@xe_pm@d3cold-basic:
>     - shard-lnl:          NOTRUN -> [SKIP][77] ([Intel XE#2284] / [Intel XE#366])
>    [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138168v3/shard-lnl-6/igt@xe_pm@d3cold-basic.html
> 
>   * igt@xe_pm@s4-d3hot-basic-exec:
>     - shard-adlp:         [PASS][78] -> [ABORT][79] ([Intel XE#1358] / [Intel XE#1607])
>    [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3/shard-adlp-8/igt@xe_pm@s4-d3hot-basic-exec.html
>    [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138168v3/shard-adlp-9/igt@xe_pm@s4-d3hot-basic-exec.html
> 
>   * igt@xe_pm@s4-vm-bind-userptr:
>     - shard-lnl:          [PASS][80] -> [ABORT][81] ([Intel XE#1794])
>    [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3/shard-lnl-4/igt@xe_pm@s4-vm-bind-userptr.html
>    [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138168v3/shard-lnl-2/igt@xe_pm@s4-vm-bind-userptr.html
> 
>   * igt@xe_pm_residency@toggle-gt-c6:
>     - shard-lnl:          [PASS][82] -> [FAIL][83] ([Intel XE#958])
>    [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3/shard-lnl-5/igt@xe_pm_residency@toggle-gt-c6.html
>    [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138168v3/shard-lnl-3/igt@xe_pm_residency@toggle-gt-c6.html
> 
>   * igt@xe_query@multigpu-query-gt-list:
>     - shard-lnl:          NOTRUN -> [SKIP][84] ([Intel XE#944])
>    [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138168v3/shard-lnl-6/igt@xe_query@multigpu-query-gt-list.html
> 
>   * igt@xe_query@multigpu-query-invalid-query:
>     - shard-adlp:         NOTRUN -> [SKIP][85] ([Intel XE#1201] / [Intel XE#944])
>    [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138168v3/shard-adlp-6/igt@xe_query@multigpu-query-invalid-query.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-x:
>     - shard-adlp:         [DMESG-WARN][86] ([Intel XE#1033]) -> [PASS][87]
>    [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3/shard-adlp-2/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-x.html
>    [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138168v3/shard-adlp-2/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-x.html
> 
>   * igt@kms_atomic_transition@plane-toggle-modeset-transition:
>     - {shard-bmg}:        [FAIL][88] ([Intel XE#1426]) -> [PASS][89] +1 other test pass
>    [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3/shard-bmg-5/igt@kms_atomic_transition@plane-toggle-modeset-transition.html
>    [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138168v3/shard-bmg-3/igt@kms_atomic_transition@plane-toggle-modeset-transition.html
> 
>   * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0:
>     - shard-lnl:          [FAIL][90] ([Intel XE#1659]) -> [PASS][91] +1 other test pass
>    [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3/shard-lnl-5/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html
>    [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138168v3/shard-lnl-4/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html
> 
>   * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-b-dp-2:
>     - {shard-bmg}:        [FAIL][92] ([Intel XE#2436]) -> [PASS][93] +1 other test pass
>    [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3/shard-bmg-7/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-b-dp-2.html
>    [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138168v3/shard-bmg-4/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-b-dp-2.html
> 
>   * igt@kms_flip@2x-flip-vs-blocking-wf-vblank@ad-dp2-hdmi-a3:
>     - {shard-bmg}:        [INCOMPLETE][94] -> [PASS][95] +3 other tests pass
>    [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3/shard-bmg-1/igt@kms_flip@2x-flip-vs-blocking-wf-vblank@ad-dp2-hdmi-a3.html
>    [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138168v3/shard-bmg-2/igt@kms_flip@2x-flip-vs-blocking-wf-vblank@ad-dp2-hdmi-a3.html
> 
>   * igt@kms_flip@2x-flip-vs-panning-interruptible:
>     - shard-dg2-set2:     [DMESG-WARN][96] ([Intel XE#877]) -> [PASS][97]
>    [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3/shard-dg2-466/igt@kms_flip@2x-flip-vs-panning-interruptible.html
>    [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138168v3/shard-dg2-436/igt@kms_flip@2x-flip-vs-panning-interruptible.html
> 
>   * igt@kms_flip@2x-flip-vs-panning-interruptible@ac-hdmi-a6-dp4:
>     - shard-dg2-set2:     [DMESG-WARN][98] -> [PASS][99]
>    [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3/shard-dg2-466/igt@kms_flip@2x-flip-vs-panning-interruptible@ac-hdmi-a6-dp4.html
>    [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138168v3/shard-dg2-436/igt@kms_flip@2x-flip-vs-panning-interruptible@ac-hdmi-a6-dp4.html
> 
>   * igt@kms_flip@2x-modeset-vs-vblank-race-interruptible:
>     - {shard-bmg}:        [INCOMPLETE][100] ([Intel XE#2635]) -> [PASS][101]
>    [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3/shard-bmg-2/igt@kms_flip@2x-modeset-vs-vblank-race-interruptible.html
>    [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138168v3/shard-bmg-2/igt@kms_flip@2x-modeset-vs-vblank-race-interruptible.html
> 
>   * igt@kms_flip@blocking-wf_vblank:
>     - shard-lnl:          [FAIL][102] ([Intel XE#886]) -> [PASS][103] +1 other test pass
>    [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3/shard-lnl-3/igt@kms_flip@blocking-wf_vblank.html
>    [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138168v3/shard-lnl-3/igt@kms_flip@blocking-wf_vblank.html
> 
>   * igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-x:
>     - shard-adlp:         [FAIL][104] ([Intel XE#1874]) -> [PASS][105] +2 other tests pass
>    [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3/shard-adlp-2/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-x.html
>    [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138168v3/shard-adlp-2/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-x.html
> 
>   * igt@kms_plane_scaling@2x-scaler-multi-pipe:
>     - {shard-bmg}:        [DMESG-WARN][106] ([Intel XE#877]) -> [PASS][107] +10 other tests pass
>    [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3/shard-bmg-8/igt@kms_plane_scaling@2x-scaler-multi-pipe.html
>    [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138168v3/shard-bmg-5/igt@kms_plane_scaling@2x-scaler-multi-pipe.html
> 
>   * igt@kms_universal_plane@cursor-fb-leak:
>     - {shard-bmg}:        [FAIL][108] ([Intel XE#899]) -> [PASS][109] +1 other test pass
>    [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3/shard-bmg-4/igt@kms_universal_plane@cursor-fb-leak.html
>    [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138168v3/shard-bmg-1/igt@kms_universal_plane@cursor-fb-leak.html
>     - shard-dg2-set2:     [FAIL][110] ([Intel XE#771] / [Intel XE#899]) -> [PASS][111]
>    [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3/shard-dg2-436/igt@kms_universal_plane@cursor-fb-leak.html
>    [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138168v3/shard-dg2-434/igt@kms_universal_plane@cursor-fb-leak.html
> 
>   * igt@kms_universal_plane@cursor-fb-leak@pipe-b-dp-4:
>     - shard-dg2-set2:     [FAIL][112] ([Intel XE#899]) -> [PASS][113]
>    [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3/shard-dg2-436/igt@kms_universal_plane@cursor-fb-leak@pipe-b-dp-4.html
>    [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138168v3/shard-dg2-434/igt@kms_universal_plane@cursor-fb-leak@pipe-b-dp-4.html
> 
>   * igt@kms_vblank@accuracy-idle:
>     - shard-lnl:          [FAIL][114] ([Intel XE#1523]) -> [PASS][115] +1 other test pass
>    [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3/shard-lnl-3/igt@kms_vblank@accuracy-idle.html
>    [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138168v3/shard-lnl-3/igt@kms_vblank@accuracy-idle.html
> 
>   * igt@xe_evict@evict-beng-mixed-threads-large:
>     - shard-dg2-set2:     [TIMEOUT][116] ([Intel XE#1473]) -> [PASS][117]
>    [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3/shard-dg2-466/igt@xe_evict@evict-beng-mixed-threads-large.html
>    [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138168v3/shard-dg2-435/igt@xe_evict@evict-beng-mixed-threads-large.html
> 
>   * igt@xe_evict@evict-mixed-threads-large:
>     - shard-dg2-set2:     [FAIL][118] ([Intel XE#1000]) -> [PASS][119]
>    [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3/shard-dg2-466/igt@xe_evict@evict-mixed-threads-large.html
>    [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138168v3/shard-dg2-435/igt@xe_evict@evict-mixed-threads-large.html
> 
>   * igt@xe_exec_reset@parallel-gt-reset:
>     - shard-dg2-set2:     [TIMEOUT][120] ([Intel XE#2105]) -> [PASS][121]
>    [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3/shard-dg2-463/igt@xe_exec_reset@parallel-gt-reset.html
>    [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138168v3/shard-dg2-436/igt@xe_exec_reset@parallel-gt-reset.html
> 
>   * igt@xe_exec_threads@threads-hang-shared-vm-userptr-rebind:
>     - shard-lnl:          [ABORT][122] -> [PASS][123]
>    [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3/shard-lnl-7/igt@xe_exec_threads@threads-hang-shared-vm-userptr-rebind.html
>    [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138168v3/shard-lnl-1/igt@xe_exec_threads@threads-hang-shared-vm-userptr-rebind.html
> 
>   * igt@xe_oa@oa-exponents:
>     - shard-lnl:          [FAIL][124] ([Intel XE#2723]) -> [PASS][125]
>    [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3/shard-lnl-4/igt@xe_oa@oa-exponents.html
>    [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138168v3/shard-lnl-7/igt@xe_oa@oa-exponents.html
> 
>   * igt@xe_pm@s2idle-basic:
>     - shard-dg2-set2:     [INCOMPLETE][126] ([Intel XE#1195] / [Intel XE#1358]) -> [PASS][127]
>    [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3/shard-dg2-435/igt@xe_pm@s2idle-basic.html
>    [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138168v3/shard-dg2-466/igt@xe_pm@s2idle-basic.html
> 
>   * igt@xe_pm@s4-basic:
>     - shard-adlp:         [ABORT][128] ([Intel XE#1358] / [Intel XE#1607]) -> [PASS][129]
>    [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3/shard-adlp-9/igt@xe_pm@s4-basic.html
>    [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138168v3/shard-adlp-1/igt@xe_pm@s4-basic.html
> 
>   * igt@xe_pm@s4-vm-bind-prefetch:
>     - shard-lnl:          [ABORT][130] ([Intel XE#1607] / [Intel XE#1794]) -> [PASS][131]
>    [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3/shard-lnl-2/igt@xe_pm@s4-vm-bind-prefetch.html
>    [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138168v3/shard-lnl-6/igt@xe_pm@s4-vm-bind-prefetch.html
> 
>   * igt@xe_pm@s4-vm-bind-userptr:
>     - shard-adlp:         [ABORT][132] ([Intel XE#1794]) -> [PASS][133]
>    [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3/shard-adlp-9/igt@xe_pm@s4-vm-bind-userptr.html
>    [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138168v3/shard-adlp-6/igt@xe_pm@s4-vm-bind-userptr.html
> 
>   
> #### Warnings ####
> 
>   * igt@kms_async_flips@invalid-async-flip:
>     - shard-dg2-set2:     [SKIP][134] ([Intel XE#1201] / [Intel XE#873]) -> [SKIP][135] ([Intel XE#873])
>    [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3/shard-dg2-433/igt@kms_async_flips@invalid-async-flip.html
>    [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138168v3/shard-dg2-432/igt@kms_async_flips@invalid-async-flip.html
> 
>   * igt@kms_big_fb@linear-16bpp-rotate-270:
>     - shard-dg2-set2:     [SKIP][136] ([Intel XE#316]) -> [SKIP][137] ([Intel XE#1201] / [Intel XE#316]) +1 other test skip
>    [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3/shard-dg2-432/igt@kms_big_fb@linear-16bpp-rotate-270.html
>    [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138168v3/shard-dg2-436/igt@kms_big_fb@linear-16bpp-rotate-270.html
> 
>   * igt@kms_big_fb@x-tiled-16bpp-rotate-270:
>     - shard-dg2-set2:     [SKIP][138] ([Intel XE#1201] / [Intel XE#316]) -> [SKIP][139] ([Intel XE#316]) +2 other tests skip
>    [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3/shard-dg2-433/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html
>    [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138168v3/shard-dg2-432/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html
> 
>   * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
>     - shard-adlp:         [FAIL][140] ([Intel XE#1231]) -> [DMESG-FAIL][141] ([Intel XE#324])
>    [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
>    [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138168v3/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
> 
>   * igt@kms_big_fb@yf-tiled-64bpp-rotate-180:
>     - shard-dg2-set2:     [SKIP][142] ([Intel XE#1124] / [Intel XE#1201]) -> [SKIP][143] ([Intel XE#1124]) +10 other tests skip
>    [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3/shard-dg2-433/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html
>    [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138168v3/shard-dg2-432/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html
> 
>   * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
>     - shard-dg2-set2:     [SKIP][144] ([Intel XE#1124]) -> [SKIP][145] ([Intel XE#1124] / [Intel XE#1201]) +8 other tests skip
>    [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3/shard-dg2-432/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html
>    [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138168v3/shard-dg2-433/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html
> 
>   * igt@kms_bw@connected-linear-tiling-1-displays-2560x1440p:
>     - shard-dg2-set2:     [SKIP][146] ([Intel XE#1201] / [Intel XE#367]) -> [SKIP][147] ([Intel XE#367]) +5 other tests skip
>    [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3/shard-dg2-433/igt@kms_bw@connected-linear-tiling-1-displays-2560x1440p.html
>    [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138168v3/shard-dg2-432/igt@kms_bw@connected-linear-tiling-1-displays-2560x1440p.html
> 
>   * igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p:
>     - shard-dg2-set2:     [SKIP][148] ([Intel XE#1201] / [Intel XE#2191]) -> [SKIP][149] ([Intel XE#2191])
>    [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3/shard-dg2-433/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html
>    [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138168v3/shard-dg2-432/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html
> 
>   * igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p:
>     - shard-dg2-set2:     [SKIP][150] ([Intel XE#2191]) -> [SKIP][151] ([Intel XE#1201] / [Intel XE#2191]) +1 other test skip
>    [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3/shard-dg2-432/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html
>    [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138168v3/shard-dg2-433/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html
> 
>   * igt@kms_bw@linear-tiling-3-displays-3840x2160p:
>     - shard-dg2-set2:     [SKIP][152] ([Intel XE#367]) -> [SKIP][153] ([Intel XE#1201] / [Intel XE#367]) +2 other tests skip
>    [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3/shard-dg2-432/igt@kms_bw@linear-tiling-3-displays-3840x2160p.html
>    [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138168v3/shard-dg2-436/igt@kms_bw@linear-tiling-3-displays-3840x2160p.html
> 
>   * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs:
>     - shard-dg2-set2:     [SKIP][154] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) -> [SKIP][155] ([Intel XE#455] / [Intel XE#787]) +13 other tests skip
>    [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3/shard-dg2-433/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs.html
>    [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138168v3/shard-dg2-432/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs.html
> 
>   * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6:
>     - shard-dg2-set2:     [SKIP][156] ([Intel XE#1201] / [Intel XE#787]) -> [SKIP][157] ([Intel XE#787]) +48 other tests skip
>    [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3/shard-dg2-433/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6.html
>    [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138168v3/shard-dg2-432/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6.html
> 
>   * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6:
>     - shard-dg2-set2:     [SKIP][158] ([Intel XE#787]) -> [SKIP][159] ([Intel XE#1201] / [Intel XE#787]) +76 other tests skip
>    [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3/shard-dg2-432/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6.html
>    [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138168v3/shard-dg2-436/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6.html
> 
>   * igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4:
>     - shard-dg2-set2:     [SKIP][160] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][161] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +21 other tests skip
>    [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3/shard-dg2-432/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4.html
>    [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138168v3/shard-dg2-433/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4.html
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs:
>     - shard-dg2-set2:     [SKIP][162] ([Intel XE#1201] / [Intel XE#1252]) -> [SKIP][163] ([Intel XE#1252]) +1 other test skip
>    [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html
>    [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138168v3/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html
> 
>   * igt@kms_cdclk@mode-transition@pipe-d-dp-4:
>     - shard-dg2-set2:     [SKIP][164] ([Intel XE#1201] / [Intel XE#314]) -> [SKIP][165] ([Intel XE#314]) +3 other tests skip
>    [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3/shard-dg2-434/igt@kms_cdclk@mode-transition@pipe-d-dp-4.html
>    [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138168v3/shard-dg2-432/igt@kms_cdclk@mode-transition@pipe-d-dp-4.html
> 
>   * igt@kms_chamelium_color@ctm-blue-to-red:
>     - shard-dg2-set2:     [SKIP][166] ([Intel XE#306]) -> [SKIP][167] ([Intel XE#1201] / [Intel XE#306])
>    [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3/shard-dg2-432/igt@kms_chamelium_color@ctm-blue-to-red.html
>    [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138168v3/shard-dg2-433/igt@kms_chamelium_color@ctm-blue-to-red.html
> 
>   * igt@kms_chamelium_color@gamma:
>     - shard-dg2-set2:     [SKIP][168] ([Intel XE#1201] / [Intel XE#306]) -> [SKIP][169] ([Intel XE#306]) +1 other test skip
>    [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3/shard-dg2-463/igt@kms_chamelium_color@gamma.html
>    [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138168v3/shard-dg2-432/igt@kms_chamelium_color@gamma.html
> 
>   * igt@kms_chamelium_frames@hdmi-aspect-ratio:
>     - shard-dg2-set2:     [SKIP][170] ([Intel XE#373]) -> [SKIP][171] ([Intel XE#1201] / [Intel XE#373]) +5 other tests skip
>    [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3/shard-dg2-432/igt@kms_chamelium_frames@hdmi-aspect-ratio.html
>    [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138168v3/shard-dg2-433/igt@kms_chamelium_frames@hdmi-aspect-ratio.html
> 
>   * igt@kms_chamelium_hpd@hdmi-hpd:
>     - shard-dg2-set2:     [SKIP][172] ([Intel XE#1201] / [Intel XE#373]) -> [SKIP][173] ([Intel XE#373]) +9 other tests skip
>    [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3/shard-dg2-433/igt@kms_chamelium_hpd@hdmi-hpd.html
>    [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138168v3/shard-dg2-432/igt@kms_chamelium_hpd@hdmi-hpd.html
> 
>   * igt@kms_content_protection@dp-mst-type-0:
>     - shard-dg2-set2:     [SKIP][174] ([Intel XE#1201] / [Intel XE#307]) -> [SKIP][175] ([Intel XE#307]) +1 other test skip
>    [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3/shard-dg2-463/igt@kms_content_protection@dp-mst-type-0.html
>    [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138168v3/shard-dg2-432/igt@kms_content_protection@dp-mst-type-0.html
> 
>   * igt@kms_cursor_crc@cursor-rapid-movement-512x170:
>     - shard-dg2-set2:     [SKIP][176] ([Intel XE#1201] / [Intel XE#308]) -> [SKIP][177] ([Intel XE#308])
>    [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3/shard-dg2-433/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html
>    [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138168v3/shard-dg2-432/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html
> 
>   * igt@kms_cursor_crc@cursor-sliding-512x170:
>     - shard-dg2-set2:     [SKIP][178] ([Intel XE#308]) -> [SKIP][179] ([Intel XE#1201] / [Intel XE#308]) +2 other tests skip
>    [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3/shard-dg2-432/igt@kms_cursor_crc@cursor-sliding-512x170.html
>    [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138168v3/shard-dg2-433/igt@kms_cursor_crc@cursor-sliding-512x170.html
> 
>   * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
>     - shard-dg2-set2:     [SKIP][180] ([Intel XE#1201] / [Intel XE#323]) -> [SKIP][181] ([Intel XE#323])
>    [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3/shard-dg2-434/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html
>    [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138168v3/shard-dg2-432/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html
> 
>   * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6:
>     - shard-dg2-set2:     [SKIP][182] ([Intel XE#1201] / [i915#3804]) -> [SKIP][183] ([i915#3804])
>    [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3/shard-dg2-463/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html
>    [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138168v3/shard-dg2-432/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html
> 
>   * igt@kms_feature_discovery@display-3x:
>     - shard-dg2-set2:     [SKIP][184] ([Intel XE#703]) -> [SKIP][185] ([Intel XE#1201] / [Intel XE#703])
>    [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3/shard-dg2-432/igt@kms_feature_discovery@display-3x.html
>    [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138168v3/shard-dg2-433/igt@kms_feature_discovery@display-3x.html
> 
>   * igt@kms_feature_discovery@psr2:
>     - shard-dg2-set2:     [SKIP][186] ([Intel XE#1135]) -> [SKIP][187] ([Intel XE#1135] / [Intel XE#1201])
>    [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3/shard-dg2-432/igt@kms_feature_discovery@psr2.html
>    [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138168v3/shard-dg2-433/igt@kms_feature_discovery@psr2.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling:
>     - shard-dg2-set2:     [SKIP][188] ([Intel XE#1201] / [Intel XE#455]) -> [SKIP][189] ([Intel XE#455]) +16 other tests skip
>    [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3/shard-dg2-463/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling.html
>    [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138168v3/shard-dg2-432/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:
>     - shard-dg2-set2:     [SKIP][190] ([Intel XE#455]) -> [SKIP][191] ([Intel XE#1201] / [Intel XE#455]) +11 other tests skip
>    [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3/shard-dg2-432/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html
>    [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138168v3/shard-dg2-436/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render:
>     - shard-dg2-set2:     [SKIP][192] ([Intel XE#651]) -> [SKIP][193] ([Intel XE#1201] / [Intel XE#651]) +21 other tests skip
>    [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render.html
>    [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138168v3/shard-dg2-436/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc:
>     - shard-dg2-set2:     [SKIP][194] ([Intel XE#1201] / [Intel XE#651]) -> [SKIP][195] ([Intel XE#651]) +28 other tests skip
>    [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc.html
>    [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138168v3/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:
>     - shard-dg2-set2:     [SKIP][196] ([Intel XE#1201] / [Intel XE#658]) -> [SKIP][197] ([Intel XE#658])
>    [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html
>    [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138168v3/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html
> 
>   * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt:
>     - shard-dg2-set2:     [SKIP][198] ([Intel XE#1201] / [Intel XE#653]) -> [SKIP][199] ([Intel XE#653]) +30 other tests skip
>    [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt.html
>    [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138168v3/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@psr-slowdraw:
>     - shard-dg2-set2:     [SKIP][200] ([Intel XE#653]) -> [SKIP][201] ([Intel XE#1201] / [Intel XE#653]) +22 other tests skip
>    [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-slowdraw.html
>    [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138168v3/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-slowdraw.html
> 
>   * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers:
>     - shard-dg2-set2:     [SKIP][202] ([Intel XE#455] / [Intel XE#498]) -> [SKIP][203] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#498]) +1 other test skip
>    [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3/shard-dg2-432/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers.html
>    [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138168v3/shard-dg2-436/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers.html
> 
>   * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-c-hdmi-a-6:
>     - shard-dg2-set2:     [SKIP][204] ([Intel XE#498]) -> [SKIP][205] ([Intel XE#1201] / [Intel XE#498]) +2 other tests skip
>    [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3/shard-dg2-432/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-c-hdmi-a-6.html
>    [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138168v3/shard-dg2-436/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-c-hdmi-a-6.html
> 
>   * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling:
>     - shard-dg2-set2:     [SKIP][206] ([Intel XE#2318] / [Intel XE#455]) -> [SKIP][207] ([Intel XE#1201] / [Intel XE#2318] / [Intel XE#455]) +5 other tests skip
>    [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html
>    [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138168v3/shard-dg2-433/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html
> 
>   * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-c-hdmi-a-6:
>     - shard-dg2-set2:     [SKIP][208] ([Intel XE#2318]) -> [SKIP][209] ([Intel XE#1201] / [Intel XE#2318]) +8 other tests skip
>    [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3/shard-dg2-432/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-c-hdmi-a-6.html
>    [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138168v3/shard-dg2-433/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-c-hdmi-a-6.html
> 
>   * igt@kms_pm_backlight@fade-with-dpms:
>     - shard-dg2-set2:     [SKIP][210] ([Intel XE#1201] / [Intel XE#870]) -> [SKIP][211] ([Intel XE#870]) +1 other test skip
>    [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3/shard-dg2-463/igt@kms_pm_backlight@fade-with-dpms.html
>    [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138168v3/shard-dg2-432/igt@kms_pm_backlight@fade-with-dpms.html
> 
>   * igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-exceed-fully-sf:
>     - shard-dg2-set2:     [SKIP][212] ([Intel XE#1489]) -> [SKIP][213] ([Intel XE#1201] / [Intel XE#1489]) +2 other tests skip
>    [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3/shard-dg2-432/igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-exceed-fully-sf.html
>    [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138168v3/shard-dg2-433/igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-exceed-fully-sf.html
> 
>   * igt@kms_psr2_sf@overlay-plane-move-continuous-sf:
>     - shard-dg2-set2:     [SKIP][214] ([Intel XE#1201] / [Intel XE#1489]) -> [SKIP][215] ([Intel XE#1489]) +3 other tests skip
>    [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3/shard-dg2-434/igt@kms_psr2_sf@overlay-plane-move-continuous-sf.html
>    [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138168v3/shard-dg2-432/igt@kms_psr2_sf@overlay-plane-move-continuous-sf.html
> 
>   * igt@kms_psr@fbc-pr-dpms:
>     - shard-dg2-set2:     [SKIP][216] ([Intel XE#929]) -> [SKIP][217] ([Intel XE#1201] / [Intel XE#929]) +11 other tests skip
>    [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3/shard-dg2-432/igt@kms_psr@fbc-pr-dpms.html
>    [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138168v3/shard-dg2-433/igt@kms_psr@fbc-pr-dpms.html
> 
>   * igt@kms_psr@fbc-psr2-sprite-plane-move:
>     - shard-dg2-set2:     [SKIP][218] ([Intel XE#1201] / [Intel XE#929]) -> [SKIP][219] ([Intel XE#929]) +14 other tests skip
>    [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3/shard-dg2-463/igt@kms_psr@fbc-psr2-sprite-plane-move.html
>    [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138168v3/shard-dg2-432/igt@kms_psr@fbc-psr2-sprite-plane-move.html
> 
>   * igt@kms_rotation_crc@primary-rotation-270:
>     - shard-dg2-set2:     [SKIP][220] ([Intel XE#327]) -> [SKIP][221] ([Intel XE#1201] / [Intel XE#327]) +1 other test skip
>    [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3/shard-dg2-432/igt@kms_rotation_crc@primary-rotation-270.html
>    [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138168v3/shard-dg2-433/igt@kms_rotation_crc@primary-rotation-270.html
> 
>   * igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:
>     - shard-dg2-set2:     [SKIP][222] ([Intel XE#1127] / [Intel XE#1201]) -> [SKIP][223] ([Intel XE#1127])
>    [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3/shard-dg2-433/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html
>    [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138168v3/shard-dg2-432/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html
> 
>   * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
>     - shard-dg2-set2:     [SKIP][224] ([Intel XE#1127]) -> [SKIP][225] ([Intel XE#1127] / [Intel XE#1201])
>    [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3/shard-dg2-432/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html
>    [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138168v3/shard-dg2-433/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html
> 
>   * igt@kms_tiled_display@basic-test-pattern:
>     - shard-dg2-set2:     [FAIL][226] ([Intel XE#1729]) -> [SKIP][227] ([Intel XE#1201] / [Intel XE#362])
>    [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3/shard-dg2-436/igt@kms_tiled_display@basic-test-pattern.html
>    [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138168v3/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern.html
> 
>   * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
>     - shard-dg2-set2:     [SKIP][228] ([Intel XE#1201] / [Intel XE#362]) -> [SKIP][229] ([Intel XE#1201] / [Intel XE#1500])
>    [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
>    [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138168v3/shard-dg2-434/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
> 
>   * igt@kms_writeback@writeback-fb-id-xrgb2101010:
>     - shard-dg2-set2:     [SKIP][230] ([Intel XE#756]) -> [SKIP][231] ([Intel XE#1201] / [Intel XE#756])
>    [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3/shard-dg2-432/igt@kms_writeback@writeback-fb-id-xrgb2101010.html
>    [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138168v3/shard-dg2-433/igt@kms_writeback@writeback-fb-id-xrgb2101010.html
> 
>   * igt@kms_writeback@writeback-invalid-parameters:
>     - shard-dg2-set2:     [SKIP][232] ([Intel XE#1201] / [Intel XE#756]) -> [SKIP][233] ([Intel XE#756]) +1 other test skip
>    [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3/shard-dg2-433/igt@kms_writeback@writeback-invalid-parameters.html
>    [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138168v3/shard-dg2-432/igt@kms_writeback@writeback-invalid-parameters.html
> 
>   * igt@xe_compute_preempt@compute-preempt:
>     - shard-dg2-set2:     [SKIP][234] ([Intel XE#1280] / [Intel XE#455]) -> [SKIP][235] ([Intel XE#1201] / [Intel XE#1280] / [Intel XE#455]) +1 other test skip
>    [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3/shard-dg2-432/igt@xe_compute_preempt@compute-preempt.html
>    [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138168v3/shard-dg2-433/igt@xe_compute_preempt@compute-preempt.html
> 
>   * igt@xe_copy_basic@mem-copy-linear-0x3fff:
>     - shard-dg2-set2:     [SKIP][236] ([Intel XE#1123] / [Intel XE#1201]) -> [SKIP][237] ([Intel XE#1123])
>    [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3/shard-dg2-433/igt@xe_copy_basic@mem-copy-linear-0x3fff.html
>    [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138168v3/shard-dg2-432/igt@xe_copy_basic@mem-copy-linear-0x3fff.html
> 
>   * igt@xe_copy_basic@mem-copy-linear-0xfffe:
>     - shard-dg2-set2:     [SKIP][238] ([Intel XE#1123]) -> [SKIP][239] ([Intel XE#1123] / [Intel XE#1201])
>    [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3/shard-dg2-432/igt@xe_copy_basic@mem-copy-linear-0xfffe.html
>    [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138168v3/shard-dg2-436/igt@xe_copy_basic@mem-copy-linear-0xfffe.html
> 
>   * igt@xe_copy_basic@mem-set-linear-0xfd:
>     - shard-dg2-set2:     [SKIP][240] ([Intel XE#1126] / [Intel XE#1201]) -> [SKIP][241] ([Intel XE#1126])
>    [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3/shard-dg2-463/igt@xe_copy_basic@mem-set-linear-0xfd.html
>    [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138168v3/shard-dg2-432/igt@xe_copy_basic@mem-set-linear-0xfd.html
> 
>   * igt@xe_evict@evict-beng-mixed-many-threads-large:
>     - shard-dg2-set2:     [TIMEOUT][242] ([Intel XE#1473]) -> [FAIL][243] ([Intel XE#1000])
>    [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3/shard-dg2-433/igt@xe_evict@evict-beng-mixed-many-threads-large.html
>    [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138168v3/shard-dg2-432/igt@xe_evict@evict-beng-mixed-many-threads-large.html
> 
>   * igt@xe_exec_fault_mode@twice-invalid-fault:
>     - shard-dg2-set2:     [SKIP][244] ([Intel XE#288]) -> [SKIP][245] ([Intel XE#1201] / [Intel XE#288]) +18 other tests skip
>    [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3/shard-dg2-432/igt@xe_exec_fault_mode@twice-invalid-fault.html
>    [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138168v3/shard-dg2-436/igt@xe_exec_fault_mode@twice-invalid-fault.html
> 
>   * igt@xe_exec_fault_mode@twice-userptr-rebind-imm:
>     - shard-dg2-set2:     [SKIP][246] ([Intel XE#1201] / [Intel XE#288]) -> [SKIP][247] ([Intel XE#288]) +24 other tests skip
>    [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3/shard-dg2-434/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html
>    [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138168v3/shard-dg2-432/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html
> 
>   * igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence:
>     - shard-dg2-set2:     [SKIP][248] ([Intel XE#1201] / [Intel XE#2360]) -> [SKIP][249] ([Intel XE#2360])
>    [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3/shard-dg2-463/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html
>    [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138168v3/shard-dg2-432/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html
> 
>   * igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:
>     - shard-dg2-set2:     [SKIP][250] ([Intel XE#1201] / [Intel XE#2229]) -> [SKIP][251] ([Intel XE#2229])
>    [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3/shard-dg2-463/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html
>    [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138168v3/shard-dg2-432/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html
> 
>   * igt@xe_media_fill@media-fill:
>     - shard-dg2-set2:     [SKIP][252] ([Intel XE#1201] / [Intel XE#560]) -> [SKIP][253] ([Intel XE#560])
>    [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3/shard-dg2-433/igt@xe_media_fill@media-fill.html
>    [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138168v3/shard-dg2-432/igt@xe_media_fill@media-fill.html
> 
>   * igt@xe_oa@mmio-triggered-reports:
>     - shard-dg2-set2:     [SKIP][254] ([Intel XE#2541]) -> [SKIP][255] ([Intel XE#1201] / [Intel XE#2541]) +4 other tests skip
>    [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3/shard-dg2-432/igt@xe_oa@mmio-triggered-reports.html
>    [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138168v3/shard-dg2-436/igt@xe_oa@mmio-triggered-reports.html
> 
>   * igt@xe_oa@non-privileged-map-oa-buffer:
>     - shard-dg2-set2:     [SKIP][256] ([Intel XE#1201] / [Intel XE#2541]) -> [SKIP][257] ([Intel XE#2541]) +5 other tests skip
>    [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3/shard-dg2-434/igt@xe_oa@non-privileged-map-oa-buffer.html
>    [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138168v3/shard-dg2-432/igt@xe_oa@non-privileged-map-oa-buffer.html
> 
>   * igt@xe_pat@pat-index-xehpc:
>     - shard-dg2-set2:     [SKIP][258] ([Intel XE#979]) -> [SKIP][259] ([Intel XE#1201] / [Intel XE#979])
>    [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3/shard-dg2-432/igt@xe_pat@pat-index-xehpc.html
>    [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138168v3/shard-dg2-433/igt@xe_pat@pat-index-xehpc.html
> 
>   * igt@xe_pm@d3cold-mmap-vram:
>     - shard-dg2-set2:     [SKIP][260] ([Intel XE#1201] / [Intel XE#2284] / [Intel XE#366]) -> [SKIP][261] ([Intel XE#2284] / [Intel XE#366]) +1 other test skip
>    [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3/shard-dg2-434/igt@xe_pm@d3cold-mmap-vram.html
>    [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138168v3/shard-dg2-432/igt@xe_pm@d3cold-mmap-vram.html
> 
>   * igt@xe_pm@d3cold-mocs:
>     - shard-dg2-set2:     [SKIP][262] ([Intel XE#2284]) -> [SKIP][263] ([Intel XE#1201] / [Intel XE#2284])
>    [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3/shard-dg2-432/igt@xe_pm@d3cold-mocs.html
>    [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138168v3/shard-dg2-433/igt@xe_pm@d3cold-mocs.html
> 
>   * igt@xe_query@multigpu-query-cs-cycles:
>     - shard-dg2-set2:     [SKIP][264] ([Intel XE#1201] / [Intel XE#944]) -> [SKIP][265] ([Intel XE#944]) +1 other test skip
>    [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3/shard-dg2-463/igt@xe_query@multigpu-query-cs-cycles.html
>    [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138168v3/shard-dg2-432/igt@xe_query@multigpu-query-cs-cycles.html
> 
>   * igt@xe_query@multigpu-query-uc-fw-version-huc:
>     - shard-dg2-set2:     [SKIP][266] ([Intel XE#944]) -> [SKIP][267] ([Intel XE#1201] / [Intel XE#944]) +1 other test skip
>    [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3/shard-dg2-432/igt@xe_query@multigpu-query-uc-fw-version-huc.html
>    [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138168v3/shard-dg2-433/igt@xe_query@multigpu-query-uc-fw-version-huc.html
> 
>   
>   {name}: This element is suppressed. This means it is ignored when computing
>           the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
>   [Intel XE#1000]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1000
>   [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
>   [Intel XE#1035]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1035
>   [Intel XE#1061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061
>   [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
>   [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
>   [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
>   [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
>   [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
>   [Intel XE#1128]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1128
>   [Intel XE#1135]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135
>   [Intel XE#1195]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
>   [Intel XE#1201]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>   [Intel XE#1231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231
>   [Intel XE#1252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252
>   [Intel XE#1280]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280
>   [Intel XE#1332]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1332
>   [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
>   [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
>   [Intel XE#1399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1399
>   [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
>   [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
>   [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
>   [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
>   [Intel XE#1426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426
>   [Intel XE#1437]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1437
>   [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
>   [Intel XE#1467]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1467
>   [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
>   [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
>   [Intel XE#1500]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500
>   [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
>   [Intel XE#1512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1512
>   [Intel XE#1523]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1523
>   [Intel XE#1607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607
>   [Intel XE#1656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1656
>   [Intel XE#1659]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659
>   [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
>   [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
>   [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
>   [Intel XE#1874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
>   [Intel XE#2078]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2078
>   [Intel XE#2105]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2105
>   [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
>   [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
>   [Intel XE#2233]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2233
>   [Intel XE#2245]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2245
>   [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
>   [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
>   [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
>   [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
>   [Intel XE#2314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314
>   [Intel XE#2318]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318
>   [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
>   [Intel XE#2333]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333
>   [Intel XE#2360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360
>   [Intel XE#2393]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2393
>   [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
>   [Intel XE#2436]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2436
>   [Intel XE#2443]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2443
>   [Intel XE#2472]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2472
>   [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
>   [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
>   [Intel XE#2635]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2635
>   [Intel XE#2723]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2723
>   [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
>   [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
>   [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
>   [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
>   [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
>   [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
>   [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
>   [Intel XE#314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/314
>   [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
>   [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
>   [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
>   [Intel XE#327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/327
>   [Intel XE#361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/361
>   [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
>   [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
>   [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
>   [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
>   [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
>   [Intel XE#498]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/498
>   [Intel XE#560]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/560
>   [Intel XE#586]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/586
>   [Intel XE#599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/599
>   [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
>   [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
>   [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
>   [Intel XE#658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/658
>   [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
>   [Intel XE#703]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/703
>   [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
>   [Intel XE#771]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/771
>   [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
>   [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
>   [Intel XE#873]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/873
>   [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
>   [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
>   [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
>   [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
>   [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
>   [Intel XE#958]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/958
>   [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979
>   [i915#3804]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804
> 
> 
> Build changes
> -------------
> 
>   * Linux: xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3 -> xe-pw-138168v3
> 
>   IGT_8012: 8012
>   xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3: f3eded4f8a05d73a0b94f27e05737ea3427450b3
>   xe-pw-138168v3: 138168v3
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138168v3/index.html

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
