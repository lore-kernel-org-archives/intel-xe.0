Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98224CD6E79
	for <intel-xe@archiver.kernel.org>; Mon,  8 Jun 2026 17:02:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41B0C10F789;
	Mon,  8 Jun 2026 17:02:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fUPASTKJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1290B10F789
 for <intel-xe@lists.freedesktop.org>; Mon,  8 Jun 2026 17:02:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780938128; x=1812474128;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=zpDOzRArrkrxYmOr5PbLAIIjLTNsLvAyEWo89Mx95Y4=;
 b=fUPASTKJBcpPSx6pJs+INxZ317wQdbCcNdlyjk1Pzr8U6H3eb0pownbb
 mjDRDxetHb+Hnd4SVH1qoAf4TpoaZhK5+kw7F0/ar7NQxVbHyzIz5g6Jx
 Ds+Mnr0XB4m86U2BpEOhY4TFNKsUGhgDV0KEze2F4VKNab6wrYTLo7kbs
 +t81Aivsp67FKSjPARWhfy+6Yzwv07uxNK8C4CGvlzZSPYXVKJ3kQTMUz
 LZwA/LqJ35nzbxuA4Qn0oK+xGs/q7TcpTiJ/R/kYm6aJ/udHVUJKAYrLp
 2+Nxu2Xtjog+TXfRTGQ1jGowbHfanAECKSCVAsC2L2JmJ+cMG4CTcVRlI Q==;
X-CSE-ConnectionGUID: sv2oJ0RGS3qd+DD2mw8Xuw==
X-CSE-MsgGUID: RaFsItfATaiPoYKtcNrNiQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11811"; a="92248742"
X-IronPort-AV: E=Sophos;i="6.24,194,1774335600"; d="scan'208";a="92248742"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2026 10:02:07 -0700
X-CSE-ConnectionGUID: tvJpQyFrQsSYOzHOBGhTPw==
X-CSE-MsgGUID: cZIDRMKsT6WjQs5vN4clxQ==
X-ExtLoop1: 1
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2026 10:02:06 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 8 Jun 2026 10:02:06 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 8 Jun 2026 10:02:06 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.18)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 8 Jun 2026 10:02:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tb/Clyr4Y9pOmCUTx0iXcG0ktIYFqS8qFYXVHLAFZBQtQjufy/Z9kdGtNF9Nd2m2OZYgQYX9l38zzz0ShEKDHsKZMSKGyijGEAi8wdVaXQ9Wq0WB7LOuIdHSOz+RmMgitl7weRKHfSEqJF3HMxemnyJ5ccZZt/cyozOCiKsGSnHLzuCljF3Htk22MEDIcY12CSLEFreYMP7Jk9m236ScKs5otRCO6jSevq4uF7lRXvDdPhf3MeLo3/GFlB496PxT1vh7I3VoCoqgO9Jl71W9r2EXz2cve1wDStLZ+wY5isIiQ4HN4b9bdmji+JdiTtrieNSGqYesM3jGx0piDoHoew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MxhNks8v6MxakouTBcza2yiKIK492cdwiU9ks7I4FVc=;
 b=FaZAcWetbrUGsr6R18CnMdpO7ZhvB2qRPloWN77c1p8voXx/Oxq4cyalTN4RKM3Mi4M7/j80/gq/rGwhS+zCVLfTOdDMR6YTV7LJiO2LPisgRFmiFFUyYzhjNRi8pBWHDOIT/8cVtV7yW3pVqcnniGR+WmaccuL8grXfmKZlt5P7B/AVD4SnkCqWSjQF7OEiOgC0ZbVVC6DsLZKHOKZWfrnnw5g9E2p+kUJySqg2nOE03kPmLKJJge7g1W78hVxO74fG4VbeJjoVT9hwAe+YHSYONt8aD9JezV3e221CSLbSV1H1lRniJIsnNQY2XzSMrFUut1B8bfxHGOWiWCTD7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA2PR11MB4972.namprd11.prod.outlook.com (2603:10b6:806:fb::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Mon, 8 Jun 2026
 17:02:03 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%4]) with mapi id 15.21.0092.011; Mon, 8 Jun 2026
 17:02:02 +0000
Date: Mon, 8 Jun 2026 10:01:59 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Sk Anirban <sk.anirban@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <badal.nilawar@intel.com>, <riana.tauro@intel.com>,
 <karthik.poosa@intel.com>, <raag.jadav@intel.com>, <soham.purkait@intel.com>, 
 <mallesh.koujalagi@intel.com>, <vinay.belgaumkar@intel.com>,
 <michal.wajdeczko@intel.com>, <stuart.summers@intel.com>
Subject: Re: [PATCH] RFC drm/xe/guc: distinguish wedged from recoverable
 cancellation
