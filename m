Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05B78C52D7C
	for <intel-xe@archiver.kernel.org>; Tue, 13 Aug 2024 16:32:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF61710E38A;
	Tue, 13 Aug 2024 16:32:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PHjqaK74";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6296A10E38A
 for <intel-xe@lists.freedesktop.org>; Tue, 13 Aug 2024 16:32:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723566754; x=1755102754;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=GE7kjPYrvqQaMGdVqd5xpmXul/g9UfUiPNm9R2TCSYc=;
 b=PHjqaK745yoKuVU3v6czorgUIgj8S2KJrfvMgw00xYBppT9a+SExjgmE
 229eiaTYnE0K0a5Ru3nc3tgomUnOYSiReZ4y000ncAWJoAGCE7nZLKVQF
 0m5Xed5mRdkGopeusN9EJBEDO67u2CkTrxAoKcLNmK5PBTHIDw4Fmeiav
 HGZtjd6njR+It0JlbSBpigD62OwIEy+ZmCvBYSrCoGs0knFE6jhCT7nqJ
 hmczw0quSKmFxi5c1W9oRUAa0tnfKhAhOrOFuVy6xhtlHaeV4eZunnwiw
 9b4gj3smBrPl3HOvUXo6FeLA4urp/raErSBh0HKt9CHHpv7rxW9pqLMhl A==;
X-CSE-ConnectionGUID: h1fxdbyOQjC5oyt8USHjXw==
X-CSE-MsgGUID: iNq4W/O1T6GoqjbPTPaBfg==
X-IronPort-AV: E=McAfee;i="6700,10204,11163"; a="24653729"
X-IronPort-AV: E=Sophos;i="6.09,286,1716274800"; d="scan'208";a="24653729"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2024 09:32:32 -0700
X-CSE-ConnectionGUID: Yve9V9OFTbaNIbUfDdYRhQ==
X-CSE-MsgGUID: XLOr/mGfTi6oTA7wdk0ISw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,286,1716274800"; d="scan'208";a="58703936"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Aug 2024 09:32:31 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 13 Aug 2024 09:32:29 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 13 Aug 2024 09:32:29 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 13 Aug 2024 09:32:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iWuUqk0V1KskaQbOkGJX96lgol+t1+G57KnyCgSWWDeurM5WQTHllmavDKYHUYaZKrrncNjHWPsN8htYwzV0gLKHa+CdOj+gTPlwq1xx//8bRR6T38A+7uRs+ILcbsSb7lV+NAwe64oTjQ+zdSR0/p4/faMmcBhqUl88SYGPUDBdYYWWsvNK8geg3rLNT3mDryTYqVaScDJ0OPYMiuGUhAe72vapZ+MZ38g6yqCD0naw83XlZaxl0nYEun+Dc2qy/JejW2H684TwcB9UmQiMtvekIqgb2bcf/6z7x+i4k3g1pH9CwURNenRXOlYt0uM8Rz0ym9N7YPef767GeyxTOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iRKx7e6NY+43WXJkseutIzJ3ckhHC/w3XlLQLcPvhZM=;
 b=aKHwMYYUo/+1TUBpoFNye/ovun5Dhg34rBwrjzJ8OacbSkXr6Oj946+NTEkc88gQ/E5GUtWEGHKcNEcvPr4EdpNMFLVK2HvaN54bqqIaTa0ggViM3MjPUjN7SwNMcix+C8ygRSx8LWeQl0iLBWbhJJ2cAvL38//50Aav1SsW7PQHOSgJRCqg1mpk9S6FB9VeoXa2oPM2+gxDEWZAI6+RTTbmZEo1f2e5fTDgYzGMdpv2kkxRorD8uCNDLt7Sv8hqjMPLmJuoyOWu+qKwEESHUOtLkG/s48HzmEXsqFeibaL8KVMKTBSoLv+Fkyxg1OIiPwedCf2EyhyXyR7Ixh4/iQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6360.namprd11.prod.outlook.com (2603:10b6:8:bd::12) by
 DM6PR11MB4595.namprd11.prod.outlook.com (2603:10b6:5:2ac::16) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7828.27; Tue, 13 Aug 2024 16:32:21 +0000
Received: from DM4PR11MB6360.namprd11.prod.outlook.com
 ([fe80::8648:3a6b:af5c:b6e6]) by DM4PR11MB6360.namprd11.prod.outlook.com
 ([fe80::8648:3a6b:af5c:b6e6%5]) with mapi id 15.20.7828.031; Tue, 13 Aug 2024
 16:32:21 +0000
From: "Shankar, Uma" <uma.shankar@intel.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Deak, Imre" <imre.deak@intel.com>
Subject: RE: [PATCH v2 1/2] drm/xe/display: Match i915 driver suspend/resume
 sequences better
