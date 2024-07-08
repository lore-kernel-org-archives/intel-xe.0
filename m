Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 105F2C3271E
	for <intel-xe@archiver.kernel.org>; Mon,  8 Jul 2024 22:52:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2E5610E0F4;
	Mon,  8 Jul 2024 22:52:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GjnJOGc1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0AD510E0F4
 for <intel-xe@lists.freedesktop.org>; Mon,  8 Jul 2024 22:52:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720479133; x=1752015133;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=rN6UsLxT7ffTCS3jE81+0X8USwDE3pd5j97R0jY5vi0=;
 b=GjnJOGc1uWAAo0I9D7bYDGHqdGGnk8lx/AjQ5D/mPtE1ijCBUfpcT68n
 U//9z3gZ09SZDT4Mj0mlE9t3oQIvxD+kStq5+dGkXFAg7dCtyVrwp0DaC
 uh6YSPkujuzOD5t54qgcRI4LrBj+YgIxzpGNJc5nuVi/TNBu9ZOrz/mCB
 O8mrGkoUR1jCLfdyr9YE89WW3h5vIGaOyq5pOyXiAKkg3sElSp3b8ueai
 SIA5Pv0EBAR6q17YU0xqimxz8ausOMoqh2VQQvWHj5vWQy3EW2y/AmA2P
 bBRaYUQkcXz/HIpCCIFiWH1QZD402cDDwvdAC8XCFoPZMxPPN7hAY69JP w==;
X-CSE-ConnectionGUID: YBhDl1kUTL6IeNKXNhguyQ==
X-CSE-MsgGUID: fy88gWpLRnyXIogsL/U/bw==
X-IronPort-AV: E=McAfee;i="6700,10204,11127"; a="21518016"
X-IronPort-AV: E=Sophos;i="6.09,193,1716274800"; d="scan'208";a="21518016"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2024 15:52:13 -0700
X-CSE-ConnectionGUID: X6JI+VyTSEK4M41nJXrTTg==
X-CSE-MsgGUID: f6XtvBb/SwS4gHg1XPrRzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,193,1716274800"; d="scan'208";a="47726665"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Jul 2024 15:52:12 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 8 Jul 2024 15:52:11 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 8 Jul 2024 15:52:11 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 8 Jul 2024 15:52:11 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.40) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 8 Jul 2024 15:52:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RhC73XGUd4lW2u0jwJDpKLR6TkUUU07Wtye8FLCs0+Z8ISXoXgvrMqRxrhq4P13YV7iYn03Itnf9paTc2AphWUZVdImZ9d3ECQnP4q8SS+jjESyIRUNMAJe/NDShzl3dahoHRv+ywtr2XaGHsHFpn8fuAWfbHz5xPxVPjmyN+3wHeBzd3xVkSBda8znPIwQ20wQYbhE4x7la5srrtwE5FG6EYnoMsoYcd91iOBzb1Pt2McDE54bpn69+BCZ7TlRC/CobpC1AaFwL0tFNcDZOH783yX70b21zUfrGfbwrH2BQseWfzhmU+NFb9X+YGwRobxsGnnhbPMitKM6a+x62UA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uw67oIxWwSxduXvwwDOGzfs6rDQouY2zl0QW3E8QRmE=;
 b=CVW2WNwzHCIZKzNAzkPXPUIcrPioMDg2ek3ylSnV0Wv19V6qEWKWKWdloHsqfRyTO+arj0AWrUFnIWcCQ2vE1lcLjtsIwXYzJrgl9Sib+rwaeTGhFbPEnvDBXuICPKwSf4T6UMMFvr15IMG/pIceOg784fCJ6Y94hi/35EbulHE41mNg/PYJPwn1lgJS5sXtiPB/D5DgHL28X3GSiKwMSGhFB+F/8juUp2zivWa4XsbzKoszifpZ+mT3e4VTl0kXLqdp9gpAXtPPUEhGiu1krrtnciISYiI0J2rZC5yk0LUxMBnDyhhtiL/2vGQje6tqjmfH4IJAfrFqgFvzwwd6Kw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH7PR11MB8251.namprd11.prod.outlook.com (2603:10b6:510:1a9::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.34; Mon, 8 Jul
 2024 22:52:03 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%7]) with mapi id 15.20.7741.033; Mon, 8 Jul 2024
 22:52:03 +0000
