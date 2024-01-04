Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE97DC47073
	for <intel-xe@archiver.kernel.org>; Thu,  4 Jan 2024 18:46:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E89210E4D7;
	Thu,  4 Jan 2024 18:46:49 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F14B410E4D7
 for <intel-xe@lists.freedesktop.org>; Thu,  4 Jan 2024 18:46:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704394008; x=1735930008;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=dYkYL7UdgGvhF2KQ0H7063KL12zrlEEqCi4gJ+DJ9tA=;
 b=AWUmgNXADesIv+psvK02+e5k6AzA/cUJgYbwxbN3HpfHGmVmDjSWf4t8
 wB4f+1/iqU7yjWW6ozV5B+di6xLmup6ueIgvW7dQQOxQrTS2+r9/IQyvs
 ZqzGXMYv4nwfkdRzOkNrDNrVAMzR8HDXHAnXmHUmwHnVDwOeCKxhv3omy
 vyxsQCy6g1LKfZhmVQjpmfr57X1Bi6AYPVmvq3+8z91meljnDFcb2XdEw
 AuN6+d87wlKW17gWgsvDkl1cM2H5FKkbswuLk6iNz28c+rNu2yflxH3Qf
 me7a0ZDxL8s1PhDWrNwNNibGkvRHUk6HSBCDcqWHeKJNYAcXwHZgV1vEi Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10943"; a="401119662"
X-IronPort-AV: E=Sophos;i="6.04,331,1695711600"; d="scan'208";a="401119662"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jan 2024 10:46:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10943"; a="780503575"
X-IronPort-AV: E=Sophos;i="6.04,331,1695711600"; d="scan'208";a="780503575"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Jan 2024 10:46:48 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 4 Jan 2024 10:46:47 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 4 Jan 2024 10:46:47 -0800
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.40) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 4 Jan 2024 10:46:47 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Dees6p4ma8GZDKsJaOMn1tchRy8HnrQVB/lwwfNiP2/LKdfDpppsSn2+W+YotJbMjuADUfyizGD1I++48GQ6BMVaWkRo8TlV7xtnDIKPQRk5b845hgUWuMY0RdNrBK34eZudzVhSt5rgC3G0Oh9rL5Qc1j5PuXH97mc/dLKh+PRHYQ/gtuR/80eYge6IWmbADODlV++ZmiJEg5j2x8TXyYYAo7Ur8ID7yvO/9sZF10awlOLNHCJsnrPYMYkimo18CVhOBau/BLRtC7TiQwuA1Hv6r8cMzEzyNI64tR61J68j7+ZH2/Wb6bCkFzaZThq6aYvBxhr8N+liuw2qbLk9FQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8w6ev/Vv9Fl/Ms7H47zmmvlzLFR+i01QhvmwehKLo2g=;
 b=Ltf2vmfNAS1BBWAL9NZNpDg2UGKSWwT606eCQl1pOlVVa+s5AF41HAaNcB29Ooyy7laVwhe4jRXu+7UR/JRpjMIiIrk8biLnB93rGlywP+/Z9Kc90g7xxJX2RlNj/RuCo40D8lZO5GtGFx+D5yFSE6ptUhzBP3yYvjJw3pnZF8+UYRkRl6AQx+PfPHQqgKLOfEAVIrKTIC2jnBJDPIB/WLTztGMxrt3qiXOxK8ZIlmch+w5nuoRkkkjc93dYczVjcTpgj7fSuPPewX3GPM8+S1Zre3KVXZ47dZalji8yH03fLI6MKlOzfpke6VEfDH1P6jM5Wi2B8OT/+o8AJcJ+dg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA0PR11MB4590.namprd11.prod.outlook.com (2603:10b6:806:96::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.13; Thu, 4 Jan
 2024 18:46:45 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::b9a8:8221:e4a1:4cda]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::b9a8:8221:e4a1:4cda%4]) with mapi id 15.20.7159.015; Thu, 4 Jan 2024
 18:46:45 +0000
Date: Thu, 4 Jan 2024 18:45:55 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Ohad Sharabi <osharabi@habana.ai>
Subject: Re: [PATCH] drm/xe: skip register UC debugfs if UC disabled
Message-ID: <ZZb849qEXZpYvTCt@DUT025-TGLU.fm.intel.com>
References: <20240104100557.1204296-1-osharabi@habana.ai>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240104100557.1204296-1-osharabi@habana.ai>
X-ClientProxiedBy: BY3PR10CA0006.namprd10.prod.outlook.com
 (2603:10b6:a03:255::11) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA0PR11MB4590:EE_
X-MS-Office365-Filtering-Correlation-Id: c81e96f2-db07-46ac-26bc-08dc0d558059
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oxJ8oz9f5Egc5zHJVsyBT48h3dgl+oVdAu/sR4Zux0BCiOA+NAxW/ZFDXRBDMDnoRh+iMTFu8t8yhL0SwAUvoAh1TcVvTbSgYJItMuoa7wcLTEg/O5Gz67QHSjyHioids9szL+WaFfPkoCWYkCP8ZDhZfYfNLoYG31C+4kwohZu72IbZjwnqWCgRsnUDa3e8d05rL16qPhESV6peVyUaHqUW+ky8jydTsO0n2coyFNwEhBeSsixzRqHJdjk9ddwjJXy4axTgMbVFDiGA0t1n6p1LrHeIx+f0astFRxpUmTDoJgWD4fLYVokDVTqxmE4SEa1MT6s0OCNSOWw5ZFEXgf6Tx0fvoqUa3B1LPxQIOi2eWU/M13xHTGWQp1K2qitg45JkE6iRYfF+Q4bmCsVRxQjvKNweUdVUTjo1gtbBhgiWJel+3nmZDoRdF/GuNDFTImq6EtQBB31QqLqYtUPZVwibA8LzCuj7mUeKY2ECtXsKbI0HqrzckCdZMtlPGCrDB86ODHtCi0OIrD9d+F/CsCpf9nml5y+XD8ZVuV8fBWpQE5TYOHZDLX3ZVeXM8ofs
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(376002)(396003)(346002)(39860400002)(366004)(230922051799003)(186009)(64100799003)(451199024)(1800799012)(2906002)(5660300002)(4744005)(8936002)(4326008)(8676002)(316002)(66556008)(6916009)(66946007)(66476007)(44832011)(6512007)(26005)(83380400001)(38100700002)(41300700001)(82960400001)(86362001)(6506007)(478600001)(6666004)(6486002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8iBj3Qdkgm5OOAXqtlSBDSQmhkh4U5h+wHAMhMnCFnmbrdqJ3YVFT+tfhE5G?=
 =?us-ascii?Q?vMZy8FbR88V/1ut4qH76AZy2uJCbt3hTB5sPiEiwcoMpHo/nRGEb1R+oqU+3?=
 =?us-ascii?Q?L8t6/paX5BbkQCX1B59BRxBEfSp7es8xbUQICAf0LJRQ5s4362FthMpXfXrb?=
 =?us-ascii?Q?lFJ9OUZdtb96hc7LkDUKWh/qpUYo3e1L8eeZEAc9rOtp27CRLfMV5P7xlT+H?=
 =?us-ascii?Q?liWMVCzSvT2rz3rR3z7C5nCKStdeev+BYbowXqlwGEMBMPPw07Bo4EG1bsZ7?=
 =?us-ascii?Q?1cm2yFi+G69CjCF6VQr+wkIl5r2hzPbaDpgz0WtjgH73DY4U/GYE6aCQtv9V?=
 =?us-ascii?Q?okX4bCo98gEvqs7cTAF3xSiKv7a3oEUKHcacBMqZnP5pfYF3uH6IqzWc/Q7d?=
 =?us-ascii?Q?4an5vgPSN2NHvWg41+qrZObhfRIsDCwZ7B82vCw7cfs/J7UDi5MvgAio8o45?=
 =?us-ascii?Q?axt5SPEBKPeDGPXEv4HSep+8WVzeJiaNiGcX4fBMWAEqmfv4PVDUtaqNA8wf?=
 =?us-ascii?Q?PCn4zPVk0fQLTceEXRwsjMnJ10u0dridFPYV0HQc06bWknbDoIffw3jgdADt?=
 =?us-ascii?Q?aoitH5vhbc2VjLhy4pvDjDqd1/KTGtpdcxyKuFWRfjQOeL8AwLnxV45ws6Db?=
 =?us-ascii?Q?GYqclvDIWzRBJTsLs0XP3/KLjbEo9Xlo9qJcEfHD2rJx7OYVxb496l1sJJcw?=
 =?us-ascii?Q?0czy4YUm9kQ/mNrJVqmjBrhq2ATlkw4Mnr4H2dWbONCy5i1w9g6TvzqZto1O?=
 =?us-ascii?Q?VawBXJlk9cRfZ8ZXAcAy1aAZB7WN4pVw7fZbNspoBQrA3DJkfJVP6Nco52t+?=
 =?us-ascii?Q?/K2HaHn5t0WS8M4dRd4lwAXvFCjXEarsCTIkq3rNaDyRwNX5s8kNn8cnU6ZJ?=
 =?us-ascii?Q?eiBlvYTAcCJ06/lNNTJy7jzG2SmHa3GGdMRjubSWHPtG8vJTLE91JJwmo6Fs?=
 =?us-ascii?Q?Xmybj2JA2pSnti+XnYTQN8pX7PdwqPFm8A9SbD4kHSYha++1DZbi9+0i6CBe?=
 =?us-ascii?Q?/L3ZTVCxQPGoY2OWz2hn1XtbPW87u+2ZlxP8tgcFesNlbdp8fRN5SUEVr5iq?=
 =?us-ascii?Q?y030LF3G6NCdrm43C68oFDD0zKwzwlkTqon6J/yHPcW3NzhO8ierzBxcoxLz?=
 =?us-ascii?Q?nE0SX0crpUvp/S1Ln9dxHcAmNBj7d4jICguel4cAsKqiLt9OovFJsovQTbxM?=
 =?us-ascii?Q?F16XWd8UHoshXy9HHXHiUdUYnGsPtdbEED7C6K1T30ciW8HbzrdAryvgB/rv?=
 =?us-ascii?Q?BJyvSY0/tDiHP34HqKmks07S2OpCD1+X8svZL+PJHcgfSrwnZznf9QqHEqI7?=
 =?us-ascii?Q?Azbre+YBOUjybRP9onaCE4SsZ98xFv+Alza6LwjK1lDatsoXCGwj/eL6L9Jk?=
 =?us-ascii?Q?myCwYrTZ0ADXfYvCxxLLXboKURXyDFkVnbdYl6yUXlN8u/9qlopBZcfddp4h?=
 =?us-ascii?Q?LuCkMlbfBTa/e1M4TdTqE/H5+o0uGY9sxw/BPYNzDhCKvUKyCwpyN4W3E2M2?=
 =?us-ascii?Q?7CYc5x91L2IN6qOyo39npCJ0DeXEzt/OUhv6KyJpWRQ3JZ9sj9IdoBEjrOo/?=
 =?us-ascii?Q?k9NMVXguF1Waz4S1e1dvE0pfgfdJsR9/Msh6UKl0G50Jy8mJdYMzZrXefo58?=
 =?us-ascii?Q?vA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c81e96f2-db07-46ac-26bc-08dc0d558059
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jan 2024 18:46:45.7733 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4tqaxfo0TY6sHq2JworBN5eCGUyiIZHbFXxJVrdadi532O7OkqZd7d+MNWkwnu7WJm6tzfSvEz+Lzx2P+gkQRQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4590
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

On Thu, Jan 04, 2024 at 12:05:57PM +0200, Ohad Sharabi wrote:
> When working with execlist we should not register the UC debugfs entries.
> 
> Accessing those entries when UC is disabled can lead to a kernel crush
> (NULL pointer dereference).
> 
> Signed-off-by: Ohad Sharabi <osharabi@habana.ai>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_gt_debugfs.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c b/drivers/gpu/drm/xe/xe_gt_debugfs.c
> index c4b67cf09f8f..bafd55a7fb16 100644
> --- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
> @@ -245,5 +245,6 @@ void xe_gt_debugfs_register(struct xe_gt *gt)
>  				 ARRAY_SIZE(debugfs_list),
>  				 root, minor);
>  
> -	xe_uc_debugfs_register(&gt->uc, root);
> +	if (xe_device_uc_enabled(xe))
> +		xe_uc_debugfs_register(&gt->uc, root);
>  }
> -- 
> 2.34.1
> 
