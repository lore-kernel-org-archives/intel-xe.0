Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65829EB64DD
	for <intel-xe@archiver.kernel.org>; Sat,  5 Aug 2023 06:46:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E536D10E15C;
	Sat,  5 Aug 2023 06:46:48 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1638D10E15C
 for <intel-xe@lists.freedesktop.org>; Sat,  5 Aug 2023 06:46:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691218006; x=1722754006;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=I9my8wVPnGTZ7fd0gKdXBEyJ4vmeScQQ3cGOqvLpPMA=;
 b=O7Bm6GhwFH+8V0WIUaEtagK9/jG/WXyxgJJAoXjgt/xPgYWut6jQR9e4
 VTTfXh43HvOAKW6gnMgRSS8xMbJTc7utZBs8Mf9Aa1rVcr5H316XO3Rhh
 l0SRE5upMKDaInj01ousZukMabRHjyEHaoHR1EpvlWqcogRaCuo4S+dmf
 Z+dAr3GbC8TLA8IEr5E7QEAjNQAMRIkDZIRQouobswwu9eT1qCbDpdgJz
 2050yjTmNy/qERGTZljcTm/Hkbt0si3TJ4gafzBX0HgCpqkcU5aMUJs+F
 jLPDrgR38/0KpPJ8tXRRUZt7ZO4ifBBLu8jCVbcjBCTL3D4KC6PqiykEK A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10792"; a="369192861"
X-IronPort-AV: E=Sophos;i="6.01,257,1684825200"; d="scan'208";a="369192861"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2023 23:46:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10792"; a="765383882"
X-IronPort-AV: E=Sophos;i="6.01,257,1684825200"; d="scan'208";a="765383882"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga001.jf.intel.com with ESMTP; 04 Aug 2023 23:46:44 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 4 Aug 2023 23:46:44 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Fri, 4 Aug 2023 23:46:44 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.45) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Fri, 4 Aug 2023 23:46:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mskV5G7mb2tc8CQjibY9kfnNdBPvO2ic6PEq9Jfs9tELZBCa1pIaCmibREAIg6WLtNf5wAfKNUaLbVsjBk6KKTGeFElHwmh17x5qdw2dPDThK+NiGvDXq1ar45aU9c3JAKL8BBLiNuqgeCd1UkT9OWxB4RnPTFM2YOze3RHwiDKIY3CamljPCemsF0Db8qhjtdF+bm0potSwtygFyxEbzCvyMNEAT6QKit8uAp/+g8D77lojBNBkwNXqJwYHynmrkoYVNoebutAkOWnEWGStzar4ntYB/XLtWPQr+0j9mmh5sNskJi1536r6sXkL1U2afjL3Xm0pDAPwgcnEPTrMhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s96e6cXOQ+Nsg+jgnDw3kihN+RmL0syPkOQS6nEQNPk=;
 b=IHErbb29HHlMVwaICxoqB3RpemSrOCF+vZK2yupkcSixm9RGzZILTGqASF75XXs/RL7AjiC/dTz87ds4ZYW7ujhx/aEOicwbuKlDHkh8UGlCOw3os9N6a/ijUXi2mtrBBmJHExm7MIupqtNtIu/fOZqPmdTxVu0G/1zTGd5A2AZdoMyhLC8DKKJ4brjF7DEedi0FDV1Vkk04cLZlAuwSleUjE0Vl2SmP4HHqvVFC2fWMkytabHJl1XaMuvh99DzhFdVNTqt/Ici5sknGpF4dToHnfv1HIP9iN3JOOAS/x96kV/7NXzfcUmmBO5zGJAlCnrg+sHXSPcZUz+j23UK3sg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6952.namprd11.prod.outlook.com (2603:10b6:510:224::13)
 by PH7PR11MB6860.namprd11.prod.outlook.com (2603:10b6:510:200::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.20; Sat, 5 Aug
 2023 06:46:42 +0000
Received: from PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::ee81:9c69:6117:358c]) by PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::ee81:9c69:6117:358c%5]) with mapi id 15.20.6652.021; Sat, 5 Aug 2023
 06:46:42 +0000
Date: Fri, 4 Aug 2023 23:46:38 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Message-ID: <ZM3wTsyvH02TmIzl@nvishwa1-DESK>
References: <20230804213253.2381705-1-umesh.nerlige.ramappa@intel.com>
 <20230804213253.2381705-2-umesh.nerlige.ramappa@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230804213253.2381705-2-umesh.nerlige.ramappa@intel.com>
