Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 850E4FF8855
	for <intel-xe@archiver.kernel.org>; Tue,  5 May 2026 18:34:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47BB310E46E;
	Tue,  5 May 2026 18:34:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bgeVw6sl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADC8710E0C6
 for <intel-xe@lists.freedesktop.org>; Tue,  5 May 2026 18:34:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778006086; x=1809542086;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=1/2/HMr4msCG+Tx9rhL6eKiy0JSvrkaxr7LNUET/nAE=;
 b=bgeVw6slJLVQcKW4coopcS5Z09EOqRuRIDCae7/HxYUG/UMKwM3rpKVo
 tdTCpOKWL1V9hNcA0iEyahcbOcGFhyq4euA6cZl7GtQzh4K/cuxgpwAPH
 ENFOFlAe3W68nZOA/1FIXfWymGU9TcnOaYWd546VLfn0iFtBJ3QIfwVH+
 aF4lQOClTynvp+pcMeC9WBq49w3nKc9z6FPIMNOVz+62IyoS3UL5UvANy
 k1sMoX1rAd3FIKrP+VXrP0pEhh3v3TEWoxoUufltB9FYtgEMmiuKdPYSr
 dAFysYL76fCa+kuQ5sRwW7gG6KKVlITPEFMZpgLkY251Rwx+xbam9hss2 A==;
