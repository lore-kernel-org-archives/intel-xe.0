Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75E58CCD185
	for <intel-xe@archiver.kernel.org>; Thu, 16 Oct 2025 04:38:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16F9710E27E;
	Thu, 16 Oct 2025 04:38:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BcWEMt8r";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B913310E27E
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Oct 2025 04:38:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760589530; x=1792125530;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=aKQNGnborlQ0YJQg90S2aSnv8iq7Z+vK0qn9x/GLMW4=;
 b=BcWEMt8r7YTBz3q2SJpsii9lym6EWaifLzhi6KZtb+CQeRYGi6T7LH6p
 nr//5v4SI3N3IecSrvYuwKWSdWa33qOg2zxhR9FPGc/7RpRV00rgOKTQr
 d4W+VHWdS30bXruzx4AyvqHaRWEHWQFGW8bNY7QqeZWwRH0L+w6pLXIzN
 5BrOLEAw/bJds9/HlTE+yQK55Y38AL/z5u90riKdKKHPvJmsXeyHtkxi9
 mrwm+EDxd1RlFLjTaCK/FoIcylTJ7s7lsZCicyvFlBU2jh0j4sapIRLuE
 WYRQ0eBsRbZfirtLDr7YRVdtYdz2dyc//SseWDWLJeJwiTuKb8RoGW0dZ g==;
