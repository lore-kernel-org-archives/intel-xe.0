Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C08CAC54F30
	for <intel-xe@archiver.kernel.org>; Tue, 27 May 2025 19:24:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C5B910E51A;
	Tue, 27 May 2025 19:24:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Fbagq9Gx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCB4210E51A
 for <intel-xe@lists.freedesktop.org>; Tue, 27 May 2025 19:24:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748373855; x=1779909855;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=jocc214J/VstxzzSSBv/c1YngynFGV7jXketpXfgIK0=;
 b=Fbagq9GxixSaydnNOgEtfDxzbQcupXmdXUptvXgsDFEB9BoxaMgpeZV6
 a1eoK+7ImAuOr3P0cwTXLDP//u4jhxOqDGRQGiIp/Y5uxEHrc+z1abEOC
 lix9Q5CoZeSJK8E4niU115ADlCWiYCgI2w6I5U1ZDcO+YnMGW0nZiZWwg
 aO+8ElFmvfOtp16oFjSHzBEJ4pU/WJqbXbo7Vcpdtu9e4F3Hj5H6b51HX
 ipAlAcWPdNUPUwV5O8AnmFCQDXQhr3yi5hR47Sl5XdjiJmdJ0FVvO29IL
 h7w1VwK5v0tku/NZS4J0J/RN56qESySPMzKkaYLH6WcinopeX8iV6kKOL w==;
X-CSE-ConnectionGUID: FLNfHjB7SmSOvVa/cTYJLQ==
X-CSE-MsgGUID: YNX0t2LtTByjhJ4faG/LpA==
X-IronPort-AV: E=McAfee;i="6700,10204,11446"; a="50437040"
X-IronPort-AV: E=Sophos;i="6.15,319,1739865600"; d="scan'208";a="50437040"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2025 12:24:15 -0700
X-CSE-ConnectionGUID: aLhDUf99TUK7WiM6/1lQEQ==
X-CSE-MsgGUID: 7Z9yd0iXRaygZg/w78vG6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,319,1739865600"; d="scan'208";a="143915316"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2025 12:24:15 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 27 May 2025 12:24:14 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 27 May 2025 12:24:14 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (40.107.96.60) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Tue, 27 May 2025 12:24:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Xm+doI6ZqRNQTFqHP/LBt/1aztRcFujLcEMtJUlktHODrgyr8a2BLF6ob/GNYdSgNr3lxq1GdLQB605TlkeqtbDwh9dUojfq9ZwFdCdcf5xR+lDqElRfZlcEnI5ArHe089aEfNI3qfd2UrO13Qwhs68g2E3yu0e4NNUYghi8URFWeS5z9mHnUaWBotApoPnWeHTAJH4IhmXCoPpwVreFn6I7DhqJEXm8LtosdHrvzBu4+Itr7CnJoGcwW8EtcDBfoxIpd0mQu8/fOa+OGJNpte8iLdsfodgDdp9vrEyH2yI3leiaGx0uTmQb3KKrky6JiCIhLDT5BBXsOvrTMUOfKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HL5fvLPLKBWyE4rIyeM9okMdJpQRt9Q9Zx0OZNtmy8I=;
 b=Qf7HUnmUVhZygRKGmWlNAlPXz315hEBal7lOzXM+/bhAOq8to7StbLvcBWVcfFJ3EVDBhjWxvJzfP0orza644X2Bb1sRL9qcTPRWTEV4o4RLnLD7rq4iVlARhlMqBdVbRELbcCDrE4Xvc0iuSX+Sm9pyMSYjiGpNB+SY5qf12Ocaj3mwwu+8V0uVFgXcNM0Q6G90Uc8SmdjJck6ZFST1VT8vXG08Mu25mioYiDcrU3UgSqmCglAnfFOK2kamZbis3+D7PcpX74k/IQEp/Xo1FLZ0pnd+gfzgMufYS2sLZhrXpOzR8dfN+JlY74c80jNPIAZO2bVnZDvM114sYd2yTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DS0PR11MB7878.namprd11.prod.outlook.com (2603:10b6:8:f6::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.27; Tue, 27 May
 2025 19:23:31 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%5]) with mapi id 15.20.8769.025; Tue, 27 May 2025
 19:23:31 +0000