X-CSE-ConnectionGUID: LD7m+o1aTmGXuSUxBOAIDQ==
X-CSE-MsgGUID: 5XZ60dbSSga066+e3YfjJA==
X-IronPort-AV: E=McAfee;i="6800,10657,11777"; a="78987207"
X-IronPort-AV: E=Sophos;i="6.23,218,1770624000"; d="scan'208";a="78987207"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2026 11:34:45 -0700
X-CSE-ConnectionGUID: GXHlaiHuTES6f949Jq443g==
X-CSE-MsgGUID: AOthSdmSQgaVdBFH38fKtQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,218,1770624000"; d="scan'208";a="231301689"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2026 11:34:45 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 5 May 2026 11:34:45 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 5 May 2026 11:34:45 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.2) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 5 May 2026 11:34:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PWsmXSLVuIL3We4MxXaWw0bmfOvbupdCroVK66GthKkfx2Jntv2VLNjGQi4HEj5XvePk/IvpDFULhi3Z9i6CIyV1a3SaefkloWNif2LKMIwa13fD7+sNAQz50eYvf+kAvRkAOeugY865+XQ7yah2ON1Hx833N49fb5Ff3jKc1A0evdz/gPv4YlSmig0n8uC78YcuzFjsga8mRIpf9bqZLb3uPJlI/Y3SCoJRuTFLbSTgWyHxjmboid3+Z7DSk1G72FWsbGUSHXRz5SyiLuyGvIjonMWJUqK3QwYDXGP9sltZ896K6Sbz9YHXnbnjOGakx9Hy7feeV4Agj5MpGqnFPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vEQHZ/6I1DjRfDigq9csYl4dpVxX+xGvLesnB/CsS4k=;
 b=ApdesAGKwB4+aM/IsT1b1UnjJzGzLSR3WywXBWdqMvcU6dlOfL74KAiMkEmjRX0cwvI1cn60G3ErbyXkjD5bqpyeyIovY7QfKqFH8T8/P5M3VcRWS+rGTuxmWunzJcdcPj0Y91qDxbIE6Y+cC+5vxff1sU+y8grAM4DFCwi5RxLjTMNKbgTJuVGSHc/ECihNMC4iUvRvsHxXE1avDDVkDVeOPox9YQhsVHNvWgbYaYSjoy9qmZzWDwGFdeA2/eh9pEQb1dT6boXB2HRTCQVeCX0uEf+ivoW7RFaWKwRLhoos2TLypzQ2w3gnXgiv+IKWIEWM4eI88d+pK8D6DQguRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6425.namprd11.prod.outlook.com (2603:10b6:510:1f7::20)
 by CYYPR11MB8359.namprd11.prod.outlook.com (2603:10b6:930:ca::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Tue, 5 May
 2026 18:34:41 +0000
Received: from PH7PR11MB6425.namprd11.prod.outlook.com
 ([fe80::715e:202c:8b30:1f56]) by PH7PR11MB6425.namprd11.prod.outlook.com
 ([fe80::715e:202c:8b30:1f56%6]) with mapi id 15.20.9870.023; Tue, 5 May 2026
 18:34:41 +0000
Date: Tue, 5 May 2026 11:34:38 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <matthew.brost@intel.com>,
 <stuart.summers@intel.com>
Subject: Re: [PATCH v2 9/9] drm/xe/multi_queue: Whitelist QUEUE_TIMESTAMP
 register
Message-ID: <afo4PoS5fWSubxPg@nvishwa1-desk>
References: <20260502005332.3135977-11-umesh.nerlige.ramappa@intel.com>
 <20260502005332.3135977-20-umesh.nerlige.ramappa@intel.com>
 <aflxOe7FHs7NJqzK@nvishwa1-desk>
 <afov0oVqTg0dnjD8@soc-5CG1426VCC.clients.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <afov0oVqTg0dnjD8@soc-5CG1426VCC.clients.intel.com>
X-ClientProxiedBy: BY1P220CA0041.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:59e::13) To PH7PR11MB6425.namprd11.prod.outlook.com
 (2603:10b6:510:1f7::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6425:EE_|CYYPR11MB8359:EE_
X-MS-Office365-Filtering-Correlation-Id: 85de34c7-7dd6-48da-f2f3-08deaad4f873
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|18002099003|56012099003|22082099003; 
X-Microsoft-Antispam-Message-Info: ZQpCWAxF9sLjRYZ8lRJiyFphGgPzR81Od2dCD39G9CdMGECMf/MOBGRSOrOzYu480BdErhU+VQkjWEl9NklfF9t+w+6l9jbfhnb1azlRUTEvpNrXUAZMe34FFHAu3tYEcdcZNXEtvr6BNse9B7Dz9wl/MbrkK9GAegDkSk4LWfG0NQE0kV/0/yOZkwq+Dyv8ID4C2fmEsRuSQrwKYppdaQGFtQFXAF3cDZqbOXkqqjdXWDCdkQYbVsStqUCn5pKvt7hiiqBON9kS8LaugIWeMwkc2bTRNCIdKifkNOflZGHssCKexQNlAHzxsKPQb2EmQb4qZzxiVC9vO3dg50pn3a3TZA/UqB6uk4A25iybXrRDTgDteivdE5z4u793K+SY0tCddzsIJ7fA9AArsLR6o+JnmY6Dq2iX6DRzITDLUWGO4pSMGUkSAmohLnmyp+QH7vF3x6vuXCTHayJMKwzW3G5yR5B9ck2VJwKJymUC7HcikVsFX55zYMzdg4DiSO74NQjVa0sBJGuy5kAgM7sMLUFicWDmFJkNIo7ayZ9BFL/90Ks7QkUDyBWqV+cXyEkMrhHgcwBCQ+JGKovCemXL9P24tjafe/OgbdtZfsaZ/6GxmPWeYljlQvTffcuTZ0wg4QPUaGuwMH8ZoE0VnAI4cdJR4/XqTWPF0pV9nrfr/SGik1r0KuP65zFSa6JjeuFV
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6425.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(18002099003)(56012099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?mgw8CNcnm632EbXAEPeECOxH6dOxFZHiJO+VsNNr+1UDUQze9/23lu+707XU?=
 =?us-ascii?Q?AxJ/dfrUQiK0hyNnwJqLW7+H//cRKPtrLQPR67gBt5QTqblPbFf8h9AZKB0n?=
 =?us-ascii?Q?txTIlOoHv+vzJChD7iWydrAJQuKy3pOpnCq1MdB2363S/FZB1T/oooN/cNNv?=
 =?us-ascii?Q?iqMXDVpQw+E1tF29bVcNXVu8Ht8UlQ3Jaq+q159EL3UNY3SIWYwFIu6IFCS3?=
 =?us-ascii?Q?razzcr9dJ/G2EdPNrHU4slsBQcN6/ywR2GBk/V4HgefQQMrr9pWnwja5vvDI?=
 =?us-ascii?Q?QjIFXu3ixkd0UvWXIa0SZFlBlnHop79x2kSy0vMmtZsPsE7XZeq5MZMApagv?=
 =?us-ascii?Q?JHmQfa4CV8v/lkqO0eZZrnlpXpktWz2lAoDwnviAqdOpZf8qNqQQIc7NchSM?=
 =?us-ascii?Q?USMyb/1woqcCYQ1BiG+IJUqkUzJMfhmUjsRittMDD5YT+Ovqi8t1NEXycmln?=
 =?us-ascii?Q?o0Ls1zlP1r6UnW9LnDJ74MBXYXRncyQaNKQChV+sjg496Dep1Osm6BogxuBY?=
 =?us-ascii?Q?pwPFJBtb/6SI5dUReaPScwpIUuwPx5jmQo5fP79853rMc8ZiO5CE0/3RVTDB?=
 =?us-ascii?Q?YO2/DqIpmcpVFJylzVh6VO9Ten7psJUEXTg1hajikQpgMtETTvr96s0VoTrD?=
 =?us-ascii?Q?RSqSeynrckCEFuURwQpqfWPCMEiVsfPv6QkoGrj2yI+/9pi4RqhPPsVE1uHO?=
 =?us-ascii?Q?Z90GjKKJlCldPQp2sO9wrXlni2hwys+qGeigCyd/JX8ybtXdrCNYSBKYyJF1?=
 =?us-ascii?Q?8OebkZXawF0pwE9SUhVyUR3Ys0Apl4hEPS+60NdRtLyT0oASkHUFQ2uFeXgl?=
 =?us-ascii?Q?RSBHkvrUlpMorYZP+K8YPjHD5lNuuM1zYPjoF2UVgAqPHUhT2NEeXCyn4Ffq?=
 =?us-ascii?Q?t/UY89NS/UNFwI1NsPTlb64uA1dzyy9S9p+66hMaqxsMcNzhva3U1vS7mdDz?=
 =?us-ascii?Q?+2kiEAW3hF0lF81Mr+YBmFwTBDQnmoXBhf2M4v2r7+b++fRBP3IJWsyBzl+8?=
 =?us-ascii?Q?nsw0TJIb8bRy3dtJVQ88RKqnHCYGzGgDJDN6X4r31yWHQR3d6lrkWjN3Ji58?=
 =?us-ascii?Q?B4Q6wRg+CI6D4BQ5XLZ2PI7O9jZdnSkXMfIdHRRayHL7MSGXoukWAbkz/FEZ?=
 =?us-ascii?Q?WvLwNzZD9mNgepYW1gxrqj5PmnuUmbNng3qwUiTnrVQ3pmSnGl9NwhKow/Th?=
 =?us-ascii?Q?C2GxlPQkCgpMXx4GJ4ZYa+ITD0l5mqm7+I5eHyKcIngjL6xsIErPqs0S/QTn?=
 =?us-ascii?Q?1GxSh2i3Z7IRpRNfVFaCpfZgoD/RdiHpjbIhME8NPejeBbyMuesgbGXBWQn6?=
 =?us-ascii?Q?nxAsnuA0RmOt19C6ljIKZ54YLhGoCUBJgLw3qQNR/QI4wSth2OhTUKsWHXNV?=
 =?us-ascii?Q?Px9MXjc42pPOQOoIlCNsH8lls7K8p4e8uvDms/T3Y7LAhVRkivg3Ozog1F5I?=
 =?us-ascii?Q?dzt7hoymaW0H0WO7D/efJD9m3VKVXp+UZ9VXAVma7zE1Foq33aLnrTZ3xVf2?=
 =?us-ascii?Q?WpqXjo9nVejZeXfv3tvW6y6E46EYMA9JjBT8MkluxBfRS3K1PxbPHv7Jf3mq?=
 =?us-ascii?Q?0kzNOiaJNo5sMTRPOnXKHuo+vherOjtzv7rnsg8ek3oy19ZyEYrBKExCW24T?=
 =?us-ascii?Q?8QyxLpN0J2Njrde043sJ9hqYGWQ2HOxDglRZYJ8JSraoHbvtnkYWvqNUAItC?=
 =?us-ascii?Q?fxHFZ5gvi2QIgbwiMww30sIEExCI2DAW49D5ZqG/jcA+zAAMW+bqAMqAmSUI?=
 =?us-ascii?Q?z5WtrPJSwEWej50l5U4r3oZPzJrZkqOmaAIkWxs08BlImhf5ny8o?=
X-Exchange-RoutingPolicyChecked: gAWU0mVSCIQnzJJgOONut6rsVjKRJq6SQnvObfp4LDGo39R7fbY0rHYg6qRZZ1WIua0ipcoKZpW+THlDSobqpivMBjaJcXlyd9ooaAN0jHYnAMou4AjozmnshIqV+znwV33uMckfKrHfk/84UoWoYEz+jZrZO3q3xgWvz8CbufeYNnfm9h4kga3rbeNTzDBQY5QhrNssD/Jkc87PSR3nQcuZdNrDzgk6f6aAwg6sqIPJ4/NLHneYINkUpTsVo7UzlYDNsHhKn+DK67OBHfhszMy7bSuk8ryykqQl58DsxQzUBYpmqVmsApXp11OkzqmLra2J8O75z6ShRWoyiXC6nw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 85de34c7-7dd6-48da-f2f3-08deaad4f873
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6425.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2026 18:34:41.3004 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0d9KnqUf16yPbxuy0dDi6wxDSbggnC2XzWW+hhvjDpgRGVodbrTOBLX60z67fqJ/CrmS+u+Aa3X4ughmOA2ZBDLpRJcYwyrcxlVNBECKbm98jhguPhJgAofbnef2hQ6Z
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR11MB8359
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

On Tue, May 05, 2026 at 10:58:42AM -0700, Umesh Nerlige Ramappa wrote:
>On Mon, May 04, 2026 at 09:25:29PM -0700, Niranjana Vishwanathapura wrote:
>>On Fri, May 01, 2026 at 05:53:42PM -0700, Umesh Nerlige Ramappa wrote:
>>>In a multi-queue use case, when a job is running on the secondary queue,
>>>the CTX_TIMESTAMP does not reflect the queues run ticks. Instead, we use
>>>the QUEUE TIMESTAMP to check how long the job ran. For user space to see
>>>the run ticks for a secondary queue, whitelist the QUEUE_TIMESTAMP
>>>register.
>>>
>>>Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>>>---
>>>v2: Whitelist QUEUE_TIMESTAMP only for copy and compute engines (Niranjana)
>>>---
>>>drivers/gpu/drm/xe/xe_reg_whitelist.c | 14 ++++++++++++++
>>>1 file changed, 14 insertions(+)
>>>
>>>diff --git a/drivers/gpu/drm/xe/xe_reg_whitelist.c b/drivers/gpu/drm/xe/xe_reg_whitelist.c
>>>index 80577e4b7437..37d6ac720d5c 100644
>>>--- a/drivers/gpu/drm/xe/xe_reg_whitelist.c
>>>+++ b/drivers/gpu/drm/xe/xe_reg_whitelist.c
>>>@@ -33,6 +33,14 @@ static bool match_has_mert(const struct xe_device *xe,
>>>	return xe_device_has_mert((struct xe_device *)xe);
>>>}
>>>
>>>+static bool match_multiq_class(const struct xe_device *xe,
>>>+			       const struct xe_gt *gt,
>>>+			       const struct xe_hw_engine *hwe)
>>
>>To be consistent, we have used 'multi_queue' as naming convention
>>and avoided 'multiq'. It would be good to keep that consistency
>>everywhere.
>
>sure, will change that
>>
>>>+{
>>>+	return hwe->class == XE_ENGINE_CLASS_COMPUTE ||
>>>+	       hwe->class == XE_ENGINE_CLASS_COPY;
>>
>>We already have xe_exec_queue_supports_multi_queue() function which 
>>does similar check. I think we need to abstract it out to a single
>>function and use that instead of multiple places in code that
>>determine whether a class supports multi-queue or not.
>
>The whitelist is applied during engine init at driver load, so we 
>don't have any exec queues yet. Instead, should we derive supported 
>engines from xe_graphics_desc.multi_queue_engine_class_mask and check?
>

Yah, xe_exec_queue_supports_multi_queue() also uses it. So, may be add a
xe_gt_supports_multi_queue(struct xe_gt *gt, enum xe_engine_class class)
in xe_gt.h and use that both here and in xe_exec_queue_supports_multi_queue().

Niranjana

>Umesh
>
>>
>>Niranjana
>>
>>>+}
>>>+
>>>static const struct xe_rtp_entry_sr register_whitelist[] = {
>>>	{ XE_RTP_NAME("WaAllowPMDepthAndInvocationCountAccessFromUMD, 1408556865"),
>>>	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1200, 1210), ENGINE_CLASS(RENDER)),
>>>@@ -54,6 +62,12 @@ static const struct xe_rtp_entry_sr register_whitelist[] = {
>>>				RING_FORCE_TO_NONPRIV_ACCESS_RD,
>>>				XE_RTP_ACTION_FLAG(ENGINE_BASE)))
>>>	},
>>>+	{ XE_RTP_NAME("allow_read_queue_timestamp"),
>>>+	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(3500, 3511), FUNC(match_multiq_class)),
>>>+	  XE_RTP_ACTIONS(WHITELIST(RING_QUEUE_TIMESTAMP(0),
>>>+				   RING_FORCE_TO_NONPRIV_ACCESS_RD,
>>>+				   XE_RTP_ACTION_FLAG(ENGINE_BASE)))
>>>+	},
>>>	{ XE_RTP_NAME("16014440446"),
>>>	  XE_RTP_RULES(PLATFORM(PVC)),
>>>	  XE_RTP_ACTIONS(WHITELIST(XE_REG(0x4400),
>>>-- 
>>>2.43.0
>>>