Thread-Topic: [PATCH v2 1/2] drm/xe/display: Match i915 driver suspend/resume
 sequences better
Thread-Index: AQHa5+6LHpYy0mKgZEax1IO+26rXhLIla35A
Date: Tue, 13 Aug 2024 16:32:21 +0000
Message-ID: <DM4PR11MB636002F3D979903509A872F6F4862@DM4PR11MB6360.namprd11.prod.outlook.com>
References: <20240806105044.596842-1-maarten.lankhorst@linux.intel.com>
 <20240806105044.596842-2-maarten.lankhorst@linux.intel.com>
In-Reply-To: <20240806105044.596842-2-maarten.lankhorst@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6360:EE_|DM6PR11MB4595:EE_
x-ms-office365-filtering-correlation-id: dcb23432-8996-411c-b562-08dcbbb58193
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?8dNZF9O9MgLeK6ATmJPQwXq2EqWVlH2mZ0thxE86zVK3Ewop/QVcHzlGsdZD?=
 =?us-ascii?Q?/pNzdDzpV1xmS2Sih4wnBwRwxlqV4x7QQvcEVruyNs/DvQJ/8LqQuta6qSVZ?=
 =?us-ascii?Q?M2OJnpnFOzhY9edovT97RA5iY11mBy6CX60nqmHSlJf2+4i8/p7P6omNfTpR?=
 =?us-ascii?Q?/lPl+EfGJ+0aguTy9mrtYpsSiVZ3hiyTKeh0Jce3yM15C6Jr1ULpQrQAWbIt?=
 =?us-ascii?Q?DiPPpjiB9cmmDdO3enPwwTB2gwXop/iK+XTHLAwk5RE0mDxcHA9gLlJP9+KY?=
 =?us-ascii?Q?zIVbB3toiZI/QXH9SGtUQyRFqF9AKM7T2o9JB8oXmegl8pbg1cNJcnsPuf/x?=
 =?us-ascii?Q?db0xNwfaymVS39NaUtfrdRCh4FFPpt8Om2otFbLf+MXj8Dh8OYnHEmvqAUyp?=
 =?us-ascii?Q?m+dALlcvsS9MxaEDsaInbJwhYGQE0OeQonGmDphMyVbjL8BRyf7rufBozFMq?=
 =?us-ascii?Q?bWS5WvYlvCm1evvup0TsGg9LXR3fKi97DgMRnIZMSvI+a7Xe2iHmEpsvk6wv?=
 =?us-ascii?Q?KnIm/GTtpHi95HldAMWgswCslvaGFajEWY9GWBo1cBr/b0WMpFrf4J51FVh3?=
 =?us-ascii?Q?o/V0UjjTR8zZEvauynmyE6L0pkECm4h8EBGhR60ml1yLGUJdLyKwUm1D731j?=
 =?us-ascii?Q?8z2WOCuf29Xmfj2fGSLXcO+Y1Nf3ywb6fFSgAUc51ipDyEBsO/2WC/Mp4opY?=
 =?us-ascii?Q?r+pLeZY6o3ZsWrMpYsdhLhHfNv0rVqLG35fzbk9FzyohLCOINDQyvLc+m1lX?=
 =?us-ascii?Q?9MCpLGFtkkvHwwrbLvd7epzRrJqFaFX50PTf1zQ4Tg9bQCtZWeHofMm7OV98?=
 =?us-ascii?Q?0cw7cK2et0QhNtbXujkNJZkf8tHBarEGNSlltavJFfBqxmqTG8bCwBw/Y0yJ?=
 =?us-ascii?Q?OoU7MFEtpPYJSEEvGYLkSEa895c4gElmsIzGTcV0KqibMD6TEYYm5rKXuLJH?=
 =?us-ascii?Q?gRu8N4umCl4dvLI398z0rX5tIvLd7RPCfrA2u4KP4zJfBWjfTlJjICOmLAvn?=
 =?us-ascii?Q?hwx82wuLz7vc9AU4CSg/RNRTxsn5f4iCPtBbmcJGeGYMhO60xahekNFFouhd?=
 =?us-ascii?Q?qxYj5Yos6kuaZ5U/TFQ1NVHKrojkLewALegfzlkAYGWnv2dWQF62igbbTIM/?=
 =?us-ascii?Q?QuN4BVoYalsRo2DaJJfnlu1uNe1h+jEmKm/5Yx1kKf/vEuI12eoi+HLrnAiN?=
 =?us-ascii?Q?dbYr17/RUd0gukOZ2U5i/qO3NlsysxIFmU9BieXpelggESUeDWX3BfQsQfTB?=
 =?us-ascii?Q?r+LFTF5Z3IMHjx+Ouegp8H9/uFHf/GeoFG1bBrE+JsPF29iUzzeGp0YW4X0Z?=
 =?us-ascii?Q?TvhxVcVcKbnztJrIhwL1rWWE5woxC4oFGX7oo8AOzXZRKV2f1Zqz0i3ySA5O?=
 =?us-ascii?Q?1cXLS0njeDB4XMJSZ9KuRu+CJGkJcBfMqamyiOYuCw/8CUl7Uw=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6360.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?gimMa1uLvqaqqo5AjSiwxSuGNb7ZD35DztYWovzwzGAh6qWgh/M6KISAx9p6?=
 =?us-ascii?Q?068FuAFzrvUtL1uCq8I1N+J+fswyuDgLNXZY3HATYTdsZ0PHTsujIONK/G54?=
 =?us-ascii?Q?X1GB8hpldSeAajm66Q5ZEHy3F1Cy7uOQhYlRlvhrjAxJSmKi4ujZjtDeyomy?=
 =?us-ascii?Q?d+BR9j6J7Lb06mhEtPPh0Dx4xoyrybOLVllMByWOc5Nn/VQifJBTxXihGjcR?=
 =?us-ascii?Q?1nHSUIkCcqo3vOrY+apayIStDSMhABvuFaMAFtIAR2egy6yW8/6Q8fG71Ojj?=
 =?us-ascii?Q?A2L1wJwZlTDOGSSHjc5wPcN0xXVGqnmcia7jwZ6uUXUHYVpD5tMJD6bE58cD?=
 =?us-ascii?Q?TmNRMcYn+7oLlaT6T2Lef5ZD/OCZ7r0ydXJQNqnlyBGqYGBi4A2nD+8ksb/z?=
 =?us-ascii?Q?91WRFGyo6jXF+p/vzxRsznjHghuJ3sYUUs1otlXMj2OapnErb5oKXYqWfn/r?=
 =?us-ascii?Q?LNQc9MrQrbbjFcpyKzpJaVUheRZLEPt/XMVJ0RLR5drNo2r5quqZTwfYpdxW?=
 =?us-ascii?Q?zUJ3u6NDmj7UOGjkt0XXiQksZnhyDIJD9WKyCO7g1QAR4FMu/k+LmNc6C/vi?=
 =?us-ascii?Q?7N+lrnxOR6qC/2+6hpjL0zBA0nh356l2eQSE6X9xQzwj8iXxriBxXIl6ngl5?=
 =?us-ascii?Q?3jsHTknfNAgh715G8Ex4PctjQ8CFcjmL3SEr6pMUZDk1R+h9j2Gl/omKTYVa?=
 =?us-ascii?Q?D56XUlWXFBnuwTc0pZkK5PsuqZOJX7UuaSdQfyM7oSxYrQFcpkVMXgEmrbBy?=
 =?us-ascii?Q?kJQ0jJvoCFakEfkXD/qlCpimjP8tlU5yrqn46rz2PcHEwN9ER4tzXwNGgXjz?=
 =?us-ascii?Q?Nmbnn1iuU0jZjz1k+N0gRqDfRiIvDcfpPPmKyLm6QWEMp5762qaaBxsfGf0Z?=
 =?us-ascii?Q?TUQTmt3sv1UXunCMjcsIH4kQC02YIcyphVZz2fD21tYiIamwOSbIokzaRUx4?=
 =?us-ascii?Q?uUXujIr2y5ZPWJIKKDXqz14P1tsGCgprTe/vMKFU9TrO0geFoZCCDtZIQHus?=
 =?us-ascii?Q?zbHhkx5oUCXH/mSXW8Cd3/OGNUBnjdcX5ywginP2Q1FQWhXNjH1w09jg17+W?=
 =?us-ascii?Q?BVeJcUNLIqiS/txcHnGVoRkWi66phKmmTO16anLkbGk4H2yvxgT97tFzo2XR?=
 =?us-ascii?Q?ORXIDy76rKL6ssgQDi0H9bPcxHcmjuZDON/moZzDwTSSiX9wCNVPcGmqObfo?=
 =?us-ascii?Q?oy6fVv5CE+bZxNvreUG83AWVK0twrzp310LPz+cow6303b8o+2LjjcNNC4QD?=
 =?us-ascii?Q?OuNXnxGtZVpPponFFW76PflB5pHbLgUTX4MHbP72A2jEwOG0ira3MIhAtghy?=
 =?us-ascii?Q?NMWaWbnUldSmlrI6inf9imDX6TRKiOwRR7iyVW8Qcmt1y4N1FIZtiF/YLf97?=
 =?us-ascii?Q?V6HAzEsS/np0giz7saIpjkBUB6WoRi3sDesl9rQKkPagCtBf/smAi9dZZMSg?=
 =?us-ascii?Q?fFdloa3Qo56eAxwloP8B5lln8BfXC8WlBldWyi+rXCVQiA7SjSBnYgxvNYuW?=
 =?us-ascii?Q?3ooVixpX7xFN6vkEhJi7/P6GV1mJj/3S1czFjbkZ52xeXmpb02ythSE+vZ3w?=
 =?us-ascii?Q?3GVoM3mLfnzXTnEIfcqliXJ10j2KncjLVsVh223T?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6360.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dcb23432-8996-411c-b562-08dcbbb58193
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Aug 2024 16:32:21.6645 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OJiDFfAoXxuV7kBotfY3tuwqwyTXiRnj+gzdHoEQOPCNU3gLfgUMw/BlPg3+OfQCOtEVLAuSqvXBPghxZD9sMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4595
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



