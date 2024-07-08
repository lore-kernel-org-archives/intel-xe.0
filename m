Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44EE9C3271E
	for <intel-xe@archiver.kernel.org>; Mon,  8 Jul 2024 21:24:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1579610E02F;
	Mon,  8 Jul 2024 21:24:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Py2Q7cZU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2BDC10E02F
 for <intel-xe@lists.freedesktop.org>; Mon,  8 Jul 2024 21:24:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720473853; x=1752009853;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=R880fRse75GhHpWdD78ES/gQwnHRikM16LwZAkIscTM=;
 b=Py2Q7cZUBzlB0NUEbqLyezYUstHPHHmv6MciAa7fO8+iSID1luHZwgFy
 tgc7NElb51YoLUmlTFlK+SopnOmzQ0kESRAMQhC+zV6+CjKeMc+g2xgcv
 CoKVFoi9vFSdVxkbNXI25ivUeS2Lstn1if4npBqraeyoKuneWPoQQs4K9
 td1ReFXZf6zJD3vWqghZfOa0Sr7PpCktOSCTXNu1qnmbEwrEJjW+EiHvo
 hr+QRQRFzjeJHczAYuvui+ZD5iqxBMzO++vKDqPFbIR06B2/UBil9gTZw
 8PyctHCWV/U5Fdk/YzVOiLDtSbrPd09MiBhs16eOvHZFhW7UnTLOJYIkS A==;
X-CSE-ConnectionGUID: qsnyUnzkR+mKdOj4hw/XWw==
X-CSE-MsgGUID: DUhFDy4GRBmOmnruA+shjw==
X-IronPort-AV: E=McAfee;i="6700,10204,11127"; a="17905579"
X-IronPort-AV: E=Sophos;i="6.09,193,1716274800"; d="scan'208";a="17905579"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2024 14:24:12 -0700
X-CSE-ConnectionGUID: CASa3Bk1SICnjrl3wB5SIA==
X-CSE-MsgGUID: 5n6SR3s0T06GnyPRiIicgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,193,1716274800"; d="scan'208";a="47513978"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Jul 2024 14:24:12 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 8 Jul 2024 14:24:11 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 8 Jul 2024 14:24:11 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.41) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 8 Jul 2024 14:24:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KXKysULGE3AHbbfghQMmS22XhyaWScN9OHKD58VzZ4zCwKmEjq7uHXNgALpRQzBYtRhMrw86iWsQcxs7rQxd+6jlMjQGpf2RI4ZKdnMBFRQaTZ9TOWclORIeIJiSPlVmXlZzy7BdZGN1dsa61lbIldopBBrZ5vqofXXMzNVNCjJY05udTOdx1MnQFC5D8mXMANea6y4nxJv9gc/I6dTD/4FTUDJ1jU+wjTKuQ4vPUj1Ln8oZqhru58c/BdeWkvLLaL7ZcZ04ZYdmp56vbcSLqtXJoJ3DGGxHw7dvCBSWsMA+iddBWanDEfLoU9gyYVEoXeWPzRXJHrwQSMDerzbw6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dw3wE3wiHRaP2lJj0Ogf5P1h6/Ofn+StRfCHtezO8aI=;
 b=GFiPckDUvma9Lw5lMtX4Zt3fWTSxqBRvTNaCMi/pLwDwKLgOYCoRrvzFhcd9j7zIM0uFErHFEIoYzDzhJ6V5oQGLu+KdtLg8r5NYsbfkO6/ctUkt02Fm9FJX+DI8/j52ULrEgRJF9I/SPpgVYcgOey94n80A145ZWP3tqKgNQF8hb7U0wulUHcB8V457Zf2Q9TLSxp2QOFA++Qve+wnOoISLORB8rqMl9lmacFOVAvQJst+klyRCoUYa6kmNQgOKUmET6jTfIU8WBMyFGZgt30mdbrOFodQ59zpe/wzvZV4R3VCZm1j1Tllcj2IMwysdPUHOITQXdHSTRDFlbVHNhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by DM4PR11MB6141.namprd11.prod.outlook.com (2603:10b6:8:b3::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.35; Mon, 8 Jul
 2024 21:23:58 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51%4]) with mapi id 15.20.7741.017; Mon, 8 Jul 2024
 21:23:58 +0000
