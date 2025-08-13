Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A29C4C87FCF
	for <intel-xe@archiver.kernel.org>; Wed, 13 Aug 2025 22:06:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54CF510E661;
	Wed, 13 Aug 2025 22:06:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BFytvTUW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8803D10E661
 for <intel-xe@lists.freedesktop.org>; Wed, 13 Aug 2025 22:06:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755122774; x=1786658774;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=/FJ9q9+n5U/KYq9Y011rJLN/oBBKckFwO/+xK5ODhlg=;
 b=BFytvTUWq1P8laZFwa/SCPmozFJa782f0kQBm4ghEWcy8dV9Aee2WkTQ
 OnblW5Bdwoyka7an6QHND/icsybVn7SsJb5gFP+YfTDaqMPnMRcEQa6I+
 EB+4HC2yHiKU+xc18H+LnP7FS+6t4ImxublPNHNuaGwCE3LFeQdMsEhiK
 f12/IZY1zc1YPyluRd1WoisM1cNM/I0qkaw+u2kRYLM6Wvipdu9rziBPG
 3rFRrVBoylNMVuBmKH9VT9ffKxLae++Nt9z1cwjTPpufgDNth679pR4QS
 O3KVD+ujfY6Gqw+8TlZN54A8QiOU1ZmZVlp+6x3cFjEqPjZwMVbZAAsau w==;
