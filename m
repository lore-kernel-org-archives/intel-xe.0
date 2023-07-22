Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E79BEEB64DD
	for <intel-xe@archiver.kernel.org>; Sat, 22 Jul 2023 01:42:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8451C10E0D3;
	Sat, 22 Jul 2023 01:42:00 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1377710E0D3
 for <intel-xe@lists.freedesktop.org>; Sat, 22 Jul 2023 01:41:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689990119; x=1721526119;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=alXO5rOjOnjenrCKId1Ct1HfzdN9+08w6Y4wju+eMcg=;
 b=Ms8a0RYB/G5nYhbKb2r0p/qO897EZaw/V3foLqbu140/eREachW+pQNM
 lM0NjG/daSjJADI/cUfTnJVwd99fjQv89xdypnQmeKKpOedkij1iYma+T
 Dd6SJct5Km/1PGmHEFzezFXLl7Tbwq9tzGbqEzqDGFDdaGu8nPLql4wa7
 M1xGByPvsmMR5FAFQhnUbRdbR48r/jM3jff67OWEyg/NQMpCWFj254WLn
 G7LXqIODxkrPSRn2YqGPedZrvl9CUo+RKLF2CUCzZfbB6SYYbAmE3fOHH
 iIl96y6nzfAPFtJi3XWUV/A3feJXvRAtMZG89k9IiJFX3Q5RlTJ8HgKw7 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10778"; a="346751578"
X-IronPort-AV: E=Sophos;i="6.01,223,1684825200"; d="scan'208";a="346751578"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2023 18:41:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10778"; a="790370744"
X-IronPort-AV: E=Sophos;i="6.01,223,1684825200"; d="scan'208";a="790370744"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga008.fm.intel.com with ESMTP; 21 Jul 2023 18:41:57 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 21 Jul 2023 18:41:57 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 21 Jul 2023 18:41:57 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Fri, 21 Jul 2023 18:41:57 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Fri, 21 Jul 2023 18:41:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ex+icHUdJPACn7tnpFT4BAXmurVxBLQ3U+Q/CULWp1W6lRkshhT4KbSlF7LmHnKikDOMvl+9ihKvI8NEYIVPJ3fxVT35mB21yNJaV1yvXaO0HpsnWklSCJwRrEB730WplnM3DmRuGJRBM/qrBoaOLyFA55Ozwyhfk0EbxNakOkTeBZ9taqwfbwgo58LDS8gkx5J0WE5QhCqtVzdXb44ESLiDxJWkuTsD28fsaGkaTakEaK9GPNVG8JBlehLENA15/f8ABhOXiNGh1KhDD5cJBUdK4vN9A3K5QY128nTYbzJ6d1fVZosc0siKfZ84q6Kz03g+ILglxVjI1AvZteDYyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4ANnrHWqmcS25zfU+GHCOcmgk66m8OoHfr5w1RY3su8=;
 b=XwWaPzJUvXMzYM0jNCNSTsV5G72m1rd7JU/sF/olzQvz+8qXflxic8X4RbqwqASMX76+19zw32bEacGmfjamXv/rFtrcMWHcHY65WCsvREd2TqmqNE3r/DTpsCpdg2buQqXP63pIjW8KX0ZpXND5oLagu6p8aA1dWgznc2j6Ay0Hd+iv+od8LM/n/mb4/GdXQ7GReHj2o1CpUSz3kQXijJOGYZADYsEkQT6TCkj5yTBzHeq7lMdg/ExJPL8RRAxWJR6rU4sDUKGiYKcBxQBa2qOuiTJAtbCEfho8nNd/AjTAGYrbbAPyWRMkatbN07kpyk+d0SZA/3u78Gi/joj/0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CY5PR11MB6163.namprd11.prod.outlook.com (2603:10b6:930:28::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.28; Sat, 22 Jul
 2023 01:41:55 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::3294:2cf2:e022:7164]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::3294:2cf2:e022:7164%7]) with mapi id 15.20.6609.026; Sat, 22 Jul 2023
 01:41:54 +0000
Date: Fri, 21 Jul 2023 18:41:45 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Nirmoy Das <nirmoy.das@linux.intel.com>
Message-ID: <7zktdn6feu77txpzkdtmzgnhr7alnawgclkhaneeui5t4xfbiw@vqaqeovmrgg7>
References: <20230721140745.16187-1-nirmoy.das@intel.com>
 <4etyiovcv7ds5k5zizgy7hlhavkmbkaw3ld4qtkzljoj3ceffe@it5n22pfuoeq>
 <6e04ba7a-1015-1f0b-4b6e-c04ed5f24a76@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6e04ba7a-1015-1f0b-4b6e-c04ed5f24a76@linux.intel.com>
