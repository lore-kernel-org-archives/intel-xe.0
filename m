Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE35AC64EC7
	for <intel-xe@archiver.kernel.org>; Wed, 22 Feb 2023 23:35:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B30D10E458;
	Wed, 22 Feb 2023 23:35:47 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76DAB10E416
 for <intel-xe@lists.freedesktop.org>; Wed, 22 Feb 2023 23:35:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677108945; x=1708644945;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=/uc5H41UWjPS6mKpcCqTG4BFkENk1dBlj0uyJvjjkLY=;
 b=n4cLxU7VUY4dCCRt1zcsTKlqRVHUrL7SUs35uipYy6g7877RmoHtC7Px
 9opNJF4mpUFPnF4z+6I3V+6v1NDFG+2Dw4qVjIAP/dEbgKi8HPUvkn9dz
 bMdgYB6mlrj+QMXoNfaCjsxoUQJzUatOtxu4Er620m6yWrJs7lVK2h6CU
 i1mJP9xATJbSdX0qA3viqG6LEclKlbLMyklWgOoKTnVnw9XsCDdNv6rgI
 J9x+QAlrXVhKHO2iDlDA4A592uA2ddB1zynpwOhbJSZZH+5kQ0mDsOFKK
 L6dycX1vx/pl8wG6tJWEZK26igqLacoUhelYYtoxuqTQl7t3A3BY8PWcu w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10629"; a="316793406"
X-IronPort-AV: E=Sophos;i="5.97,319,1669104000"; d="scan'208";a="316793406"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2023 15:35:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10629"; a="1001183637"
X-IronPort-AV: E=Sophos;i="5.97,319,1669104000"; d="scan'208";a="1001183637"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga005.fm.intel.com with ESMTP; 22 Feb 2023 15:35:36 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Wed, 22 Feb 2023 15:35:36 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Wed, 22 Feb 2023 15:35:35 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Wed, 22 Feb 2023 15:35:35 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.177)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Wed, 22 Feb 2023 15:35:35 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AO2iS9eE7seV6/LO+AtxqORcxfmqaxHDgNBqvQ/C7gO5Vbo74sQ0Zq13fy7Uy/y8y7sKf1FfokqNhefC4n53MTjrtMAM+2QuOxhWpOOY07Lji/5qeEZKij44JiBYlxwbDKSuBen6GZWIyY06GAaXiJdGEJL1VEQpLQftaLkJv2sKgLr+yXCFRb8ZXjZ3vRyAplyqSKhcwGYPpO70znC4F8O/893uowSRv9Xicriw3X5qYnCmoPBXp3eyeqBu61wOX0EDYGvrukXrfPhjMyVfSEb46wtvOOwAgP/uDZHYFBQ7BWiT9L8V6GbAAwhfeAFN6eDDj+9bJi4K1c98u4pKjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QoGGQ+sn7xvUVKvr5LDnDstfVeprVJAVeM3Bz9bciSs=;
 b=Ktc7fuN1UtefMzrzRAIpdxtfAmGnw3HHPTu2QRyguTKo+VvaOp2czTq5+Eowxct9aGbwc2dGqgtdvPkcgf6YJxBnEnolqpbljOdNyszuaTxl1slvcsqlLffcXNOSDSp5XI5lNBMTgR2RfS9apoMdKK/fjrIlZRRlJId76exo3MawaXBPUqAAVFeVfIMc40SVCDmR5/hWyIhQPidfu4prX5uj+rGhKFkDh8MiPJmiAczb2yuj40hKHzGysJ+2h0FMzgBs2LX+3u40Ec+sSx/urhnwLFoIZwk6wbX+/pviAF9fSGF9JodGBIkOmOO8NLwDfnHLBi0FvZr+gAYS+lyp2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DM4PR11MB5311.namprd11.prod.outlook.com (2603:10b6:5:392::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.21; Wed, 22 Feb
 2023 23:35:34 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7bcc:b9b8:78df:1bd8]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7bcc:b9b8:78df:1bd8%6]) with mapi id 15.20.6134.019; Wed, 22 Feb 2023
 23:35:34 +0000
Date: Wed, 22 Feb 2023 15:35:31 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Message-ID: <20230222233531.usg5oknqev5hv3pl@ldmartin-desk2.jf.intel.com>
X-Patchwork-Hint: comment
References: <20230216231724.2246534-1-matthew.d.roper@intel.com>
 <20230216231724.2246534-3-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230216231724.2246534-3-matthew.d.roper@intel.com>
