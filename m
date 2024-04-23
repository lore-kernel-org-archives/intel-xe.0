Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1965DC4345F
	for <intel-xe@archiver.kernel.org>; Tue, 23 Apr 2024 01:12:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABF0D10F238;
	Tue, 23 Apr 2024 01:12:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VeWm6UOB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D31310F238
 for <intel-xe@lists.freedesktop.org>; Tue, 23 Apr 2024 01:12:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713834774; x=1745370774;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=orS1C2sxZiCu7quxmwh/xOgd2HADq+UhBTKkvdE0OW8=;
 b=VeWm6UOBH7UNfbAUhKsllFjUx6xMwSG/0MJBucQUA7G51lRxBerz/7qS
 RUvBswpBVS/fbwlgx6Z9sB4HoVJL5AZfUBcZ2WnJSv9CraomA9NCwweu0
 MKTxdByRw8Usj+BMzXT1yvSIuDBxJL0vEM/lVSqzLGIEiLiTNGpTDe2AA
 u5ySy1qImwjYD4f8D2KhAQczv/lQeLVZUXys0vbhr895cBcpRLybhD+hv
 i+gEoZy6bZro94o5WfJRYHOwVVnGgh7OTGmWH9R5jLh6oeRNt9Mb4AN+f
 qXIDyfMv2CLD9yf6K8Vuu9lS9A2fLo/qsR+qXNXENnbVVEwNVxRa51Azv g==;
X-CSE-ConnectionGUID: b8zu6an7TUe3qkuOi2byxw==
X-CSE-MsgGUID: FpJ+qfqpQ6umS0NiB3u9hA==
X-IronPort-AV: E=McAfee;i="6600,9927,11052"; a="9317418"
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; 
   d="scan'208";a="9317418"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2024 18:12:53 -0700
X-CSE-ConnectionGUID: TXg1lS6wQ/mdLCGxKYffqQ==
X-CSE-MsgGUID: iRJcoxM7QkyLdNs1G9HV+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; d="scan'208";a="61646354"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Apr 2024 18:12:52 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 22 Apr 2024 18:12:52 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 22 Apr 2024 18:12:52 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 22 Apr 2024 18:12:51 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 22 Apr 2024 18:12:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E9D/5D8VIROWRxwqXk5eZAsRFBKZV9AqmaM9mmcnwaJsODknO+QhpJ8Mx0J3oogFRjaAgoEkPh1nI8xzrANtFKTyfVjF4AmCxFyfjo0In2fHBuFO6d3bDffdec++ks3OBRNTVfUR0fbUIn8MotTzcMczpLZDxvhMhS6onwTRqDNLfSOQ66iSJj2Da/Upu6CYCmxk9MpXh1TRNT8QKBv35qYpqTV9HOleQguL2IKVHBO1DrY/egruHjbiSzZLjVkRqat2kKKhUcipp9J9HIsMRoX3q55Bn+u8Fu1UXOpiGbHCiF/9gCX20q4MuAsMttJsbE5ZHH3aOBoClvCEzioRqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oBTUiJ0ghV+Cl+pnA3njaVscJAhK8UPvQsu6yhian6o=;
 b=Bynb54lm6gyoWZHHTB3vebDYr5rbkRLRKHLmwA9dQnOkGdEXtmOBQ1u6IKiWZl0L1AWhR5OTjkEEHjYt0k5msqzaTHyeof4jc49pD/iIE3vi84/2GcP7T5kVEElnaN5lNwraXcjjXWpc2Z547ftTAZP5lYP03B4EPPoEfH3F5HkSiD4oi05kZ61Ie6VRWOF17fMjm84Tdf5aSaMZ7xlhXsPNBTnBL6UYK1mMT5NmiBgXkuzP0WvwP2VRe6hvDRmviM/v37h8tzge4wjQF/aPG8uXdTK8qVtpkMSEw+JVQIIc6rapKohvaDRMifNhJtgjZUSwWGXUObP2Cpe+uEUogw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by IA1PR11MB6217.namprd11.prod.outlook.com (2603:10b6:208:3eb::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.20; Tue, 23 Apr
 2024 01:12:45 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413%5]) with mapi id 15.20.7519.018; Tue, 23 Apr 2024
 01:12:45 +0000
Date: Mon, 22 Apr 2024 21:12:42 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: =?iso-8859-1?Q?Jos=E9?= Roberto de Souza <jose.souza@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Matt Roper <matthew.d.roper@intel.com>, 
 Zhanjun Dong <zhanjun.dong@intel.com>
