Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3131ECCA470
	for <intel-xe@archiver.kernel.org>; Tue, 30 Sep 2025 14:57:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC50410E5F6;
	Tue, 30 Sep 2025 14:57:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PZ6iobOC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D474310E5F7
 for <intel-xe@lists.freedesktop.org>; Tue, 30 Sep 2025 14:57:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759244241; x=1790780241;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=KJGulvrmX8EQlejIKM8qvOXn/V6XrH/P1xfAf+bVrkc=;
 b=PZ6iobOCz1yRD79QyHEt9j9ldXEELohv+FsLEtT9/E0bjS0Hbh4oM8I7
 Jd/Jl9BI7KuQRWqZIjG8Q0tASpwsmLet9ZzeS0TUbiQPdtBferdVoIwCm
 xLyyZ9GqVmRpWRnaS4XbWomupAUwxCSqA8blTlYo6a/jdruJ84sFhYI3i
 p4Mk+zKSmM5cMr3zatlrQrVpTl8KwjPKqWCTJUZUoEaaYX8LDdA7nJ3uY
 FnGVAE8vAygjsW8zYAJ/EwtfquROmYD1l+WWjAmIOBCuxnNk5jh+6Y3JP
 qYuEnVtCx7dYKu+OeoJ/Ph048c/M3EbjWdhWL72JJXHzh1mygp1zExGwb w==;
