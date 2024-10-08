Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8F23CEF172
	for <intel-xe@archiver.kernel.org>; Tue,  8 Oct 2024 14:54:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2A5F10E570;
	Tue,  8 Oct 2024 14:54:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gaguUNZp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 240E710E570
 for <intel-xe@lists.freedesktop.org>; Tue,  8 Oct 2024 14:54:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728399292; x=1759935292;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=G3oDls0HOrm94iItmimV0s6f6tC0hTP2AY3tBBH762o=;
 b=gaguUNZp7GVGi0Qc96YibMiFwRbofr5rz+rqQdlA8J5sPDWiXXLgRGZj
 TQnRMMOWOOnVpwD1lWPw19AuOe3QVHmF8loorMNah3QitAaD2ATmfLV2f
 9XusXySpBOtrVuz2pXEj0xopPqeVSxrCuGiLxSlqaT+9WYDWbZofYHvHm
 i/nhvows12rCMau7op4Bl0CXHPhCjhHqli9StJgJcnFYI05UmoYEwai0U
 xTjErk234CnikVBfFA32966Cb0ClowrK8rHBTXoz59gtBqiwdwYys1Thh
 DKwMXtzjlLwB0ZAu1OeagqXPDTCvlfgt0zv2tT877VtOFTBsCmxhrTaWr g==;