Date: Mon, 8 Jul 2024 21:23:15 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <lucas.demarchi@intel.com>
Subject: Re: [PATCH 2/5] drm/xe: Add ref counting for xe_file
Message-ID: <ZoxYw1dsosvRTtkp@DUT025-TGLU.fm.intel.com>
References: <20240708202103.3347869-1-umesh.nerlige.ramappa@intel.com>
 <20240708202103.3347869-3-umesh.nerlige.ramappa@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240708202103.3347869-3-umesh.nerlige.ramappa@intel.com>
X-ClientProxiedBy: BY5PR17CA0032.namprd17.prod.outlook.com
 (2603:10b6:a03:1b8::45) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|DM4PR11MB6141:EE_
X-MS-Office365-Filtering-Correlation-Id: 2cc2b0cf-3552-4f77-33c3-08dc9f944789
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?nEyoN4Ad0qw6eViqWdaAiQ/KhhFTiIqVLVix4ELM89/+40C/KYUYswyUnlPk?=
 =?us-ascii?Q?u6C0ZS8sQaXn4fhlvrln5t3LIOO0PAN6v+eI17mLFqmzA2zXT0PDXjLmKDBN?=
 =?us-ascii?Q?UAO994n9l6vw1m+pDLyodc0FZEWHeBcg6PLUuni0TuwxM3CJ2N1WOuKi/lTu?=
 =?us-ascii?Q?I/bFzUSFCft4C+Uz2KgH1uhWb/NyBDJ20hxNEZkz0/ydy1txm1oCIAUtkZBw?=
 =?us-ascii?Q?haynPZGLcHo5UdOXtEUKaLTwbd27FuhOwnTeKfEA5vRc6EUC2DQN9Y+Aw70y?=
 =?us-ascii?Q?5S0GXzLxq0h9XI88uzQHpqwQN366RAu7wlAFS9VerPGISPg01gLPHUqbYoVk?=
 =?us-ascii?Q?w3EfnssZJTECj0mgr+FMN/MKq5Dwz3hlQaVD+MgsTo/c7nY1IPDn20CatcVv?=
 =?us-ascii?Q?9YE1DBq7nZQH4C40mB1OTzBNtJv+V+b9kPNKu+f5p7NsbGu1W50gDU3BgJvs?=
 =?us-ascii?Q?5ni8EySz5i6aGRNS+aFoVQl0NbN1exSYxTb+0va4+M9HSpbptGqKZzq8ojTO?=
 =?us-ascii?Q?Xj+sp1x1KJv4TcfWmpY3RfkKkN31W8Iaoka8OBE8/sVHYt24MejwcVDbr1cs?=
 =?us-ascii?Q?jbIcd520CTl90LUbJmkkkd1YxepJruZgdZmDD+otVzRnjlS0CJ8mSfHY3Bs/?=
 =?us-ascii?Q?sR9BfuRE6MFm5joyQXVermGwpleFECmhvauw6nb+Uy00gz6LTrOUCrymKHsW?=
 =?us-ascii?Q?hF24PTaO6X6Oyu15fdqpNOL6aHKBalWv6KyqySnQjEIvQCQ42oc+4AekntmC?=
 =?us-ascii?Q?Bpzungig4B0ZQpwvCN2huB2WRJhF2xwOJh7gBW4/numehhS89SZqNg3U1E0U?=
 =?us-ascii?Q?TgjOWoizDHx40hBTelrz4ey2sjsGDkyZ4KGBoLVg5Ht2zWFD0uZileg+iK9h?=
 =?us-ascii?Q?aH7sVhRJNZIh3HNpye0ABZmkCqCjc5XXnpGwbDu4ZAAETKwXacZR7gsIFH6O?=
 =?us-ascii?Q?NZDSX15ImTd1SKPLReW6/yC41oU/Nk701gF9FAIFrjWzxHBXEA0gwVejrtM+?=
 =?us-ascii?Q?EmCkgsQggWx+/5MIIAG6Dyx+m+YjzPQ92V8juKhmJY+3r74kXqF1DoCLVUEP?=
 =?us-ascii?Q?iDc6sdqDJy4tNLBqXO1171Q09MAbI6UNZ4wVE+dDF6O8hRfbPFV0WvinHPxU?=
 =?us-ascii?Q?X2R6qIv90pI7ctJkk3F5lQy4EVJBBFK0AoBc0VNJMNoJT5HH81Gpftj9F/Li?=
 =?us-ascii?Q?VbrmdumukhwsZPysS+m2nG9pUE3hJEI6WeBpwhA/VWgz2562h1bn8UdMYkqB?=
 =?us-ascii?Q?hag18dPOqJFnS+jlxPj2GrP4qZ+uT0yQq5B5VnlKu9ga4UC0zOuq89hjQtwA?=
 =?us-ascii?Q?brJiXH+W3sqFxgJ1G62Pp1S1Wz9qCDssEZ892zr9AthbPA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vJFprfdZRlmr7B0kM60PyHvSnIQEgCGtLEXDUf3De2D6ku93s15DpfMLWnq3?=
 =?us-ascii?Q?oPFyIbmtKYdqQdKNB4uIU5cUp4Ac7DB2bWSXv20pD15SPmRS1K7oxbwids/Q?=
 =?us-ascii?Q?kNcjsMA5J5fZSczBLMTcwP8ndCpFkmi2KvJ48/mOdLJDlyQvm6P+YTQsga8i?=
 =?us-ascii?Q?lgTaY2QQ74mvED4i+L3s0+LQNQTU+PyQ7Km5pyiq4PRKsErI+TjQmR2vYnkQ?=
 =?us-ascii?Q?91Ee+RaZOPHyo2r2P6fEO+ZB3/TZi0RGja8MoAh9eLhQGm5SblRtOQD4FBOY?=
 =?us-ascii?Q?yOcKx/vRIf6p2XOrHRSeOaqefEMGi1ENjetWa2v5VSRKZ+YZTAHUD9lFfRID?=
 =?us-ascii?Q?+0/468tMNlZAMmbOj2Z3fEB+1Iv+/AyJ55Fo6pNP0ow4IHGeexH1UOsLwxFZ?=
 =?us-ascii?Q?4P4Em3Kwy4/kkTYVg5ps/m1Dvk2c3wo8T6TvvhiO5E2r+PzNiVd5/C52XI2L?=
 =?us-ascii?Q?f9OL8vHzvCfje7ZcqTu+VKvjQ8jOS+r6JUys6eq3cqTKdo7RmICdYhYOOWzs?=
 =?us-ascii?Q?Qa2nDdwwBFhJfzRUeTeY9Cnnbc1kDkjyNy8J6pYzjY4cyclFdjn+f6Sy3A1g?=
 =?us-ascii?Q?njkbdjmtU68Y+BoDj0Qk7FzEA1gl7H42Py9UsENwsgNRLjT4m1z9i6QY4URl?=
 =?us-ascii?Q?oHtEcSrYS2w/8d5EQxyEX4MNcMPH5t2dgzt6efbJYKyVTZ1EwVKjOVG1BXMH?=
 =?us-ascii?Q?xMuFa5fUVyUTqmEmZxD7OWWGhU5O4VTTEMqn1sGZPfA4qD9weBrAKKNpBxmk?=
 =?us-ascii?Q?fDlDH7tKAGwQe74KRIxXZ5B4FK2mVIM+95D58x2be1e9UpwgjVExFjq/RHE2?=
 =?us-ascii?Q?FXApJJU0rX68Kq8UXqHux6fuEXbA/pcF6S2GbeOIhVV+Vo3Ocux7XZjUTgdU?=
 =?us-ascii?Q?wbS1hlyq8ZmvBXnMPHF+G3UlsO9JdqSX6/1XZbh5HIokdMRm0O5+tt7oewmh?=
 =?us-ascii?Q?mKkTz8mAthgDFySJlr5nnjUo9fMaTct3rZpdzludR/gjeUL8fUGtwb3vfIxx?=
 =?us-ascii?Q?3a4aF91bVZv56Gj7BFYz20w6ie/7IiDcLGdCa+6vdnK0gX6Cv6uGWOJ1Hohr?=
 =?us-ascii?Q?U/r1lo7DBts5tnGtGgqabnUu2q/y62Gq+7qT/nklWV41fIFwMUhtj0TYaXFH?=
 =?us-ascii?Q?iEjC9Ly6A4Z3vdqHyVpsJYE7pFQ9AnYB5cvjhiq6yanAEWiMhy7dehHUx9ac?=
 =?us-ascii?Q?qPQaUuXJZXiwB/+V+LAZYacSYugM+hFgVZM4OcnZhor27ubqwXQ1NKIrvsmf?=
 =?us-ascii?Q?YOw5+avfvB4ZM7VK5Kr+h7xFELiX4ZUEkexvONKytDgf2+ESmbr6nJHQc2OJ?=
 =?us-ascii?Q?c8WrTxWV486PO1dGcujej1pEz1H/FfbzBenTGRjQoILZUicgWvBuOwXBZsCQ?=
 =?us-ascii?Q?4S8rUzs7yC4lZOi0dDTzeeRp9PqSEaItJz1cOetkrU6lH52icRoB1tixm4N0?=
 =?us-ascii?Q?wXb3XgIW027/ZJV3+D2IS/lInuUZ2hgFn895eoQxtgLM/mvrVDSPOEU1TtkV?=
 =?us-ascii?Q?MW1D8Ef8e52eJsImrrAEMGHP4EWdGl6nknFxiTY+hw7CZO8yOl5XhLlmvGeQ?=
 =?us-ascii?Q?NakIZDOCp179fjq+1GU3r+vzG+QDZJIHVczHJdF0GaxPYtBDXGchQXHwyulT?=
 =?us-ascii?Q?Qg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2cc2b0cf-3552-4f77-33c3-08dc9f944789
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2024 21:23:58.5732 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8BrrNh7PtqxI3Qd2kBXqg2v/SC/CA3kDnMm7leWgOcUcI4LtM+qlTCwYUBdxHf4a1mUNC7P2uCDzH2+tWn0SWw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6141
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

