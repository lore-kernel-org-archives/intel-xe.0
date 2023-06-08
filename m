Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79A21C7EE25
	for <intel-xe@archiver.kernel.org>; Thu,  8 Jun 2023 08:08:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2318210E22C;
	Thu,  8 Jun 2023 08:08:59 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E87C10E22C
 for <intel-xe@lists.freedesktop.org>; Thu,  8 Jun 2023 08:08:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686211737; x=1717747737;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=R4/8LV9RQxcdTSKSa8H+P/o6V2+IRwhhfL/fh1rE/Cc=;
 b=A1EEeNhMa/UB8+i6raNOrSRVwUmhz2o0RkSEsjSoLhMGNRbWziN6GG0q
 KQs+3wF3n00ml+vDuck024geWpDymPhCdvbJJWbuyCkz/BfXOA/ZBKIMA
 fRzN/bTUiGpYuDHBwKD+U6myG0HOb2IB1WiHVigkn7pS/Y7Q8rnprpjZN
 6Y0ZbQm6n6/eIoxDuByLH2977fOQypPRWpm5YmVbCxwvCKmTZUqGggqyk
 /GvhGM2Nk+8kul7FX7fLRBSKL3JLHbuuEs5gIkOl4q97VCaIqyf0RBXh+
 8iHF/OIB7NvfKMfboCkhUOuwzntk8ox1nxrf9zHA++xGCzu0+9wiyamuC Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10734"; a="356097496"
