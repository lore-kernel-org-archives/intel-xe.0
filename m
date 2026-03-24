Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AB73F54AB9
	for <intel-xe@archiver.kernel.org>; Tue, 24 Mar 2026 13:31:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC6D710E6D3;
	Tue, 24 Mar 2026 13:31:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hI2f4hPJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DA8B10E6D0
 for <intel-xe@lists.freedesktop.org>; Tue, 24 Mar 2026 13:31:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774359104; x=1805895104;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=OZo6nkW3usVLvJPWW9m0D18IBzLXT2jiLe7+pIeii7U=;
 b=hI2f4hPJJ9jxDD+8cKRgGV6Xf1io2glnB3nZC9zxSuTkV7BKr5dZkSmc
 hed8LF14ADEPHIiQTRcvjpyAUqzBxWL99xnxBtSz0y5tiM/c6/+5ekkeL
 Q+EEJgTZmxpk3hXCKEO2ELHBra+vcPaLWjNaUpv4uyTycJVPeu/rMCmDE
 jAgqkdEux10/gwxWtNs5lPFmJl9qki6HO2YoBAQUWKgQ/Fu8Nm8060NFy
 IGgreF0kS+nscWr+1Hxgfianfw5Ltm5TgjAWi0UYt827e5Hy65J6VQNUR
 mY2kSUUf1gSzfSE6H2IYihAXXR4diSXGzCLPplO/JGAaxwduPN/vxL3hk Q==;
X-CSE-ConnectionGUID: VLEG2lTsSBOtRSgGD2W5og==
X-CSE-MsgGUID: foSeNXeTS3mNyd438pzpCQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="86845509"
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; d="scan'208";a="86845509"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2026 06:31:43 -0700
X-CSE-ConnectionGUID: c5xAMr1ZQ9+bRqnOU+QVaA==
X-CSE-MsgGUID: NDNR0X6FQw+/xjt6LTsytQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; d="scan'208";a="219915358"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2026 06:31:40 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 24 Mar 2026 06:31:39 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 24 Mar 2026 06:31:39 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.25) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 24 Mar 2026 06:31:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TyO+n5P7TLA7zdyw4ixTFpjLuu9ARvMEVQYl6E5YVSsHeFRVev1nZWEh/lDneX1R7rN3iJ/eGT+dGfuppydOQlsgO8Xn5J/VLVLCnZxJD1sCxOJk/+i85e8GihQY6N+t8ZoKRxC60yxhqoTQcDmhpMG5C5AlD58jANQvQ3j19RZRnBrWsRgOoIWdpFcndDS1FRE4ooSCKprEdgJtZfBAgB4yb1JmzrOj8Mh6JGVd2FjDpmg/EqSPSsJ02IbjYF2Sg3ja2PtfNPwHboBCqe04SiUD8xDLqGxw2Objl45Z8sqnqx7C+IEXHtITYbAl4FQq24YU3VXq0bLccldzSh+akg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H9XECXzuUhmykepe4MQXS1mR+QD4wI/0LtSM1MxtUfU=;
 b=bgokd7jG1g2Cxlfdxs2v3TT6zeKhDVcvzfb/Tzr2DDqZjhvabL831Fl/b8sMk4TUOAYgC9oAOqV9iCVP1DnKN779fa4j/BVMyzj22r/JdX/pKhicpdFou/dPZMfHTQ5uMIEm65R0rxvP+/ZorIMHEJjXnlJnkLkSDJIMMwhTuIrGcOitg1EFXodGv2snxQtrkjbotfoOzcUcR3NNlMZTDTCD6BVawPv/cTqZzXqzjSpValclXygv4rc8TGyOgSDiQ1aaTjGDANcVE/c3jTZ4Bd5N6bfPxf5lNe6dnwUb9fQZjk+bXEvKXGoiHdcoOzwc5qINBm6oc+3XXxIbYj5ElQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by SA2PR11MB4905.namprd11.prod.outlook.com (2603:10b6:806:117::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Tue, 24 Mar
 2026 13:31:35 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::1d86:a34:519a:3b0d]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::1d86:a34:519a:3b0d%5]) with mapi id 15.20.9745.007; Tue, 24 Mar 2026
 13:31:35 +0000