X-CSE-ConnectionGUID: icW3aKq8TB+K4jhfml1jsQ==
X-CSE-MsgGUID: 0MEGO27BSnaTx1HDHBDLfQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11568"; a="86947825"
X-IronPort-AV: E=Sophos;i="6.18,304,1751266800"; d="scan'208";a="86947825"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2025 07:57:20 -0700
X-CSE-ConnectionGUID: FwTjjMNCSfaqydbMNSSh6Q==
X-CSE-MsgGUID: exVbdFzPRX2WX0mpReE2kw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,304,1751266800"; d="scan'208";a="177817399"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2025 07:57:21 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 30 Sep 2025 07:57:19 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 30 Sep 2025 07:57:19 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.5) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 30 Sep 2025 07:57:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B8t2lHBzdjz1Z1VZ5q2eCivheMBip0BhUB/GcTaJXgzVJGjIiVui/xJnuh4UlvFlTb3HlzLaRBLAUCvbMQmT1PX1nc5mrIQBGPQS2P3oskPrmuKuwvdBCAGyJs6OGnYqls34JbGqG7MxztbjA72E1bSPfnbP2S9g9JoRoCJ0iyqlOpLU7qMJcdmHKxzIO00K319QCsoWNCP7L8Evw7MA9TBY85bGZYeXB6IDJsRg5jLUNmKZQ3ag1UcJDMBWvLKw8ZpwTSG7XPX7i8KWaPOIvz3FhPIkkwVz5UGe+fBL7ja8LO2i/F8W7Df1+cU/m5YlzyuRRrcGZ5TgMFCADD9miw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dZ452VbDd3BHVSX4/zmrT2IwuSYaO11jtLve//vn3eY=;
 b=jHHovB/hHEgdqrfdYc2cO++s/Jh88XBpBwRgoulnzELmKboHYXiRlUnftm+FVOU2kwP6FeDUzp/i9DVKOqTJEHRozxRtqKzP2o1ysl9lq6uPuIIziR/Zwqd1OyqydelJuRqmdnNLkmJ62UIAHCaHa8P1arQtDoKBxhsrlOaIMi3AkttclOsFwuHROsLYmEZsZ1wWWbZtykRR/22TBGr+UXknKr470tBHI+bKGpO7KO9P1+pozME24VTo5jrjaTi4kqwhQbQk84oUoVkfG/m/VQLCxiHwWI6muGvaWZMu0QvMvtdsz8+soR6nMxRV1wATcaAM2UiWZ8t9T/VLB4AqSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH7PR11MB8479.namprd11.prod.outlook.com (2603:10b6:510:30c::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.17; Tue, 30 Sep
 2025 14:57:17 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.9160.015; Tue, 30 Sep 2025
 14:57:17 +0000
Date: Tue, 30 Sep 2025 09:57:14 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Raag Jadav <raag.jadav@intel.com>
CC: <rodrigo.vivi@intel.com>, <intel-xe@lists.freedesktop.org>,
 <riana.tauro@intel.com>, <badal.nilawar@intel.com>,
 <michal.wajdeczko@intel.com>
Subject: Re: [PATCH v1 1/2] drm/xe/hwmon: Drop redundant runtime PM usage
Message-ID: <ba37dimbjekpv2ukwygeo4n4s2re6ucvk6vfgxzo2whf3cq3go@wra4l5nh5czm>
References: <20250918114804.2957177-1-raag.jadav@intel.com>
 <20250918114804.2957177-2-raag.jadav@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250918114804.2957177-2-raag.jadav@intel.com>
X-ClientProxiedBy: BY3PR05CA0039.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::14) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH7PR11MB8479:EE_
X-MS-Office365-Filtering-Correlation-Id: 978e6627-2e4a-4217-2d66-08de0031a5d9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?4lqL3ezfzA1/uuThX5SRJ4sMNYBhhOATtiTsR8xaSL5mRO/mMzqNMlDmopT3?=
 =?us-ascii?Q?vSajjOXn516zP7h+X/e4iQ730+ABib4M61zXyiw9GnzUgNg2TxxNOiaCe3Ha?=
 =?us-ascii?Q?YkrnTnsrVFN2d5NlPt905bjNCWham8qX4NpczNVGE3KcxHuMDOw373G3ZvwS?=
 =?us-ascii?Q?TGqkDM1LMUxxK5MssogtQHrTtyJpxdvyQMpx0PyYt6BOgTnBMiD76eK2VHaC?=
 =?us-ascii?Q?9nUeNJ7kuLYbQYp85m76FAqWbnRzsBV7Y7qr7B2DySVaxQMo6MI3GMeEtKt2?=
 =?us-ascii?Q?qNhht2cbFRM/7PnvGnglFdxJwBmlp+MeiDki8kK60P0ST5Rnk28CTUTchoi0?=
 =?us-ascii?Q?H4acpa9QYa6xcW3HPTq/BHWqDZbBYCiCxxmRltztUcisFGCDrvuzwxhwHbSM?=
 =?us-ascii?Q?a7CTjbiFT8/RZKC9Y7QVVog0Gh0tK1P33BrN9k6fF9+382gJaGj9jKPAzki+?=
 =?us-ascii?Q?0er6c3OZL1TUnymCQwzX/QfHuvVZwF1OBrD5a66uWg3vVrOr5ub/ZJpK80EI?=
 =?us-ascii?Q?aV0IFzuxIqtWXkL51F/gzZ316tALotyagl4Bn+RzmCum1uz6lBCKRZvjDWMK?=
 =?us-ascii?Q?WxmkT7MK9U8riECeudQY7xqSe8vHHeQWoLnsxzFtPnBlr3gIJHQkNvxqaUpT?=
 =?us-ascii?Q?4e6BxYnIgBKwkexWT3I/dgJkYcpYB0K0/aIh1QvmItEVH/X2PM9SH3gJTNH2?=
 =?us-ascii?Q?Jpf6Anr+s+kkN99RCixwnlG/FArfjbKUAUVUkTlqQfXnekc3Fptq8U4TW4hy?=
 =?us-ascii?Q?tbM367VE3/7lQDpCC71RR4K4LQd0vH75irS/IMl5k3Wj7IMEVb3rnGlVC9yX?=
 =?us-ascii?Q?CfCnC0+j/EzuLMxTiP3Ljaqln2yeiL5A7pcVfoGzP8+sRXJO3glmrCkEX01Q?=
 =?us-ascii?Q?xyQHEu8Z/uuFO62272onRziaNdzIO9X+5vtJ4cvJXjF6ruEerN4fBMlm/oG0?=
 =?us-ascii?Q?2ShTpKQgL6GDDPdx8XhEkVPZ/OcjHS9fR2ZvTPJNHkSkBAnjLngmjUexvqGD?=
 =?us-ascii?Q?BGjAAVfJ4Uo1jafHKUo5p6fSIAwM4AmZPqp/bZHX3DaXyYSdk4m7bq2MTCK+?=
 =?us-ascii?Q?4A/nkQAmBH0kc6gTtcAxbOfVR+y/MQfVehJpvExLRyK2d0clgQYJ+1ImlR+c?=
 =?us-ascii?Q?sFV1TussEs405x/UH2S2DwT3yuE3Rd/tD9TGAVugTAtXYKk1MsPUxT9u/eK8?=
 =?us-ascii?Q?DjH7UfOVCIm5LVvLRQXWM1rGJSW7xRFqqAwtUKOfoWrcXRrH9UGHh4H0bLWY?=
 =?us-ascii?Q?nuA5GKRDZWkcBg2IHhONSoqKy+6zDrD+yfSgfGgt5fdpYn5rZ85fi7BltHlY?=
 =?us-ascii?Q?zdXXnj7eGM8d3QjtHHXfB37j3x8vS6k7vgIDOH0KxTS705PXj/YJ/ifxj2Af?=
 =?us-ascii?Q?HNhPSQo7eeVAbJy4Ab/VxdMrk0Kn4r5X3FsgsNdEWLvwTyAGBxBqeCFSAjFM?=
 =?us-ascii?Q?YaBzr7KOlrWMJCWSFwR4SLoYh5xY8p9r?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?yzPaKDJs4UK3Anpgp98T3t5c1mr5pdZNzMO46/3OoSXYMsn1oMQtHWG64XUk?=
 =?us-ascii?Q?IPXQ6Kvgroe6Q6lAWPdCS3q5cGY3dpQVKD8Y7ZOvpD5nWQe3JSbU8QxROzQC?=
 =?us-ascii?Q?lkg54+dMsD822n5Dw55jGO07/FVp1+pyAOWUF2deTQlInS1Fc6NH/ZrpeC8c?=
 =?us-ascii?Q?3dsSiF+EyTxBkFz18bNYo2itUexuBuJ+m3wJeothePE2697ZLvN1BXI5WK6y?=
 =?us-ascii?Q?5Kc06XyxiJKHLm7hyi+Ag+NE7I77XL0AHYhJxPiGRZsH+82sqJg29BOL8L5n?=
 =?us-ascii?Q?r470DCwPC+Th7qtMlk2jSXDgbWyjEbGbqR5YeCFjM8wVvIqjb6eDIwx4DpVF?=
 =?us-ascii?Q?mJOurHV7tUgl5mR/FewXOaSh1d+qMBuCbhn8OVqRQtxEmsr3LraBcaH8XWeG?=
 =?us-ascii?Q?N9hRnkMQrgVapnSLKvbSVCdPOZAdIDOR9t0vaI/kcfT15O/lj8IuQXJNuvhA?=
 =?us-ascii?Q?uFhSDG3qH0TfiCcbKWsWDUpNVUGhsjxypeBT0iawUuOZKE80G0uZZpAhinzm?=
 =?us-ascii?Q?QkFBpA14UKTL1ysK1c8IYZ7WorpdZL0FcN8dr16TKlyh5hrjvv+/URGJxT6s?=
 =?us-ascii?Q?nKpMxbtKFGgtepWlTHmahXaFb35Vl0vRJfbQQmi3COlWoTovzgCGLytE5vzk?=
 =?us-ascii?Q?SLKzh4bvNsHk78IkcrHjuylej60BHDUXMEny40HSIj5KeRtAj2I4o2GXXw81?=
 =?us-ascii?Q?hARmd6U1DAjISJiXRKs07QkoB8bu8yrtbGz0+RANQV/blHFeSix+BdCQ/qjV?=
 =?us-ascii?Q?ZpFRsuPjVhlX4zZ0vXssSFwUbOgS80RU9pQLa2qCispV//0HymAldZxDPfE/?=
 =?us-ascii?Q?HUitQrm3EmKHOTqEj8p+NgPu1TefcbzSG5IpvtKCE45TMzlvcqM9M7/qwW9K?=
 =?us-ascii?Q?iXZHidG0fiC3ZHarAr538ZLbWEKNEQRUuE8bP7oHXzQ1olw0MLNAwtxkMuuS?=
 =?us-ascii?Q?xE2oRbIWbpu/NFmmUyLxUACaPxJmobNFVouRQczuAe0q03CTjvi08BT8b+Y7?=
 =?us-ascii?Q?VBTmYL1tin6Pdeu9UdZNkcdpccpBpKsZ6YCq8XSJ2EKyPoSEDW0VWLg/+wrY?=
 =?us-ascii?Q?sSjhO1cxhvumynPeQdDkzzmEyX4ZSeU2vVLagO/KaTqf+gxJlUuV+O/X5BzD?=
 =?us-ascii?Q?pmLZCs4tKmMu+I0kIMHRWsfpJRjw42RwUPqWzxu3ZXMjLK7rSkT6AIzxG26o?=
 =?us-ascii?Q?jcbRkrdo28YXPakqLwXwpTkUG2LDquruQKf3c9XJZT2s3bQu5RA+XQdGeqJ0?=
 =?us-ascii?Q?9EJKQHH8v2PdBAJ6/nfOx9OIr/ZMCEAeWrndbRwE+KB5DasqRxmLlS+CtuDU?=
 =?us-ascii?Q?ouNlHhr5ZeWeD++FUHxkzOwO3kPFpFdKDMCTsN/4CDeLtA2IP5Uwt+jDa42t?=
 =?us-ascii?Q?d2kexOwHZFRILxwK3wW1kk980l0hZ6CPUUhaQqsVrOd8xhPa14f368zJDYQr?=
 =?us-ascii?Q?OOyHZj6t99g32Zld+Wl6jWYLiQlE8hsrR5jwGvMPgVDxqtPhDWRyy9Ukhm0T?=
 =?us-ascii?Q?fYmrXeldTsJuEicuPoz2E0UY9mNsODQzFQJZ/F3ti4SCYz79QYiJRQmxQ883?=
 =?us-ascii?Q?LJTo6grXRtr3fctwFJ48b1fEiuSbIq6ueHNgrujqtgRc07jvwmBCE6MrgFjC?=
 =?us-ascii?Q?RQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 978e6627-2e4a-4217-2d66-08de0031a5d9
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2025 14:57:17.0395 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5Nd82dSOFwHQbf6k5rgPJFWwy4ZUJnPjNqPCS0YOHFVbz0c+OewgHRSQ/1V3/ln9Op5kQs3bGe9C1ctLnC58xCEk7/u69atu1uKinG2ybmA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8479
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

On Thu, Sep 18, 2025 at 05:18:03PM +0530, Raag Jadav wrote:
>The device is expected to be in D0 state during driver probe. No need to
>resume it in ->is_visible() callbacks.
>
>Signed-off-by: Raag Jadav <raag.jadav@intel.com>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Merged to drm-xe-next, thanks!

[1/2] drm/xe/hwmon: Drop redundant runtime PM usage
       commit: 5a856e277b237e35123f797ca0f7d215e1b83db2
[2/2] drm/xe/sysfs: Drop redundant runtime PM usage
       commit: d9c401d8f37cd5510cc64647b0421f95e62fe3a2

--
Lucas De Marchi

>---
> drivers/gpu/drm/xe/xe_hwmon.c | 8 --------
> 1 file changed, 8 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
>index b6790589e623..97879daeefc1 100644
>--- a/drivers/gpu/drm/xe/xe_hwmon.c
>+++ b/drivers/gpu/drm/xe/xe_hwmon.c
>@@ -658,8 +658,6 @@ static umode_t xe_hwmon_attributes_visible(struct kobject *kobj,
> 	struct xe_reg rapl_limit;
> 	struct xe_mmio *mmio = xe_root_tile_mmio(hwmon->xe);
>
>-	xe_pm_runtime_get(hwmon->xe);
>-
> 	if (hwmon->xe->info.has_mbx_power_limits) {
> 		xe_hwmon_pcode_read_power_limit(hwmon, power_attr, channel, &uval);
> 	} else if (power_attr != PL2_HWMON_ATTR) {
>@@ -669,8 +667,6 @@ static umode_t xe_hwmon_attributes_visible(struct kobject *kobj,
> 	}
> 	ret = (uval & PWR_LIM_EN) ? attr->mode : 0;
>
>-	xe_pm_runtime_put(hwmon->xe);
>-
> 	return ret;
> }
>
>@@ -1096,8 +1092,6 @@ xe_hwmon_is_visible(const void *drvdata, enum hwmon_sensor_types type,
> 	struct xe_hwmon *hwmon = (struct xe_hwmon *)drvdata;
> 	int ret;
>
>-	xe_pm_runtime_get(hwmon->xe);
>-
> 	switch (type) {
> 	case hwmon_temp:
> 		ret = xe_hwmon_temp_is_visible(hwmon, attr, channel);
>@@ -1122,8 +1116,6 @@ xe_hwmon_is_visible(const void *drvdata, enum hwmon_sensor_types type,
> 		break;
> 	}
>
>-	xe_pm_runtime_put(hwmon->xe);
>-
> 	return ret;
> }
>
>-- 
>2.34.1
>
