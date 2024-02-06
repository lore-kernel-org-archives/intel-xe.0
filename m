Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50C55C48297
	for <intel-xe@archiver.kernel.org>; Tue,  6 Feb 2024 23:53:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12513112F81;
	Tue,  6 Feb 2024 23:53:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DDuEvDpG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E3EA112F82
 for <intel-xe@lists.freedesktop.org>; Tue,  6 Feb 2024 23:53:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707263591; x=1738799591;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=hBSma6VyCClJr9RJFASB/paTmJ1kMZRsVSL+CqlApOs=;
 b=DDuEvDpGCjeaZoBydGBkydHsDwr9nnc1rcZc1wurGRFQEVGLizxO7T4H
 0hbVBz0I8q0PJifrtRKnDeMw1HMOmcdfQ/ZhtLeMJNuQhwguGT8zmIwis
 z6HOWEJLiDYzxq0z/kv7GEx9H1pr0/M21EMq/CqSCobpySEffzFphfbh4
 se8/Covc3cOziUKyqd9flMp1SGrSIs9WsAgwU3Me5UiFkXLjrXFU6lxS4
 bBDo4isItT4p6hGjXrjn4NboeszIf7LKaCA6/p49FBnkBJd/9GfwICnQC
 W9nt7nConQx8SrwGU6n4Rk4iPKNx/GZaj8I2SMtdFjxHELl0NDeKMzT3/ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10976"; a="23349778"
X-IronPort-AV: E=Sophos;i="6.05,248,1701158400"; d="scan'208";a="23349778"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2024 15:53:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,248,1701158400"; 
   d="scan'208";a="1393264"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Feb 2024 15:53:10 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 6 Feb 2024 15:53:08 -0800
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 6 Feb 2024 15:53:07 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 6 Feb 2024 15:53:07 -0800
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 6 Feb 2024 15:53:05 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bNucBDlqnaH05EgB7CrUkSjb5k5T/d1Vi/c0mCkSc13Rz2PVmUj3jqMBOKDWr02PJlly3q+kZi9+DTZUqiIVFrDfARZ5F/tQ8zh31Qx/Uefbiw7eEXNYXAlu5yf7C9+BPkfcoQZpt0TnMQsJb/cdlmSVXAziuoOlwwE6rsg4bvoAr/M7EiL6mRNhWRGML5Zei3gnYxJEEbDJiH9M39XsIf0LTEl/s0pResIovNOtNq6kD3OcYz10sofWpkppCNO4/FE0qYb24Zb03nsppFQ7IjIzt+k5o9sejIXNip5st3nkumfeSTAuFU7wjcfnlL/1VrHvEMEibV5ceWwy1GwhMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jZp/Q1bMQo+Q/zWAoIg7MGVczeAw0bwkQmZC4umI/x4=;
 b=fO5YAjVWc7iHyzwaat4kbrKeuzdZrKsT5udubN0BnPvkvCqdVpQ51PgMhWq4GdNHlkyLtu/h0NotCVG+m59QqEyq2k9smdoKPC6IKeHEKu7YMcQT939AshwzWPELNf9E7X1eEXv6+ExEx9iCNKpj+a1VKc3eL9UqoQdze1wv/atV2G9nj8XuXk6AEzSq8AViO45l4lMRqS3ELeL8XHYsDk3RQSnSc1WCDHaDRzaOpXi8/c4WvyJK2cdYG72oX/io2YG35J/j99xR9MFsR0+8iU3USZGytX+yHyY3gC9FsA4XsM24VLj7XSr6lI0saVahwLGtzky9mYwD4mXjWXMA4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by DM4PR11MB5232.namprd11.prod.outlook.com (2603:10b6:5:38b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.36; Tue, 6 Feb
 2024 23:53:04 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::152d:16f5:ab9a:7c6e]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::152d:16f5:ab9a:7c6e%7]) with mapi id 15.20.7249.035; Tue, 6 Feb 2024
 23:53:04 +0000
Date: Tue, 6 Feb 2024 15:53:02 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 14/16] drm/xe/oa/uapi: OA buffer mmap
Message-ID: <ZcLGXsv+QdSKVA9T@unerlige-ril>
References: <20240120020026.1261201-1-ashutosh.dixit@intel.com>
 <20240120020026.1261201-15-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240120020026.1261201-15-ashutosh.dixit@intel.com>
X-ClientProxiedBy: MW4PR03CA0265.namprd03.prod.outlook.com
 (2603:10b6:303:b4::30) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|DM4PR11MB5232:EE_