Date: Tue, 24 Mar 2026 09:31:32 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
CC: <intel-xe@lists.freedesktop.org>, <kernel-dev@igalia.com>, Uma Shankar
 <uma.shankar@intel.com>
Subject: Re: [PATCH v25 00/12] AuxCCS handling and render compression modifiers
Message-ID: <acKSNLF8z3Q7mpmY@intel.com>
References: <20260324084018.20353-1-tvrtko.ursulin@igalia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260324084018.20353-1-tvrtko.ursulin@igalia.com>
X-ClientProxiedBy: SJ0PR13CA0180.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::35) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|SA2PR11MB4905:EE_
X-MS-Office365-Filtering-Correlation-Id: db221739-6d79-4cf4-e2fa-08de89a9ab36
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|18002099003|22082099003|56012099003; 
X-Microsoft-Antispam-Message-Info: c3yT1wfDwV68bahUdzbMoveu+dhKSzYa2BxVafJafJbieNa3kOjecly6QC8XcrtB2sacbZwebfGDp7+XIo2qW6kL26hbNbLFAd0gZEGn8Z2xyfpLWxCYKCE/DLssLXWJBqRxsxraW4s9lIXpA1osvOI9ko4jLVWs9u4sWferAYXbtwrp9Z2IU3G4Wo2mQc0DyYVuOCeHCIsbmGWl2VcTA6Sy9HSS498n/M4sQPCFoQt7/jMN1QxKgChKr1WA4Ntplj79iMyCFbeWQFgPxuGDJHzUetC8O0juW6xHJ7XYyD2El5qX9Vrxc0/1MW+WpVw9ZDxdPArXdpG/fWYKXYNqqzgb4qH6mD7+PCEW2QxunQ1cB7zX1eSoCE1/CeHixqCyID+jH+QDAqxe4b13ftR/PFgmtQJU09y1IUQHnZs/XKNUf50phhCbe0lu2qRNYoe9RDAXg2oeLlIPyLnRp2RrUGXYi8Cd9F2QzRkeXKeKjXEFQvnG85o93KlVwlS+lEqUBhHFUuXAYE807Kpx3ONfv+zyEpmi8/tJgKUJtj1SdozWY4UOzwqmKglXuQK4xZddg8NvTKd/Gf77ObkoYcaEc4cSHCu3HKlvhtAoM48g1wHlznRyNTlELi5tF1f5Fcdb/DsAMSM4Tf16hso+MXt2Yvv9dmrMl8dU1w67t+D8KEYg5xOaYoI7ufgwfsXRDIV+9LCJi4AV1+ePuVO3y9TUhq3ozGbDcKYrrt6YXN6ycN4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(18002099003)(22082099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?WWQto/JBqOcz7f4udnHBPKLGJ8P/oeJvR5qsbEw45VwjNY7YZbT/eOQMkYpF?=
 =?us-ascii?Q?S1ONq45bjCxkkquAMxJRAcb48yXkl0qzGOaA0bcF4P7DzOPd8TU7nboLqaFB?=
 =?us-ascii?Q?CLy+Mz02277E74Qo0y2MBO1GO2ZVjNO3M8jdDmh4EAx8gIPI+t0IaQbzyPML?=
 =?us-ascii?Q?ljAM09LAwJbvUODGR5W4fJVYnQ8doSuvoW0iyYV0I/r6V6093Z4JkNEtbBl3?=
 =?us-ascii?Q?p/agChi1s/0SE45TDrl98MDY3Rc1qU703jEbPLSK0b2wqYFDVbGQTJxftiyM?=
 =?us-ascii?Q?cYXg/gTizUlvVdMOICWa+SiH8VQd3OUy4P9l2RgbnTP+Hx9khmjlhocicvKG?=
 =?us-ascii?Q?cfJ6JH3DP95hoP2AaFi17o0KKl3Axk9fbQVopvSZGqqzRpR8MMsFQ3gPj5bn?=
 =?us-ascii?Q?AcHEFeZGfFdkx6G8ARahHEX5GuDAPcNpd3o9Cxy+hVz/Nk1FfWlBUW4OU16s?=
 =?us-ascii?Q?iR86WTK7K9Hhy2nt+gUNZa17CbKhNloLDWD4g9V5CIcKAhpL/UxGmf9PBpTy?=
 =?us-ascii?Q?BYmHbK/BrQI0A/VRWjGgyGJOUBebR2hc6o5e7jGPux2p85aOnqmk1CuZ3/8+?=
 =?us-ascii?Q?3lIoWenceqDfK8w2fuZqYcVwnGa1XGNmB1gXsNXz8t9k8XVxTuHovdelJlxn?=
 =?us-ascii?Q?59icrrIFV3z5Dx+rDYSFdH+9GiWudUnFPn9b/jC3GxYZTJwnZTcgZjVay3xu?=
 =?us-ascii?Q?1SOhI63Xztq8AkifWO4Z7hgRdJ7c0TP0g+hoh8vHN9H1rXV0g9Gf9pleqXOt?=
 =?us-ascii?Q?naQkgyvkap7FqZt3hFEZE0+XR2KwANkZDfQoMuvAxs4o/+KMKsWnj53V5q8n?=
 =?us-ascii?Q?3VyFYpwDMI4mbcaDXrArJBWSAnLcWb31FkAyoZUENRuYGmOIru8qIduWkAqZ?=
 =?us-ascii?Q?MXrL+QGdh5ASj1delOhbD4p/sMwX7N3gTlUiDBoX7HyZHV7eWVZErl7v2vLw?=
 =?us-ascii?Q?i3nRzuku4bvM2DzL8DhaTPYZ8GCIjiKhm6UjmbV5vDOMCIHrAKsC8YWHuj09?=
 =?us-ascii?Q?wR4vSrU7rxtpBc+WFCPRotOyAyDym882spZcK5X3W17HcUunKyizDpRKWPzb?=
 =?us-ascii?Q?MhBU/iV0zaH8kqI9bONrUcO446HYML20cfHnBqf3fm4IT0G6oYPd3H2p5OAx?=
 =?us-ascii?Q?ceeA9gqn94lpwu93N1oS2oLYDSKdQy3Ru1n/CgZpTmY2LIpWy9qUEfCr989V?=
 =?us-ascii?Q?BYl5tXYRXUMBtH21LR/qs7y/W+vV2THR+6BjyXVxp3pyMhfa01Tl49mVARS7?=
 =?us-ascii?Q?+zFgAa9Dk/bdqm0RVRpgMkZnXThQsy2Qyw4tgpIngDpf3Nh2cwW7/C9qcPAd?=
 =?us-ascii?Q?BQigQ9ujuhweA682GgSWhjbJ6ZrnfZFRCkkUxPa6q37QotUnDt2CYkMsgqTL?=
 =?us-ascii?Q?Y0MJswfZNNKJWlW3OBLBX1jQA/l9lI7Iu2nX6ZZkmXdBzxaOEQX+jKxzONgi?=
 =?us-ascii?Q?9WQJn52YZwSQK4t628Cn36dpbRFc87FA7veTbRntA2aZqQDTtfUqFQvs+6oW?=
 =?us-ascii?Q?QN99qKtz7Gl+fFQoEAyHpj/jX7VebHT4BDkTmoLT+shWAc3250OgBYIfbUef?=
 =?us-ascii?Q?FpRhjM6sz8mHE4RQiOWAYMUZEB+XtcHL3HhuQVkdat+9t0uSyjtgSDAlRI5o?=
 =?us-ascii?Q?hKKYxlrlxihUPGexGH0CmTXF3TMK+MaN8oR731BFYF+N4HkEJkjJ2rc8Otfj?=
 =?us-ascii?Q?0PELsIsyykb1XjAwEZcvIekcTrGHmjHDTVw66Uqzn6MW9EAlHSUeYUlB/d5C?=
 =?us-ascii?Q?SyB25rheeQ=3D=3D?=
X-Exchange-RoutingPolicyChecked: bJm9+AscHqjOFnXa+FiL87cG3BKzJEF1GL97EOV6LOqK+PfEpy3TMt/gxCFUb2rwuoN4s+UPnEl55sSdfasKvzabb0BxjpFM+IaNQ1M83k9ipg6Oh4bqnhndwZWTKibpzUlJDsvucvnv1F0MaadluMVRtjNI2qPAP7qqMbvXKQEgS/KtBum4wwbptauhbDztAoCMgy6QIMihNdeDkTVr1mZDV3TJOs6u+kYfwZ8yEgkK7chm7t9upYJNMxSG0cmJvzqCcmmnYMtLeuX2QW9kjiMuntiI3oMMNavEXxIwWwotA/THcybDXrmNIdI+5yT3+KWpNXUEN4VOB/GkKBnGWA==
X-MS-Exchange-CrossTenant-Network-Message-Id: db221739-6d79-4cf4-e2fa-08de89a9ab36
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2026 13:31:35.0470 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EthtKHfS4eh/UfMVg9JBA+WZghclccDotkbMPWhW44GKBGYrHnxoLvvspRiA7G2+nHP9nrT5Uc5mAEEP5q7xEw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4905
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

On Tue, Mar 24, 2026 at 08:40:06AM +0000, Tvrtko Ursulin wrote:
> A series to add support for compressed surface scanout under xe with
> Alderlake-P.
> 
> Currently the auxiliary buffer data isn't mapped into the page tables at all so
> cf48bddd31de ("drm/i915/display: Disable AuxCCS framebuffers if built for Xe")
> had to disable the support.
> 
> On top of that there are missing flushes, invalidations and similar.
> 
> Tested with KDE Wayland, on Lenovo Carbon X1 ADL-P:
> 
>   [PLANE:32:plane 1A]: type=PRI
>           uapi: [FB:242] AR30 little-endian (0x30335241),0x100000000000008,2880x1800, visible=visible, src=2880.000000x1800.000000+0.000000+0.000000, dst=2880x1800+0+0, rotation=0 (0x00000001)
>           hw: [FB:242] AR30 little-endian (0x30335241),0x100000000000008,2880x1800, visible=yes, src=2880.000000x1800.000000+0.000000+0.000000, dst=2880x1800+0+0, rotation=0 (0x00000001)
> 
> Display working fine - no artefacts, no DMAR/PIPE faults.
> 
> All IGTs pass for me locally.
> 
> v2:
>  * More patches added to fix kms_flip_tiling.
> 
> v3:
>  * Rebased after some cleanup patches from v2 were merged.
>  * Added people to Cc as suggested by Rodrigo.
>  * Adjusted last patch title. (Rodrigo)
>  * Apply GGTT flushing only to iomapped system memory buffers.
> 
> v4:
>  * Added patch for potentially misplaced Wa_14016712196.
>  * Fixed (hopefully) MAX_JOB_SIZE_DW on Meteorlake.
> 
> v5:
>  * Split out ring emission changes to smaller patches.
>  * Fixed MAX_JOB_SIZE_DW even more.
>  * Don't emit MI_FLUSH_DW_CCS on !BCS. This should fix Meteorlake.
> 
>  v6:
>  * Added AuxCCS invalidation to indirect context workarounds.
>  * Also added the indirect context handling and some other workarounds. They are
>    unrelated but the series depends on it.
>  * Dropped DPT pin alignment reduction since BMG appears not to be liking it for
>    some reason.
> 
> v7:
>  * Rebased on top of recent xe_fb_pin.c refactoring and also the indirect
>    context workarounds series.
> 
> v8:
>  * Rebased for bo->size removal.
>  * Corrected PIPE_CONTROL_FLUSH_L3 to bit 30. (Jose)
> 
> v9:
>  * Fixed fb remapping changes.
>  * Dropped two not required patches from the series.
>  * Fixed criteria for GGTT flushing.
>  * Limit clflush to the compression metadata area.
>  * Rebased for indirect context workarounds landing upstream.
> 
> v10:
>  * Rebase for XE_GT_WA().
> 
> v11:
>  * Do not use stolen for DPT on IGFX + AuxCCS.
> 
> v12:
>  * Rebased for some ringbuf and LRC code changes.
> 
> v13:
>  * Rebased for various upstream changes.
>  * Dropped clflush and stolen avoidance patches after merging IGT MOCS 61 usage.
> 
>  v14:
>  * MMIO 0x4248 and MI_FLUSH_DW_CCS are MTL+. (Matt)
>  * Consolidate engine feature checks. (Ville)
>  * Brought back the patch to put DPT tables in system memory for 100% CI pass
>    rate. It looks like MOCS 61 is not enough to avoid sporadic pipecrc
>    mismatches.
> 
> v15:
>  * Limited to enabling on Alderlake-P only. (Dropped all Meteorlake patches.)
>  * Dropped unrelated GGTT alignment fix. (Sent standalone.)
>  * Use display parent interface for probing AuxCCS driver support.
> 
> v16:
>  * Use write-combine for DPT in stolen memory. (Ville)
>  * Dropped clflush patches under assumption pre-production ADL machine were the
>    reason for sporadic pipecrc failures.
> 
> v17:
>  * Mechanical rebase for upstream conflicts.
> 
> v18:
>  * Added a patch to rename XE_BO_FLAG_SCANOUT to XE_BO_FLAG_FORCE_WC. (Rodrigo)
>  * Instead of exporting a helper function for emitting the aux invalidation
>    into the ring, add it to the ring ops vfunc table. (Matthew)
> 
> v19:
>  * Tweaked comments and removed some stray hunks from v17.
> 
> v20:
>  * Include <linux/types.h> for u32.
> 
> v21:
>  * Forward declare struct xe_gt to fix standalone headers test.
> 
> v22:
>  * Split up "drm/xe/display: Add support for AuxCCS" into four patches for
>    easier review.
> 
> v23:
>  * Fixed rebase error made in v22 when splitting up the patches.
> 
> v24:
>  * Fixed flag confusion in "drm/xe: Rename XE_BO_FLAG_SCANOUT to XE_BO_FLAG_FORCE_WC".
>  * Applied r-b's.
> 
> v25:
>  * Rebased for upstream conflict and tidied some checkpatch warnings added in
>    the patch split.

Pushed to drm-xe-next. Thank you so much for the work and patience.

> 
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> 
> Tvrtko Ursulin (12):
>   drm/xe: Rename XE_BO_FLAG_SCANOUT to XE_BO_FLAG_FORCE_WC
>   drm/xe: Use write-combine mapping when populating DPT
>   drm/xe/xelpg: Limit AuxCCS ring buffer programming to Alderlake
>   drm/xe/xelp: Quiesce memory traffic before invalidating AuxCCS
>   drm/xe/xelp: Wait for AuxCCS invalidation to complete
>   drm/xe: Move aux table invalidation to ring ops
>   drm/xe/xelp: Add AuxCCS invalidation to the indirect context
>     workarounds
>   drm/xe/display: Move remapped plane loop out of __xe_pin_fb_vma_dpt
>   drm/xe/display: Change write_dpt_remapped_tiled function signature
>   drm/xe/display: Respect remapped plane alignment
>   drm/xe/display: Add support for AuxCCS
>   drm/xe/xelp: Expose AuxCCS frame buffer modifiers on Alderlake-P
> 
>  drivers/gpu/drm/xe/display/intel_fbdev_fb.c   |  12 +-
>  drivers/gpu/drm/xe/display/xe_display.c       |   8 ++
>  drivers/gpu/drm/xe/display/xe_display_bo.c    |   6 +-
>  drivers/gpu/drm/xe/display/xe_dsb_buffer.c    |   4 +-
>  drivers/gpu/drm/xe/display/xe_fb_pin.c        | 116 +++++++++++++-----
>  drivers/gpu/drm/xe/display/xe_initial_plane.c |   2 +-
>  .../gpu/drm/xe/instructions/xe_mi_commands.h  |   6 +
>  drivers/gpu/drm/xe/xe_bo.c                    |  17 +--
>  drivers/gpu/drm/xe/xe_bo.h                    |   2 +-
>  drivers/gpu/drm/xe/xe_lrc.c                   |  23 ++++
>  drivers/gpu/drm/xe/xe_ring_ops.c              | 106 ++++++++++++----
>  drivers/gpu/drm/xe/xe_ring_ops_types.h        |   8 +-
>  12 files changed, 238 insertions(+), 72 deletions(-)
> 
> -- 
> 2.52.0
> 
