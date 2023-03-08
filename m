Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B073EC6FD19
	for <intel-xe@archiver.kernel.org>; Wed,  8 Mar 2023 22:20:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7041810E746;
	Wed,  8 Mar 2023 22:20:23 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0707710E746
 for <intel-xe@lists.freedesktop.org>; Wed,  8 Mar 2023 22:20:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678314022; x=1709850022;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=pg/nLE+ykBUniEBaGPSX11eUIclGZMlDwhjc9f8iE9s=;
 b=EjyPd1XqX/3eSC1waTaJ8QehhgjljdFOIbg8ydZt0mUNo9Qi9A2tvN1A
 88kSYmrpfrGJ+WBshaO8fWmI15xGck1VmAudbNj6oBZ/f+gYAffJg0ktB
 HXkxGh/FamoQlmyzOiNUqMVPeFgyJhkOecpcx5kzVzYXx2W74mXa/AbX0
 5GYgjB7vPeABB2IKECkSFxcI9paSng5HmoeOMYiuGTVmPlzBg5qHxJ0vn
 0ydZb5KDSeIEipAV/CAqqFclTdZjZ9s+xxrocUa5PSHdoIwc+ZYe29Djs
 t2E30Hv0SCjFkNVYjuiE7ahIHXxw2TcxLkL05PzGpPG5ZMsSevgfgaHn1 w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="334994358"
X-IronPort-AV: E=Sophos;i="5.98,244,1673942400"; d="scan'208";a="334994358"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2023 14:20:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="787302481"
X-IronPort-AV: E=Sophos;i="5.98,244,1673942400"; d="scan'208";a="787302481"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga002.fm.intel.com with ESMTP; 08 Mar 2023 14:20:21 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 8 Mar 2023 14:20:21 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 8 Mar 2023 14:20:20 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Wed, 8 Mar 2023 14:20:20 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.103)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Wed, 8 Mar 2023 14:20:20 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JVp3zqHhi13tvxd5MO1Pf3as3jvVE63+Q3PJHjNx0C1M74q4HfApMin3m2lhrgYYmathdSH6WaMIKRql20Gd+mKB8DN8lwF3L3rs87SjuKqp6xechzZxxlfRNpLqehl7L6U0fZioNCiLl2wXEwKsiJXAgCQPY0cpBK+mLNt4XHT3qgtspDVq9TDIxSC9U2UX6e4iQflQIByqlynhs2NmVRcMwBcycxhVGHTIM1EJ8Ez0Iuq+K5nbDdAudNjyh1Mz4GV1i8kAzqyrRldQjo6SBAlQNuwHiRoo1dQ+3oGddpdRtlkrwgkdxZC5Dw9dlwpVs0BO0vYJzpUl4D6erU6L+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FDvNYpBPKrNFaK15wgA32y8zhnJeYeNph5hXat7f7sE=;
 b=EfzZEhjYPAkTxgpS8Dm+D2eoqq30AWRaeslk0Gob6FaoeradPwUB021fJm7jxEA6rWRY8hfrJanRG7ruPVpOjYIxSKSo25kh5ol7YvIQXSgubdlXnW0VOvq4yv8mILtFzhF0xTSEELB6vBW8SNLdQhPXjifc/ABOVE2ddoXIfHnmaz48vZhQEHiviD3bNUl9gBDikgp7IIMB4SMXhlI5sJm5OrGa362WAFVUyDeeoZzb90mIxQtqRXg86FhN174mILR+BHsKy/AKkCuK3zbq9E+0eIAAjsbdPVOUECT2X4OVMpaS7IU7OwJn0xgMXSFzN9M0AFSkYrM0L0MfShNy9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DS0PR11MB8133.namprd11.prod.outlook.com (2603:10b6:8:15b::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.27; Wed, 8 Mar
 2023 22:20:18 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::2629:fb12:6221:3745]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::2629:fb12:6221:3745%4]) with mapi id 15.20.6178.017; Wed, 8 Mar 2023
 22:20:18 +0000
Date: Wed, 8 Mar 2023 14:20:17 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Message-ID: <20230308222017.z547bjozgzniypjo@ldmartin-desk2.lan>
References: <20230307092446.1263266-1-lucas.demarchi@intel.com>
 <20230307092446.1263266-5-lucas.demarchi@intel.com>
 <20230308215338.GY1543793@mdroper-desk1.amr.corp.intel.com>
 <20230308221648.ylc5hxuqe2ymuvke@ldmartin-desk2.lan>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230308221648.ylc5hxuqe2ymuvke@ldmartin-desk2.lan>
