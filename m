Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F95AC6FD1F
	for <intel-xe@archiver.kernel.org>; Wed, 15 Mar 2023 00:10:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67F5D10E1EF;
	Wed, 15 Mar 2023 00:10:30 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FA0310E22A
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Mar 2023 00:10:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678839027; x=1710375027;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=17+fCH8gU20f+wibeRzESw0WiprTzXZls4/VDKo1WwU=;
 b=iAcfLO6uZlZ4ySsGnmSb7oxJvHeskaClq/koVMVo98/yYPzlWOC8DZVW
 jFarkFPKL9SZ6YjOSnjengbBff8mR3JdC8LTiJPN0uCwm/fFwm8lej/KY
 vMxCN5JM66ZHhoT+fY8AMIfuXn5+sbqE7JLjBuOf6qvvWAkmN/MbOGkan
 Vth3lMhT+E65ZtHTzfk/miQvhBQnD9vhtwfEIhy6Ythx9ntPXINusUZaP
 hrDbY5F5SRG3kCnVJatlPpCPlxUuEAFz2LU77YV1KZsN+FjSn3JueMvZl
 cdSFDZ39n2rYcX3OZwJlvC2cfcUcnqePomwe+4EpQ2RiZz3QzDk6LBFhs A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10649"; a="317227304"
X-IronPort-AV: E=Sophos;i="5.98,261,1673942400"; d="scan'208";a="317227304"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2023 17:10:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10649"; a="709478485"
X-IronPort-AV: E=Sophos;i="5.98,261,1673942400"; d="scan'208";a="709478485"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga008.jf.intel.com with ESMTP; 14 Mar 2023 17:10:26 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 14 Mar 2023 17:10:25 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Tue, 14 Mar 2023 17:10:25 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.41) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Tue, 14 Mar 2023 17:10:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VRvC7CLOwpETIRcfdyi/Q4UQJJdFdjRCqSt0ohOmSAXQLSQbQ2GBhBce6OxcUoE8m9mTYers+IWjaYr1cdxqrtq60whQiv7A0Px7eiDmHZXtnvqRkQldjVAYH8PCu4wBGSoZSbniDBPpXT+0p7o5w93slwsXgYlvAdLQ22uAWFnoJRLYwkqr7aTvNoqaAuXui9aSX2HesC5W/v8SZdwEpH836uvabQSreUH7V20kL5H2Pt5so1GA4vkMFiFJVIYHLm3ov4mjSskiOHeqS5spuGgTau3Is8YeXeertdG8yCGbbxpAPOZWrOPdRQ9Vw4W5edFi+sMwrJEgPVrbP6naAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BhqBxCc2w74LbSTmzp3+uNMWNpjoaiHX9k64wZClDh4=;
 b=X7BQ9S/D/U1HT1dPC/YDTx+5CQoyoYqKujnlgqUIU+gasgxslwKJRZY6Ycuz/kOfgw5zBHi7YZ1Zsf54ZK2IP8+ieEikpGIACzRnK3mZvWPN8E8ndOoI2jedjXS4/pzFugoFA4zLjUKJZBVegTshY42LMRp2/tnkM0xAsSG3z9L29jwsIGFFXfANi7xKtErCb5lSDbPNqlxmL8HfRK5BblycxjtLuzGtpM5tAmd3Rnbf9wdcvG5BkBpQ1QGe2a4Z/t8bFaSljgkxLNOB/GLiGHMKqcG5U9o5hpJw/c0fsyYvxW65nB0Nx33i+3nPY9kUI7NVmHXm7u0alZ9QI2LHJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by MN2PR11MB4744.namprd11.prod.outlook.com (2603:10b6:208:263::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.24; Wed, 15 Mar
 2023 00:10:23 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::2629:fb12:6221:3745]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::2629:fb12:6221:3745%4]) with mapi id 15.20.6178.017; Wed, 15 Mar 2023
 00:10:23 +0000
Date: Tue, 14 Mar 2023 17:10:20 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Message-ID: <20230315001020.ugbmxwzh7nppqdo4@ldmartin-desk2.jf.intel.com>
X-Patchwork-Hint: comment
References: <20230314003012.2600353-1-lucas.demarchi@intel.com>
 <20230314003012.2600353-14-lucas.demarchi@intel.com>
 <20230314233926.GB4085390@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230314233926.GB4085390@mdroper-desk1.amr.corp.intel.com>
