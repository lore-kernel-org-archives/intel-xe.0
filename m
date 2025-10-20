Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77B22CCD193
	for <intel-xe@archiver.kernel.org>; Mon, 20 Oct 2025 15:47:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DC3A10E2AD;
	Mon, 20 Oct 2025 15:47:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="btBNLI9o";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDAF010E2AD
 for <intel-xe@lists.freedesktop.org>; Mon, 20 Oct 2025 15:47:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760975277; x=1792511277;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=4nM7j9kFDNxRd5fPh3P6NEhzzTzqFuuDYuPEV2B2C0w=;
 b=btBNLI9oQAc0Ql+1b+Jq0v1tSWnNjGfMTfJ/NuXdaNjAvmPhOXBV47oD
 F9jVl+F7FrFXOMVef6fXlv1f/u1pait+qeVJc5fboEXsKYCL3mhJQvUxn
 yoOc4q4LbNZUIbBurfeY2oEwvo0U1IzNBC8UehiksLr0L1bos9U8VnxVT
 QBHUYUTtuCvpNyn/kzlXqHuZ9pL5raLfmPfHlMmuXpYs4m+hDv1m3o0Yk
 kjQL0Hs53BS+TLHBgj40JxSnbSKrCYh05EMvlP96Z3yfsLp6Z2deEY1/S
 DQjC+bvelqCo91zTpvBxV0XC61BtxDs0dd67wkryYKdJbMT+oEtorqVIP Q==;
X-CSE-ConnectionGUID: 3iyjgwEBS8uKeBdQi2G1Cw==
X-CSE-MsgGUID: QKZiu6UOQPmJ94JbZ8ruTQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="73697180"
X-IronPort-AV: E=Sophos;i="6.19,242,1754982000"; d="scan'208";a="73697180"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2025 08:47:56 -0700
X-CSE-ConnectionGUID: Z/FQqVUaS02mm1Hxb8PIHg==
X-CSE-MsgGUID: wpWw11FzRlufKs+ag0G3hg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,242,1754982000"; d="scan'208";a="188644476"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2025 08:47:56 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 20 Oct 2025 08:47:55 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 20 Oct 2025 08:47:55 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.42) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 20 Oct 2025 08:47:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sl13c8K0216kx2DxXXadpCnQVm18I2MdiyPbMx6luttv7kI/mmF3pUPp1faAKjfc8C3lwgRXOUzLSn5MmqbmzFyOOE5C7JUHhLEUxF58zCrkgAPcX9Bb4QYOkrFlr+UlVwLcGw1VF20uMiAzdBJuDK2Kr939NK2gRBIi3HCzCCsv5OlUjOJHp6nx7577cIlfU224lNqtwyo0L+FLv3RZQxAtw1oNZsET6SGv/lfFptVryFQA9+XPXZHyZtzK4UocG9ZrNduszmex11oiBDZ2LADHNLjMuJlxFnI4+B6TcTBUtaI+AQOnuiKriYrBDUYEKPMN7WaJQjbBcJcuj/6N6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P9p29KEiJvnFYJH9BW5E5hNbnEKyGwIgLrQ5mZhjdRk=;
 b=x2tpty8APmqXQtNTm4Z2l9EoPm93XzFurkE37njPBV2Wavw63/Cha0RmKk5oXufE8v+pJhyIudh7GnG9HVf+L80rrXF8cMRbBBYyCk3EsKDNbCDcg5GbRjJd3VwtdP27FXVgpn05VRBHTAG3uBJDwFP+7C63g1xjJ7BUrfLAahYu3WJVtSRiUaCE4k8P/OQrVy95MXTv7zwAa9/9l7boc0sPPPW1/Hc9RrQ5Bbjr8YTf1EEiwiucstAaZEWtQRB3Gg5D9/EzeszyzVfTLzuseTXansATX6nbVUOVCo2xqP4EcKms9Nr84uJmbyXmyrbLsXmiJywmEYuQk1Qu9NocMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by CH8PR11MB9506.namprd11.prod.outlook.com (2603:10b6:610:2bf::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.16; Mon, 20 Oct
 2025 15:47:54 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%4]) with mapi id 15.20.9228.015; Mon, 20 Oct 2025
 15:47:54 +0000
Date: Mon, 20 Oct 2025 08:47:52 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Balasubramani Vivekanandan
 <balasubramani.vivekanandan@intel.com>
Subject: Re: [PATCH 2/2] drm/xe/xe3p_lpm: Add special check in Media GT for
 Main GAMCTRL
Message-ID: <20251020154752.GD1207432@mdroper-desk1.amr.corp.intel.com>
References: <20251019-xe3p-gamctrl-v1-0-ad66d3c1908f@intel.com>
 <20251019-xe3p-gamctrl-v1-2-ad66d3c1908f@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251019-xe3p-gamctrl-v1-2-ad66d3c1908f@intel.com>
X-ClientProxiedBy: BYAPR01CA0047.prod.exchangelabs.com (2603:10b6:a03:94::24)
 To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|CH8PR11MB9506:EE_
X-MS-Office365-Filtering-Correlation-Id: ae9e5c8f-ba7a-4e2b-1a9e-08de0ff0086e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?I2O2db0W8m+mP2Er9KFOudvUFK1UlJK7BxNlCfMzm6mNIeFB0ZjAqdTBDr9+?=
 =?us-ascii?Q?2CihX2bZcCbEjEbssissXYit9oWxsW3bEmk1QRXTL2DaBqQUo3bLgtgLt4vV?=
 =?us-ascii?Q?vKrMM+DStpqZhJiBop8O2+a0l3UyOnBOFm59+W0Dxvofx9MbTKfkTwLu2gJz?=
 =?us-ascii?Q?gpbEX4kzEG6Xm7deEWYZi+AW+Zt03r0y3isv325rb4Z2lDnaVS4oujdv7HiO?=
 =?us-ascii?Q?L8nxgqX5MmSFzDQwpAevhwLAtcOT/5Dyj3dYfy+zJWqUUeOHovRg+iR+bu2T?=
 =?us-ascii?Q?pYwXdW1PpbVIdKwUCtElrL+3M2M6aazMMOOKt3FLtZQoSzWuqzYrFi1NcRmP?=
 =?us-ascii?Q?JwQ2umxH3iaTp8qTIcrfraXfFW4kHW2d9+XeXJDI0Wp373sLJF7PbHxzvY3a?=
 =?us-ascii?Q?QQLtxf02JWpMKF3g6ihBAriNE1Wv1WKJI/ccUnrstQsMatdFZPfhfTb04z1F?=
 =?us-ascii?Q?195FebY0/ygySXJcPoLYwOLSsPOnY1M0CvFxCD8iHWIFp1fidARp5dlrC5Eg?=
 =?us-ascii?Q?UtmC36jIUj9tSZIN05WMpSWqs2CFjR7LrXzfw+kTGAoRPf1SogrW7I74iZgI?=
 =?us-ascii?Q?g6u+jScJLQ4HcedQp9JmflIlYBHGzgOjtT/wSGCOUUPnUPeuIlneotLihQ6p?=
 =?us-ascii?Q?GjvYr8E+wU5oQ9ZzEG8KlVeVXWtVtTpgXYbYsrhKLofmAZ7mvqeep7mBLF1N?=
 =?us-ascii?Q?tFVc8Xacjltv3kJHmVl5m6TRS5GTK9rXVHpsOOlyg19gTmu/QnE2RTcRWIkC?=
 =?us-ascii?Q?qZtWwLudHIkqSDZZSr5XaqIoINs2M4XNQ6oBsICVRaPWdQTKySqQi9dG8Erf?=
 =?us-ascii?Q?UIP2OlG3r12oKdjqITkjtlGxz8qLgnuU1+j+98UHZS+fQ/Swbh2BFu3jB69g?=
 =?us-ascii?Q?MZN3x8Mg1FY4oOAkGWiA49V0S/PHXN113k+LH0gfzL6+LgCju0QweXsVS/Ph?=
 =?us-ascii?Q?BFpY4B+nkyMsY5lQAvLO+AL0sPo/qWg+h5DlUpil1fW9IIIdyV21vdk0Ea2j?=
 =?us-ascii?Q?vdBEFHjtdiSd0N3ILi8gq7oaNDrv0gmZg6LQygOik2Hx2F/Tedfp/HSqSmmJ?=
 =?us-ascii?Q?7uyPLzTTv4RHPfnif7O0/LQ84t3bXuNkjUUx4S/+hsV42OhHvI+cfY7zvllq?=
 =?us-ascii?Q?3Z8otCUfQIuME4T26qUND0dXugvSlyHkftqsLNMClE6ZewGnwEBzuS4rQkpU?=
 =?us-ascii?Q?D0ARBdRY/Fg5fe8C+FD8Qaox/SPuGkxf2s0Y9fMoprv9cQiaV6Tr3Oy1Na0H?=
 =?us-ascii?Q?QPlbi5KCVZjjqsbaRY/Fa2SWQSYHKt/bvtDhrj0iuvvZHiMIFRECuj3bmB0B?=
 =?us-ascii?Q?mgOsSTnyMT/KcKrp7CEnEYHjDyZqmXbQHSu8x287tvMg5Eb7oXwQulUgz7yi?=
 =?us-ascii?Q?6Yy+AdHevSJ+5ow/dh+jMfnblbHdWmdg5ETZCFXhW2HxyA+akyBaX6Cx9S9G?=
 =?us-ascii?Q?4ekq8Y90HGQLIVFN/AtM3cPFnK0DZ0B/?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?eDnodiIMWi6ixjvcFi5Gs2j4768HJjP+wGTxPIeJ06G2+yqlf+7uatVIZ49J?=
 =?us-ascii?Q?+C4p7DzAc3D0FNEtaEqZNYeZWIq/o2fBTbUm9FZR7Gqoqmpz0H3/Npkc8v2X?=
 =?us-ascii?Q?Fig96vwjKMPhvvaeQ8N1ApF9hEuWz8UwBlE+ci8WShT1JxmkXtCKcFX8Fmrc?=
 =?us-ascii?Q?ie70UbwW/ad6Pd3UBzB7kRwkXea21OXEv9aUhzDUxJrH1+vNuwlFCwohjI/h?=
 =?us-ascii?Q?cyvC/k7cTMdP3SP0jAj2EWF73mOF9o0ktcpEgroH7Ym4WfpzOtyt1P17SCIP?=
 =?us-ascii?Q?rP3/8YEn8sY8xp7M8r/ydWftOmBLz8EcbCaM0Ldl1aCUQMyGgB7xLKwUUAqE?=
 =?us-ascii?Q?JKOHd4jj38+ATB5qURDYXyub0TR2isAgq2opboL2BNgzQoZAEc6SZyRoTw9y?=
 =?us-ascii?Q?L7Z/NFeOV6IaZwCekZzdRExm0ulWaSoCyaXJ/K/AVPziGFbHvjHVoPdVBOhk?=
 =?us-ascii?Q?TnnsqTWgFULs/L82sPd1fAuTPJk3H6OizXRzVmtbDUURwWzl64bPrKnKhzNH?=
 =?us-ascii?Q?VSY7Fs6pqTKdXIxSDixePaogv+yQlwmyQfnq29vMLbZwlJaAuCoW+z+ewkj9?=
 =?us-ascii?Q?9oY2HKRvPW0S2UnHn3564ao9l3ori4LPsDkfvOzof71xg9/pvyURyqqYfxyW?=
 =?us-ascii?Q?ck+NbmHrPk3VFSv6m+wEUgbufz5oGAJh3+4BP3bVrRg2Q7BcA63psYx62V+n?=
 =?us-ascii?Q?nYCowcDe/6XTisK3zN4uQcSKetaKck6mBDDKqCFlO+on0ji4boCsLEQrMPR9?=
 =?us-ascii?Q?h/FEHkrXYVEGs5ntNhcHNZVk7R6Pebp6cVMVd+pmNwDW5xBZ41hWXXhBzX3o?=
 =?us-ascii?Q?N1Kd3eRjEKvcJH8V9O0pzfMUUR3C84+G6PiHt+5+yOFe5B2oCgYqrA5E2DOy?=
 =?us-ascii?Q?Gv6hoZSB6HAuTkurBSSiUSXcjke/WaIrdHSfOd3+GX5jKXxWXwZA8iWllskK?=
 =?us-ascii?Q?RHp4fVRBG1a24f0B54MI0tdOAiQMXdnfuspBfGQ5FNwGKU8FKPPNPOgrgxMw?=
 =?us-ascii?Q?81p804G3ZWNozrtxau0JhVJbArPJTVEE/5JIhsijJaDVI1jEoXSDbNaLWQ4H?=
 =?us-ascii?Q?YeMbf2oYawnWp7uXz0Z6Vzoq2vJ9eboPAtuDBrlhT6LFsDcb7Gua0TKhgdSH?=
 =?us-ascii?Q?28jKQw4X8qgij7jwK7Wm1DZxN8UTIw9J1oyBeMjA87ZyTe8CvjQxY/PZrqTe?=
 =?us-ascii?Q?Tc25+iBmra1p9IGK1PdMm5O8M+Fr7S1S4xT319MPbrVc7GAbTQyaaGeVoysC?=
 =?us-ascii?Q?JHsfdXBpKlu4qOo3FET7SEshALLhMqMxEKmB08upMrVmweGdqUBdBUlhwpPF?=
 =?us-ascii?Q?CNxuugBMQwonOJvrfxxuGvv4HkL1MuYo9OwaU1BdqKl8BuWp/OpaERJeaEiD?=
 =?us-ascii?Q?O48IQfNcz4qrVc6BOhmsBxJwJULTOjrdPqSyCuE9mkejPLiMZZp3GHMeC3+y?=
 =?us-ascii?Q?vQtI8gylxSkkXysabScXXw4DfQdGpapLEt7SvOrDRhkE1eeTdhu3tlt25+Gb?=
 =?us-ascii?Q?z9QUpmnOD6DEw3B/qO138GjUWu31wUp/z3N59JUnv8rCsJJ7amjEggwxtXtl?=
 =?us-ascii?Q?MiGpAW17gKDgPA8UlboDCXUGEhLDYCX0ggWyB1FTtvCljQnunFMIEeI4H1LA?=
 =?us-ascii?Q?qw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ae9e5c8f-ba7a-4e2b-1a9e-08de0ff0086e
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2025 15:47:54.3168 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sH5JmGe6pvZdoVwqWSpY1kYTeVg+y/T/siEqJ+QDf1xJfB+ddHAz2pEKHX9qja7cfsipv8cM9hzgFQXa1gXCmsZG2bWMDNTKFhcicd6iQBs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH8PR11MB9506
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

