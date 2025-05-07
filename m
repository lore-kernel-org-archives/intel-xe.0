Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 567C6C3ABC0
	for <intel-xe@archiver.kernel.org>; Wed,  7 May 2025 21:21:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2CDF10E1C7;
	Wed,  7 May 2025 21:21:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hIScYxVu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94F2210E1C7
 for <intel-xe@lists.freedesktop.org>; Wed,  7 May 2025 21:20:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746652859; x=1778188859;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=XtTzZYqLDWqeGr3tTAgoq4CFXOkJWcbJP/b+cT25b+c=;
 b=hIScYxVuozlh9eYCA2XsvwE5BPQ1SIzQ4ZdAhsg8XQjkeVRd2/46UgY5
 6aq56VRoxU56Sg0/Xd/2B3XCm9oMa4JlC3ihr/lSTudlBq7M0DMGurLtS
 Sv5HD07RbQ7rL19bVmT6jOkxrXQ0X0EwUeXzR8ublTiNrk9ZutJkjDvLe
 PrQs+NL17Zdc+xwBcDtQOGtvm39KevKNQXN2l7WEgJtBJlii4R9hn1zA4
 oH+wxU74Y8BFo6aRVymDpgeeLUV03+r/Q7kwvOIoWs+MoHNFBlNpFHyZa
 7E4Dwz33tKRYVzSngBzMWM71ST6D4YgsH3NJcOFh9/DB1ukilzTIbRsq1 Q==;