X-ClientProxiedBy: BYAPR07CA0058.namprd07.prod.outlook.com
 (2603:10b6:a03:60::35) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DS0PR11MB8133:EE_
X-MS-Office365-Filtering-Correlation-Id: 45b43e36-b174-4ee3-9771-08db20234c7f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GYtNSXNNIZnRIylSF58Yq3c4GfN8Zmm35SgXHvbvHxDKhReM3Q3I5DbyekfEJboDgY399CYXbEOESP7w/4k81xjWgCAUZfBwzR8xBjEtb8+g0uNTMl4bORIsSPhHpdv233FNM5Ienu6pNhTV1Tgph0r7TTPJo8+PqY93JH5eMM5dkN0hmfiiaPy6zuIzRTTrfhCVqlvZwWkGiFb5fDfZpH1GxYSOHuA0qa9mDI651eq2oblO3GATsOdPPXl/hDLToy4dDbE+9INTJQWyQZV1gXyMqBsnJKMxeP2TC7O1ZKVkA6mnf/OTtLstXRlYCW/B9295GasvLLatDtGCSGeo6xGebNdKFDouRI+NJfzP31Q1YcYf9/lGR9+XzlFRfLOC5dHZTP1TtPDBZ2gwFCJzA6PT3Egir3CX7/MTfKVsL69bwyFBQWOs25VcEaPzIwAiMx3sy8N++GmWVOEb/QTQfieMz3hhpNQg5U37034CFPBLRwTGjALVAAnIoBVVVA1LJ58q88mMqc/9KoyNNEe9zXeX6JeOe8uCNI2DpF/BUbm3C9IIa2CmYPYi6IETF+QxwdIwCvWBMnlmjyp5fxj2o1kv4LeKwc61EZY8ufbXsYSj5ACR0WY3JjFElLdcPCI/ORiDaTEZdi4cqJwa79XoNg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(366004)(346002)(136003)(396003)(39860400002)(376002)(451199018)(478600001)(316002)(36756003)(83380400001)(38100700002)(82960400001)(6636002)(186003)(5660300002)(6512007)(4326008)(6486002)(6506007)(9686003)(26005)(1076003)(2906002)(86362001)(6862004)(66946007)(8936002)(8676002)(41300700001)(66556008)(66476007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ThBtu/X3Wdl9zHd5Eap0Tg8njJQMas1CYgqccIwDBuy41vtvo82oK25TlJuL?=
 =?us-ascii?Q?+IRI3kGKiWv5jmFhXGNP8Kp6/y3aXpeGNdPPQrozYV7A8XcEbwe4bm2XDl+l?=
 =?us-ascii?Q?uB5UcPM0H6B9KwH2kDhLbQXypk9C3/ZY1OkktRGzBrXvoUjeSSsKcmaroZOK?=
 =?us-ascii?Q?3yJktC6t7EArr1mhj/vo9X4pX41/7OVEQl0b/fbQ5v/AfPULCR7seJyGti4p?=
 =?us-ascii?Q?R/9WI4DP3oreI+pZMjCm2YDys5oOjp1Dk2VJvmqoLB1NFOg2K9ef18iBkxzY?=
 =?us-ascii?Q?wVcalx7c/uJ45Hit/GBR+RSqCJ4XvJMt/Ci1lYHMLbNoMZvTbpk6FmISAF9M?=
 =?us-ascii?Q?F4+twHIfMgNgMezfNTlnX3mX02RwHHIGR03zHG0AAiaIxmcpOQTGb/1PxHee?=
 =?us-ascii?Q?QENir2tDOyr+p2zr84oIpO93RF5o9ZiofsOnxKw56gGtSXb0seWKRh5lMmSL?=
 =?us-ascii?Q?nvGoeURhcIn93prDIUxT+iAdm9nXAK232AeMiUieir76/fhnSUZR5O/XmLfo?=
 =?us-ascii?Q?MQCegy3O6HVn5m/lYqWy5j7rxPahOyv3VmUnHUW+bMWI8ikfeK/aSnGd01yE?=
 =?us-ascii?Q?3DbXIGZ1ymEoaoQbHfNEKG/HNygIEyrzoxqdeV1H8A3qQUSwekN0pBkKlkGb?=
 =?us-ascii?Q?z8TPbiLvZ5dX6zDs1D4o9VwBkyeCPi5skN3QbUCJMLmUDHMi9Iu3MfQPDgN/?=
 =?us-ascii?Q?A+iaquanYzJjuc0aTItEiAxaDhHFmjFM0VC3zs/H0yH2rOz6veIoUZpaLwQ6?=
 =?us-ascii?Q?wh1EjrYPeLXScHQfRmogwLxDWCYncRwZ/On0JDK/ksc/QdP2HhSTP0pr/ASB?=
 =?us-ascii?Q?TjsWiLtRRmUkl/JkxlIT7b9QU/+Y6qEXoeB/t3Rn2BTHLkXRa5bipq/XcTlM?=
 =?us-ascii?Q?Q748dUnMsrZWyuF+561dB6F1COs9gwTCn8ZQy9Z4wV6ccpXlM5AyD/i1+j3O?=
 =?us-ascii?Q?0t4X4BT+Jzg3tK+n2KRu7FP9ALMZXjLLF3+/M/XRmraaQT2C4mT47yoZggCY?=
 =?us-ascii?Q?RmiOxZJ/MiqMGxOIoteAUFQKarLBnOXghI2AOcBRNVBPpJpi8t7etzL0dyPe?=
 =?us-ascii?Q?1VneVjq3n0Ab4he4QJbk3eTgvHzrakwcX2wZwHetGSW/EFOR3blSypbw6Tec?=
 =?us-ascii?Q?UwpoPo2O1PYE7KByqVFn4JbpQy/68/OGn+Z24LILPq7UZm4RFWEw6xfFRRKS?=
 =?us-ascii?Q?eNhdYulVMtjpSOE73Y7FZ6oQkZqo4uC+zRlIFsAHq8kQpZ5wCWfD2KfhIfhy?=
 =?us-ascii?Q?jr/jK23B98W2Kgj7f/hnDooZzcrMG4ZE3pZLRenXnqUWHvcgWzjzbkHN1lrR?=
 =?us-ascii?Q?fiQKIH87c9ZoEdh3LOAY8HMsnX3TjImfTIWTQ0aXtSd14m00wAXo7eG9Lkq/?=
 =?us-ascii?Q?sV5seoM4vM5eNoqYttbhMruetfSxVdwu+oGFqfZ+XTl5F3RQveaRM1nfPKzF?=
 =?us-ascii?Q?yyq3AWyD1ondBy3xksFiPK0JE94n6d/WDFWwHEgG7qSViqgjVq4HF80K22lT?=
 =?us-ascii?Q?OjjxqusVQ0zFlrYan3D2bBHhJauAARD/1IiFZRoG2L6urIkdtGWapCo0ZN6x?=
 =?us-ascii?Q?bFTzVtX76LyBvQhdSO4FNVYQNG5H1wW7iWTL5ZAUpKkC3w/qKCtkdFh1XXBw?=
 =?us-ascii?Q?JA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 45b43e36-b174-4ee3-9771-08db20234c7f
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2023 22:20:18.4306 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JfB+mg+I6DtdQLNjdwRwifced0OAnBTX1V9RFWDAgXA11UHrDyy5Bc+ZgUKfmTBuo7mG2+7XZf1vsS8s3ireubf2cm3IRQIL8yZWtfT/o58=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8133
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 04/19] drm/xe: Add helper to get dss per group
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