Message-ID: <aib1h6RWQXViTG4i@gsse-cloud1.jf.intel.com>
References: <20260504192801.2542945-2-sk.anirban@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260504192801.2542945-2-sk.anirban@intel.com>
X-ClientProxiedBy: MW4PR03CA0023.namprd03.prod.outlook.com
 (2603:10b6:303:8f::28) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA2PR11MB4972:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d66163c-fa4e-448c-2e4b-08dec57fa947
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: V/ROLMxsUSCqcgPQPDMecd+OmmPZBA0U8XsKTDv9gaIFrouzGBUYoyJbRFzb4PXKFTfpbU5fVPuQ0unilxFaql5XmS4cuXlUMx1A84ZUaG17/pa/YDHgJW3r3XfDF4+wal7GBCYF177DQB5w9N57wDPY3AyT7TD1XTOi0Pl6/GSLmnCKAllP1+DNOgtg/jtFk3wUfplPBGQrAi9Ew9Nf7W+jUeDbB3+AtLXvu8E7TR+TDFEMLS40oGIvg6FTMuKzQly8Wt9vfe3/EWCafX23RLc2rIYHVdqoJXMfv7IglJxufHZIJNRx5ZTlTunb3YHHXY9qefcnl16AuUndmTICyvYYo55gYjhi41Z7eY25PDH2q/OYMb6LsbYzczf6y6aRJItqc7ZTiR6CKLNipqW7rrVMf87CRZaI8KJRF/97Ndsnq48HMt11z+dXFlPf92eRVUoXXvW1DTZf2IMpCXPHozCXQmqz1ZHIn/ONr/Vh7jXWBMws/cuHV7A+5jHYUA0x2kf+DzKeOmMAW0JA+y2BFPW2q32zw/5hkVJ8EBo5R/52DlEHy3txhZL+AvjipBARPZFwiDFQOEkgMJexcuN1pAZgaQixOr36rq7l/tDsIT3tpnR6LNTd/Eke3sJ4hjbPlFTtCkPS+J5YW3H9dpWwo5R14LJ6Ee3vArz5IH5R4rx+W0dQIUmRDXwpJuzoj6yy
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(11063799006)(56012099006)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Yy8xWVV3N3BDQXVUNnVRRnhRa1pWZFRORGIzTkRpbnVlYmNmYXdZRjM4S3lw?=
 =?utf-8?B?RjJFT0E4NWFUbFNjV2w1NlkxdUVzNXZteU9ETldlNnlmTW1aeEF3WVdpcFhO?=
 =?utf-8?B?VnNqelA1bm14WGN0K0RvbXNHaVMvOFZOV0FwMThWb1dLdXBBaUJoSHNNQndW?=
 =?utf-8?B?VytxOWQyOG9WUHdIMjhmWnFEMzFRS09keFNOampJaEc2b1VrZHRZd2lMWGFC?=
 =?utf-8?B?Y05neDc4NnRWUmRYZmhyVGZGZU51Q2ZReEQvZHhuU3NpRkVFdkp5NzcvanMz?=
 =?utf-8?B?NS94aWV0YndENjA2eVFWb1pEZ2Z2MGc3T1d0M2RuWUZ3TkkzNXhlRWhlMzVH?=
 =?utf-8?B?NTIyMmJVZWJUTDYyQm5NZ2U4Mk03LzRvOWVOS0dXc3hFV3lFVXdvT0ZTeGsz?=
 =?utf-8?B?QTVqRHhqRm5TR0ZkWXZCaDNjWnJmWitIRGRtVWVLZFdpMjdOV21OR1pGL0pk?=
 =?utf-8?B?RmttZ0YwN2lYQ2x3RTE1dWNTNFFyQ0l5dUg0MG5zd2prNVh2ZmJOQlZ3UTBn?=
 =?utf-8?B?RkNJWVc4Y3NsUW1SOXhFcmwwWGtEbkRjUVkxUklLSW1LYWthZStYenVPOEpS?=
 =?utf-8?B?UmJ0c2ZTZURuaE1xWW5zbVoremJFL09VVlBGZ1UwaHFBUmhzMHh4NnhHMkQw?=
 =?utf-8?B?SUxYaFdhejhhQW9xNHQ4akkyNXdYeDlSSzBpNGVqMlREazZFSUhjYXBLZkFX?=
 =?utf-8?B?REpQVVdzZTdmci84VittUkN4V2VtVnU3Z3cvYVdsR3ZvU2hrSS84dyt0Q2xp?=
 =?utf-8?B?Njg5M0xIcmpaTlhMNWp5NDlmaFZiUzhBbXNwYXdNbldiaUdRQWQxOWNkeFdj?=
 =?utf-8?B?ME9lZXlzTmhuVnBTcU5OQjR6NHlKcEdCZ2doc0gydnhORm00TmdsMWhCWDYy?=
 =?utf-8?B?OUVXZWtkUW5MK2l6VVJ4ZVY5Qi9TcXV0cGRwY3lKaHg4d0E2b1BOcDdZQ2Ft?=
 =?utf-8?B?cHlCNmZsNWkxSE85eFh1bjNUT01BOWc0Vlovdlo3YkFvMjByM3haalZpRFFS?=
 =?utf-8?B?S3hGQ3BPM0dOdmtsQkNFMEw2b1FxVXFDck9uSlVlOElMZ0N2SU1VQjhOSmVq?=
 =?utf-8?B?d1N3Um02L1pLaHlldCt6MCtvTnJEQ3FaS1YxSjMxaENQMGQ4QnlYa1RpZmQy?=
 =?utf-8?B?S0R3ZW9PYVp1OUh4VjlYdEhsTzVsZmo2aXlzYWtNUko4Rk8zcjBTK0wwM2Yr?=
 =?utf-8?B?ZjJ6aExldndHUHRHSGprbk9PNlZCNUhiLy9rSHVrVkpEa1lHY1MxVWZpeXJI?=
 =?utf-8?B?WXRPQ1phYkVTWHZjZHNLS2dDRUhjcTRmMmtKSFJpbVFTOHFaSGUvYUtMdzN1?=
 =?utf-8?B?QlVsaGhlOWVNRHZaMHdESFFVeVpSWkUyZlRRNHlpOHhwZFZ2VWpWTzNvSHI1?=
 =?utf-8?B?aDBEZGhPUG81Tlg4UTZGQk8zTjJ0V0pmQjU4bUEvSGRJY0VYVkhxRWhsc1pM?=
 =?utf-8?B?S3pHM0w3ZTdDMTNiMTc5dXlmSmdRZVdRTDc1NXJaQ0pWOVpDem51WGR4OEtr?=
 =?utf-8?B?Ym9UTkM0anRpN1lsUzlvUTMwWEJrcXRkTlpuQlhxS0RBdmtZMHRwVEpPa1VR?=
 =?utf-8?B?UldCbm9acUNidHB0dzJwMzFuaFFFZXpyUkh4ZElkdUx6TzNjL1F3UlQvYWJr?=
 =?utf-8?B?OFlleTFMb1RDQkFham1xRFFHYUY0dVlRTFQ5d1hJalhvbHNjR2pzcXhNRDFD?=
 =?utf-8?B?YVpIYml5VHhlMVh2aktkZks5YlQ0RGVXK1RXenBxckxKTjZPWnJnWEdBUzZw?=
 =?utf-8?B?QmJqOG5Id3l0VGtuN0J6TFNFNmlqTE1CNW1tWkxJRkMvSU9rczFwT0lwbjFy?=
 =?utf-8?B?WnY4NUlIbnRhQnR6RW0zSjhHcjMyTGNvSEk5RkF5NDRCYVJzN1VtcHM4cVIw?=
 =?utf-8?B?ZFJVYjl4ZW5peFhiZVZhc2pRbzVkY3g5Q3JSRlZyQ3g1MVdwd0YxWlBENi9Y?=
 =?utf-8?B?QW1wNzc4dlR2MkhLbUlGVnMvVHIxamJmSjVnMHMvWHNZcExWUnZ1U1BycnRy?=
 =?utf-8?B?KzM2TWpSNTJ2RW5ydm00aXVPMGltVFJ2b2pzVS9HSmRsalR5UFAvRk9Qc1FI?=
 =?utf-8?B?V1l4dldoYTVEQmNiN3BUWlpOZGUrTUJ1Z0dHWjhQREdja3pTNllKRmljcW44?=
 =?utf-8?B?L0IzL3o4aFBxNnRVUnROWEJGZGFIREFMeS9GbEV2T05FMms0Smk0QVNYUGg4?=
 =?utf-8?B?YTBFaTdBZk54Y1RSR0Q3cTJ4NVUvRzQzZ0hpWVFzRmo5UHVIYnJOR0RXdE03?=
 =?utf-8?B?WU5XSUFrU05YYnNIZlEwQnhETFB5d0NBd0k3RlBLZUFLaSs0azVvb3B1dGJ6?=
 =?utf-8?B?Wjh5eVYxN1lGZjQwemhyeHZoNklJUWhFTnJRdmI1dUpaYmE2Z1lEZz09?=
