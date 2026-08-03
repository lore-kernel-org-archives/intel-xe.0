Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65780C5516F
	for <intel-xe@archiver.kernel.org>; Mon,  3 Aug 2026 04:32:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9523710E436;
	Mon,  3 Aug 2026 04:32:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DdEu9NOQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28D4010E367;
 Mon,  3 Aug 2026 04:32:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785731568; x=1817267568;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=FiTLmPTXsebeJigVsq81v5ml1qOWZSRUlQ0Qp7xc7qM=;
 b=DdEu9NOQrz0lXpz1zYNdXQLq/BcwXO/7SjW3larmSlxa2SvrKrqyD6+l
 +AW/zmebb2euAU4JAKHm+1agvfJUxfK6QG5qYkz41A1Sd8RckOOJ7JsB4
 jN5y1/PYGTDgmK0xEkDg4DRmcjLdi5QPOIeyXrbKYJ4nUHgtq18aUy5fm
 DF7oPzSZKVKltJZ8Stsr6v0E790Or6ZtoUE5R78W7Ftv8NxHsl9TZmdcz
 Vi6ZxuHj0xvThSbYthYd+hg+XIOcnRn0esRlFazFRVFiLak6CXnoWqTyY
 8Uz3ZUDXzWcf0Ipb4I80XBQeE8lHsmBilrklykpK28VQmBDzpW293u4CV w==;
X-CSE-ConnectionGUID: p1i/TFcHRGGpXiTJHsRrMg==
X-CSE-MsgGUID: ySlE5q52Trmom5OD15OBsw==
X-IronPort-AV: E=McAfee;i="6800,10657,11863"; a="96919795"
X-IronPort-AV: E=Sophos;i="6.25,201,1779174000"; d="scan'208";a="96919795"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Aug 2026 21:32:47 -0700
X-CSE-ConnectionGUID: /BZ2K+0US+yLJSAynq72bQ==
X-CSE-MsgGUID: cyGToD6SSOaDk1EwmYLTqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,201,1779174000"; d="scan'208";a="258443674"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Aug 2026 21:32:47 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Sun, 2 Aug 2026 21:32:46 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Sun, 2 Aug 2026 21:32:46 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.40) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Sun, 2 Aug 2026 21:32:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YD4sE7b/71R6GU8+HwVaoGhc92J6+FWMbGFugY1ud6rwZ2TK6cx1JhLej8VvB3Vrzl+4ltmPkn+cGKMkgnR7xWYDf7XgskiJj8FtV8fH0lVRcsW6rUo2UUm3ALzYoRz3sAdWMtkrqVVUgLNmdHbobh+CijHyfe4WOV8lgW6F53eDgoeAAU2JAQbJrIyMOxGl5+oqFxyW6XLeSeQcb0WkSck5AsePRvQC5YRrsVWW/zN8xKEWt7ulsvNVCzbZzur+tM6cjUzVsKCOSN9w7Y5jCQaF7S0gg0hZBDutY2xym7O0KWySLhxafh47RyuLhvB+8hXwMWXU68C2P6X8sScjfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zWf5SJsnWmUgwUg9QIhm0mJ7GCcwkCMgLePijECj1l8=;
 b=s9ED1UTXCbY2TtxrLVspvo5+I/F9A/0EyWDMmOYNfI5DhAKnB1yMEETgH3suBKpAsRLB99TyBurSGZ1Mzm1qTtVD6/WLr4GKAoAKqGjyyYkE+WoqCE/b7FFYSgRW6NFHY02UYjqNSryYQGqurxVlflcnSLjalqeP6H6wpHuzgF7yTDbOzPEtbuiKluXk170GQx65bzPcyQEa+pf1mntYJzyaoVEyPMrAxh8rsnfhJ1Slh1xCqbFs7g2N3ryM61Zz9urXD1QQSp5AVcanCbzuXLE4zMep7uJVtitaoKuc69lc5RX2C/0s1+0b+VrZfGaLrPngDox6uxzBk3vPi9dkKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS4PPFE901A304F.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::5b) by DS0PR11MB6352.namprd11.prod.outlook.com
 (2603:10b6:8:cb::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.18; Mon, 3 Aug
 2026 04:32:43 +0000
Received: from DS4PPFE901A304F.namprd11.prod.outlook.com
 ([fe80::5be7:2ceb:99ef:6334]) by DS4PPFE901A304F.namprd11.prod.outlook.com
 ([fe80::5be7:2ceb:99ef:6334%8]) with mapi id 15.21.0270.012; Mon, 3 Aug 2026
 04:32:42 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "alexander.kaplan@sms-medipool.de" <alexander.kaplan@sms-medipool.de>,
 "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
Subject: RE: [PATCH 01/14] drm/i915/hdmi: Use correct type for output_format
 parameter
Thread-Topic: [PATCH 01/14] drm/i915/hdmi: Use correct type for output_format
 parameter
Thread-Index: AQHdIBPyXUo2SUtiI0mBoFioa0xQXbaLwdgQ
Date: Mon, 3 Aug 2026 04:32:42 +0000
Message-ID: <DS4PPFE901A304F3721E80E96C9750C2F1AE3D52@DS4PPFE901A304F.namprd11.prod.outlook.com>
References: <20260730105226.2731341-1-ankit.k.nautiyal@intel.com>
 <20260730105226.2731341-2-ankit.k.nautiyal@intel.com>
In-Reply-To: <20260730105226.2731341-2-ankit.k.nautiyal@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS4PPFE901A304F:EE_|DS0PR11MB6352:EE_
x-ms-office365-filtering-correlation-id: ddc1376e-fd52-47c7-09b8-08def118426b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|23010399003|1800799024|366016|38070700021|10067099003|56012099006|11063799006|4143699003|22082099003|18002099003|3023799007;
x-microsoft-antispam-message-info: QhZ3PedcbELe9ExheK1TQUFFY/cNwCH5fpIyZ9nNzWu1mPcL08JwOvUTG1u3/7/e8z44c30iuNnnNZ1OQx0r2nXiRg7gmaGpwpfAJjOICm/ZwZ1VgVZtki3Eq2kgKZjihHpkQvBqnpCOh1HVU5KDB8+rTUwuf9J3IWHEA9Fw1FsA63rRTvU7ny9hfJ2RTIqLy1tyirXNDZ6EX33b5u4ztu0JxTUaoET8hJ0JrR1lG+WvMc5aoxdHsC29pCED3qIUaLQdJ8qt8IR12+kcpB4qZn6D6zydeUFlylA+7DdB+7Sio/7hIauUON/smV4yn9C5hvpsLx/n+brwbXaCZJ6v3i/XPHpGeSbAoIe+avvobQ3G6GCeXPzycNz4JRJl/kSX1nXzSQE3sQfsSSJYHBZxwOKO4tsMw1udWklxTWWobUfgqGzrTR8GVARYwMweWefKIB9DPDhegEvfIYCFnKAvaYmLYEToxx/D+qFnGbt5BevT42NBV4bEjasOwVsNJlk/e9WbnoGxRwN7Rf7ErX6UKX3r/9oQdQ2VjR6lGyYwGMQtui5+kSa9Qd8W03JKSo27c/oZyEnabW3FGd5sJb7YjcIQF4KazY1G8nHkO7xZikDCnQ92xNvTObDP5dtXKAovLv1URuJKQwWN9iWgZtlNKh6Y7vtGysq1hs1rpL5aAk2NgB93nX/hmb5oH/qr0dp3aaz3IgnTEx9FSbEaXfNJuQ32UaiNyDDq+yRDohvrmfc=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPFE901A304F.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(38070700021)(10067099003)(56012099006)(11063799006)(4143699003)(22082099003)(18002099003)(3023799007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?YMmdzAwyj8rBjKWsxskKmoStthhxLWYbgkJ9RNzvezspCBt/UQNHTpNS+Q9E?=
 =?us-ascii?Q?TxtN+0SaKFRx1O4Izc1ka7AfydYHk/17ZV3VuQMmK512rFcV3EpY3izVP3c9?=
 =?us-ascii?Q?m7tYINEOWQipicFA8MpPnL6iJWrevRLntjTygH/tbno30FZ1V1gT0cQ0BKhn?=
 =?us-ascii?Q?rR1qIN4lIAMOttJOA6w8Sv/g1TuMqliHQikpY6cdrRTMyKasi8qyiQvaOIx/?=
 =?us-ascii?Q?HsSeTuv5I5FrRworzuavU1t/bGnGgIETCAAyacDoZNlcCal2ircO/zf4VmCi?=
 =?us-ascii?Q?EhNt1FoCCnqbU9GJku+cU6ST9xoAGbGyTfkQbGXhoLynXiOHWt72MJ+aW2SD?=
 =?us-ascii?Q?Unq3gabCP3DdRrICfIcIft4f/grJ6guc+lH5X66Xlu8Qi0Ra5/tDYnWP0Wcv?=
 =?us-ascii?Q?wDM0HsqgTmxUBFhuF+ff9JwmZuzMucYtyPpq6XzEUQX5+XjxXy7qw6aci+wp?=
 =?us-ascii?Q?IVqE/u0o7Vq9N1xIwbca05gByt+EueF+HVBwwZdmqcEouaDB81vBUpYTsTPJ?=
 =?us-ascii?Q?raX+92nN+LxR+GasNHgg1RKYsKcbR6H9TNmsqKChR4Mq88UavlX0YxpOPj5G?=
 =?us-ascii?Q?5Gm8iV+J81gIXnkFXUl2wr0eHS6wKfiIbqn7Wg+R7eHRucWxxftj64yX+9El?=
 =?us-ascii?Q?hiU7w+0aRuDkdYtKreephzAX4QTd5OhfTgfQKXF71s4iA+et9FCRQDjTSqWF?=
 =?us-ascii?Q?t2k5grfkA6wxjkdT7hJPLoUs86/zrAArKLGZjtYPeqrkGtSBk//xluYB/i2G?=
 =?us-ascii?Q?mGOwtNPpNCwMdfbNY3/imAyK+AkB/xA/uYH/pSTSjeOY7WTyJZcmqkz/rrb6?=
 =?us-ascii?Q?lkKe2AtMUexP9L+qAwnuKnx67y3CorqAM46bruxh1CzSZcxaedyj5MwlRYRn?=
 =?us-ascii?Q?WGiiFzjVRRGeA4XOjj6sNxrQYE9FW4qCydDcr9VBNYEg2iuzCbHJYA+VDbDp?=
 =?us-ascii?Q?I/0JkcJJ6qrDlnIItJU/i+Ze2oK/nSZV5Sn8DpO65fUF1q0pVXf30oHkieTB?=
 =?us-ascii?Q?SMwGpcbTB3qiZxYIljYU0yvl4a9Mt9OUqa3P3BHT2c6n3V29OsGHl6qu+GrB?=
 =?us-ascii?Q?8dXIxkOW2iPRB23muzitCp2K3vcQ0kIf0wnwx5cRzahWPXIHsZil+H2V4tkG?=
 =?us-ascii?Q?8/BAGkkyGEhKwFRJt6TDMWmE3uln0BryyTfdT2u8kOVYRMzR+SX2whFMa/g6?=
 =?us-ascii?Q?BeHimZHIsZdBhCnxeJMVHp0ngmr11dQhe3gDz5CRy7nuMSy/ocW1MAOLYGJU?=
 =?us-ascii?Q?epeUphx8sxit7q3w7Q/zM/1heQ5GmsgAIMAqYZ2LJyPVNd0LnJonI3qlKxyQ?=
 =?us-ascii?Q?OZy1dehDqJ+RKHmywsHwx3sbb3HZrbNF9rCrDLV1+fBL3BBn3oz/AJSeRdwQ?=
 =?us-ascii?Q?Xo6PRRg5KSxUF4UBNpGTLKWgj3OSXev12+kS6almFmAlTnXO9uOLaH9JPMww?=
 =?us-ascii?Q?xrrLyqAlJ8/FWHI+9dnhlxf5i2WvIyW7BXT5ljvMmCJE97BgA3HIdDhC4kd2?=
 =?us-ascii?Q?bOihNF8jUG3HiwAfJtvqxmwItLkiBhEwvmJ1BGGF6Ab/zg8OIaHPuzOBpD6q?=
 =?us-ascii?Q?bmGN4G1aApCjkKjTBlJsnSj53Lsff9/xRfMRHV2BVFsUQWhlPp5ZrXkfuoh9?=
 =?us-ascii?Q?zzlNFlyMnyfHJyTcsSIY9l9GkZR6LPePeLREIVAq+uQWXhhN51h99l/A0YgX?=
 =?us-ascii?Q?HLJVs+XQOA7R7SOSnmRdwFHcOgIu/XkM2fKwsEt0Ryu5Hg7NpzOX88+AtBCN?=
 =?us-ascii?Q?17PQq7dP1w=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: nDn9t5QXYjV+Qrces5R3JXZR5j7yUWNQWCi2u+m5FCQ9Ymz0ket3kfZw5DpUGI5/wj8/UhEWDSSZE7L1MtWj1FuGEWL5zWb2sWJgCYkkSwhuHzZ//V2tTjFF5L/8rqdicbVmdU0eZbftBzxihovGQMsOpCWDF3p/ekM6llqx0FohTDmJTorkYjukvis/0AmnDz3THbn32osyIQds34wC3adtSIJBO7/9lo7zH6KhRZeSOV5M33ZcHB+8M6qmOEuML+91DO/QqqpTeI3xp2QpmbzXBNagwzNCFMFdi5l6u+4Q72K1sD20F93Dmnu71u7rjp99tGeimknuHInaok/nRA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS4PPFE901A304F.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ddc1376e-fd52-47c7-09b8-08def118426b
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Aug 2026 04:32:42.8723 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tM1dqmx069z4qSc6tkf2DSszp79l3Qj6IUBhUMAikFuAiThflz4zW1ZAYwuXUBsoNORtXKGwQO1TTvQZjIDkAQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6352
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

> Subject: [PATCH 01/14] drm/i915/hdmi: Use correct type for output_format
> parameter
>=20
> Correct the data-type of the argument output_format to enum, for the func=
tion
> intel_hdmi_dsc_get_bpp().
>=20

This should have a fixes tag

Otherwise LGTM,
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>

> Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_hdmi.c | 4 ++--
> drivers/gpu/drm/i915/display/intel_hdmi.h | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_hdmi.c
> b/drivers/gpu/drm/i915/display/intel_hdmi.c
> index 8a019d3574df..9af0f3aba0fc 100644
> --- a/drivers/gpu/drm/i915/display/intel_hdmi.c
> +++ b/drivers/gpu/drm/i915/display/intel_hdmi.c
> @@ -3338,8 +3338,8 @@ intel_hdmi_dsc_get_num_slices(const struct
> intel_crtc_state *crtc_state,
>   */
>  int
>  intel_hdmi_dsc_get_bpp(int src_fractional_bpp, int slice_width, int num_=
slices,
> -		       int output_format, bool hdmi_all_bpp,
> -		       int hdmi_max_chunk_bytes)
> +		       enum intel_output_format output_format,
> +		       bool hdmi_all_bpp, int hdmi_max_chunk_bytes)
>  {
>  	int max_dsc_bpp, min_dsc_bpp;
>  	int target_bytes;
> diff --git a/drivers/gpu/drm/i915/display/intel_hdmi.h
> b/drivers/gpu/drm/i915/display/intel_hdmi.h
> index 0fa3661568e8..fb950fdd0e7a 100644
> --- a/drivers/gpu/drm/i915/display/intel_hdmi.h
> +++ b/drivers/gpu/drm/i915/display/intel_hdmi.h
> @@ -54,8 +54,8 @@ bool intel_hdmi_bpc_possible(const struct
> intel_crtc_state *crtc_state,
>  			     int bpc, bool has_hdmi_sink);
>  int intel_hdmi_tmds_clock(int clock, int bpc, enum intel_output_format
> sink_format);  int intel_hdmi_dsc_get_bpp(int src_fractional_bpp, int
> slice_width,
> -			   int num_slices, int output_format, bool
> hdmi_all_bpp,
> -			   int hdmi_max_chunk_bytes);
> +			   int num_slices, enum intel_output_format
> output_format,
> +			   bool hdmi_all_bpp, int hdmi_max_chunk_bytes);
>  int intel_hdmi_dsc_get_num_slices(const struct intel_crtc_state *crtc_st=
ate,
>  				  int src_max_slices, int src_max_slice_width,
>  				  int hdmi_max_slices, int hdmi_throughput);
> --
> 2.50.1

