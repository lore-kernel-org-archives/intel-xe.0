Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B28D1CCFA13
	for <intel-xe@archiver.kernel.org>; Wed, 29 Apr 2026 19:56:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E53F10E400;
	Wed, 29 Apr 2026 19:56:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JB0q/bMU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65DB910E400
 for <intel-xe@lists.freedesktop.org>; Wed, 29 Apr 2026 19:56:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777492614; x=1809028614;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=WLR8Jc8rw3ncoWiGNGAs6Qw2WaTp6F0UHhcVsQV/Ot0=;
 b=JB0q/bMUR4FAFI/BD/85fyVzAJa6YByqOEahrAJM1RDq2xlyTo8E3mZZ
 1dX9YwXwzuyUwyvBXYgqfmJ1FCgIdTSWOooXwlk7m6QOTjiaRVF8L7EPE
 Mxd8Wf6n535DFDk4+XHANNRSAf4r47pYPQmBNkd4woLHNHOi/ibVFqW2b
 hKfLkAH5tbL/NbStIm6vuq6dPfujaFbfv0w0ulYyWSpObN5nr48Eow/kU
 6NTKjQ2B9Ny3s7bcGOpPZyume3MdfC0rvifu5iei0wx5ojFqZ8qxH91GE
 PLaacdEcSak7r3yUROGbtg16+ALsfzb+TyVhiPr6UCf67KeOwjGqV5jrM A==;
X-CSE-ConnectionGUID: 7WTVT/6KTvuLBYi6ram2aQ==
X-CSE-MsgGUID: lRNFsN7zTpyt+aBB+jLnGA==
X-IronPort-AV: E=McAfee;i="6800,10657,11771"; a="78351888"
X-IronPort-AV: E=Sophos;i="6.23,206,1770624000"; d="scan'208";a="78351888"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2026 12:56:54 -0700
X-CSE-ConnectionGUID: 9Mz7I93tT1G5EDnm4xVzRA==
X-CSE-MsgGUID: b5CoNvfwTG2xHCv/EQt1Sw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,206,1770624000"; d="scan'208";a="231725796"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2026 12:56:54 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 29 Apr 2026 12:56:53 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 29 Apr 2026 12:56:53 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.59) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 29 Apr 2026 12:56:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=amcHRVe3uEFZG8Zu+QU+nCFf/NmD2Z1almBXIckSCEQRvJnTQJuFe2BDJeJ4lVNuCXQWb5ELpqiyQmAN9Pgf6bPhErwHkhiIKXFkAd8AAt9hhhW3cZplyXOEzZunOkJ/nMi58hrxf2a4/RTz3VFTOJhD4xbTGg4OOe8H2rRwNtWVoUqv9aDMhjC9FloiYFyXh+TboyiosUw5Oa1EZOk+LnUlM/9mfAKz73OSgeE/9O+lNRFBUc1v5PVvhPY3+V7Zl/BGBEo3g8iuCqVR2AmGrlMaE9J/CgaLmR+L0t5RUlf7TKKi1xBHtIyrZ/K5jYaXhdA8BeFJUIdTJQx5eeF4NA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qMQk/jNzxAUVOw2m9L1rpl5OhHBsAOLCJkTPcZVe5U4=;
 b=Siu26dX0CS334F5GP/56pvCX/yMCuyLiTfGDGVorGtDSuRW3qQo2rzICWwvv6WzL9xOgvAHyMCuoNeTJI5E+ik1Ha2a2msSxHWW+TfGNExaOfKOGYTk2D8d8bAN50MRsK2rqsdgy3evZkISm49GDov9SX10f1H2HwqpJTAYBRijEkq7qfNY0lVsFLGoIg2ADjg+iugjG8iqvfIfSWA44RdYdB7aAfxCoYj8AV0oWETAR+zQ3mbftAIG6lwDanTyHxZM06xR0HwzSp/LzmpOVxXNzFrTBmKlgJPDtVVXYElBobSbViY0Q8BHzpvlQ/g07b8cONxq/gDYVpTc4GODbng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6410.namprd11.prod.outlook.com (2603:10b6:208:3b9::15)
 by DM6PR11MB4609.namprd11.prod.outlook.com (2603:10b6:5:28f::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.20; Wed, 29 Apr
 2026 19:56:51 +0000
Received: from BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc]) by BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc%6]) with mapi id 15.20.9870.016; Wed, 29 Apr 2026
 19:56:50 +0000
Date: Wed, 29 Apr 2026 12:56:47 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <matthew.brost@intel.com>
Subject: Re: [PATCH 2/5] drm/xe/multi_queue: Add helpers to access CS QUEUE
 TIMESTAMP from lrc
Message-ID: <afJif0_d-sySg0k3@nvishwa1-desk>
References: <20260409203714.1887402-7-umesh.nerlige.ramappa@intel.com>
 <20260409203714.1887402-9-umesh.nerlige.ramappa@intel.com>
 <ad1jsmhJ5pJYw8mH@nvishwa1-desk>
 <ae/o2uQTU31CmXXR@soc-5CG1426VCC.clients.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <ae/o2uQTU31CmXXR@soc-5CG1426VCC.clients.intel.com>
X-ClientProxiedBy: SJ0PR03CA0077.namprd03.prod.outlook.com
 (2603:10b6:a03:331::22) To BL3PR11MB6410.namprd11.prod.outlook.com
 (2603:10b6:208:3b9::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6410:EE_|DM6PR11MB4609:EE_
X-MS-Office365-Filtering-Correlation-Id: fa19a7a1-810f-4676-d852-08dea6297444
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|18002099003|22082099003|56012099003; 
X-Microsoft-Antispam-Message-Info: soHDBoijknFHhyz4EcPvV8rVyvj9lMXcwWCIQ3lrLu3Mk/1pFUN44+JfkReNIkDEtfm77ydeqSBmAZLVZGhdWh3ECMQR7R/BxejN1SnBzY8c54qvqNo/oefb4xh67qMFhIN7kwsx9M71dhHfpTREYELBhPYYFfTjFiiiDYJ6MXPtXWBEdq8kXtmnRqNNa46iQGbgNiGF0G+dAJ3b2ZLpigEp00aV6x2T6PUQC70OmH8Ak/ut+e9JPuskfc+qsljrDEmOxTO4ZAwKzkwT61A38cP9I1ztSSvKA8gg8z1D8pf5q0fdL9uuSMQfDTYlrjaf3DTSP60C/N9m6fNzcx5wmapNNWjG5NzSYDnpWvcdWhmSpNosun6RTvyUWHW0uAjdAmJPdWwB2LUiiXh1UVF7JOsuSW/bNOj56ciu4rkQfUIj3i/9IOumc24QIQydNDS0kcNjT6nBHlVxigbE7FjMSV3sJmuvBCdsHCtWNM4aCRZ7VGD5KtwgTN+CxgGuZbArAJJ7Q3QEfsewHUIS1489+OaMcj39awGrrcIlcZsscG9jw/cHQfRaRajCzd/hMIsp7MxgAys7OU3z1s4gY9pkI5Ndq4urD+r5kJQU/I81AwV2G25Y+ch4PGEceubx/JK8mmvg2fH8rU+SkZVsyFZslSfhxyPz4IlM/Txi/cnKe/I9XKBvHl7NvZclQPX2Sv7ra/mIY7noVwhIipxVBiHSOMo+dTkCeME1GGwdtDmM0U0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6410.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(18002099003)(22082099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?KkocWOmi+N3v78I5SEG5Dx7vo9ou+1v0h0zt7wfdfpRsLjiF0eIeBeCo4ZQG?=
 =?us-ascii?Q?nMVsP8ulUvUabUl6cwHKB9jdWGxxVyQ+4+uobfeKJRSaPZfhdAqRTXZpZ1I9?=
 =?us-ascii?Q?IwBYQr9THF5MfLzj14SSSR+blKkCf3wxDCIffJxOazq0rxE/OTCce6EUqafh?=
 =?us-ascii?Q?BzA7L77ulUNMdIHhGjN3JusZG4OmAuJTan2P3gIYT9y9IUN2XG+iQtF5aQFT?=
 =?us-ascii?Q?9PTeFUGygi30r4OrTuhJcL06hqZ7d+Jv5eFDnl2J8aDLm8mCa5kvYKZFr/Kw?=
 =?us-ascii?Q?wpatA89r3qjwchivblrY5khH2O8oXWQi1pCSntVto7IMatYTgsJUzolZ+Prw?=
 =?us-ascii?Q?JggnGFtSilzsODgXLfUuAm/FzLiNFBWwN5/WK2v2A4cyhLVwinmGV1qf3hco?=
 =?us-ascii?Q?dW4isso1UtggEZgkES2Cvxxi+FdK+chex0x2jQuqDnDHU5v1G/TIYK20ZNBu?=
 =?us-ascii?Q?THTyKnne+xOZp+9aqliuWvWsJoW0lL9o1KauYolrztbNWj8073O/j4Xy1ox9?=
 =?us-ascii?Q?2HvEx+9OCRlegEGMQvFZLeabRKBwqxqoA16u0KnEfSpHR1Ru+hQ34TMEPjEq?=
 =?us-ascii?Q?h4cenlZiMZMOlcQ4jzKhYvHuHzAGN6M848B0x7YPqIio+Y+XK2unJ9BDlPBj?=
 =?us-ascii?Q?h7OLWtY0T1zTlSW+5n+UVK1AePXsoiKiXdJxlgAj3+G5JSQM7xTpbN6DhYDX?=
 =?us-ascii?Q?odPbD5qYx01tS2mBY5cmXB2ufYrvjx/Q3EEP7a0jtTlxXh2ozANw37dKFWrX?=
 =?us-ascii?Q?Uf9NiGKyC/2T3N4Sz5jB0+PGwxNB09GfLi2vnNbFBpJKyl9wsCPQL501m4hg?=
 =?us-ascii?Q?V53Fuz899pPCR0gPpejAcxi0ZgYfsxerAEH6lWz3NHRcbW36OTBfRkhaN0oQ?=
 =?us-ascii?Q?hLz0srHsAu0ma37JXNmGG8WdBNdVW4kpbiw0EXz2cV/W4Qi5AlrhRzn8AmhC?=
 =?us-ascii?Q?fZB1cmSdnUnf0I4sqUcPMAcmISvJkeeUOkuJKkuQetVldVbflrGBiUvKA+/w?=
 =?us-ascii?Q?9Vw+W7IO7jtmzq85z+u+n6/kowit9uA6tbeoeTbIIu6hjsygPaoc11UiJqOW?=
 =?us-ascii?Q?ud7UV84XUpwlS7ZkkqT182U7ZUQMUGvwuDL8ClEvA/IxBiELjGK05Ycg+F0f?=
 =?us-ascii?Q?qPS+rxdjbAQiPe2a7W+BK7qY523TMUXs9xEsUoWZLCYnDptP2UccgXaAn2wO?=
 =?us-ascii?Q?a+aEH7Wr1rKWabeMFu8ZaUwp6ONsMwYUBA8cS7ffyTev8KusyTY3XCE8NbVz?=
 =?us-ascii?Q?AKUKjr/j9VGOBaGRr0yT6Yibu+Jkya0fPu8Lq9Pr/03YMxWsNGL3ip5MFi7t?=
 =?us-ascii?Q?ig/yL8OHRK+8bVFFVZeau/Ms5Gd2V7dn9s01FsdquYvOBoKp8Txufw8Fpzgp?=
 =?us-ascii?Q?P9diVHhKLDaGlS9fU1RHqvglQmVWvvULjua0y1XuzyAILHWV6/XdkCLX0AwI?=
 =?us-ascii?Q?jio/jPCBlt2pKcDsZtzfLX34KOI+U6Z1Uo7jV5owQgFoQ0DFL/OHt1zF/3IA?=
 =?us-ascii?Q?W1l5NMckW5YNPx9TpxSYF2gTqpuGMo5CRTUURzCmhdryFCN8sXG919YH7DKb?=
 =?us-ascii?Q?+rd73ZD+aMXmYnWnAAMbvB4blgFheSzrYU14aKgaub/HPCpGZ9ZlS0ihAoIL?=
 =?us-ascii?Q?5JvQ6odtFjdZA6V8uevOzfA1RsJwjnnh9Ev6xnd0Rma82Z67qo1CWM51rP10?=
 =?us-ascii?Q?0wlM+GXgd2O1/1kygZ6K3kghfX3K4ModNFjm+WuDHG8LEVLmiZy1TBYHK5t3?=
 =?us-ascii?Q?YEF0YlWHGvzj9KPYSMulssEaqCGS6GvHLkrIsbn2gfpcs85OSu4E?=
X-Exchange-RoutingPolicyChecked: LxWAtttiKDaNhhlakHsrM2L+2uNjGTF8naCuDT8TVkW0+A/s+Jh3qjB1T/7b4rJR9e4Vhm6AoKDXqbRUxiG/4/jMnzGfI8bO6GwGFy7T/fsbsvjmPm1uxk4ud6tQ9ja0MC3rD3HMxT7TX1RZbAFx16j/yBot3OZHfoN0UTJox5KM9cdqqraEN7zhYxpm7Zvi8jk6h+E2MAfVWsLi7TEAP4vGwWtQLClAWrvuRU2i3LEYXSms6yfczzTFkok2zGbmwgqfhLAyjYyi3Za+UYdCzAlwBcKYmrqgh2vXbGFil2qLvakDy21sJE5CExN/si4M/H2gnAkmq6JosPqT/eCXhA==
X-MS-Exchange-CrossTenant-Network-Message-Id: fa19a7a1-810f-4676-d852-08dea6297444
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6410.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2026 19:56:50.9192 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cmqEHasI3dvhcmnl/HjSmQI+h5tg4J9RSOE1OmuD7dN/AGiISmBkHqNVvdlH02wUPMVKPIn/vlslK5b4ne/K9HAuNBTMy9xJfMW8qxfVM4tpypFZV7NQfqAeDBuoZBlk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4609
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

On Mon, Apr 27, 2026 at 03:53:14PM -0700, Umesh Nerlige Ramappa wrote:
>On Mon, Apr 13, 2026 at 02:44:18PM -0700, Niranjana Vishwanathapura wrote:
>>On Thu, Apr 09, 2026 at 01:37:17PM -0700, Umesh Nerlige Ramappa wrote:
>>>In secondary queue LRCs, the QUEUE TIMESTAMP register is saved and
>>>restored allowing us to view the individual queue run times. Add helpers
>>>to read this value from the LRC.
>>>
>>>Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>>>---
>>>drivers/gpu/drm/xe/regs/xe_lrc_layout.h |  3 ++
>>>drivers/gpu/drm/xe/xe_lrc.c             | 44 +++++++++++++++++++++++++
>>>drivers/gpu/drm/xe/xe_lrc.h             |  1 +
>>>drivers/gpu/drm/xe/xe_lrc_types.h       |  3 ++
>>>4 files changed, 51 insertions(+)
>>>
>>>diff --git a/drivers/gpu/drm/xe/regs/xe_lrc_layout.h b/drivers/gpu/drm/xe/regs/xe_lrc_layout.h
>>>index b5eff383902c..4ab86fc369fd 100644
>>>--- a/drivers/gpu/drm/xe/regs/xe_lrc_layout.h
>>>+++ b/drivers/gpu/drm/xe/regs/xe_lrc_layout.h
>>>@@ -34,6 +34,9 @@
>>>#define CTX_CS_INT_VEC_REG		0x5a
>>>#define CTX_CS_INT_VEC_DATA		(CTX_CS_INT_VEC_REG + 1)
>>>
>>>+#define CTX_QUEUE_TIMESTAMP		(0xd0 + 1)
>>>+#define CTX_QUEUE_TIMESTAMP_UDW		(0xd2 + 1)
>>>+
>>
>>Should we also add these to XE2_CTX_COMMON() in xe_lrc.c?
>
>fwiu, this is being used to reset/update the LRC on events like GPU 
>hang which seems to be unused in Xe KMD.
>
>Our use of the TIMESTAMP registers is limited to query the LRC run 
>ticks, so I am not seeing any reason to include it here, but please 
>share if you see a use case.
>
>>
>>>#define INDIRECT_CTX_RING_HEAD		(0x02 + 1)
>>>#define INDIRECT_CTX_RING_TAIL		(0x04 + 1)
>>>#define INDIRECT_CTX_RING_START		(0x06 + 1)
>>>diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
>>>index 9d12a0d2f0b5..be1030c74e21 100644
>>>--- a/drivers/gpu/drm/xe/xe_lrc.c
>>>+++ b/drivers/gpu/drm/xe/xe_lrc.c
>>>@@ -788,6 +788,16 @@ static u32 __xe_lrc_ctx_timestamp_udw_offset(struct xe_lrc *lrc)
>>>	return __xe_lrc_regs_offset(lrc) + CTX_TIMESTAMP_UDW * sizeof(u32);
>>>}
>>>
>>>+static u32 __xe_lrc_queue_timestamp_offset(struct xe_lrc *lrc)
>>>+{
>>>+	return __xe_lrc_regs_offset(lrc) + CTX_QUEUE_TIMESTAMP * sizeof(u32);
>>>+}
>>>+
>>>+static u32 __xe_lrc_queue_timestamp_udw_offset(struct xe_lrc *lrc)
>>>+{
>>>+	return __xe_lrc_regs_offset(lrc) + CTX_QUEUE_TIMESTAMP_UDW * sizeof(u32);
>>>+}
>>>+
>>>static inline u32 __xe_lrc_indirect_ring_offset(struct xe_lrc *lrc)
>>>{
>>>	u32 offset = xe_bo_size(lrc->bo) - LRC_WA_BB_SIZE -
>>>@@ -837,6 +847,8 @@ DECL_MAP_ADDR_HELPERS(ctx_timestamp_udw, lrc->bo)
>>>DECL_MAP_ADDR_HELPERS(parallel, lrc->bo)
>>>DECL_MAP_ADDR_HELPERS(indirect_ring, lrc->bo)
>>>DECL_MAP_ADDR_HELPERS(engine_id, lrc->bo)
>>>+DECL_MAP_ADDR_HELPERS(queue_timestamp, lrc->bo)
>>>+DECL_MAP_ADDR_HELPERS(queue_timestamp_udw, lrc->bo)
>>>
>>>#undef DECL_MAP_ADDR_HELPERS
>>>
>>>@@ -885,6 +897,30 @@ static u64 xe_lrc_ctx_timestamp(struct xe_lrc *lrc)
>>>	return (u64)udw << 32 | ldw;
>>>}
>>>
>>>+/**
>>>+ * xe_lrc_queue_timestamp() - Read queue timestamp value
>>>+ * @lrc: Pointer to the lrc.
>>>+ *
>>>+ * Returns: queue timestamp value
>>>+ */
>>>+static u64 xe_lrc_queue_timestamp(struct xe_lrc *lrc)
>>>+{
>>>+	struct xe_device *xe = lrc_to_xe(lrc);
>>>+	struct iosys_map map;
>>>+	u32 ldw, udw = 0;
>>>+
>>>+	if (!xe_lrc_is_multi_queue(lrc))
>>>+		return 0;
>>>+
>>>+	map = __xe_lrc_queue_timestamp_map(lrc);
>>>+	ldw = xe_map_read32(xe, &map);
>>>+
>>>+	map = __xe_lrc_queue_timestamp_udw_map(lrc);
>>>+	udw = xe_map_read32(xe, &map);
>>>+
>>>+	return (u64)udw << 32 | ldw;
>>>+}
>>
>>Should we make this function similar to xe_lrc_ctx_timestamp()
>>with the xe->info.has_64bit_timestamp check?
>
>Unlike CTX_TIMESTAMP, QUEUE_TIMESTAMP is already 64 bits on platforms 
>that support it. The use of QUEUE_TIMESTAMP is gated by the 
>multi-queue check, so nothing extra required, IMO.
>

Yah, makes sense. But given there is a mechanism to determine it
properly, may be we can add an assert here that has_64bit_timestamp
is set when this funtion is called? That way it is less confusing
to read also.

I am fine either way.

Niranjana

>>
>>Other than these, patch LGTM.
>>Reviewed-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
>
>Thanks,
>Umesh
>>
>>>+
>>>/**
>>>* xe_lrc_ctx_job_timestamp_ggtt_addr() - Get ctx job timestamp GGTT address
>>>* @lrc: Pointer to the lrc.
>>>@@ -1550,6 +1586,12 @@ static int xe_lrc_ctx_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe, struct
>>>	if (lrc_to_xe(lrc)->info.has_64bit_timestamp)
>>>		xe_lrc_write_ctx_reg(lrc, CTX_TIMESTAMP_UDW, 0);
>>>
>>>+	if (xe_lrc_is_multi_queue(lrc)) {
>>>+		lrc->queue_timestamp = 0;
>>>+		xe_lrc_write_ctx_reg(lrc, CTX_QUEUE_TIMESTAMP, 0);
>>>+		xe_lrc_write_ctx_reg(lrc, CTX_QUEUE_TIMESTAMP_UDW, 0);
>>>+	}
>>>+
>>>	if (xe->info.has_asid && vm)
>>>		xe_lrc_write_ctx_reg(lrc, CTX_ASID, vm->usm.asid);
>>>
>>>@@ -2476,6 +2518,7 @@ struct xe_lrc_snapshot *xe_lrc_snapshot_capture(struct xe_lrc *lrc)
>>>	snapshot->replay_size = lrc->replay_size;
>>>	snapshot->lrc_snapshot = NULL;
>>>	snapshot->ctx_timestamp = lower_32_bits(xe_lrc_ctx_timestamp(lrc));
>>>+	snapshot->queue_timestamp = lower_32_bits(xe_lrc_queue_timestamp(lrc));
>>>	snapshot->ctx_job_timestamp = xe_lrc_ctx_job_timestamp(lrc);
>>>	return snapshot;
>>>}
>>>@@ -2529,6 +2572,7 @@ void xe_lrc_snapshot_print(struct xe_lrc_snapshot *snapshot, struct drm_printer
>>>	drm_printf(p, "\tStart seqno: (memory) %d\n", snapshot->start_seqno);
>>>	drm_printf(p, "\tSeqno: (memory) %d\n", snapshot->seqno);
>>>	drm_printf(p, "\tTimestamp: 0x%08x\n", snapshot->ctx_timestamp);
>>>+	drm_printf(p, "\tQueue Timestamp: 0x%08x\n", snapshot->queue_timestamp);
>>>	drm_printf(p, "\tJob Timestamp: 0x%08x\n", snapshot->ctx_job_timestamp);
>>>
>>>	if (!snapshot->lrc_snapshot)
>>>diff --git a/drivers/gpu/drm/xe/xe_lrc.h b/drivers/gpu/drm/xe/xe_lrc.h
>>>index b544c8169967..178d9519b196 100644
>>>--- a/drivers/gpu/drm/xe/xe_lrc.h
>>>+++ b/drivers/gpu/drm/xe/xe_lrc.h
>>>@@ -38,6 +38,7 @@ struct xe_lrc_snapshot {
>>>	u32 start_seqno;
>>>	u32 seqno;
>>>	u32 ctx_timestamp;
>>>+	u32 queue_timestamp;
>>>	u32 ctx_job_timestamp;
>>>};
>>>
>>>diff --git a/drivers/gpu/drm/xe/xe_lrc_types.h b/drivers/gpu/drm/xe/xe_lrc_types.h
>>>index 93972536214a..4bca394ff024 100644
>>>--- a/drivers/gpu/drm/xe/xe_lrc_types.h
>>>+++ b/drivers/gpu/drm/xe/xe_lrc_types.h
>>>@@ -64,6 +64,9 @@ struct xe_lrc {
>>>	/** @ctx_timestamp: readout value of CTX_TIMESTAMP on last update */
>>>	u64 ctx_timestamp;
>>>
>>>+	/** @queue_timestamp: value of QUEUE_TIMESTAMP on last update */
>>>+	u64 queue_timestamp;
>>>+
>>>	/** @multi_queue: Multi queue LRC related information */
>>>	struct {
>>>		/** @multi_queue.primary: Primary queue corresponding to this LRC */
>>>-- 
>>>2.43.0
>>>
