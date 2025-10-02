Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63956CAC5B0
	for <intel-xe@archiver.kernel.org>; Thu,  2 Oct 2025 14:45:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DD8710E1BB;
	Thu,  2 Oct 2025 14:45:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZUZy1IX0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5339210E1BB
 for <intel-xe@lists.freedesktop.org>; Thu,  2 Oct 2025 14:45:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759416328; x=1790952328;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=/Sv8tDiYe5GkzREeuYymCoS20hIr9IQGJWYP4NcZFAI=;
 b=ZUZy1IX090aF/JmsOgKD1jjCez/8i7u9YNFCAcWXAMPfOq1P7yMuGTfi
 Jn2DXHXMRTSeq6IclzkCuKL8Uqbu6efpRcM8+GQn4Q5xWK+XZMMtY+1m1
 FC4jaqb2HXw3K+dokcl2YJ9iSYDim53IWQSraCKOrXXGJr8VsOeKpWNdX
 R85canrCPL4FVqPcCclzchnY1PF5GMdH5Hey3lXWOqWRWkdQRDM/EZHxJ
 TxFfR4kEUuTVmAvC6MJM9qh/Qc7ldLq7mZ1CtLTsejLItxyhkDDhV1wwC
 pke6KgfXU69vnn3VJUk0dZSle9UOXkQ9XEUc9DNNxZBaWfYiBKHGB9YKO A==;
X-CSE-ConnectionGUID: eQgPRiCzQiCwIuDtxycbIQ==
X-CSE-MsgGUID: Kd5NJwJcSryHMYPedcvnjw==
X-IronPort-AV: E=McAfee;i="6800,10657,11570"; a="73052126"
X-IronPort-AV: E=Sophos;i="6.18,309,1751266800"; d="scan'208";a="73052126"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2025 07:45:28 -0700
X-CSE-ConnectionGUID: Cq3EZRgfTR6qjcJ1PmxA6w==
X-CSE-MsgGUID: F44O9IXgSLOdDvwzSCbTdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,309,1751266800"; d="scan'208";a="179503801"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2025 07:45:28 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 2 Oct 2025 07:45:27 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 2 Oct 2025 07:45:27 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.2) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 2 Oct 2025 07:45:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B4c0XzU6Oln0FKV8jg9cjcLKvsENGCPShsNpHKC3eo/d1tlgS/AYqc53IWBOqG2gM97xkeNlf4HKqYWx+mrfgSAHQ0ZUtdS4keZhT5TDYiIlq68tqjGqmKB4sRE0ck0cYtNe71lJf6JJ5w+I3aOcFxGXSzvO6fLcGETNqady3N1EZdaeMGakFCeeKKVUkIN7U6yCD9lfQraPa72SjG4+TpfZ/7lYh2BlvWjPN5rvP/Mjp+m0yi5F8qIK5T2hFBtV8mpfg1L2eGm3PrMIoeY84MJOJwfACedIj2MWwHC+U4CEG/HiocG0k272e79EaSz6r79kHd+1HPZkMuRfykisfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uqkqjJDFbIldgPGOuaxkfTePoyjX5PRZrnWchjucUa4=;
 b=vTgDKOe3XnlbCj3lhe1wBE9751f7FACQDy2KPM8gJFIKfjxMXVn7jueqhELbUjqKfjeOtZu63yxX1DtrRrfQo1RKAKjZsRf/JxSloxfq8Aix8EkPNQaTGmrpYQp7ea4cmZ0jRP2wQ069ya46ZAvEySivvG7fzvBEJ52Szj+qB+oXDRa1tXDr2jfQIPuO7OBmxQ4unp3NT8i1OfYjTDfVQBWwTq0B37zXFoznKaz0Z0WnjQz6lL7IuRI9KD/bVzyKZa1DYMx5V+p9bqvFVab/G4JaMwUNvV1jAyoHBe5UVhyQbUKUOcElRGLN/jRmK39uEBPYxMq6VWEVInMq4IScuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by PH7PR11MB7001.namprd11.prod.outlook.com (2603:10b6:510:208::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.16; Thu, 2 Oct
 2025 14:45:25 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%6]) with mapi id 15.20.9160.018; Thu, 2 Oct 2025
 14:45:25 +0000