On Sun, Oct 19, 2025 at 07:05:47PM -0700, Lucas De Marchi wrote:
> From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
> 
> For Xe3p arch some subunits of an IP may be different. The GMD_ID
> register returns the Xe3p arch and dedicates the reserved field to mark
> possible subunit differences. Generally this is an under-the-hood
> implementation detail that drivers don't need to worry about, but the
> new Main_GAMCTRL may be enabled or not depending on those.
> 
> Those reserved bits are described for Xe3p as: "If Zero, No special case
> to be handled. If Non-Zero, special case to be handled by Software
> agent.". That special case is defined per Arch. So if media version is
> 35, also check the additional reserved bits. To avoid confusion with the
> usual meaning of "reserved", define them as GMD_ID_SUBIP_FLAG_MASK.
> 
> Bspec: 74201
> Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

In the future we might want to read these out early on and stash them
somewhere for re-use in case other things come up that rely on them.
But for now they're only used for this single check, so this is fine for
now.


Matt

> ---
>  drivers/gpu/drm/xe/regs/xe_gt_regs.h |  6 ++++++
>  drivers/gpu/drm/xe/xe_guc.c          | 19 +++++++++++++++++++
>  2 files changed, 25 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> index 1876f2957c6df..3545e0be06dae 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> @@ -37,6 +37,12 @@
>  #define GMD_ID					XE_REG(0xd8c)
>  #define   GMD_ID_ARCH_MASK			REG_GENMASK(31, 22)
>  #define   GMD_ID_RELEASE_MASK			REG_GENMASK(21, 14)
> +/*
> + * Spec defines these bits as "Reserved", but then make them assume some
> + * meaning that depends on the ARCH. To avoid any confusion, call them
> + * SUBIP_FLAG_MASK.
> + */
> +#define   GMD_ID_SUBIP_FLAG_MASK		REG_GENMASK(13, 6)
>  #define   GMD_ID_REVID				REG_GENMASK(5, 0)
>  
>  #define FORCEWAKE_ACK_GSC			XE_REG(0xdf8)
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index 37e3735f34e63..ecc3e091b89e6 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -1681,6 +1681,25 @@ bool xe_guc_using_main_gamctrl_queues(struct xe_guc *guc)
>  {
>  	struct xe_gt *gt = guc_to_gt(guc);
>  
> +	/*
> +	 * For Xe3p media gt (35), the GuC and the CS subunits may be still Xe3
> +	 * that lacks the Main GAMCTRL support. Reserved bits from the GMD_ID
> +	 * inform the IP version of the subunits.
> +	 */
> +	if (xe_gt_is_media_type(gt) && MEDIA_VER(gt_to_xe(gt)) == 35) {
> +		u32 val = xe_mmio_read32(&gt->mmio, GMD_ID);
> +		u32 subip = REG_FIELD_GET(GMD_ID_SUBIP_FLAG_MASK, val);
> +
> +		if (!subip)
> +			return true;
> +
> +		xe_gt_WARN(gt, subip != 1,
> +			   "GMD_ID has unknown value in the SUBIP_FLAG field - 0x%x\n",
> +			   subip);
> +
> +		return false;
> +	}
> +
>  	return GT_VER(gt) >= 35;
>  }
>  
> 
> -- 
> 2.51.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