X-ClientProxiedBy: MW4P223CA0018.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:303:80::23) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DM4PR11MB5311:EE_
X-MS-Office365-Filtering-Correlation-Id: 98a25a80-df66-42a4-f96b-08db152d7e56
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yUQ3gkVr1gc4p8rhhT00GB4PRCdgam8ED2T1oKv3Lnvy3Baoz/+8V8g6UvHHNP9wLx3uZPv+OGeF6hVG+h1gEGVkhRZ8MUd5pz4nyBSJDMKtWinw8wUEx2n5kdtH1g66PClCCrbFGRvhCtOL95YbI4A39jyow1nZ8G5Mzwdddm2XLaY7e2EDlUqy8XafRQSwH8f9DafOR7PBZjJir0kwz36WY9ZyJi4X49sYeVhFV/OrTM/jThnBUIldFh9TEJnvMxAaZQd9Ik1Ro/08TV8nEgMT9dn6JSZnvpsWvCojrYPVRZy6hC5/p8ZsJpm3dPyLzOOND82Ig9VyuH/psEQW4d6oxNBfZvGf31zAs0W1ECa/pCKrXkOtRxkNhV4tFCeavURfb/Uk/wBRtGqkjVPWVoFtCN7a8/G/kN0Igqw99wNaLTjpRGHNshFM0/AsNGXxrjuDdwylxEDkmvnb8nUGx1Mu/BXuQG8/sPD1kG1pHdTt+lBOreyhyRJm3YLe6e5ornvlJLZOmmoCEuAI8zVOy1JGd723ui3ESGQTA/0+gb0J7ppnlpa6E3Sx8XO+JSSl7p+hhePkfUXOEjNrMMEa7LRZw5FqrMxaOUtNthOpU5ze3WqKQCUXsgYVDr2Ruzp0H/wVw34VFD5hMy9u86iMlw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(396003)(376002)(366004)(136003)(39860400002)(346002)(451199018)(38100700002)(82960400001)(8936002)(86362001)(2906002)(4744005)(41300700001)(6862004)(5660300002)(26005)(186003)(316002)(6512007)(6666004)(1076003)(6506007)(4326008)(66946007)(66556008)(6486002)(6636002)(66476007)(478600001)(8676002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?91YpJKQwYq2FtIyPVuhuJdVuZrQWG7GOBlMh/HqdiH76fQ+jnCPU5zF//m/o?=
 =?us-ascii?Q?s52Mu57pl7ztMvBIM9x4xpJDJgjREdsXHq/G06DffTb3VQjBpb/8zG3bZpzs?=
 =?us-ascii?Q?DBPhTAsrzbvr3Uj1J/WamVM0hYD+WOIrnG5DbKrZ28ZwrzksU2Ko9n+DZkaE?=
 =?us-ascii?Q?OH5yirgXR2MXf/zhSxIJc3yWOanCxAFQkQe7dY+KGuE+2gfcoAWOIfT1/jJ6?=
 =?us-ascii?Q?1jTDadCwWcQM0eIXzQBsSYXDPW7Okre/X5A8VGRtLosmqDKckSbqiRRujEh3?=
 =?us-ascii?Q?4JxHvUmidB5DGMEi/SR5RbSmRzdBBK+u/6BIiJleJvvhxc7cxWmX6fKRgaMu?=
 =?us-ascii?Q?OoXUGv7ky3FXbg+XpnOC8YsefF2ra+9Tydj81G57WUStT43CwJQ/AQyExVS0?=
 =?us-ascii?Q?etVN2QqrlYIrwQi2F7/Qhv5qN/bquz4zdBvWFTnQe4LR2gzFwKBZsvpxw78N?=
 =?us-ascii?Q?Binh/egaYOY4JleYYKZN7z6XN+UhYDnMT7XpfjzCS/6D5uzxKGc80brbsXNM?=
 =?us-ascii?Q?wy9TyKaDdac9CdZH02l9F0PqCBBNEeb33kh645k9NFVOrGIJqmo0Hbjml1E9?=
 =?us-ascii?Q?6TG6fN9tiJIrFJRYp/JG4gfFT2rHHMtgERYTUftMVA2eXrYuv3FCCE/J2hVV?=
 =?us-ascii?Q?HavAX+wJIgjOACWh86bULKc+Q02VrGUNqswRt95kj/4g+SqSXinpmrvpxKr5?=
 =?us-ascii?Q?H8gOQh8Vi1GSXtmBe/OIsXlcPYYRIu0u3ZQsU8ETGXNJuj+NJM2FDHmsHay9?=
 =?us-ascii?Q?wkLLop02MORrZL3DQUDGEViYrW4qlCsc6sHaCgpz1TPwo28sSYKCrfX4BCxB?=
 =?us-ascii?Q?3AdP+LLnL/2aA9F58nWgrH5XdfsyG56xIZV9L4tVSmT5d0R9Kohhg36MPFSv?=
 =?us-ascii?Q?OrhEwGvfD3qok8H3e06O9KlfSyFtx+D2rK+OulILwz1s0ApFTHeq1fUAv1Vc?=
 =?us-ascii?Q?lqJiDxivVTOBZ6FHC7vAUXcM85YNECUes64Cex+LdresKqx8tCfvpaVmNdnZ?=
 =?us-ascii?Q?OyxTmN7R437Qht1w79a6Hco7z+B2nZsCeNO9Yx6QK6AjMOzi2b9q5Bn/vVwJ?=
 =?us-ascii?Q?XDliurUb02948yTGyPHkBbD4Q8hkhH3Iv5P5VcO8R7ZHXWioM2YgJvrNOINO?=
 =?us-ascii?Q?G4o9zWawhE1mCM+OxG0WqCtlk0H4Zix2n7dtwMM2dAqYocZr+7NDa3HTsVoQ?=
 =?us-ascii?Q?oFyc7g0D83amudwvYeODaDzJuH7idBHXoG90TYuoH8/h5YWaIG5DLmhBQPGF?=
 =?us-ascii?Q?VygbIbpMFXmltYaNSipMa45mkJnLdibu+Q9rHWsyTFsdvyaO4yLj2kPZJjMC?=
 =?us-ascii?Q?6YvF1SV8OoegRZMeo1Se+Z3WkBD+CB43Ue/uRKupSyOaOUn6Zc0h/J2xZYzB?=
 =?us-ascii?Q?6noakIbafCkxgS1YxM6VeXv3F/U9T97ajj4Yjw415tnNzS4hIZc547QXOWFl?=
 =?us-ascii?Q?sDKqUwTedjL4A0qWSj7sCnrRy23fClhIKnxLlcllG2n3mmIPIdRAeWl9/vWH?=
 =?us-ascii?Q?mASdhaRyiJjkxi/5wYnHH742kHTuhfzkuzE5zQ75MBXr3upc8NwdX2XVKr8w?=
 =?us-ascii?Q?02A+jIbkQxAaYdFikbeQEHQmxgfEKpRAw2tjLk6hBA0QUkLrkTnMcKO+QBc7?=
 =?us-ascii?Q?6w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 98a25a80-df66-42a4-f96b-08db152d7e56
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2023 23:35:34.2263 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hD2D6Jh0rF8u+Ayjn4yu5h4vjJoo5ZzpL10oA+Mm2smI6v9ro+Q6hOQUXldrmd1K59ipNi8RlbarkHUYLUmfKUtk1GuPpXZwEOOjVbn85+w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5311
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 2/6] drm/xe/mocs: Add missing RKL handling
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

On Thu, Feb 16, 2023 at 03:17:20PM -0800, Matt Roper wrote:
>RKL should use the same "gen12" MOCS handling as TGL/ADL-S/ADL-P.
>
>Bspec: 45101
>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>


Lucas De Marchi

>---
> drivers/gpu/drm/xe/xe_mocs.c | 1 +
> 1 file changed, 1 insertion(+)
>
>diff --git a/drivers/gpu/drm/xe/xe_mocs.c b/drivers/gpu/drm/xe/xe_mocs.c
>index 09adb69d1545..ec89ff3ac29b 100644
>--- a/drivers/gpu/drm/xe/xe_mocs.c
>+++ b/drivers/gpu/drm/xe/xe_mocs.c
>@@ -381,6 +381,7 @@ static unsigned int get_mocs_settings(struct xe_device *xe,
> 		info->unused_entries_index = 5;
> 		break;
> 	case XE_TIGERLAKE:
>+	case XE_ROCKETLAKE:
> 	case XE_ALDERLAKE_S:
> 	case XE_ALDERLAKE_P:
> 		info->size  = ARRAY_SIZE(gen12_mocs_desc);
>-- 
>2.39.1
>
