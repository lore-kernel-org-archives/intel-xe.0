Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50882CA100F
	for <intel-xe@archiver.kernel.org>; Mon, 22 Sep 2025 19:23:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1255C10E4EF;
	Mon, 22 Sep 2025 19:23:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Q23Cv6Fq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6182F10E4EF
 for <intel-xe@lists.freedesktop.org>; Mon, 22 Sep 2025 19:23:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758569020; x=1790105020;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=noTjZlb0NRCeckCqu+EfdrE2vlPMKACARUJFL5V+LaQ=;
 b=Q23Cv6Fq0iQ0K3Qlir/lBD0Gb//SlLKW5FughWrCuYOhFq6GNhlGHqCW
 3AB0Ppw4eNxv5gMsBW7moahllyB+Xs9HM15jk/olS9CM3C22T0IUvib1q
 IFW2kOP8Qgfw+KZBqDu/zN3axkEAVGcun/0mLC70se3MhpEPF4Guexg+w
 U44J1ZCGoRAwzjp/zik18Om8fvgcYFSkaGe7ctfuWVqz340ZYaVPWfWnZ
 i3lVqPmK1DZpdeCbdhLmxEfd2I3rtzvTTPx/8y0oBNf12k9GY1R6pQMCu
 cUSeS/4AFCDin1cFvdGsEBu9Qjjh3Fygosskqpszxg2zIfmWcY1Fne7hD A==;