Date: Mon, 8 Jul 2024 17:52:00 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <matthew.brost@intel.com>
Subject: Re: [PATCH 2/5] drm/xe: Add ref counting for xe_file
Message-ID: <5vo72c55ibxeyhyokdmr7ogilf25fo6jk7hht3vkc7ekkixgpl@tmdzibnr3mjz>
References: <20240708202103.3347869-1-umesh.nerlige.ramappa@intel.com>
 <20240708202103.3347869-3-umesh.nerlige.ramappa@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240708202103.3347869-3-umesh.nerlige.ramappa@intel.com>
X-ClientProxiedBy: MW4PR04CA0264.namprd04.prod.outlook.com
 (2603:10b6:303:88::29) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH7PR11MB8251:EE_
X-MS-Office365-Filtering-Correlation-Id: 0148c9ed-8b92-4270-41e3-08dc9fa095b5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?UlG7r06UvLXqBcGCofFRKC1rfzi30bL1vBo0jj/9/N0b1cp4wpRWGuxQpAXa?=
 =?us-ascii?Q?DruMTWK48qawWGsnlSMSLEvU3/dnOZssOIUapoMICJnSjFYZmjp1svMvnIsi?=
 =?us-ascii?Q?7GtyN3iVghcbxBa+xcked51KUDK/KowePOU3cRrczMkt0oZ5UMM0AOccC2Pe?=
 =?us-ascii?Q?GNxxw/RWmPWBR9au/Y95IC6rdOXOMXw66LAEHzxf9ValIgwXzOmoNBmMtx3x?=
 =?us-ascii?Q?iHO/QwMV9q5oqgzx4HGD24Ba8R4g34kE3OWPfPw5OMU+UDkWcG1UD6RlDAid?=
 =?us-ascii?Q?SIVGR/muGfHTAWCn3Ljd0n9ULfFYgPl4dhWY+FuP9UfqRWnDG81s0IJEBOja?=
 =?us-ascii?Q?TjybzP0ZRZ8dYakuMLLViaRzdMid5dbZTOxUe2cLWw11UjnvQti6VxT5gEn9?=
 =?us-ascii?Q?bKbDcGjtHVjxE8Piw7LOEioXPE0nDGC1w0XWX5kNihPUPYu1Rvd8K5UQHTCr?=
 =?us-ascii?Q?QKTfoLCTOzhNoBNHPiHkcB48q1q6tX7d4Qtv4bHkjfeOet+EZt5o8WEH1HI5?=
 =?us-ascii?Q?op7iHo8cxMu0CVlZFlzlyQcbfxfKrNw8+koUj6ZwVEjgJ14fGcWt/wOfhi7q?=
 =?us-ascii?Q?jkgRM531ga1yPDsbv9ZO4GQ8fWsUPrP4J2a9OUoyzDtooR+nPm90+mk7CPkX?=
 =?us-ascii?Q?6bCt4oFnfoo90SFH/hK25uGyp7v1J+GG0gNjvwPYpVk5vaFlgv8e6wzSplIi?=
 =?us-ascii?Q?jpQXooJsHmLoJcHtOZndG5EdQr7C4R2WtLqpwGXgCG+h6tYREsj1Jr6oSFMF?=
 =?us-ascii?Q?2AcfCx8aBW06r7acpPpIKW1NSKg9uh5CnB2GLmd3IokdkWXJWhUjK9wIK0ag?=
 =?us-ascii?Q?46Ilarzd09mhmjM6BuMw2MgLfvR9XimV845olSctsy0bCVnI4rnVrrL9qyKw?=
 =?us-ascii?Q?3L3zUtKnF46t/2rhlWCaTo0Oys9Fet0z/Ke9cqCFaK2SrdTeWYbe8EDyNpEg?=
 =?us-ascii?Q?3AAuh0mPW7klhSNlZxCNQoZ+4sZ89ZRDHiq3E2LFioD/3FkMELXv0IhXlgL4?=
 =?us-ascii?Q?zpJrTJnWwJpc37U4EAhnuwz5U2W7dXnS99cejwnhBD1IJ/A6IfoCc1S/4IZJ?=
 =?us-ascii?Q?/HCgLe0ap7EPacqvGqTMbB2WYdUhDvcSdcYq88kgh7xRjjCehEmLwRNFSUml?=
 =?us-ascii?Q?k18vE4pDyToWzTtDk1ZupcUNgYBKctVXM972q0LcRd1Tdd64+Mxk2+usaghA?=
 =?us-ascii?Q?c7hTkJcmEtpxpBVmHo9LLaOh7CxidkLD6ezlU4rwFrp3jSiLSM20qpBs7IET?=
 =?us-ascii?Q?BSXFnU2fPq50G90+HubWyBxFfuuqbmKS/dSGizirELoDakHFjGPammNRsikZ?=
 =?us-ascii?Q?qadq/f4+QGLUzqaFzmmHTKbVyiVvDtq83RKoH7p4zET3qA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ZYMB3p5qa726AGLD+MuxaD0R6Y35wgtZRVG1rVJ1Mffmgc17HI17FkALYhnO?=
 =?us-ascii?Q?nR3F9jWyd+e4CUrJkypdjPe/muq1bdYGEHzSQ8ld6KQHF78JvZTW+OO1gwy4?=
 =?us-ascii?Q?EUPg3zJzPUPYENDVUV6aSlt3aoRC7d+tN5DQwbs+e9LaDiKGKreqiJ2ukJ5q?=
 =?us-ascii?Q?M9uL9Ja29RvyGZb7FEk6qqYn0IIc5GXAhAWIcXpPV73NTdTqoi+td4v+Q9Jg?=
 =?us-ascii?Q?t9BgnCr8uDXDXoAMSE9GzYH0jZeSYRDD43huEpIbtKq8Lzei3VKkQCkguWsF?=
 =?us-ascii?Q?5r62hXilCGAGfdIsyCY5k/MU4nwZDKaHhZO+uQq4FgwIOml1f27PEku+afZB?=
 =?us-ascii?Q?T6rWuFYE+e1czQhSLpp/frtsbYHuwPnjnTQ/wsR3el4+mGydN0jlen8XoHNg?=
 =?us-ascii?Q?FGj/kQ99mf5RPlXdBMrJ5WOWn6VHBn23T0LAFs2pgF8/6knVAYYnejIIQ0gI?=
 =?us-ascii?Q?D5ICsfBy5188NYOW1Pe7gaatgyvBW1hxOaUD2MQ+MTKIHFdN2zasM3tgI/96?=
 =?us-ascii?Q?bxLGNhzTQ+6Z6TeCUynhAiimNhqIhFLfI/cnaATa0swlyrUUq4noXptORi73?=
 =?us-ascii?Q?h4D1rkH6wjLw+kVQGPivGxWSa6T6vUuUTzjNuI0jSz6+XP1pacO2QIAaPmft?=
 =?us-ascii?Q?YXg5osi2FFNXZ3nMFRlVk2xU/IeH6HxFuAZ0YXZIdIqQapp3G7PfCR8JfxiH?=
 =?us-ascii?Q?kCJIuhGlypQ0ul55maGYARn4KVYg5vCMbBJ/ynKUm5eVnwEsZvcfsYcxDhuH?=
 =?us-ascii?Q?8k+Zcia9z0M9+GyKgDnwxxkrVCBCEcPEAPRpKeQwM3n46Sxqb3qYKIZsUlZa?=
 =?us-ascii?Q?bzrr1WXMrxhxkwgWFWngXk2cxmpEe8N18jRWhuR5Sr0ZwoaRoY5ntD3y40QW?=
 =?us-ascii?Q?1JgUST+OJXLmLJNpdGEKm78jIaDSDGPhaTvwLQO3XqdQP10ks//xdKf+vJ64?=
 =?us-ascii?Q?o4KXoHoCCyJUhlWDyrFLlRCxPMkv34g3drQyMoj5pB+6cQuCpsiuxXPLhD/p?=
 =?us-ascii?Q?UB5w2HTAMrdqY5geLIB5Wb8h6PcZ4W0ACzWW8IdAgx6+Ro7k+ebmVnNWiPNI?=
 =?us-ascii?Q?QP+C0/sDjNYgGMHI21Wzqzm2FEGZs6Id9p2VMmPZEIYbuEXnxxg5959s6Ely?=
 =?us-ascii?Q?U2/BaegijbrQNWX99ZIVudL3+O/qZe6QqzxBvOKKFzpQUQM2L3Hnjb8eAgYI?=
 =?us-ascii?Q?SfGVXoerINrJVXqw9Caqw6icz4n4OwNZ83vRSG/hqCUgYhH1ZrEqTus6PYfj?=
 =?us-ascii?Q?LPoj6zpF86gJUNmie59DehKQh3ZHM9DVWAAVFQnbBc/cZ5JAy4W7UAK7Zk+x?=
 =?us-ascii?Q?sfJjaguMipasi5oMnhjtkV6y/pp4luOjskChNi8+lMBpappwscwQTVxsj93W?=
 =?us-ascii?Q?fdkXzw5ieP0LE5hsDhUog5LiBjTVzfS0uvPPPWbnti8vttq3p8RNMdaBEkEP?=
 =?us-ascii?Q?HhlG9vP9sc3sbt1Hv0d95DdGPBGynNsIwEZdnLtEGv+/cxmKhyjIvO9QF8UU?=
 =?us-ascii?Q?2lYObj6w9EgyP/NVqlIU68Z2c4sg4vQhBsChzmxsHYzV4EKIRn8qI/eKGJIF?=
 =?us-ascii?Q?WqFp0019N6cRclSd06e6SMubIwYobDYW4MWZ55HcMFUxU8Xx5M7b1c4ZGEen?=
 =?us-ascii?Q?pw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0148c9ed-8b92-4270-41e3-08dc9fa095b5
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2024 22:52:03.6675 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dFwK1OH2jznzssh1GLv101KjsF5EXmOkDIk5ZyB99pHxJoDuGklCCR8fqJbHMkn6qzS9Ym6mU6Q/tXk8kYxQ6DFwVwgh3MvlbpNqLyzE5Xw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8251
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