X-MS-Office365-Filtering-Correlation-Id: bf2f042a-b2eb-445b-fe2a-08dc276ec24a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: smG+IzfdgrXvcMB/k+mowwvBJ5A6Q1o1cL6n/QIEmxWxMnxBT1sZAxRZQ5AG/UaV63IUAheMOkZhefAjqUZE9xeGlksG+X8EgVXRuiPKxK0TRqeLaJeR87BsboUw83LAV0LTW1I07dDIPVkxUAsdHnKCXtfmuFnJ2Q7bcA119UyoHc+G2PqdECOyWmDdJbiptuEJYW+j/af1g6SxVQfycus34JjQKLnPdTDv1NPfSG1ZNmHc1DmyIDqO/EXUfqAl9XJNbkoWZT8v9Fz2uXownYw5yoff1Y8EhkhWxY1lq6jiYHTqNRulN8/TgWbsGH9EGeCWzHOciRoUGkGFySkpx5q/aT+Pur1wwcGpp6fkdl0ElWmS1Dl4BRhfDVtPlqPJ/xvwQGf9zDToXccD51d1UQ1hdA9YNCYYvsCLpm4TisWYCvHGvwyYxFnSbqAnx8OdhaKHnlyToVweAm5xP87371d5vTQgxDv92PqXVN+rZTfcfhX8r1Y36DMKRF+ZWMh9tonDz8XU6XiXgogrGPlUH3lviQswrSzYVSdlc2TwGV4FF/6MgFNYkf5pxbbH0Lxd1w/kgoajhIonZ/mDSC/RLnx4HuXCvIocQRd3fM8f3u4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(39860400002)(136003)(366004)(396003)(376002)(346002)(230922051799003)(186009)(1800799012)(451199024)(64100799003)(33716001)(41300700001)(86362001)(4326008)(8936002)(8676002)(6862004)(5660300002)(6486002)(478600001)(6506007)(6512007)(9686003)(26005)(316002)(66556008)(66946007)(66476007)(6636002)(83380400001)(82960400001)(38100700002)(2906002)(67856001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UmNqeG54dmczY0ZKNVFWSVVkQ3Rpcnl5OVhSNDhnaXQ2d1VLcE9DTk5zM0xJ?=
 =?utf-8?B?c0NENWVFZFBlRkFZbzNxZjZaSXZzSUx2NnBnR0JZdXBibW8ySUUyMTMrZ1k5?=
 =?utf-8?B?Y2poYjJCcit1WEIraUpDSExzNGVSMjlZQU1QZnNDY1RXT0tUZ1dVWHJJYmMv?=
 =?utf-8?B?KzkwNXJKbTcvQ3NkTlAyUGl0aWNNUUhkUkdrWU9BV1ByZTRsS1ZacnZ1eS9Q?=
 =?utf-8?B?OXlSQ1pYVnFhUHFlZlJhQkNXNFBVbHhLTHF0NittaEoyS29JTnV4eTQ0VHdl?=
 =?utf-8?B?aWNwcXluUVdlRjlSMlBMaHpnNENtT3FhYXhzRVlha1R5Zm94ekNyZTRlNk40?=
 =?utf-8?B?SXg4ZnNwWFR0VjZUUUo0RUdvVFJLUDVwbkYwVXIxV2xKY2tLN0NScE1yUHJk?=
 =?utf-8?B?cmE4ZDFWdnBJK3RXZ0orc25rK2RqSFA0Z3hlNHRjZjRjN2c3bzRyVUhlemdV?=
 =?utf-8?B?b1pueUo5OW96QzROUC9EZ3pnVnI0ZHg1bGxOczdDTWF6TWI3RlVoeFJpVnpP?=
 =?utf-8?B?YXN0M2RRbE1mWFc3cXBsMXpWUFZIMmpzaXBzNHdkWWlnVDBpR1V5UGp3TW9r?=
 =?utf-8?B?VzZBSE5DUEI2RUJ5MUJycnBKRXM4c2FXWlc0QmVQQVNma042QmYyNWhONzg1?=
 =?utf-8?B?a1RiVnlyQzJpUFd2SUhBNlQwbDRlQW5wS1FNYnhqM2hvK2hETytnTzcvaXBx?=
 =?utf-8?B?RkVycVFSWWZzM3RrM1k1TDM4dnVZTStFSkt6dHRkcVdBTER2U2k4MVZRYkdD?=
 =?utf-8?B?bklGNklmcWVnZVNrOUc0QWl1KzRIdkhoNWNKOXRNUFR3bnlhSzI1QW44T3p2?=
 =?utf-8?B?ckNwK3NjMXpuK2xqcjJScHcvRzdKVEw1WEtkamRJc3BuRXVlMmpKMDQ5cy9r?=
 =?utf-8?B?RmlKUW9ZVjdmcHpvalJoMzBIemIxd3dvYkp2ZEhiZS9vZE4vcDlFZ1RSdjBn?=
 =?utf-8?B?TVU2VWFFajRSNDcrQXJzM1N0djVaWE1jWlcxTEg0UlBlc01pMkRTMER1QXk0?=
 =?utf-8?B?M2dzSkxKR09ya3FiUWtocnJtTVR2ZzFJZFhGa1JwdG9CbXkrbjVHTXBqYXF5?=
 =?utf-8?B?RjFyR0FFOXBwUUpIVlRkcGx3clpYeXJUcytuTStBNHRhdG5HZ1J6bVA1ekgz?=
 =?utf-8?B?di9yd3pVb0JDbkFudlBQbUtHNkxqcThOZldsM3daTUpYWVVvM3V3QzROSHc0?=
 =?utf-8?B?UVlKeHl0bncrS1dWeUZvTzBnVmlxZDlzdUdWQVEyZ2dCMEh1SW1DNXRXZGM2?=
 =?utf-8?B?eTY0UVEraTVZbWRxOTg1N1o5TlQxbU1HNk85Y1RBQTNGRmh2SVAvblMzNHNO?=
 =?utf-8?B?ejU5d3hwdkwvcVdmN25IWmRzVHV4VjVWUnlNZzJFdzlvZmhVOFh1VkFzcFBS?=
 =?utf-8?B?b09WVkJuTHVvaGVMaFBNdDlTMXJORk5KeVBUSDdtb0tueDdHd3JSSHFrZEdZ?=
 =?utf-8?B?ZFNnS1AzTGxua2VsSjVxS3BFbHdsZXZjcEZOVFozVnBoS0RwSEx3VnJaNWln?=
 =?utf-8?B?MUtJQUM4UjRLamNRYWVacjB0enFyYXg4WjgyTmpva0pnVDQ5aGtORnNjaGRY?=
 =?utf-8?B?a2tiRm5GNWdOcVRIQVRsTjZ4VitIbVNaSExqT3FsaGg0N1hKNFlEV0pyMGhj?=
 =?utf-8?B?RjVFd1hCMGoxUXpwbk5jQVhFYUtTamovK0tmL1JzTkg2bXVHOS9HVGlYb3VX?=
 =?utf-8?B?Wkh4WnVsT3lKSmMzc1R4d1FJWlNmTExBOUx1Smt5TTRyN0lYa2FIdlU4NWNw?=
 =?utf-8?B?VFYzd291QjVzU0tvRFFlV0VBdUN3bGhZK3RPcVFZdWd5YVVXQUszbjVXTCtY?=
 =?utf-8?B?ZGVtYVFIOURqUEJ5aDZ4OGJOa0lkMFpjTHBJTEhOanNuaEFRU1labExpL2Vi?=
 =?utf-8?B?c2MzenZTdWNnY2k3RHc3R2JST1ZFSElITy9QazNOR0U1ajlJelJoR3ZvRGhI?=
 =?utf-8?B?aXJqQUNEWW1xRldNbG1NNTB3SUVOb3BqVWRwczBSRGQrUlNXbjQvck4rWkRW?=
 =?utf-8?B?VTAyK2lNRHJFK1dTNGF3UjhMYUEyNXZjSDErSisxYjloTENWQzBxZDZhNHNC?=
 =?utf-8?B?WldCQ1ltc0lOWjRVTGZjRUV5a2g5aUpEc3lUeDB6RnRUM0xVVFAwMi91b1J5?=
 =?utf-8?B?cXdXdmcycVRUOGkxMjdFRnVybFVSVk05dDVYSXpNVEVFam5ObjJ0L0R3MWpp?=
 =?utf-8?Q?GWDBb9edZNNPPTznkOgt/ZE=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bf2f042a-b2eb-445b-fe2a-08dc276ec24a
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2024 23:53:04.0700 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GGnAeTEOOhhKps3neFLB3cj2xdAEAyz2VFx7yXsGLXgFo25J0d82E19HEJ+4Nhi+8Fok6SG37KZp5L2gKJ2RGvCXW5ANDH0WXpAOg3km64s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5232
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

On Fri, Jan 19, 2024 at 06:00:24PM -0800, Ashutosh Dixit wrote:
>Allow the OA buffer to be mmap'd to userspace. This is needed for the MMIO
>trigger use case. Even otherwise, with whitelisted OA head/tail ptr
>registers, userspace can receive/interpret OA data from the mmap'd buffer
>without issuing read()'s on the OA stream fd.
>
>v2: Remove unmap_mapping_range from xe_oa_release (Thomas H)
>    Use vm_flags_mod (Umesh)
>
>Suggested-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
>---
> drivers/gpu/drm/xe/xe_oa.c | 46 ++++++++++++++++++++++++++++++++++++++
> 1 file changed, 46 insertions(+)
>
>diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
>index eed89649daa08..fd34314563dbf 100644
>--- a/drivers/gpu/drm/xe/xe_oa.c
>+++ b/drivers/gpu/drm/xe/xe_oa.c
>@@ -808,6 +808,8 @@ static int xe_oa_alloc_oa_buffer(struct xe_oa_stream *stream)
> 		return PTR_ERR(bo);
>
> 	stream->oa_buffer.bo = bo;
>+	/* mmap implementation requires OA buffer to be in system memory */
>+	xe_assert(stream->oa->xe, bo->vmap.is_iomem == 0);
> 	stream->oa_buffer.vaddr = bo->vmap.vaddr;
> 	return 0;
> }
>@@ -1074,6 +1076,49 @@ static int xe_oa_release(struct inode *inode, struct file *file)
> 	return 0;
> }
>
>+static int xe_oa_mmap(struct file *file, struct vm_area_struct *vma)
>+{
>+	struct xe_oa_stream *stream = file->private_data;
>+	struct xe_bo *bo = stream->oa_buffer.bo;
>+	unsigned long start = vma->vm_start;
>+	int i, ret;
>+
>+	if (xe_perf_stream_paranoid && !perfmon_capable()) {
>+		drm_dbg(&stream->oa->xe->drm, "Insufficient privilege to map OA buffer\n");
>+		return -EACCES;
>+	}
>+
>+	/* Can mmap the entire OA buffer or nothing (no partial OA buffer mmaps) */
>+	if (vma->vm_end - vma->vm_start != XE_OA_BUFFER_SIZE) {
>+		drm_dbg(&stream->oa->xe->drm, "Wrong mmap size, must be OA buffer size\n");
>+		return -EINVAL;
>+	}
>+
>+	/*
>+	 * Only support VM_READ, enforce MAP_PRIVATE by checking for
>+	 * VM_MAYSHARE, don't copy the vma on fork
>+	 */
>+	if (vma->vm_flags & (VM_WRITE | VM_EXEC | VM_SHARED | VM_MAYSHARE)) {
>+		drm_dbg(&stream->oa->xe->drm, "mmap must be read only\n");
>+		return -EINVAL;
>+	}
>+	vm_flags_mod(vma, VM_PFNMAP | VM_DONTEXPAND | VM_DONTDUMP | VM_DONTCOPY,
>+		     VM_MAYWRITE | VM_MAYEXEC);
>+
>+	xe_assert(stream->oa->xe, bo->ttm.ttm->num_pages ==
>+		  (vma->vm_end - vma->vm_start) >> PAGE_SHIFT);
>+	for (i = 0; i < bo->ttm.ttm->num_pages; i++) {
>+		ret = remap_pfn_range(vma, start, page_to_pfn(bo->ttm.ttm->pages[i]),
>+				      PAGE_SIZE, vma->vm_page_prot);
>+		if (ret)
>+			break;
>+
>+		start += PAGE_SIZE;
>+	}
>+
>+	return ret;
>+}

LGTM,

Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

Thanks,
Umesh
>+
> static const struct file_operations xe_oa_fops = {
> 	.owner		= THIS_MODULE,
> 	.llseek		= no_llseek,
>@@ -1081,6 +1126,7 @@ static const struct file_operations xe_oa_fops = {
> 	.poll		= xe_oa_poll,
> 	.read		= xe_oa_read,
> 	.unlocked_ioctl	= xe_oa_ioctl,
>+	.mmap		= xe_oa_mmap,
> };
>
> static bool engine_supports_mi_query(struct xe_hw_engine *hwe)
>-- 
>2.41.0
>