Date: Tue, 27 May 2025 14:23:28 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 2/2] drm/xe: Add missing documentation of rpa_freq
Message-ID: <wpxa4qf6wdgyn2gvfr463zhuswe6b7774y2l5eeojlicezotal@bbrsndsqdgn6>
References: <20250521165146.39616-3-rodrigo.vivi@intel.com>
 <20250521165146.39616-4-rodrigo.vivi@intel.com>
 <04ea69b6-3dbc-4f50-8f9d-d80ac5856556@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <04ea69b6-3dbc-4f50-8f9d-d80ac5856556@intel.com>
X-ClientProxiedBy: BY3PR05CA0010.namprd05.prod.outlook.com
 (2603:10b6:a03:254::15) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DS0PR11MB7878:EE_
X-MS-Office365-Filtering-Correlation-Id: cdde5d9c-fd97-4d91-ad27-08dd9d53f702
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?lUkYH634tIaXFJ9gFh2x9vAw2VJyYDjVD97En0DbFG+uPxBJbq6mjgrBSbvc?=
 =?us-ascii?Q?V9iEZZ3L0c9snTBhvWcGLBuSic2tTwMrrWcj+FnIkM3OggQdoiwxRLhOCOhi?=
 =?us-ascii?Q?yIcHrG+OAygoQIGlAuE9gZQF6WUDqiuPxMNHPktpW8B/BdcCaN3blhlhWktU?=
 =?us-ascii?Q?dObzojC2a9fjKVBxEWAkrzjgLUw/PzxUGDgQZAwW0xl/Zv2iHyYBBIG9elmy?=
 =?us-ascii?Q?nJwy1odYnyb56HQ+R2MebpBCAyNcOiWJAXBOk1tEZ+ZXNYILcZ0P6PJHbyvb?=
 =?us-ascii?Q?dOBuxpgGDvkYScypq/5TvZRJ1kNZ7meReJeAu60DsAvO+HBSVqwoTdlh51ph?=
 =?us-ascii?Q?RunnC1f6fcpCRy4kXT73lXyPa19/MTe7G1h+0ZMgt5wqL8oqhUpnI5Q4077B?=
 =?us-ascii?Q?xIQNUUR/LGYxEIXSj/qcrtQ/gB4arx0ErrYzPdMtPUJDjlW6DrQDwaCwQF+5?=
 =?us-ascii?Q?k2RYlL0zc8uNg/LbSFzEGFqHJtLaUXw24Q7qD/4Ht8z9475IhfzslifmIyrA?=
 =?us-ascii?Q?6JMaXCStU2J23OmBioQUOC7yfEqxc10Fq4jZOovZsFzHT1JN1hBGtdZAdcrp?=
 =?us-ascii?Q?JiH2OqysC/pqoHreP9EgHPoJoKWLaxCJkmfv0nHNOVo/hCyBzM7UyawkOaji?=
 =?us-ascii?Q?BW+McvRFg4QfZ8tGf+ZIzJScGo+/yG78vGU48e5+AgDBYgGcSULNWUMbtZqA?=
 =?us-ascii?Q?VMx64wzUsO6UHbYNSUUqSPjj77lWBySDokXD8vAb+xqsTpJoJFmtDtNllOvr?=
 =?us-ascii?Q?3lRx1dL/oQZZfq/JBXQa3S82F5cP9eOS1PDTm5CXNzfhJujtfHTKU3niJ2nb?=
 =?us-ascii?Q?9msHgUNNwUxBZN5y6CegSqi9ZRL3cvdnbS40/R0nSzpFu49VddHBaZh140Fv?=
 =?us-ascii?Q?O3TYEfoy7MHb59nhKx9O95wqCwYBqfWaVsrQyoPoxL1hmOPVH4Eh1g4saHmF?=
 =?us-ascii?Q?5N+ps1VOgybHJ41jA8em810a6HKq66iWTKQqvjsVm+kNRkvfjp7gnNP5tZAU?=
 =?us-ascii?Q?JqqRD4gj4K5Pbux5xwJM4qK65TeYOhWtP53s1DjfZfcEdq7O/n8v+CvmOF8h?=
 =?us-ascii?Q?9syzc8ZAlN5tyxBT7hjW5y6Ve3CwjWQb0wK5txSyBMHbL05J6K7oUudLKUDy?=
 =?us-ascii?Q?FafTnY8L2gsp+prxMt6buqqbiCXZIJjQGr+zB77HPqrc1XjKJeCz15lmtKyi?=
 =?us-ascii?Q?lPjcIWeLfLUR/r8u0DD/WEALk6DHEiC2qqDPi+GfdTBDdEEwmQ/UkGFKGeLb?=
 =?us-ascii?Q?C21j9FGbeQBSJmwI+p/J6AvnHfMQCJsVe1AhKfMZW9iZUjoubty2a63OzArz?=
 =?us-ascii?Q?ik6f7lIWvY+RVqmr7WhjRqywxwTOqyKWOvsVvnRIY/QxYBn8pQ6LpEzSbz7t?=
 =?us-ascii?Q?Jn7XRRNGca3qlKhV44ZGiqDyy1VmUjE5lfs0vM8AX2Qa4l9O1r+3BKDS7Siv?=
 =?us-ascii?Q?BuT3u5sX2mU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?piyO0yXB4+cX4rSFlKi2pg5uXxa3YclvyXopwmTw4EvDVTn6M+P8Va67xpf2?=
 =?us-ascii?Q?KeCNJsoNf0JIow14Ij+j7OMqFh2LOn3jDzJOGSkU9EThrJt5mOfc/xKkgpld?=
 =?us-ascii?Q?gDw/moh6+ulQCRNfTz0pU3GtGn34lvl2mESIDhPVnvgiVFRM0wDzlZd0CVJ4?=
 =?us-ascii?Q?luNEhEmN/Wx+WNz3b1yeXQH+yy7pNFgUupWTTifV3DkgSNZruL2VRSygXiuF?=
 =?us-ascii?Q?XlmBeicCmkujB81IamTwGaYYVUY5p9OZpnhnZIaTg9Dzza3DYOrpiV+u3mIZ?=
 =?us-ascii?Q?eVrstUGk1eXZvD4eBsv+XyiYIJJ+R5YeJTHSL6hhBPMuAAL3nmC92B/xcq8F?=
 =?us-ascii?Q?oO7qji2vawQI6VL5kWzzc7bE91S9lKK/VrCikVcXEFnqTi7c/6UMsxFLeoKd?=
 =?us-ascii?Q?BoLG62Y9FwckrICLMsYRSiAvLoHiO8dXMNyModdnSWy/dXn9sX/KAZnDcyK5?=
 =?us-ascii?Q?VmSDs7K3b4xhNXmcH8hUPpjpBVPM+bwz77Q1eZvMfn1iu6v4DztMJmVVpPtj?=
 =?us-ascii?Q?q0Y8PxVpSmVSyI/8dq1XFXLVITe7T4ajIvR6Nd0U0wd0O01fOv8bof4Lm9Ok?=
 =?us-ascii?Q?W7RlU/sVURNbAQVZBUr0AEgESgioOpmv7OY0Zzfu43p5D4u41VZfxnZrKQEP?=
 =?us-ascii?Q?mAiecfqMifrQ37J98GNZnXArI5JmRwFMfWM0gV97DA77tJLpT4rKjUTlh5ah?=
 =?us-ascii?Q?C2Of6Q79lm31LZmhrsso0+Z6Bm5j9zytHcHujBsmbOd8FgkaFwgj/dBXUteb?=
 =?us-ascii?Q?mQQjqxFnSXh4gTTbF/NiCz7NJauyrIAlhPkp1w7/RLi06HipS9B+19FJzI/z?=
 =?us-ascii?Q?zNJ7AZjErBhljqrU37ps1zQNuWaw1DpeqQhVxohr3vLS5U6MLvxDFsyqBCuo?=
 =?us-ascii?Q?yw/vaPkgJB9Nqj/qtHjCKeYkJQ45iDWR054tdsOGaNtOgEQ8l1p2FCCQwJSa?=
 =?us-ascii?Q?XBFPinniIxE0ua1lRvZ2XmXvp36PHExQObvbAnxxggeiJ9SpkED3PyR8qQN9?=
 =?us-ascii?Q?UIGYt0/vKG5MUA2Id8E8WxxaaEvWGWaM5LsD9IkuLv5jvUIFhXj/aHRTm79T?=
 =?us-ascii?Q?p0vDNo976tTWmkRPNx4r59/8MLFDKzScJ1y8auCdOY26P9QaIQ1LdP7GJS8J?=
 =?us-ascii?Q?IthEKOJaW0Kh/GqfjITzXJUblnjM+3uk38Vq+ftliH3lH1EexvjnzOSXAoGo?=
 =?us-ascii?Q?yCAhtIsWOoV7/PpwJMbNLWIZwBrYrOB2A4p7+ijY4lTQc9d2DzyazaBaQoG+?=
 =?us-ascii?Q?VwltHauoO7XQGXbztXTMtEgJqw58LKg3/o9n97vD6V/1QCo8/7EmuC3ceg6I?=
 =?us-ascii?Q?Bb2PUhaK4AoMN9KcxSVlsamWPiTk7xamYuphsGVaa8K+tef6/eYuQOgOBK+L?=
 =?us-ascii?Q?vy4qwYokhvLboFgHzCwrf+/52HyQkqjPTwZChOpq9DZYDNhBJkT//3GKgzPV?=
 =?us-ascii?Q?b2FxCV8xMzGyLATe/43tQq5GJ6clHX61A7dpILFzCtvqYSPlEk3aGmqXA2nf?=
 =?us-ascii?Q?hGcL1T8m2EdsGze6vyzlt8KmtjM9SdczrPqUhSiM+mzWfxMDzV59e7BFXKZl?=
 =?us-ascii?Q?cYvhenSepkc/g5PvL7U720UHWDhN9mwMdTVZOOEj/qmo9bxQVW2NozIvFicO?=
 =?us-ascii?Q?0A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cdde5d9c-fd97-4d91-ad27-08dd9d53f702
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2025 19:23:31.0927 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LlgESd3F2B+z7hmW1uoh2jBnkCSYZOKIS4qB+tG0BrfiMO9+MMyXX887/yNXAgJ2jvqClQUzjDNHfRC0B2xpEVHYRgo4Schzvhv0W+XLBA4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7878
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