X-CSE-ConnectionGUID: THEptsbwRuaQQIt6jfrRLQ==
X-CSE-MsgGUID: vojrxVMwQ/uZkSq4twI2rA==
X-IronPort-AV: E=McAfee;i="6700,10204,11219"; a="27733059"
X-IronPort-AV: E=Sophos;i="6.11,187,1725346800"; d="scan'208";a="27733059"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2024 07:54:52 -0700
X-CSE-ConnectionGUID: Pd9Svs7JQ5OFW1UmRW9V8Q==
X-CSE-MsgGUID: jF02FDH9QiqZ4EeC/g/f/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,187,1725346800"; d="scan'208";a="75421390"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Oct 2024 07:54:53 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 8 Oct 2024 07:54:51 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 8 Oct 2024 07:54:51 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 8 Oct 2024 07:54:51 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.48) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 8 Oct 2024 07:54:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iQi6kJxDw1B7JsqskyApVSbdDLqRjm4meLGucmI0fu26InVviNYvSLFtp+5PMjmmqmBoDFVDbU/OmQPC/4UgAXlCPOAPKAW1y1KrR/aKjaJgg0ZQtx53Ecq5pYNDos5+L+EVWKfBV1rXwAKvkXjPBAU3HZEKLRrDIzYdxyYORRhRQ0D0fJfipnanuGqsAeofh2xV5zlhdcTymLEVAGQwiHURKxMamn2z3+cxaIOeXSrml2qBsSBv2AKe6NZV1mk86hxSa7ClEZXTWmYOP2MXRoiZSe0bwizW/kzoVPUq+MlFljiAHO8mbN/SwwfBSA3FgSxkc0wqI3Ha+X+KCN8Omw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rQ2FO2H5iJSVNmJiwigHFPM00vcp4vKhGYNTjjDeZAQ=;
 b=VpRs35NHTpedfsthck6MeJXKIqhpaeP4x8Sm4PLaJqB+0MqgqfAREd+LX55rO3DlRtPoAUMVhkQe5tHB4oLGDWg7bJCAB/NlCwPYDx/UJ6WHC/BFjJPH2F7Y7pX25b0qanJeV4UXFKZ3Ny6ZT0AGql+HWpBuO5VVXT9wQulLukbvlUQUM+v+klMVkLnT5/sR/Y/FjzrHUTN9UiZJPULTIOaM7w9d/0VOrkf2wf37JYEdNGOM1U7B54yAz1MO0vz656LzuauJSwzdJ+DZTkl+27yIOzz/1pg0ZoYvPuG/8RurYl9icWkA3dhbWovrTb03YO2WssW4oKQVCEJz8WWuCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MN2PR11MB4725.namprd11.prod.outlook.com (2603:10b6:208:263::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.23; Tue, 8 Oct
 2024 14:54:48 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.8005.024; Tue, 8 Oct 2024
 14:54:48 +0000
Date: Tue, 8 Oct 2024 14:54:19 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Niranjana Vishwanathapura
 <niranjana.vishwanathapura@intel.com>, Tejas Upadhyay
 <tejas.upadhyay@intel.com>
Subject: Re: [PATCH v2 2/2] drm/xe: Use the filelist from drm for ccs_mode
 change
Message-ID: <ZwVHmw8KPluuPgvC@DUT025-TGLU.fm.intel.com>
References: <20241008073628.377433-1-balasubramani.vivekanandan@intel.com>
 <20241008073628.377433-3-balasubramani.vivekanandan@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20241008073628.377433-3-balasubramani.vivekanandan@intel.com>
X-ClientProxiedBy: BYAPR05CA0045.namprd05.prod.outlook.com
 (2603:10b6:a03:74::22) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MN2PR11MB4725:EE_
X-MS-Office365-Filtering-Correlation-Id: d99c61ff-8ea5-43ad-15d5-08dce7a91c1d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?4VngZD+e0KmqrYGL3p04TKTrx6doF1b9nj4fNhQcqyObZUR9/40WmOQzs9GQ?=
 =?us-ascii?Q?Rkd3pkPtsOVbcXjJGyuBbbkjl6F8ezNpVcN0wPDYNHbrR7jFd83WdyRB5/gJ?=
 =?us-ascii?Q?Onz8Wu52pYyT1LiPL2mbytCJW3gCidb7NCmLHs0nIsoGONotsxXGcXSM3iUJ?=
 =?us-ascii?Q?VJnqW6Ff6PmORvajIBjLzT/4i2HjkiuDOCi9SExXp2pUUSSo6xgZMt4FdYqo?=
 =?us-ascii?Q?v8fs1RfYoLoX744PwgJ3weEflZM1unglcM86/szmcocsYtQCRq1TT8FFjZkp?=
 =?us-ascii?Q?O15muAuKJDaxpYPW1VLXNMXcedsqrCjcw4Ld54DkByV1u2tN/KqZPFbmerEP?=
 =?us-ascii?Q?j0lIoQn524NOQQJzerMiJIPGki1zbigoPcubSCrkkb7WY5Wpp0jDSUywaTPM?=
 =?us-ascii?Q?ZN1kCoZwVzP0uxYalUacImbgMucTXyR60xzCLJnkFRcTe9baVx029uwzbvGI?=
 =?us-ascii?Q?3C4fWAfLyc/yJaEmJDqgkyMhbqfEIJlrr+Lnzg8kSwvvXi2rPbingY3Po97H?=
 =?us-ascii?Q?jSuzkgLM+dgyk/su2l9mOjJa/IyRc3ArsxMqVPTWPHh7/erNNDbk14yzOmeU?=
 =?us-ascii?Q?QEw0GOPtEatWd686o8hmba20Lj4E+EYxw4miXB1g65zyxN3LTsZaJfBJdkTx?=
 =?us-ascii?Q?fZWbVTHNUaf7/nfVvQ62LTah3Pi0JuEDzfD1kIL0sYTfJjFzkVIoA1iMDYr2?=
 =?us-ascii?Q?qLVpnOwuzLsY8I5YFGXaq95r2G95+LwPZupULMJPeaOmbkwqOW2j/n4LZLJV?=
 =?us-ascii?Q?6NTCOPlTZ/B86IquY0ZHcMSyZFMQLfhxqLpXb+EL/DWdEOKUIUMbMPUuPhxX?=
 =?us-ascii?Q?cr5JCcJttwnwie/szIMMSZjrOWtBWYSHCKIOLPSSqOWSWHq9Kcvc+tpxUuMF?=
 =?us-ascii?Q?vjYKdcsk0p1s4CsWPmctpLNK9Kxtwons44Ik7/LGBhQ2jDKRza1Vz9R7Wo3J?=
 =?us-ascii?Q?t9FA5aXWsq3uDAnhuvLdS7ioHc4AONWZ+2DSZMhM3dwVnk4dlSgjZRzul16k?=
 =?us-ascii?Q?yWV0CUbXd21yhfxkgQUWHpX9kvH/IAf7Do22np2Ht5E3MKunuPjr+x3/tBuz?=
 =?us-ascii?Q?2CBScECILY5Y1n/YeTxc4JP9RpOGMY9cluEeMCNoOAabFDcRzkBzBQZRHlYx?=
 =?us-ascii?Q?GYNuts1NEv8MzHQt3zm9YP52Lca3A2TSqNj6NOZkgDZ3tTNcpf26kw1G8KFs?=
 =?us-ascii?Q?DMWEFxc40KTfBopDfUaGa9B+FPNQjFVdrQU6vG92NW8IS01QR+fbH3n1ukjU?=
 =?us-ascii?Q?29an027ITG/z3Z3cxIe6/gVmvDaeoh4eLzjrCtKDbQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?c0FdTRIabAsSmhZM6X7QRTlysF27c2LhECDEdl/MvZgNFR/OFRxrgHumAWAC?=
 =?us-ascii?Q?15GnBQeOn2uoMSbr9b9zOYKJZ1wATonI3R4GTX6t+747/CT7Zd3wMXu6vuEo?=
 =?us-ascii?Q?28985WLy6HpjQ7Sb09kFV6571j1YEr07aEsNWQ7bU05O0WAHnfs0b2bpKX7X?=
 =?us-ascii?Q?N5Wl/WoSt4rMeSxRmiKWS1Vw1grbAOnUhRn4hcIdDmyA5J0BIApz1km6reyU?=
 =?us-ascii?Q?z4EukQpPYuPZzfEc9U55/Kh1GOipNwaGEkBbEHtDSlSlY05+CyTSpJf5BUsQ?=
 =?us-ascii?Q?KXzfIRNkDvqcafkG7Fh/pYsmww9tWFjlu5rUpoUZbVaezr50gD5770ueT8rP?=
 =?us-ascii?Q?JSRzr1T1bXhSMQVqHx7cOou6FAjgiH3icQ0/71myXfIU6357Ol8yNccYC6sD?=
 =?us-ascii?Q?IeqhAP2yKTLUU7fCvcReNeztZAE1qKfruAAMY3gdrxJsM89RogP0etf4JLHw?=
 =?us-ascii?Q?Z+F8PPxVKgdmVPbwkP6htvEJ/d6I0DAN0hZy+1L85bs+rOfozu9sbFGutq9b?=
 =?us-ascii?Q?z/pw/6jalXeBVukUc6d74fANNUv3CaF6Fe0eGuZAHyE/lHICVl1uibo53Uec?=
 =?us-ascii?Q?t6mFs/3on+V3p15XZzJl1FdhHstIC6vA4FTnfoCMg6cOTgcLf+CKvZV+LbxW?=
 =?us-ascii?Q?KW+b8Z0En1JqnlEW+JZWqk2V/RK8GYtWkwl/JdgOlkQKkVyeMv0mBxXB8b18?=
 =?us-ascii?Q?a3odQ2izaTAWfblhWCnhG1tSsye2UrR9AY3o5J/yDTG+XfTShkEQ5aUCDMQC?=
 =?us-ascii?Q?4RyoJt/lbE0Sl+y+Ycw5Y1uKH+qBJSx3wQYoSqR2MRMiDpI3z5ZsPAMtQ/dv?=
 =?us-ascii?Q?GelrE8SUEE5jUJGEItwN6RtlgjzSBW4PeNAY7bFbmVb5C+Rsje+NAzHHMEUz?=
 =?us-ascii?Q?/ekCCPcRo/RkBrM3vxOETkj8JDzcUAC9gkh6MBzwVtm2e8UnS2Wsj+8pKj+D?=
 =?us-ascii?Q?/4sPZHD4amscGyXO6bJ6IqpcMDveP8yPDnMvtINBSA8Do1PQBSW2oCK5Dxpi?=
 =?us-ascii?Q?WwtB/Nrz2VrolKrHOGsvMjOemSHmBUY+B0ObpzbJj+VX3OQDy9lVAm77KJHC?=
 =?us-ascii?Q?Pg5ZliLpX4KGt7n/XJFnGZF4leQAqJ6Q04JDyYuPv53MZiY6UeFftsIwlPJs?=
 =?us-ascii?Q?9Pq1ydBYCXyjEol6hVz9D7sZNx8SfnW5AYVLueIFZ6pPCKpVYBA7BcVnQ+Xa?=
 =?us-ascii?Q?RncU20btV6K8Ze4USUkUQmrkLj6QibsvxrdAIYzvtCQMRfiXMymobmF+WOIo?=
 =?us-ascii?Q?w/wbUFpahaxL+x11CTcN6neagILxOdqgEcgdWPlJplB20OQGvLYY9xgeAO1+?=
 =?us-ascii?Q?kRkUvHN4RpxVuHmg4lp/epNBdYs/qTCTX9pcx2eTm44Lxw3SqEDNio1aYDiq?=
 =?us-ascii?Q?nXtBSfAKc5HA2LwWpmKHwChl+Cu67hqo6dGUAtW2l1kozX/icEu0h2r8ZyqF?=
 =?us-ascii?Q?401yCvh59YYXbLY1Irr+Rjuw8lLIRgc1+EsY/Yo//NdzqFc7vhBYcF7nfslN?=
 =?us-ascii?Q?dYOXi75wCPpIuTG8sJKSJOJoAjsJOBVDSUmbv1L+xcug7yVSKfMJl84OUcVs?=
 =?us-ascii?Q?a9kY2xOqYFd+dMlrHnQAusmQCORE4fTRc+AfP4itesjgoFkFa87gIGywP2Bn?=
 =?us-ascii?Q?aQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d99c61ff-8ea5-43ad-15d5-08dce7a91c1d
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2024 14:54:47.9828 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m0WtwFTZ0wRMfuK0ANTrr4+HYYK9/SHUeoqStfIuuXySWdvrta7o0f+roFUyRpk7Y+5CASc+zWxRM6h50hq+ww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4725
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

On Tue, Oct 08, 2024 at 01:06:28PM +0530, Balasubramani Vivekanandan wrote:
> Drop the exclusive client count tracking and use the filelist from the
> drm to track the active clients. This also ensures the clients created
> internally by the driver won't block changing the ccs mode.
> 
> Fixes: ce8c161cbad4 ("drm/xe: Add ref counting for xe_file")

Is this really fixing anything. As far as I can tell nothing upstream
opens a file internally (i.e. xe_file_open) is never called directly.

> Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_device.c       | 10 ----------
>  drivers/gpu/drm/xe/xe_device_types.h |  9 ---------
>  drivers/gpu/drm/xe/xe_gt_ccs_mode.c  |  9 +++++----
>  3 files changed, 5 insertions(+), 23 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index a33d0c772616..c6bd6888cb7b 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -91,10 +91,6 @@ static int xe_file_open(struct drm_device *dev, struct drm_file *file)
>  	mutex_init(&xef->exec_queue.lock);
>  	xa_init_flags(&xef->exec_queue.xa, XA_FLAGS_ALLOC1);
>  
> -	spin_lock(&xe->clients.lock);
> -	xe->clients.count++;
> -	spin_unlock(&xe->clients.lock);
> -
>  	file->driver_priv = xef;
>  	kref_init(&xef->refcount);
>  
> @@ -111,17 +107,12 @@ static int xe_file_open(struct drm_device *dev, struct drm_file *file)
>  static void xe_file_destroy(struct kref *ref)
>  {
>  	struct xe_file *xef = container_of(ref, struct xe_file, refcount);
> -	struct xe_device *xe = xef->xe;
>  
>  	xa_destroy(&xef->exec_queue.xa);
>  	mutex_destroy(&xef->exec_queue.lock);
>  	xa_destroy(&xef->vm.xa);
>  	mutex_destroy(&xef->vm.lock);
>  
> -	spin_lock(&xe->clients.lock);
> -	xe->clients.count--;
> -	spin_unlock(&xe->clients.lock);
> -
>  	xe_drm_client_put(xef->client);
>  	kfree(xef->process_name);
>  	kfree(xef);
> @@ -352,7 +343,6 @@ struct xe_device *xe_device_create(struct pci_dev *pdev,
>  	xe->info.force_execlist = xe_modparam.force_execlist;
>  
>  	spin_lock_init(&xe->irq.lock);
> -	spin_lock_init(&xe->clients.lock);
>  
>  	init_waitqueue_head(&xe->ufence_wq);
>  
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index b97cd9828883..d4d53bb24740 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -425,15 +425,6 @@ struct xe_device {
>  		struct workqueue_struct *wq;
>  	} sriov;
>  
> -	/** @clients: drm clients info */
> -	struct {
> -		/** @clients.lock: Protects drm clients info */
> -		spinlock_t lock;
> -
> -		/** @clients.count: number of drm clients */
> -		u64 count;
> -	} clients;
> -
>  	/** @usm: unified memory state */
>  	struct {
>  		/** @usm.asid: convert a ASID to VM */
> diff --git a/drivers/gpu/drm/xe/xe_gt_ccs_mode.c b/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
> index 246190b3e2bb..b6adfb9f2030 100644
> --- a/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
> +++ b/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
> @@ -139,9 +139,10 @@ ccs_mode_store(struct device *kdev, struct device_attribute *attr,
>  	}
>  
>  	/* CCS mode can only be updated when there are no drm clients */
> -	spin_lock(&xe->clients.lock);
> -	if (xe->clients.count) {
> -		spin_unlock(&xe->clients.lock);
> +	mutex_lock(&xe->drm.filelist_mutex);

I don't particularly like this change. It is pretty poor practice to
reach into a different layer, take a lock, and look at something
internal within that layer.

Unless we have a very strong reason to this I much prefer to keep the
internal client counting.

If we start creating internal files, I rather see the vfunc 'open'
call a internal helper with a flag indicating this a an external client
and the exported function which creates an internal file calling the
helper with a flag indicating this is an internal client. The flag would
then control if 'xe->clients.count' is incremented.

Matt

> +	if (!list_empty(&xe->drm.filelist)) {
> +		mutex_unlock(&xe->drm.filelist_mutex);
> +		xe_gt_dbg(gt, "Rejecting compute mode change as there are active drm clients\n");
>  		return -EBUSY;
>  	}
>  
> @@ -152,7 +153,7 @@ ccs_mode_store(struct device *kdev, struct device_attribute *attr,
>  		xe_gt_reset_async(gt);
>  	}
>  
> -	spin_unlock(&xe->clients.lock);
> +	mutex_unlock(&xe->drm.filelist_mutex);
>  
>  	return count;
>  }
> -- 
> 2.34.1
> 