X-CSE-ConnectionGUID: 1HPL5wE6QUmGJeAKn6alZw==
X-CSE-MsgGUID: 2VJ89YouRkKslEsZg1LWQA==
X-IronPort-AV: E=McAfee;i="6800,10657,11583"; a="62670310"
X-IronPort-AV: E=Sophos;i="6.19,233,1754982000"; d="scan'208";a="62670310"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2025 21:38:50 -0700
X-CSE-ConnectionGUID: 1ymiwDCrT0+xxv3LpVBVSg==
X-CSE-MsgGUID: uGhEEowjS8+AW6Nl1Y42AA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,233,1754982000"; d="scan'208";a="182818773"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2025 21:38:50 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 15 Oct 2025 21:38:50 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 15 Oct 2025 21:38:50 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.55) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 15 Oct 2025 21:38:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=orin/H2cxXXZIjvsMByyqW0N+CP5W33oB2kfwBFtIY3KXyBIKpOnk92/6voXuXV9EoDmbSwcnDoEJD5E9SNCXFiMPRVE9zuoc6lBYW5ikzccWA+4gTbWhMHDPuxGQmQaVW8pLI+7kwJvwsTjEeg8UAJ4IycjWBOOrIDLh4bnCWqEoW67XP4vCkIicm8kW5FmTVKBN9z8a87q0tWLKXzyv2o0cNUdTkJsVIyryp5vaRO/KiN029wd8a2pQIPp2V61+JiiWmUXZc7p2S2LWo4y8Ov34rXbAd5IO7MP2oCEN8XJym+rou815gEIukI2k3pCIvvqgvJEyXoD+lKF6cUBYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0LRB5nnmrkeX0HXcBtzpovq/ySn4bpSe2WBnt9nrnnA=;
 b=veQx1LIQaFXU0FeKdsaT5nOaLzK9X22aYS1fMOrNYM1xFYZ0CH8rGd/pdEArezgEAoZ/HTunyQHIk2yZoTE0uZw4j8VupERyBev7m529t/MUlA5+F2GXBTbKGQFECH2YDCSWzNCGYbaNiZLdaIgwkOpFOhaQCVGNmW7GXyCFSG32uzeXQKFcW1o7tr9Y7ogHr9KhOUr2qvzeHLLJnGHUtoTfNHmB+TIFLB6NuvPGRp4yycwA57fh81R30IYtz0GTplXUx4VmkXAzSDfi6RB+Ol++VSM1ldjH016/xmFKsqjP1raauwBTe18JH/l93F/sY6tdfm/99Lj0zG9BDAEKkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CYXPR11MB8663.namprd11.prod.outlook.com (2603:10b6:930:da::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.11; Thu, 16 Oct
 2025 04:38:48 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.9228.012; Thu, 16 Oct 2025
 04:38:45 +0000
Date: Wed, 15 Oct 2025 23:38:43 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Shekhar Chauhan
 <shekhar.chauhan@intel.com>, Balasubramani Vivekanandan
 <balasubramani.vivekanandan@intel.com>, Tejas Upadhyay
 <tejas.upadhyay@intel.com>
Subject: Re: [PATCH v2 18/22] drm/xe/irq: Split irq mask per engine class
Message-ID: <oz3rsyy3eglcnuul76nnfr2wc3oa6dmhkp7eo3huyrthpwu2md@jerpcuh6axnp>
References: <20251015-xe3p-v2-0-b9189b3056a2@intel.com>
 <20251015-xe3p-v2-18-b9189b3056a2@intel.com>
 <20251015235200.GL5409@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20251015235200.GL5409@mdroper-desk1.amr.corp.intel.com>
X-ClientProxiedBy: SJ0PR05CA0059.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::34) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CYXPR11MB8663:EE_
X-MS-Office365-Filtering-Correlation-Id: caa13e5e-3fee-4fba-78f2-08de0c6de427
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?meki/NdbSEZbWWJt3eGIM8uP130GSWgL+iRruYxcT0bHII3ouVG+y/mqJw1B?=
 =?us-ascii?Q?7EGaraiKqjAzTN5UQkaJN/FwzVPacIyXecXZ790JWUi3ggKdteEKcjpXCA/8?=
 =?us-ascii?Q?qer7gXIakn60MfyHlKq5ipnmk3iD2Pfe9sLk7pguCecygHH8mdLHGbE9Fxaj?=
 =?us-ascii?Q?fWkvYb5Ci4XigIpDB1iibZG493fNs4UBdyJ0tcd6P9xIeLeSXlkyPUYeG+bC?=
 =?us-ascii?Q?uizyw9mspdL3NJ4zvs7UT0JxzMlugOGjvgp+mBQezCJg4UTqMBozywZYPmDd?=
 =?us-ascii?Q?lucLmDMZwWAZdvwOt2ZN/7YKU3DHo2cY8jdC3m3PAhjOmEfXaR1buoorm+8i?=
 =?us-ascii?Q?i3dS+FJ7icjD6ZTbAd4CRtj5xk7Lz9kXphBrPbBIbTbBG+9VSGPO3foNY6ls?=
 =?us-ascii?Q?sK17vHysz3SaaejPGWb+JeWcaMgO3fAFQ0B8ohyO9++mSt7QszbW4vJZRw2z?=
 =?us-ascii?Q?uEXuoWhOKfeSvwtlRm1x9CW2a5IppDoO7QV/+UruWiAXNPcPYDrrjP21CY4H?=
 =?us-ascii?Q?YgvZ28lTB3+PyB958+tpkyKUDQDJjcMwGsaF2+rK2TVqCLwyHX69BKPjcURN?=
 =?us-ascii?Q?R5ecEUedQPaGrKKMnLQu5sT9kCqfsGhPP5eoD1lg8CAAVBgKgTYr+GiOgcyY?=
 =?us-ascii?Q?/uzQPNaRVi4vWoPhZ4Et/P/swRbuSsU4n2LC8gJId9FpWfoVaIGssb3gFQeT?=
 =?us-ascii?Q?g9tZbognxkXsHuhgEXjMMwqSc5lUoE9A5k43VK8f22nysyuJg/WV/mPod+06?=
 =?us-ascii?Q?r4dRx9WClP3gqOnsAmOQlhgXOHlVF8WDWH1b4TO4WpxKygO4Phx0jlflkmUo?=
 =?us-ascii?Q?6cKnNtzwDF0qKL77Ee8EES0KC2KVUL3lniIx21pNBIAHts6kIwRvRPH8vTUZ?=
 =?us-ascii?Q?xiFwnk/usfWQdL5g8zYnfZkN6uWR4ilSSnT2ct2YfwVkobZhCPo/LuNYkLxj?=
 =?us-ascii?Q?AI7AY00TVwaKlobu1ah8lzIFpszkjBsvh+KwZoadK8zjoY8Te9SZBcZwDJ9G?=
 =?us-ascii?Q?v2dERM4vywQYkK3vUmuYiF8uCDLJyJQDmO2Tn1szO+W3FJIL5l+CwC1yeFzV?=
 =?us-ascii?Q?zrWrYqsqVYl6MyFsg6jq/Aoq8feKoTbwOZYmkWkysJIkbNf4zDpI6YxPav9a?=
 =?us-ascii?Q?1Z3nh0bU18Zy1Y70uiOvmodqkY+gJ/1GykMwedB1rPs/MGsaOzvBzp1G8YFg?=
 =?us-ascii?Q?FHQAHRgq0L4zAdcEgC9L5EhOwsp3N+y8T0LEn3yc6RAxRYchphEotd+2qJcg?=
 =?us-ascii?Q?0Sb6Dy9ehztbHxmjaHL9bcbkDbQMCAQh9TTOLmI0vCwMG6efcwXeNTcCPn38?=
 =?us-ascii?Q?sqQoIWiFwbGuojCU2vlk/q6TVWUboM+kaFSE7nfWQPVPuj/Foh18B00/I2vm?=
 =?us-ascii?Q?sSAIo4rnSd5T/m3wGf3O7052pZY3Keh7Nk7RBMAUPPaVOv5zdCujqau1Ql2Y?=
 =?us-ascii?Q?gwnZIMNPMhTv7NWDnV+/8LQaZts7guXT?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?toO+balNRYT8NnVodBPR8b4MQsEcaVPEZpZrOAFY4tV6OtmOT4sokJvd75Zr?=
 =?us-ascii?Q?p8zt0iyaMgAjbbnyVAH4B5lG1iMAS2zJ4HC4Al7vrJ7wnFH7//Gkp9W6PNvW?=
 =?us-ascii?Q?QhPxdFosak6zayufZCFE2/bygbGe8UU7Zr8+N5sfQyKJdmAB3k0Q08K5SD/L?=
 =?us-ascii?Q?4xPHzHlBJN9gt+zcCwNMJS2rOFzsfomsooc9heZJHGf6GkZxXJbbL3blimxD?=
 =?us-ascii?Q?aLp22tqiUb/1KvqFAjdfFr1T/F8q/810fV3UMa5fmLXf9Z1ib9QPhqRVMeN2?=
 =?us-ascii?Q?Tc6h/tjKYy+p7IM2ww+4JWVOqbgITdpGqsmpB7y7irCqxVhJl9He2Hz6CSkY?=
 =?us-ascii?Q?YRvJZg4P4zZcldl/Ozrftz33F83oTocnVl8jOaTKzc0xfzfyQMb2u/b7ADJJ?=
 =?us-ascii?Q?y7h415weYm6gg+Ev4AIuUfJVjQQa8HuK4BLgVVSaoux9ksBGoLwQ87QECRp5?=
 =?us-ascii?Q?aFuGfVHpubuUvkGQ1cZuqROxM1hSDUwWc3QH8ND4NXxn+A5upf891hRqWgQL?=
 =?us-ascii?Q?TAlY01f0exO1LXyNVAea7C/m9TXAtmpFHCfYxvb7i0lFdhWxP8CK849SF7TQ?=
 =?us-ascii?Q?ra7Y6pX5XfeLXZmCkFo5PYvyXUCLXDPvGocRPJHkOCxBlz2uuSHRNa7Oqhbf?=
 =?us-ascii?Q?kgdtZMGHyqPVkh/N2y1CwAZYuHa/TY3m2KGbeQ8pYfvFqu4uhHu616iWtM+4?=
 =?us-ascii?Q?6YG8Qi7K9scslXq7Y/DO2snDlIWu7vMA0TL/A0o6jhelCldDyYtEdm+zsOkX?=
 =?us-ascii?Q?250nhuJlbdlDcQUIzaeaozlgp+gmDNAgTu+cuNUp/SYiM/YmNq1wdU5rZMEP?=
 =?us-ascii?Q?oiq0apa16hOHByx6O1ljhZOya11XX2D/VHGcWlkEEdaquW13JzDyzFZqxdtU?=
 =?us-ascii?Q?ByWrlyCUp1SZN5xTN1OEwiXWzyia66V2+HeeOsWvo5U2vnFFVBBE5wTVjfmI?=
 =?us-ascii?Q?9h9kTf40lmhm51rK2W13YoymIr/Kp3yBwpYuxcivnPuIbgJYi41/zkDbQzWs?=
 =?us-ascii?Q?wdgFMXK5qU06hQZajDP5dNZB9ALQLIThWw9JqJIaW9yH/83hy15AuFLfP0A5?=
 =?us-ascii?Q?ndhH+a/iJjRxhav/+bJuCq4k4+od1GRyOL9RX4dQdn7EsfRbQKOwjA7HTjYa?=
 =?us-ascii?Q?XvhFqqRtwmQaCeSt1k/pmor2XBVp7590xQXmfGD4SmthP3taQp+ynob2yxmJ?=
 =?us-ascii?Q?LKpvNNc9u71FuauN98fXT4o5RL0Uxv8N45BbDjNNg/n7XO//0kBmC1v3fi8F?=
 =?us-ascii?Q?8ETOcMkV1uzKEnpvI7IXbfi2m53kNpFz8XPobm6lS0T/Z488SemDbuXAvbZE?=
 =?us-ascii?Q?v2UPYoe3efDBVJuyeHAuisPk0iejZcnkoVIMfwPqCALpbH3llvtPBUiy0kNs?=
 =?us-ascii?Q?k3BQnhWpSAUUVfmQhTRDZFcvdWo/mVY7dFe4mpSugTNvtn984B14ddY6AGdn?=
 =?us-ascii?Q?ppZW37P4PVxINIrvvVwtMbn/Uflrlt21SbblgJf6LEeM14Bfpp3gVIi0GqR4?=
 =?us-ascii?Q?5lHJvlAMTZ3PboQE/qaljzZqq0a/t4Y/a0bvUfy2LRle+M/7zHiklvIzYaZW?=
 =?us-ascii?Q?K6MPcz2fKInFBPfzTDkQw28ljs0Z1x7sIs1TA+6YlBfXELXcYkeQWv0w4XNg?=
 =?us-ascii?Q?Sw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: caa13e5e-3fee-4fba-78f2-08de0c6de427
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2025 04:38:45.4239 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TWHNclcHRTIH4Vk0qF21ouVSgQsF3htW0O0L2y2yXjN0DrLurlwBaxFYkyi2GtkBOi29JnFueLPuIY5rNYoN3OsCILvGOyHUF2OxsKKpuds=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR11MB8663
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

