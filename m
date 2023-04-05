Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51AE7C76188
	for <intel-xe@archiver.kernel.org>; Wed,  5 Apr 2023 18:21:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26AFC10E334;
	Wed,  5 Apr 2023 18:21:36 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70F8810E334
 for <intel-xe@lists.freedesktop.org>; Wed,  5 Apr 2023 18:21:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680718893; x=1712254893;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=r1LVggC916jebCbx4VB6wUYW4ACDrPQaa5HiesXzy1U=;
 b=Diu9MMVwMU+oSj3d6KJYvMs474ZFOwE8fvopE243e0VEANGseiSEuu7u
 HHqjxY6eCeFmMBzLVozHh91D8aw/kwQmY6enqAU//8dblSgyjb9sa9x5t
 G3FzgMxrmqZlvGmvNYkjYNesWF/BhXmpf4hviUnrcKn+8hFjiQgEMBuns
 /5cq6B2AaiEsd7L9F5qQDoRkhvnwrizT4WtiqNDn4v/L+61+9gAqGXMIX
 WuQ0fx1kfVKsVShQoIcrGbZUiylG2JCHEqdQak87GQ4DZvRSUiXbLQH2F
 hUz2CMMYakwJEfyPvgMoudLfOfZQqRHQqyBwzSGcfsJfDdMDxOGMg+jUm A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10671"; a="322184244"
X-IronPort-AV: E=Sophos;i="5.98,321,1673942400"; d="scan'208";a="322184244"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2023 11:21:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10671"; a="751356179"
X-IronPort-AV: E=Sophos;i="5.98,321,1673942400"; d="scan'208";a="751356179"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga008.fm.intel.com with ESMTP; 05 Apr 2023 11:21:30 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 5 Apr 2023 11:21:30 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Wed, 5 Apr 2023 11:21:30 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.48) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Wed, 5 Apr 2023 11:21:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l4LxCEjdsuCVp7e869yDd7sTkywd/3lk0kZMGKIz1Ka9KOjov2TbqRsSkZx58ZouqwEgWXKb29FP6Atlu95bA4W+tSh9y+MdoUbDU8fOoxU8R2cB/tal6LwjdciN3PlOcUB04y7tsE4ieQpH+NYqCKrSTJhJuBjXpSmNq9fbAMRmrh8NA1kCHfKYxeiDIYe3p2PFEtlF5uTBKzUqurrC6Kl6HE91t5Isjtl6LvtyNIi/J5vEvEm0VIuUAHVoyMafCqAKTFuv5IXl9ba+tNk5qTdiWNWOcfnYRroH+GzS5JRxFdc8yf/aBto3/RZlLR/n47+DmyBcCRTAzQVrG4bXBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JDHSMpoSFYfU69sBuq1BveV2/f3lYSuX/S2DRZ7pmWU=;
 b=hhLZHEMm2/p+RwP5MUoKseN7MlWJ95S32lYk6mbEsg4xViuOGGa2cijn4sKB/JadOKCihHAzVYkbce2K4zyxrPLbR66NrCtcQaa/HSoKRuEOGM5fdMNMhINI8HS0WOMcWnsoW3BhDjgMtDa+y+194J4ld1H5zhW/G5A7eRulN40Ia0Pro1muBB0nwOXqXOLrCk8NOWBw55mYcH+6Ay6SiB1TqfzWsPGOAxT850kyAsSKxNZBZtK2HUs2VC/E0MsaXIrIhZQ5IetIK5AcVk6WS/vrusOLZCOHOf6Jdq8vbs89aUl5RLQ0boQSaC+9WF1NrEjrQXUG7OM9c4Poeekbhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CO1PR11MB4930.namprd11.prod.outlook.com (2603:10b6:303:9b::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.35; Wed, 5 Apr
 2023 18:21:25 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::2629:fb12:6221:3745]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::2629:fb12:6221:3745%6]) with mapi id 15.20.6277.030; Wed, 5 Apr 2023
 18:21:25 +0000
Date: Wed, 5 Apr 2023 11:21:22 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Message-ID: <20230405182122.vzr3zgi3zqenocfp@ldmartin-desk2.lan>
X-Patchwork-Hint: comment
References: <20230405025919.3975162-1-matthew.brost@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230405025919.3975162-1-matthew.brost@intel.com>
X-ClientProxiedBy: BYAPR02CA0016.namprd02.prod.outlook.com
 (2603:10b6:a02:ee::29) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CO1PR11MB4930:EE_
