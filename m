Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7086F10FCAF0
	for <intel-xe@archiver.kernel.org>; Wed,  1 Apr 2026 22:11:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 355A110ED1E;
	Wed,  1 Apr 2026 22:11:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="l8IbvZFO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71C4610ED1E
 for <intel-xe@lists.freedesktop.org>; Wed,  1 Apr 2026 22:11:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775081503; x=1806617503;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=Cfg+HQW9J5FN+a3QLwMZkuYcYmsMkfRTmPXKF9Fr2Eg=;
 b=l8IbvZFO4qvQq58eEp2ysuVfXyO5PDkeyKMIOS5r0DiILGBcqIhTc30f
 el5LbQyk2HBts7KxktEQpmdKHZ45GBqxus2MateSW0ZbTmf0Z6AxvbsRl
 WiLJaCRF9t9msIXTZIXRl5yqrN3IgDqjIe2M2a7Q1NFIT2sbLnmy6tC5D
 zHFppxR5w73ghVL7EXs8n/CCp6oBypw6epITAFGeYcjbe1gD5QkhCklLp
 kkorBhx+mqlnsXHTCWuVx/mgzq02iKlc8Oe3bryhMAWiL8i1Ey/NsGZ4G
 O9iGlpqL04oGJeM4Y0qfo3t2Hxewyp08Ds1wJzvIMIu7kVumLQvpCRxzt A==;
X-CSE-ConnectionGUID: zO4ZYbPyRymlm0rID023ow==
X-CSE-MsgGUID: XOhBYqleTSGp9TVzGx/n2Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11746"; a="101583307"
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; d="scan'208";a="101583307"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2026 15:11:43 -0700
X-CSE-ConnectionGUID: iqWQQXBKRImv1gUwS0Pffw==
X-CSE-MsgGUID: HBD9QUdSTNylq2vZS140HA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; d="scan'208";a="221952307"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2026 15:11:43 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 1 Apr 2026 15:11:42 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 1 Apr 2026 15:11:42 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.61) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 1 Apr 2026 15:11:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g3m0jThrzA4OjKhbgmuuAnswx9eD6K3QJ+XDghazmJeNMX7npYD1rg6NnupP6zA8mOUjNLIKqBgtScIfgsbNRrm+9NAaNwlZ/41ltUsZyhxrnfyymzcmzkNMyv2o6UphXPE8e4oObwUx4RjhP3KZJ85pVUYZ4L3qtXnlvRVmo2axWP3tocnFtt8+2Y2QZFgheRj5TpDM9w5V48QOUodMxdvu4y7W7ahMs5eEV9VD8eLdQGpVPawurBC72Jl1jrzKHddBV7evzcEGiXfqVRiyVlU7xAxroOmcFoeSPLkT87vaBbA4WQZAcCZJxZRyC8EaB71P+IqhWVHduikVB4X/KA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y94yqlCXvFYI+sSFKBlf2kjMDtIHi4rTGR6WzEhBTwE=;
 b=lP8hkcmj8XalBloP/uusZgew8khA/hdXDl762tLUq8sRuK45lRezbgV1UUfws/VkJEp93DFWECTcmZLQ5omFOV7j5eqVRlz/+ZIQMcRUWWZTdmWwcfWxik0ZMimEoc49/krZdCfAX230uB6oy1z0xf3nW7kfO7PnKB+xWKwdhbF2AFPEDVLiw25uoYe/nTbh+I47SuLSMkh3XmRPPgIdtydcBGUxjFViz5JZVKzWKyYixDbgjenbUY7vCfiu6oB9/v8O9lUz3I6IlJypPwUS4Gj5atgkJIlfTNnhShJzDY6Hdu8dTNBj3EpNSwnvLYMK+gT+Qzk1O4fMQj9qCvuRWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by DSVPR11MB9693.namprd11.prod.outlook.com (2603:10b6:8:34c::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Wed, 1 Apr
 2026 22:11:40 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::53c9:f6c2:ffa5:3cb5]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::53c9:f6c2:ffa5:3cb5%7]) with mapi id 15.20.9769.016; Wed, 1 Apr 2026
 22:11:40 +0000
Date: Wed, 1 Apr 2026 15:11:36 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <thomas.hellstrom@linux.intel.com>,
 <stuart.summers@intel.com>, <arvind.yadav@intel.com>,
 <tejas.upadhyay@intel.com>
