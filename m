Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 194C0C77B7C
	for <intel-xe@archiver.kernel.org>; Wed, 24 May 2023 16:27:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E327510E68B;
	Wed, 24 May 2023 16:27:18 +0000 (UTC)
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5666D10E4DD
 for <intel-xe@lists.freedesktop.org>; Wed, 24 May 2023 16:27:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684945636; x=1716481636;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=RCibMxS4v23rrojwcALxei6ZYZrU5rzMUSnwj3NU+qI=;
 b=Srzf8lKxXshHNIF+yIPi0RrVknzHJF2TbViwHwf/W3upTg/Ho9S8LaeX
 twFKEr2vzD9xpI8/KB1Zrk7mJ86LcWD0TuqEfr3X0jpjDgcuqYcwhlYTQ
 kNxIz4jA63ed0jcSsipwu1sPFsgOLiBJvRlHvcnpCPlw4/QVI8gtUYOzt
 p4uPrVcl4OILcOEBYfvsPlLTgBqB9uVLHCdDGB2WOBXvSzFcfMB+w/Kd8
 NoQrhXgM624xjzSCJSRVyZzeyeNhEya/E7sZ/q0WHfdEUa/1Wr94vs1n5
 F8IzzAR8Y0av0lUwgOausi7Pli5QWP0UorBhaNm7/Nc9E6WPVjwW1NMI1 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10720"; a="417079151"
