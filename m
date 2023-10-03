Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F466E8FDBF
	for <intel-xe@archiver.kernel.org>; Tue,  3 Oct 2023 23:01:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4484310E0AC;
	Tue,  3 Oct 2023 23:01:41 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B557410E0AC
 for <intel-xe@lists.freedesktop.org>; Tue,  3 Oct 2023 23:01:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696374099; x=1727910099;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=opPtZ5sALfZsbPWyMtt36Yr5L67ZdMi9e8Sy48VSsIo=;
 b=TPLZAi9Hhv1IBleFCtole10ioxHyoHgVTmExFiGCkYVkqtI4PQLt2jMO
 Gaz57y5Zwd2wyppHjSQyqCnp6dRmfET25xNFFNddzA7sNWb+93WLgZvQU
 uH7o06D6E+lvvmy3pAVlMU/rH78M70keGcjJTHC3yP8KKVmbzwco4ju0r
 Vn3s1tHZLFHNZja9vJvB5T0uVWccHIyOkb3oby1obts2M/QeUNAhuqCiG
 yTB7r9F71mdXh4GE/e2ceaJN2RR8UAYTxUfrs//EEE/B6Lx9JYa90A3EE
 mpg8dHweh3IiXTElMNHFN5bf1hq1OK7reB/GBgIu7YV78PE41mdzG5Xo5 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10852"; a="362355983"
X-IronPort-AV: E=Sophos;i="6.03,198,1694761200"; d="scan'208";a="362355983"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2023 16:01:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10852"; a="894679094"
X-IronPort-AV: E=Sophos;i="6.03,198,1694761200"; d="scan'208";a="894679094"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 Oct 2023 16:00:10 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 3 Oct 2023 16:01:34 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Tue, 3 Oct 2023 16:01:34 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.107)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Tue, 3 Oct 2023 16:01:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MIcd7xHwYTDFlCyo1+xBU8Z+VGJUP3LqIDRFb/pO6k5og419Py6YbTLX8pQcioN2yZQeAW8mxxjjahba+BpblDcCI26oeBsOi7BxJibDgAaj+XtykgUKN5bot4SKoi4iZ2pkB43dRID+oeuSZB2jHDEoX0R/9XUfgPJdEalnKvUbxbbEyNaEjm03KQZfJNLCNynYe5vV3iEZxg+53XW2UjynxrUZoaNm2e/fyXa1k7u35Oqm4hdnep7wtDwaiNUVIYfP1bHs9VRYI6xLUi3HsGfbhfx0uQkhtq44puII+RNcMutSw1BPTVDLGfdI+qoIOAw/ZUQyCTkfj846KjbHCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bh2Uawy8c6VggePRCmo6ibmtzDY6LpYiuWPug7DdCqc=;
 b=JE2bIF1A5xi6FedfFqLHY39LoZMWIPL0TY7C1e3fURV6KlmFzd6UsL/V5YtRsCjhmGCaF2HCaVwt8/rjVE9pIuXlVZmGraLoVnaiFMgoe/iQVnpFxaiyeORYBnsNcZRWr2dRxJp3kE2o7njHKYze/KZyAwvONOh4tgDa9DJwPgwqCXPrD529flhLwgJGh+SljTMxqoLK7aSfgMgr3eeLkXAYzYicTl9/Ttr0jjKtOvE1tJJFDkMZbrNAOmmSqKfTb4n4CqL9pwlAuYn90y+12FwRvWM37LQsa5vDK0YvbLOOE1nmI4gnCl3Sbxs3/PKGgtGwE2qXl7tR7gZBoAsqzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6952.namprd11.prod.outlook.com (2603:10b6:510:224::13)
 by SA2PR11MB5115.namprd11.prod.outlook.com (2603:10b6:806:118::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.20; Tue, 3 Oct
 2023 23:01:32 +0000
Received: from PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::4182:281:404a:1042]) by PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::4182:281:404a:1042%3]) with mapi id 15.20.6838.033; Tue, 3 Oct 2023
 23:01:31 +0000
Date: Tue, 3 Oct 2023 16:01:29 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: David Kershner <david.kershner@intel.com>
Message-ID: <ZRydSbe+qP64qa1n@nvishwa1-DESK>
References: <20231003222145.4090918-1-david.kershner@intel.com>
 <20231003222145.4090918-3-david.kershner@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231003222145.4090918-3-david.kershner@intel.com>
