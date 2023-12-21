Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0A96C3DA6E
	for <intel-xe@archiver.kernel.org>; Thu, 21 Dec 2023 00:52:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B692D10E02B;
	Thu, 21 Dec 2023 00:52:25 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1012710E02B
 for <intel-xe@lists.freedesktop.org>; Thu, 21 Dec 2023 00:52:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1703119944; x=1734655944;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Ly0M7JDMrNz8IM9z8wNre0HY9zfCqy1k7A5YXT5DfzM=;
 b=MBn3QAG4b6BwoM03AIL4z4Vkr5PHZXp6s1NsabmKSfZrJAgrn5eiTtQ9
 10TT2PONHcVz49VVxZ/HvqCLoyd4UHAOa7wBqpJsOpeHVkQiOqETMSBjP
 /H//+bt+gXVt6eH4zmjD6eFvVtD/pFWAmEZD4Hsu13HHuPIwlyx5CZyzS
 m13mJjVo9WOQqBndbPW1bYatddzzZCx07Qq4SqhcHllWZZ+Ve+cV8kyPx
 9mfZcNPQAyX0P9y9eLr0F62Jerj7lI7XVP/1NxWi0U26NKhdW+3gHh6fr
 AQHkNJgPWujpdGtognpnObB8+6sOjfCP70VK98C1KK9AY9sqK4ChqTnbQ g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10930"; a="380886453"
