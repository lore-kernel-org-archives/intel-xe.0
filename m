Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 087B9CA0EE0
	for <intel-xe@archiver.kernel.org>; Thu, 14 Aug 2025 02:35:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EBF110E052;
	Thu, 14 Aug 2025 02:35:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nj1yuxIN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1878E10E052
 for <intel-xe@lists.freedesktop.org>; Thu, 14 Aug 2025 02:35:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755138928; x=1786674928;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=QwyQGSld0F1CHRMz2Ytoct+jKlz7trIeLnmxNczlMn8=;
 b=nj1yuxIN9GredZ7L7ORBfmnFMA5LhZ0l+As0we33Ch62mU/eiRWE/BTs
 CzW85YLZk4sR0pTR/mB+OZNhIvBcHmo9RV93t3DLLPhDcyBXRBSoPS2C4
 G+hXeXFk4YUBmxX+LQJ94wcKvvsjiMM1reBss96nG2jy3iK+tErpQICo0
 +OhQ6xAA/v7PktEEfjw0pjP7CAq1pWQ684fh/nXk8DGNvD3j3AQVy2tlJ
 fwOj//stO+TOaM9B5Cbh2IFz+TOlIAD04ZoWEfQYPw0ayp8/VcSYXuYDE
 nFsjzXHIyWq3SQJolSVORbOjP2echolDrpQJzq+ObFZZGbG3VTK+Qx1OG g==;
X-CSE-ConnectionGUID: Y9D1vAc+SMyM38QipHPm+A==
X-CSE-MsgGUID: xqfvmmtoTs2+IzGmblz/fA==
X-IronPort-AV: E=McAfee;i="6800,10657,11520"; a="68901926"
X-IronPort-AV: E=Sophos;i="6.17,287,1747724400"; d="scan'208";a="68901926"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2025 19:35:28 -0700
X-CSE-ConnectionGUID: tjw+LbmGQOCxZziXwTKnRg==
X-CSE-MsgGUID: itFXSok2R3aOuldZEdV2yw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,287,1747724400"; d="scan'208";a="166284456"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2025 19:35:28 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 13 Aug 2025 19:35:27 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Wed, 13 Aug 2025 19:35:27 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (40.107.236.63)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Wed, 13 Aug 2025 19:35:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QXlR+d2ug6yLojh4DnOzKRqCOD1meQzvyPMjsgrg1E5cZ9lcNh7M6PQt5U4U9J0QiXEEJtwUdR7GtSZNmS2XsaIeYmq+C6gfpbRotE7DATGJtIrdCufcltb2dfo4XazLXCFP4O190mjuXZxAZxx7XPcObiEb7Tg97+G4KHkLxDPHLT+Zc341o30RkcavBBbA/e5Xiy0zHeTE8615NYgf80gkgpi32OSip5aIUllQLsLtZE8kTkv4fyt9X0yN+r422n5ZVmA7TxUMEIPTeCg37rjAzAL+Y2hGhZoaC7Qj5WFYFMjklZfEoJ1Kvjl/mk2WPaLxnCbjB7p/v72aGRRVqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=asv0OXTXgyNdlueG8Hpk7KDPTteaLOhNeMpaYnZWO9g=;
 b=P6DjBKpYzTp4eFZJ+qhpXkHCGlj8hhxai+BlpgYJbjOkNGeJf6L/vYcJhPxm/8w5OoCEnqoq/jYQBIUTu6DtXQ1Nu0pBWkAHIYHsAOGtn/syDW8+6FW0POSZJT7ifiT9V25pJSnfkYsHvhAbB3ItQ0/bTv5EERM4jBopoSHArdSO75fksqj3utZRazcV05VA/C3W8ln/mukIIyhOl9/VPiGQSibLqhL41RVr1r7F7sXxQrCZLRBMfcev7/bKgWaSo7NMiT3r2R297ktxB1typ/bDKmRv3YzG6MhmuuWuL+q/6uLGr+al5i9nrHGjAGVyojZeKroqeOaHIV008hgT+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA2PR11MB5132.namprd11.prod.outlook.com (2603:10b6:806:11a::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.15; Thu, 14 Aug
 2025 02:35:20 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.9031.014; Thu, 14 Aug 2025
 02:35:20 +0000
Date: Wed, 13 Aug 2025 19:35:18 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Jani Nikula <jani.nikula@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Matthew Auld
 <matthew.auld@intel.com>
Subject: Re: [PATCH 10/15] drm/xe/display: Convert __xe_pin_fb_vma()
Message-ID: <aJ1LZg8qMm+EZq/d@lstrano-desk.jf.intel.com>
References: <20250813105121.5945-1-thomas.hellstrom@linux.intel.com>
 <20250813105121.5945-11-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250813105121.5945-11-thomas.hellstrom@linux.intel.com>
X-ClientProxiedBy: BYAPR11CA0076.namprd11.prod.outlook.com
 (2603:10b6:a03:f4::17) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA2PR11MB5132:EE_
X-MS-Office365-Filtering-Correlation-Id: ce7e74e7-80e6-40c7-ebfc-08dddadb363e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?yMc/lH35zdJqgTcyErC0cXLHHyXDIwfj65tx4Lyw8YyL8/h+iqwX9x1XY/?=
 =?iso-8859-1?Q?dSeHPCcKvrmAJSo3l7FfzJ3Q6JkNr7O6DGqqZzsPIQ3+nQOXfQSFg22Igh?=
 =?iso-8859-1?Q?q6K/ZA56ktLPJioQIcapbCDESLL5EAemNZVs0x5tC2WdyoCUVrK/L6XBXC?=
 =?iso-8859-1?Q?/NYQeF5dfyAvDs4zABqD6Xqzr223C79PIobcXNypOWFdLWykTMfTw5i8uy?=
 =?iso-8859-1?Q?fFGo/Gcp4zoC01DYCdlPev+WLXH0A/d3sCabzd+d9yO6NEDAF4fZabvBrm?=
 =?iso-8859-1?Q?qP+ZqY7+UeVUJ6ZllBZ+R48x3Xb+umwTl8wcOt1V3XuPyQUlHsbEysdjLL?=
 =?iso-8859-1?Q?X34ksT9Ah9/4TZrZhUDeDBnNLewYlac/5fAE5MJFw39DFd8jnv1BTJ+ulW?=
 =?iso-8859-1?Q?LTzLsJdbZPgqxqfWVLKxU9bVeBbuJt+9aPTIatKvGJ0GHgoOSiicWcqbX+?=
 =?iso-8859-1?Q?cxVjZD42PS9sxDTa1SD5rTwE25CP37I/B9qWFCp/l56n4XSos+4DyxDrU0?=
 =?iso-8859-1?Q?FGyVUBIL65HraA5Awg1Ja6L+aPH2X2skqCUw3AZ5gZtBDhHU+aAQO/fpc0?=
 =?iso-8859-1?Q?ccYG0ZOLMGcQ7FGyBxSdA/9C6UsL9MmU0YDZ2Ca2uHq6KjFzt9ZNHaTW6m?=
 =?iso-8859-1?Q?lNruZcKQJxo4hpf151akKUA5pNMZ9AALL78taigRKB7pnsk75fX5rv82rO?=
 =?iso-8859-1?Q?sHydeXSRANB5RyqyvSYKu97+1wQEU8S6d2jxDqXCjXZA6hyQcbpyizPzSx?=
 =?iso-8859-1?Q?+MLmyP5gY3aV1vqfHwd+6eBIlO98UKId/A2VW5z0zckmbv/js68eNode6Y?=
 =?iso-8859-1?Q?ZIDzJ5sBQN14NlIVB50nCEKt1e65mNvFhyWdrYoKflrYfZVti+pzVIth2L?=
 =?iso-8859-1?Q?1WnlaBXq1Dvnb+mSbLi+D/BA0UsfFTTKt2cQ+3rafE5X0x5Ybt1vU0/twv?=
 =?iso-8859-1?Q?+fYJ7YydBkHjrXXXL/G9zrsxpRNBrLRvwU1XieMO2lzG3PiGM8N8vX15qA?=
 =?iso-8859-1?Q?kTzoS6KUCyNXtMtOgUJQln65G+1ICDvkeHJ9QNksjKpWZKOLQLb0RKODie?=
 =?iso-8859-1?Q?mdlYtT8qDkz6cnjdZVJc9o+enJ/pcyHU2F+p3QXDhNigTEwyrwEF0hzsEV?=
 =?iso-8859-1?Q?vvRh6IjLOL909Fki8ueexae4LVEHU87O9hn8+si7ALHKEdxV4DXkjV6yif?=
 =?iso-8859-1?Q?fGss8CbcM2aNTP4TJN+SHgNBVSoKYKjSgcAJzaUeO/YbVeHABRIWVKth4E?=
 =?iso-8859-1?Q?YDf0fZQKR1Gfr+3hIo14srAqM20pS3tj5JR+W3Zjzg695VRxlsL+Y5E9Qb?=
 =?iso-8859-1?Q?jF3yV4Pbd8xgb7FSu2x03buQTj+NSm1cPZ5q6r6IShV1UdY9JEJ/yT/xZp?=
 =?iso-8859-1?Q?Nv6IjZejpn422XbZlhpzXJnlRyLj4jtssjYIuxGK4Vb1Dh+2zICBPK4ZKp?=
 =?iso-8859-1?Q?JhLxhyiRUxuRO8VxSe3/hryp66aaJK9jsPKr9c9FLr8AWrVX0UwHGy0iYf?=
 =?iso-8859-1?Q?I=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?s2D8EqUUWJeHgLZzRlmfGU13lseQm1L+TyxZ+PVKT8AFs7ICvq0Fa1EmS5?=
 =?iso-8859-1?Q?P2yy7E9+suwrYKBa1/DdgUVvtezLXVfts4TQo9uTFrM76MfSBl0ActGNQg?=
 =?iso-8859-1?Q?DbRIlNaC8qKOT8tUxDNUcu7xYx97D7XlU/V/KBQtGC/d5qDguWy/fLjNhx?=
 =?iso-8859-1?Q?icSOo6qSAQb11DU6Zsn7RTi4gdtogGvLRWsQUV7qHYsu1uCcOeNHG6Jwuv?=
 =?iso-8859-1?Q?gyLaiqKlvQ5IRWy23VU9XOMdtjJRffzezQpMMWK04XqjzZmmamom0h0CtD?=
 =?iso-8859-1?Q?wxrYdCsWHpUXhvOQwteC/xkiYH/BAX79iE+51ATyyUQZi3nMSa1d5QQHtH?=
 =?iso-8859-1?Q?QxN4mT6UIf9uM5kbCByZmtRhydyjg9rsjB3VpeaIKum5J+P1qfhVS32gaO?=
 =?iso-8859-1?Q?yusZeHBdDCBaa8wqQyTkfYU57xByYUV4FvMMMRJjgSH94+Jy9dRrHCo6Yu?=
 =?iso-8859-1?Q?SLqAxA+f2oDfu7MW94T3Y9AMpD4PL0FZhS6SiookwmvhCEeA2S//5qxVFH?=
 =?iso-8859-1?Q?PQs5TIfWCqNtEzNZp5qUJtMffl/YEhdTLUP8o2ULmdyQtrjKNoufVQCrQk?=
 =?iso-8859-1?Q?cwJ8MCd8wyBJgC5I7har27Xsgju8gcmU5XZch0UoaIi5dHi1IfTdAJpgZX?=
 =?iso-8859-1?Q?2/kGwWvY/BqH+Y7l7wGbWKoqbo3c6l9BkQwueJ4fft+7Wkf6Zow7HcQqDr?=
 =?iso-8859-1?Q?Uvw6FB71gIIQy9Rzd2UlY2QV4UJ/TpHIYh9vtD9UNWupTQoJplEzqpLiK8?=
 =?iso-8859-1?Q?2S9nryDg07X9MLlrRy4dFSVuNpEvmxJhvH1+VWT/nmuDg7oxhgVY3vnkUs?=
 =?iso-8859-1?Q?Ng5yLig030KHgC/rgMXMlBLwUjdJL0C3sgLIVWJDXnX/uBW0rmQhHA9DRH?=
 =?iso-8859-1?Q?lNPjqqkPmJ4Cr5e+WLZsSg6JYVRLHWlNFRLNA939RnQn/CV3Cj0ffrOBGw?=
 =?iso-8859-1?Q?WC9iqxTM9zwUFhWpC9D7FsPbHeDbwtbhFJWY/nWx+WKtVKBU5kxVMkvF2k?=
 =?iso-8859-1?Q?JczQSl7AvbGChT2qKP3y9jconqg8Tu54FHCkQ3WO+9opvxtWOWt4Jvz2vU?=
 =?iso-8859-1?Q?TWPrxHRIayeMDL2XhlDwVoJDO0S18FjvIElJPS+RgIn1oALaCo1jdk8G6Z?=
 =?iso-8859-1?Q?Jvo6rBR+et3V0oZ4axfB0W/uoUBPygxz31CWiiESi2b9B+e+wAu3uDn+yZ?=
 =?iso-8859-1?Q?ZU2FGKAWELSPozBHIZK7PyW5gn7NG5EoGksYnQUZJJqMX5qNYqTsqnX+6Z?=
 =?iso-8859-1?Q?q7d9GzF2Tuj0qUzhE+JH95aukG6Iq91DNffGf1fbkbB1Z1OS9V3EEk2lQ8?=
 =?iso-8859-1?Q?fnTmG1EqTH/dfS0rgpsMGPTfbJuuMrBaaswrog7ydBpDjdcqT38gYQjQJm?=
 =?iso-8859-1?Q?0LsOY991GC7Hc1o2MpBh0idOK0kIWt48t6ub7KRHwFkjgCohIfYW2Agrcv?=
 =?iso-8859-1?Q?dsurye8kkFSeee/DY8d0ZZjWbdv1lN8ilPUMzL82KJYCA1h7iMiAjXF931?=
 =?iso-8859-1?Q?yl4CCu1/xkbYiFKQpenlrCOGNYTzeqIV5WjbZrc4FCKau+ZrfCmYvwoJeN?=
 =?iso-8859-1?Q?TkVJRzt4sC56pe5/4xu+anYQDyIGvpgEQiFH1JgyDc9VxDJul9b+trrYUh?=
 =?iso-8859-1?Q?gmKy/0mdMuRZN+6vI198wa6Q+1lv5adITWWwExpl0NWTwTxOMMHGk3Cg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ce7e74e7-80e6-40c7-ebfc-08dddadb363e
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2025 02:35:20.0589 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TeudwcwUNfp1couUf71/H/XIwrf6glKr/7u8/MRJIKktKlWWX6s/h/UUcY22G+AUqck7mJ200nlSnWVEbYG4vw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5132
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

On Wed, Aug 13, 2025 at 12:51:16PM +0200, Thomas Hellström wrote:
> Convert __xe_pin_fb_vma() for exhaustive eviction
> using xe_validation_guard().
> 
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

I'll leave the to someone who works in display, but patch looks correct
to me.

Matt

> ---
>  drivers/gpu/drm/xe/display/xe_fb_pin.c | 27 +++++++++++++++-----------
>  1 file changed, 16 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/display/xe_fb_pin.c
> index 4b0748e6fdd6..43c45344ea26 100644
> --- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
> +++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
> @@ -281,7 +281,8 @@ static struct i915_vma *__xe_pin_fb_vma(const struct intel_framebuffer *fb,
>  	struct i915_vma *vma = kzalloc(sizeof(*vma), GFP_KERNEL);
>  	struct drm_gem_object *obj = intel_fb_bo(&fb->base);
>  	struct xe_bo *bo = gem_to_xe_bo(obj);
> -	struct drm_exec *exec = XE_VALIDATION_UNIMPLEMENTED;
> +	struct xe_validation_ctx ctx;
> +	struct drm_exec exec;
>  	int ret;
>  
>  	if (!vma)
> @@ -309,17 +310,21 @@ static struct i915_vma *__xe_pin_fb_vma(const struct intel_framebuffer *fb,
>  	 * Pin the framebuffer, we can't use xe_bo_(un)pin functions as the
>  	 * assumptions are incorrect for framebuffers
>  	 */
> -	ret = ttm_bo_reserve(&bo->ttm, false, false, NULL);
> -	if (ret)
> -		goto err;
> +	xe_validation_guard(&ctx, &xe->val, &exec, 0, ret, false) {
> +		ret = drm_exec_lock_obj(&exec, &bo->ttm.base);
> +		drm_exec_retry_on_contention(&exec);
> +		if (ret)
> +			goto err;
>  
> -	if (IS_DGFX(xe))
> -		ret = xe_bo_migrate(bo, XE_PL_VRAM0, exec);
> -	else
> -		ret = xe_bo_validate(bo, NULL, true, exec);
> -	if (!ret)
> -		ttm_bo_pin(&bo->ttm);
> -	ttm_bo_unreserve(&bo->ttm);
> +		if (IS_DGFX(xe))
> +			ret = xe_bo_migrate(bo, XE_PL_VRAM0, &exec);
> +		else
> +			ret = xe_bo_validate(bo, NULL, true, &exec);
> +		drm_exec_retry_on_contention(&exec);
> +		xe_validation_retry_on_oom(&ctx, &ret);
> +		if (!ret)
> +			ttm_bo_pin(&bo->ttm);
> +	}
>  	if (ret)
>  		goto err;
>  
> -- 
> 2.50.1
> 