X-ClientProxiedBy: BYAPR05CA0101.namprd05.prod.outlook.com
 (2603:10b6:a03:e0::42) To PH8PR11MB6952.namprd11.prod.outlook.com
 (2603:10b6:510:224::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6952:EE_|PH7PR11MB6860:EE_
X-MS-Office365-Filtering-Correlation-Id: 55e4f3c7-607f-4c10-8e62-08db957fb991
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Y0DLnPTM/Z/Y5qJqw7H+DzHL43cyLI39cKaBMmjyLQyZeyAAmdQqUupVlKV/pnL/zQ00ZVyS3MTXgfUUwu0Ke22hxWnM6esQctSJB6lBraWna4ENCW7TNFB2yizdx8AxEbwcNMbhMHB7DAfAotbhg7J74ICEpO5QxFsbA5u+P4MY+v8PqTTZ44UAtC8ov95iY7iXnhUHAp2o8RAx8pGWz0aOBckpGskGJMwHoZzeTyJ86MCetwLCkV96VuHYAmgamUMf4l6NiuXbGTvePcyndE+CZWmnCXWw9OPB9Iqo6KW2YRnlNdls23buvgNbXihRoQDguNFBuSkkkrbOBJN1nuIbRBATIyBVitbbkUm87hnYau3clwZSgONh4zDUq2jN5wPODyxai5xzY8HMQ2KyFjcEig5lPn7gO5Own0vXkSsERJgL/oPt7fglMWwHBZUkV6CCQVPyDq8a9j0Ai1JRCkLTVHpqSuAY3SG65/wjoR55oZtGVxqaZBvGkDbl0+gThzSJ+XhxV5xPsyQ76vQQrCw2yd/52O81gWPNE+ROpOtSvUEe4JuolMaRbf/YEPiQ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6952.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(396003)(136003)(346002)(39860400002)(376002)(366004)(186006)(1800799003)(451199021)(6666004)(6486002)(6512007)(9686003)(66946007)(4326008)(38100700002)(82960400001)(66476007)(66556008)(5660300002)(41300700001)(316002)(478600001)(83380400001)(6506007)(26005)(33716001)(8936002)(6862004)(2906002)(86362001)(8676002)(44832011)(6636002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?pl/Cjb3TF/SW31y8JpSaClrrRc0WnuUbraZb+TcA/AitCUsmMApO6hwF082d?=
 =?us-ascii?Q?HvWiXfgbRZjUtNLx1CXtXRMUHtOpy6VnzOTffhqohubSuvtl49T5U3JzqJQW?=
 =?us-ascii?Q?ql+sW8a5EhX8XciO356jcRVLKU/XIuD3SEB3kOQfzXlc7nhnCaGbMITqXTht?=
 =?us-ascii?Q?ksL/awcpNh3qVyLHVGE9hgW4NmMbsnMPQ0dL/TotMdY0Bjv5rQOkGwpx9GUq?=
 =?us-ascii?Q?gG9tBihWyPBD4JDZghLSFiLMnPYaSbrwDSsF0U4H0MZGc5yf+bVbKCHZV44u?=
 =?us-ascii?Q?TP9uqq6Vjc7McxBLPuTJD5P/e2p/A+EVvSFXsrowqwn+vIcA9Y106CWDeHNX?=
 =?us-ascii?Q?URsSt95y+k/vI3kzuBIKSaKxzZ0d2B/r/RyAGYmi9CXR0hFDhpmuoVcbdY3W?=
 =?us-ascii?Q?QI28+woZ+yiQvXFWFFVXfBGmV9/ko91D6u9CyKWW++orsOWTnbKby+RDi8IX?=
 =?us-ascii?Q?9dpAjui/ZQdWkPbcW8mcI4Hmra3LLU7WKK8uCzkr1E34VB8fc/J5aLHBh+00?=
 =?us-ascii?Q?4MKbLGd6jpzemKee50e27DULydmWi2xBF+cAgg7mvoUmPdTmXLI4hVJ/h2zl?=
 =?us-ascii?Q?UWfHW7wvkz/34rKgkSyFFwwpqeHk71TVgfBHIFbn6KhN4rxHdPL7NpQ12MF+?=
 =?us-ascii?Q?F0MIDrvXTNHnRrg00J3ByM8nS7D2yA9fDqZx9z1CUSEoTHdGK6qIbl0Dxu4D?=
 =?us-ascii?Q?aalja995Ysr0mtm0dgFsvg/LcLB8VCPfHYZJP5uRAZqM+iggV+QfiraxQXxN?=
 =?us-ascii?Q?f/M/Av4FS1OrorTA10Rrk9dS73KPQKjNHEYRvOYDqFAZU1fufpct/4u168lH?=
 =?us-ascii?Q?q11A74RUlugEtq4ozChNux6sPKj7ww5i3+JByWC28YE90Uv+SYU3UFUlNd3H?=
 =?us-ascii?Q?9ooa5EiRKv4TeD/oA6tIgZurS5IElEwCS1lnCR2aa/8XOsd1hoH09EfUQOj9?=
 =?us-ascii?Q?OG3lP/eLdSnfAhKlKrdiHuDxppuCmiCLGt9uX7H+lE2nwjb5sv/fU1TNBCZN?=
 =?us-ascii?Q?lQjpe5CYrm9G2nApPhd/KTbQTkSdq4gk4h65oyKzDVFI6a3f5/CTMo+4IMMj?=
 =?us-ascii?Q?g3Jztx16a3Hp9lzOdYmJy+LT9aHFfbL9xVYgwcBiLyApmxbt9MkrNkd6h0Vh?=
 =?us-ascii?Q?mvddGBxquYIxmxibd8nFz86Oj2VGFpcRPPGlwO6MiAbopA2y9IfZWlE6/0yZ?=
 =?us-ascii?Q?shetJ+MHfAdnlKh43anuP29/CC7BM62d9OH1BDxID5PmvJ5Uz5qLlO6kNSl9?=
 =?us-ascii?Q?67SPqLsuAXsUAGoRyNaQQDC/X0FT5bSL4BNxJhfkdHhL+4JjXuAKVMcGlXg8?=
 =?us-ascii?Q?RGUKeSeQmqbS3TRlKawJKyMFUDiAMW+4ylaKUFV1yM/Zcxf2Az39G4FJ3RnH?=
 =?us-ascii?Q?+eigh2Es1LRjBjHsx6EbeQJoipGwJjFMouyvun93FytvevZgZjcDA0o7EIjZ?=
 =?us-ascii?Q?svjSB6FVIwsIkypLQeIiDUw5mKr7zwNwHmOFa4VnjrdKC1lJ6RO0QbFoJNy1?=
 =?us-ascii?Q?JIqlsb6ZYneRzdYqBBoIs5o+a397PzwwB0l/yXRfAVMKhUctG1A/XaeqkFAi?=
 =?us-ascii?Q?8xsHBlQgkgJ6UrzDqIHEKhPysKXQubUnKBFEeL/RXkDqXhtzcVIkUgKP/zIK?=
 =?us-ascii?Q?hlQUyh03u/n1jDtnhp676hA=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 55e4f3c7-607f-4c10-8e62-08db957fb991
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6952.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2023 06:46:41.5423 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g6KNhFD2XVLCb9cPMg11ni5sxIXWkL59DlWbnK3Pa+WcRXQsBCfKR5ogU8vpcKKGZQJOZ7qSj00RiYTYYA0SNh9WZPEaVsfE/PGGiZauT06Y4gM6VewSdBm+qpF/+JFz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6860
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 1/3] drm/xe: Fix array bounds check for
 queries
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
Cc: Lionel G Landwerlin <lionel.g.landwerlin@linux.intel.com>,
 intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Fri, Aug 04, 2023 at 02:32:51PM -0700, Umesh Nerlige Ramappa wrote:
>Queries are 0-indexed, so a query with value N is invalid if the
>ARRAY_SIZE is N. Modify the check to account for that.
>
>Fixes: 22504d560287 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
>Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

Probably we need 'fixup!' commit tag here instead of 'Fixes' as this patch
can update the original patch.

Reviewed-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>

>---
> drivers/gpu/drm/xe/xe_query.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
>index 7ea235c71385..297e93a0eb8c 100644
>--- a/drivers/gpu/drm/xe/xe_query.c
>+++ b/drivers/gpu/drm/xe/xe_query.c
>@@ -385,7 +385,7 @@ int xe_query_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
> 	    XE_IOCTL_DBG(xe, query->reserved[0] || query->reserved[1]))
> 		return -EINVAL;
>
>-	if (XE_IOCTL_DBG(xe, query->query > ARRAY_SIZE(xe_query_funcs)))
>+	if (XE_IOCTL_DBG(xe, query->query >= ARRAY_SIZE(xe_query_funcs)))
> 		return -EINVAL;
>
> 	idx = array_index_nospec(query->query, ARRAY_SIZE(xe_query_funcs));
>-- 
>2.38.1
>
