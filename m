Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53CBEC3ABBE
	for <intel-xe@archiver.kernel.org>; Thu,  8 May 2025 16:42:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F085810E039;
	Thu,  8 May 2025 16:42:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dJhJTe9t";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 914B110E039
 for <intel-xe@lists.freedesktop.org>; Thu,  8 May 2025 16:42:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746722572; x=1778258572;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=TYwH/RX01pJFeKu29fnAZjZiJ6CxFuH955pA3WsBOwA=;
 b=dJhJTe9tbJoImGtEPTsKFE4xYlyYuCgaTLU8V5bkGDkZSFRbUOpf4W10
 N7T+/4uBORX9l5SbdYAz8FwJpK9pTrZj452ieui5vXILezpzH+GZOxdam
 +ZLfJ4vpe/R0wmfiRBueFKLageeax/DidKRdyrbwhL+jHnC95CZVQJ5aV
 JQ46wkVNeW4a1e4q0ANzHyJd4pGhZhmxfeGG9isuHE0h5pOYOyH/LuxaC
 8V28E504VWX3NW/wgr1jH8gchn6bvLsDjgpeTf99jyx/VvhSLL20UKjV4
 YXbdct818UDuGFuwG4lRx6CHttKFtEomkmQi36VzQkzIeD4cbh1NI2BQG A==;
X-CSE-ConnectionGUID: i5/nDK5aRTGSQIfV9KBFPw==
X-CSE-MsgGUID: k7gQYzx+T6ahsiw9wYfyag==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="58732374"
X-IronPort-AV: E=Sophos;i="6.15,272,1739865600"; d="scan'208";a="58732374"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2025 09:42:49 -0700
X-CSE-ConnectionGUID: mAo04u5oThewUkfnjScMlw==
X-CSE-MsgGUID: 7NiA4VIcTCWS0ZkEC6GbMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,272,1739865600"; d="scan'208";a="136283763"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2025 09:42:47 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 8 May 2025 09:42:47 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 8 May 2025 09:42:47 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.175)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 8 May 2025 09:42:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w2l9bJCOsnNBwZBCnxd2yUayEzoeTwBE+eHn4T1OA0Wyxq4E13/fLrkGnr5/YHkzzycMCOHP4zGdVlRvkN2j1o+Z/xbrAwD+be6lMtMw+5RdYpsc6h1btzmu2tXjfEo7/K9XYynLs+M0DM1xqTg87R5qS3lrH5oJj9FpUNxXy8WZ8agHA1Of4sebBxVpFitr3INey3ulUnadfFt7z2UUc+NvjsfE/SqHbWxsbLMdg17tjA1TSnuHaqvXQ15PAGJALXKNvCmCQbnjZiSF0i6Izimha5agPAyOW70nI3VuelpiphkA4kBex1I5XACfYbWY4JTPwBu/Bc74/gNz7UVONA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j/oP63knv5gRE7kXBLXKd72YPOCdtYcQC2CgZ8528ZQ=;
 b=fTHlsAHQD2lyUv0gjwGbidWiA4fsNUgBVn1LEM7sX1ebica+Ol/W2mCGOoSkUR4+S5BeJ/xzAix6m8bG5D4TlFZ/xjPBS18fF7knI2sIhg5EOZrvqNytbFBsM/u3YBpyAgZlNoOySvCCdOn6s5KdTjI4Yze09UwdaU1XTA40CqiMcBHp0WNUitXhBhrO0SoXl4ly0WSZeb3zPj6FpyZ006lHn6U+WDVWt0qq91ZTKBpLLhbaN0sHcvkdvWUVBVqXBjkXzo3iyAm/scjkB2RtGMcmD4mAfYJWriTHk0uHQThXe4AJXSIIT2v7+spz+HeYn8AXsp0Ef2HSBRW3V4DsaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by IA1PR11MB8862.namprd11.prod.outlook.com (2603:10b6:208:59b::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.23; Thu, 8 May
 2025 16:42:43 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%5]) with mapi id 15.20.8678.027; Thu, 8 May 2025
 16:42:43 +0000