On Mon, Jul 08, 2024 at 01:21:00PM -0700, Umesh Nerlige Ramappa wrote:
> Add ref counting for xe_file.
> 

Patch LGTM, but a nit I'd make this first patch in the series.

> Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_device.c       |  7 +++++--
>  drivers/gpu/drm/xe/xe_device.h       | 12 ++++++++++++
>  drivers/gpu/drm/xe/xe_device_types.h |  3 +++
>  3 files changed, 20 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index babb697652d5..e6eacf1bcce0 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -87,11 +87,14 @@ static int xe_file_open(struct drm_device *dev, struct drm_file *file)
>  	spin_unlock(&xe->clients.lock);
>  
>  	file->driver_priv = xef;
> +	kref_init(&xef->refcount);
> +
>  	return 0;
>  }
>  
> -static void xe_file_destroy(struct xe_file *xef)

Kernel doc as this is exported.

> +void xe_file_destroy(struct kref *ref)
>  {
> +	struct xe_file *xef = container_of(ref, struct xe_file, refcount);
>  	struct xe_device *xe = xef->xe;
>  	struct xe_vm *vm;
>  	unsigned long idx;
> @@ -130,7 +133,7 @@ static void xe_file_close(struct drm_device *dev, struct drm_file *file)
>  		xe_exec_queue_put(q);
>  	}
>  
> -	xe_file_destroy(xef);
> +	xe_file_put(xef);
>  }
>  
>  static const struct drm_ioctl_desc xe_ioctls[] = {
> diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
> index bb07f5669dbb..2a8b370b1fda 100644
> --- a/drivers/gpu/drm/xe/xe_device.h
> +++ b/drivers/gpu/drm/xe/xe_device.h
> @@ -169,5 +169,17 @@ static inline bool xe_device_wedged(struct xe_device *xe)
>  }
>  
>  void xe_device_declare_wedged(struct xe_device *xe);
> +void xe_file_destroy(struct kref *ref);
> +

I forget if this is a hard rule, but public static inlines likely should
have kernl doc too.

Matt

> +static inline struct xe_file *xe_file_get(struct xe_file *xef)
> +{
> +	kref_get(&xef->refcount);
> +	return xef;
> +}
> +
> +static inline void xe_file_put(struct xe_file *xef)
> +{
> +	kref_put(&xef->refcount, xe_file_destroy);
> +}
>  
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index c37be471d11c..ec2b0fb6afe1 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -566,6 +566,9 @@ struct xe_file {
>  
>  	/** @client: drm client */
>  	struct xe_drm_client *client;
> +
> +	/** @refcount: ref count of this xe file */
> +	struct kref refcount;
>  };
>  
>  #endif
> -- 
> 2.38.1
> 