On Wed, Mar 08, 2023 at 02:16:48PM -0800, Lucas De Marchi wrote:
>On Wed, Mar 08, 2023 at 01:53:38PM -0800, Matt Roper wrote:
>>On Tue, Mar 07, 2023 at 01:24:31AM -0800, Lucas De Marchi wrote:
>>>This is already used in intel_gt_mcr and will be used in workarounds.
>>>Add helpers so the platform-dependency is in a single place.
>>>
>>>Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>>>---
>>> drivers/gpu/drm/xe/xe_gt_mcr.c      | 2 +-
>>> drivers/gpu/drm/xe/xe_gt_topology.c | 6 ++++++
>>> drivers/gpu/drm/xe/xe_gt_topology.h | 3 +++
>>> 3 files changed, 10 insertions(+), 1 deletion(-)
>>>
>>>diff --git a/drivers/gpu/drm/xe/xe_gt_mcr.c b/drivers/gpu/drm/xe/xe_gt_mcr.c
>>>index a42061c4b9d2..694a79b40ec0 100644
>>>--- a/drivers/gpu/drm/xe/xe_gt_mcr.c
>>>+++ b/drivers/gpu/drm/xe/xe_gt_mcr.c
>>>@@ -223,7 +223,7 @@ static void init_steering_dss(struct xe_gt *gt)
>>> {
>>> 	unsigned int dss = min(xe_dss_mask_group_ffs(gt->fuse_topo.g_dss_mask, 0, 0),
>>> 			       xe_dss_mask_group_ffs(gt->fuse_topo.c_dss_mask, 0, 0));
>>>-	unsigned int dss_per_grp = gt_to_xe(gt)->info.platform == XE_PVC ? 8 : 4;
>>>+	unsigned int dss_per_grp = xe_gt_topology_get_dss_per_group(gt);
>>>
>>> 	gt->steering[DSS].group_target = dss / dss_per_grp;
>>> 	gt->steering[DSS].instance_target = dss % dss_per_grp;
>>>diff --git a/drivers/gpu/drm/xe/xe_gt_topology.c b/drivers/gpu/drm/xe/xe_gt_topology.c
>>>index 967f2349c67a..9fe06a46a400 100644
>>>--- a/drivers/gpu/drm/xe/xe_gt_topology.c
>>>+++ b/drivers/gpu/drm/xe/xe_gt_topology.c
>>>@@ -103,6 +103,12 @@ xe_gt_topology_dump(struct xe_gt *gt, struct drm_printer *p)
>>>
>>> }
>>>
>>>+unsigned int
>>>+xe_gt_topology_get_dss_per_group(struct xe_gt *gt)
>>
>>When this shows up as a general interface, it leaves me wondering what a
>>"group" is.  The rules for DSS steering happen to use gslices on Xe_HP
>>platforms and cslices on Xe_HPC platforms, but that's just the
>>platform-specific rules of steering and doesn't automatically translate
>>into which type of slice would be appropriate to use as a grouping
>>elsewhere in the driver.
>
>humn... maybe I myself didn't understand the group meaning here.
>is group a generic term for cslice/gslice?