Date: Thu, 2 Oct 2025 10:45:22 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [CI 00/13] CCS uncached mocs 0 test run
Message-ID: <aN6QAvE0zQHy_1Rj@intel.com>
References: <20251002142453.25574-1-tvrtko.ursulin@igalia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251002142453.25574-1-tvrtko.ursulin@igalia.com>
X-ClientProxiedBy: SJ0PR03CA0058.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::33) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|PH7PR11MB7001:EE_
X-MS-Office365-Filtering-Correlation-Id: 6c5cdbff-1725-4af5-f3d5-08de01c25244
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?6QdfTdeQRO2l9KGjp+Ee2qEPeL/hU2DJrQr4PAhAjVEdjFviTCbug5CA94cO?=
 =?us-ascii?Q?DkxA7FNmOafPwMvYZQczR5kvqyggwtPPiH8KiW7T21SbvBRpXOzrPa71AM6n?=
 =?us-ascii?Q?KRdBmGtaJu8Wv8bogBqiE7URB4WCDyKLk5e0dtfA8oHKwItprXilnCoeRKws?=
 =?us-ascii?Q?SJD+Xj2EWfLIRpP204vJPsUEcPWQssRNvhBk3t7OBp6tBbwjVwwyhJZhy6nZ?=
 =?us-ascii?Q?Hey3LwmtGb7mvwbSgWBMylsx0uGsk7HKV5AnBin3qkjZ8bMR9dx1UZTLrWs8?=
 =?us-ascii?Q?9gseoKVO5QG4Qe0tqnBjMrhRlhwZtXhwRkDbbbUZSaGoTIDGqolCDJwyCb9Y?=
 =?us-ascii?Q?dRoLW5Rwpwg6YorH05IMOP8e9gMJyUJkZyrAfQURNfjxAbongdzHD/MGkZ72?=
 =?us-ascii?Q?zUAfBMSu5GILj6RPuOqesxV/wR7E+C9bfi4BHhkUiUReAFL1crtICnK9pRAU?=
 =?us-ascii?Q?mmVNmYFRSpRCbA4TR9wkdZFnFypWJjNDFxFbxzut7vqH/wO/+LbctQKUW0GS?=
 =?us-ascii?Q?aDhQ12OdcNzjZgJDu4Yo7kiXYmeqq79f+ek34dJ0RnqeFAJXkFKhWkBgOaCf?=
 =?us-ascii?Q?JIBbm1pKj5xeiaJLEj4ZCKotoCt0yLFPxn8P6ROddfEcN0fENxpounMqs3A0?=
 =?us-ascii?Q?oEMN22xhFamRFP3kYfZh6EikTLhu2VAKBVCjY3/po8uKgW3yYF3ERQHCw9/S?=
 =?us-ascii?Q?v1520UqcItFCA8aMfVDb9PGvFhl4NMB3n0z57Lpw5BOsaKe6FsUp3xMeDAV5?=
 =?us-ascii?Q?9jiUxcY+LxL2wegCBfrCetKb7K+HHZLwTViIY6+BqiL5Zf2Jsz/tMLvdWYfW?=
 =?us-ascii?Q?Gk69YHwbcQCoqKsqALKDgaiPs9gCHUK+NU8prowA43i/gW85YGzlsZuDJ//s?=
 =?us-ascii?Q?4DFQoIofZv3/mHdx4G9ZsK9COpEr9SCVHydBLE6xikXaVZ60Pg+762D3tExh?=
 =?us-ascii?Q?xdrLfNMJ9Ln4Y9UBKzXYDlXH8tKvPw/XE6IZJ+jaUnjotUpZHWO/K3HYLZBH?=
 =?us-ascii?Q?KJnGlozLcGaOFzjicmxyL1nm7ZdTAEWNUSqVmC55PrgjWxRMJQ/9tZqmDh1D?=
 =?us-ascii?Q?m8+u0uv4OCiXwiogUKDMT9BPx5l1Lnob7c8S6h4gVbZHlNIYTZAm2+ts4jno?=
 =?us-ascii?Q?wBC/n2OXrvbalcsb833L0ZEKCgOMeGNaSCiaknDZy4aGYfN949TKv6CuxSoy?=
 =?us-ascii?Q?N/Qk4yee/30NmMTvTdyphaoM9PKL7UE8IkbAL19zSsKn8WwWU/ltORAC+VVh?=
 =?us-ascii?Q?NjNcz7IZXfPG3tB9EqeOXD00HLsFvc4EY57svasobZOQL5mxUpm8CSL+WqTE?=
 =?us-ascii?Q?yEKbWEwBozaPLpQ5Bl5klAsYP/Fc1rFLb3BOzH6fZmrfSL5ct3NSuKYWXifk?=
 =?us-ascii?Q?IK+gOPFVX9zPotZ37WbLmGMQikWTJT5gXjT6yObdOa+hz7ruNNxXhPpM/nFq?=
 =?us-ascii?Q?zLK5yg7iKCoNosceQStqVcbKy1KvImpo?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?cfJ3cBRLVF5ZyJkvoZD4qR5CczvS/kBIIp9N8RryqJ/fZO5fUkxxzBnF7KoX?=
 =?us-ascii?Q?YkTt+9g8vkugVTgYUcHZyipRx69wRZNvuJB5EwLoSvKVEJUafKkxn6b3yfRJ?=
 =?us-ascii?Q?hbmHIyGeeB84qGXheBuP+mL3c0gPCmPGj6XdZuXX3eFDbnXrQmo5F0lU6Ucz?=
 =?us-ascii?Q?qPoahyWHe15MDRDZ/2mFibiyTlsC6dBU05vYxiy6ndyj9ru7rnFqFo4fiAHn?=
 =?us-ascii?Q?MHBh1tkuIhM0XJ7b1fsCqRMLAXPG4rXcmAI81/oeCNVxFJiWN82j2jjuj7ti?=
 =?us-ascii?Q?ybScKc5Ko9fP9oPfggCptAS2hxpcvKsG/HE8cZGvtGHUX3hni+uvxLBzxoQu?=
 =?us-ascii?Q?v/xqE8VSNzHbzxDNJV6BGsOxHnpR+CHAYNJG3Usf1JEV817h6+i1HkAeA6e+?=
 =?us-ascii?Q?OKZv/MV92BC0IIJTqnigzD7BbUtdaOG7Fa2CrzMZ31vhzRTbjCw3AyiG+VPw?=
 =?us-ascii?Q?v+Gcw7A7OY9Ulq3f/oPcn4pUAJTDvOxYOUhVC19lIWx2ZcPLi0j4kLQQ2ysN?=
 =?us-ascii?Q?HjXoTT8X/bMVXhgfQ62XaNhrqC9P6o/GtrCengwVdo7bjRkrAnrsvgPcnvMp?=
 =?us-ascii?Q?dOMQLOFexjZW7U39eU3HAWmKPSjAopHvKT39WYj35CZ3CMQrW7DPNob6yzp+?=
 =?us-ascii?Q?sFVgtOKfI4H9u74oQf9V41WzPBRYPl95EX26OV40/nnyQfw28hSga2hfyWkT?=
 =?us-ascii?Q?6V64PckJpsf+aP/mMDHwOqW6SuV+ODZwd/ueEBLfHQ99s8RJgVAkeCOX4Z01?=
 =?us-ascii?Q?Mg/F+RgLfInzQuKUlDo3RdsdUo2kcAtEb5dyh+vqsctylioXpcj3c++5v7Ov?=
 =?us-ascii?Q?kjmDaRekD2MxlZvcoQg8jy5qZgs0jYTtjKB9j+zHKe+xqSkj/FI/BiqoJmbS?=
 =?us-ascii?Q?Wl/myk/iA4rR1ufnopVpYCCmdE8UVipeB2inPKDAh7RHXhMRoQAwikltUiRy?=
 =?us-ascii?Q?T6Id2Uq1W3tzhs5AK43WaQxV4ezjqhLfZJa6KLdGUixCxBybHzOulzuLUy6B?=
 =?us-ascii?Q?9+hP5kvCmDjgO2ztp8gTjXZB0iHv1NEdZE8t7FkJH08Yx/F82MmCT3TCDId+?=
 =?us-ascii?Q?DE1k838VI7qGQjBmKBL35aoA/YFa8IDimxu8G13JlQ2+zpZ7x6CvXps5sGRM?=
 =?us-ascii?Q?nkA1/mshDVmLLDC4O+Vf2nv2QtHB2e8Avbw1XmsCaGyqMjjwosO5VOGCOmxA?=
 =?us-ascii?Q?MC34iCOvgpxUob0BXePdja7UcM7NLcwv/CMTq2wS9hQIwvz+3IGiqTHTbLik?=
 =?us-ascii?Q?OmPB4n7N20R89a7pGMnHWYidbyzfZsAhcZndj9NkTqVjZmLBEJbyi50VFL5A?=
 =?us-ascii?Q?LHt3Xvy8nsRKG72lZWSR01zBCanFzAa6VjW1mi1i9YMbv7w7HWVWTzmO1q39?=
 =?us-ascii?Q?Hp+0K2jS39rsfQyKUUuZtS5Hr6w7cTGxx5uP7WdaNMM9xYLrKVEZSdPGoT3q?=
 =?us-ascii?Q?YRxb8+AdjigBteBh8MdlE19/vd8l3ITU1D2xfY8uagLu+p7V2N9TA7dJiCop?=
 =?us-ascii?Q?56APH/4vwamh5KgEHcTVJB9wzaHfwRPtEYYzjG5UXBP4A/bAAns0Jg8yOUYv?=
 =?us-ascii?Q?MsLayJxR+wP3kIIgx9mhUbpHPeRKOtjDY6m5ACoyWdPTwxv8WjRZPlxNN3md?=
 =?us-ascii?Q?Jg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c5cdbff-1725-4af5-f3d5-08de01c25244
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2025 14:45:25.1180 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i9rd8V8Wixg1OkLTFInMCvbuf23pqM8+90RPswlmOpcMMP1RNHcxeuw7MJtbLSUe63zIBbBwtLeiybN32cg8Sw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7001
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