X-CSE-ConnectionGUID: lUS0Kwc5QMuZjcxFc0BF4Q==
X-CSE-MsgGUID: Ja8O9ByNTkivo15kTuI8HA==
X-IronPort-AV: E=McAfee;i="6800,10657,11520"; a="80007877"
X-IronPort-AV: E=Sophos;i="6.17,287,1747724400"; d="scan'208";a="80007877"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2025 15:06:14 -0700
X-CSE-ConnectionGUID: ed0RYud5RPilFryHN1CZRQ==
X-CSE-MsgGUID: a2+0la1xR46vVotQ7J7Vnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,287,1747724400"; d="scan'208";a="170822798"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2025 15:06:14 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 13 Aug 2025 15:06:13 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Wed, 13 Aug 2025 15:06:13 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (40.107.92.85) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Wed, 13 Aug 2025 15:06:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UTAvO3mC8Wu+umksERrQI/2ZNXDLj6i9ltrzKKhB/UZDplMRAG1NHGyhnPDnsvuop+9I8drsNwyKbw/kMUR8wCrGTclbQBu4GckB/xQbJQ3744ElyhFQVYH1z8vK1t7cL8UkUG6PPOBTwOY/nFB4gpaFDmyWn6+wXLvkkjh5NU6bmMf37qkxubsUlRFhjE0Z781H0FChATg51iY7CDU38z3wFpYSqHMB6IX5EPg8GP79Wf1PGqpkRxGcStexx3XVX3S9NxzvZMNIp7NYN5EqK1wSFqOiBpsIgibN6+k1wsUPuA+YXAzsv4VXllmc1WlBYA/8ut1V7bWVspIqr33+jA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vp5jFmzFgHzYEoxIeJmtmhgf5h/1lpq4LLziI/GPmCU=;
 b=NX8Qy+UHQasahvRl7Ij5fDwINmza4t3HATSR7kH5BOOybIBxgRGzmNl+HH9aw+g0ognq/k9pW7t7ZYrSirJP+PbMuWNwiSUYj4hN4rgECbDJ1aTXuFfBwRUpnJcu2MKji8RRKLTaQWsSckaP4XAJgycujZ8PfImJEa40EB6CsQXso+o6zqKE+QUQ8u5ljKcYq/OR37CPLZIk3D0q4Veinwrbapr4jXpXSmuwwCdLCSr1Ee1wOtFd1P7DX7uFU3Avlla1RwOScvkfnkoorio+uZxQHo1WazVh5i1I1Ff1BsK3isAdfo1RT/0ZyuKnt1eyaCCDTZveGNtC4srkOeASqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MW3PR11MB4619.namprd11.prod.outlook.com (2603:10b6:303:5b::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.15; Wed, 13 Aug
 2025 22:06:11 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.9031.014; Wed, 13 Aug 2025
 22:06:11 +0000
Date: Wed, 13 Aug 2025 15:06:09 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Jani Nikula <jani.nikula@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Matthew Auld
 <matthew.auld@intel.com>
Subject: Re: [PATCH 09/15] drm/xe: Convert the CPU fault handler for
 exhaustive eviction
Message-ID: <aJ0MUTkV1j2xWAam@lstrano-desk.jf.intel.com>
References: <20250813105121.5945-1-thomas.hellstrom@linux.intel.com>
 <20250813105121.5945-10-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250813105121.5945-10-thomas.hellstrom@linux.intel.com>
X-ClientProxiedBy: SJ0PR13CA0103.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::18) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MW3PR11MB4619:EE_
X-MS-Office365-Filtering-Correlation-Id: 4fae1f40-3459-4f46-a0ae-08dddab59cb6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?ybIYsUpYHSjbpZDiyT+lBknp60GtN9xrH7XLBUHgZOxT7CIeZ82dHcdnVu?=
 =?iso-8859-1?Q?b48IuqKJqhAdKXsObg51pY1h/Ly7iuZZVpku6e0p+vvgPL32/oT9U6Ieow?=
 =?iso-8859-1?Q?vK6z5nbYh+ifor8HWziWBiQ8sl1+nuJ8V4KPkAyG9bbxcXu2RJj1NguQGp?=
 =?iso-8859-1?Q?ZL3jfg/mhw/8lGNNrYskFXM+GLmknEZr8S2htAiBMXHunUkfbrSBF77EgS?=
 =?iso-8859-1?Q?fEVGbF2M6tLe5gGhRc5nRabTHyyhrBaUO3X9oX/6vEbEUT5lgsxB5N9SA2?=
 =?iso-8859-1?Q?0vMlapweaIT0zIFsaK9lB+CPY891uioVaVvAumDuFoh07ry2CXlMC9vjy8?=
 =?iso-8859-1?Q?L4+M58RYNiXmM+DS7O9XjXWQMM0yyMrl5VL7lkzwmES2gHesovExnVwfH8?=
 =?iso-8859-1?Q?3Kb5G419QMrwfHDKY6pBPg32MkCKNvXYvA3nY1qojXoNRepoZ45EzOwq0c?=
 =?iso-8859-1?Q?H3o5kX0PBD7IVyfsfve6yPPhvyyePLkFup50hTp423IO8hS4dDmQ5ONT2m?=
 =?iso-8859-1?Q?+8y0bFECgLhgM/gJCYyH2yoF2dsYbPdRaLqNLwlC88YGDWnQY948RK98M6?=
 =?iso-8859-1?Q?OawS5vyD09KPbmTOw0hHwOLFs/F2cwJCAX4u6wGrKNdDCYoNnEbTj6DLel?=
 =?iso-8859-1?Q?v8UaW7bkX1FlEo8vm4AUZXxGlpNeTVSx551TtsFhVc6UHlJOr4NhmrG9HT?=
 =?iso-8859-1?Q?6UnyDK28UppPKOttJrXekmdzmzhD+R4x7tjXpNW2+po1VSHTZQr3LHC1W5?=
 =?iso-8859-1?Q?eoWHosu84ZAKdlD5GDoTFEAJhceKyq4OHjqoNGuxLEiBxgr40T7SrkEa4J?=
 =?iso-8859-1?Q?OjnhLWmOLsNVr7SA7QwDDBc90wdbKEvD4Hk4HLmVnULsrMt6rcY2Dpn0eR?=
 =?iso-8859-1?Q?l2TcTnhwayrNeMRug4BFgY46cS5ToJbQ3C1a2XSaWkNPQ6NmCVZn6vlgg1?=
 =?iso-8859-1?Q?BRL5GqMQGIyMwt6WUPb30gYEdfA52AH5yrXsrS2U84hHzwEeT3fUu1x+Ro?=
 =?iso-8859-1?Q?86e8lrfi3nCJ9AkskJdHnK/k7QXx1wQuNGvJ73ouhQyqVlL5XYtpe+obMY?=
 =?iso-8859-1?Q?1zsqkL31aNEJEHKhGruSvqBs6M05Wle5CjcPd0Lz8iw+svchgFlfKmjrX3?=
 =?iso-8859-1?Q?z6LPfhYQ6GudDt46nB5iLWA9S/JiDEHGAs8fMYUAONZu+dFC4o9xYQzfdq?=
 =?iso-8859-1?Q?6hw4xLuIkCfKdAfp15Vg9EGfSB+xbZ7p2TraBxnIre9rai/7cdGihV9C68?=
 =?iso-8859-1?Q?/EfsDxlKSE1fXtZD+Fn4Ye/OifKr3Yqp+D3GiFEbmb/Zw/cD6qIRmh3TKq?=
 =?iso-8859-1?Q?5okTihyVK2UT2kGyov4xD9vykwtBhzkEg3BggYxOk5UczQachiOIjoaur/?=
 =?iso-8859-1?Q?3wQdAbTWP37D+BIXrACUsx5ljtuJgqO7fKV/LotV8D2a3Lc6Hq20mx4Vds?=
 =?iso-8859-1?Q?x87RsBqSavSqDM4Gz5wQItqbZawi3GKVB2WBe6Mlgtx+X309iFVGfeN0C+?=
 =?iso-8859-1?Q?c=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?D/y/rnPgj5XMusyernurSjn5+HiWbY4O2R4aTUh7Evk04a/em1+th1Q1HT?=
 =?iso-8859-1?Q?txtmValdMrqLHeoHvg+anfCLA556QlQKZamhHEoSyRhXSXv2XU3wVgIFzg?=
 =?iso-8859-1?Q?X/hT/+4ookeLlCVO4AOlSFQ3MgM5muV0b2lCYi3ZYYRvD1ZndsRuk25Sjf?=
 =?iso-8859-1?Q?/jl1215iV7fs7ZcnWZUvCrPOv9rkNX9F3EtFAWESc1OBRbUjVaUCZUwpwo?=
 =?iso-8859-1?Q?aYZ318s4j9KVSZVkQVR/5iuofQ24fQRx4yWSvjGd3xD3/v4pwVHhb5zhR0?=
 =?iso-8859-1?Q?Gf/sJnBm3utDUMoa3rQt9gauu+Tp+MewPCV2fS6/LOIq17RlZAtWxieF5G?=
 =?iso-8859-1?Q?pP9Q6x+x+45xLnJN1q4tRwrSe4D2+3Qvxw4sjpF8B0YIF5KIsJU2LH4Kyr?=
 =?iso-8859-1?Q?PM5JXXsVun+2hYvVf/v0yVSEQ++BbqMewq7nRlIc42YYjBYxuDMiSEgQ6D?=
 =?iso-8859-1?Q?/c3l/3sLhB/ynaXd0S2tvQ9REeOzT+RxTqXPeY3MuIBG/BWMXOV/ZehATp?=
 =?iso-8859-1?Q?q2W4WwFHM5PAdeM9T/kUGXg68svEntpOLnLbslVoQbTdXSUJF68kdlRMcp?=
 =?iso-8859-1?Q?+mJ0Ebaf1wT5lXR6aTBWiupkNOk8AviwAWIuL4W8Z2rA6UD04Zw0argj4k?=
 =?iso-8859-1?Q?mEoHIjg1Ez1zVGYvmlDt20oYZVLWmQyLAZVriVBE6+1Fp/7rW9xH4clWox?=
 =?iso-8859-1?Q?m36hKgVBr4h0sxRhj7xIB0iGJu2hBwir55vQ6iMLPydwHz60Slj5X92I6b?=
 =?iso-8859-1?Q?RtRmoJNXjo0QT1+4udBwvAzPFvDKDwTplZ2CVeOLDZmm8km+tefuQ8e27+?=
 =?iso-8859-1?Q?Ef9LICdiPzyNJm2KsKatFOHkbXiywDEZYQX97diNiBUOkuJpp5OM+ZMM52?=
 =?iso-8859-1?Q?XUc3QXF550pEnkj6cOprjat5AubPHGVmk5Cdpfwohvz07FJrwQdBp0nONh?=
 =?iso-8859-1?Q?9dWkL/wRnOU67p37emO76eJOju0VNCl43KQtGhyJno+vogDXZWSqAIGSzo?=
 =?iso-8859-1?Q?Is4jJQxL5Gnh6lQbnS8F7uddsIvH48KFXku34PcxjIypViDQ6Oi+FYsQ3i?=
 =?iso-8859-1?Q?mPB6ga9tx6XEr185eEC2ysgUHCIIZ9us1qW3Z39tjXa/u2rllSlS3TBYzE?=
 =?iso-8859-1?Q?ipqTfUn7IBs6F3EqVNLuKIkQubHClJHxYxHS3OCdvCs3HbfK/jcwYgqMjE?=
 =?iso-8859-1?Q?Qv8jQqkGtQtMH5bzD7ZeE8TvtR3u7f+eiIEGTb0W1Rb+AvANFWL171LIph?=
 =?iso-8859-1?Q?KUSO0ARf8FCw5pHptWGGAbk//5VJF6S47TkX9Nx8UVJtxixIh06OE6s8Nm?=
 =?iso-8859-1?Q?pStFeknhltxwT+r3/i+f4KcTRvEw/glRPmaVY0xTOIZ4zMUA9JqottijHs?=
 =?iso-8859-1?Q?uRkewTqudKMHCXIoRCiNyFSSfPfRaMD0GUW6ecQRqqeS32uiwxgXdb8c8P?=
 =?iso-8859-1?Q?du+yvqnCDonQxC+czmeL1PBqtTu6UK37RmAqg9cUBbxgjwbofjtmEEwJKt?=
 =?iso-8859-1?Q?LNMtpZGBd/UJllCnmN0EDIIZFxiNq4kSOTUWjK66uyeceLvPGK3QeKK/kP?=
 =?iso-8859-1?Q?TPehJ2k+6pSCNLJ4UvtLVbQJclst2pHO4i3aZt/Id7JC2AjbeeDGd0Ys2c?=
 =?iso-8859-1?Q?olucEaORPkO6XhXp+d7c5hW0p9db9p85p/NTD0brA0ag9F8/ar0BBbyA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4fae1f40-3459-4f46-a0ae-08dddab59cb6
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2025 22:06:11.1467 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I0+fSFOAYSQsH0yxlVlQykesv5vXnSoBe8pHneFmHpPMs+38g/lnuTIzbOp1N9t5IGncJRx8HXYFFQRBFtm7bA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4619
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

On Wed, Aug 13, 2025 at 12:51:15PM +0200, Thomas Hellström wrote:
> The CPU fault handler may populate bos and migrate, and in doing
> so might interfere with other tasks validing.
> 
> Convert it for exhaustive eviction. To do this properly without
> potentially introducing stalls with the mmap lock held requires
> TTM work. In the meantime, let's live with those stalls that
> would typically happen on memory pressure.
> 
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>  drivers/gpu/drm/xe/xe_bo.c | 11 ++++++++---
>  1 file changed, 8 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index 5e40b6cb8d2a..dd1e0e9957e0 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -1720,14 +1720,18 @@ static vm_fault_t xe_gem_fault(struct vm_fault *vmf)
>  	struct xe_device *xe = to_xe_device(ddev);
>  	struct xe_bo *bo = ttm_to_xe_bo(tbo);
>  	bool needs_rpm = bo->flags & XE_BO_FLAG_VRAM_MASK;
> -	struct drm_exec *exec;
> +	struct xe_validation_ctx ctx;
> +	struct drm_exec exec;
>  	vm_fault_t ret;
>  	int idx;
>  
>  	if (needs_rpm)
>  		xe_pm_runtime_get(xe);
>  
> -	exec = XE_VALIDATION_UNIMPLEMENTED;
> +	if (xe_validation_ctx_init(&ctx, &xe->val, &exec,
> +				   DRM_EXEC_INTERRUPTIBLE_WAIT, 0, false))
> +		return VM_FAULT_NOPAGE;

Any particular reason to not use xe_validation_guard here?

Matt

> +
>  	ret = ttm_bo_vm_reserve(tbo, vmf);
>  	if (ret)
>  		goto out;
> @@ -1735,7 +1739,7 @@ static vm_fault_t xe_gem_fault(struct vm_fault *vmf)
>  	if (drm_dev_enter(ddev, &idx)) {
>  		trace_xe_bo_cpu_fault(bo);
>  
> -		xe_validation_assert_exec(xe, exec, &tbo->base);
> +		xe_validation_assert_exec(xe, &exec, &tbo->base);
>  		ret = ttm_bo_vm_fault_reserved(vmf, vmf->vma->vm_page_prot,
>  					       TTM_BO_VM_NUM_PREFAULT);
>  		drm_dev_exit(idx);
> @@ -1761,6 +1765,7 @@ static vm_fault_t xe_gem_fault(struct vm_fault *vmf)
>  
>  	dma_resv_unlock(tbo->base.resv);
>  out:
> +	xe_validation_ctx_fini(&ctx);
>  	if (needs_rpm)
>  		xe_pm_runtime_put(xe);
>  
> -- 
> 2.50.1
> 
