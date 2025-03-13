Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2D37C282EC
	for <intel-xe@archiver.kernel.org>; Thu, 13 Mar 2025 14:28:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69D1B10E8B3;
	Thu, 13 Mar 2025 14:28:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AyBR9ZCp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 481B510E8B6
 for <intel-xe@lists.freedesktop.org>; Thu, 13 Mar 2025 14:28:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741876112; x=1773412112;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=+ng7h5FYN4W+igIuG0FrG5VV78SbAiJsuQzNxwY4jYw=;
 b=AyBR9ZCpFCNPmXPmvsFfiwqvSg+WuYWYuKp3jr9HELkYyqE3rxYYSdXN
 +7zrs6GD3xmTWhDD3mO9cPco7/+cNbK4iCln3D3xoypOarpBqGm3H7MIs
 WqCyh1rARC95RY1+DPDORUTX64YYjDQzYu1eUqKzi1zvbGF7PgvQododA
 n907xFHAFeAJBmqiMAlGrRAVdp55LblKHmXfMfzdXy0PNaK3b+M9GDJh4
 hEK3L7tnuQGDvFELRiOMaBBGX+Pp6onT6xRq+y7Cl9T1yD2yzmjMHZYGr
 srrlXoAyPEDBAfQiekZagBjH1EWI6XJs7cR5gJGUa80nF2BA9itCYK7uu w==;
X-CSE-ConnectionGUID: QMiONMU7RhOCJ1joAu8Jog==
X-CSE-MsgGUID: 5D1Vcay0SSW5bT3USbWOEg==
X-IronPort-AV: E=McAfee;i="6700,10204,11372"; a="43174272"
X-IronPort-AV: E=Sophos;i="6.14,244,1736841600"; d="scan'208";a="43174272"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2025 07:28:29 -0700
X-CSE-ConnectionGUID: JAscP3m+SEC8W0E/28XHEA==
X-CSE-MsgGUID: dCFhHhIlRq26HWVLfTOwQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,244,1736841600"; d="scan'208";a="121471173"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Mar 2025 07:28:28 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 13 Mar 2025 07:28:28 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 13 Mar 2025 07:28:28 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.174)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 13 Mar 2025 07:28:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f3/Espl8HUrAmVOby7+i1hyVGy3x0sqVVDaiK3r0T65+7TL/yL/DH6+81wDC5/KEWwUIZ7hJMu3bm1CoP6ypwNaxAYMcFdIyvaaib0HZb3P4wtweZr2y7Vo2qHcjFcqPa9ZwGWwAnelOuwzOHmTGvrKvN7dhVRrnTaf2uCHoiAxXl9divwMT9dXMloQ2ra+MCGRtfeYy6R2CsYkGrbeCMhnCM3h3Z+Lb2KaRyInmuR8D07VEM59L+SrUZFm9/Ra/+aHt1J2aC2BrMKldii8udIVtLFPxg7A8jI30+8I30VuMORc9kiF2yE4a5t7e7Ro8T2yLMWjX4ENr7KdD3uvmyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M9sPduQd2zBKr+l2blBtV2STqEfoykzGg25SkZY3MOE=;
 b=JusHjw+nIcycWbszhN0ioIan55MkwgqdLQxcY4aKvNxU/PDL+7Qrp7VNrjgnVsZRVZuoep3Jsfh4IsAceSH7+NQn09KX7uNwU8YOFVtyC5MntSWHEmcniq71JThU3fH+HOpNuP5xZeP44Eq+Ffkrfe7HByTWM1nZLHRoA9QTTQ639D78aEkhuOaki1eRxfWpwsaGb3S1uBfYjwhR7TENVRtMB00cRbV7El2yoyeArAlWDOyi2WHzyhHORvmxEGOTxI+lQ1j9hxeoFGlDZiS0GuNVbOu9ZEsuLJw1i3S8twMt5/5+jSYFo2iG1MSFP7lWmSn45w/aKXcKvuiU9Tll8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by MW4PR11MB7080.namprd11.prod.outlook.com (2603:10b6:303:21a::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.28; Thu, 13 Mar
 2025 14:28:11 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%3]) with mapi id 15.20.8534.027; Thu, 13 Mar 2025
 14:28:11 +0000