Date: Thu, 8 May 2025 11:42:40 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: "Ruhl, Michael J" <michael.j.ruhl@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Johnstone, Nicholas" <nicholas.johnstone@intel.com>, "Box, David E"
 <david.e.box@intel.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
Subject: Re: [PATCH v2] drm/xe/vsec: Allow for kernel context access
Message-ID: <szurq5e5iqu6gc3nxogabkz2ko6qasiaes4vbvyxsec4bxpk5e@mjwurftr5wsu>
References: <20250507193811.268719-1-michael.j.ruhl@intel.com>
 <gbcppvon5jrqdbplqzlg3lyqjd3p7s4uv36calvetvnnn3ghxj@elaaiqz2j37e>
 <IA1PR11MB6418919523DE73706B405790C18BA@IA1PR11MB6418.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <IA1PR11MB6418919523DE73706B405790C18BA@IA1PR11MB6418.namprd11.prod.outlook.com>
X-ClientProxiedBy: MW4PR02CA0009.namprd02.prod.outlook.com
 (2603:10b6:303:16d::20) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|IA1PR11MB8862:EE_
X-MS-Office365-Filtering-Correlation-Id: ede4dcb7-adea-406b-948b-08dd8e4f5ad2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?WUvlZA5zhs3RU4zaACOfV686Ti+dAV0LbOagj2fPVCKbmaLUbivQhMs9ZihZ?=
 =?us-ascii?Q?5iU/bt6bcn6t8c67GCxKHmQCyDawAgOONB4hNpQdiNkpNkWcHIgmHuHatabB?=
 =?us-ascii?Q?pwhDV/m/18QTVUOJFczwCQzjpMtwXsFYg64r6Dv3KOWFg3D3ALlytU3vyOin?=
 =?us-ascii?Q?j8L9It9U5//wqTl/xWEsj+mbHfKxbXG/j5axDRmE3pqzTnrHIihGQTD8wOv9?=
 =?us-ascii?Q?4HPJpWzntscRMlA/ThllkQ9RqkRLKxzXAiPB0gkGdSvE+AMnVaeoJdXVSsS2?=
 =?us-ascii?Q?3C1zWM8DNw0RnCRCC8CCEcd8S/tdKuVWCTePkJ+T9hmJUqfwM4CiAbvxo9z+?=
 =?us-ascii?Q?NVvW6hZtnXgcYFyUQJEZUP/HQgGax7jG1FGVN8e4Vs/ykI9Fr0os7NaP/72Z?=
 =?us-ascii?Q?rhA3XModP9H8778KnHvgAgsSHO4Pp7RxoE4FB91xNFjqqFR5oLM3WDPCQcje?=
 =?us-ascii?Q?L8Sl7IGfOFe0IDfN/sLQHzkOeuceR6sfj42JH80XofInhA1Xt1njH6g0Hs8l?=
 =?us-ascii?Q?HGTI+s+giTNNjQV+bukIgpimz37KEP/1ETpG4AwnEnLDSSA160fe6t5Lq4fh?=
 =?us-ascii?Q?h8E6kIjDvgAcZNuR4JI5pOQouRDNjYTDLItgAvfvBjFeEAWIyKC6bmu0hEgh?=
 =?us-ascii?Q?uz3YUMJRvuboQxflzj3/ZJwZG5+zlSyXu5KrHp8K2oMamOJux291Bs/MaWzr?=
 =?us-ascii?Q?ClGv+nJZFE0nvTCHWrlp9YJIKiVJ2DXa6cCfsw+hNEUXrP/c42tKQI56bzyM?=
 =?us-ascii?Q?PN3Og9c2Yy8Pr+YIpfvIObA2wIJMFghjisQTTY9/G9nz0qvBKGshYdkSc4U0?=
 =?us-ascii?Q?uLu5eeMqVglLxAXR6zxB03qSR4eeJEVPOjoRq41euzfO7k6QUjdxj9/n7SSj?=
 =?us-ascii?Q?g2CFFcEmS56coXWpMQM6KqaBRPohiArRmGUhVYPsM51AUSjNdD/wLiTWvNBZ?=
 =?us-ascii?Q?yMT1CgDPbHvKDi+C+iwuTGpib7498/zqO9R1Gl37Uo57BZoIFsakhb6uh2al?=
 =?us-ascii?Q?tDLiPvo/SF+SYjPBtibRbb798InDG2hM28kXwcL8vcNL30Pt7aGY+C1xwvKu?=
 =?us-ascii?Q?073bM8RgZUfTTOLf0jLI3qggVG25NFo+PHPOEm0BDFB2jZngYotB8oZa7JOg?=
 =?us-ascii?Q?dOJtyZoAb8skcJHqxvEkfbftN0VaNf52dgCUjhunLT/OJV9CKx/dfUk/cpwA?=
 =?us-ascii?Q?jn/BhjNAMWbquh64Zpc70MV3ZtXvaeuTl7brpaAjThjhryp7KAR31sMU5RP8?=
 =?us-ascii?Q?WeV8YJPCMZ3j4nSNeBEsZKQMxlMoxAvrI9LEj5K3DnxkQFtwD9kAmUAhGCFo?=
 =?us-ascii?Q?GNF1WLk9OkNAb/42VHwpiwD3nhRX0P1MwyLTimTcSHhpVaXZyxwpMZAs21FP?=
 =?us-ascii?Q?g2HeYARrEH8mgNKvdgrsWbBqtu7zxXA3sV1pIyupjPhikJDHT81y8KJKMHug?=
 =?us-ascii?Q?W1ydl367NBc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?OUWS67tjH2if9wjpjmly+0yRq66CH9cQwL+90C0ght9jy6/UYGh6q89wHSWy?=
 =?us-ascii?Q?mDYSydhQMSAwyQDRN6VZcYqKNhUsvqCwegzPfsqg8u72LjbfGpDTueErQ07y?=
 =?us-ascii?Q?0oOpWlAkW1Rd5uzp3zcdi6/dvLAF99q+NoRUXbODDHiBzsbpNcRuaE4T//Ts?=
 =?us-ascii?Q?fjjcLFoc0ci8fxnOOdfbbu7tN3i7+gq4GieRkfucRb81r8wA8D0oOafPDDPV?=
 =?us-ascii?Q?Zjp95A76NXy1STRhSb6wYrI8FAnzqZm7vWXhnnVP4XHb3IWz7y6w2I3X0Ip2?=
 =?us-ascii?Q?6aSsPcXNFgdzPwSA0Gd7ivqD2FM4AQqvdwUfyLrBz5AztiBYRHqE3sS+sfDI?=
 =?us-ascii?Q?tOB+Q4SdskM3JuvHb4R/yhNIsbwVcG5CovNkyrG4CCTVE6hqYAyFVf9GpZK/?=
 =?us-ascii?Q?FcrDAUE08NeDyFWWkslrVWzeUQOqiOqvpbrkVS2ikvCD7YiKZEqvoqvPFcAk?=
 =?us-ascii?Q?bVRHZlyC1evOgUxc8kLqdivbTcloqiGKVw+CbI8qI3z0DshMHpEAkylwgXK9?=
 =?us-ascii?Q?ctsLiDDXf2IoT7fPreIdg2gItTjerNuqbCRvjFeARJ6UK8soKpENlIUrpn3T?=
 =?us-ascii?Q?M/j6tGX0lO5ATbcIhmoriYD4vMHbM4ULJZw1EsnYVve7aBscLH+1JgbifpPR?=
 =?us-ascii?Q?JD9vcadxtiOk4LaLtWWVG+O5rRRm94gZxKZKTFhZ0Yskikty4wTwVy+18azz?=
 =?us-ascii?Q?1dkp03sfASjw4WgKi0X+ikNFWUtjeziXMSSHXxSu3tJ6Db6w1gfrT/BtOgbM?=
 =?us-ascii?Q?U4HzCgFmTv7xjU5Urh+K6WKzvqju3hMqIvm5sYvu3m+pNall0KN+gdpeZGHm?=
 =?us-ascii?Q?5Z94NfpwKLbIQK/x6rpi9ljAP3jiquTfs1VCq0a7fvHZ0IbSYqvgMct4J48b?=
 =?us-ascii?Q?zkHwEm4MiWgcNMxs77G0MOoaLP9zjh3xd4+BJiyrk3n05m8jdZqo0zZax2kf?=
 =?us-ascii?Q?xq3REfTp+wWCVN3Y4uLvniSRQtCgOzNjyfrrwKDYFn+eb3UAG1e7tUd7uMEG?=
 =?us-ascii?Q?2VNa1/3mQVkfiNbZAX3WUE3uHQ8+4ISOD2E079WNm48xjBLKog/d6/SmEL+F?=
 =?us-ascii?Q?LptNhaC+C1TiWfkYVDXVi3kjIxdJSZs5EXkNmylgXBVMbnD4/Fa9xZaFx4LH?=
 =?us-ascii?Q?93Na8iqzarFkm0P+pLuYDTcdGvotAqnZYT1qaNtHh4KwJL9XM4GFg/PmUl+d?=
 =?us-ascii?Q?0KEdGrim7QGRmcBbjE8vUr73ENOPzRqxYxaCmmCgxlaOgR8kS6UK1f4tSmR8?=
 =?us-ascii?Q?rx4hNWv8F8UG/8to6ICcMWtLNg40hSQHeuWU0rgYj/NJjhg5iUz4iI3IEy88?=
 =?us-ascii?Q?SUD18fcEiMMkcvvo8m/w2H7fR8Ou8t1rwahphVTOXMHTQIr3vTMnb12/hU87?=
 =?us-ascii?Q?1PTCL3f1S4gRam3AfJCyM3EPW7G1/Yf5wHuEnnu7GxPlgpnJ+TFiF5WWTMUO?=
 =?us-ascii?Q?fhXeBbRbzurOQKWQRzrDRc50KGQeqHTXFZ7odsJolvxVzcdj2Ai8RhjMaY5/?=
 =?us-ascii?Q?1cHUVRBXE+3yVZYqReHVOlp2gLxQKtsQmhk3ZgxhUA3l6R3NnNskcNS8vFsg?=
 =?us-ascii?Q?UgBrTuEOeobWKsH5WYrmm9WXjzqZcGny6syVI+NevqZnMYS+Z92oTFHnOsdS?=
 =?us-ascii?Q?UQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ede4dcb7-adea-406b-948b-08dd8e4f5ad2
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2025 16:42:43.5995 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JvKUGt/ESyt1/NA55nCatJe8+K3ZO6GqLmLzRPWKT0PRwpTkbsnBf/NyUflDDudWlAhSPPrhxranm8okAaVplGTojQsIHgVYxh9o9gElBTE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8862
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