X-IronPort-AV: E=Sophos;i="6.00,226,1681196400"; d="scan'208";a="356097496"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2023 01:08:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10734"; a="687295149"
X-IronPort-AV: E=Sophos;i="6.00,226,1681196400"; d="scan'208";a="687295149"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga006.jf.intel.com with ESMTP; 08 Jun 2023 01:08:50 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 8 Jun 2023 01:08:50 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 8 Jun 2023 01:08:49 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 8 Jun 2023 01:08:49 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 8 Jun 2023 01:08:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eTDjQz4Dv0v2zxftQ1A/JvfvBnIxyZoRtxhjLYVRFeTPisgapJ01ufP8ekkUXzd04VK8avshH9Cyv8lLFVAkowpSYNAz+K1v3/LGWhioWOkJ0+IOwKv6FX+57tg9lXWj7nihxtBLyxl3pp80SYzhbqODQG+TP1Ym5S5oSN4yjPTPV+Eby4xP9l1kTFLs4FHpeYc0tre5a3Qn+w3HCdUz3GINFtUtssqfidZZYYC419Jy3MdhxTpjoZSShW1fT9URbpptvKkjZT9ecZhB/CNNFj+Ni7Msw/eTqCHmO/JrDuM7nrt2xUEMHrcYtDTIAGCZWUUzaID/YYJScPjUp1a4SA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uxyQ0j6r5HXcqiozLDjkAVoLtf3g9iKQd+pT/ykD1/Q=;
 b=dBvbOya+JUiS21vY6/j2j5eyHL7hdIV6FD902ViHV3pa08a3pdRwF2g48AS7gB9kjknygChbo6DBtmsnVRTcbVfIuv1yYk8FLOZOqCwlIZxww8N/ECe4Oy0VzBCDuUvYa5te4jDiKRHWsUbH2K1BfkROC+P0deIPAdyRHG0ShGACSM44GhMJGEIff62M+wn8sgGqI5az7qzQo423tAOGB9i5rHaO2/98a9Lqof1mp0DXQ4xcYlYtncGw1Qptp+QshLv1Z2EaC6FKF/u/42AJ69Pq8zu+V5A8Q+COLFJ9IsZ1tiu0O6mWa81uJ3m6PjplNiDgUFX+isp8ZJ2/NOsKzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5474.namprd11.prod.outlook.com (2603:10b6:610:d5::8)
 by IA0PR11MB7792.namprd11.prod.outlook.com (2603:10b6:208:409::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.38; Thu, 8 Jun
 2023 08:08:47 +0000
Received: from CH0PR11MB5474.namprd11.prod.outlook.com
 ([fe80::6082:8da2:e39:aeff]) by CH0PR11MB5474.namprd11.prod.outlook.com
 ([fe80::6082:8da2:e39:aeff%4]) with mapi id 15.20.6455.030; Thu, 8 Jun 2023
 08:08:47 +0000
Message-ID: <b9559298-24e4-49d0-f59c-7023cc55f0fb@intel.com>
Date: Thu, 8 Jun 2023 13:38:37 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.11.2
Content-Language: en-US
To: Tejas Upadhyay <tejas.upadhyay@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20230608074544.2186318-1-tejas.upadhyay@intel.com>
 <20230608074544.2186318-2-tejas.upadhyay@intel.com>
From: "Iddamsetty, Aravind" <aravind.iddamsetty@intel.com>
In-Reply-To: <20230608074544.2186318-2-tejas.upadhyay@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0104.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:9b::6) To CH0PR11MB5474.namprd11.prod.outlook.com
 (2603:10b6:610:d5::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5474:EE_|IA0PR11MB7792:EE_
X-MS-Office365-Filtering-Correlation-Id: b0add916-e724-4585-6d4e-08db67f795b8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OeEFSL1YK/eWSG032sxkfHn4N6clNryeBdyWNWOC4BFEcoxIxod69UOBSHwrGskXIFSgio3hi73LhMc5rSUVMCe5M3l8Woqg4JN7N1G0RTfZAC2BorquWgoencw5NZsjwnWyLaP+eQvmrPgu8vk+j9tZCmCFY1mnXPsdQscQ7Pj9xiTKrJ86gwm0YWKVRdmLvavN1W54Kqvhh75+V1ZcbLbLtttZ75Mq+7q4XgA+ZXHR4gs4Bv+liK9beQ1WNfOn8O4LnM3nZ9Ugyn3rV2GubT6ynyMoZ0leT3UDbCxo9c7C0ADAq7hpU1DDyaH/xFqIzdn3jaB5QohIhvMSpl105mYhStX5xJrL4eMaqSWvHOSDT8JqZwg3dBLD7s+AdPKXR6NWa7BX7P3y1xiH45kWu3YQ1mH8VA07ZnNiEvGMvJsLNGAq5qt3CoVL9JCKP8XbxGityWeyWc41Hn8lOjetUniEplS3bPQ45193hjOf0Fjma9LHYmrHyil6185vSk9aZpiQ2VkIFkrKavrr81KslCwxu+CQlStKsh/ni87peL/h4dgWY8S7zlAY34LTbWH6r1YJXrMsYxA2eB+6j5m8RmoeV2APVLwz0yK0/plwoUa+yxdHgpsqsbyMMeKWBYy2uthUpLwlIPxLlYbKyj1jIg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5474.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(346002)(366004)(136003)(376002)(39860400002)(451199021)(6666004)(2906002)(6486002)(36756003)(66556008)(66946007)(6506007)(6512007)(53546011)(66899021)(31686004)(41300700001)(66476007)(478600001)(26005)(186003)(316002)(2616005)(5660300002)(31696002)(86362001)(82960400001)(38100700002)(8676002)(8936002)(83380400001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aDFucXV4dUhxeHpvbjdiWnFMN1dURE11QytXT3lwTGhPV0IvTUIrMXVGcGs4?=
 =?utf-8?B?b3QwWVQzeGVLM3ZQUzVhcmdxOXdIUDdNbW5DNzg4VGZGeVQ0NFRJeS9GSnVz?=
 =?utf-8?B?ejRRT0Vqb1R6KzFNT0FvQitqYTg5ZGFYT1JoUkRUbEIvTWVaNXhiTmRpWEVx?=
 =?utf-8?B?clMzUDRnbDFxMUpVM3o2KzFoeEFNaldQZGNXb0xOT1hUQ09zenlEM1A1MDhj?=
 =?utf-8?B?aHVQN2JsT2s1UFJVOHh3aFhGOUJ3WnhCdnBMWUYrS2pVYUt2eHozZURUbGZJ?=
 =?utf-8?B?ZDFOTkxpVWVSYkxxa3R2aXI1Ui9QYjAzNGJZcG0zZzhPcmp4Wmk2KzcxWUpz?=
 =?utf-8?B?QlJSRVZjQUJyVktNWmlYR1ZoRkUyRTlKZ0psVmovY24yV2FwYVgzWkpuYVBp?=
 =?utf-8?B?dE9jYk9jVmgvYTl3WnlUL3c3U0tONGk4blBSVUoyYnhaRkJEZ0w1SXhrQSs1?=
 =?utf-8?B?RGcrdEFxMlAwVGpWYXVKVVEyMXJXSUF5RXkwSGFxN2pVaDFDWFAwcGdWY2pR?=
 =?utf-8?B?R3c2REM2WTF2Mi92YldwUTNhTldZWnR4VmkrV09NVUhWZVpxTXlCM0U0VjJO?=
 =?utf-8?B?bVF2RVBHNVMrK2tmMnQxV3JFWHVVZkhBV2xQNFJLMWx5MlRmcExXQ0N0SzVN?=
 =?utf-8?B?ZThkQ0ZMclArNVloYWxiZ1hyMW9HQkE5RUsyczhqNzlQMGJZWEk5OEpnYmJR?=
 =?utf-8?B?Ty9acENYT3BCVGNFNFphM1BZS2tIa0N1VjFMZXdNcFd1NDhpS2pNS2JkdFE1?=
 =?utf-8?B?Rmp3V1BYSGh2UGtjRktzY0xDaTZDV2xOZnRuclpFQ3JXZE1tZ09zSXZ0eGNC?=
 =?utf-8?B?ZjBKWjFncjZCRVZ1dThaWDlwMldkUnZuRDJYUXd2MnJyakNiR2FsempvQU5M?=
 =?utf-8?B?QUorU092Znk2ajM3cGE1d01KZkFHNHlqNHpxL05VK2FQSXNJd0FMZlFqdEZn?=
 =?utf-8?B?RWxzU0MzM0toamU0STBidGlNL095eXJ1RDQwYmFNcUpkaDlLRFFxTUlTU2xI?=
 =?utf-8?B?eFBnbVFaZGFYMy9KREFvd2RTZzFSM3ZBN3ZYc0dHbVZvWGVuUDVZcFJBazE3?=
 =?utf-8?B?cmZhU2VKdGIzbVM0d3RyUEsva0N4UDdCOGJvL3QwblVwd1Z2VTF5d09VaGds?=
 =?utf-8?B?Y3NVbCtBRzlNQjNVQmVyZDN1c1ZvT1BYQ2NyRnNMdGtmUnhIVDVUcEs5L1Rr?=
 =?utf-8?B?aUdIUU10Z1NmSGVmclgrQnVYbmMySFhyaDJCL2llV3laRGxiVzloRjdRZzN2?=
 =?utf-8?B?OE1ZcC8rZVZ5VU1ISGpDZXZlZDIzL1lqM21Sc1hyemxEdVprT2hFZXZOZVVZ?=
 =?utf-8?B?b2p5Y2pDcXprSDJwWEJmOVVSMDhVT2FjY1M3RnJqTU9MUys3azNSMi9JbktC?=
 =?utf-8?B?c3FNYi9teERHR2owbHRSWitEelM4Sjh4bEo2ZkJubjFkbm9qRVRGczJGemY2?=
 =?utf-8?B?VFJJSTVjcllsWEUxbm0wWG1LTmIybEsvazBGTFNwOFNHOGFlNjZlUk1YOHFn?=
 =?utf-8?B?Z2EvRnNiQWFrZmpWZlhPVWQ4SGtxMmJlMWtUWHMxYXpYTzJTTGU1dGZnRHNS?=
 =?utf-8?B?cDFiclVhSGdKQXlUbSt2Y3N6K2VXTzBFUEhlVml0MlgrRGNFV0pXOGlrUmI1?=
 =?utf-8?B?U1dWRlZUZUxoTVZqUkxyL3g5bzBLVlhaTHRJNVNjakJvaGM0bngrckpGZDVC?=
 =?utf-8?B?aTU4NHQvRFN2bzNNZVk0cWJjUzRORU9BR0xwY3llTTZvcE11UklPRTJUbkIz?=
 =?utf-8?B?NHI2WDIwdmNydlcwSEt3ZzI4NTFVa3daRW1kTHNiZHlHNlQvT0l5djN1L1do?=
 =?utf-8?B?ZEJGc3ZwUGRsQVhwb25STzh2WTgwRisvbi9YNmYxU3RHd3pPUzlPSmNQT1or?=
 =?utf-8?B?VXNBb2czdVZhc2ZkSDVTVDBCTmZkMjQwT0dvdHllS1FxMEpiTTZLbldTTTkw?=
 =?utf-8?B?Y3QyMkNKWWVzVHVXUFE4NE1NUjRtNzZEQWtGVkhVdlB6dFNHVmVHNWQydHI2?=
 =?utf-8?B?bkEyZHNwQ2JHU3d6N3lzcXNROEZGVHB2L3FTSzA1NkdYZkdLcDB6dWxaYWZx?=
 =?utf-8?B?anRETFNlVmJ4d01vZHZXYjFZM0lrSWhhWmZkM1VURTJibWxQZmFwSzlBUUV6?=
 =?utf-8?B?L3dWdGhEV3BhbzYyRDlNdmdoMHBNeG02U2Vmam5NREJtWDBRRGhMT0xlRHhS?=
 =?utf-8?B?eWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b0add916-e724-4585-6d4e-08db67f795b8
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5474.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2023 08:08:47.2673 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CY7oWW6Bt8QKrSV5zOFzm+u5MoKNskloCbCyUP3t1NEUVjGnwuqFdRCCEDoO8rP8eWcerN0hlBcFwAwP2Pc+4wvy2f2Hoq7xaPjt2x6DR38=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7792
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH V3 1/3] drm/xe: Add sysfs entry for tile
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



On 08-06-2023 13:15, Tejas Upadhyay wrote:
> We have recently introduced tile for each gpu,
> so lets add sysfs entry per tile for userspace
> to provide required information specific to tile.
> 
> V3:
>   - Make API to return void and add drm_warn - Aravind
> V2:
>   - Add logs in failure path
> 
> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> ---
>  drivers/gpu/drm/xe/Makefile              |  1 +
>  drivers/gpu/drm/xe/xe_device_types.h     |  3 ++
>  drivers/gpu/drm/xe/xe_tile.c             |  3 ++
>  drivers/gpu/drm/xe/xe_tile.h             |  2 +
>  drivers/gpu/drm/xe/xe_tile_sysfs.c       | 61 ++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_tile_sysfs.h       | 19 ++++++++
>  drivers/gpu/drm/xe/xe_tile_sysfs_types.h | 27 +++++++++++
>  7 files changed, 116 insertions(+)
>  create mode 100644 drivers/gpu/drm/xe/xe_tile_sysfs.c
>  create mode 100644 drivers/gpu/drm/xe/xe_tile_sysfs.h
>  create mode 100644 drivers/gpu/drm/xe/xe_tile_sysfs_types.h
> 
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index f34d4bdd510b..41a6c0d0dee7 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -98,6 +98,7 @@ xe-y += xe_bb.o \
>  	xe_step.o \
>  	xe_sync.o \
>  	xe_tile.o \
> +	xe_tile_sysfs.o \
>  	xe_trace.o \
>  	xe_ttm_sys_mgr.o \
>  	xe_ttm_stolen_mgr.o \
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 17b6b1cc5adb..db61da4d6212 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -150,6 +150,9 @@ struct xe_tile {
>  
>  	/** @migrate: Migration helper for vram blits and clearing */
>  	struct xe_migrate *migrate;
> +
> +	/** @sysfs: sysfs' kobj used by xe_tile_sysfs */
> +	struct kobject *sysfs;
>  };
>  
>  /**
> diff --git a/drivers/gpu/drm/xe/xe_tile.c b/drivers/gpu/drm/xe/xe_tile.c
> index 6414aa810355..ac70486d09c3 100644
> --- a/drivers/gpu/drm/xe/xe_tile.c
> +++ b/drivers/gpu/drm/xe/xe_tile.c
> @@ -10,6 +10,7 @@
>  #include "xe_migrate.h"
>  #include "xe_sa.h"
>  #include "xe_tile.h"
> +#include "xe_tile_sysfs.h"
>  #include "xe_ttm_vram_mgr.h"
>  
>  /**
> @@ -142,6 +143,8 @@ int xe_tile_init_noalloc(struct xe_tile *tile)
>  	if (IS_ERR(tile->mem.kernel_bb_pool))
>  		err = PTR_ERR(tile->mem.kernel_bb_pool);
>  
> +	xe_tile_sysfs_init(tile);
> +
>  err_mem_access:
>  	xe_device_mem_access_put(tile_to_xe(tile));
>  	return err;
> diff --git a/drivers/gpu/drm/xe/xe_tile.h b/drivers/gpu/drm/xe/xe_tile.h
> index 33bf41292195..782c47f8bd45 100644
> --- a/drivers/gpu/drm/xe/xe_tile.h
> +++ b/drivers/gpu/drm/xe/xe_tile.h
> @@ -6,6 +6,8 @@
>  #ifndef _XE_TILE_H_
>  #define _XE_TILE_H_
>  
> +#include "xe_device_types.h"

is this needed here?
> +
>  struct xe_tile;
>  
>  int xe_tile_alloc(struct xe_tile *tile);
> diff --git a/drivers/gpu/drm/xe/xe_tile_sysfs.c b/drivers/gpu/drm/xe/xe_tile_sysfs.c
> new file mode 100644
> index 000000000000..5c9ebe40e3c3
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_tile_sysfs.c
> @@ -0,0 +1,61 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2023 Intel Corporation
> + */
> +
> +#include "xe_tile_sysfs.h"
> +
> +#include <linux/kobject.h>
> +#include <linux/sysfs.h>
> +
> +#include <drm/drm_managed.h>
> +
> +#include "xe_tile.h"

the headers are not properly aligned the local headers should follow the
standard.

> +
> +static void xe_tile_sysfs_kobj_release(struct kobject *kobj)
> +{
> +	kfree(kobj);
> +}
> +
> +static struct kobj_type xe_tile_sysfs_kobj_type = {
> +	.release = xe_tile_sysfs_kobj_release,
> +	.sysfs_ops = &kobj_sysfs_ops,
> +};
> +
> +static void tile_sysfs_fini(struct drm_device *drm, void *arg)
> +{
> +	struct xe_tile *tile = arg;
> +
> +	kobject_put(tile->sysfs);
> +}
> +
> +void xe_tile_sysfs_init(struct xe_tile *tile)
> +{
> +	struct xe_device *xe = tile_to_xe(tile);
> +	struct device *dev = xe->drm.dev;
> +	struct kobj_tile *kt;
> +	int err;
> +
> +	kt = kzalloc(sizeof(*kt), GFP_KERNEL);
> +	if (!kt)
> +		return;
> +
> +	kobject_init(&kt->base, &xe_tile_sysfs_kobj_type);
> +	kt->tile = tile;
> +
> +	err = kobject_add(&kt->base, &dev->kobj, "tile%d", tile->id);
> +	if (err) {
> +		kobject_put(&kt->base);
> +		drm_warn(&xe->drm, "failed to register TILE sysfs directory, err: %d\n", err);
> +		return;
> +	}
> +
> +	tile->sysfs = &kt->base;
> +
> +	err = drmm_add_action_or_reset(&xe->drm, tile_sysfs_fini, tile);
> +	if (err) {
> +		drm_warn(&xe->drm, "%s: drmm_add_action_or_reset failed, err: %d\n",
> +			 __func__, err);
> +		return;
> +	}
> +}
> diff --git a/drivers/gpu/drm/xe/xe_tile_sysfs.h b/drivers/gpu/drm/xe/xe_tile_sysfs.h
> new file mode 100644
> index 000000000000..e4f065039eba
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_tile_sysfs.h
> @@ -0,0 +1,19 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2023 Intel Corporation
> + */
> +
> +#ifndef _XE_TILE_SYSFS_H_
> +#define _XE_TILE_SYSFS_H_
> +
> +#include "xe_tile_sysfs_types.h"
> +
> +void xe_tile_sysfs_init(struct xe_tile *tile);
> +
> +static inline struct xe_tile *
> +kobj_to_tile(struct kobject *kobj)
> +{
> +	return container_of(kobj, struct kobj_tile, base)->tile;
> +}
> +
> +#endif /* _XE_TILE_SYSFS_H_ */
> diff --git a/drivers/gpu/drm/xe/xe_tile_sysfs_types.h b/drivers/gpu/drm/xe/xe_tile_sysfs_types.h
> new file mode 100644
> index 000000000000..75906ba11a9e
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_tile_sysfs_types.h
> @@ -0,0 +1,27 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2023 Intel Corporation
> + */
> +
> +#ifndef _XE_TILE_SYSFS_TYPES_H_
> +#define _XE_TILE_SYSFS_TYPES_H_
> +
> +#include <linux/kobject.h>
> +
> +struct xe_tile;
> +
> +/**
> + * struct kobj_tile - A tile's kobject struct that connects the kobject
> + * and the TILE
> + *
> + * When dealing with multiple TILEs, this struct helps to understand which
> + * TILE needs to be addressed on a given sysfs call.
> + */
> +struct kobj_tile {
> +	/** @base: The actual kobject */
> +	struct kobject base;
> +	/** @tile: A pointer to the tile itself */
> +	struct xe_tile *tile;
> +};
> +
> +#endif	/* _XE_TILE_SYSFS_TYPES_H_ */
Reviewed-by: Aravind Iddamsetty <aravind.iddamsetty@intel.com>

Thanks,
Aravind.