X-ClientProxiedBy: SJ0PR03CA0174.namprd03.prod.outlook.com
 (2603:10b6:a03:338::29) To PH8PR11MB6952.namprd11.prod.outlook.com
 (2603:10b6:510:224::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6952:EE_|SA2PR11MB5115:EE_
X-MS-Office365-Filtering-Correlation-Id: 609ecd7f-7e68-41d3-b264-08dbc464af11
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WLPgI/5zgb88o/8xKpnkO+52X9DmwET/mzV0B3AGW0rQcK+BYTz52M75gQuDEEuMzE4WkcLGaY5oEDfY85ufNGo4QExOlc8pFATci08zTzs7d6uMv2hvtLM+ESznOpDXhhAE+SbuHc4HBPGmJG7M0wm0+4VE5Z/jUq4SCECC59cGKRJePpETvxs5qXF2kmDHPn5HGyNcx73mowAwDz1I7rEs1KWps6efYyRkHhwLx+BjBfTBemi2RmQE3gp2BM9N2FdL0zre3sgS+KjAiD3h+k1e7uYco+UvZPgPvhLzv8Zbf6AgCV8qBS5nCWtkc6FXbZmD7SbvzE8m0VoP29TPSVFGshdSFgPif2ZdbUa9m3nclUM0cFgB1qpvayJI1Q3uyK7bkKZbcA3ECVLfOepuZgqm7Ax1OQ9XApxraWP22a7KOf25wTqh+RqiNVAKuKNEu1eGKuw/BcYzS2FyDuYhV3TPdLZq5X+5nf4kECk4bSh7peSmvnJLl8UrOWeE5kLAdfWiAISFWzTU6Axg0KTrEWw1+VD8aH4wxYivsHZL7ZKkYByYJI3PL+as7Ep358w0c6wf8Be2yj1gVqAbD/f2uNMEH5vfmvjFPvo10bVeHLI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6952.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(39860400002)(136003)(346002)(376002)(396003)(366004)(230922051799003)(186009)(451199024)(1800799009)(64100799003)(6512007)(6486002)(6506007)(9686003)(33716001)(82960400001)(38100700002)(86362001)(107886003)(26005)(83380400001)(66556008)(66476007)(316002)(41300700001)(66946007)(6636002)(2906002)(44832011)(5660300002)(6862004)(8936002)(8676002)(4326008)(478600001)(67856001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SlFVZ2hlSkQvUUlIZVJaRC91cEpLYU44REd6MGxsTHQ4QlV0M1Vqd0ZiNXJG?=
 =?utf-8?B?WnFzTXEvRDhVWk5BNzNSRWdzQWQxZnJISkx3RlhtZzByTjlzd3NqT3daM0ZS?=
 =?utf-8?B?S1FVYmZIejQ5MS83NUFvaG1TamlySjk5OWhRT0FvRjg1K1hLOXdjUnNhd1ZY?=
 =?utf-8?B?UFdtak9LWnFZQmVpY0JLYU1JODZTYkZoR01NMWNadmJwSU00R25yeGFhQmlw?=
 =?utf-8?B?OFdhd2ltRkEveTBVdGtQa2oxWjJRT1dFUWpSN1lxQkJteVVLWEhPcFFCZWZo?=
 =?utf-8?B?NkIveTEraU1XMUpSelpYVzdYalJlYUd6R2d6UXV6bTNCWWxoK29PYzZJN2No?=
 =?utf-8?B?K0g1RUN4dTJ2L0NyOVBaWlFOS3lPTzYvWG5uckg5NU8wOFVGMzM0bUpXQ1Bk?=
 =?utf-8?B?bzAxTTNDT0NkRjFkL0ZZWElTcnZ0aER0MXNKOXN6TXlLZGFCaHF6RnJMcHly?=
 =?utf-8?B?cXc5WVZmNGVObHRZMGMvRTU5R2tnN3Q2U1A4MmtKdnlqd1g2alIrZFF3R3dQ?=
 =?utf-8?B?Tm9JbmczSUlxTFpkTU9tMytKYkNlWVovYWJzcVBSQ05YT0EzLzUzOU9adEJN?=
 =?utf-8?B?YklXVTBnN01IZ1I4V0dFZ21jRHI5S3RHZVlaaWVpNWJrbnVVZ3F6cVErOGh5?=
 =?utf-8?B?TFBDTzNNdXE2S0gvRzAwOGZCMk5Fd3d3MWFpd1l6RUhZWm1yMEtHa3VFOE8z?=
 =?utf-8?B?eXFCdXlqeVlJV1Vnbk5oMzExQjNVdk5pdDdZYUVLL3p0QTBJL01oRG5KTHkr?=
 =?utf-8?B?UjVwMWo1bE9UeGZKSEd3eTNzSzVqc2VyYkVlcnNwdTdmczVDa295cy9IV0VM?=
 =?utf-8?B?RjdGVFFGNFp5S1Z6S21aRmN2dHpFbkdJdXlqSnB2RW85WHdRWXFoSkl6UU1Z?=
 =?utf-8?B?bllPUHA1RWFuYmExeHprS2w4cU5FQktyRUdieE5QcGlFdW1mMkJ5aytMaDQx?=
 =?utf-8?B?NTFiTTZvQ2ZtVlVtNWgvSnBqM21MQk1GZ1RvZFY5Y1Z3dkViVWQrTloyVmo2?=
 =?utf-8?B?emY3dDArc24yTm44aVRBdlA0UHRPN1NjYkhyQzU0Z2kwK3dsWVc5bmVCSmdw?=
 =?utf-8?B?a25rNUF2NzY1M1BMRXd2eW96dlA4SkxTOVRTUlJsdnZmbHhhMGJ4Q0NxcUF3?=
 =?utf-8?B?UTFkblVhRng5RFFXclliWE9NMXBwUGNzZHJoVm0vaW1Qd3ZMczI1T2YvVzh2?=
 =?utf-8?B?K09yWVFvY1ViZTJEVFVPRVBibGptZ3c5bEYrYjRWM0ZuQjgrTm96VXNDWUxG?=
 =?utf-8?B?NFFiRXl2NG5oSUo1R0J5K2dRUEZCRzlvZWtoZDJOMXY2YmgwUDI2S0JCdURs?=
 =?utf-8?B?cWtNVm9Ed0YvMEFXbzh3eXg3cHQ1N1pPc2I5QkFsbGRkM1hKWEhyZG5kNDZN?=
 =?utf-8?B?Yml6bXRaQjExdExVaW9XME5yNXEzQnVGNGY4WXlYTlF3M3ZkTHlJWWNybjN2?=
 =?utf-8?B?R0J4dFpVZlBpYlNrWGhwOUtZV242OGlyYTJqRStDcml5L0c3bjF2RjZQRkRl?=
 =?utf-8?B?SjdldDF5YUhhaGpNSnZvdWp0ZktqbDdRTUY3WlNCQTVtSzI3VW9PUHRHc251?=
 =?utf-8?B?b1VaODVkUGdiQ3I4WkdTTnYwWjhMdTB3dmFKdDFMYktFcEdWN05BbUtLWnda?=
 =?utf-8?B?cVc0aC9VVC9Qa1p6N2t5K1VwWHlNaUsycTBJRFphTkJ4bHhKUDl3WkEzQm80?=
 =?utf-8?B?K0oreVlIMVFkb2NabGIySXNnMkN4SWpydWltMkNONmdETDI5ZXg2dXRuUGxp?=
 =?utf-8?B?aEwza1dlSVd1MXZ2RjhLSmJoY3U5akdXd0NzbG1kY3d2Nnl6RHlKaXorTm1k?=
 =?utf-8?B?TzB1Uk9YRWFTS01Pd25YK1NITlpGV01HbS9RWlFpazNqMERHYkMyQWk2Q25a?=
 =?utf-8?B?WlVPZnh0T3dkRXIvaDZvci9QUmkyZmhlVlhHcG41WmFQT3dqM1Jtc0U5YTBM?=
 =?utf-8?B?M045YnB1ZU9xTzZJa0FERUdHcVR2ZDZYb2VxM09VTmwxM0hicmgyOWVvZkFu?=
 =?utf-8?B?VTM5WWpPYzZHVFovdDYzUndueE1TbUxsbTB2MDdEWWlPcGdNaDY4ZjA3VEts?=
 =?utf-8?B?d1U4ZjNPMXozeDQxMFhnYmg3OU1mQ2pWWE8wQUEwczhxd2pScGtiYUVHMzdk?=
 =?utf-8?B?NmVwb1F1b1NIYkR2eFhHWE8xVERLOGxKcEhHZnpWQ2JpVDdEY0hWaDF4eGEr?=
 =?utf-8?Q?xcmoR2+NizEt8uPyp/jwn5k=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 609ecd7f-7e68-41d3-b264-08dbc464af11
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6952.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2023 23:01:31.7563 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0TI45CX0FHYjkE181NqW+yUaT3sYerzbaIl67dMI0D6uxQakcyaUDuYsYFV716svmkMlNAZGpMHaOdxArxCpDrXGxtqtjgb01Dfait/zU8+BbBXBSzjW02mZoChbsBCp
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5115
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v3 2/2] drm/xe/xe_hwmon.c: Add static to
 xe_hwmon_process_reg_read64
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
Cc: john.fleck@intel.com, stuart.summers@intel.com, matthew.d.roper@intel.com,
 intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, Oct 03, 2023 at 06:21:45PM -0400, David Kershner wrote:
>Add static to xe_hwmon_process_reg_read64 to avoid compile warning:
>
>    ../drivers/gpu/drm/xe/xe_hwmon.c:126:5: error: no previous prototype
>         for ‘xe_hwmon_process_reg_read64’ [-Werror=missing-prototypes]
>
>Signed-off-by: David Kershner <david.kershner@intel.com>
>---
> drivers/gpu/drm/xe/xe_hwmon.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
>index 1deb5007e1e2..172bb85edcf1 100644
>--- a/drivers/gpu/drm/xe/xe_hwmon.c
>+++ b/drivers/gpu/drm/xe/xe_hwmon.c
>@@ -123,7 +123,7 @@ static int xe_hwmon_process_reg(struct xe_hwmon *hwmon, enum xe_hwmon_reg hwmon_
> 	}
> }
>
>-int xe_hwmon_process_reg_read64(struct xe_hwmon *hwmon, enum xe_hwmon_reg hwmon_reg, u64 *value)
>+static int xe_hwmon_process_reg_read64(struct xe_hwmon *hwmon, enum xe_hwmon_reg hwmon_reg, u64 *value)
> {

Not sure why this patch is in this series instead of an independent patch.
But, change LGTM.
Reviewed-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>

> 	struct xe_reg reg;
>
>-- 
>2.35.1
>