Subject: Re: [PATCH v6 1/3] drm/xe: Store xe_he_engine in xe_hw_engine_snapshot
Message-ID: <ZicLCivv5DFZRfK5@intel.com>
References: <20240405182326.72157-1-jose.souza@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240405182326.72157-1-jose.souza@intel.com>
X-ClientProxiedBy: SJ0PR03CA0221.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::16) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|IA1PR11MB6217:EE_
X-MS-Office365-Filtering-Correlation-Id: ca77b14c-11bf-4086-b8a9-08dc63327b82
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|376005|366007;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?2aOY3zt4Qthig0HxQHWSzyH46fUt7AWPswaj2GfdUc64GTm+pb7xe6ClRH?=
 =?iso-8859-1?Q?VoxRa1C4gVChKkr7B3yoswvevEjg98pXz4jQo/vDy2eX4fJEv/AcF2fm4j?=
 =?iso-8859-1?Q?C1uWE6ZEigE5A3sXE4oOya+Ry5gyWPCisqqYmIxCYoqNEmrT4S66r8md2I?=
 =?iso-8859-1?Q?4jeFw8XAxkcmm2HrqD7dbgX/dLvzVMGmBCt0lEQWk3L5F/xoys+5ENg/UR?=
 =?iso-8859-1?Q?fOY3TNl+hzJ6Lr+ZnM+Sn1m/iG5eDMJuLNOQ8q38lJp1MGT46Z7Jc2o65A?=
 =?iso-8859-1?Q?hcqzlAEx1+YWRJdIeJW6nUlE2x/jTOWrOrYJPOrdszGc1M8RQGHpwmp6BV?=
 =?iso-8859-1?Q?nKI5Oe1IsAke9m7q6MD8C3aff/MYcdjFFUpqMAoLck8NsyD0/ftyD4Elno?=
 =?iso-8859-1?Q?suiVwybCffPjRyKG+/uVhao582OdtIGR5mW0ugIgdmrR1GAv4Drrtf3oD/?=
 =?iso-8859-1?Q?/Dx6GKaYX//82ELsAsxpqj/sdYd6OCGAQwtmUXkr6V/s39lbbyywWhzD0I?=
 =?iso-8859-1?Q?n7T0hZO0lcMQ8PsL/DxVzgIaD3yxG6otncO8bmp0/Rba2qV2u6UQ5JCdU5?=
 =?iso-8859-1?Q?9VaIvG/xtWklHpEHSaghlJ01YNP34LtkMAmUWgpu72I2peCRFyuBpU1lmf?=
 =?iso-8859-1?Q?nUPUQrGOg83Ebt9ft6Tfy03NiLd6NdEZFQsprKV1Nby9bSE+er3oZPVJ5v?=
 =?iso-8859-1?Q?ceFmUoKjRUv6P70GxcSkrVNyoiOQaXnPlNSAXB12E1XCxkWDYgTLv7UsLE?=
 =?iso-8859-1?Q?DlQHTiLqbTidgH/fuPw0fNR32zIj4TfRI+AdzQ6gw+/N91gFHdpeaVM9bk?=
 =?iso-8859-1?Q?5NnK+Hj8qOeiK9GKSo4gOKVow2+mWa/ocQxgj/4RmcO2PBiIDPHT5BAcnr?=
 =?iso-8859-1?Q?ma/OYCGK5jsY0H0tcszuYVF0C5w8Sq7ujJRM+jr5ld1EYJkc6vs96SA2IH?=
 =?iso-8859-1?Q?mnB+vMaKh6pD8xjucPXwGcqPHwo9EgveXo1go7jIlZdnKmHmgBh/lXNfCI?=
 =?iso-8859-1?Q?lyvgaLrRsrqf0AlmokdZjDSQ/W57dqc09RqJUoCPwqyopnQzbplZ9nPtOX?=
 =?iso-8859-1?Q?3ar99q08pDWPzskTPTJeBOcsn0mJYuJzYdwh2wMd8wtoG5mWDT9nNV90nM?=
 =?iso-8859-1?Q?p9XWY5XeK0TJFgLiSwz1xzRwB75WRUebahJFTjKW72wgNRnYletWlyRaa9?=
 =?iso-8859-1?Q?UVO+mWaxHUlKbJ4kOb5YD19ow+/ici8irHibhAJ32ZmcH4q6m+CePiimTY?=
 =?iso-8859-1?Q?TW2ln4oFbMkGqZtcLX7TQYinRMIZJEisVNy4Qg1ryLqzY/a4Zooh4b4UtT?=
 =?iso-8859-1?Q?P2egFnt4JIgY1K7gV9GWU1G0uQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?ihQuRPU0yVCLF7WE8rY9VYT3zc0nbfLG0V6jacCGRcSUSNyUnOrib8Wwgz?=
 =?iso-8859-1?Q?XzsTQ5oBhCai7GVTSoMq9fufDxYMRzPtAa1UhfMFdcH6TXjdH7mgfWf9hp?=
 =?iso-8859-1?Q?Kq0QioDzUW5YE4DooWfTFVGirxN0QawXMj1GJizm80tt93ywwSZU4QKlMk?=
 =?iso-8859-1?Q?HC4TMbiHrIzXlzB43rKNn4XhJf08aEtupN4fYKM5FtfZkFg4RnSpaFgOk2?=
 =?iso-8859-1?Q?iijw4k/SnblYVVlXFw+vmxY6ZWC/4QllSJ6OWxu71J0wLpLxZhzu9OULqM?=
 =?iso-8859-1?Q?WT7GnALWNXY4LBcH+qoNjHCqZSBN44phIeJGKynzZ0HpF91NMuPcZ8spCu?=
 =?iso-8859-1?Q?7sLZc+sow84DCcu9zwl69av08n8vVLgBL+I3xDF1jJw4MXOvr3DRQPtSLw?=
 =?iso-8859-1?Q?S22K434bmD14DyTyAmEwr7woDaQenqt6PuCCrg0/p3P1OF1s2ifa1FRnhZ?=
 =?iso-8859-1?Q?C7Ymbr8lg0fGxxgiBlVEfIyw0vnXY7ZRDNRpp/oWxj9gfDHNoy1cjTYzaP?=
 =?iso-8859-1?Q?osz5n4cLNFV1w+F5N3I2V7Z/TqvCZDCbZdZSarU5UVRRNO6/A1AAfsRs8m?=
 =?iso-8859-1?Q?N1PwSBxXNmn6fXhFWy1gm53i8x5Oc+Id9u8anysltGYd5GDZnOqOcGjBfh?=
 =?iso-8859-1?Q?kZ2vOIKkqQwFkLpBzikyNj+4j2qI1iMT/Tsap60vGfZcD8bpLHXgIvB295?=
 =?iso-8859-1?Q?GCS3/0ncwsiN47MGmpxcG9yCaURI2s4RA2XfpwT8JIFh2RV1NH651ReKiQ?=
 =?iso-8859-1?Q?86RPxItSsDaBgRID+JAMJkXdHdZo3cfkfltsd/j7kYLQu5VL0l48/pmgGV?=
 =?iso-8859-1?Q?1oOY7gXNUD7Pat16H95XV/2lTDNdb/tDlpO1U1x/wM20ThoAgT38CxgL0O?=
 =?iso-8859-1?Q?lOGfaupFjjUz7XmU4cHbnAyxL7pADeGEFB8OlM9V8PUePPZFU8dAgV+Bjs?=
 =?iso-8859-1?Q?teMoW/QtKHEb87+vtbAOES77d3/368vZgBwrNwEeAhT6XbFFPQBaeJeJAE?=
 =?iso-8859-1?Q?NrwrNhlqDEMLjJHvj0PEyxdmPmi/aoXXk2bThQffwbaBGzd7bJoc7P8jlz?=
 =?iso-8859-1?Q?Z0fNfFfcLqDyHx/liN8sbZyd7y08I36GiVs0CLPVKI5xa1JoplXTfeZ4c8?=
 =?iso-8859-1?Q?7BIfySP95fa4i/011KzZIiWAgB12BmKRvOhePTR3bgyxtpMDSEpPpZ2WlO?=
 =?iso-8859-1?Q?n8/ZWYQo1OBOUp/Rtiw4NCbLd32H70wMgEsjTJXw/X1iqO8oSkzMVEaTFO?=
 =?iso-8859-1?Q?iHxy1xvbnrS4AzwzkgUKO/UybAIKJkb7//zlkarjyM9DRu7LzVQ+Ym7FkI?=
 =?iso-8859-1?Q?P2LNpcYcyvjQpNurckO6Bp0hyeIMSF6TNyRv6RO0TgiE+ZbniOL70upVwe?=
 =?iso-8859-1?Q?38U6y/iVCiiGOkPqQ7gzvv7PEFo9HKY0GlaNs62qCmaH0tnFcNC8lKAOSY?=
 =?iso-8859-1?Q?gTXyIpl0+ak/uNsKzmFy4ICul4M/l/TG/BrNOioocUefbxYyKAiHRnCbWy?=
 =?iso-8859-1?Q?DW4+WIH/nng/61SckaukHZH9GpyePfmAiAFdpzby6jObEfDSdoWP/Rq41a?=
 =?iso-8859-1?Q?sH9DEA6L3anh69pmsIImlHmOV+frtyqvxCfVvAMv9WSKKVCHa4AxvFJWjI?=
 =?iso-8859-1?Q?jUyxFLjfnOCGVpzEPbRIJYpI4f19mdieOs?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ca77b14c-11bf-4086-b8a9-08dc63327b82
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2024 01:12:45.3546 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +pLqLvJCwQZyP8QfZpoc5X1c3xyy2EBADWr8TwkM37okCBn45XoJDPE4wrsnwhA1ZYE/jngmpC+WLJBef5rZgw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6217
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