X-IronPort-AV: E=Sophos;i="6.00,189,1681196400"; d="scan'208";a="417079151"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2023 09:27:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10720"; a="1034578459"
X-IronPort-AV: E=Sophos;i="6.00,189,1681196400"; d="scan'208";a="1034578459"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga005.fm.intel.com with ESMTP; 24 May 2023 09:27:14 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 24 May 2023 09:27:13 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Wed, 24 May 2023 09:27:13 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.172)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Wed, 24 May 2023 09:27:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MLAYMoskTklh3jnOBZyHfV84AVvSm4FRqneIyCguZC9xLuNAV18OjsPgZJ3APlBPCtxiI92+LzybaHxX/X1BuQvrVQjZpBBm0thmMidecpXjfWVGoDCCrrp5qRJUbA8hLCNiBSaMCTiPh/O15cOtB4mfsr6AUXhz5qknEp/0I4SeASx0ce10YpZ3ZN1LdCaF9m1iDJuTg6ePKH/O+92Ml5DQBiG+7VEOYJp57+mSVP6HcD1vTbfUpKcVTu7wKtpO210HY0egRTss842ZuU4WFRp5pZJmWzpCtiaFnmaHWDvTVop1ERKsQ/w6SDFe7z/naCov3S/QpRRBUsDqB3dzTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EZZq0Bu3aewlnogg0PjLQ2IdHxLgFCGNn1FdK22BYAc=;
 b=ee/+29wSiEoHvLWSHr6CwxEmjWODO8wcLz+G/ZTwBx0PsW2SMbn+/yAQiXebm+YPzjRQ96J0HoHGeFNi4zLOInsh35VpHfX/LfM5ym87fo736jXYx0WyD7V58piE6JQRhFktufGsMPDAPPLj+KJ2TcfbGtH/B8/Z8ZYciVF3/Ly7o2kuVMYc+O+Vc1TB0AQNCuZ5YO4pI6j4L9aB2ct44/dAGvGmParnMI4BZW9RJHzRrwS4gW9sMN47gZDg+amL4qJrkDdc6Y9PNWmQ3asXjCvCZeC5OYF8Q3zNvDTK3rXKJAI8l5sjlfQtGKLIyw8Aws5LOjEvaLD/W9+4hpuicg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6974.namprd11.prod.outlook.com (2603:10b6:510:225::16)
 by CO1PR11MB4900.namprd11.prod.outlook.com (2603:10b6:303:9e::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.29; Wed, 24 May
 2023 16:27:11 +0000
Received: from PH8PR11MB6974.namprd11.prod.outlook.com
 ([fe80::b4b1:f52b:901f:8c5d]) by PH8PR11MB6974.namprd11.prod.outlook.com
 ([fe80::b4b1:f52b:901f:8c5d%5]) with mapi id 15.20.6411.028; Wed, 24 May 2023
 16:27:10 +0000
Date: Wed, 24 May 2023 21:57:00 +0530
From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 <intel-xe@lists.freedesktop.org>
Message-ID: <ZG461NbVPLb7utFZ@bvivekan-mobl>
References: <20230524070641.1601255-1-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20230524070641.1601255-1-himal.prasad.ghimiray@intel.com>
X-ClientProxiedBy: PN3PR01CA0065.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:99::16) To PH8PR11MB6974.namprd11.prod.outlook.com
 (2603:10b6:510:225::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6974:EE_|CO1PR11MB4900:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c9c2c8a-f95f-4999-5927-08db5c73b95a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aCk0qWjsdds2SfV0LibXU6fvk2WfRnxtaeaL1aGJp+LPDEMQe0CmA9w3skIPoA+QQFIhugt3Rw3Pteg76hhsg1XK/nSr13h22wN0wv4WHNOti8s+chYBWH6MDzUCnDus0if22gRlLLenzc4l0OJZyP6uf+68Ub3wflqRxoeMQWT9X+g08CmhnCH/1qbqYIrJgZINzq7mXAMUgJ8d31w20fbOLXaStiITUFpQZ1RP9tuPJmle8yKPdGb7KgHkCi5FgylOIhV/WT28gzEJ4xDTPsgQiJ1LyGVqf2fhhuMSYzoqLVusmTxLKqv2jb7EaoEc9FdSI1lNYjAT2bZHqRd17jSdeQvSlDVzEb+L9iWYBuwMa5Es01WB+C1PWnl5W7SO9sKZPR32REsaZ01QusYNWPZZJW7+6h2aKRUYpA3QkzlEa++J9aiXFRgsKmeHg6TGLUIKHb3RjWOGSGK9reBrvOsowDf8OUZu6iqip1avMRYhmBkELtLusI3bxgpvMOFuUVTQb5xvW1FoYKjs9mekG3DRBXXwu2yA1GLPILAzJZNu41oR5jv/BjSwF0y8BaNz
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6974.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(366004)(346002)(376002)(39860400002)(396003)(136003)(451199021)(26005)(9686003)(6512007)(6506007)(107886003)(44832011)(83380400001)(186003)(53546011)(2906002)(4326008)(316002)(66476007)(66556008)(66946007)(6666004)(41300700001)(6486002)(38100700002)(478600001)(33716001)(82960400001)(8676002)(86362001)(8936002)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y2tiV2V6WU1pcGRMeWxZVll1TVU2UkxDTmJ2ZlhKTFMvV3dhdFZqYlhEdDV5?=
 =?utf-8?B?enR1aU51VFNBeGs3Y0luWkx5THhTdksrT21DbDNSN045d2Z2bXFhT1dTc2FY?=
 =?utf-8?B?N3R2b09sZW8vYjc2dkZLeTJjeGJydTBoQStucmFVRndPd2NDTENUTUxaTElI?=
 =?utf-8?B?Q0Fza3R3eXhxckUrMG43eS9MK2RQeEdOcW9QbkhaV0dUYjNYMDFsUUZPSjF4?=
 =?utf-8?B?SmxXNTNxWTN6bnY3aXMyZjJMRTVVbkl4T2hJVGZyazdxQXFwdXp6WFZiTWVC?=
 =?utf-8?B?akFUODh1czRMZnI5UnlhR3NMejdJQ2RObXp0TlpxM25SUE42NTVpVGFLclRS?=
 =?utf-8?B?dkJpaUZhRmVveC9tc20vSnhobVNnZXZhTGxyZzNOa1pXTWtWMTlrSUlsSk14?=
 =?utf-8?B?ZDVKalJqYWxiRng0YXNXdDRLd29pQzB6NHlrK29UNmxJU3cvZkF5aE1SUGdH?=
 =?utf-8?B?dGFhRll4S3FUVlA5cUh0Y1RvM1hEbHhaWkJqK0J1bkZzRVdBOWF4NDB5cXUw?=
 =?utf-8?B?Z09oMkhDZHJrU3VkdGd1UTh6cFNhSzFQZFF4UFFuNW9ZTVJsUlhCb2JMeWQ0?=
 =?utf-8?B?dURDcFhVOWJhNjR1NUlmLzJ0RWJoMzVmS1ZhM1NBaUlad0xPM1p5YjZPcncw?=
 =?utf-8?B?U2lhMzU0bWEzd0Y5Y2ZFdGdneFFtenE1RUwzTGZpWDJKMUtBcmkrMHJ6V0t6?=
 =?utf-8?B?QlVZUmJNVm1yc29tRnBvSlBWcmVNYURUZyt2cXFkMWNzbTRoNjJVLy9MdjQ2?=
 =?utf-8?B?SGxQOU5DU2c2MVBLNWEydlBPV0dHOGtKV1lWd0NzcDF2Slc0SjVacTA3ZzVs?=
 =?utf-8?B?YVI1OGdCMkp6cEVIbEN3RkhneEordVd5Tldqck9BVUZHSDFWKzdjQVE0eVNZ?=
 =?utf-8?B?U29iemIyOUhmWm9ZSG5GR2wxUEdxR2xxd0x1eEc2OHdtbGZwK1VTbW9hQzdP?=
 =?utf-8?B?SjJubUhaZ25tbVE1UURWRmFXUThML0JMTVNJdFI5aFlNY1NBb1pTeERYbmd0?=
 =?utf-8?B?TFpxUWIrZVUrUVEzNHI0VWNYUGlHRXNUUW1XN1FWMUI0VmIrVWxqTXppMXEy?=
 =?utf-8?B?dE9kTjVrczFHa24zSWhubkdrbE5OZkVQYU1lTk5kNS9VWUxwL0locGF6Tm96?=
 =?utf-8?B?YVRlbWJaUVZ3RFJyWjFjNW1nd0VPM2F1UGllTENwUHh2czEyTDlSNGhXNGpW?=
 =?utf-8?B?Q0JHYVhWdjZnQXBDc09WV0R5emN5UjI2UEVGRk92dnRXWVVYZTBPUFhHd1N4?=
 =?utf-8?B?VGRYTEtqd1cyVExoUEdSajVYQkUzV01scXhidXl0aGZvYStYb1pYU1pBODkz?=
 =?utf-8?B?NjdYQ1dTT2l5YnZzZWFzQWhiejR0UWFydVp3TCtLZWR4d0tlWDFKdzVjYlpO?=
 =?utf-8?B?LzlpdmdnbTZiNjQ0WHluTXFjT0pGR05xQmQrbTduTXU4UitGNTZtRUdwZGta?=
 =?utf-8?B?YlQyNzVTZ0t3dTRHQk9LL3UreWdtMEtqUk1XUmlXT093SDNWNmNGbVBVSktT?=
 =?utf-8?B?OG5rUTRpR3p5bUd5SHRkcXoza0thblRybkNHM3BtYWpuWDZOSkN0cmsxU3Qy?=
 =?utf-8?B?Vk5WdFVab0h4L2FCSTBiZUt0TmpCSlhkRWRaR2dCNkp2NjBBYUV0Sy93NC9i?=
 =?utf-8?B?enJqWTMyZllrUXpSUGFRZmdzSHZERmR4eFdhQWtpMWF4cnJjd1EwSXhQWHlr?=
 =?utf-8?B?b0ZobHRJN2VSSmVLbFVITlFIRmkrTFBUVm1iMDBpcjl3UU5EQjdaMTRlNVd5?=
 =?utf-8?B?RFFCYko3M3NBZFN0NTFFZzVvcEdLcWtNNjJWMmFoekV0c0EvRXVrN1dnYzEw?=
 =?utf-8?B?TG5yVlVBdnNnUFUrWStYd3lwOEo3MVZ5bllHdzFoUTR4clo4ZkZpQm5LWTJG?=
 =?utf-8?B?V2QwdTRKU0hBb3lWTTJhT3F3RkhNdUFiREppRHhiVmxqdTZPOUFjZUJGenFO?=
 =?utf-8?B?UldhQVFpajFSQnVhK0tIUzhGUEI0bTFkeklUenJrUCs3OFdTT3lLaEJrQ2Mv?=
 =?utf-8?B?MEp5RWFPYjNSaGdaS0FkN2l3TVpndk5xTWYzVVhjUmRNeDZFT2dsNndKUVV0?=
 =?utf-8?B?NDBhRE1GSHpneTdQYmowRElWdnRtSEdYQUZBZW5zeWlPTm95VkpVS1JjOFRF?=
 =?utf-8?B?c2ZQMWFZZ2lYellYcUVqb25yV0Fkc1RQcWIxWXMrWTIvamFVYWYrQ0o1RDhB?=
 =?utf-8?Q?7xLS7qi00hU3Ah1HZhZ0N04=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c9c2c8a-f95f-4999-5927-08db5c73b95a
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6974.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2023 16:27:10.7880 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F2qtUyQGEnGNuf3Yxu9x++q+m+RqVgiHH77NKcK+Rsy9UXN9xxZOP7QR0dLuMGRrYZv0xcmKCDLIQQkRZNGVJfBiuLUOYzm/q1EMixcUlH52DD6eQeAMRjnjq8m9apOz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4900
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 1/1] drm/xe: Add a debugfs for faking gt
 reset failure.
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
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On 24.05.2023 12:36, Himal Prasad Ghimiray wrote:
> In case of gt reset failure, KMD notifies userspace about failure
> via uevent. To validate this notification we need to ensure gt
> reset fails and there is no mechanism to cause failure from hardware.
> Hence added a debugfs which will cause fake reset failure.
> 
> v1(Rodrigo)
> - Change the variable to fake_reset_failure_in_progress.
> - Drop usage of READ_ONCE and WRITE_ONCE.
> - Follow consistency for variable assignment. Either use
>   functions for all the assignments or don't use for any.
> 
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt.c         | 15 ++++++++++++++-
>  drivers/gpu/drm/xe/xe_gt_debugfs.c | 11 +++++++++++
>  drivers/gpu/drm/xe/xe_gt_types.h   |  1 +
>  3 files changed, 26 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index 80d42c7c7cfa..b3ac8b3ab455 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -506,6 +506,9 @@ int xe_gt_init(struct xe_gt *gt)
>  	int err;
>  	int i;
>  
> +	/*Fake reset failure should be disabled by default*/
> +	gt->reset.fake_reset_failure_in_progress = false;
> +
>  	INIT_WORK(&gt->reset.worker, gt_reset_worker);
>  
>  	for (i = 0; i < XE_ENGINE_CLASS_MAX; ++i) {
> @@ -601,8 +604,18 @@ static int gt_reset(struct xe_gt *gt)
>  	xe_gt_info(gt, "reset started\n");
>  
>  	xe_gt_sanitize(gt);
> -
>  	xe_device_mem_access_get(gt_to_xe(gt));
> +
> +	err = gt->reset.fake_reset_failure_in_progress;
> +	if (err) {

This doesn't look the right way. It should be something like

```
if (gt->reset.fake_reset_failure_in_progress) {
	
	err = -ECANCELED; or whatever appropriate
	...
```

> +		xe_gt_info(gt, "Fake GT reset failure is in progress\n");
> +
> +		/* Disable fake reset failure for next call */
> +		gt->reset.fake_reset_failure_in_progress = false;
> +
> +		goto err_msg;
> +	}
> +
>  	err = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
>  	if (err)
>  		goto err_msg;
> diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c b/drivers/gpu/drm/xe/xe_gt_debugfs.c
> index 8bf441e850a0..13d2a974bc00 100644
> --- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
> @@ -127,6 +127,16 @@ static int register_save_restore(struct seq_file *m, void *data)
>  	return 0;
>  }
>  
> +static int fake_reset_failure(struct seq_file *m, void *data)
> +{
> +	struct xe_gt *gt = node_to_gt(m->private);
> +
> +	gt->reset.fake_reset_failure_in_progress = true;
> +	xe_gt_reset_async(gt);
> +
> +	return 0;
> +}
> +
>  static const struct drm_info_list debugfs_list[] = {
>  	{"hw_engines", hw_engines, 0},
>  	{"force_reset", force_reset, 0},
> @@ -135,6 +145,7 @@ static const struct drm_info_list debugfs_list[] = {
>  	{"steering", steering, 0},
>  	{"ggtt", ggtt, 0},
>  	{"register-save-restore", register_save_restore, 0},
> +	{"fake_reset_failure", fake_reset_failure, 0},
>  };
>  
>  void xe_gt_debugfs_register(struct xe_gt *gt)
> diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
> index 7c47d67aa8be..746d65c4aacc 100644
> --- a/drivers/gpu/drm/xe/xe_gt_types.h
> +++ b/drivers/gpu/drm/xe/xe_gt_types.h
> @@ -168,6 +168,7 @@ struct xe_gt {
>  
>  	/** @reset: state for GT resets */
>  	struct {
> +		bool fake_reset_failure_in_progress;
>  		/**
>  		 * @worker: work so GT resets can done async allowing to reset
>  		 * code to safely flush all code paths

@Rodrigo
This feature is purely to support test the driver and not something which
helps debugging. I am concerned whether such code should be part of
production build. I am thinking if this feature or any such patches in
future could be made part of a kernel config, which can be enabled in CI
when the driver is subjected to testing.

Regards,
Bala

> -- 
> 2.25.1
> 