> -----Original Message-----
> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Maar=
ten
> Lankhorst
> Sent: Tuesday, August 6, 2024 4:21 PM
> To: intel-xe@lists.freedesktop.org
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>; Deak, Imre
> <imre.deak@intel.com>
> Subject: [PATCH v2 1/2] drm/xe/display: Match i915 driver suspend/resume
> sequences better
>=20
> Suspend fbdev sooner, and disable user access before suspending to preven=
t
> some races. I've noticed this when comparing xe suspend to i915's.
>=20
> Matches the following commits from i915:
> 24b412b1bfeb ("drm/i915: Disable intel HPD poll after DRM poll init/enabl=
e")
> 1ef28d86bea9 ("drm/i915: Suspend the framebuffer console earlier during s=
ystem
> suspend")
> bd738d859e71 ("drm/i915: Prevent modesets during driver init/shutdown")
>=20
> Thanks to Imre for pointing me to those commits.
>=20
> Driver shutdown is currently missing, but I have some idea how to impleme=
nt it
> next.

There will be some cleanup needed to avoid duplication in i915 and xe, as h=
ighlighted
by Imre and Jani as well. But that can be taken up as a separate series.

Changes in this patch looks good and matches the behaviour of i915 wrt to s=
uspend/resume
init/de-init flows.

Reviewed-by: Uma Shankar <uma.shankar@intel.com>

> Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Imre Deak <imre.deak@intel.com>
> ---
>  drivers/gpu/drm/xe/display/xe_display.c | 19 ++++++++++++++-----
>  1 file changed, 14 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/display/xe_display.c
> b/drivers/gpu/drm/xe/display/xe_display.c
> index ca4468c820788..d544d18ad1ecc 100644
> --- a/drivers/gpu/drm/xe/display/xe_display.c
> +++ b/drivers/gpu/drm/xe/display/xe_display.c
> @@ -294,8 +294,11 @@ void xe_display_pm_suspend(struct xe_device *xe, boo=
l
> runtime)
>  	 * properly.
>  	 */
>  	intel_power_domains_disable(xe);
> -	if (has_display(xe))
> +	intel_fbdev_set_suspend(&xe->drm, FBINFO_STATE_SUSPENDED, true);
> +	if (has_display(xe)) {
>  		drm_kms_helper_poll_disable(&xe->drm);
> +		intel_display_driver_disable_user_access(xe);
> +	}
>=20
>  	if (!runtime)
>  		intel_display_driver_suspend(xe);
> @@ -304,12 +307,13 @@ void xe_display_pm_suspend(struct xe_device *xe,
> bool runtime)
>=20
>  	intel_hpd_cancel_work(xe);
>=20
> +	if (has_display(xe))
> +		intel_display_driver_suspend_access(xe);
> +
>  	intel_encoder_suspend_all(&xe->display);
>=20
>  	intel_opregion_suspend(xe, s2idle ? PCI_D1 : PCI_D3cold);
>=20
> -	intel_fbdev_set_suspend(&xe->drm, FBINFO_STATE_SUSPENDED, true);
> -
>  	intel_dmc_suspend(xe);
>  }
>=20
> @@ -347,14 +351,19 @@ void xe_display_pm_resume(struct xe_device *xe, boo=
l
> runtime)
>  	intel_display_driver_init_hw(xe);
>  	intel_hpd_init(xe);
>=20
> +	if (has_display(xe))
> +		intel_display_driver_resume_access(xe);
> +
>  	/* MST sideband requires HPD interrupts enabled */
>  	intel_dp_mst_resume(xe);
>  	if (!runtime)
>  		intel_display_driver_resume(xe);
>=20
> -	intel_hpd_poll_disable(xe);
> -	if (has_display(xe))
> +	if (has_display(xe)) {
>  		drm_kms_helper_poll_enable(&xe->drm);
> +		intel_display_driver_enable_user_access(xe);
> +	}
> +	intel_hpd_poll_disable(xe);
>=20
>  	intel_opregion_resume(xe);
>=20
> --
> 2.45.2