On Wed, Oct 15, 2025 at 04:52:00PM -0700, Matt Roper wrote:
>On Wed, Oct 15, 2025 at 03:06:33PM -0700, Lucas De Marchi wrote:
>> Each engine class has a different bitfield structure in the hw. We've
>> been just using a common mask for all of them, but this means that we
>> could inadvertently set a wrong bit in one class while enabling
>> something in another. Split them to make it more future proof.
>>
>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_irq.c | 73 +++++++++++++++++++++++++++++----------------
>>  1 file changed, 47 insertions(+), 26 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
>> index 9c3a85c4585ed..103804546b280 100644
>> --- a/drivers/gpu/drm/xe/xe_irq.c
>> +++ b/drivers/gpu/drm/xe/xe_irq.c
>> @@ -139,25 +139,28 @@ void xe_irq_enable_hwe(struct xe_gt *gt)
>>  {
>>  	struct xe_device *xe = gt_to_xe(gt);
>>  	struct xe_mmio *mmio = &gt->mmio;
>> -	u32 irqs, dmask, smask;
>> -	u32 gsc_mask = 0;
>> -	u32 heci_mask = 0;
>> +	u32 common_mask, val, gsc_mask = 0, heci_mask = 0,
>> +	    rcs_mask = 0, bcs_mask = 0, vcs_mask = 0, vecs_mask = 0,
>> +	    ccs_mask = 0;
>>
>>  	if (xe_device_uses_memirq(xe))
>>  		return;
>>
>>  	if (xe_device_uc_enabled(xe)) {
>> -		irqs = GT_RENDER_USER_INTERRUPT |
>> -			GT_RENDER_PIPECTL_NOTIFY_INTERRUPT;
>> +		common_mask = GT_RENDER_USER_INTERRUPT |
>
>As a follow-up patch, this should probably be renamed to
>GT_MI_USER_INTERRUPT since it doesn't have anything to do with render
>these days (I think once upon a time this interrupts was only supported
>on the RCS, but it's supported everywhere on all the platforms Xe
>supports).

from bspec:

	- rcs: CS MI User Interrupt
	- vcs: MI User Interrupt
	- vecs: MI User Interrupt
	- blt: MI User Interrupt
	- gcs: MI User Interrupt

yeah so GT_MI_USER_INTERRUPT seems a good common name.

>
>> +			      GT_RENDER_PIPECTL_NOTIFY_INTERRUPT;
>
>This one will probably need a rename too.  The purpose is the same on
>all engines (indicate that a flush command has finished), but the actual
>flush command differs between engines...PIPECTL is only on rcs/ccs, and
>MI_FLUSH_DW is used on the other engines.  So maybe
>GT_FLUSH_COMPLETE_INTERRUPT or similar would be more accurate.

ack

Adding a commit with these renames on next version

>
>>  	} else {
>> -		irqs = GT_RENDER_USER_INTERRUPT |
>> -		       GT_CS_MASTER_ERROR_INTERRUPT |
>> -		       GT_CONTEXT_SWITCH_INTERRUPT |
>> -		       GT_WAIT_SEMAPHORE_INTERRUPT;
>> +		common_mask = GT_RENDER_USER_INTERRUPT |
>> +			      GT_CS_MASTER_ERROR_INTERRUPT |
>> +			      GT_CONTEXT_SWITCH_INTERRUPT |
>> +			      GT_WAIT_SEMAPHORE_INTERRUPT;
>>  	}
>>
>> -	dmask = irqs << 16 | irqs;
>> -	smask = irqs << 16;
>> +	rcs_mask |= common_mask;
>> +	bcs_mask |= common_mask;
>> +	vcs_mask |= common_mask;
>> +	vecs_mask |= common_mask;
>> +	ccs_mask |= common_mask;
>>
>>  	if (xe_gt_is_main_type(gt)) {
>>  		/*
>> @@ -169,44 +172,62 @@ void xe_irq_enable_hwe(struct xe_gt *gt)
>>  		u32 bcs_fuse_mask = xe_hw_engine_mask_per_class(gt, XE_ENGINE_CLASS_COPY);
>>
>>  		/* Enable interrupts for each engine class */
>> -		xe_mmio_write32(mmio, RENDER_COPY_INTR_ENABLE, dmask);
>> +		xe_mmio_write32(mmio, RENDER_COPY_INTR_ENABLE,
>> +				REG_FIELD_PREP(ENGINE1_MASK, rcs_mask) |
>> +				REG_FIELD_PREP(ENGINE0_MASK, bcs_mask));
>>  		if (ccs_fuse_mask)
>> -			xe_mmio_write32(mmio, CCS_RSVD_INTR_ENABLE, smask);
>> +			xe_mmio_write32(mmio, CCS_RSVD_INTR_ENABLE,
>> +					REG_FIELD_PREP(ENGINE1_MASK, ccs_mask));
>>
>>  		/* Unmask interrupts for each engine instance */
>> -		xe_mmio_write32(mmio, RCS0_RSVD_INTR_MASK, ~smask);
>> -		xe_mmio_write32(mmio, BCS_RSVD_INTR_MASK, ~smask);
>> +		val = ~REG_FIELD_PREP(ENGINE1_MASK, rcs_mask);
>> +		xe_mmio_write32(mmio, RCS0_RSVD_INTR_MASK, val);
>> +		val = ~REG_FIELD_PREP(ENGINE1_MASK, bcs_mask);
>> +		xe_mmio_write32(mmio, BCS_RSVD_INTR_MASK, val);
>> +
>> +		val = ~(REG_FIELD_PREP(ENGINE1_MASK, bcs_mask) |
>> +			REG_FIELD_PREP(ENGINE0_MASK, bcs_mask));
>>  		if (bcs_fuse_mask & (BIT(1)|BIT(2)))
>> -			xe_mmio_write32(mmio, XEHPC_BCS1_BCS2_INTR_MASK, ~dmask);
>> +			xe_mmio_write32(mmio, XEHPC_BCS1_BCS2_INTR_MASK, val);
>>  		if (bcs_fuse_mask & (BIT(3)|BIT(4)))
>> -			xe_mmio_write32(mmio, XEHPC_BCS3_BCS4_INTR_MASK, ~dmask);
>> +			xe_mmio_write32(mmio, XEHPC_BCS3_BCS4_INTR_MASK, val);
>>  		if (bcs_fuse_mask & (BIT(5)|BIT(6)))
>> -			xe_mmio_write32(mmio, XEHPC_BCS5_BCS6_INTR_MASK, ~dmask);
>> +			xe_mmio_write32(mmio, XEHPC_BCS5_BCS6_INTR_MASK, val);
>>  		if (bcs_fuse_mask & (BIT(7)|BIT(8)))
>> -			xe_mmio_write32(mmio, XEHPC_BCS7_BCS8_INTR_MASK, ~dmask);
>> +			xe_mmio_write32(mmio, XEHPC_BCS7_BCS8_INTR_MASK, val);
>> +
>> +		val = ~(REG_FIELD_PREP(ENGINE1_MASK, ccs_mask) |
>> +			REG_FIELD_PREP(ENGINE0_MASK, ccs_mask));
>>  		if (ccs_fuse_mask & (BIT(0)|BIT(1)))
>> -			xe_mmio_write32(mmio, CCS0_CCS1_INTR_MASK, ~dmask);
>> +			xe_mmio_write32(mmio, CCS0_CCS1_INTR_MASK, val);
>>  		if (ccs_fuse_mask & (BIT(2)|BIT(3)))
>> -			xe_mmio_write32(mmio, CCS2_CCS3_INTR_MASK, ~dmask);
>> +			xe_mmio_write32(mmio, CCS2_CCS3_INTR_MASK, val);
>>  	}
>>
>>  	if (xe_gt_is_media_type(gt) || MEDIA_VER(xe) < 13) {
>>  		u32 other_fuse_mask = xe_hw_engine_mask_per_class(gt, XE_ENGINE_CLASS_OTHER);
>>
>>  		/* Enable interrupts for each engine class */
>> -		xe_mmio_write32(mmio, VCS_VECS_INTR_ENABLE, dmask);
>> +		xe_mmio_write32(mmio, VCS_VECS_INTR_ENABLE,
>> +				REG_FIELD_PREP(ENGINE1_MASK, vcs_mask) |
>> +				REG_FIELD_PREP(ENGINE1_MASK, vecs_mask));
>>
>>  		/* Unmask interrupts for each engine instance */
>
>As a follow-up, we should probably add vcs_fuse_mask / vecs_fuse_mask
>checks for these, and also handle the rest of the engines up to VCS7 and
>VECS3 (since we have all of those in media_xelpmp's descriptor).

queued this change for the next version as well.

>
>> -		xe_mmio_write32(mmio, VCS0_VCS1_INTR_MASK, ~dmask);
>> -		xe_mmio_write32(mmio, VCS2_VCS3_INTR_MASK, ~dmask);
>> -		xe_mmio_write32(mmio, VECS0_VECS1_INTR_MASK, ~dmask);
>> +		val = ~(REG_FIELD_PREP(ENGINE1_MASK, vcs_mask) |
>> +			REG_FIELD_PREP(ENGINE0_MASK, vcs_mask));
>> +		xe_mmio_write32(mmio, VCS0_VCS1_INTR_MASK, val);
>> +		xe_mmio_write32(mmio, VCS2_VCS3_INTR_MASK, val);
>> +
>> +		val = ~(REG_FIELD_PREP(ENGINE1_MASK, vcs_mask) |
>> +			REG_FIELD_PREP(ENGINE0_MASK, vcs_mask));
>
>Was this one supposed to be using vecs_mask?

yes, thanks. A few lines above there was also a ENGINE1_MASK when it
should be ENGINE0_MASK. I'm fixing those for next version.


thanks
Lucas De Marchi

>
>
>Matt
>
>> +		xe_mmio_write32(mmio, VECS0_VECS1_INTR_MASK, val);
>>
>>  		/*
>>  		 * the heci2 interrupt is enabled via the same register as the
>>  		 * GSCCS interrupts, but it has its own mask register.
>>  		 */
>>  		if (other_fuse_mask) {
>> -			gsc_mask = irqs | GSC_ER_COMPLETE;
>> +			gsc_mask = common_mask | GSC_ER_COMPLETE;
>>  			heci_mask = GSC_IRQ_INTF(1);
>>  		} else if (xe->info.has_heci_gscfi) {
>>  			gsc_mask = GSC_IRQ_INTF(1);
>>
>> --
>> 2.51.0
>>
>
>-- 
>Matt Roper
>Graphics Software Engineer
>Linux GPU Platform Enablement
>Intel Corporation
