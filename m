Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A85BC47077
	for <intel-xe@archiver.kernel.org>; Fri, 12 Jan 2024 01:14:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 500A010E9D7;
	Fri, 12 Jan 2024 01:14:35 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9825F10E9D7
 for <intel-xe@lists.freedesktop.org>; Fri, 12 Jan 2024 01:14:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705022074; x=1736558074;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=epZzCCUahfbcgl2COMzfmrFpOQC/mR4U9MPDGFUcQYA=;
 b=VWpgyAAi8OwRTJNf2ean4RpWiYHIMenSmQVhhQv9Ep/U7y8RaGLeoQ9C
 BrHULCcmJqxuZ0VtD1V8cKvKsovAP6jbRx0m2vHYT4iKr3/QkX9qql7hx
 loeJKDh/9ZLrNLonduVn5FmtwntnKykyUw+8SCL5bA3aJAz2w9dkqpoAS
 TJoMZzR1Px7TDQv3gLzgXzksj3IjGVUzbS7TulDqSFhutZ3cJclqyN2b+
 FqPg66OHmW7A9NYAN1QBq3UDat9rMkc6XFh/Sn0CHj0piZ1f2NCDb//3k
 A2iWzkFguLQ0lWz0kxteFHitzy1LZAlHL66aWs4H1rT8IBFF2jmQHpQ7P Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10950"; a="5813130"
X-IronPort-AV: E=Sophos;i="6.04,188,1695711600"; 
   d="scan'208";a="5813130"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jan 2024 17:14:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10950"; a="873214216"
X-IronPort-AV: E=Sophos;i="6.04,187,1695711600"; d="scan'208";a="873214216"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by FMSMGA003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Jan 2024 17:14:33 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 11 Jan 2024 17:14:32 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 11 Jan 2024 17:14:32 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 11 Jan 2024 17:14:32 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 11 Jan 2024 17:14:32 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c4Vy2BLmT3f17QtAs7UL5cI9ryKIvAcc1seoo6/zlf5jaUVvbKiU3lvL0nkNHhqkYCXrq/J1OFaz6WYbXmrSq6Zp/txUal6sjuntXQrO6Hcn8JMO3Ih/T1PkkkDU73+yk4faQSOLlycWt4GjkWF0voTHzu3RbipZMv9foQcGZDUokkkHsSEMiAu9OIAb1MKXdZ0+NQzjAVCvFgaWzhatM3BKCcz2O1tk5198A0i8uSJj3YcOq7v9n1r9f7shwEsnVhJEGtONGzbO8TnBwEZOMQk5h+FLfHykQEJiq2cUO0Cj2qvuqgyk/lp9GviuvAsRPYhCgYCHKvngzGFSzz611A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5yYE/ATbloPhTzz5crYnNGd9ur/qX4iWxLbxFyvDgug=;
 b=EnDli16XwkkHq0K8kc/Wt7ymTFxghUQZsGAiqqhydZhxRmGQQIVp4m2gf08wvdOBgKnnK0unCXCu83WYif/0hP9V+pCnJmAmPTSSp27ijtynjQ1VbWZK/KNWHCLvcSMnTnOQZt2RHILQgzsYn0DtvrB/HxgyyEpnZiijGplH16bp0bMvlVHUw8srrOXWk41jNHzMRE48dshe0cVh0V0MNHmBupnyNHim6iqx88foIBynbOpF4ZWLNDXybgE6kbzQI9NrrEJ6ghOu+j1/qIw0fzvWtdaKta5Gj2y3qvM9EvVbq5hXu/WfIP4tGnyq0gZg4LkTIeYzDzUTx8MZSzEdfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SN7PR11MB6775.namprd11.prod.outlook.com (2603:10b6:806:264::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.21; Fri, 12 Jan
 2024 01:14:30 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::b9a8:8221:e4a1:4cda]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::b9a8:8221:e4a1:4cda%4]) with mapi id 15.20.7181.019; Fri, 12 Jan 2024
 01:14:30 +0000
Date: Fri, 12 Jan 2024 01:13:11 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Subject: Re: [PATCH] drm/xe/migrate: Cap PTEs written by MI_STORE_DATA_IMM to
 510