X-Exchange-RoutingPolicyChecked: W8PY18wHBe7jgfvrDKjul5ZeqSJv6sbFdRtHtPZm4hkU7YSRSNYU/VFdawzRZLOvOpMd0jFGC+EnjFqFFA7ptGtJ5wRXyBz8vMVh5GJzG9mnmiWqzdB0ks/AXqjPDm+JCFMNih4mrh/2igOh0FEV9aKmw0FPNo56uE6JhUqgJWmGhWoKDrZqkt4p4koUfZDW84ssUfTNdX7SaoM1EYAjQw5ORhzPdVgGEgh38muZEhojV+IC861YE6PJbqyckhEkPwIlHa4lzNdG8EdNremLdYNdNXysS0NiDXcnhV2UwOm0hGr4xbThTT1HBavqJbfjRG1Auzrnpj0HUqg5pPawTg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d66163c-fa4e-448c-2e4b-08dec57fa947
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2026 17:02:02.7634 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YJSWP6PWeAQavrAop4D1feJ5IZa4jGYZNUHHzaYGu/YIXrmeWmYLlqTwelECvp1+WN+IYC2RoTki+FKW1pe5Bw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4972
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

On Tue, May 05, 2026 at 12:58:02AM +0530, Sk Anirban wrote:
> The CT layer returns -ECANCELED regardless of whether cancellation
> is due to a GT reset or a wedged device. Return -ENOTRECOVERABLE
> on wedge so callers don't need xe_device_wedged() checks
> to suppress spurious error logs.