X-ClientProxiedBy: SJ0PR13CA0167.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::22) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CY5PR11MB6163:EE_
X-MS-Office365-Filtering-Correlation-Id: 690d27d9-de19-484a-720f-08db8a54d3ec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sYlUV5Nil86J7i8cugZ+u7pWzXD8edaKtw10e7e9Cazk4VRhWhkpghtGzyJO9mostFucJE0ijZwo/PhVqRQIqspWDIWLT7ArJxBp4RD0fhlbhHLij7YmfWauJRMJaZ0b0APSa8yjdX61HqNOTvO1YXdIKHacObUqzKrCUVWT9zML6chrb7RbnwCYu+aTPTQZUmnlbyaFL5MMGINyeKb14FKXLGlYmBESVGa+/9Nyy+C2JkSsjCsnK8m+fj5U3nx7OanHk3X2o8fj3NWpEUZjFo8sQB7I1HE85ghk9OTM+V1w8EZEQqPGaiDpT3jQgWMO/Hc91jD4WNF6ECvRLhgBk1Rjk0bguA5yB34g62PpBAuiSQKRO6ab+2d1HVSdly3uLj4it7BZmu1Zr6x/d4HRmuzU/VrHJ9kF6ktyzWzRquhujk/LuTEizK8Y79iGtefyapIS4IlrDnXloq2P2VzI3BnngR6myw+o+PfKiZHGS3mFz6owAshV5fCtyxT9MKNHjCWRgPaAI0NLYbXV68Z2LmF/pit0HJJE2FGeiaw2n4JmQa3w9KoLerkNxLDaNK+4
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(39860400002)(396003)(136003)(346002)(366004)(376002)(451199021)(6512007)(9686003)(82960400001)(38100700002)(6506007)(186003)(26005)(8936002)(2906002)(8676002)(5660300002)(6666004)(478600001)(4326008)(6486002)(41300700001)(86362001)(316002)(66476007)(6916009)(66946007)(66556008)(33716001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?KNqlqNfSSJWbsLDXZ966glKO9XU9agkjHTDDKeU1yrX60ARpTWYEZURJjP?=
 =?iso-8859-1?Q?tWvR2LyPJvhZccM0YPKUbkeguVc1jQ3Se9BHv1aRNFdIsYIO35+DGJkZ25?=
 =?iso-8859-1?Q?u5pVAqk/PHiyBCQtAN7xQ/u0SSd8cn8be2YGdrGHAVnzjdH13hmCvwiOZh?=
 =?iso-8859-1?Q?t8zeLe5eWulzIjma8044Hv3yk4kJalMAqUXwSN1fEfYVgLYOZtmIKHfJGO?=
 =?iso-8859-1?Q?rPgS+A5Ih5KzqaQ9nL07ZLv1+94thgnm8j20Hc2voTQ7BCA9ciVl3XMPlH?=
 =?iso-8859-1?Q?SiIoakSf2M7urwniEmz2qstN1pc7FeoqA/eYKXULMqeebfskIHVD/30yGn?=
 =?iso-8859-1?Q?wDENWzAu+E/0kB3c13Xh2C04bSpVMlx+kzWcA13xXCsDpRZwP+d/NzYqQj?=
 =?iso-8859-1?Q?8DkrFB7YixvEtVK9RTr5l8md51VlZylQZFAgdWwQS3NfHh+4CqHYJZScI2?=
 =?iso-8859-1?Q?6OXhpA/nFyT5E/oXfZdQQNzFynGt77AT/2zddBPS/MQP1s38rgFV2gN9PO?=
 =?iso-8859-1?Q?qqocRwE+eXqCKoE6ZHAs4J89rSTg1VEXOrHdTm0Tou4T05oY/tt5XrAUNB?=
 =?iso-8859-1?Q?4ka9RaQKQTYuQce6YBQLKgxCRqm5fLsZCen8t/h49diXHnMlKPWcOFKSfs?=
 =?iso-8859-1?Q?CdnyBhrm3CHp4C3sOwpKc1uVMMZH38J16SPVlS6lB1LMWkjj+aW30ZCVhQ?=
 =?iso-8859-1?Q?dc1z2LsIaSjhRKsMSu2nrOqCimNvfrB2SR6mUnfEKqF0ovLPffvslWJyX2?=
 =?iso-8859-1?Q?RqsKW8uBqy1XfmlfFWW3HCUwVjDLJcQbXLIIPCd+knzvP2X3C+WXSsRpOQ?=
 =?iso-8859-1?Q?5aPWhGGbVpFv/h2IG4IbJ3jlfxfaeHY7NWF1et9WVJGbQQQOqdV26NyLt4?=
 =?iso-8859-1?Q?e3LeNn8qbVVLoUniI1pWSWyk6QH53MTqAc7KhTkyj73Y+MQlCvPRdSoPkp?=
 =?iso-8859-1?Q?YdLbTeUyOQeXtgYDYvaf9krIokvDki2zz5rqyhGrhoReNJLtKVWa5YSl7o?=
 =?iso-8859-1?Q?/8x+d0VEMHRH/rDgxRSQEBoJ5/S4632jmqyRt7E1vKlPhO0R8WzETKnP0k?=
 =?iso-8859-1?Q?of19H1hsO9WT4Hp1fDUhLRcOUS4hAaEcoH5/p/nIEAFSd65Dk9eo2wXpaF?=
 =?iso-8859-1?Q?g7g3/mUbYjO/pJQQkUXk+8FdgMOput+oCAPfa+hIfxX8cHjFY9tFKV+c8G?=
 =?iso-8859-1?Q?yVapOgZ4hM0fM0AzsUhed2LuQsCEekPQxtJ/TNVlpExgp4N5naRpwZSsmv?=
 =?iso-8859-1?Q?/e/zGHALLn0cLz83AxL5CyOLcUonv4/t4Mpgj0nFTfvBmqQ0WHc5ke5Dpa?=
 =?iso-8859-1?Q?SPbKtIDZ0y3gQmfyWVPzziP+ZfHvsl3qaEEyX6907Oz5yMqjGPmX213aBq?=
 =?iso-8859-1?Q?Qzkt8mVtrHOfXJiqdmJ4XaSrWDX159Ki9mW/tjbxWfePKYoJdLuQ0IW+6r?=
 =?iso-8859-1?Q?P001FAlqAMVFnu3f0qMJVAsBc9NUIjNAm7rLJRw7Ir76B1ntNf6BP5CkI5?=
 =?iso-8859-1?Q?gQjCOzfmxVaPQyY9tTXJaPr8IaZ1rz3A7kTJ5ok5XuEptjIOpZaS7ixgd6?=
 =?iso-8859-1?Q?QEdg5zl5WaS39fCbkczSg/FU8uD00dXjxLtpmvDQWQALP+jHkFtwJJf1vo?=
 =?iso-8859-1?Q?StcrlwHcEV7F1YSsNMDy9fv0fp6+jAxv095IGav6e2v8WriciTu+oUQw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 690d27d9-de19-484a-720f-08db8a54d3ec
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2023 01:41:54.4262 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qRkfOcPeZ+KMjWk5u+dB4yRsVImBlfSk2L2ym36HLvwb8+HxNxxlsY8Gzdu+GC7bbLq+mdamEna90hcJ8xtkU0vINZYyNJ5Beyof7lZsOv8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6163
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 1/2] drm/xe: Set AE PTE bit if enabled on smem
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
Cc: joonas.lahtinen@intel.com, intel-xe@lists.freedesktop.org,
 Nirmoy Das <nirmoy.das@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Fri, Jul 21, 2023 at 06:41:57PM +0200, Nirmoy Das wrote:
>Hi Lucas,
>
>On 7/21/2023 6:14 PM, Lucas De Marchi wrote:
>>On Fri, Jul 21, 2023 at 04:07:44PM +0200, Nirmoy Das wrote:
>>>Set AE PTE bit on smem if the platform is supported and
>>>enabled device scoped atomics on system memory by a
>>>user with madvise ioctl.
>>>
>>>Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
>>>---
>>>drivers/gpu/drm/xe/xe_pt.c | 4 ++++
>>>1 file changed, 4 insertions(+)
>>>
>>>diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
>>>index 457f1363ec67..d43c91cf4776 100644
>>>--- a/drivers/gpu/drm/xe/xe_pt.c
>>>+++ b/drivers/gpu/drm/xe/xe_pt.c
>>>@@ -774,6 +774,10 @@ xe_pt_stage_bind(struct xe_tile *tile, struct 
>>>xe_vma *vma,
>>>        xe_walk.dma_offset = vram_region_gpu_offset(bo->ttm.resource);
>>>        xe_walk.cache = XE_CACHE_WB;
>>>    } else {
>>>+        if (tile_to_xe(tile)->info.platform != XE_PVC &&
>>
>>why the platform check?
>
>
>PVC doesn't support atomics on smem. Should I move the check in the 
>madvise ioctl instead ?

yes, I think so. See below

>
>Regards,
>
>Nirmoy
>
>>
>>Lucas De Marchi
>>
>>>+            (vma && vma->gpuva.flags & XE_VMA_ATOMIC_PTE_BIT))

this check should suffice without adding each and every platform
throughout the code. When we can't do a generic check, then we should
add helper functions like has_xyz() to abstract what we are checking.

Lucas De Marchi

>>>+            xe_walk.default_pte |= XE_USM_PPGTT_PTE_AE;
>>>+
>>>        if (!xe_vma_has_no_bo(vma) && bo->flags & XE_BO_SCANOUT_BIT)
>>>            xe_walk.cache = XE_CACHE_WT;
>>>        else
>>>-- 
>>>2.39.0
>>>