X-CSE-ConnectionGUID: Nz+oS0TlSj+u7/v24acS6w==
X-CSE-MsgGUID: zJ/aRdynRrSTTXFiRLu/Sg==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="78282486"
X-IronPort-AV: E=Sophos;i="6.18,285,1751266800"; d="scan'208";a="78282486"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2025 12:23:39 -0700
X-CSE-ConnectionGUID: 12IyofWuS+unf5n04H05Fg==
X-CSE-MsgGUID: AJraasJYQwSSEw0DC38bgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,285,1751266800"; d="scan'208";a="180836138"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2025 12:23:40 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 22 Sep 2025 12:23:39 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Mon, 22 Sep 2025 12:23:39 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.70)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 22 Sep 2025 12:23:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pD4zWfzO5e2UD2OS6ymeMT3ht09CktoCRbVa3g3lsJxQqZ35Xl4MEBmFJSprr8VF9ARikhfI+FOXdz0NZnopSgyFb6bvLjccZWjvAPja6fOnUpdpSPwz5Q9mgV/TxRYDgPgweVzC8FjsJ0xVIPkyLCRbixRnkBzbsdVSB6XlrQA4BEm82hUvjjzPneK4XaInqzBSxpdiLLqMLGnML83N9/lbh+eFwrdGBUZq8/CffLvEN+Jz7hLGr15g7XQge8x3YZd4jM2VJbhKkM89dBxGaCyaohuPOeNTVNTfxWGt3OXrNZdpfn1jHOdcqHsIyeZmig+uBKswhQSeoODeLehyUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CHlId27vchP4H6GOCmhNKEkEorcylcFKArEFSH5EriA=;
 b=Q7L791w2AUUrRds8WwMqdryp1LVPTT4Y0oS1l6I17agcy4xBMe4rQ92KW8Vl5/sN74sOBA27U0+l37NRabo9xMLpbYUXa1sn954SZn86M1HmwadMFsdUH88fSXuqpDYhK+Gaddeg5MQwZ0iKySzEYYBHAR3AuXGuH2XykepazljKLRBoOzx2oiCrf3HYWBXwQjQ4Zln1QNttx2vLEe+La61s89mq9CzybtL/8gmuSJA0JGPOJqXkG4t63gNtvf4n8MhBkNfvzEEPVRk1it17YfMZfd7eUM8dee3/25oidoUBOs3KvX6mqp4gzxaY/1fK0YU/r5kK5u7xqWxpFZW5uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH7PR11MB6402.namprd11.prod.outlook.com (2603:10b6:510:1fa::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.19; Mon, 22 Sep
 2025 19:23:36 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.9137.018; Mon, 22 Sep 2025
 19:23:36 +0000
Date: Mon, 22 Sep 2025 14:23:33 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Jonathan Cavitt <jonathan.cavitt@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <saurabhg.gupta@intel.com>,
 <alex.zuo@intel.com>, <raag.jadav@intel.com>
Subject: Re: [PATCH v2] drm/xe/configfs: Correct mask and pattern check in
 lookup_engine_info
Message-ID: <ctdcwj3yumob47ef6lkkxmkad7ghsy5c5gh7mlhbbuu5vrlgpc@xyvklhu6qod7>
References: <20250922185728.73828-1-jonathan.cavitt@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250922185728.73828-1-jonathan.cavitt@intel.com>
X-ClientProxiedBy: BYAPR01CA0022.prod.exchangelabs.com (2603:10b6:a02:80::35)
 To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH7PR11MB6402:EE_
X-MS-Office365-Filtering-Correlation-Id: a61db5a2-de0f-46c7-9729-08ddfa0d86e4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?+hMTs17WkDSkTlSgakwlIOoqwwoKQhYxBtyR4Cwm3PfIY/w2B/afceqaGcK4?=
 =?us-ascii?Q?ta1bs0bL0DkxaB2LmCSovJ7ITYgT/6ltQ9nVU+g6Jv3FF7Fz49fk/pLjHBfh?=
 =?us-ascii?Q?j6936Q/Qx9+0GQ1K/2Pr3qQBCtb9+5bJoLokYHHFWKHQvvp9pwmGUxbOxVf2?=
 =?us-ascii?Q?fp2VeUptO3mCAsoYguIGZvU58348z3ssNaUefbc1KD0vnD5zy7/wvzVmeeJA?=
 =?us-ascii?Q?TSP0ezE8rDbOWvz8NgyXv02jfCMZtznHphQBiOY8p/vOmcJGYDBM9CwG74T8?=
 =?us-ascii?Q?fQ2OOcRNByxHu2ytOu/3Ccd52CvxJpF4s6HJ1wG0J/C2NPUXKTWMlOdYuIYn?=
 =?us-ascii?Q?3UoIPZc7x3sE9kuoAqIyCTCizFEaA2d83QeayCCYx2hgK/La82+VjH18hWO7?=
 =?us-ascii?Q?JWmwtaYXFfOICCL52Z5CGUg/K77EOpUfUX0p3hsdAGEpJnSJDi5r2VpvGI8b?=
 =?us-ascii?Q?RsCKEFjBz6TYu6hP+kO3EP5+mhQTFVGLWe/3bnWknoPCdJ0BpD87KyOR1eih?=
 =?us-ascii?Q?dcIP+cTc8ijOvHZBO4wmn6rool8Z9BuIX+T3eA2b6xQN3teW8sXm9GFup4Pa?=
 =?us-ascii?Q?3nKc5hdK6GquzjTm14qpF1FAzdZfe1rJhESoC+r3SqeJhL7PpJdETbNQPJ5l?=
 =?us-ascii?Q?J0RUKtnuWrV8QobcvpXtCIMkFMf2FoSQj/IEVMoE5Bk816SfC1jLXA6SxN+U?=
 =?us-ascii?Q?46qaQkzxF11cPOyzkrb/qZbLSAF2U6XOY61XSQhGoIZ8M5xk4UKWLi4ySdXH?=
 =?us-ascii?Q?bRU6vvd7FyD9HRtPcfeid2/tYdM68kDPYFiuJNwap2lnTQK3T8uZh4riXfMS?=
 =?us-ascii?Q?HBegHQ8BYTtoYlAm3/LdIaYkNMB23SRyAjm5CrsSYeSfPGUDHMHBjitUWRgi?=
 =?us-ascii?Q?imuSViykVo9bVaGpb5mr3XaeQt6g6hjdVRRnrBWKGVfDCCvo1z9g4ejNjmE4?=
 =?us-ascii?Q?i7ohIpEE3/oK+PWkSDWpNbYqCr15rSp+KN16svYUUi9g6Q8oFCE1OiR/N5oE?=
 =?us-ascii?Q?VzPGKzMH7+koP+G5+5dkfUhwInd0ejUFvZe862+rzv/9Nbb4u3iOad8NM9db?=
 =?us-ascii?Q?23ddRirkoLbW01kVG0kn7VLc0ySpsQab9a1U6erJVZZNuARKhZP98y8YrkSC?=
 =?us-ascii?Q?PjOI12mb9sEfLqR32uFD5+tK/VEWlQ+fXng3ChPNM/nQdNsvVMdBFpivW4PE?=
 =?us-ascii?Q?h6T7mFjfPKrTvEAETI50RHSXrAdYkYgkOdtUZ/VAsZ2nRoPzN75/OL/nsnAb?=
 =?us-ascii?Q?5LKVBEsa5yRy4FYap1CA0+8uQIIqljowdxcI4Uz+xm6ef3CNe/eLtMDLfB+6?=
 =?us-ascii?Q?8IldY9nDV5rERsKrloXkhWQ18UVzg5UWnKNeDBR2JQNRDujd92BxPDdVdzOu?=
 =?us-ascii?Q?sN9jzbjitZ/8Rrm+eDk4hZO1VOkH2bQTEnECKvDeuQhKLGpu5iyJyWgK273R?=
 =?us-ascii?Q?myAYap5cA6U=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?pGX0EZLQm18ciAV8gNsAMuX/MNu/k13Zj8HT7+RsTCwHRARjSYB19WFMfp/E?=
 =?us-ascii?Q?8dzFKn/pBKNFEHsQqMz/1cCYbDq6uLXEj+FBTSIt93V4mGsHZC6g9eQsgA08?=
 =?us-ascii?Q?bifzvQRM/uVrDED5JFu1CifCrRl/HEgclJWgboh7ulbRnSSCXmNek0/9RjUA?=
 =?us-ascii?Q?YZMyq+KU0Z+M1ficBYJyZOd+IEi/+3oyHxieRUm7y4LHioabGsukQ6ibCxuC?=
 =?us-ascii?Q?fM7czFAq0VeVDnOFcFOkE/5QOCC0B+PxA/+4bqDEbpMlpwDAQVLeAzSNCEK6?=
 =?us-ascii?Q?D164Ab1AHcmP1llcmUTnSiFoK6L3YsdkgR2gzJmk0lLk165Cs/tdgKpAs31M?=
 =?us-ascii?Q?pv0mFGWkPpd3mvdLQsHlnlQicy9N3kvKrCNSeLRVckToD/PM1g+rzE0FUFuE?=
 =?us-ascii?Q?uQEJi2fPtVj1POWV5ReF/Mw+JxQcxSgA7Dm5kN0jgU+uwcF73SqanY4+ax/U?=
 =?us-ascii?Q?psuwDQlAoWYI6a+Ge2G+R8zVYTWaUROlvEp5Ja5NUM41zL7Y6o81WWkBOzN9?=
 =?us-ascii?Q?b+Cn9+bgUY9efobxqyhYLKNG81/yuaH0Phds9y7S+Ct5U0cn2Y05hgIX7sgW?=
 =?us-ascii?Q?rB0MlyAIBztw0OAS53zcQA5EcclyanmYQ//9WE7XPpYl14zo/UvxFUo3kDdy?=
 =?us-ascii?Q?gm7RtVg/tyK/E9Itf/A2hTRaqOGsKfFG084hKn1UAMGH9l8oRqroqVOhKZry?=
 =?us-ascii?Q?N6L/ly8eJ8PHyAsfMO2opHrrDB8Ke1CvYKmjuG4Guv3X3fOJmTULAVkzDWT3?=
 =?us-ascii?Q?57s3eTYnAXLMFf/HgBqAJ/8QRAQwewcpSVzJfoaYN//AWJmOW/W/iLuS27rv?=
 =?us-ascii?Q?ed6JIudYhKFllAVZDIwPhZuKUgliQ4jKrTnIBQvCkfVq2TTqw7pqavaBWeW2?=
 =?us-ascii?Q?PXfIP7OEa77twyTg0vccN7UindCaWAIJ+H2jS8zwmRaAgcqdmoiXx7pNdv5E?=
 =?us-ascii?Q?J8Lsfnt9G6qtj3a5Ju83GGzHnvHmTcZiIKdnWIqcuxTILw9EoIYZWB4GVKiF?=
 =?us-ascii?Q?uyOhpivkLaKeTLtxsxpEbiz60bPrL2Hp2FLWAbhzlaSgLIpihPHstJ2cecYm?=
 =?us-ascii?Q?IUtMw+IR2UM4DN7dU5F5gFpA1duMMGEn3mhbkVlZBO5k/POv4FSebTd19Sw/?=
 =?us-ascii?Q?YtKdz5KTy43XVzVGN4siPKRVH7WW4MGTh321rxiwAtphjMo9BliLC2ZgoFCS?=
 =?us-ascii?Q?7KZi5p1VUY71IUqnBis+e2fHezIWZmCJ3I7zh4eoxy15mllvVvntLbIwXsnB?=
 =?us-ascii?Q?tOfuuc4n0NOouPcUURgnMdu1tf/c+2mwwPi3OYc3JEp5lxXRTWgvLbQ7JS7S?=
 =?us-ascii?Q?5GxFqjFcJAJkAGgVVcLC1bqpO4bxYY7K/+jUKYVbLwA/cACVNzmz5ZEDSjk+?=
 =?us-ascii?Q?NINBvWKhrdAFFPVjJJrBwgfEtIN274E5h+HD9VNaMTjH8steIhm+G88rVE5V?=
 =?us-ascii?Q?O0/zLuyv0QW6dSjNNg0oPRckNLKr9NMZLy9NpNF8NMRWZwLxn9FHm1hN5z5D?=
 =?us-ascii?Q?KGmXQmjzRSqjRyU+qnefeZngL1AWcqdN9RSxPPOZXT4HKXjzl7meZngyGmYD?=
 =?us-ascii?Q?bmqvEjyPgOoRkSlMeCojZQxYyuj7f0ZMkZE9B4DOPQOJcPyf6jPWHOJhQdH6?=
 =?us-ascii?Q?BA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a61db5a2-de0f-46c7-9729-08ddfa0d86e4
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2025 19:23:36.2769 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Jh4szUFEHNMs1F4xXqVz6wjmCFpg+H34Q8z9mUa77cCCe+e8yxT4Pj7DflPy3X+3VoEl9RtqeRmsXXMa+huWsxSsU1BPznKsYhtHq3fcAVU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6402
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

On Mon, Sep 22, 2025 at 06:57:28PM +0000, Jonathan Cavitt wrote:
>lookup_engine_info is described as such:
>
>"Lookup engine_info. If @mask is not NULL, reduce the mask according to
>the instance in @pattern"
>
>According to the description, we should be exiting the execution early
>if mask is NULL.  However, we appear to only do this if the mask is NULL
>AND we have reached the end of the pattern string, as opposed to when
>the mask is NULL OR we have reached the end of the pattern string.  Fix
>this to prevent a NULL pointer dereference.
>
>v2: Update commit message for clarify (Lucas, Raag)
>
>Fixes: e2a9854d806e ("drm/xe/configfs: Allow to select by class only")
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>Cc: Raag Jadav <raag.jadav@intel.com>
>Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
>---
> drivers/gpu/drm/xe/xe_configfs.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_configfs.c
>index 8a9b950e7a6d..0c048d4a33ab 100644
>--- a/drivers/gpu/drm/xe/xe_configfs.c
>+++ b/drivers/gpu/drm/xe/xe_configfs.c
>@@ -324,7 +324,7 @@ static const struct engine_info *lookup_engine_info(const char *pattern, u64 *ma
> 			continue;
>
> 		pattern += strlen(engine_info[i].cls);
>-		if (!mask && !*pattern)
>+		if (!mask || !*pattern)

this would add 2 bugs in one line change.

Lucas De Marchi

> 			return &engine_info[i];
>
> 		if (!strcmp(pattern, "*")) {
>-- 
>2.43.0
>