X-CSE-ConnectionGUID: NS3wkMNsTKiTgGYL+xI0DA==
X-CSE-MsgGUID: o+FT8+MpSb6qK2ayCOaO7w==
X-IronPort-AV: E=McAfee;i="6700,10204,11426"; a="70908879"
X-IronPort-AV: E=Sophos;i="6.15,270,1739865600"; d="scan'208";a="70908879"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2025 14:20:56 -0700
X-CSE-ConnectionGUID: ez1HjK38TuemnQfS3QoxGg==
X-CSE-MsgGUID: Jgan5XG9Syuiwxi6LHzz/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,270,1739865600"; d="scan'208";a="140849335"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2025 14:20:56 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 7 May 2025 14:20:56 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 7 May 2025 14:20:56 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 7 May 2025 14:20:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NktkRsedzkD/ZnHA36qBkuDFijqBTnvPDfpoVq627VBczY3X3iL/bNPmmFd5bSqDMDHox2UOJdfIc9fnWf/JEFw/F0dYTOw0iGAvllOaeszMLO0IWc0emE7JnCDvPO9G5HFJMSMYkeebNeqNA8E0AzsNGDuO1CwEJQqIIKNGeCwQEfuf6ZgHs+PPsEPqAV1BvndPa7+riX9ekIqHcpFLu9v8exU+Z83tQRrbZ++j0OQvf2VilqHXKCTq3WOf0y/l/mY3CO/uSU9VCSUc6JK029Kg2f7KVp1p2MeBINf4wFizXohC+fbktPI/ZsrD6ihG2nxCAmJGsWDAXPSsvQnahg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yKdM3nt5sGhNlvPSyIAMH9KE1ygvw7ScQL43N1ADO14=;
 b=vqNWYAh041odLyAQo9DfEw6mmkzIPSQKVPdlAgTLwS6/Ph/clj7qpIz04cGLNNynb50VIXffUR9wD/uSu7i68UzvrDooLK4M9aSO1koPHduvl5uK7CNDoEwhUYycgIYFKSmHOEg096LBGzVV4EaE1F8trfT4ccnFRoEDVUMxC1UAeSk+5HwC9skL6ZgPvgHSaTvOy4ifA0Qoo8+5F13lk1dEmo8HCVfjsNRYp8n118D0lqbRppzsihLLI3Fyvn0E2l2tIvJW8yp1TCokCAQp7KtZUYVhT9V57gOHKDTQiYO4gSzBXpLLpP/oW+xHCMgtIOwUOsJ+MDNoqHnLDhje2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DM6PR11MB4547.namprd11.prod.outlook.com (2603:10b6:5:2a1::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.26; Wed, 7 May
 2025 21:20:48 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.8699.026; Wed, 7 May 2025
 21:20:48 +0000
Date: Wed, 7 May 2025 14:22:13 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 <intel-xe@lists.freedesktop.org>, <michal.wajdeczko@intel.com>
Subject: Re: [PATCH v4 3/4] drm/xe: Check 64-bit CTX timestamp for TDR when
 available
Message-ID: <aBvPBb5lzKRLlmyF@lstrano-desk.jf.intel.com>
References: <20250507013039.2043897-6-umesh.nerlige.ramappa@intel.com>
 <20250507013039.2043897-9-umesh.nerlige.ramappa@intel.com>
 <njcubtyaqbejliohfpklue6b3zxbxat2ly6bz4imivaxoh37vu@wi3pickrjp36>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <njcubtyaqbejliohfpklue6b3zxbxat2ly6bz4imivaxoh37vu@wi3pickrjp36>
X-ClientProxiedBy: MW4PR04CA0236.namprd04.prod.outlook.com
 (2603:10b6:303:87::31) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DM6PR11MB4547:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d6e33eb-ae92-4d33-f5d1-08dd8dad0955
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?wCf3skSSl1mp80lGLHxKAVEXxqaLWFcBwAfyligBkqbKsYimtjoUgJ16Dd1r?=
 =?us-ascii?Q?NOFw0kODUZX8NoUnS/lV8NYQRaEKAZz/T5rlp3d3ggOggjfJaD8hsn3VsAsw?=
 =?us-ascii?Q?ojpnmv7zinTTXHqc4YCAtxElZbtCl+c/lYvS3Yhj0rcJzmxaFw6yJ+500ZnH?=
 =?us-ascii?Q?MD/z5YYBX57JDe8LYVGfUdRcHdPPnmbpx4wPJEAzTsf03mP6ijfwcaAc02jh?=
 =?us-ascii?Q?m2IQLLDWdV2b5J5pVKOHoYX/sdsQmWc2b627qQdxLqiPDlGzwl/dsmOC99vG?=
 =?us-ascii?Q?CQF0m0M0t0+AfiFKw/PdO9IrEVTnny0U9Xx5NaVHMclPqfY2FKykdo69veUQ?=
 =?us-ascii?Q?2y1B0fzh5QT7QDPJ8EKQBoPJm41bECD8p4sXrejdw/osb6A7I5NJ12qxCXfD?=
 =?us-ascii?Q?HzS5R6mlsnEqA2De/a00kYZSxSFpqYj7pv+S95j44Y+JVXHA4BZ8JfKl6hLb?=
 =?us-ascii?Q?OmV5JwsV72LQ7UzAhYBn4PZTG82I2lnZsc4DBdHGOl3RjY4hovY/BmCBmA6V?=
 =?us-ascii?Q?0W2Gyd8jdDvH1ea/HQTiulNiniwoCLX7q95VopskpEEmRdTK7RHhNp+3oEFW?=
 =?us-ascii?Q?ATbqd5qxrv4majG/7GA/g0FJMn2DN/dSXRA3hLei3rvrWZ/HiUFcqnKsFr4c?=
 =?us-ascii?Q?mh0E7123FWJ3pAu0wyETai44gsaNBGumWcINvCtxv20fCR7oMfYf0MQRJU6a?=
 =?us-ascii?Q?kkG67DQkWyq2NwwJuy30YxN3HEnTFaPYUvb0VjyXJqs84omQXLtCbUOadZ9D?=
 =?us-ascii?Q?/2AiU9KEZJIZQdCMaCYTsH4z9FdSSDVgYA/ahou0PJH/AKwR8V8p8Lvg42c+?=
 =?us-ascii?Q?vpvKu/GNvBFW/PBU961P3mp9N/riUYDOnDTlLFQSaz/0PT0UfDtfl9mUwPoQ?=
 =?us-ascii?Q?nmBQ5uPM2fTTrlH4vRAxHpbAHGdYGk5h5EzqG49Z83OO3afNWII2A8u8ehoU?=
 =?us-ascii?Q?PfSBOORpBeaDq2qx4X3P8itcXWq2+5zlTOow+8SsFnS4CgHBN/RXjMFq7Cgw?=
 =?us-ascii?Q?QRTu9bg1cAvGIJqjXfw7ltc22q5Fo6XcyOxzzBuLdDvxxdM5aHWoTDhT143h?=
 =?us-ascii?Q?cJEwDcYdhgkWs2Ks2MLlV/bDSfxoK6TEOX32eKxztws/iSGP5mx+t4lHHScd?=
 =?us-ascii?Q?XiENYt7ItWnaC11+KntRRibri2cskwZfD7rC8Tz8vAuA/Hx/OFaLYkXIDxlK?=
 =?us-ascii?Q?VCaFbhZa2K9+/eEN+Ah8yoIIG89K3otrVm8ZwfKIuW8mzXIwqGleMoTHZYoV?=
 =?us-ascii?Q?UmVVE0QrnOphBTnGud4I4iWjJ4K4pJk9DB6oda8KTDqJmE0+OhZwmc7UsiuP?=
 =?us-ascii?Q?a0v8H3JRlRyjJxaFHcNr1O9BLSo+ZBnxWQoU2V16MxA5rLlt0aBBbRvMHV5t?=
 =?us-ascii?Q?uubV8LtUkBY0zL6nL9ys9VHyMfuZ4lweIAytuZ80Ss14Wm0PKglxVPq1DwzH?=
 =?us-ascii?Q?VsQwcxv3fNg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Xs2Ms0m1tWbifZh+iZj9KIzh8+IPn9uoADLN47AAwo35OEXm7Byx0mn76QV9?=
 =?us-ascii?Q?ayy8FES7XDuK9rBrji1RUAUJYW1ohhpvkxOr0XWm6WxKNF/EV+ZGvDno066P?=
 =?us-ascii?Q?SxGb6IsfZ1suZt5UKNbOKRkdNRj8F0bwuOQ1vt9r9WBOOYdIxfXdeNxRT6Fo?=
 =?us-ascii?Q?Hnjq5b+yPh3z6a/vl/6FQJ3pCzfzkQ7p7EjjhyD03GNIiNC06QLP36w1DYnj?=
 =?us-ascii?Q?eY8NVtJOhrCPx4eyWnbnA8lSO2T1BE00Gfn3kzx8s8gKG0FmapvCG0VWYzOZ?=
 =?us-ascii?Q?VSaKvY0827glJ0Cw62RO01ceRlmB+R4u1YzujE51jyiVyMMgywdsTpMJpZdI?=
 =?us-ascii?Q?gvY6jXPUWqIm5fiQswvGcXY1lFav49UyQ/zF/ZY30hus8joC0UWZOn8pH14y?=
 =?us-ascii?Q?BJHyVvNMGOPV8IVyYjT21SG5lgPbkrqoo0TMHFMdOKdhVp719mCMz8yV808A?=
 =?us-ascii?Q?ulSHGb6+jVzdz9DJO1DiIoPQpHpJ/kY6mJwvutSaUHhzJRh+nByUGdkfS77D?=
 =?us-ascii?Q?QW6rtW4DAmM2SUBxSV234vezZSt3ap1oGff0Y4ykUywPUPRQywrSlbRcjdg8?=
 =?us-ascii?Q?LQBHPHuWvn3y8uiinx0CtCvtPA7g+mYlVWIYQoFhCcwqu6xTPvtddKCxU8+1?=
 =?us-ascii?Q?Vbk9Wi+A10vLkGG2jTIHN3JBsoS8hPv6ZN7LrrsNfc0yME+/STstVptFSGax?=
 =?us-ascii?Q?FlOjHkH+EvkzQRjEDV8Kh0ODtGgNiOc5GHVqwrQPKYdmQD+V0hzVFNyyawnj?=
 =?us-ascii?Q?dTSJFVnmQlZ0OC0p1FAKN4wBYDKHGzl3be4sY5trRhMiawArfUo7OIH0Lx4i?=
 =?us-ascii?Q?o7BkM+xO6acvi8GtnvvhWNR3T7ggzIqOeCOn5ufuLr3zj3mAPoh28NxzgHTF?=
 =?us-ascii?Q?Z1zjl2jAu5nKukET4771i++EGMoS6qYchcrECoMztgvVuNwtAdqyfb1q4kH8?=
 =?us-ascii?Q?JDU0EWVnMzp/xLEo8SEK9AxhTj/UPRwT+qimZLFBoQOwZ6uPMkfn0pHgJkA/?=
 =?us-ascii?Q?WRvlSLh6K5FkyEzrGgdY543e6Qoiakdin45w8GADmAxv4VRGSsZrVACosbcU?=
 =?us-ascii?Q?5jODh7ePthfO/2GgDRzjZEsx3zHEKs68P0JvkuTRX0kmaiprdcp6mBW2GZlJ?=
 =?us-ascii?Q?EmmkUAltdi1bgS5iRJYb5I+cVLeyUiiTXxSIuGGmEp9507k8PiMUKrWVsgOT?=
 =?us-ascii?Q?tQPTxdR9FJp3L4yh3YRgj20O/8B1KpOHwRdtlpbhQxTX1aZbG034/3Ru3VuX?=
 =?us-ascii?Q?GkYH4DCY/t5OI1rnuD9mBPPVvxUj4EaDEGsLw2321yq4Pk/Hl3Hhpc9ojnXx?=
 =?us-ascii?Q?8qiu5RGrEIgd/cegJQuOQEXiua2HMiM25g+9gDLtlwlDFOnZu3ZDf7sns9RJ?=
 =?us-ascii?Q?ytjk+liDK/gjzYryksE1PtK7c5wRHYa7aj5kJaqfnPV2NA4Fq26LIXwYJgEI?=
 =?us-ascii?Q?hkFmp+Mczqvz2DegAtFKF3BeOZSWlM431qLyO/75w26YWNxgXcv6Ro8Hzccm?=
 =?us-ascii?Q?+1TTeX0pUxBghDcGzKNekZnNtrhE5wndz6yscufvaIKkrWwB+RBhgzSNCPC3?=
 =?us-ascii?Q?k9JuJuRexqBLYcdA27NF7sXG1xTpqDYIA0gKsKxKCYUiaHS47s8eebdE2V/8?=
 =?us-ascii?Q?Tw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d6e33eb-ae92-4d33-f5d1-08dd8dad0955
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2025 21:20:48.3681 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U6B/gPLU9EUJlsH/4xR5d1uv0pd2o+LuGOr5TvBeV280gn5uvw+WiMUpDjYKUUSDAO0M003UB9mc7rDV2NDbeg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4547
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

On Wed, May 07, 2025 at 04:14:22PM -0500, Lucas De Marchi wrote:
> On Tue, May 06, 2025 at 06:30:42PM -0700, Umesh Nerlige Ramappa wrote:
> > Where available, add support for 64-bit CTX timestamp when calculating
> > job run time.
> > 
> > v2: (Matt)
> > - Use xe->info.has_64bit_timestamp instead of version check
> > - Allow timeout > 100sec on platforms with 64-bit timestampt
> > 
> > Suggested-by: Lucas De Marchi <lucas.demarchi@intel.com>
> > Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
> > ---
> > drivers/gpu/drm/xe/regs/xe_engine_regs.h |  1 +
> > drivers/gpu/drm/xe/regs/xe_lrc_layout.h  |  1 +
> > drivers/gpu/drm/xe/xe_device_types.h     |  2 +
> > drivers/gpu/drm/xe/xe_guc_submit.c       | 18 ++++---
> > drivers/gpu/drm/xe/xe_lrc.c              | 64 +++++++++++++++++++++---
> > drivers/gpu/drm/xe/xe_lrc.h              | 10 ++--
> > drivers/gpu/drm/xe/xe_pci.c              |  2 +
> > drivers/gpu/drm/xe/xe_pci_types.h        |  1 +
> > drivers/gpu/drm/xe/xe_ring_ops.c         |  8 +++
> > 9 files changed, 90 insertions(+), 17 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/regs/xe_engine_regs.h b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> > index da713634d6a0..52f4c96c01dc 100644
> > --- a/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> > +++ b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> > @@ -154,6 +154,7 @@
> > #define   STOP_RING				REG_BIT(8)
> > 
> > #define RING_CTX_TIMESTAMP(base)		XE_REG((base) + 0x3a8)
> > +#define RING_CTX_TIMESTAMP_UDW(base)		XE_REG((base) + 0x3ac)
> > #define CSBE_DEBUG_STATUS(base)			XE_REG((base) + 0x3fc)
> > 
> > #define RING_FORCE_TO_NONPRIV(base, i)		XE_REG(((base) + 0x4d0) + (i) * 4)
> > diff --git a/drivers/gpu/drm/xe/regs/xe_lrc_layout.h b/drivers/gpu/drm/xe/regs/xe_lrc_layout.h
> > index 57944f90bbf6..8619244b7c7b 100644
> > --- a/drivers/gpu/drm/xe/regs/xe_lrc_layout.h
> > +++ b/drivers/gpu/drm/xe/regs/xe_lrc_layout.h
> > @@ -12,6 +12,7 @@
> > #define CTX_RING_START			(0x08 + 1)
> > #define CTX_RING_CTL			(0x0a + 1)
> > #define CTX_TIMESTAMP			(0x22 + 1)
> > +#define CTX_TIMESTAMP_UDW		(0x24 + 1)
> > #define CTX_INDIRECT_RING_STATE		(0x26 + 1)
> > #define CTX_PDP0_UDW			(0x30 + 1)
> > #define CTX_PDP0_LDW			(0x32 + 1)
> > diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> > index 495bc00ebed4..9446a739948c 100644
> > --- a/drivers/gpu/drm/xe/xe_device_types.h
> > +++ b/drivers/gpu/drm/xe/xe_device_types.h
> > @@ -334,6 +334,8 @@ struct xe_device {
> > 		u8 has_sriov:1;
> > 		/** @info.has_usm: Device has unified shared memory support */
> > 		u8 has_usm:1;
> > +		/** @info.has_64bit_timestamp: Device supports 64-bit timestamps */
> > +		u8 has_64bit_timestamp:1;
> > 		/** @info.is_dgfx: is discrete device */
> > 		u8 is_dgfx:1;
> > 		/** @info.needs_scratch: needs scratch page for oob prefetch to work */
> > diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> > index 813c3c0bb250..bef32f2b0081 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> > @@ -936,10 +936,12 @@ static void xe_guc_exec_queue_lr_cleanup(struct work_struct *w)
> > 
> > static bool check_timeout(struct xe_exec_queue *q, struct xe_sched_job *job)
> > {
> > -	struct xe_gt *gt = guc_to_gt(exec_queue_to_guc(q));
> > -	u32 ctx_timestamp, ctx_job_timestamp;
> > -	u32 timeout_ms = q->sched_props.job_timeout_ms;
> > -	u32 diff;
> > +	struct xe_guc *guc = exec_queue_to_guc(q);
> > +	struct xe_device *xe = guc_to_xe(guc);
> > +	struct xe_gt *gt = guc_to_gt(guc);
> > +	u64 ctx_timestamp, ctx_job_timestamp;
> > +	u64 timeout_ms = q->sched_props.job_timeout_ms;
> > +	u64 diff, max = U32_MAX;
> > 	u64 running_time_ms;
> > 
> > 	if (!xe_sched_job_started(job)) {
> > @@ -952,15 +954,17 @@ static bool check_timeout(struct xe_exec_queue *q, struct xe_sched_job *job)
> > 
> > 	ctx_timestamp = xe_lrc_ctx_timestamp(q->lrc[0]);
> > 	ctx_job_timestamp = xe_lrc_ctx_job_timestamp(q->lrc[0]);
> > +	if (xe->info.has_64bit_timestamp)
> > +		max = U64_MAX;
> > 
> > 	/*
> > 	 * Counter wraps at ~223s at the usual 19.2MHz, be paranoid catch
> > 	 * possible overflows with a high timeout.
> 
> this would not be true anymore with a 64b counter. Anyway, why would we
> need to be soooo paranoid to increase this and consider a diff >=
> 223sec? For the timeout check we can leave with the counter wrapping at
> 32b afaics and not change anything here.
> 

Why? If the counter is 64 bits I don't see why you'd wouldn't use all the bits.

> > 	 */
> > -	xe_gt_assert(gt, timeout_ms < 100 * MSEC_PER_SEC);
> > +	xe_gt_assert(gt, xe->info.has_64bit_timestamp || timeout_ms < 100 * MSEC_PER_SEC);
> 
> the assert is on the value of q->sched_props.job_timeout_ms.
> Why are you removing it? Or even why is the assert in this function
> rather than on init?
>

Admittedly a bit of an odd choice to have an assert here rather than on
init. Also in practice the highest value I think timeout can be is 10s
without a special build of the kernel to allow crazy high values.

> 
> > 
> > 	if (ctx_timestamp < ctx_job_timestamp)
> > -		diff = ctx_timestamp + U32_MAX - ctx_job_timestamp;
> > +		diff = ctx_timestamp + max - ctx_job_timestamp;
> > 	else
> > 		diff = ctx_timestamp - ctx_job_timestamp;
> > 
> > @@ -971,7 +975,7 @@ static bool check_timeout(struct xe_exec_queue *q, struct xe_sched_job *job)
> > 		ADJUST_FIVE_PERCENT(xe_gt_clock_interval_to_ms(gt, diff));
> > 
> > 	xe_gt_dbg(gt,
> > -		  "Check job timeout: seqno=%u, lrc_seqno=%u, guc_id=%d, running_time_ms=%llu, timeout_ms=%u, diff=0x%08x",
> > +		  "Check job timeout: seqno=%u, lrc_seqno=%u, guc_id=%d, running_time_ms=%llu, timeout_ms=%llu, diff=0x%llx",
> > 		  xe_sched_job_seqno(job), xe_sched_job_lrc_seqno(job),
> > 		  q->guc->id, running_time_ms, timeout_ms, diff);
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
> > index 9d9be9383207..b5f5547c7c4f 100644
> > --- a/drivers/gpu/drm/xe/xe_lrc.c
> > +++ b/drivers/gpu/drm/xe/xe_lrc.c
> > @@ -653,6 +653,7 @@ u32 xe_lrc_pphwsp_offset(struct xe_lrc *lrc)
> > #define LRC_SEQNO_PPHWSP_OFFSET 512
> > #define LRC_START_SEQNO_PPHWSP_OFFSET (LRC_SEQNO_PPHWSP_OFFSET + 8)
> > #define LRC_CTX_JOB_TIMESTAMP_OFFSET (LRC_START_SEQNO_PPHWSP_OFFSET + 8)
> > +#define LRC_CTX_JOB_TIMESTAMP_UDW_OFFSET (LRC_CTX_JOB_TIMESTAMP_OFFSET + 4)
> > #define LRC_PARALLEL_PPHWSP_OFFSET 2048
> > 
> > u32 xe_lrc_regs_offset(struct xe_lrc *lrc)
> > @@ -691,6 +692,12 @@ static u32 __xe_lrc_ctx_job_timestamp_offset(struct xe_lrc *lrc)
> > 	return xe_lrc_pphwsp_offset(lrc) + LRC_CTX_JOB_TIMESTAMP_OFFSET;
> > }
> > 
> > +static u32 __xe_lrc_ctx_job_timestamp_udw_offset(struct xe_lrc *lrc)
> > +{
> > +	/* This is stored in the driver-defined portion of PPHWSP */
> > +	return xe_lrc_pphwsp_offset(lrc) + LRC_CTX_JOB_TIMESTAMP_UDW_OFFSET;
> > +}
> > +
> > static inline u32 __xe_lrc_parallel_offset(struct xe_lrc *lrc)
> > {
> > 	/* The parallel is stored in the driver-defined portion of PPHWSP */
> > @@ -702,6 +709,11 @@ static u32 __xe_lrc_ctx_timestamp_offset(struct xe_lrc *lrc)
> > 	return __xe_lrc_regs_offset(lrc) + CTX_TIMESTAMP * sizeof(u32);
> > }
> > 
> > +static u32 __xe_lrc_ctx_timestamp_udw_offset(struct xe_lrc *lrc)
> > +{
> > +	return __xe_lrc_regs_offset(lrc) + CTX_TIMESTAMP_UDW * sizeof(u32);
> > +}
> > +
> > static inline u32 __xe_lrc_indirect_ring_offset(struct xe_lrc *lrc)
> > {
> > 	/* Indirect ring state page is at the very end of LRC */
> > @@ -728,7 +740,9 @@ DECL_MAP_ADDR_HELPERS(seqno)
> > DECL_MAP_ADDR_HELPERS(regs)
> > DECL_MAP_ADDR_HELPERS(start_seqno)
> > DECL_MAP_ADDR_HELPERS(ctx_job_timestamp)
> > +DECL_MAP_ADDR_HELPERS(ctx_job_timestamp_udw)
> > DECL_MAP_ADDR_HELPERS(ctx_timestamp)
> > +DECL_MAP_ADDR_HELPERS(ctx_timestamp_udw)
> > DECL_MAP_ADDR_HELPERS(parallel)
> > DECL_MAP_ADDR_HELPERS(indirect_ring)
> > 
> > @@ -745,19 +759,38 @@ u32 xe_lrc_ctx_timestamp_ggtt_addr(struct xe_lrc *lrc)
> > 	return __xe_lrc_ctx_timestamp_ggtt_addr(lrc);
> > }
> > 
> > +/**
> > + * xe_lrc_ctx_timestamp_udw_ggtt_addr() - Get ctx timestamp udw GGTT address
> > + * @lrc: Pointer to the lrc.
> > + *
> > + * Returns: ctx timestamp udw GGTT address
> > + */
> > +u32 xe_lrc_ctx_timestamp_udw_ggtt_addr(struct xe_lrc *lrc)
> > +{
> > +	return __xe_lrc_ctx_timestamp_udw_ggtt_addr(lrc);
> > +}
> > +
> > /**
> >  * xe_lrc_ctx_timestamp() - Read ctx timestamp value
> >  * @lrc: Pointer to the lrc.
> >  *
> >  * Returns: ctx timestamp value
> >  */
> > -u32 xe_lrc_ctx_timestamp(struct xe_lrc *lrc)
> > +u64 xe_lrc_ctx_timestamp(struct xe_lrc *lrc)
> > {
> > 	struct xe_device *xe = lrc_to_xe(lrc);
> > 	struct iosys_map map;
> > +	u32 ldw, udw = 0;
> > 
> > 	map = __xe_lrc_ctx_timestamp_map(lrc);
> > -	return xe_map_read32(xe, &map);
> > +	ldw = xe_map_read32(xe, &map);
> > +
> > +	if (xe->info.has_64bit_timestamp) {
> > +		map = __xe_lrc_ctx_timestamp_udw_map(lrc);
> > +		udw = xe_map_read32(xe, &map);
> > +	}
> > +
> > +	return (u64)udw << 32 | ldw;
> 
> I understand doing this for the next patch, but for this timeout I think
> we could just discard the upper part and let the 32b wrap.
> 

Again why? Seems odd to not use all 64 bits if available.

Matt

> Lucas De Marchi