On Thu, May 08, 2025 at 01:09:06PM +0000, Ruhl, Michael J wrote:
>>-----Original Message-----
>>From: De Marchi, Lucas <lucas.demarchi@intel.com>
>>Sent: Wednesday, May 7, 2025 3:46 PM
>>To: Ruhl, Michael J <michael.j.ruhl@intel.com>
>>Cc: intel-xe@lists.freedesktop.org; Johnstone, Nicholas
>><nicholas.johnstone@intel.com>; Box, David E <david.e.box@intel.com>; Vivi,
>>Rodrigo <rodrigo.vivi@intel.com>
>>Subject: Re: [PATCH v2] drm/xe/vsec: Allow for kernel context access
>>
>>On Wed, May 07, 2025 at 03:37:40PM -0400, Michael J. Ruhl wrote:
>>>The PMT driver API allows kernel level access to device
>>
>>ahn? What's that supposed to mean? what's the context that is calling
>>this ?
>
>Hi Lucas,
>
>The PMT exports the pmt_telem_read_mmio() function which accesses HW registers
>for telemetry information.
>
>In this use case the SOCwatch kernel driver is accessing the API trying to read telemetry
>information.
>
>Since is happening from kernel level rather than user level, the mutex throws the
>"might sleep" context error.
>
>I tried to distill this the above comment...  Does adding the content above explain this
>enough, or should I be more expansive (what details do you need?)?

being called from another kernel module doesn't explain anything
regarding being allowed to sleep or not. Also depending on the context a
spinlock may not even be sufficient as it may sleep. Without knowing the
caller we can't even know if it should be a spinlock or a raw_spinlock.

Lucas De Marchi