Message-ID: <ZaCSJ5+WaCBtHwuL@DUT025-TGLU.fm.intel.com>
References: <20240111220238.1467572-2-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240111220238.1467572-2-matthew.d.roper@intel.com>
X-ClientProxiedBy: BYAPR07CA0089.namprd07.prod.outlook.com
 (2603:10b6:a03:12b::30) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SN7PR11MB6775:EE_
X-MS-Office365-Filtering-Correlation-Id: 07feaa84-5d5d-41b8-0f78-08dc130bd3de
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: feJDJ9J4BNw1W1Ge1/mrjZ88DjpGbWls0wxoK/ZGJwQeIon7oeRgSx+6yppZY95pv1yr0+eGrl+sVCA0YktWmd0VP+tThVmjuYWxAqSNOh8Z2kSjI4FfU1R7Nqey2nqIeNyvQcj5kHsnOTp187u9zVyvfX0GwwndIlqVCA/UWOsCNwc4q1i39kqJEcETTnbR5mVHO1NSoeWE9iHlaNdtIhLfYFh9PVFe7xydYAYSWh3jEd5OKGD0kSF7yyK7ZOsgJNo7xkLXQm5jkbp/NdzT6PECXvLfhLZNCSU3nJFfHi6nVRBp2s0oXyDD9719HJXpB0tuE6NBP1qGnZVXL8avFKFMlXz0M3Uv0wYHmJZ8RPHbWFXcFTmOWGjKm1NrNkx7CueYuE5/uLRXMKt8SGMdTZWNg059LWiP5+DxSeQQV6YRz0yACmp1nanakCEljevVItWifXOLR99fdTsAYjUNM3dLak26EsxFlvc9Ge/wNVNsc/kNAZlbrc7NaP7gDHFdaUa2oCh1fzae4pmBcmOMu6zeaqVr1/5WAE13cCV+4idXMa39nVsnT1hBJgGTVAHYpnDLfSBDDAmd7I4oJm+hXR7NLzXVmI7SmdIfCxHQi5Y=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(346002)(136003)(376002)(396003)(39860400002)(230922051799003)(186009)(451199024)(1800799012)(64100799003)(2906002)(66946007)(66476007)(66556008)(6486002)(41300700001)(38100700002)(86362001)(6666004)(4326008)(26005)(316002)(6862004)(6636002)(478600001)(5660300002)(6506007)(6512007)(83380400001)(44832011)(82960400001)(8676002)(8936002)(67856001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?D2Rh2W0wTnguI8Wccf0hBvKe/LksG3oFwf95lX7FV3EtNMcTZri2XLmQR8pT?=
 =?us-ascii?Q?ghTCVNKO/omT9jfK6hsUzns4FWiOxHLm9JudkxLFQ/h0vd/FbOGOH+oQrrOE?=
 =?us-ascii?Q?ZvxqpXfonrcJhm5yL2zNN92C76sGQ7oTtMy7vB0q4vEt4k7VX926DVu7fVLQ?=
 =?us-ascii?Q?6ZdDId06/EM1E1b/GQaH6F9YwYj3RV0Zvq/3ve6D9MSifGHnGSfHEuRNmAQt?=
 =?us-ascii?Q?Ib5ZMNnoTDmvYZjcUcq5SIdduTwyxoqMkcHf9G5ute7GWZxHm7kqtsgaBjrs?=
 =?us-ascii?Q?jTUYaXuQsz1L7lPOQhKjpUycgeD41vFVnrydKKUue1i1ILEKhqXcdx9kb7KY?=
 =?us-ascii?Q?3m4JovvSZsvepxk9Gl5S2m3NZtQmezOWONXHAXtzQw0tm37X7whOeSGCrXWs?=
 =?us-ascii?Q?Px6o2Ij1V8/Q3iJouW44nNJmqo2KPXXs4etSv9Tx6F67vE35Vr17uoaydTdL?=
 =?us-ascii?Q?SVhmHSp+G378FudpW62i8FNQUg76Cyw2Mb0Ky3EG/C0i40MKsaoqlesUMzpr?=
 =?us-ascii?Q?vZ90riUvwkPfFBTIunOSYg3y4wv0teVzkMqeI9EVZvVAvUknv5zEBOfj+5PJ?=
 =?us-ascii?Q?kz0Zi3c5BkPi3RmtLyT7A7IUN+sXRcuygOa8Jo+IwtFP87xcc9D9lqEttPFO?=
 =?us-ascii?Q?orRDXBRtXct/LAZoINvCzymUV5O8yHNFq5FYaF9TAphs9Jxncogg1iHy2D1h?=
 =?us-ascii?Q?gGA5QmhaJFje1Grc67XxDwgiHuD3iI2ySK4po+SOrmggfIvBCxEiNab0A8Aa?=
 =?us-ascii?Q?+X7Ae/9KUpJu/TiBIL7rDV9Wsh1G6GDztL1qOYkXiwUrKQjCpZKA1QNp3RMY?=
 =?us-ascii?Q?wO3N5oc3VNWDG8PbHhFHieL4LVR9XDFoen/p4tV/+D3kacVlwW883w69Che4?=
 =?us-ascii?Q?XtwMdgOcT4FsOyS4uEGficv7E/Pnla70YvVL2pxNs4enWNBeS02wKfcAiqEC?=
 =?us-ascii?Q?AmWo2jkVbEUO2EquK3sa3KN6zU+tRLtVsOHPOc/7C6flEmXs1qeCbfp8qiRk?=
 =?us-ascii?Q?gI+s7BdrKKmBKHesfZE+Qwme6nTo1dizWJTxvUPRZ2fVaM+2e3X8ATQM0n+M?=
 =?us-ascii?Q?ioXZVYHYXwJfgczk5Sa2DEHqthEmPpGQpQWffRQ6aorQilAmhVtTqr82NBN8?=
 =?us-ascii?Q?Yls69aBKSo3X/fZnU9wOU1LVurcsXct5MIKr97cOQK7KW0Xcuoihp9GxEO0e?=
 =?us-ascii?Q?K5ZLKD427PqRBxvueMi1/6qmSZRP+SzKoxG/rgzX7rKEXBAipH9wVQS8MdCV?=
 =?us-ascii?Q?5XjYCulb1fqqhj0LVD63pYAL5ScNcEwr6WFyWFDAQ7i8wIyW387raa6aruAg?=
 =?us-ascii?Q?XSeTFVTxDBZkhebYybdzPNlzbybHI6hV5/B79ihpkZkaEQHqcq7/wDVF5BJb?=
 =?us-ascii?Q?PxTJNQfCE4cTV0hF9XkUoHWLBD6SjSkQq0IwfG0KTnVsIlKe4bLG3NsmGcaI?=
 =?us-ascii?Q?JUSRsj7UhPf8hZ1QZtZEvqFZBh2VLVkNZou5TE88BNRcKHPxBpNTDkhFtd+J?=
 =?us-ascii?Q?u9VLOrgeaqVMQCufsILjWr1HSAZ/v3mlaMcsYKP7towOWjoHifVBUs7EFWih?=
 =?us-ascii?Q?AMg8qBRhpYX7pDn/++KZ66WP6koLclB+rsAqK3gX+ZKASoMTFdqwyMhkptvH?=
 =?us-ascii?Q?aA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 07feaa84-5d5d-41b8-0f78-08dc130bd3de
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2024 01:14:30.1145 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NEDd1bHM+BzjWX8c1dqqQ4fbYZNJPex7qQl7HbH+ehiZADT+LrqTRHhkZ0R1rz1zREvWELYbUz77i3+dUT0S8Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6775
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, Jan 11, 2024 at 02:02:38PM -0800, Matt Roper wrote:
> Although MI_STORE_DATA_IMM's "length" field is 10-bits, 0x3FE is
> considered the largest legal value accepted.  Since that instruction
> field is always encoded in (val-2) format, this translates to 0x400
> dwords for the true maximum length of the instruction.  Subtracting the
> instruction header (1 dword) and address (2 dwords), that leaves 0x3FD
> dwords (i.e., 0x1FE qwords) for PTE values.
> 
> Bspec: 60246, 45753
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>

The change LGTM and bspec confirms this correct.

Curious though if this ever showed up as a bug anywhere? If not, why?

Anyways:
Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_migrate.c | 19 ++++++++++++++-----
>  1 file changed, 14 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> index 88a32b272dda..44725f978f3e 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -72,6 +72,15 @@ struct xe_migrate {
>  #define NUM_PT_SLOTS 32
>  #define LEVEL0_PAGE_TABLE_ENCODE_SIZE SZ_2M
>  
> +/*
> + * Although MI_STORE_DATA_IMM's "length" field is 10-bits, 0x3FE is the largest
> + * legal value accepted.  Since that instruction field is always stored in
> + * (val-2) format, this translates to 0x400 dwords for the true maximum length
> + * of the instruction.  Subtracting the instruction header (1 dword) and
> + * address (2 dwords), that leaves 0x3FD dwords (0x1FE qwords) for PTE values.
> + */
> +#define MAX_PTE_PER_SDI 0x1FE
> +
>  /**
>   * xe_tile_migrate_engine() - Get this tile's migrate engine.
>   * @tile: The tile.
> @@ -444,7 +453,7 @@ static u32 pte_update_size(struct xe_migrate *m,
>  		*L0_ofs = xe_migrate_vm_addr(pt_ofs, 0);
>  
>  		/* MI_STORE_DATA_IMM */
> -		cmds += 3 * DIV_ROUND_UP(num_4k_pages, 0x1ff);
> +		cmds += 3 * DIV_ROUND_UP(num_4k_pages, MAX_PTE_PER_SDI);
>  
>  		/* PDE qwords */
>  		cmds += num_4k_pages * 2;
> @@ -479,7 +488,7 @@ static void emit_pte(struct xe_migrate *m,
>  	ptes = DIV_ROUND_UP(size, XE_PAGE_SIZE);
>  
>  	while (ptes) {
> -		u32 chunk = min(0x1ffU, ptes);
> +		u32 chunk = min(MAX_PTE_PER_SDI, ptes);
>  
>  		bb->cs[bb->len++] = MI_STORE_DATA_IMM | MI_SDI_NUM_QW(chunk);
>  		bb->cs[bb->len++] = ofs;
> @@ -1098,7 +1107,7 @@ static void write_pgtable(struct xe_tile *tile, struct xe_bb *bb, u64 ppgtt_ofs,
>  	 * This shouldn't be possible in practice.. might change when 16K
>  	 * pages are used. Hence the assert.
>  	 */
> -	xe_tile_assert(tile, update->qwords <= 0x1ff);
> +	xe_tile_assert(tile, update->qwords <= MAX_PTE_PER_SDI);
>  	if (!ppgtt_ofs)
>  		ppgtt_ofs = xe_migrate_vram_ofs(tile_to_xe(tile),
>  						xe_bo_addr(update->pt_bo, 0,
> @@ -1107,7 +1116,7 @@ static void write_pgtable(struct xe_tile *tile, struct xe_bb *bb, u64 ppgtt_ofs,
>  	do {
>  		u64 addr = ppgtt_ofs + ofs * 8;
>  
> -		chunk = min(update->qwords, 0x1ffU);
> +		chunk = min(update->qwords, MAX_PTE_PER_SDI);
>  
>  		/* Ensure populatefn can do memset64 by aligning bb->cs */
>  		if (!(bb->len & 1))
> @@ -1283,7 +1292,7 @@ xe_migrate_update_pgtables(struct xe_migrate *m,
>  		batch_size = 6 + num_updates * 2;
>  
>  	for (i = 0; i < num_updates; i++) {
> -		u32 num_cmds = DIV_ROUND_UP(updates[i].qwords, 0x1ff);
> +		u32 num_cmds = DIV_ROUND_UP(updates[i].qwords, MAX_PTE_PER_SDI);
>  
>  		/* align noop + MI_STORE_DATA_IMM cmd prefix */
>  		batch_size += 4 * num_cmds + updates[i].qwords * 2;
> -- 
> 2.43.0
> 