btw the term "group" is already used in e.g. xe_dss_mask_group_ffs()
exported in drivers/gpu/drm/xe/xe_gt_topology.h

Lucas De Marchi

>
>>
>>I don't see this new function being used yet in the other patches of
>>this series, so I'm not sure exactly which workaround(s) plan to re-use
>
>it was supposed to be
>"[PATCH 07/19] drm/xe/rtp: Add match helper for gslice fused off", but
>then I forgot to replace the hardcoded
>`gt_to_xe(gt)->info.platform == XE_PVC ? 8 : 4;` by a call to this
>function.
>
>
>Lucas De Marchi
>
>>it.  But likely we at least need some kind of clarifying rename for this
>>function, otherwise it's probably going to get re-used incorrectly
>>elsewhere in the driver.
>>
>>
>>Matt
>>
>>>+{
>>>+	return gt_to_xe(gt)->info.platform == XE_PVC ? 8 : 4;
>>>+}
>>>+
>>> /*
>>>  * Used to obtain the index of the first DSS.  Can start searching from the
>>>  * beginning of a specific dss group (e.g., gslice, cslice, etc.) if
>>>diff --git a/drivers/gpu/drm/xe/xe_gt_topology.h b/drivers/gpu/drm/xe/xe_gt_topology.h
>>>index 2375f005e0c8..cf8f75a4c7dd 100644
>>>--- a/drivers/gpu/drm/xe/xe_gt_topology.h
>>>+++ b/drivers/gpu/drm/xe/xe_gt_topology.h
>>>@@ -14,6 +14,9 @@ void xe_gt_topology_init(struct xe_gt *gt);
>>>
>>> void xe_gt_topology_dump(struct xe_gt *gt, struct drm_printer *p);
>>>
>>>+unsigned int
>>>+xe_gt_topology_get_dss_per_group(struct xe_gt *gt);
>>>+
>>> unsigned int
>>> xe_dss_mask_group_ffs(const xe_dss_mask_t mask, int groupsize, int groupnum);
>>>
>>>--
>>>2.39.0
>>>
>>
>>-- 
>>Matt Roper
>>Graphics Software Engineer
>>Linux GPU Platform Enablement
>>Intel Corporation