On Thu, Oct 02, 2025 at 03:24:38PM +0100, Tvrtko Ursulin wrote:
> HW hardcodes mocs 0 for CCS?!
> 
> Tvrtko Ursulin (13):
>   drm/xe: Fix ggtt fb alignment
>   drm/xe/xelpg: Flush CCS when flushing caches
>   drm/xe/xelp: Quiesce memory traffic before invalidating AuxCCS
>   drm/xe/xelp: Support auxccs invalidation on blitter
>   drm/xe/xelp: Use MI_FLUSH_DW_CCS on auxccs platforms
>   drm/xe/xelp: Wait for AuxCCS invalidation to complete
>   drm/xe: Export xe_emit_aux_table_inv
>   drm/xe/xelp: Add AuxCCS invalidation to the indirect context
>     workarounds
>   drm/xe: Flush GGTT writes after populating DPT
>   drm/xe: Handle DPT in system memory
>   drm/xe/display: Add support for AuxCCS
>   mocs 0 uncached

what is this?

>   drm/i915/display: Expose AuxCCS frame buffer modifiers for Xe
> 
>  .../drm/i915/display/skl_universal_plane.c    |   6 -
>  drivers/gpu/drm/xe/display/xe_fb_pin.c        | 159 ++++++++---
>  .../gpu/drm/xe/instructions/xe_gpu_commands.h |   1 +
>  .../gpu/drm/xe/instructions/xe_mi_commands.h  |   6 +
>  drivers/gpu/drm/xe/regs/xe_gt_regs.h          |   1 +
>  drivers/gpu/drm/xe/xe_lrc.c                   |  38 +++
>  drivers/gpu/drm/xe/xe_mocs.c                  | 247 ++++++++++--------
>  drivers/gpu/drm/xe/xe_ring_ops.c              | 164 ++++++------
>  drivers/gpu/drm/xe/xe_ring_ops.h              |   3 +
>  drivers/gpu/drm/xe/xe_ring_ops_types.h        |   2 +-
>  10 files changed, 400 insertions(+), 227 deletions(-)
> 
> -- 
> 2.48.0
> 