On Fri, Apr 05, 2024 at 11:23:24AM -0700, José Roberto de Souza wrote:
> A future patch will require gt and xe device structs, so here
> replacing class by hwe.
> 
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Cc: Zhanjun Dong <zhanjun.dong@intel.com>
> Signed-off-by: José Roberto de Souza <jose.souza@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_hw_engine.c       | 6 +++---
>  drivers/gpu/drm/xe/xe_hw_engine_types.h | 4 ++--
>  2 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
> index a688bb2d96ce3..669753f0a9c50 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine.c
> +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
> @@ -795,7 +795,7 @@ xe_hw_engine_snapshot_capture(struct xe_hw_engine *hwe)
>  		return NULL;
>  
>  	snapshot->name = kstrdup(hwe->name, GFP_ATOMIC);
> -	snapshot->class = hwe->class;
> +	snapshot->hwe = hwe;
>  	snapshot->logical_instance = hwe->logical_instance;
>  	snapshot->forcewake.domain = hwe->domain;
>  	snapshot->forcewake.ref = xe_force_wake_ref(gt_to_fw(hwe->gt),
> @@ -846,7 +846,7 @@ xe_hw_engine_snapshot_capture(struct xe_hw_engine *hwe)
>  	snapshot->reg.ring_eir = hw_engine_mmio_read32(hwe, RING_EIR(0));
>  	snapshot->reg.ipehr = hw_engine_mmio_read32(hwe, RING_IPEHR(0));
>  
> -	if (snapshot->class == XE_ENGINE_CLASS_COMPUTE)
> +	if (snapshot->hwe->class == XE_ENGINE_CLASS_COMPUTE)
>  		snapshot->reg.rcu_mode = xe_mmio_read32(hwe->gt, RCU_MODE);
>  
>  	return snapshot;
> @@ -891,7 +891,7 @@ void xe_hw_engine_snapshot_print(struct xe_hw_engine_snapshot *snapshot,
>  	drm_printf(p, "\tBBADDR: 0x%016llx\n", snapshot->reg.ring_bbaddr);
>  	drm_printf(p, "\tDMA_FADDR: 0x%016llx\n", snapshot->reg.ring_dma_fadd);
>  	drm_printf(p, "\tIPEHR: 0x%08x\n", snapshot->reg.ipehr);
> -	if (snapshot->class == XE_ENGINE_CLASS_COMPUTE)
> +	if (snapshot->hwe->class == XE_ENGINE_CLASS_COMPUTE)
>  		drm_printf(p, "\tRCU_MODE: 0x%08x\n",
>  			   snapshot->reg.rcu_mode);
>  }
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine_types.h b/drivers/gpu/drm/xe/xe_hw_engine_types.h
> index d7f828c76cc5f..27deaa31efd31 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine_types.h
> +++ b/drivers/gpu/drm/xe/xe_hw_engine_types.h
> @@ -158,8 +158,8 @@ struct xe_hw_engine {
>  struct xe_hw_engine_snapshot {
>  	/** @name: name of the hw engine */
>  	char *name;
> -	/** @class: class of this hw engine */
> -	enum xe_engine_class class;
> +	/** @hwe: hw engine */
> +	struct xe_hw_engine *hwe;
>  	/** @logical_instance: logical instance of this hw engine */
>  	u16 logical_instance;
>  	/** @forcewake: Force Wake information snapshot */
> -- 
> 2.44.0
> 