I don't see any checks at the caller for -ENOTRECOVERABLE to suppress
the error. Is this just a hypothetical use case, or will it be handled
in a follow-up?

In general, I have no objection to this patch, but we have a large
number of error codes returned by guc_ct_send that mean different
things, and none of it is documented. Since we are adding another error
code here, it would be good to include some kernel documentation in the
codebase describing all possible error codes that guc_ct_send can
return, what they mean, and the expected actions.

This is something Copilot is fairly good at—creating a baseline patch
that we can then edit and review. We could also review all call sites of
guc_ct_send and ensure each one is handling errors correctly.

Matt

> 
> Signed-off-by: Sk Anirban <sk.anirban@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc_ct.c              | 10 +++++++++-
>  drivers/gpu/drm/xe/xe_guc_engine_activity.c |  2 +-
>  2 files changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> index a11cff7a20be..b7d38fa80675 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> @@ -1057,6 +1057,11 @@ static int __guc_ct_send_locked(struct xe_guc_ct *ct, const u32 *action,
>  	xe_gt_assert(gt, g2h_len || !num_g2h);
>  	lockdep_assert_held(&ct->lock);
>  
> +	if (xe_device_wedged(ct_to_xe(ct))) {
> +		ret = -ENOTRECOVERABLE;
> +		goto out;
> +	}
> +
>  	if (unlikely(ct->ctbs.h2g.info.broken)) {
>  		ret = -EPIPE;
>  		goto out;
> @@ -1371,7 +1376,7 @@ static int guc_ct_send_recv(struct xe_guc_ct *ct, const u32 *action, u32 len,
>  	if (g2h_fence.fail) {
>  		if (g2h_fence.cancel) {
>  			xe_gt_dbg(gt, "H2G request %#x canceled!\n", action[0]);
> -			ret = -ECANCELED;
> +			ret = xe_device_wedged(ct_to_xe(ct)) ? -ENOTRECOVERABLE : -ECANCELED;
>  			goto unlock;
>  		}
>  		xe_gt_err(gt, "H2G request %#x failed: error %#x hint %#x\n",
> @@ -1690,6 +1695,9 @@ static int g2h_read(struct xe_guc_ct *ct, u32 *msg, bool fast_path)
>  	xe_gt_assert(gt, xe_guc_ct_initialized(ct));
>  	lockdep_assert_held(&ct->fast_lock);
>  
> +	if (xe_device_wedged(xe))
> +		return -ENOTRECOVERABLE;
> +
>  	if (ct->state == XE_GUC_CT_STATE_DISABLED)
>  		return -ENODEV;
>  
> diff --git a/drivers/gpu/drm/xe/xe_guc_engine_activity.c b/drivers/gpu/drm/xe/xe_guc_engine_activity.c
> index 2b99c1ebdd58..f43ca1c76f75 100644
> --- a/drivers/gpu/drm/xe/xe_guc_engine_activity.c
> +++ b/drivers/gpu/drm/xe/xe_guc_engine_activity.c
> @@ -473,7 +473,7 @@ void xe_guc_engine_activity_enable_stats(struct xe_guc *guc)
>  
>  	ret = enable_engine_activity_stats(guc);
>  	if (ret)
> -		xe_gt_err(guc_to_gt(guc), "failed to enable activity stats%d\n", ret);
> +		xe_gt_err(guc_to_gt(guc), "failed to enable activity stats: %pe\n", ERR_PTR(ret));
>  	else
>  		engine_activity_set_cpu_ts(guc, 0);
>  }
> -- 
> 2.43.0
> 