X-ClientProxiedBy: BYAPR03CA0030.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::43) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|MN2PR11MB4744:EE_
X-MS-Office365-Filtering-Correlation-Id: ac7041f3-ec15-4840-bd56-08db24e9ab95
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BQt0iJjxVrRyaWdH7CeACENWaCj+Y+U+64qEaeBbi6BdeVfJ58UJEPmVIV7oqKR6lw7GPr0+5jRO7WxnsTXYlbt6a/+j97AS9/OXBPoov90GONyBIHjlWqP8zct0BTdYblyqIT8RVaZXl5ApBOuhGU0gptmZwV8DNwXWxNDyx46s/IvVExC80m53LUzZnp3JuRwUflvw+JYFGA1ILDheoc5lkXxVcCCoEaf8WPK2N0S7V/VohyY+bl5/vLYzSf+suBuEJf52I5tSSh6anJ+K3bxAsQ1SPTkxZ4yBV+sYPm2Eec4oP9cnlOkPpXztpA7UIu+QtjIBM9DDPyMOAhnebNOOgQgZspPCZgGiw9Fp3f7B92WQloL2a+yirAm2T2esL4MBrIA2Lq5315wr3Mji7rk+faxzmsM8hmuWStbcs2zK+m9aXlaKqfmDOw7jffLsHm+VC6yf7IQpcL3FhtUOIbzwWOwx7HFU6WTiiZW/fCN742AoddyqBuRTFRUr+p1BO2SmzNumtkDDv7rqFVLvuyeBeUvWmTPLjSTVDM6yK3HYmTh/ksQFBRyIjmFsbBfKQRUba/uxYTbTEqUZL/otP1AXNn7QcbsSvrxSeIr9+rx8BWV3DbIZkAhdIhV3jvbe+lKpszR3li7S3p8n7mWPtg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(396003)(39860400002)(346002)(136003)(376002)(366004)(451199018)(86362001)(316002)(6862004)(26005)(6512007)(41300700001)(6506007)(1076003)(4326008)(8936002)(5660300002)(186003)(6636002)(478600001)(38100700002)(66476007)(8676002)(6486002)(66946007)(82960400001)(2906002)(66556008)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?02k1KymWx2+w4lZFyfnuT1SAtNtNuTeCbXpeB6pCrhLKn6J4SfuVHAnWzwG6?=
 =?us-ascii?Q?m9HGxU8Pg1xzurqfoXd9PIVQeb1dyAtxXcWXQ6olnGLD5ONa2wjnW0TeLT2L?=
 =?us-ascii?Q?owz20WrwelJOsmtAH3ZAzRu+9hToYHbNnkJ8Lb+UKv3WqhjkQKs/kyZ7KgtJ?=
 =?us-ascii?Q?+/1dN15NZlC3HB4bE3V0lsoDekmUhe81rF2w7L8+yvvBoPfqVyOUeuxfvJpV?=
 =?us-ascii?Q?FK5Yfrs98BOQvRFijyEmSuQ4ZLLG/z7MTokHmSRONs31B2j/C3VDjkRg67N4?=
 =?us-ascii?Q?cWp8DCKDw5OqXLKElurWVA05+eNHLh0ciUPBPHkvhNyPZYC+aF21DWxQjtWq?=
 =?us-ascii?Q?anC2+1jVayLsz5UQQlhry3WD6rxE2QYB3XoAAO27M5plnssfNZwMlKsjZ7yi?=
 =?us-ascii?Q?clqG0p67itxSVyxKLfTFa9qeTmkInQeQHSV3V3hC1tayvVXTMssNQcwpCX01?=
 =?us-ascii?Q?lX3WQoMGXb+/Bqy+WnFKw+IPRP5idX9tQA8rB2sX39Btsw/KBom7MtaGQn79?=
 =?us-ascii?Q?LjFtHN6ia2eteYdHL2aLx37ytKZ61RjimhkncdxGgHyUacChiXdx0SyDN3rR?=
 =?us-ascii?Q?5gKYqwadAHfDNCnLrGUM7ew4Nl4Ms8OluDr0KS3SM1lVRdlSCmTsWHimAL1r?=
 =?us-ascii?Q?qLLqoXyPs4n/Jxjkzz0lzs0lKCGmZmJlXzUyG9H99d8z4bi3PUStkCMOlkzG?=
 =?us-ascii?Q?cmV5FoIS6j7XDKLAvgqKUG8sHalSbH9ZHzpYed2SEXxUUZ8ooAlmysdYuZDI?=
 =?us-ascii?Q?uOs6TI71k0j5y+MQ0ZVs8dXcI8PNj4YktZvlNULZ5Y6DSJwV31UT+0fzwT1x?=
 =?us-ascii?Q?3lbUq5d1IWx0sweUafcBvMXXTFjVz76O9Ju5BJCppfkKawfeKTUYZNg1W8Xw?=
 =?us-ascii?Q?NqOBoOeRVq/yLEEqMMO05LqDTt/J4JlB9LAp/UPYqydfMAAq4ls4eiEMmyAX?=
 =?us-ascii?Q?yVbAPiVgjK/E34tIKQkadA0Bwle4+L1iJ7K6c3Rukkn3FcBvHfwk1K8VmqeJ?=
 =?us-ascii?Q?1UmAVOhXRsK2j0D5AbrhnEgtRyTvZJ9AHweaktIUgixGSUuoFjniN5lF+EyE?=
 =?us-ascii?Q?oaOkEKADR+CT/BcklIekfiypPCm9GWiPEUjUt9scZznz6HZoOEIV1fypAKdg?=
 =?us-ascii?Q?IALDOhOvWVHuc3hmE1Ijfq3ly3+xVnNHFE6yywzWEDUy0Qja/78hKaPh3N34?=
 =?us-ascii?Q?gD7RjX25W7XJv1lCfF88CB5Y9R8L3MMCHK6xiOQ/fB4Irme/mRsjw9lkDEEh?=
 =?us-ascii?Q?qRW5FsVCXP7sV9DYmfMrfaa8+Xih0DmOhGlhMxf8PuhTbf9dpW1jWGxJ4JJ9?=
 =?us-ascii?Q?MB1ZyGUqfyZWH17s4cP+vHZH6CZ9VRIaixRa4t6HwLrbHiSxmRnNzL5Z0Qds?=
 =?us-ascii?Q?4zvxCzkdtia6n8UlLL4AAKVJgVUCXMbkOvrsLVjB6O4tYqswC3Piy4b5bx7p?=
 =?us-ascii?Q?mAfLxs24N8KvgNClXlLi4S0kSQBk7lvgspJxM2ncmGXf9u7GwQFm3P7jUASx?=
 =?us-ascii?Q?E3fpr3tY4MNrs47Hs+TBOpz1L8/TwxslaNhplksdz8ZJXcwmzJfqZpZgpIyr?=
 =?us-ascii?Q?oWTi430+skgbUTHJ3oEqWPtTfr/pHp/LU59QsruLowUxZs4Ls/pxVVvD5a26?=
 =?us-ascii?Q?Qw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ac7041f3-ec15-4840-bd56-08db24e9ab95
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Mar 2023 00:10:23.0410 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aTeVpK1Tiq+lA4SIUZQ7/z+o0vra6C++hWcdjaidAnx4OKQQDt3iMsNOBpMjmBnq067qPreez5SEIf5ovusVznNsJefYaYcCPo4BGtacmAI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4744
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v3 13/14] drm/xe: Add missing LRC workarounds
 for graphics 1200
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

On Tue, Mar 14, 2023 at 04:39:26PM -0700, Matt Roper wrote:
>On Mon, Mar 13, 2023 at 05:30:11PM -0700, Lucas De Marchi wrote:
>> Synchronize LRC workarounds for graphics version 1200 with i915 up to
>> commit 7cdae9e9ee5e ("drm/i915: Move DG2 tuning to the right function").
>> These were probably missed for TGL/RKL before because in i915 it uses a
>> !IS_DG1() condition.  Avoid a similar issue by just checking the
>> graphics version 1200 since DG1 is 1210.
>>
>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>
>Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
>
>for the changes here.  However on the topic of LRC workarounds, it looks
>like commit 6d4750630a27b ("drm/xe: Fix duplicated setting for register
>0x6604") was incorrect and should probably be reverted.  That patch
>moved a real workaround (handling of GS_TIMER) into the tuning function,
>but dropped the tuning setting (handling of TDS timer).  The workaround
>and tuning setting are updating disjoint bitfields of the register;
>they're not equivalent.

right... I will have to revert it and figure out why the warning was
triggered.

thanks
Lucas De Marchi
