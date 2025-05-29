Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33F64C54FB3
	for <intel-xe@archiver.kernel.org>; Thu, 29 May 2025 04:11:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B60DE10E1C6;
	Thu, 29 May 2025 04:11:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="O+Gsy3Jb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCF7210E1C6
 for <intel-xe@lists.freedesktop.org>; Thu, 29 May 2025 04:11:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748491870; x=1780027870;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=/kBHLuYifcZgkyusHeJruIPES2LafIA32879KJ37cNU=;
 b=O+Gsy3Jb2+57E+zJieHCf1tURpqQ8W8EbTJc6EB203WBz8+fNgvFWroA
 hVkz2kzlUSKCKUhNbQuqp8beIGr9CUGBzWVx/tnwKiXhEdzJEHIWnbmXo
 2w+NGz1hWwuuuvFzYehu9gBaybNq6o0CRoofGXhooHSu/EkXUsmFv++xI
 EmpqhZYcxupEYecxFf6QOUDvi1+PRnFEeN52ZquUwNBo7LgVAVrWg0FQA
 sFMYd6Z+dgLIyz9jW8gv2tYrwumaH6FFsbqQP9l5lRrTDHn2ETkkabCds
 70pn+s1knJROim+edCPo7xYRGB9ZMqV8+AX5IRwtJTyH+v7zumeJ4vRBV Q==;
X-CSE-ConnectionGUID: WexHYt2JSxamQdu64kyFdA==
X-CSE-MsgGUID: Ar5QLLmcQ/io0GvkibZrpQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11447"; a="67957294"
X-IronPort-AV: E=Sophos;i="6.15,322,1739865600"; d="scan'208";a="67957294"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2025 21:11:09 -0700
X-CSE-ConnectionGUID: 38zr6cS7RBqFYIY/7Ut56g==
X-CSE-MsgGUID: kuy9mkcmQIOvd0e0axOWgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,322,1739865600"; d="scan'208";a="148482555"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2025 21:11:09 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 28 May 2025 21:11:09 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 28 May 2025 21:11:09 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (40.107.244.89)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Wed, 28 May 2025 21:11:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c1zuESkceHtw7rqXixz1d5CvCsYF8KoymYB7Oqpv8z3AMMiFDFHvKCVs+xeTXfCmqx9iGk/U1O+GzoXqThzmRoYGC0o0nW0uos8fqVG2srNnvAjz/dCoaTvy2QjvCqXGQDkWqXtTFOnd3U3J9bL43YMUsxPtIeGZALLr4Wx2wMD23e2dJdsGQBjqw6OFc5DOur4VTak+hy3vZbrGuUa10TfMrAktSF2rJEJ5nxt0V6l4WQtxqn5cGRGgJS67+lk/tFZncsa3jUjjmxBQWsQFaNHgriuFU5x2fnIcloAe8GwTSH388vUavZU6A8pkfhYQdpe4tAJJ1rPL6tLVZd0ETQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WM450le8+owov1rSamLuQTndx1DLHjO5Yl093DpS5ig=;
 b=aU3vNor2JO2jPjqj+vcp4AbmGu28jnViAcpsbfI9W2gaKouzJJ8/Iom604l245vbZ7dLyJeFj2pw0LEIpZwclp92y5Nzp3qwbOTwz1xzWuPsOxaKKxsrnNhFv8VVAmZhDjZgWkU+pFydt7O/THBOOfnm+NwJI7Sk3PomE3C7K1fA1PXN3zNOuwZEXiwJIifnyL5ZFVHzEPn2LKbY2fcN1sgBEcFdbG16jHb3AvVw2qPsiwSNQLcso0rnAG9WWIBeQ0EI/RG9gDsfJmN9b3lB0FUaA2uValuZriWCj+kdqVcKIIsik412+Y39OQRTHjK68qrSmJKtEdOui6+wFwuxQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6952.namprd11.prod.outlook.com (2603:10b6:510:224::13)
 by LV3PR11MB8602.namprd11.prod.outlook.com (2603:10b6:408:1b3::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Thu, 29 May
 2025 04:11:07 +0000
Received: from PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::ffd7:2656:a8c4:43b0]) by PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::ffd7:2656:a8c4:43b0%6]) with mapi id 15.20.8722.027; Thu, 29 May 2025
 04:11:07 +0000