X-MS-Office365-Filtering-Correlation-Id: 23c849bd-9c1c-4b8c-0051-08db360290aa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RX1qovG6KMfeL16KPsrMWbodCBdoaBLsyOuKsHGcUtPd54LvHVPNLu4D9YFmlodOR3rFYxbwshPCWbKp7v5c9Ph78Fr+E3XwI5Na7xVjBEa2Gmy11DXsKx9wrCR7z8ey/95gm8NNRJXSZz0W7uVk+++lwzKnlB3qh3PMIlCy3y994V4gqH2C0Qe812Kq7nj7NNp3xXV433fC65BPLbSB2NMebdGfoTOzQvSbD3vnkqIhoS9QTXzKf1UxyF9O7CpmxI26z7VSJ/jsDfZw9RQjGiJUe3+r8ARBb4Q1RuY538qATqdnQk23AKFhX0o9bRxqNFm77IKwntKgbhbQ6mlg3AnKxgZwAMhZuU2CCVI9ge45danYEDOm1REhcWpBflTtfWo7NtRpvMFi/OUIRAoDQCqRTMW34QWSZ3w1ocSNo5s/KdsvR2P04tAa27ouGXoX37RSKIoG9ryg4ga5a39x+dYbTsm2XwICu94U1dlJQ+sxVmZqWFLowmKiw0V1G82DlCVZcMoDwGkoUJRUGI41kVrla4uy6+f6PPSoH/9j6xU2iLeRhjxo3EprTKwosYsv
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(346002)(376002)(366004)(136003)(396003)(451199021)(86362001)(2906002)(36756003)(6486002)(6506007)(6666004)(1076003)(26005)(6512007)(9686003)(186003)(66946007)(66476007)(66556008)(8676002)(4326008)(478600001)(6636002)(82960400001)(38100700002)(41300700001)(6862004)(316002)(5660300002)(8936002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?VOF0e3ioqU7/zs14rG6omwCROjg0z8n38enI6SrR2gFMWiC6SKZlJ/sBhD7z?=
 =?us-ascii?Q?QLD06HNiby4bBHNGDMNUYNVmlSyO39v+IlrvGcqRk6/qmnXdBoqk08ejgcGy?=
 =?us-ascii?Q?kd8JfS8Ors4wmczWzlkr8HGgjyxAz1LE3bVQggx1pnSUk19fk5V5Kh3PBL1W?=
 =?us-ascii?Q?jhRsnuV2mLgurm1DnO8jrzRMF4yCIdwoHqgPEkzmapkddezM2AtfPrtO6Rcj?=
 =?us-ascii?Q?xI+y8IUNCki+VStMLBdzZTVm4Ut6bGStX/NJZ3G3XOAbb+8cgbik6q5fg8Ij?=
 =?us-ascii?Q?BSkJLmCyCDZwhQv2oD3rGxBHf7VwULrL6aHJjvL4h4xoFmQQEWhnF+dNtRUY?=
 =?us-ascii?Q?NP/KzlUzsEtmr11mc06BEakxpQp1TMDH23lihthKk5foGjdI7pJ1/XNfqAAa?=
 =?us-ascii?Q?UTY70jqkzW0JootOueJHF2nsuRjTjV5sl+jtS2pUmGg64uPko+20E8XwdBfM?=
 =?us-ascii?Q?VczKRYN4cDHJhCf9I7LPpS9B5VuKXem9q7vKFM5EchXUWpzjFHN+EdeRoIWl?=
 =?us-ascii?Q?aIuYHQGr2g6eo3BJ/CMdn9Jt3eu69hjWqXWfWc7+KrqdcxtJleuimc1vQN1A?=
 =?us-ascii?Q?gUGJ6I/wtkxeuJEZiqstJot7QJCusg5iU6Ph3T4gcWPUBFq1nO12rH2XPkIK?=
 =?us-ascii?Q?yeggmQ1vsZo0jD+vxqy//qkbyXShMnUz8hEzIhmBdd46dWrj+k6ZuGL/DmKD?=
 =?us-ascii?Q?421q1Te/mrW1EOMzckHChxP0V4cTsfzjjPTAgMvWPyBGAl/Rlgwn/cwuMnAR?=
 =?us-ascii?Q?q2cVYVQF35pd+zx8FZEaoVv/U4Li7yRbZGrOKHaUgHKbhHXPLCVW8lAJmUMF?=
 =?us-ascii?Q?bjyC2dJDswxHIAZopHoFpV6Icu9cxwQDAhqxT0nraVH8NelniDmpbC5K3bLy?=
 =?us-ascii?Q?kWaYEQFSc+CxIYwv4x2yRCYapGNc7BkXdsH7WCYiJLH7Ysfe+I86Per9CXwA?=
 =?us-ascii?Q?eCPf8xH7SHSDX2yt5znb/tvKc/GzkRLAE71ucpRdaNsJPfIAD2Ih3wTcDBW4?=
 =?us-ascii?Q?2g0hL/OBGotOpVHQOlxNLQ7qUZbLs6kxGU899p7/PmEnZXvVvnCzbLT6370D?=
 =?us-ascii?Q?feLcZMp+foRo4G5SaX9I0pTPeF4aL1Q+aAkFwbU10P0CYwb0Xb670JK/NmW3?=
 =?us-ascii?Q?Qnvy61Y+hMrCdyytXo0iJMypvjlRdVRpnAB/vxpYg5GIW4j6yRTrIaMWkGDi?=
 =?us-ascii?Q?7XeDjwDjYRYBtZWAr7fZjsKll8JDTOHYo6TG7f24wgeWjNsysC1QbVXX3exf?=
 =?us-ascii?Q?dDb/FpmQ6yOc6acqcNkOP5ecoLtH/AyHJt4/G1JXRGJe8/Ear47XDPSi+1aq?=
 =?us-ascii?Q?lSJN8cRPMj0mZZCtU2jJM84LesnkvImXN15bAhMB6hLH0R0tHZ0U4UWdvrjJ?=
 =?us-ascii?Q?oW9vA9koD3r9ISWYS19EOExN0lO/g9qfdOc+fhAW1nipmc8U/oPCL/LcCgJ5?=
 =?us-ascii?Q?QEnbeWr3U05Wknetu8LOl4mKNpyza0CqtorppwURRUsHURdBFJuMcbVcpQxH?=
 =?us-ascii?Q?PRvPbMaMHDSBRyV6/Du4oR7E/G7h/jC80aeSe8c/pNqGQoXoeuxDtIOspd1b?=
 =?us-ascii?Q?ofeUNI2ZgoDWCvaG7kH4InIGkm0WuY4R1Nk1xDHmAQac2vP7OP3vJQ+4CXm5?=
 =?us-ascii?Q?Sw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 23c849bd-9c1c-4b8c-0051-08db360290aa
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Apr 2023 18:21:25.1341 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YbxCbU0jdNRk+LOp5GGuoav6O96uO9zcLCIq4LrHeNueuNAISmC2LjhOhZE+aQFq7WWYqy32knMfwLdMPpftHLq0GakxX8AWcO5uvxqRel0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4930
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: Fix error handling in
 xe_gt_record_default_lrcs
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

On Tue, Apr 04, 2023 at 07:59:19PM -0700, Matthew Brost wrote:
>Kill engines if an error is encountered in xe_gt_record_default_lrcs so
>the driver can free these resources on driver teardown.
>
>Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>---
> drivers/gpu/drm/xe/xe_gt.c | 8 ++++++++
> 1 file changed, 8 insertions(+)
>
>diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
>index bc821f431c45..3adde2205b39 100644
>--- a/drivers/gpu/drm/xe/xe_gt.c
>+++ b/drivers/gpu/drm/xe/xe_gt.c
>@@ -301,8 +301,12 @@ int xe_gt_record_default_lrcs(struct xe_gt *gt)
>
> 		gt->default_lrc[hwe->class] = default_lrc;
> put_nop_e:
>+		if (err)
>+			xe_engine_kill(nop_e);
> 		xe_engine_put(nop_e);
> put_engine:
>+		if (err)
>+			xe_engine_kill(e);
> 		xe_engine_put(e);

these error handling here mixed with normal flow seem a little bit hard
to follow. I propose we change them as:

{
	struct xe_engine *e, *nop_e;
	struct xe_vm *vm;

	for_each_hw_engine(hwe, gt, id) {
		void *default_lrc;
		
		e = nop_e = NULL;

		vm = ...
		e = ...
		if (IS_ERR(e)) {
			...
			goto fail;
		}

		...

		xe_engine_put(nop_e);
                 xe_engine_put(e);
                 xe_vm_put(vm);
	}

	return 0;

fail:
	if (nop_e) {
		xe_engine_kill(nop_e);
		xe_engine_put(nop_e);
	}

	if (e) {
		xe_engine_kill(nop_e);
		xe_engine_put(nop_e);
	}
	
	xe_vm_put(vm);

	/* Wait for engine kill */
	msleep(50);

	return err;	
}

Although that msleep() seems arbitrary. Any alternative so we don't need
to keep tweaking the value for slower platforms? What exactly are we
waiting on?

Lucas De Marchi

> put_vm:
> 		xe_vm_put(vm);
>@@ -310,6 +314,10 @@ int xe_gt_record_default_lrcs(struct xe_gt *gt)
> 			break;
> 	}
>
>+	/* Wait for engine kill */
>+	if (err)
>+		msleep(50);
>+
> 	return err;
> }
>
>-- 
>2.34.1
>
