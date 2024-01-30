Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 506DCC47DDF
	for <intel-xe@archiver.kernel.org>; Tue, 30 Jan 2024 20:47:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0930B113584;
	Tue, 30 Jan 2024 20:47:43 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 143D7113584
 for <intel-xe@lists.freedesktop.org>; Tue, 30 Jan 2024 20:47:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706647662; x=1738183662;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=epT4cRTw5nKoCodKF5oDsnqpFnG3x3LXbgPLXGK7wzs=;
 b=R00Oxiz/PNH3E6x9tKMcbIvn6Oxhk2/AZAgx8D6qh7fsT7inLyHc2+xq
 GATVrqSB9kJu0kIRN3ZvqH2jkf9n3E06mBQeRyZP4mk02Sew3Q9Xf4we+
 IPJqqtLxibJz70YLL/r1Xcu/uokcw/WLZCZUUxWatFy/V64jInSPLwKs8
 gkihbryVCRJGl397cjOF9iQnujzTKBgO+0XKTGq6m5RucuVCi6tyvv+Ck
 SyUVtascMoitzMH8TblLscdusIE0B8zqbMP3r1vxmZZ4In7YkAxw3Lj4u
 9c2LHaR8M48wBYpgUH4shEBAiDXNYYIQCVMGTRAuWPa8wfMEC0jn1sKFg w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="3270984"
X-IronPort-AV: E=Sophos;i="6.05,230,1701158400"; 
   d="scan'208";a="3270984"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2024 12:47:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,230,1701158400"; d="scan'208";a="30020120"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 30 Jan 2024 12:47:42 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 30 Jan 2024 12:47:41 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 30 Jan 2024 12:47:40 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 30 Jan 2024 12:47:40 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 30 Jan 2024 12:47:40 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cHdlwLAuulesMeKqXoT0KAleC8QaDwyfhtX01XF1lUGQuyXDGXONyoCvh9PGxTEEsHogYIbM5fupyaavL6XL8rD1SBIeyu525CLCbiPkIWBr5XjpzOzpeILxAeewGN8k16/VqO93TVuwi6i0Ml4y91mZO8pqodyNv5tUsiQWVqW+P4R/RGehfcchXcpHBSXfDrJDUYZzM+cSAlxnzIliZC5UPAtl0Gyi3TyYuQ2YVke0wPe9kNOWNXSAI4TAKWAJZDkMlhxoFrNzH9fCMg4S3EQoqhQV6PAhnHbjNsJ7K9PXnKQIPnPl0QAfobHHxOUJgZqY6OjgXF8SUMdEJlzRuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pHr/RdHTy4Z8xWCn9eQ+YScWWk10WgdTDhdasFlMxHU=;
 b=IDsRMGDNRy/+TzGCzC7kzptm2wp/YfPKSG8N3JFgpGRx3xRI+SUssxB/EZtDRrXpzNptjxovzBJ4I4ZMCXl0hpytCsgo/X997lCCd3LtMt9Z05G6xJNZxlOj9OaAn6Q9saJYUB5/Kz4x7oQvR3gf1CyZ4qLF9aSH+6M5hatH6RhQ3HlZ2ChVch2ewnwHUH7wLVQquSJTL7u35aiN+Z8XdGVXVFxExkbe+4wAJrrHI2ikAX27SjTC2FXCyf6mROaUZQ6ibE7+DUDth5SzDcd1bL6NwrCywJn1NMaZmdm2zDBTJAq5oN4ZeWGTcjodhYUkguxWCnq9pyTDi+8gFXvBug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB8200.namprd11.prod.outlook.com (2603:10b6:208:454::6)
 by MN2PR11MB4549.namprd11.prod.outlook.com (2603:10b6:208:26d::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.34; Tue, 30 Jan
 2024 20:47:38 +0000
Received: from IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::9ccf:6986:9706:16cb]) by IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::9ccf:6986:9706:16cb%6]) with mapi id 15.20.7228.029; Tue, 30 Jan 2024
 20:47:38 +0000
Message-ID: <b255e4a1-bb84-4c49-9a75-653076981c1e@intel.com>
Date: Tue, 30 Jan 2024 15:47:35 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/1] drm/xe: Expose number of dss per group and helpers
Content-Language: en-US
To: "Summers, Stuart" <stuart.summers@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
References: <20240130185744.209647-1-zhanjun.dong@intel.com>
 <20240130185744.209647-2-zhanjun.dong@intel.com>
 <2f311ebe657e8dc9a23fef829d749d1e7f74d4a7.camel@intel.com>