On Wed, May 21, 2025 at 11:12:20AM -0700, Belgaumkar, Vinay wrote:
>
>On 5/21/2025 9:51 AM, Rodrigo Vivi wrote:
>>While at it, already adjust the rpe_freq frequency, to highlight
>>that both are calculated by PCODE at runtime.
>>
>>Fixes: c6aac2fa77a3 ("drm/xe: Introduce the RPa information")
>>Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
>>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>>Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>---
>>  drivers/gpu/drm/xe/xe_gt_freq.c | 3 +++
>>  1 file changed, 3 insertions(+)
>>
>>diff --git a/drivers/gpu/drm/xe/xe_gt_freq.c b/drivers/gpu/drm/xe/xe_gt_freq.c
>>index 3293d89f1386..60d9354e7dbf 100644
>>--- a/drivers/gpu/drm/xe/xe_gt_freq.c
>>+++ b/drivers/gpu/drm/xe/xe_gt_freq.c
>>@@ -36,7 +36,10 @@
>>   * - act_freq: The actual resolved frequency decided by PCODE.
>>   * - cur_freq: The current one requested by GuC PC to the PCODE.
>>   * - rpn_freq: The Render Performance (RP) N level, which is the minimal one.
>>+ * - rpa_freq: The Render Performance (RP) A level, which is the achiveable one.
>>+ *   Calculated by PCODE at runtime based on multiple running conditions
>>   * - rpe_freq: The Render Performance (RP) E level, which is the efficient one.
>>+ *   Calculated by PCODE at runtime based on multiple running conditions
>
>Nit: Do we need full stop at the end of these sentences?

yeah, let's add them to be consistent with the other items

Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi

>
>Reviewed-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
>
>>   * - rp0_freq: The Render Performance (RP) 0 level, which is the maximum one.
>>   *
>>   * device/tile#/gt#/freq0/<item>_freq *read-write* files:
