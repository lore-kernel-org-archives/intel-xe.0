Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A606CEFC26
	for <intel-xe@archiver.kernel.org>; Tue,  8 Oct 2024 15:42:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E759310E581;
	Tue,  8 Oct 2024 15:42:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G8LtqWJ4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AE3E10E581
 for <intel-xe@lists.freedesktop.org>; Tue,  8 Oct 2024 15:42:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728402147; x=1759938147;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=oMNS3NzI+X4uMOcrcC3hNsaSSAeCDQLJh1r166i5g/o=;
 b=G8LtqWJ42+ZzLY0PJd9HVq6VTCnM4TJk5nDjXIXMbH61rSzhgf00PNVp
 aNhAsIURc5LPuT/YMBHOF1iz1caZJqcxi0KA9THbEirbTZEOUMkbmDjPL
 axKBsQKHvCJ0ghLbSs+7iO20oi7a8yxV10KFT081qfUPkeqvOelFEAENl
 Ii1WK4ibrZhKoUuMcAuSyVXYfMt50Nao4n4xQ5oSSirmoHbTvJCccxT0r
 BfdvXD/BRav9+zhjRwxafAUpS+glwsDg/xUQWg5Ww/2cyaxS86TKjC32a
 0DdnWpmy4ZTNv+N4mg4BRUjPHFCt+aaYuk9B+1E2mc/JbYl0QStp9R+wT Q==;
X-CSE-ConnectionGUID: H1kyLafOTpCFivkZbUS2RQ==
X-CSE-MsgGUID: PS6lSIltREeG+xq0Z6/dtg==
X-IronPort-AV: E=McAfee;i="6700,10204,11219"; a="27496458"
X-IronPort-AV: E=Sophos;i="6.11,187,1725346800"; d="scan'208";a="27496458"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2024 08:42:25 -0700
X-CSE-ConnectionGUID: TqCIilrIRSGzZAOTgbChcQ==
X-CSE-MsgGUID: MjFzP+R4SvmqBEVeNt1vxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,187,1725346800"; d="scan'208";a="75560242"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Oct 2024 08:42:23 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 8 Oct 2024 08:42:22 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 8 Oct 2024 08:42:21 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 8 Oct 2024 08:42:21 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.177)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 8 Oct 2024 08:42:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BnyQ/zzfJKr2MLk64XFf4i+pPwiavXp+sP7LBljJGz54E9/cQTgHFQ8tS9PfFwUoBruXNA1U+71OB2nHr6qHYiAsE08r2hKQdJl4Nwn9kDotMHCYK/cM+4VVmcf2WfICauYyPbmTRAz2lEKHNVcNb0TMFDVpXkkp2CeajHAXyimuqSLO9OR+Zhz+syMjWcQI2oytCkCxtQjYAEqRp/Gk5Pmt6elc6HG3LanG62MH6ER+OLV9mhRg7EFapXZNIEyXlW86V+0xYGoYPtLAfwky6UmraTuPMnyF4HA6ogcz/741fvhi05H3SWEK9fetLP28MFLYYMusQwV9T8vU3w2gAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=caHi6k7sacEMYB0Bs3OlhXBG+Uev4L+PQ903Xc/JtI8=;
 b=d1rUG/9IkeTbCRo1y8xs0pDkcMRsh++gPQirZuCZ6rJZBOP7wBPXe0Ed78aOz/Hvtj11baYHyFFtYsqwNllQ+Qt97zyWNkHQ0ARBnLmhkgwOCRSo65KbGZ5DrRktnlfoREXd4FHHrWZaxx4ploqVZQcg8uTGzIAqDqz8rKZ1cZ7AHQPZeZewT3t+7xXBRF1mVtzeELLCYOsWoRyMEVFVYiVHTbTVTTEY/9GI6CBD4PLadrin78f0quXZuk/tLQP2GD3fbqhN2lLDwGdKG7tNfoNfTQHP3QpwjGvWFsyxdjTk8qrx4Siqrld5CCqzWkzZheTIu+Z4oqwlY6wnkxhQlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CY5PR11MB6487.namprd11.prod.outlook.com (2603:10b6:930:31::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.23; Tue, 8 Oct
 2024 15:42:19 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.8005.024; Tue, 8 Oct 2024
 15:42:19 +0000
Date: Tue, 8 Oct 2024 15:42:09 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>,
 <intel-xe@lists.freedesktop.org>, Niranjana Vishwanathapura
 <niranjana.vishwanathapura@intel.com>, Tejas Upadhyay
 <tejas.upadhyay@intel.com>
Subject: Re: [PATCH v2 2/2] drm/xe: Use the filelist from drm for ccs_mode
 change
Message-ID: <ZwVS0eVGUaa8Z3v3@DUT025-TGLU.fm.intel.com>
References: <20241008073628.377433-1-balasubramani.vivekanandan@intel.com>
 <20241008073628.377433-3-balasubramani.vivekanandan@intel.com>
 <ZwVHmw8KPluuPgvC@DUT025-TGLU.fm.intel.com>
 <bl3ildwwdjswvvfpim4fgqdmlqvonccfbavdxymyxr4bdp53bn@xwd5njyqad4d>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <bl3ildwwdjswvvfpim4fgqdmlqvonccfbavdxymyxr4bdp53bn@xwd5njyqad4d>
X-ClientProxiedBy: SJ0PR03CA0162.namprd03.prod.outlook.com
 (2603:10b6:a03:338::17) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CY5PR11MB6487:EE_
X-MS-Office365-Filtering-Correlation-Id: bc468a78-fdb5-43af-30cf-08dce7afcb3e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?uoWmOfDml1FpY+7pkrxIEfKZ8z72CiV8XYRSaFC9ECsSAPYhmr39HW2JjgEU?=
 =?us-ascii?Q?mdAValOGuYUFAkShF5++MX5xwcqNsqiOk915lgt38V45Z2WkZJDySR23PuvP?=
 =?us-ascii?Q?LtM7ngJTHn10tq8Eyj7FUw1k+s7NrSjSDqWLva3inJxit9gYf/FY9AvjsdCZ?=
 =?us-ascii?Q?GygzlnmNX26Wls8gKocKvDoahEOnQV37tAmyyx8B19zVtht2eN4TjCISX4xQ?=
 =?us-ascii?Q?/Rg1NdMyyg+bIlNGshc6R7a4oJwUe9kTkYBxs6xplYPsyrtEwVkXp7G9aVGr?=
 =?us-ascii?Q?pQ3e+HkMksqABN2EeQ1RVEAHx5Fx3UlyAYqQtUGIYhBXmD7e1xI6TC6dg7vz?=
 =?us-ascii?Q?cZKkt/tV3ZOiiv3sWeOTL3FKWA8nQf1VxrrVb4qIag6mmFhNOUUK9r4TseV/?=
 =?us-ascii?Q?mEf+7+EUnEzikM21iJn3I2YnYYyFs6fo5QbvwgOyJko2m9Bq96rgEwejSGB8?=
 =?us-ascii?Q?6+crs6KD/3twpBxfXYnSXK7c+EuAQwbYs/Td1J2RblQ7GiVYfBjcONLXSt6R?=
 =?us-ascii?Q?8AeTa22nFcfucAHxegRRVvyHYLhvfog9A7rBtRTIY4r6bAn7TOMrKWf+Lb7I?=
 =?us-ascii?Q?f3O9LXU70HqNbzmfDD4tOILvcYFWpubXoPlzMRiQDAGNzf51gD2utvbJxx+j?=
 =?us-ascii?Q?uwIIwZogQrldh044ZJUTGnvtLuvyMe4z+q3Ov9uynlqd4Bah7kWmSBZBAwCk?=
 =?us-ascii?Q?dLQoLTUCVKlQ6UsPp6IEX9OqWA2l0cc6nkjbPh6ucGcxhIHYzMdkm88GjSeW?=
 =?us-ascii?Q?D9e2BZEHqElSQlUd/MtKtx9/AdHf1pz0j4ZJ8Uy4b85rOnh3MBkj3MvSAFG0?=
 =?us-ascii?Q?5Yk96UAh5RMngRhYAgJgKgou6HmUEiY7rw7xIY0/yCSPswjjY/4tWigy4VOo?=
 =?us-ascii?Q?OG5iImoHSWzmt18jS6Ib8RzlQcRaufZBsesDvtIbzTE76ZM+KeQTDlytjQaQ?=
 =?us-ascii?Q?Vo2GN+cplCTeOxgnJjjdeyTs5MfCE0u916sMJMeL7Y3U0EnnWqcW/4kwn3Ac?=
 =?us-ascii?Q?W6ALJsQdbIjg+UPhWOwLJWtBUEd93fC7WBQ6obNgmH/CAbB8wsXz9N0kN0ps?=
 =?us-ascii?Q?iRPgri4F29EcwmoRgW8ko8iwYzf67ZYl0UTc1HxHdHsY7SWEDpJouK6aOCcT?=
 =?us-ascii?Q?0cisX5qOjM0aoT1R0+hUQw8jATU6ardp4rWHkcT+U3zKOYRfoiV/9NA6MrcN?=
 =?us-ascii?Q?uud7KZFIb6arqdSO134ejpU2pTIV9T7k5/qGCygIFvDfsLIZwjui9bZ3oGoy?=
 =?us-ascii?Q?EY7FsGiiI2WHmV9oaCp+GZV4Ng7yLNUyvpIqOBf37A=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?D5rGdXn/aHHrI+fYb8oxbUhee38Sx6zsY+M8RqhRh6+mMTqyaC7svfatc3lR?=
 =?us-ascii?Q?BhrkebyK9s2qd/kapd2h7f6kZ/vzzobGiB9BfG1bnzwzVzm3NI9VnBMAbUe7?=
 =?us-ascii?Q?pZdcJJ0otCQnjSzoyFrvA/jAVxA2SwudvKxhjnoyK/OW/LJApnAD+Gt4n9em?=
 =?us-ascii?Q?yAHH4mcoi5fXPpjybyaj91siGG6dadVixql0qCC7c/Hj10MLX/r62CZPSqoM?=
 =?us-ascii?Q?nQlyhN/zjLJSBdb3NMdRT/25UHCdM1d9rnjYTLJ9gu3PYxrUva8ZrbPEIobS?=
 =?us-ascii?Q?LAdCGX2T+zuJ6HovfpPrNb/nkijb2iRZOSiND6FOHn77Lm+HJGYa4MlS+2s2?=
 =?us-ascii?Q?GkLUf3UdKSEng8hVuJVcuq78NCgbGtLOsSB9/vFdoDKXL/cTumwskK1dZ8Cv?=
 =?us-ascii?Q?sK0xaJKRwP/sHRIifRK2CGnmcAX90qrlLXax/Hc3pVS/cHf2gujOLv2QIRnS?=
 =?us-ascii?Q?FXSQSGiDHkonoOECG2aAYM3Gyz5RPRPPXyw0BlFKJpr5jVUhgi6y+D4UzbHM?=
 =?us-ascii?Q?KBYX+LamgHq4QQslqpQWhrIKG6pxcg5/4ZOo1VkgD3JyIb0jlAPJeiBFN1SL?=
 =?us-ascii?Q?WEqGWQde+0rGoV/0UQi2QTqoB5cC1hkMLpf2uBHBQAd/2mtq4gOGgaMfkxuB?=
 =?us-ascii?Q?EAwX6z/p2e+X0VAejDQm2Fl5hELWp7aYAiV3jNY8Q6tWgvkyBcM6xhcII5Hl?=
 =?us-ascii?Q?ROB2+vxbrPZq8tciN6zdZgFkdTdlOD0hxsOtm41OCV6LKq/gwJsio8/HvvH7?=
 =?us-ascii?Q?v+3QfIOxiUJppdWNMmRTtm+IdqBcx1cr7PbxYPb0TNBnFpfoGq2aHmJCpFks?=
 =?us-ascii?Q?GYmbqML5A1Gx+ytuTZdyfXnydc/Hx56y2J9yBR5lmozHOHXc+PP0Ops3Gqt4?=
 =?us-ascii?Q?GKmem1j8kMzOAt16K8Kan1z5X9sbSmgv3wqsHdvzulhxIlLk+dKIt6iATBl9?=
 =?us-ascii?Q?nKIQuTuBHZ/b5jqu0WArAbnFJL0mRoKAA7NBizhORgESWHFGthBWcrPVLhm8?=
 =?us-ascii?Q?mLA1ktzi7mWgjgAW5GX2r37cXQYe3Ijx9ZBWVmKoLXXcBy/hCoiKkpP4BJ26?=
 =?us-ascii?Q?ueuaqMRppg7fST1s8UXw/5Bjo1Ko+Y0QGtxqX0nNIH7g1KAYxo0FPaRz4fk1?=
 =?us-ascii?Q?5DYYMGuT9zYV+0PBk+zf6YLqZ78zGlPif8xxr6Cmc/3l79s+zLvoBZza8dA+?=
 =?us-ascii?Q?P79t+5HTVah2FKtVMysO6z42V9VNr4AR3Vj5pEO23PzxE0JTpIidXDOTcYTV?=
 =?us-ascii?Q?mgCGik7V66wiPHGb5IE3JS2Qk00JbJo16Q89RxNJzlADZFJQGSw7gWdewN/E?=
 =?us-ascii?Q?5u9ZsXuPalDfOAcC1b5tPPLJvj3FGqIHspNWdOq6oW3GO8gtnWADV4PTyhpn?=
 =?us-ascii?Q?q732ZVkkPKMgKZgKerE8tLnv3YcRtGwFrJ8IyVJ7v60RJ8ySDhR6oTF/oK8q?=
 =?us-ascii?Q?2GbviK6lYMRD75ATJrEvyzemOmtn7uADAdDi9xeSvnK0kUQ8CUE+4kkIpKSN?=
 =?us-ascii?Q?+IwXqdpt71OaXAqq5fSp9HmoHCeDi0ddmM2HCqBqRWn+68ClFeocKR8KWY0U?=
 =?us-ascii?Q?5oP3Wk7kYXmT053wnVDGfAqGVmLsqV7NY41MwmUbmJuWvyDqX/hgUljy6Glf?=
 =?us-ascii?Q?Fw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bc468a78-fdb5-43af-30cf-08dce7afcb3e
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2024 15:42:19.6292 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ry3kXhV+QOjCsSImrb22Duru6JfkbnJHYXCwkozMaI0t3LHZ6f9h+eCEYkVc5aym9IiWRuhDOELcHdOf4L+OJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6487
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

On Tue, Oct 08, 2024 at 10:20:15AM -0500, Lucas De Marchi wrote:
> On Tue, Oct 08, 2024 at 02:54:19PM +0000, Matthew Brost wrote:
> > On Tue, Oct 08, 2024 at 01:06:28PM +0530, Balasubramani Vivekanandan wrote:
> > > Drop the exclusive client count tracking and use the filelist from the
> > > drm to track the active clients. This also ensures the clients created
> > > internally by the driver won't block changing the ccs mode.
> > > 
> > > Fixes: ce8c161cbad4 ("drm/xe: Add ref counting for xe_file")
> > 
> > Is this really fixing anything. As far as I can tell nothing upstream
> > opens a file internally (i.e. xe_file_open) is never called directly.
> 
> should fix this case:
> 
> 	open()
> 	close()
> 			<---- race here
> 	change_ccs_mode()
> 
> because the close is not completely sync - the cleanup where the
> previous number of clients is decremented is executed too late and
> subject to a race fixed here.
> 

Ah, ok. But then IMO just move the clients.count decrement to
xe_file_close. I try to preach solid locking / layering and this seems
to go against this idea.

Matt

> I think the commit message needs to be improved to detail this fix.
> The fact that internal clients don't end up changing the drm.filelist
> is just a justification for why this should be ok wrt internal clients.
> 
> Lucas De Marchi