From: "Dong, Zhanjun" <zhanjun.dong@intel.com>
In-Reply-To: <2f311ebe657e8dc9a23fef829d749d1e7f74d4a7.camel@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY5PR03CA0003.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::13) To IA1PR11MB8200.namprd11.prod.outlook.com
 (2603:10b6:208:454::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB8200:EE_|MN2PR11MB4549:EE_
X-MS-Office365-Filtering-Correlation-Id: 39b19fe7-5b50-4822-a196-08dc21d4b1f4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +Gvub4U0htpqyl3hdYOig0lR4VC2EEbweqtCmAO1StDOXvzr+G7Su70gPsbz5frWUNcpVdnSMC2884pARHiqOy9Qv2ES4WfabeBMFE20ifNKw9ZDlqq1OzdhVtNbOLUEsUTYeVS185o+Xw87TaV17JvIZAUOHSxfTw6GgCSZjBXhdPW/INGCVk3y/bPdvXMdbQgddDXX8Usr2FuNKODspQ7NXLliPDXaYkKMjbpjPgEC81mpGEzETg9eGHd5KCv0iRJ9Vi12WmKfl90hvB2hXTPtV9ghzz4saeDaioXraP5JJtcVC+nAM36qtT2mPeOF36ECXqXEH5YRvXcPDD6EJNKi+7+amBThkNltiWj9fcRNvvQYRRhPBVXN5Z4/cJxHN9tDdauzdilXCFbJ5c0i3ebYWHQDgzmarVjEKt/6Olo7ZxgbNQXJUFGZOV7izlp4+NmwOFcoNNd0phPVw2Wjj9jfX4893scUruQFDkMxJcnbUVI/SrN2EtaLn2QgQgbbcFr1ybGxXHqg1WAnfCrTdqYB0PEo3GXwvr5zn8aPFNaIxYaHYP44KEc11bvJNYCM3MtUDbqQdEZXv7bhK044LpurvuqeTysHDUzgxoW0bicWWlj2TcrHsXWiKleq+x2tzyIOI6yO+UlTWtpQLhQv8lLrBk0jEB/s3tkV9bGi/H6Vqrf/sSb8WvouZ2R9ezhJ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB8200.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(136003)(39860400002)(376002)(346002)(396003)(230273577357003)(230922051799003)(230173577357003)(64100799003)(1800799012)(451199024)(186009)(31686004)(83380400001)(36756003)(82960400001)(86362001)(31696002)(8676002)(6486002)(2616005)(26005)(53546011)(6512007)(66556008)(6506007)(41300700001)(6666004)(66946007)(478600001)(66476007)(110136005)(316002)(8936002)(2906002)(5660300002)(38100700002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VWl0TFcyZTNHUTh1VHlQMFdKRlFwOGdzaW5JL2JtaERHWHNqR3M3MS9Bbm5j?=
 =?utf-8?B?RHRZTlg2TERiQkxOWjBpbGRZSmlIN05sSzhIVThLcUNaeDdGMjFhM241clZl?=
 =?utf-8?B?Mmk0TVpWYjBBbXBqOGdFRDJ5SXRBQjRuaWNTRUJoanMvR0NlRktpbHVRbHdN?=
 =?utf-8?B?MUJwS0pQc2orT3NjWW10cnhsQVhKaWFIUGRMMENiVkpDVVdoeUlwWXNmOVNU?=
 =?utf-8?B?QUlnWUxmVWVZekVKM1NlckxxUi80eHB1Q21jK0JEUnVPT1dLOWkzLzB5aUlq?=
 =?utf-8?B?QjVGbElZNHJQTzNrWHpoeDBtemRWZmxsTG1adThEeTR6S05tRWJwenlhNkVG?=
 =?utf-8?B?c0pOektNUFVuMjdtemdmQmltYk5LRFdOcENQcUZKa0RTTXc0VmRtV1FWT0Y3?=
 =?utf-8?B?Z1kvTnhqRFBjckhIbjVFNTZhUTR6U0VUaTZZQTdaQVJsWXFIYktnYXlHUW1t?=
 =?utf-8?B?ZHBReDFDa05pVFR6eXp0dzdnNWQyS0xqd01xV3QvcXdKK1NZYWNCZFZzTGFM?=
 =?utf-8?B?S3RuRk54RmNkWVY1Y3RBUU9rVlA2anpERGFQQm9McDRkeEdJc3NYNVNLdnB3?=
 =?utf-8?B?ZlJBTDQvbVZXVXZDR1BvbXlucTNRcG1XYnQycElPbmlnekJTNVNXcm9LdzJw?=
 =?utf-8?B?QThTT2tZUk1ocXBjRFA2TEhXbjRCQVZsbEwzOGliRHc1KzhTUXJEeGJacnlW?=
 =?utf-8?B?OEg5REc4cktTcVhpc0k0NnF2VExUOFkxWVBFeHB6WEcvRE5XV3g2bWdDVEVr?=
 =?utf-8?B?N2I4cFlXN21ZSFMwK3ZXWVhnSEVZNzE5cFBxYUttUmVFNU12NjMzbGI0Rklk?=
 =?utf-8?B?YjdjM2tta0xaTXJHTC9EdlQ5bXFlb0xWbTVycEJvRmQvejNab2dSaU5zSndO?=
 =?utf-8?B?aG9oNlU2UXRqUmxpRlJUSGtEZGNmdjErYkZERVMwcEg1K251UE5HNGNNZlpG?=
 =?utf-8?B?S29JcExISW1sTytpUzBJMDF5d3JEOUEyTXJwQUx2WXM4Mk9OQ013ejZtMDUz?=
 =?utf-8?B?VVhTbW1TYzh1Q1BIemRqZzlxVWx4MjdFU1ZLaDg3VkRkWWFXRUtOU2FRemRs?=
 =?utf-8?B?S0Z2aE1wdlRCN3FXc1VHR3V6clcyNnFVU3RKN1lsWXpwTTlmTXJwRVRlSUtH?=
 =?utf-8?B?MXlCVnRTSmI2MWFvT1M4ZUxNejBmdjdhZzZUWk13ckpldXhMdlFhY0hRc0c4?=
 =?utf-8?B?L2ZvcE5YQnFKY2gyMVd6b3VzMmE0RGJtc2pHbHFVcGhGZisyZ0JIUCtXeWFP?=
 =?utf-8?B?anJOdmtaNUkyTEQ0cDUwSHVaL2JidFlPcEtUNFJ4UUpCOEtuMFNaWmNndStL?=
 =?utf-8?B?TS80WnN3RWdIU1lDaGVqUHR6aEtxSFpCY2NzZnJsMEEvdldza3d1RkhVTFNm?=
 =?utf-8?B?Sm0zemhjdnRnek9yVWhPY05jQVA5dEhvSE5JeWdQTUJvRGxBSUp4REhUU1RZ?=
 =?utf-8?B?UG9DTnE0cC83S0pSNHNXQW1QSVNKKzJnSU5DdFV6RWhuVHovdEc1NE1xdTdW?=
 =?utf-8?B?THdsYW85N0g4bEpGdUtnWXg5SHBPME14RDNpeDZ0NmZDeEd5dXhkclZsRjRM?=
 =?utf-8?B?VFZUY0MzRTljMWM0WVcwYjhXSUdndkhHTXh4bXJhczBheHZ4ZWRHQ1VjWWF5?=
 =?utf-8?B?eVBlemFOQkZ2MDI0NlBwazVMTUpIUXVSUWxBTVdwMGZCdkNNd3gxNWdiMFNJ?=
 =?utf-8?B?RWJuSGh2emt1Nld1SFlOdEhlYzZtb3ozMHlhZzY5elNDQUhvc09xd1NwQ2F4?=
 =?utf-8?B?VkFORUoyT3lrZGNrL01Qckw0amduMzYzYzYraWRmZER5Wlh1dWZpZHFDU0VK?=
 =?utf-8?B?c25Na3orTDVYRVo3Zi9iaU9kWmdycTFPUUZHMktoL0J0d25UL2plR3BUdGYz?=
 =?utf-8?B?U1lEWlBYTTJVdjRKMndhUFV3WmZUcXBMY2tyMlArWTU4cytoZGtZSU1WSzRE?=
 =?utf-8?B?ZUlVRmc3VGJ1U1BNdVVhcHg2clhYV1J2YitHVUZCOFhnNXZtTitsenpqTUVW?=
 =?utf-8?B?TVEyU1RqWGJ4SGNIRDBjTnA3QnVraXcyVEViWFV3NjZnblFKMVl2QStvcEdD?=
 =?utf-8?B?UVp5VHI5a3NzU0JvK0VnMC9iKzZaODVOejFMQ0U3YXAyQkFySEZMazNGN2oz?=
 =?utf-8?Q?LXu6FJo/f8+ocF6c9ZuQUOQX7?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 39b19fe7-5b50-4822-a196-08dc21d4b1f4
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB8200.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2024 20:47:38.3587 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VM7Zz8G4014d9EejY6L2wPX9Mxu2dtZKLgVesT6agMZTfoVt46f95HZd/q1ZVN4Iodur17TZpS9hH3hYtFb7MA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4549
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



On 2024-01-30 2:28 p.m., Summers, Stuart wrote:
> On Tue, 2024-01-30 at 10:57 -0800, Zhanjun Dong wrote:
>> Expose helper for dss per group. This is a precursor patch to allow
>> for easier iteration through MCR registers and other per-DSS uses.
>>
>> Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_gt_mcr.c      | 40
>> ++++++++++++++++++++++++++++-
>>   drivers/gpu/drm/xe/xe_gt_mcr.h      | 17 ++++++++++++
>>   drivers/gpu/drm/xe/xe_gt_topology.c |  1 -
>>   drivers/gpu/drm/xe/xe_gt_types.h    |  1 +
>>   4 files changed, 57 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_gt_mcr.c
>> b/drivers/gpu/drm/xe/xe_gt_mcr.c
>> index 77925b35cf8d..7cd93bcb811f 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_mcr.c
>> +++ b/drivers/gpu/drm/xe/xe_gt_mcr.c
>> @@ -291,11 +291,16 @@ static void init_steering_mslice(struct xe_gt
>> *gt)
>>          gt->steering[LNCF].instance_target = 0;         /* unused */
>>   }
>>   
>> +int xe_gt_mcr_get_dss_per_group(struct xe_gt *gt)
>> +{
>> +       return gt_to_xe(gt)->info.platform == XE_PVC ? 8 : 4;
>> +}
>> +
>>   static void init_steering_dss(struct xe_gt *gt)
>>   {
>>          unsigned int dss = min(xe_dss_mask_group_ffs(gt-
>>> fuse_topo.g_dss_mask, 0, 0),
>>                                 xe_dss_mask_group_ffs(gt-
>>> fuse_topo.c_dss_mask, 0, 0));
>> -       unsigned int dss_per_grp = gt_to_xe(gt)->info.platform ==
>> XE_PVC ? 8 : 4;
>> +       unsigned int dss_per_grp = xe_gt_mcr_get_dss_per_group(gt);
>>   
>>          gt->steering[DSS].group_target = dss / dss_per_grp;
>>          gt->steering[DSS].instance_target = dss % dss_per_grp;
>> @@ -683,3 +688,36 @@ void xe_gt_mcr_steering_dump(struct xe_gt *gt,
>> struct drm_printer *p)
>>                  }
>>          }
>>   }
>> +
>> +/**
>> + * xe_gt_mcr_get_dss_steering - returns the group/instance steering
>> for a SS
>> + * @gt: GT structure
>> + * @dss: DSS ID to obtain steering for
>> + * @group: pointer to storage for steering group ID
>> + * @instance: pointer to storage for steering instance ID
>> + *
>> + * Returns the steering IDs (via the @group and @instance
>> parameters) that
>> + * correspond to a specific subslice/DSS ID.
>> + */
>> +void xe_gt_mcr_get_dss_steering(struct xe_gt *gt, unsigned int dss,
>> unsigned int *group,
>> +                               unsigned int *instance)
>> +{
>> +       int dss_per_grp = xe_gt_mcr_get_dss_per_group(gt);
>> +
>> +       *group = dss / dss_per_grp;
>> +       *instance = dss % dss_per_grp;
>> +}
>> +
>> +bool xe_gt_mcr_dss_has_subslice(struct xe_gt *gt, int slice, int
>> subslice)
>> +{
>> +       int dss_per_grp = xe_gt_mcr_get_dss_per_group(gt);
>> +       int index = slice * dss_per_grp + subslice;
>> +
>> +       if (index >= XE_MAX_DSS_FUSE_BITS) {
>> +               xe_gt_dbg(gt, "DSS id out of range: slice:%d
>> subslice:%d\n", slice, subslice);
>> +               return false;
>> +       }
>> +
>> +       return test_bit(index, gt->fuse_topo.g_dss_mask) ||
>> +              test_bit(index, gt->fuse_topo.c_dss_mask);
>> +}
>> diff --git a/drivers/gpu/drm/xe/xe_gt_mcr.h
>> b/drivers/gpu/drm/xe/xe_gt_mcr.h
>> index 27ca1bc880a0..7d1eb180befd 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_mcr.h
>> +++ b/drivers/gpu/drm/xe/xe_gt_mcr.h
>> @@ -7,6 +7,7 @@
>>   #define _XE_GT_MCR_H_
>>   
>>   #include "regs/xe_reg_defs.h"
>> +#include "xe_gt_types.h"
>>   
>>   struct drm_printer;
>>   struct xe_gt;
>> @@ -25,5 +26,21 @@ void xe_gt_mcr_multicast_write(struct xe_gt *gt,
>> struct xe_reg_mcr mcr_reg,
>>                                 u32 value);
>>   
>>   void xe_gt_mcr_steering_dump(struct xe_gt *gt, struct drm_printer
>> *p);
>> +int xe_gt_mcr_get_dss_per_group(struct xe_gt *gt);
>> +void xe_gt_mcr_get_dss_steering(struct xe_gt *gt, unsigned int dss,
>> unsigned int *group,
>> +                               unsigned int *instance);
>> +bool xe_gt_mcr_dss_has_subslice(struct xe_gt *gt, int slice, int
>> subslice);
>> +
>> +#define _HAS_SS(gt_, group_, instance_)
> 
> Maybe gt__, group__, instance__
Thanks, that looks better
> 
>> xe_gt_mcr_dss_has_subslice(gt_, group_, instance_)
>> +
>> +/*
>> + * Loop over each subslice/DSS and determine the group and instance
>> IDs that
>> + * should be used to steer MCR accesses toward this DSS.
>> + */
>> +#define for_each_dss_steering(dss_, gt_, group_, instance_) \
>> +       for (dss_ = 0, xe_gt_mcr_get_dss_steering(gt_, 0, &group_,
>> &instance_); \
>> +            dss_ < XE_MAX_DSS_FUSE_BITS; \
>> +            dss_++, xe_gt_mcr_get_dss_steering(gt_, dss_, &group_,
>> &instance_)) \
> 
> I think you're still going to get those checkpatch warnings here.
> 
> Are you planning on addressing that?
The checkpatch complains 6 warnings in about 2 kind of things:
#1. "CHECK:MACRO_ARG_REUSE: Macro argument reuse 'gt_' - possible 
side-effects?"
The warning applies to all 4 aruguments, as they all being reused in 
loop init and loop iteration, this is by purpose and I will accept it.

#2. CHECK:MACRO_ARG_PRECEDENCE: Macro argument 'group_' may be better as 
'(group_)' to avoid precedence issues
Applied to  group_ and instance_

Macro body has unary operator & to get address, it could be fixed by:

#define for_each_dss_steering(dss_, gt_, group_, instance_) \
	for (dss_ = 0, xe_gt_mcr_get_dss_steering(gt_, 0, &(group_), 
&(instance_)); \
	     dss_ < XE_MAX_DSS_FUSE_BITS; \
	     dss_++, xe_gt_mcr_get_dss_steering(gt_, dss_, &(group_), 
&(instance_))) \
		for_each_if(_HAS_SS(gt_, (group_), (instance_)))

I will leaves type #1 but fix type #2, total checkpatch warnings will 
reduced from 6 to 4.

> 
>> +               for_each_if(_HAS_SS(gt_, group_, instance_))
>>   
>>   #endif /* _XE_GT_MCR_H_ */
>> diff --git a/drivers/gpu/drm/xe/xe_gt_topology.c
>> b/drivers/gpu/drm/xe/xe_gt_topology.c
>> index a8d7f272c30a..c4942f2b3775 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_topology.c
>> +++ b/drivers/gpu/drm/xe/xe_gt_topology.c
>> @@ -11,7 +11,6 @@
>>   #include "xe_gt.h"
>>   #include "xe_mmio.h"
>>   
>> -#define XE_MAX_DSS_FUSE_BITS (32 * XE_MAX_DSS_FUSE_REGS)
>>   #define XE_MAX_EU_FUSE_BITS (32 * XE_MAX_EU_FUSE_REGS)
> 
> Honestly I do think these should be in the same file at least. Can you
> move the EU FUSE BITS to xe_gt_types.h too?
> 
> Thanks,
> Stuart
Sure I will move it together.

Regards,
Zhanjun
> 
>>   
>>   static void
>> diff --git a/drivers/gpu/drm/xe/xe_gt_types.h
>> b/drivers/gpu/drm/xe/xe_gt_types.h
>> index 70c615dd1498..b4df7d35dec7 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_types.h
>> +++ b/drivers/gpu/drm/xe/xe_gt_types.h
>> @@ -25,6 +25,7 @@ enum xe_gt_type {
>>   };
>>   
>>   #define XE_MAX_DSS_FUSE_REGS   3
>> +#define XE_MAX_DSS_FUSE_BITS   (32 * XE_MAX_DSS_FUSE_REGS)
>>   #define XE_MAX_EU_FUSE_REGS    1
>>   
>>   typedef unsigned long xe_dss_mask_t[BITS_TO_LONGS(32 *
>> XE_MAX_DSS_FUSE_REGS)];
> 