Subject: Re: [RFC 08/15] drm/xe: Implement xe_access_counter_queue_work
Message-ID: <ac2YGL1CsM3TXeyT@gsse-cloud1.jf.intel.com>
References: <20260318074456.2839499-1-himal.prasad.ghimiray@intel.com>
 <20260318074456.2839499-9-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260318074456.2839499-9-himal.prasad.ghimiray@intel.com>
X-ClientProxiedBy: MW4PR03CA0223.namprd03.prod.outlook.com
 (2603:10b6:303:b9::18) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|DSVPR11MB9693:EE_
X-MS-Office365-Filtering-Correlation-Id: 8027bbcd-2377-485a-57d5-08de903ba673
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|56012099003|22082099003|18002099003; 
X-Microsoft-Antispam-Message-Info: bsHAzkcW4ZOYvu3u8mKDMcZAssejvbxi2qtLMKiZQsGi6Y9r2zTdpmxR+PernnEUrwHpG7R50E78yXuxJ5qpvIMs10wzSpMHoi0dLPD0iG48r1ve0R31NG0HoctOhxCy11yuzws8f9lArjTZ+xnQMcwsN1x2S/k6mGjWp5SRBlpbMnQwtascI2ojFOlK8xASDAzWUyvIQgKovwtcK1NrLy1/ObFmrXL94BK3YYc7P9I8paNot+68MVRfpmMLg5klfLVdiJl9I+ipauUjtF5gk1OvfB4XAmtf+jDjwPGNk1PxHGWlIFUl48ms4L/yD+AYLuD+C55XCApzstbp241BVAUT+hGuZRKOMLXJM4sR1mFrg9GwItdwzvHBbvxKoDN92SFqYIuuqDmpnw9LK1Zq8Ur9rfhhUxwbGHcjTn3aSF4P4e7IW9t8s3vH2SLhasKBalacF935o3l3rlZW3ViMtod8enRKhrs9OZ/aHNvSS/hgKCO+dqHMqmSkG2fN9dh4HefFBKP166+cwCyGw8dIT2ecNzD5tFfjaNqJSQbwRM0M46mCFZ8YcKg0PN0wQETjRQT60PhlA+nzv9hei8Z0Z31hOxeaahlHtzX3GWDhJBRsfvGOuwj87gEs+Id2+cSeZmTVyzFQfbb9aP4bXLQVaeIqYYD7JNyH5cvauxJFMwofyTWhn5Jq0SPlQxvmznuoBjhgmEK4/lvtoAcUnrPeICsaCgdtVEFkCb2FDjDVOqY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(56012099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T3VRaUd3V3RLTThZblBoYmNXQlM0V3ZBR21ya3ZNQm5tZ0hENkhDajVoR2lu?=
 =?utf-8?B?ZDZTazRtTHZxVWpDQkVrQktGTFJNV1kyOEwwYlNWNkdFUjBpRjRFQUp5Z0hY?=
 =?utf-8?B?Y1lWYTFIU2g1V0wyeDdzeTF4WHllM214TmRMc29QNjgwSEtMblBqeDIvZHdO?=
 =?utf-8?B?VStNaTBFMy9xRDZPU2lNZnJ4MUUwMHhmRXBPMGx5ZllYdEhweUR0MmY0amo4?=
 =?utf-8?B?aDEvNDAza3k3cldVczc1cVdwaHdIWUhLUGUvN0xPQnZjUGo0dmEzQThTNkkv?=
 =?utf-8?B?dWg0dkdsZmEzR3B2Wmk1UEx5Z1BGcWVBN3dKZ3EzMDR2UEJsVnk3RGRPSXBW?=
 =?utf-8?B?UHJYNGtTMXo4NVpMZWszU25ORjlFT2hQbEIvYjZheWJwMnNMOWhSR1ZORmRK?=
 =?utf-8?B?Z2VXblN3MWVxN3hXbnVXd3d6dnMzcjZqOWtUTVVXT29GQTE2TzlLVGNQZ1VX?=
 =?utf-8?B?M1U4Smg5VDZkYzMyZk5NWlN6Um9oa3pQczkxZmdpRzd1eG5icnJtc3daVmVR?=
 =?utf-8?B?a21jbldMc2dwVUYyeEsvd1BuVW8zSXhFckVnQ1V6VWJYbE51d1prWWFUWDRO?=
 =?utf-8?B?cWdnWWxpUE1ncy9GRStJRUZmUGdGZk9iYlVEck5mTmFNMWMxY3BsdVhhQURs?=
 =?utf-8?B?MitDQXJGd3JhaTIvYm4vRVdwRngxcUVHellDL0Z4NEhGVzl4bVBVMzd0Z1lx?=
 =?utf-8?B?amN5NWprOUJzY1JWUEVqNzhxTXNPL00wZXZWMjhFQVlYbk9RdW52L2FtM2lE?=
 =?utf-8?B?NFIrOWxxRDdYZ0RzSURHNGN6TnFQUFpmd2xFb2ZESm1vWEdkYXZSdXhmSUNI?=
 =?utf-8?B?RDltL3ZsL2s1bHNGRkw5NXVMWW9hV3ltWitRZGd3OFNXTStIbW9TNmt1VmFz?=
 =?utf-8?B?T1l0Z015UElYdUdTVTJONlNDa1RJRExWVXlnMUx1NG84amdDTkQvNnZzZzJR?=
 =?utf-8?B?Ly9WckQvZThuZWtEVm9UTm5DTFFoR09wTlVvbHphYnNJUGtOcEdKSWJxQWw0?=
 =?utf-8?B?ODBNUExEOFVPbnYzTSt1ZXoxSVg4MVJ5L1VwZTgzVHRiYnJ3UXpuSm5VSVk4?=
 =?utf-8?B?V3NDeWlDTFNiek1HMERJNVFPbU10dGR6NzVCNGg2aXRGRGhyUnhUWEJrRDN3?=
 =?utf-8?B?cEFZSUpJQWQwS09aNkxLS2J6MTRPQzV1QWpROXNranQxNzV5Z1Awdk0rTHdU?=
 =?utf-8?B?ZVJZVHpxMmpGZkliT3lkV2txL1lKYm5CU2ZiQWRNNGIyVUVrVXNid1Y2cDNC?=
 =?utf-8?B?MVMwV3RGRFV5ZXBWMG5Dak1Ia1ZWMzNNcFRqbG1IRGhudElhU2RQYnJ2OTBM?=
 =?utf-8?B?T21CVS9HNmk5YldTSlN2WmFMampRci9qaXA5dmtUYnhTYWlhbk0rakxCYTFE?=
 =?utf-8?B?ZFY4NlF6Mko4T2ExSm00TjIyY3JBaGMvKzZrRldERWNDQjBGSHBKSlZKOXIx?=
 =?utf-8?B?ZWhSS1A4cndNaEtXbE1CN1dWUk5lNUlJZUU4UEhyanJ6UXpMWmJKMGdsa0kx?=
 =?utf-8?B?K2JwY3RVQ1d3cThBMzlTbnhSeC95MFJkT3VXb1BDSE80bmZuUVJaajNiUjhS?=
 =?utf-8?B?eWhDVEg1QlBENEhZU3BUT0RWNnJFMXZNS2c4bWNDbXFmR1ViRFZNUjd2NU82?=
 =?utf-8?B?b25TZS81NjlJV1J6aWpQK0IzNzRJUXduTTJBZ2ZETk8rbUJwbjdvNWFFSmJP?=
 =?utf-8?B?M1JTTjBzVFZVL0w1RDNUQ2JlRG1DKzRBMkRJOEZwdjc1RHZHdmJvR0xYZmdL?=
 =?utf-8?B?S1o1VjFETG5weFVpbm9GOWRmU2ZHa3RJS296WldnV044SVdIUkFmc3ZWOEVH?=
 =?utf-8?B?SFJoa1ZOUWhlWUp3ZUxqMmJnaUVmbnp5SjF2NkFZWDMxN05oTkRadHduTGJQ?=
 =?utf-8?B?YWkweURwckJqejZ1eFFhMzNnb2JtaFhZMDUyQXlUNTVjSHNxTzM3d29Rc3R6?=
 =?utf-8?B?N09haitWRDBsRzY4NkNSSng2REpiTjU4YUNnSVZLSEpoWUQrcmRnYTRpbWsw?=
 =?utf-8?B?d3Q5aUVVY1JsY2tMemwxMGlkcGoyNTR3K1FYY3RhRmF5V0tDYjV5RHN6ZVIr?=
 =?utf-8?B?TE9MdGxBbi84Wjk3c3RoeVNVMEFNRDZZZFFkcnNmd1V1Y01jOG5sRExmbnBs?=
 =?utf-8?B?ZlQ4a2g1NFNYT0ZBVTRRekVHYmQzK0pnaWd5L0pwU1p6d0xIMy9MbUs2WWhF?=
 =?utf-8?B?Z3I2b1JXOWZHclBhcStkK3dRS2ZCNGMwN210bjgyd3dZTkVuWDhmbXcwbGJ2?=
 =?utf-8?B?TC8xNjJxamJWb1lURVFkMml2OUVpdEwxcDdJQWtDeXQrVmhOckloc2c3ZW9o?=
 =?utf-8?B?ZllrdlkzYklBWG5na3lqSFErendQWFpRdW01ZHduU0I1S1hNZGtsNlZHdy9Q?=
 =?utf-8?Q?9phURCKicrsiPnRU=3D?=
X-Exchange-RoutingPolicyChecked: qBSfuyp0yyLQtQe3gQs0SeHAa7jBSXvAcZ2GzDTGImqO0udiJ4opgXCdpd2nQBwA+1DQX/uXRAMl1lnkyFbuN9jMNNPZ+K+VGLeJfqN7SWSxEFFFPEz3itKmNHQXTO5Fqeqs/6tDaX5ScJw1JYgkwYNMa96gy8Ted5an9XlyE1y9tx7K0MfTg4m2wRmG9QXA3FimhLh4jMbpvzkRIeuB0z5f4hTOvBu7qvl6d4jVgIHhYVmlPXrvfPWvo1hVmhfzQ0wMFbE3IoAs3KireytEVFCovnD0hvqOipbmMvApNsS7FWPBN3XRJjorJWSVW2EZd5nYF3lAcYOF7oGvoykEkA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 8027bbcd-2377-485a-57d5-08de903ba673
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2026 22:11:40.4982 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qXDrq2IaHpuUJLVvOU1rTIa91/E4yPRD3ldVPIby6hMvMWMt6Cs7wyn8pMu31dLkQc75uo0yxtbsGHglm+Vmug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSVPR11MB9693
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

On Wed, Mar 18, 2026 at 01:14:49PM +0530, Himal Prasad Ghimiray wrote:
> Implement worker function to dequeue and process access counter
> notifications and migrate bo based vma to vram and rebind it.
> 
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_access_counter.c | 139 ++++++++++++++++++++++++-
>  1 file changed, 138 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_access_counter.c b/drivers/gpu/drm/xe/xe_access_counter.c
> index a2ce9dc45d05..9eb9917d8da7 100644
> --- a/drivers/gpu/drm/xe/xe_access_counter.c
> +++ b/drivers/gpu/drm/xe/xe_access_counter.c
> @@ -11,7 +11,10 @@
>  #include "xe_access_counter.h"
>  #include "xe_access_counter_types.h"
>  #include "xe_device.h"
> +#include "xe_gt_printk.h"
> +#include "xe_hw_engine.h"
>  #include "xe_usm_queue.h"
> +#include "xe_vm.h"
>  
>  /**
>   * DOC: Xe access counters
> @@ -33,9 +36,143 @@ static int xe_access_counter_entry_size(void)
>  	return roundup_pow_of_two(sizeof(struct xe_access_counter));
>  }
>  
> +static int xe_access_counter_sub_granularity_in_byte(int val)
> +{
> +	return xe_access_counter_granularity_in_byte(val) / 32;
> +}
> +
> +static struct xe_vma *xe_access_counter_get_vma(struct xe_vm *vm,
> +						struct xe_access_counter *ac)
> +{
> +	u64 page_va;
> +
> +	if (ac->consumer.granularity != XE_ACCESS_COUNTER_GRANULARITY_128K) {
> +		page_va = ac->consumer.va_range_base;
> +	} else {
> +		page_va = ac->consumer.va_range_base +
> +			  (ffs(ac->consumer.sub_granularity) - 1) *
> +			  xe_access_counter_sub_granularity_in_byte(ac->consumer.granularity);
> +	}
> +
> +	return xe_vm_find_overlapping_vma(vm, page_va, SZ_4K);
> +}
> +
> +static void xe_access_counter_print(struct xe_access_counter *ac)
> +{
> +	xe_gt_dbg(ac->gt, "\n\tASID: %d\n"
> +		  "\tVA Range Base: 0x%08x%08x\n"
> +		  "\tCounter Type: %d\n"
> +		  "\tGranularity: %d\n"
> +		  "\tSub-Granularity: 0x%08x\n"
> +		  "\tEngineClass: %d %s\n"
> +		  "\tEngineInstance: %d\n",
> +		  ac->consumer.xe3.asid,
> +		  upper_32_bits(ac->consumer.va_range_base),
> +		  lower_32_bits(ac->consumer.va_range_base),
> +		  ac->consumer.counter_type,
> +		  ac->consumer.granularity,
> +		  ac->consumer.sub_granularity,
> +		  ac->consumer.xe3.engine_class,
> +		  xe_hw_engine_class_to_str(ac->consumer.xe3.engine_class),
> +		  ac->consumer.xe3.engine_instance);
> +}
> +
> +static int xe_access_counter_service(struct xe_access_counter *ac)
> +{
> +	struct xe_gt *gt = ac->gt;
> +	struct xe_device *xe = gt_to_xe(gt);
> +	struct xe_tile *tile = gt_to_tile(gt);
> +	struct xe_validation_ctx ctx;
> +	struct drm_exec exec;
> +	struct dma_fence *fence;
> +	struct xe_vm *vm;
> +	struct xe_vma *vma;
> +	int err = 0;
> +
> +	if (ac->consumer.counter_type > XE_ACCESS_COUNTER_TYPE_NOTIFY)
> +		return -EINVAL;
> +
> +	vm = xe_device_asid_to_fault_vm(xe, ac->consumer.xe3.asid);
> +	if (IS_ERR(vm))
> +		return PTR_ERR(vm);
> +
> +	down_write(&vm->lock);
> +
> +	if (xe_vm_is_closed(vm)) {
> +		err = -ENOENT;
> +		goto unlock_vm;
> +	}
> +	/* Lookup VMA */
> +	vma = xe_access_counter_get_vma(vm, ac);
> +	if (!vma) {
> +		err = -EINVAL;
> +		goto unlock_vm;
> +	}
> +
> +	/* TODO: Handle svm vma's  */

One last thought — this might be the point where it actually makes sense
to support userptrs that migrate to VRAM. We basically have everything
in place to do this. It may be out of scope for this series, but it
seems like a good time to implement it here and perhaps update the
prefetch uAPI to move userptrs to VRAM as well.

SVM less concerned here as those should basically always be in VRAM
unless an app is racing CPU / GPU access.

Matt 

> +	if (xe_vma_has_no_bo(vma))
> +		goto unlock_vm;
> +
> +	/* Lock VM and BOs dma-resv */
> +	xe_validation_ctx_init(&ctx, &vm->xe->val, &exec, (struct xe_val_flags) {});
> +	drm_exec_until_all_locked(&exec) {
> +		err = xe_vma_lock_and_validate(&exec, vma, tile->mem.vram, true);
> +		drm_exec_retry_on_contention(&exec);
> +		xe_validation_retry_on_oom(&ctx, &err);
> +		if (err)
> +			break;
> +
> +		xe_vm_set_validation_exec(vm, &exec);
> +		fence = xe_vma_rebind(vm, vma, BIT(tile->id));
> +		xe_vm_set_validation_exec(vm, NULL);
> +		if (IS_ERR(fence))
> +			err = PTR_ERR(fence);
> +	}
> +
> +	if (!err && !IS_ERR(fence)) {
> +		dma_fence_wait(fence, false);
> +		dma_fence_put(fence);
> +	}
> +
> +	xe_validation_ctx_fini(&ctx);
> +
> +unlock_vm:
> +	up_write(&vm->lock);
> +	xe_vm_put(vm);
> +
> +	return err;
> +}
> +
>  static void xe_access_counter_queue_work_func(struct work_struct *w)
>  {
> -	/* TODO: Implement */
> +	struct xe_usm_queue *ac_queue =
> +		container_of(w, typeof(*ac_queue), worker);
> +	struct xe_access_counter ac = {};
> +	unsigned long threshold;
> +
> +#define USM_QUEUE_MAX_RUNTIME_MS	20
> +	threshold = jiffies + msecs_to_jiffies(USM_QUEUE_MAX_RUNTIME_MS);
> +
> +	while (xe_usm_queue_pop(ac_queue, &ac, xe_access_counter_entry_size())) {
> +		int err;
> +
> +		if (!ac.gt)	/* Access counter squashed during reset */
> +			continue;
> +
> +		err = xe_access_counter_service(&ac);
> +		if (err) {
> +			xe_access_counter_print(&ac);
> +			xe_gt_dbg(ac.gt, "Access counter handling: Unsuccessful %pe\n",
> +				  ERR_PTR(err));
> +		}
> +
> +		if (time_after(jiffies, threshold) &&
> +		    ac_queue->tail != ac_queue->head) {
> +			queue_work(gt_to_xe(ac.gt)->usm.pf_wq, w);
> +			break;
> +		}
> +	}
> +#undef USM_QUEUE_MAX_RUNTIME_MS
>  }
>  
>  static int xe_access_counter_queue_init(struct xe_device *xe,
> -- 
> 2.34.1
> 