Date: Thu, 13 Mar 2025 09:28:08 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Maarten Lankhorst <dev@lankhorst.se>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 8/8] drm/xe: Split init of xe_gt_init_hwconfig to
 xe_gt_init and *_early
Message-ID: <byjjxgnc5hhzgsbrwbcuj56ihqi4ixs3ihz45n4l6cczu7icv4@ctiesmev7dgt>
References: <20250310200653.89731-1-dev@lankhorst.se>
 <20250310200653.89731-9-dev@lankhorst.se>
 <z4oxa2vgrqorbediwjjwvs5nwtjxqwjtbeenmwa3m53mizdrjy@ox4klandkqsl>
 <4d08feb3-9067-4241-b6a2-e3f6578d1c32@lankhorst.se>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4d08feb3-9067-4241-b6a2-e3f6578d1c32@lankhorst.se>
X-ClientProxiedBy: MW4PR04CA0344.namprd04.prod.outlook.com
 (2603:10b6:303:8a::19) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|MW4PR11MB7080:EE_
X-MS-Office365-Filtering-Correlation-Id: 85e05e6d-d6bb-4866-cdeb-08dd623b4806
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?5A0VGLtlkVWkVw9LOqxwLgABbPAEMkoMTFrGTp6cITNZbFUqUEHMPgpBoj?=
 =?iso-8859-1?Q?q42QWOc3dAtuTQOPpoEX18NH1ctYGw4gPhwvR0ATpwKr3f5nIXx45nZYWE?=
 =?iso-8859-1?Q?XgjX284KdnFSNVEnHwDgmduiYAVzMHOk4eKqbAX/4P310ALRXm0islo4T/?=
 =?iso-8859-1?Q?1COureUkYUyGzvJKuzOA5/gJ0PY5hU5tkZehj/v4iMDWeiIpPPqZaEoUtz?=
 =?iso-8859-1?Q?6q4A5+itMHTaomQLc146SJrj4Q/dpL+60ahexVNQboivwP80CvIRWqPjlD?=
 =?iso-8859-1?Q?qTB5RpDlUmgZ6eIdnIKXs+xyDk1UR9xuE9a8ZCxg4OH8rSGZcOYV7JUNo0?=
 =?iso-8859-1?Q?AtsQYNIoYhIHI9xpeiEi4Xb80ZTV2FHMzYOe4ztl/BPooCr5zIZyI/plbT?=
 =?iso-8859-1?Q?3LH6yODyYlqtW4HDm99UJN4XKAP/gz3B/D+9maN1WEP/qFe1VPt/z6H0Ci?=
 =?iso-8859-1?Q?8SMOqLsXBNzvtq55qzLS4dPYEIt8yBfGnKSJ7M6zYaDhmECJia0K2UFbT+?=
 =?iso-8859-1?Q?ZvOVFXJOFEbroJXbhnoRN1zeUPKDKql7cxWu3+RkBCGTJdjGpg8Vqv/mLi?=
 =?iso-8859-1?Q?U6aBoQD9Jy4XDhUjfQRQe5Y96iJNvMX2KWN5srYKrQPOphgsnCQhZjpmSW?=
 =?iso-8859-1?Q?9LViw22wcmXdhgIS0QPiyvGWtv18bYpD1WYsAsPyLjv5/NWigR/IZyYo6f?=
 =?iso-8859-1?Q?SWF4hPcTthAgJy4m2rZ9XYcNExLBknO202gg1FVb2Ik5Q/7puATatyZkUx?=
 =?iso-8859-1?Q?D7Cdz7WbrfqdF9l1L/kNtlPRrY3OvkVL06ybMOSiO5yqoTXTm+/IfTPtZB?=
 =?iso-8859-1?Q?aSjxvzIKYoncuZs9wdH70izkoNr2cbzVxkn+O25NvtXYkJ6QNmu/xWqKeB?=
 =?iso-8859-1?Q?GnG0n4ZCYYyCLLRVfWAJszXL44lnE6WqnHnGy0Ir4mMW8uF73X4PjhL4EW?=
 =?iso-8859-1?Q?SCDI2rYzi6GQPzeDwZyiNbjkgOeZzKn6gcNNuQD3EkAs/7qauR1hsV7Ndz?=
 =?iso-8859-1?Q?PA3S27XWXWzo3oUNm6iGQfqoJbhUUqSl19SAgvNS+yt8C8zIp/NnTfdwOi?=
 =?iso-8859-1?Q?yjhZ/q4WRXaRAa01g38UMpxTUeSxOZ2arrLld43xdrDQb3/J1zRv2rZItI?=
 =?iso-8859-1?Q?d7B14RZhqvt3aLj536+AOXv4J09xax6eZmvklD3v52HSvUkEcYUcG9OG8h?=
 =?iso-8859-1?Q?1rA6/sM2/quayjC1jTQNmFxAo2a/DVdkZ1HET101U4Ov+zruKhgSo2E8sW?=
 =?iso-8859-1?Q?XhLWlrn7BqDPohuIDU6JYTu4qCCBiW1upBq0obhHPCOe36SYoaUVV6quho?=
 =?iso-8859-1?Q?6juzcZqm6nKXBKHc/m2YzrhQtICUAywcY/2ghIz4pwquCkUpZ/ILGkWfwm?=
 =?iso-8859-1?Q?gC7WB2nI5P6TbowouWGV+0ypc/8o2a9UM6yQNy5Dt1HOnFg8FQ36H4IQ+H?=
 =?iso-8859-1?Q?CVfxe0kt75lZR2OT?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?9+hGxKxuaYgzLGN+ClHDkSL+Wg5/5bgDcE52wodDjUNPEOLXP9xp1GJnBm?=
 =?iso-8859-1?Q?xp1wX3uoAr8cG9768vInl0Qta/Om1AwbSzkRmntStL5n0R3C0oGG9aNPeV?=
 =?iso-8859-1?Q?0x6ETGbjBEPCuXHJzxX4lpuT8szAxjOznkYNAmX8Q8NKVRnsCohnt3b/CB?=
 =?iso-8859-1?Q?JJF3da6EsOKN+BQ68jbIoJmwyHmOCOtruC0gQQ79WHhdP8lLVcU8JlQ/Sx?=
 =?iso-8859-1?Q?exnftU8m59UQTCW5oQ5VGryAo0uDVWMdjOzNRBEquTxtqTnk9DCv2GnWfB?=
 =?iso-8859-1?Q?LgjIP7GuBI33uit20N4PDsSC8fKTuzOImd8VKwj+05hXZZ2trZ+Si84rlZ?=
 =?iso-8859-1?Q?vYB9b7Hi6kIWVT9k9Fb09pLkcdahXszI1+hW1BhQoS79h/DdHHwO8UY9z+?=
 =?iso-8859-1?Q?G6e7R8wWZeruXZ21FkbGkEkfo2WCyL54LmJffaKXIwt3d5RBh8e5UxIzN1?=
 =?iso-8859-1?Q?wGfi8tBACk6fydKwOV2ZxW1Z1j3YAslAViLmnW2SUnvS9BEQPnvi8b9Z8Y?=
 =?iso-8859-1?Q?RUuC/TXOQ/oYjQ0iJg9C2EbraNgIzSVakS5b/Zaecs8dhhvEeUpintZE44?=
 =?iso-8859-1?Q?8TErqcq/8AczyYZKnQYax5O+fegOIsunArUme+9UoE+nlrfruHjw9/Qu+z?=
 =?iso-8859-1?Q?xzBsQnmFuU3ha5r/thhaAKTHmktTPVDi6e7tPHh2pUIQ+O9ZGMixmja3C/?=
 =?iso-8859-1?Q?t2GUbkLEnIylI6HhWdL5CAlhAzv+Up9x43ILAPDK3L/5TDnKyJ231A9Vug?=
 =?iso-8859-1?Q?/NPEk09Gr9xia/jiZFisxqJjVwIvfZwX23TUWcAYTKQLgDCU/WYgndeQs1?=
 =?iso-8859-1?Q?GjNOLXq54uX7AaBnuY53Z/ldCk9OcyKkoSwgjinMFmnjShNlL/YgeMlffc?=
 =?iso-8859-1?Q?Nh1aEOU7llOcSHwWMzEkusItJQroFFruTc1ZCdR1GRt/6AiqdZww/d6g5I?=
 =?iso-8859-1?Q?GuT/YxHPe4PeFaDsHWUhFQA7jG695+HoMelj0VOJuMODR8tszqA6Reexf7?=
 =?iso-8859-1?Q?dxc4YVCTf9F6AsNJJoMwLrdh0N5SzXgf/oThUi473TVxsbVo8vxu+2Rtad?=
 =?iso-8859-1?Q?h9VDRd6g0OQTFW9d37TbSBz04Y1Bp5bzLsza4gJbMp1TdBcoS1AZFB7nwo?=
 =?iso-8859-1?Q?D3a03N4dW6Vg3bJPJRGVfHwwjOIt4IY/aHgxgwsyLYMwrra6V5kts4asNP?=
 =?iso-8859-1?Q?MDZ1LP8XnLSuv/Tz3Xc6Y+gkvOfwUvehNZa1DWfzex3JoiLrwuH3F09KKJ?=
 =?iso-8859-1?Q?utjlrSPRtsV4sOIGuAWOpxGxmHiNgEvIqxMF9E/WQHtzc+WGtEr9PiSWaD?=
 =?iso-8859-1?Q?PrfEP3MDErHCFBterMx8oKBvxF2gsVRCH1byyO51LJcVSTiV20XEvJ+JaJ?=
 =?iso-8859-1?Q?9BlWu2zXVB8DHasC1ctf82EPYtBQDKcdWxOrm9bjVawGB0653QO7MPbLd6?=
 =?iso-8859-1?Q?MBsBe98bDyWDg4GI+CMUz8QRfrsItAbtEsfvmjK33aRuoCO+uZlNWs31em?=
 =?iso-8859-1?Q?0wPKPm0kQHxh2sGASPv0/FKHmH3fGGkCNRs3Pafjl81yQwKXhVdQQYuQc9?=
 =?iso-8859-1?Q?xyPdrZgn+UfvtkboprWVp/0gpATrmM+3xmc85FORZJq9vwC8hvfQBo8HgH?=
 =?iso-8859-1?Q?a/Dz5KrgZbwaFDAhORIuM3E2wQhY6An4au6GvY0w+NKmaSfk3EffWYOA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 85e05e6d-d6bb-4866-cdeb-08dd623b4806
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2025 14:28:10.9536 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ri3T0HC46xwYTOrRxQ/GBliwohPeVmEOTksXly7d2VLQ03obVabwtFeg/CEuBzxZKIXLwp4KZfJZMd6n67vK8Erdl14CBNSoaJh2kRNWzBA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7080
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

On Thu, Mar 13, 2025 at 10:19:58AM +0100, Maarten Lankhorst wrote:
>Hey,
>
>On 2025-03-11 21:55, Lucas De Marchi wrote:
>> On Mon, Mar 10, 2025 at 09:06:53PM +0100, Maarten Lankhorst wrote:
>>> static void xe_gt_fini(void *arg)
>>> @@ -471,6 +451,18 @@ int xe_gt_init(struct xe_gt *gt)
>>>     if (!fw_ref)
>>>         return -ETIMEDOUT;
>>>
>>> +    err = xe_uc_init(&gt->uc);
>>> +    if (err)
>>> +        goto err_force_wake;
>>> +
>>> +    err = xe_uc_init_hwconfig(&gt->uc);
>>> +    if (err)
>>> +        goto err_force_wake;
>>
>> humn... why are these 2 variants not merged together then?
>>
>> at the end of this series I don't know what to expect. Is everything
>> here sufficient or is this part of what we need?
>That's a good question, makes sense to merge those 2 calls.
>
>I haven't done it yet was because I was trying to solve the issue of flickering. If it turns things
>break, then  I want to ensure that we could undo the patches.

and does this series alone, without additional patches, fixes it?

Lucas De Marchi

>
>Wes hould simplify GuC initialisation too, but I wanted to wait with it in order to diagnose issues resulting from
>reworking the ordering flow first. This way it becomes easier to fix any regressions, for both should they pop up.
>
>Cheers,
>~maarten