On Mon, Jul 08, 2024 at 01:21:00PM GMT, Umesh Nerlige Ramappa wrote:
>Add ref counting for xe_file.
>
>Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>---
> drivers/gpu/drm/xe/xe_device.c       |  7 +++++--
> drivers/gpu/drm/xe/xe_device.h       | 12 ++++++++++++
> drivers/gpu/drm/xe/xe_device_types.h |  3 +++
> 3 files changed, 20 insertions(+), 2 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
>index babb697652d5..e6eacf1bcce0 100644
>--- a/drivers/gpu/drm/xe/xe_device.c
>+++ b/drivers/gpu/drm/xe/xe_device.c
>@@ -87,11 +87,14 @@ static int xe_file_open(struct drm_device *dev, struct drm_file *file)
> 	spin_unlock(&xe->clients.lock);
>
> 	file->driver_priv = xef;
>+	kref_init(&xef->refcount);
>+
> 	return 0;
> }
>
>-static void xe_file_destroy(struct xe_file *xef)
>+void xe_file_destroy(struct kref *ref)

why do you export this?  I don't think anybody should be calling
xe_file_destroy() directly and this function being executed should only
be the outcome of kref being 0. Also, if it's exported, it shouldn't
really have struct kref as argument, but rather a struct xe_file


> {
>+	struct xe_file *xef = container_of(ref, struct xe_file, refcount);
> 	struct xe_device *xe = xef->xe;
> 	struct xe_vm *vm;
> 	unsigned long idx;
>@@ -130,7 +133,7 @@ static void xe_file_close(struct drm_device *dev, struct drm_file *file)
> 		xe_exec_queue_put(q);
> 	}
>
>-	xe_file_destroy(xef);
>+	xe_file_put(xef);
> }
>
> static const struct drm_ioctl_desc xe_ioctls[] = {
>diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
>index bb07f5669dbb..2a8b370b1fda 100644
>--- a/drivers/gpu/drm/xe/xe_device.h
>+++ b/drivers/gpu/drm/xe/xe_device.h
>@@ -169,5 +169,17 @@ static inline bool xe_device_wedged(struct xe_device *xe)
> }
>
> void xe_device_declare_wedged(struct xe_device *xe);
>+void xe_file_destroy(struct kref *ref);
>+
>+static inline struct xe_file *xe_file_get(struct xe_file *xef)
>+{
>+	kref_get(&xef->refcount);
>+	return xef;
>+}
>+
>+static inline void xe_file_put(struct xe_file *xef)

I think if you just make this non-inline, passing file_destroy and
leave it in the same place, it should work.

Looking for patterns in the kernel for example, see pinctrl_get(),
pinctrl_put() and pinctrl_release().... or clk_get(), clk_put(),
__clk_release()

Lucas De Marchi

>+{
>+	kref_put(&xef->refcount, xe_file_destroy);
>+}
>
> #endif
>diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
>index c37be471d11c..ec2b0fb6afe1 100644
>--- a/drivers/gpu/drm/xe/xe_device_types.h
>+++ b/drivers/gpu/drm/xe/xe_device_types.h
>@@ -566,6 +566,9 @@ struct xe_file {
>
> 	/** @client: drm client */
> 	struct xe_drm_client *client;
>+
>+	/** @refcount: ref count of this xe file */
>+	struct kref refcount;
> };
>
> #endif
>-- 
>2.38.1
>