X-IronPort-AV: E=Sophos;i="6.04,292,1695711600"; d="scan'208";a="380886453"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Dec 2023 16:52:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10930"; a="780023968"
X-IronPort-AV: E=Sophos;i="6.04,292,1695711600"; d="scan'208";a="780023968"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Dec 2023 16:52:24 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 20 Dec 2023 16:52:24 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 20 Dec 2023 16:52:23 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 20 Dec 2023 16:52:23 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 20 Dec 2023 16:52:23 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HVYtmxqV64d0uj3iiEW2MuePH/EXVfCaafxckk5EljlWL5ycWsTq03MLZbVzh8/7s1XXNcJWLPI0oyermT0DDdm6FkXzszqL5xIJykzJc/4xOT/z5xVob6xyh55/JnW2Y244d1flJuY3ctQ8f8Y0aVEIj7d+cu4leKVmOeBKOc7tm9htVbRBCZTJxhsd0XeUljXZsADqlnjYZ8Vs7hsV9vSl3wDVnjhHMv+Y1Xqm1G9eDxC1rLG9hvpHLiYNmhSEsZr9+D+BeZU+msig0uJIBiTjKE8WidU9efoV7OX197tAnPx5csObRA6sBZ1TsS42w3RTNe7OH7lLR8ZV20xk0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OHdRPhXFwOX+eH3EWUQolwAdpjL4wgVOmXEOzYglVuo=;
 b=j/i5sXa4fIFz7I7b91fNkzeeDQaQRCyraYmTvVcW9AKCP49fGJ7noKL08rgC5fNK0EnIvBSjf3YvE1ZXSlQdGTruWFX7CNDBjHKTWAXg6ZrfwIvk+DriBWU0A8tBOJ4Uvd4x4HtzhzBrYFustj8/pEPSHViCNf/iEnu0legilUcPq9OANhVInXgDRJJuYUPGxUP06VV+zfn+aD/FC29DkYo7qZWG8Ee9QotlbttN95jdWX7KAEBWpGYo6zW2JbHoxmasKmoNPAj0GLq8QPoPTJkEGe3m2Z2fi6A4Epyo2XE7q4q6jLvokGYCe6RqPV0AwQde4yuzxPzXrw6yN8TrSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM6PR11MB2987.namprd11.prod.outlook.com (2603:10b6:5:65::14) by
 SA3PR11MB7436.namprd11.prod.outlook.com (2603:10b6:806:307::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7091.37; Thu, 21 Dec 2023 00:52:10 +0000
Received: from DM6PR11MB2987.namprd11.prod.outlook.com
 ([fe80::e73e:dcc0:c5bb:49b9]) by DM6PR11MB2987.namprd11.prod.outlook.com
 ([fe80::e73e:dcc0:c5bb:49b9%7]) with mapi id 15.20.7113.016; Thu, 21 Dec 2023
 00:52:10 +0000
Date: Wed, 20 Dec 2023 16:52:07 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
Subject: Re: [PATCH v2 3/8] RFC drm/xe/guc: Expose engine busyness only for
 supported GuC version
Message-ID: <ZYOML1pbxg8akc1D@unerlige-ril>
References: <20231207125802.3730165-1-riana.tauro@intel.com>
 <20231207125802.3730165-4-riana.tauro@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20231207125802.3730165-4-riana.tauro@intel.com>
X-ClientProxiedBy: MW4PR04CA0221.namprd04.prod.outlook.com
 (2603:10b6:303:87::16) To DM6PR11MB2987.namprd11.prod.outlook.com
 (2603:10b6:5:65::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB2987:EE_|SA3PR11MB7436:EE_
X-MS-Office365-Filtering-Correlation-Id: 0dc3d5fd-4e63-4f35-691a-08dc01bf0fff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZyeZlbF1sw6xfTmJ3zVlT47tpk0LvZczS+RACgBqi9TkSgSjFYFAdFi4Bo3TYdYJtVxY/j8JKKaBfBAkCMAF5l4q26q8WNgQ1P9/8cU+6RESeQqi6wNIJ079lmPZcyfqxE6J21F3l3W0xmksddEVi5tLAPIme+MYAJ1nP6l3fjEuCy8SFuI6r6FpNtMga/xlt2seBOtbH0Mgp0BH9lcynibxgUfx6xFHfrUazbG1z9XjW/bjS58Wb+NSSmaD/10YAutkAoxtp3XTSA3saGkothCu5rA5h2o3h95yZsFU76Ar9Yi7gEnfsmlsn9TEHqBeFgcTMciy7MRyY+kTN90lg5O3VgHSZOgpUkQwDP1CEX/6pKWJD1KuyU65QyJDgH1JBlpIFNh0zXrLzorh2EgOkKdus7xKTVOk1BcK3HTWnZOTvu24fgJEsbHZhl0SoBkTzRrhgBoYfvokS/Iq0y6eY6wPHyPgxYV3emhDzDgFu70Ju0Qr0GQZzIIcTOaKL0AfP7gWSeONQ9Bk0A6wLfWr2lStfwN7bzUcKbigEdIOTEYNHL1w8LCev6DpyD+SplUS
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB2987.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(346002)(366004)(396003)(39860400002)(136003)(376002)(230922051799003)(1800799012)(451199024)(186009)(64100799003)(6862004)(26005)(8676002)(5660300002)(6512007)(9686003)(6636002)(6666004)(41300700001)(6506007)(33716001)(478600001)(2906002)(8936002)(4326008)(316002)(66556008)(66476007)(66946007)(6486002)(82960400001)(86362001)(38100700002)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?LzdPZUFkand4cllkVGp1aWxnS2tZeFJXSVpnWXFzZFh3TW43MzhlZUoyL0hU?=
 =?utf-8?B?WFdFek9JWXFuMlRGblZEcXY2ZkgwaEE4TjMzTkhQSlhFVUw3UFgwMnhaYXAz?=
 =?utf-8?B?NlVJdW5zNkZncTBiaWdOTm53S2lsUWR6WHRieStURjZEaGY5RngxMXpURlNY?=
 =?utf-8?B?ZDdDVzZVV0lWbnpsRllXZGsySkJaWEVFM2RQMXlTaFZsdzFDaDBDaEdiTFpo?=
 =?utf-8?B?TFhJcm9ORlE5U0JLdE9jVnowSGhpMDhNdGJiQXpzcmhmbk9uamliMThUWjZh?=
 =?utf-8?B?eStwWS9VU2dKeTIyMHRZMHY3ajkrdDhIbGw0c3ZXWlBtbWQ2TkhGK3lWdUZT?=
 =?utf-8?B?aHFtTU9vbnJBQTZoZ2wycXBRcUhIbGk1RTREdEVFZlpmVDRXcGc0VTFIMXJQ?=
 =?utf-8?B?WEhvYlo3RlE4OEltWm1sRDBaWGdoY01FWkRhNk0vMjc4bHZvNkhKY1VKeUh5?=
 =?utf-8?B?M1JuMFJhR1hwWUdYQm9FdDFxbWJKcjlkUm1zbjJGZnQ5WWs5Vm9Ibk9nWTl4?=
 =?utf-8?B?MjV6d3lFK3FRQ2U5UzZZSWczWnNoMHBBWWJIQ1pGbXpPbDZ5S3p4eVBqU1JQ?=
 =?utf-8?B?SnVWWWloUTFvQ2dhZnVJMFZhbTR3WWdmaXNzV3NWSlV1ZHRVei9KYWNwUXZS?=
 =?utf-8?B?RmhFUXJVb20wcWRlYUY4d3I3aUtKMERpNmp4ck4veWdiZXRJQjZCa042OTVV?=
 =?utf-8?B?d1AyUGl5Rkh2eE9LR3dwV2JPRnZGVExuWURaUkFyUjlxaGRWQVBISkFZd3FF?=
 =?utf-8?B?VmFYSlJwc3FuODMyU1NCOWNCdUpNVmcybzNweE9HYWhjM1NMem9qWXpHQisv?=
 =?utf-8?B?RnhjdnNPdGRVWUVXOG9BQmNjTXBRb1hwNnU3U0s1YlRWZlhGTys1eTV6SEQ4?=
 =?utf-8?B?Rmg5RkIxSkY2R01FcVpBbmtJRnMrWjVJWTdDMkZSNnRtMWRvSkZMOENqaXpr?=
 =?utf-8?B?dnM2RXNESG15NFJlUHRzVW5tdlNWR3AyWFo3TnBTa0NoUncxWkhVQ0ZjN0ZI?=
 =?utf-8?B?cFFEVjRISFc1NllBUWVFTGJ5U3ZCb3U0QXNwYnpEVVhKRSt4WGVNLzR6UlVl?=
 =?utf-8?B?a296S2t0YllvelE1MUlZUGFYY3AyaVYvMkMxSi9tSTU0dC9UUlN2NmJNelhx?=
 =?utf-8?B?MmZUV3hCbDBzbzVMb1Z0aGh1TGsySzhlbWRaWUthN2o3VFJtemVhMFNhS1hz?=
 =?utf-8?B?bnFBeTBTajVha3cwbk43WkxHdHZUVzNUemJFaUFEeFBiaFNzMU45K1YxSFN3?=
 =?utf-8?B?dW8vcnVWUllYckZlRXJoQlZCYU16UFNxQzJkSm5EY2lJT29BeHdyWGtJSlJ6?=
 =?utf-8?B?UDJBSkxKUm9WbFNCWVBGalBaVFRPUGg0ZkpHcDNYdWtNajR4R0RUYUxqWlJ4?=
 =?utf-8?B?dU9ScVN3SmdmSGdRajdrYXQzWUhRaTRnM0J4UUdtbVhRY3p5UGtLR05KWVg0?=
 =?utf-8?B?d3FQcm5vaG1KeFRJSnRUa1dzdkJsQm12RitITlFBZjFRcnlBU0tVWUszcjl1?=
 =?utf-8?B?dHlUZTdFaDhjbGpOMDhRWEZtQmFLUi9ZZjdLYXhBVzZidFU1T1huczZ1YWkx?=
 =?utf-8?B?M2RqTGd2dmlabWg2TURjdHdkd0lnNUd0K0NSQ0xqalY0ME5ydWN2clhnK1Zx?=
 =?utf-8?B?dnVNR3U0RUNnakVMSVZlRDhKT2N4RW5MZFBSOGNZbmdFdnVwSWE0VVh1Qk9r?=
 =?utf-8?B?RzlnUzdmdlFHUmx4b0FBblpkdXZHV2lIdW50QlkvelJVRFcvRDZlTHpSQlhv?=
 =?utf-8?B?NFR5ZGt1TXNGVmdrWTh1bVdLcG8yUENZMEJPTngrc0NaSEpTTlhDVENvUWt0?=
 =?utf-8?B?QVpWVUFuQ1cwUVIyMDBsUmgwb252WjhsVllqRzh2Qlp1emZ0bm5HLzlKU0ZN?=
 =?utf-8?B?TEJOZmpuWEgvY0NiQWlHYW45WlBrYUxHYkRUdmZaZjhxMXYwZlljVlZpS2ZS?=
 =?utf-8?B?LytlUU5GTnRXeVU3SzY0K3VsTlVqNG9hbWlURFhWa05ZNTczakY5MklJSDhY?=
 =?utf-8?B?MFFyT2oyT2VtRVJUc3ovektZZEY1K2NtKy9nZmFmU0NwUEEreS9mQ2ROV0hJ?=
 =?utf-8?B?NFpocXF5SmFrYnVaaVNMRDVTOHdKWlZWdVNaK05XMTc4Rks3YTZQOVBoa0Ro?=
 =?utf-8?B?R0FhbXlsYnE1SUJ1ZVZhWGVBNzRWOUJuU2IxN01wc0wvVndraS9ZbTIrTjVI?=
 =?utf-8?Q?yn0r6n23ZEQjZxjwVmSge38=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0dc3d5fd-4e63-4f35-691a-08dc01bf0fff
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2987.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Dec 2023 00:52:10.0264 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BcsWKuW5J5jRkChoIoCoM6dGeE8tVa+8+z/zUN8IOYO5QFNpbL9ahAoExO32CzzLjd9T1fbDY7c1nOfww1EzLge2mI0poYGhysFY6ikWf7c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7436
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, Dec 07, 2023 at 06:27:57PM +0530, Riana Tauro wrote:
>Guc version numbers are 8 bits only so convert to 32 bit 8.8.8
>to allow version comparisions. use compatibility version
>for the same.
>
>Engine busyness is supported only on GuC versions >= 70.11.1.
>Allow enabling/reading engine busyness only on supported
>GuC versions. Warn once if not supported.
>
>v2: rebase
>    fix guc comparison error (Matthew Brost)
>    add a macro for guc version comparison
>
>Cc: John Harrison <John.C.Harrison@Intel.com>
>Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>---
> drivers/gpu/drm/xe/xe_guc_engine_busyness.c | 29 +++++++++++++++++++++
> 1 file changed, 29 insertions(+)
>
>diff --git a/drivers/gpu/drm/xe/xe_guc_engine_busyness.c b/drivers/gpu/drm/xe/xe_guc_engine_busyness.c
>index 287429e31e6c..431d1ca59d2f 100644
>--- a/drivers/gpu/drm/xe/xe_guc_engine_busyness.c
>+++ b/drivers/gpu/drm/xe/xe_guc_engine_busyness.c
>@@ -23,6 +23,23 @@
>  * engine busyness ticks (ticks_engine) : clock ticks for which engine was active
>  */
>
>+/* GuC version number components are only 8-bit, so converting to a 32bit 8.8.8 */
>+#define GUC_VER(maj, min, pat)	(((maj) << 16) | ((min) << 8) | (pat))
>+
>+static bool guc_engine_busyness_supported(struct xe_guc *guc)
>+{
>+	struct xe_uc_fw *uc_fw = &guc->fw;
>+	struct xe_uc_fw_version *version = &uc_fw->versions.found[XE_UC_FW_VER_COMPATIBILITY];
>+
>+	if (GUC_VER(version->major, version->minor, version->patch) >= GUC_VER(1, 3, 1))
>+		return true;
>+
>+	drm_WARN_ON_ONCE(&guc_to_xe(guc)->drm,
>+			 "Engine busyness not supported in this GuC version\n");
>+
>+	return false;
>+}
>+
> static void guc_engine_busyness_usage_map(struct xe_guc *guc,
> 					  struct xe_hw_engine *hwe,
> 					  struct iosys_map *engine_map)
>@@ -80,6 +97,10 @@ static void guc_engine_busyness_enable_stats(struct xe_guc *guc)
> 	struct xe_device *xe = guc_to_xe(guc);
> 	int ret;
>
>+	/* Engine busyness supported only on GuC >= 70.11.1 */
>+	if (!guc_engine_busyness_supported(guc))
>+		return;
>+
> 	ret = xe_guc_ct_send(&guc->ct, action, ARRAY_SIZE(action), 0, 0);
> 	if (ret)
> 		drm_err(&xe->drm, "Failed to enable usage stats %pe", ERR_PTR(ret));
>@@ -104,6 +125,10 @@ u64 xe_guc_engine_busyness_ticks(struct xe_guc *guc, struct xe_hw_engine *hwe)
> {
> 	u64 ticks_engine;
>
>+	/* Engine busyness supported only on GuC >= 70.11.1 */
>+	if (!guc_engine_busyness_supported(guc))
>+		return 0;
>+
> 	guc_engine_busyness_get_usage(guc, hwe, &ticks_engine);
>
> 	return ticks_engine;
>@@ -127,6 +152,10 @@ int xe_guc_engine_busyness_init(struct xe_guc *guc)
> 	u32 size;
> 	int err;
>
>+	/* Engine busyness supported only on GuC >= 70.11.1 */

I think the comment can reside in the helper function and you can delete 
is here and other places where this is called.

With that, this is
Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>


>+	if (!guc_engine_busyness_supported(guc))
>+		return 0;
>+
> 	/* Initialization already done */
> 	if (guc->busy.bo)
> 		return 0;
>-- 
>2.40.0
>
