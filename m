Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10BBAC87FCB
	for <intel-xe@archiver.kernel.org>; Fri,  1 Aug 2025 20:35:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1F0F10E8F0;
	Fri,  1 Aug 2025 20:35:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VRskAfV0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F6A810E8F0
 for <intel-xe@lists.freedesktop.org>; Fri,  1 Aug 2025 20:35:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754080531; x=1785616531;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=EA/pTdkaYgu7wqCwwft+M/DsYiynDYaSuCOWhh7IjEo=;
 b=VRskAfV0UFAgzd1lEhv79PZ2sb/g8gG7PeTSPMT2veFz4ctz+5/cvbJf
 zrFExjMOiPtjzrDbGyTVUo1BmmSmRVlpykWjjLnwchOsVdS6u9hNwpfTm
 ZXtmN0s8TsmcPQeqjdhPh6O8MtzMnGrKUrwEaSa3eSl4+JsmpOnTr+wTn
 DTq1/a4T6gRtq6oD0wV6/czI92oJQ8K2iuAZLu/BvhUa/9tVuWAS5nAPY
 OnVQ/0Lg5zzLYIcAYzxq+e4CEsSjiOHjlf0GUvxO72QQAyOvWdh5IpmXW
 q730FRmu2+EN9Om7tEGyiz2vjP3iIm/MefTPr3l5RoXVY6f8ShCg6xjVT g==;
X-CSE-ConnectionGUID: rrzvzk3oQWOAAoizWOj3qA==
X-CSE-MsgGUID: 5KCM5AWBQh6LGTEqHdB1lw==
X-IronPort-AV: E=McAfee;i="6800,10657,11508"; a="81888257"
X-IronPort-AV: E=Sophos;i="6.17,255,1747724400"; d="scan'208";a="81888257"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2025 13:35:31 -0700
X-CSE-ConnectionGUID: FzqLuF6lTmmdONq9bf1usg==
X-CSE-MsgGUID: xd0ZLCQDQ7uW2NfkL1fTNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,255,1747724400"; d="scan'208";a="164042412"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2025 13:35:31 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Fri, 1 Aug 2025 13:35:30 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Fri, 1 Aug 2025 13:35:30 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (40.107.96.74) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Fri, 1 Aug 2025 13:35:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vhwiZ/rs9mEoeIFB2o0S3mKxaUNlNhJUqkv6MuLdVm36DjG1kptO0KeN+sG7+zFhlK1fdrB4DYmLWHq/umA/YumV6i9Nnxyuqg+mKHNZ07OXOzrR2nq/xicSFypfaNnenazOFqnioNHYnIWILsd0VtQTp48OhKwMKsBGc5ps9WB8p8wPugJWZs6O6NyrAwOrpFNTHkHKCeGRjTeZ3dmMtyq/cipHOJRKEDH+hu3Bj6V6Vz8BxWylfLBj9GdpkDoCIKTNo3eZP6lGyFB6bC5uG+hkCA7dW1oQ5Mk1d5jjDkC/cNt/QZ8YjZFcFmCcvHkbSRhUYyoaBpV/YZI0q2bbgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=56geaDDy0cmsDmUmWXKsvx5mbV7IDkixTzBG5VK8UHA=;
 b=yXLqgxhD8SN56NfyyCJPfI/PZM8L9dIrznaL25w0/77C0Pacx+aWpewXOAoUPWm/0x7jSp5xYVyrl2OPE30OQn+q3rkahjiUoDvyoMZPDHnOgNn3ER8FcBVQE6Thsbju90ECFFLo+ROqqapVb0gg+N6QR3P1fGo9Vjleq5yVUCziDhqQqWx1xpeQmkU/dO8CTs67s6jG/svxBJx0vBwbSmjTucT9UwSxgJubEUlpaRgXMj7tHZ+mg7IuwEWsR8X6mG7ZG99eEtZ53EXoIoZfODfNo3jDX4hN0BMCtiSeyPPa7n/eN6PiyezcJ1nimholuKI/rlDjsyOLFT1e5yMOkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by DS4PPF6EA6DD735.namprd11.prod.outlook.com (2603:10b6:f:fc02::2d)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.26; Fri, 1 Aug
 2025 20:34:43 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%5]) with mapi id 15.20.8989.011; Fri, 1 Aug 2025
 20:34:43 +0000
Date: Fri, 1 Aug 2025 16:34:39 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Gustavo Sousa <gustavo.sousa@intel.com>
CC: Jonathan Cavitt <jonathan.cavitt@intel.com>,
 <intel-xe@lists.freedesktop.org>, <saurabhg.gupta@intel.com>,
 <alex.zuo@intel.com>, <tilak.tirumalesh.tangudu@intel.com>,
 <matthew.d.roper@intel.com>, <michal.wajdeczko@intel.com>
Subject: Re: [PATCH] drm/xe: Extend wa_13012615864 to additional Xe2 and Xe3
 platforms
Message-ID: <aI0k35AlRb8rVtgC@intel.com>
References: <20250731220143.72942-2-jonathan.cavitt@intel.com>
 <175406632667.2044.15653899817314879579@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <175406632667.2044.15653899817314879579@intel.com>
X-ClientProxiedBy: BYAPR02CA0054.namprd02.prod.outlook.com
 (2603:10b6:a03:54::31) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|DS4PPF6EA6DD735:EE_
X-MS-Office365-Filtering-Correlation-Id: 33461c32-2585-467c-1809-08ddd13ad889
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?lgz/tM9YC156IbOo4Vr5W9r+Qmr7ajsKTrXzaxOnrt/79qiRiPHUs94x+BzW?=
 =?us-ascii?Q?iGicoJqdsqiPHilZ2p84Kjm6utxauZVrxrv2RUAdp1KzDImwbJCOLQCf1v8B?=
 =?us-ascii?Q?d8DMnNbueGYineZHi+9gRV5TqH2zobPVJzKArXXxunKDfMk/kWMZbCf+dsQC?=
 =?us-ascii?Q?qV7VSiapYbkpwgbwfGRej3379vPKt54yhCU1ODIuOKp2eHFuolRSKad7nIZj?=
 =?us-ascii?Q?o3FN1ZljRCCRZTKltCRkYIMRL9aYhNx1hKFG1XMgK9OBNdksoS/Sy0aPN/Qu?=
 =?us-ascii?Q?wX7JdJGvnoaYqmJO+9vsSfnH8G9PsfPPMlyllGt0KdPdUCzdTRvLzbDZUJIn?=
 =?us-ascii?Q?TM4azeJJch2nLzai/+CZIGe+x90bn3b3fkKiM1Rj3qrbbugmTLi8vP0D6Uu8?=
 =?us-ascii?Q?9mBIxbX/EL3ecs8TG+qikIKOmOPDU3bzJrmT4M5w9xySCEERjCA23ODI1IMY?=
 =?us-ascii?Q?feLMIXlWLY8Xg/PMLMBYJlz/OH9HDlk1qXEyyxtrdBINd+0nes6RoyxrTEft?=
 =?us-ascii?Q?mlPKUaPUdsQ4+lyi4Eu20WI/vhNXpBnFU7xcGehs7jzoMYJxfEW73ba5k/tH?=
 =?us-ascii?Q?eJRTeweKS4pjyCEV9+cJGVH+7sXHDPm+uWV5xMvm7ezlCxWGOkR/G78JU7w+?=
 =?us-ascii?Q?PYSq6zJ/vQyELQl+vzE9au/Zdf65YOA8CHRwMi/w/lhKwfRC5qe6m4Qa5okb?=
 =?us-ascii?Q?6/o1OyXQbRQ4uWfYVh28XuvhyO++mT5lyFAvC++EujYxjDiVnjzwics/fZOL?=
 =?us-ascii?Q?PY7qYVLmj6BBsr0xfM1ugPkdNb1o+fC7WwJIVpkbA7xWhCAIgvf7VGvU85qO?=
 =?us-ascii?Q?CsCTtuXIXfzSEG9vFg/fXvPbYFXs0V6GEGucQ9wEdC0HxVbA6m+gN4Y/mFI6?=
 =?us-ascii?Q?GDMHxlOCB6qtk5290rLShCahUVStNJ+7ngyJ/BbFjufPeNXY3pzSZpbSRDyl?=
 =?us-ascii?Q?jFPq9yztBbyw26USiXqSrE51a1jWM2B1tWPGozhoiTEAIqDqHqIak300DKai?=
 =?us-ascii?Q?aoURKQeWyE5Kre+6OFcY/H2I9jnOa05oEtOi/qM8IMh+PjevoILU+WGlOll+?=
 =?us-ascii?Q?iR+0gpd/+pFfh8sxewocqak5i1tHBFCThmOg7YUE4/hTYJSCbppRThHrUiHS?=
 =?us-ascii?Q?i4UA3YPHBJJ4hvKfjp93y5c+j9gnvC4q9dQ+kvxP3rSHVkQRfo3r0Im0xR0c?=
 =?us-ascii?Q?GTvTzO3TGJIXg5iw8WuX3d4nBFEYR3T1jf9RKTouS/5Nb905dK2zz63G8qXi?=
 =?us-ascii?Q?IWaTryYXlfmJAAaf498oMZr7EGuXz14V2xI1gdEFt5LiJl1SrHtUNzOKSjk/?=
 =?us-ascii?Q?HIdhbPKFJZP+AMEGNMH5R2bNWTv4SwUfp3KpprMFRvkbm3Um50jxNpIY6yKb?=
 =?us-ascii?Q?+6TqZ6LGIBejKZwzMwsAx1eX/bhPwaXx8oS1ZfTSGYkqAowtEQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?KN+pm9gaBcGDPp7WGeRzQgvZY7mglEhusOa+GOcqhW0uvGPkWQBl82CxQG/C?=
 =?us-ascii?Q?+FqYpHrl8YXnU4KZkuxLGjWnZeThbt/pxeYD0uNMkuoT53SJEQYXua70BmjA?=
 =?us-ascii?Q?RYZV/c8I8EnBNf2A5N7e4uPHF9OvV3+zHXbJHUp6+xEQa9goydPthEi4m1a+?=
 =?us-ascii?Q?J0wrFCSmt+0AtFmWxhOpGreIEmnl4l/qDf3A1C8nt2YdlU2cK+zKgBw3UFDg?=
 =?us-ascii?Q?WGcZRQRl//nqkFauyRuL9qugVJThipVF491h/5ObV2EiNnX5R/gmCqzUXxn3?=
 =?us-ascii?Q?axkhIBIx3/v0lzf2Oo5AZtI9bQz3OFh1EkP1z0UomGKIhMTON5MiCN06sM4O?=
 =?us-ascii?Q?A6dvkvW3rLdcPHckKLhUytHzAhlI822DukpnO8ECRfVdxTQfBMyMRn4CpK1N?=
 =?us-ascii?Q?5KHt4WnloZgg89AaWbAto5dgKWkDW4q/fei3Izk2x+mUrfrfD/hr6R3mhC8a?=
 =?us-ascii?Q?DE8K0tiejr01MkW3LhMmRzolNRK9Qb94/NVvy9QV15hAzytufihaJ649+Ux2?=
 =?us-ascii?Q?hakGVjj0Gil59VlX0LsqWx6l1lWAkoLzQiLpwEv7AQQh8doWrBEWFmwmqIMi?=
 =?us-ascii?Q?kVsKxfCkriaqXSLA8k1gX1eakslERrNt5UmwILwr0qvOwfQHpdQrQzFXT2eX?=
 =?us-ascii?Q?PQ0XeSxRxtwQU5EaNgzNWleeciX4z7Kg8lJle8zRe81TvcAjuFi6+KBCL9zA?=
 =?us-ascii?Q?B7EVW1J3PMSFYz290w/rs7I8IdBs+lEAmL+azIUF0LXWRBp96CQehpeBSurS?=
 =?us-ascii?Q?FxhmmIsA4qzPMyN/HR5ClAO6HR7XENy9UPKP1hfau6qpbq1OfDKVkkI+ZnmB?=
 =?us-ascii?Q?Zf8YjcKjELvgq/kCqmISzupSZaD4ewaGtC+s5g5hQjZf+N2hLs1G+FqCjgss?=
 =?us-ascii?Q?DLWSQY4dFojhIvnTk8ZYMy5pR6lIpfl2AFf0X2DiAyQHSpOY+G4AQabH23Wh?=
 =?us-ascii?Q?GkJm+r7TsfzIIb/LzW6dyp5EvGHL2wKZwIjVntNWW2wgGaJNXFCOIbg3PBX1?=
 =?us-ascii?Q?UQP0JPAuH8sEiC/GEYnDeNnK0PrsseKzfOG3zFa4WDD6jqHgHVThEYgyTROV?=
 =?us-ascii?Q?jYerTJaQnRFzCqKb4/fgY+uRygYj7h2kZHvQX8BRaofzC9nD4ZwvLkbHLPGp?=
 =?us-ascii?Q?mV2pylze8c74ZYU913R1vkAuB7siIEJza1hleBXNOvtEp4+Fb3sjj7q8Aimq?=
 =?us-ascii?Q?09fuZFzPYNqSB4iypnK1dlRFxmvILPA6uPGdmkEIHlxGoRaTUHyhQpJw3lcC?=
 =?us-ascii?Q?BzyrVHAxKR64UKxNcmBJB8PC9Fboq8RS0OgUBCQl+6DCQzqS57Zf55lYy1A9?=
 =?us-ascii?Q?rn/vhkmK3GudsxvWEry1RmWG5Bn0qeBjxkUBxyjkz5hwsImaLf0obliH4oPu?=
 =?us-ascii?Q?3TBc/9QeNIpA3V2PUZVxVm6RKiLna897DJHYbdF76m+EBc3hqkRuF63TME8+?=
 =?us-ascii?Q?oT9oRp0Ea1nDI7hGbmfpHpebaHLIAC/ZDCzfTTY6Cp95IP1PT7aCYPDbeJnh?=
 =?us-ascii?Q?7QkFnHbaoA+bbNo8TEigHirI6Z0QeBKAvLdnbhQt2puo9o3SHGkN866RHUgD?=
 =?us-ascii?Q?u4DsAtJJ82BrxcQOvHkadW1nb33mlLA2eb6SnhXlS8wTQ/u7fupjngLrxHUX?=
 =?us-ascii?Q?iQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 33461c32-2585-467c-1809-08ddd13ad889
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2025 20:34:42.9933 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nhaT1H00Mdv+bIcB8p8+d3TsbFpoULsp8MOiH3sQz3YMbhI+nY7PTEsyLT2qWbdL6H4/7opk+ha/WddTeR+CtQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF6EA6DD735
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

On Fri, Aug 01, 2025 at 01:38:46PM -0300, Gustavo Sousa wrote:
> Quoting Jonathan Cavitt (2025-07-31 19:01:44-03:00)
> >From: Tangudu Tilak Tirumalesh <tilak.tirumalesh.tangudu@intel.com>
> >
> >Extend WA 13012615864 to Graphics Versions 20.01,20.02,20.04
> >and 30.03.
> >
> >Signed-off-by: Tangudu Tilak Tirumalesh <tilak.tirumalesh.tangudu@intel.com>
> >Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> >Cc: Matt Roper <matthew.d.roper@intel.com>
> >Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> >Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> 
> Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>

pushed to drm-xe-next

> 
> >---
> > drivers/gpu/drm/xe/xe_wa.c | 13 ++++++++++++-
> > 1 file changed, 12 insertions(+), 1 deletion(-)
> >
> >diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
> >index 22a98600fd8f..535067e7fb0c 100644
> >--- a/drivers/gpu/drm/xe/xe_wa.c
> >+++ b/drivers/gpu/drm/xe/xe_wa.c
> >@@ -538,6 +538,11 @@ static const struct xe_rtp_entry_sr engine_was[] = {
> >           XE_RTP_RULES(GRAPHICS_VERSION(2004), ENGINE_CLASS(RENDER)),
> >           XE_RTP_ACTIONS(SET(HALF_SLICE_CHICKEN7, CLEAR_OPTIMIZATION_DISABLE))
> >         },
> >+        { XE_RTP_NAME("13012615864"),
> >+          XE_RTP_RULES(GRAPHICS_VERSION(2004),
> >+                       FUNC(xe_rtp_match_first_render_or_compute)),
> >+          XE_RTP_ACTIONS(SET(TDL_TSL_CHICKEN, RES_CHK_SPR_DIS))
> >+        },
> > 
> >         /* Xe2_HPG */
> > 
> >@@ -602,6 +607,11 @@ static const struct xe_rtp_entry_sr engine_was[] = {
> >                        FUNC(xe_rtp_match_first_render_or_compute)),
> >           XE_RTP_ACTIONS(SET(TDL_TSL_CHICKEN, STK_ID_RESTRICT))
> >         },
> >+        { XE_RTP_NAME("13012615864"),
> >+          XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, 2002),
> >+                       FUNC(xe_rtp_match_first_render_or_compute)),
> >+          XE_RTP_ACTIONS(SET(TDL_TSL_CHICKEN, RES_CHK_SPR_DIS))
> >+        },
> > 
> >         /* Xe2_LPM */
> > 
> >@@ -647,7 +657,8 @@ static const struct xe_rtp_entry_sr engine_was[] = {
> >           XE_RTP_ACTIONS(SET(TDL_CHICKEN, QID_WAIT_FOR_THREAD_NOT_RUN_DISABLE))
> >         },
> >         { XE_RTP_NAME("13012615864"),
> >-          XE_RTP_RULES(GRAPHICS_VERSION_RANGE(3000, 3001),
> >+          XE_RTP_RULES(GRAPHICS_VERSION_RANGE(3000, 3001), OR,
> >+                       GRAPHICS_VERSION(3003),
> >                        FUNC(xe_rtp_match_first_render_or_compute)),
> >           XE_RTP_ACTIONS(SET(TDL_TSL_CHICKEN, RES_CHK_SPR_DIS))
> >         },
> >-- 
> >2.43.0
> >