Date: Wed, 28 May 2025 21:08:24 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Maarten Lankhorst <maarten@lankhorst.se>
CC: <intel-xe@lists.freedesktop.org>, <stuart.summers@intel.com>
Subject: Re: [PATCH] drm/xe: Have LRC hold VM reference
Message-ID: <aDfduL7aPf5uxbZu@nvishwa1-desk1>
References: <20250522180906.2181573-2-niranjana.vishwanathapura@intel.com>
 <abcc3cac-ef1e-41eb-8464-55b6b774e97e@lankhorst.se>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <abcc3cac-ef1e-41eb-8464-55b6b774e97e@lankhorst.se>
X-ClientProxiedBy: SJ0PR05CA0117.namprd05.prod.outlook.com
 (2603:10b6:a03:334::32) To PH8PR11MB6952.namprd11.prod.outlook.com
 (2603:10b6:510:224::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6952:EE_|LV3PR11MB8602:EE_
X-MS-Office365-Filtering-Correlation-Id: f80dd8d0-88e1-4028-14e5-08dd9e66d5d7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?NucQX8//wpCYph6TVIGoYQ3dHKykyP7BN7fjSQIp/495LMOEWd9OWgnpOXrb?=
 =?us-ascii?Q?IkPXuS2+b+5CsrOFkw6+2U6eC1P+fp1q50wqpkSBAqhFlUai7ilTtmDEAVxR?=
 =?us-ascii?Q?ZZuoZejRp4nJnnOrypCC5jeqJSwF8EvZdKfBfsCtcQbgW4QHpHST3cKotyrF?=
 =?us-ascii?Q?DBFbIjWVSgD3dp/2ECqRp6mwcXTU/+UBpaWLK58iksXiVAjs4G2Ah2gOo4zv?=
 =?us-ascii?Q?ij15BkaS3Z6njuhsyAjAxevryMGhzc84Sz4glCnooFOjM+kchk/G0PuWA+yM?=
 =?us-ascii?Q?kj9rcN0fBFir5LcB2qNwiByvuKzQH7ahqcLpv7jFYSEgljQw4zjidDJzIc69?=
 =?us-ascii?Q?d8exUy4670xm+PSZPzmSHv49OS/et1ig50YzKR6YsFA/SWqCPtBuGx4TjfZg?=
 =?us-ascii?Q?SzxXP19Cc9Yt3DwJD1QI2DxPr8y+IGxVWNfqWf7No4WBdVN38GRCi+n0H557?=
 =?us-ascii?Q?tibqOow14cw+Fs+gfbtYkPK2lkcMyUT9zeKQBMYDdXLMRHEe6D85Gdo5DYM/?=
 =?us-ascii?Q?DigtiLsPQDP0is8gg4GSAI3fEKJuVXbIABdljHpO6wU0qOnRtg2CBtp585OZ?=
 =?us-ascii?Q?pM+50u8TjQfUTYsEz7sbUBGLhEFyHd4OqXxDhdsenHKEa849v9EzhlubfJkK?=
 =?us-ascii?Q?qRQt+dJLpsL6CpZTNddiX/I9rfp/xdqg+k4cxbzG4+C4VUCkQn6lmWSHVDYQ?=
 =?us-ascii?Q?HLVF9+eLFODZN/unwdALbN7gjjKhNAeiUaNHse2zKeZW2on7mU6EDg/obCw5?=
 =?us-ascii?Q?lVmBDKxYBuyJGFfB7IUVpT4C3/cQ+CQnqOzYO+h3Q4u/hxMmNQpbUSR7gABB?=
 =?us-ascii?Q?RaKRInj2tz2G3i+5uYufli2aO0cy2Swk2yu5x29mgb9txtr8KLqc72aFEcM+?=
 =?us-ascii?Q?hUbBqn7+5iNja8G/wNsrauDQ+SlMvVH10bSUe7D7b9+fRnvm9pKZAPJlT0GY?=
 =?us-ascii?Q?wTJ4QgbtsPSXWIcb80EFAG2OOxiJzXFwMf69MQ1JiwqrGdti5MXrUdJfyRja?=
 =?us-ascii?Q?HKaYaMNJVrvvD5PWPXIEmWrtjsAGyNcBq5xSr3iiUdoyR1x90U77YOThgAiJ?=
 =?us-ascii?Q?o55PypJAiP47PfBrN8DxVtJ2eoz4tYnuABMKfFB7Egxk0BrfAjUs2iZcBKKy?=
 =?us-ascii?Q?8MmxqpjNyCRVLTYGOW0nSaeC/e4cEzfGpox0XeXckThSEcJfwx1i8M6mJI0d?=
 =?us-ascii?Q?56HpV69or2i43dJf3qYLhfBLe+UQFO4fabBfthkXYVpGSFzwO9wYeic7pwvr?=
 =?us-ascii?Q?oNwK3GIS2UsxmlycMsXrynqQQnOChABzdi9cDkvdYzrjVHSRrwlY5I/D4QUY?=
 =?us-ascii?Q?IDPqLf4WFyuu3fevfOI/QAIoLva1GOs07PCr5nppHFQoAIlFiC2KeFbJYcMc?=
 =?us-ascii?Q?9iG+2BE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6952.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?CJjZRZwwwnpzbgHM/D6KVIO8ZD8xyNStqVPZlz9gdsE0mjyIaRTbcmAb6AOk?=
 =?us-ascii?Q?eqwfHgYLu8fGkVhh0x5jT4ouEdrhVCWb4XADizQNtF5pFBK/o7zV6CBloK78?=
 =?us-ascii?Q?jADftJl52ilmGxOMsD6Qd2fBjvgTL3Ss/rlVuyWQqQbadYGl02vpprOCxTys?=
 =?us-ascii?Q?o7tKiAVkHHmTjiVBdbAVQDgyAIqc4rcw1lOLlZW33SlDbxur7tInhVbZ+wjl?=
 =?us-ascii?Q?9xhrHlLw/X7sPJoTR8AFF7HI1GcZbLi+PnHaIDj143GajTF+Z340lRsa+zv+?=
 =?us-ascii?Q?qzzMBRWX4PG/B1TiHhfu83t0tMBSJRzz+sNi+7qZIRJ1bG3x4bPBSz1o3INj?=
 =?us-ascii?Q?Gwa9RfY2Z42GHOPxywgWhTtyloZuKI+dEo46c/yYSYtV5ZcmHRqrd5G1b+qT?=
 =?us-ascii?Q?2q4+XMUxoibilMMC3zHPDMnMf9jHymdst6hdUIMFG6dN5fbas5cehfL/CXVc?=
 =?us-ascii?Q?wjjAWaTFE4GmYBme7zI77465hLkeVRLHMRe8xj4RIKLSqHT+rKX9TFxCRUm5?=
 =?us-ascii?Q?zb7n2FXfHh6+WF9NaX6lhJc5GVINCwGwESD7gBUORqMOgReF+chCBm+Nv10r?=
 =?us-ascii?Q?QEJIwSjvFUkDGCjrzVcVYNJY9AYRM2yq7zde3NpGYyCGIEvxv4BkwDjifV4w?=
 =?us-ascii?Q?3rb710cjAY5ligCdU67uvMt1YQ1IHrA5zZsf1l51c1lwnSV0oWCylxQlS+w5?=
 =?us-ascii?Q?4Jx+pLX137oWZx3L8Tpv7Dt4ph7A9ov0IE5SlRFEsL2R7fLpQdpt6zTKZ0iz?=
 =?us-ascii?Q?25CpoDV4txJfSMHJngQfdmxC9x2ckY7l41JrkrVMOMQrnaaEWM86T1kilAEg?=
 =?us-ascii?Q?3/7p9VVQl/NuyZ+txCNs1gY0rXCAM3Fk8rz03Z9beYMdqyfHuA144F44aAtu?=
 =?us-ascii?Q?9zRnBHie4i7v49nr+0iSOQUtmLfqs9c3DbmcsnsUA1k/7BEFjobES2GIOYU5?=
 =?us-ascii?Q?g0gb4/Sj40NOSCngo/k1X+VtyX9kqeIZ7Vl0mvhSIvdscg4YqVSQVfPX2Kf1?=
 =?us-ascii?Q?PwOxA0BlBqMjIv/7Wdc9cm5DWPtEtHqfZrGEwGytAy1B91ZCa6YEzeNJCq2j?=
 =?us-ascii?Q?LHNSX/ZkYasbrxWxTO1Xl6Eo1hwu8yxCRMDWpPiAV1yKGTXs0OWVQ/bqRKJ/?=
 =?us-ascii?Q?8P8cfJ5HNK+s4DwRAZMf031zRQ0ZHgG7TJJmtiHIBkyVuOxO8fIw77tLPu28?=
 =?us-ascii?Q?pb6Jhny+0ewYpwFXvwWuQl2DbvytIFayEl1Uz8yVqH4e75oO+0iHJZAEFYDW?=
 =?us-ascii?Q?sKxOdUuwkMgpzGSJZ+7WD6sgYr/h8zdBv98GyxCO5GgSvI6VKkbwYt6kKAPr?=
 =?us-ascii?Q?lLdHVAvz9DisZhTB7b6yCZUPhHVUrWEcuGOzxct7bHmcShOcQJlYUpFp3zeD?=
 =?us-ascii?Q?enG3AfiCmOFWfKu2m53VKxz5SdmObnaGaMf21c/69ZC3v/S7s8x2antjE4+q?=
 =?us-ascii?Q?1gwOl8aL/07tmvgdQfjJVOIvEK2OgnP6E/CxR047DIhtewHg/CXam/UFS98r?=
 =?us-ascii?Q?Av50y8WrgykSBHqnkcvJGCOclmMF/zOFbXlomP6ts+HDoO4xaHA5UUECVs73?=
 =?us-ascii?Q?wkBE+QTFJb78JyhX5n4kyoH3v2DD9MDjVcB9+ct1JcCO5LQekiDoMHkpEwE9?=
 =?us-ascii?Q?5isk+kUDMaesmn5rroYqrR4=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f80dd8d0-88e1-4028-14e5-08dd9e66d5d7
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6952.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2025 04:11:06.9704 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XnMXJbwMTJPKpcMa5AtKpJadONfyQIlotkngXSkznGBhXH/tbZDv/Pc+xltiLDfP93oYTNLl5CcW5CGfpsVElYhiadshfC9EinnFNXfOY044UP8Q0mIdaNQCPwlSZ5i8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8602
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

On Fri, May 23, 2025 at 08:37:43PM +0200, Maarten Lankhorst wrote:
>Hey,
>
>The patch seems like it's missing a fixes tag. Additionally, I would say it's missing a description of the bug being fixed.
>
>Because of this, I'm not entirely clear if this is the correct way to solve the problem.
>
>Looking at the code, I only see that execlists might end up with a reference on LRC, is that when the problem happens?
>
>Could you simply add XE_BO_FLAG_USER on create instead?
>

Can't use XE_BO_FLAG_USER here as that does more than just taking VM's
reference.

I have posted a new patch here that creates lrc->bo without VM.
https://patchwork.freedesktop.org/series/149616/
Can you please take a look?

Thanks,
Niranjana

>Kind regards,
>~Maarten Lankhorst
>
>On 2025-05-22 20:09, Niranjana Vishwanathapura wrote:
>> LRC's BO uses VM's dma_resv object. Have LRC hold
>> VM reference.
>>
>> Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
>> Reviewed-by: Stuart Summers <stuart.summers@intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_lrc.c | 9 +++++++++
>>  1 file changed, 9 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
>> index 61a2e87990a9..efdf4ef35b35 100644
>> --- a/drivers/gpu/drm/xe/xe_lrc.c
>> +++ b/drivers/gpu/drm/xe/xe_lrc.c
>> @@ -908,12 +908,17 @@ static void xe_lrc_set_ppgtt(struct xe_lrc *lrc, struct xe_vm *vm)
>>
>>  static void xe_lrc_finish(struct xe_lrc *lrc)
>>  {
>> +	struct xe_vm *vm = lrc->bo->vm;
>> +
>>  	xe_hw_fence_ctx_finish(&lrc->fence_ctx);
>>  	xe_bo_lock(lrc->bo, false);
>>  	xe_bo_unpin(lrc->bo);
>>  	xe_bo_unlock(lrc->bo);
>>  	xe_bo_put(lrc->bo);
>>  	xe_bo_unpin_map_no_vm(lrc->bb_per_ctx_bo);
>> +
>> +	if (vm)
>> +		xe_vm_put(vm);
>>  }
>>
>>  /*
>> @@ -1013,6 +1018,10 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
>>  	if (IS_ERR(lrc->bo))
>>  		return PTR_ERR(lrc->bo);
>>
>> +	/* The lrc->bo uses VM's dma_resv object, take VM reference */
>> +	if (vm)
>> +		xe_vm_get(vm);
>> +
>>  	lrc->bb_per_ctx_bo = xe_bo_create_pin_map(xe, tile, NULL, SZ_4K,
>>  						  ttm_bo_type_kernel,
>>  						  bo_flags);
>
