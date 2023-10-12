Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCF32CDB465
	for <intel-xe@archiver.kernel.org>; Thu, 12 Oct 2023 01:51:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94D0810E0C2;
	Thu, 12 Oct 2023 01:51:50 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 783B010E0C2
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Oct 2023 01:51:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697075508; x=1728611508;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=5M0wjTkxEpQbI5mVpyO4Tbb5QDG0NgfUiqKHE5z+Lbk=;
 b=PfBb8WlWPOylyJyN/KwUP625hJCsZsIH1LCihz1cVkt0cEcwTv5msrfr
 EqbQFqDZP92CaPhZgEuVN/JpuIZODe4ebHxi+MwyTNTs+3+xQdYYyDrfD
 QZ5+a5Eq3wIGMzF48+qnFPd9Xu35ZFOFifhDhd00j/KfiCKZeJbWdzTOO
 kgA4lqqLSf5mIKIe/yW1cOqkv76FgyPKfzDEuwLISWQC7d9/FPB4ffRkQ
 OPzH1w+j0U1M6yPeS9KaEFzTShiyOS7FFohQNZwKHwoo3+ruZ4Esm/aCf
 yTlwoP3E5xdv/60ez7Ci8gpIysjq+57UAEgevXw7q2DXaxQk2hTCLu1L2 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="383678748"
X-IronPort-AV: E=Sophos;i="6.03,217,1694761200"; d="scan'208";a="383678748"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2023 18:51:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="824398693"
X-IronPort-AV: E=Sophos;i="6.03,217,1694761200"; d="scan'208";a="824398693"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Oct 2023 18:51:47 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 11 Oct 2023 18:51:47 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 11 Oct 2023 18:51:46 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Wed, 11 Oct 2023 18:51:46 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Wed, 11 Oct 2023 18:51:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jMsvMzBanT5I5Vj+20jDrhaxUdN3qTcUcr43jem4O5OHJZSJuDgr0xCXqxAs/Af/4oQd8cPFUIM+2TrcBavQpu7ju2nu5y/hqmJ/ifDmlawo8887Bost3sjsDSucWILJ/2ir6fUnYxaSGC/LcDcObmWkmcjXloYzxvmVSZmh/3FlY66o9TGOUj4A6d1DIchTlSElF4XLG7o6PY+vRSeJcjtiOjNe4Ys91woxx5JKnKNCEEV9h9kVEaD1QLJwXQYlOouwKJ99mWLhkZyf9GySrqSE/UQxowIZd/zyIBULlro8IUp6EcThgin3wl3PoAwdFz//q+Or3f48Ik8JwuKb6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=brQa1q/fsRHks0QupULSDsH1qq/RT3XDkUHkhv2SJ7c=;
 b=i2dNPP84i0EbrCy7YdpgzwTjidTMNpjxRZ57ZiTHqzH1SA/HtfTfoAGtJQ6ax3s8ctdaCxvRXTfiFXmKysWNkZ0NGgEEFWAmh73VZehY6Y5LeECs0nic2utymLueQIaIEn/S6SmFp6Y7dL7jeut/p3wp4uPV4W+hiUWbwPH5FLa37AIbMeKo1Ypi9noGTH8BBvhwKp2AkIwUKTxLCM5ghniVYB4Wu7cFb4mI65mZ/Lph49WN2BF3REKvndxWX2/sonN8GkBMuLhZyNe9Y0802Q6w/U4A9vQPGmTKEWkizLIAvEtmJG63N/euSvIgn9CGF2H7b3UQCcIn+2kXJWtPEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 PH8PR11MB6926.namprd11.prod.outlook.com (2603:10b6:510:226::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.44; Thu, 12 Oct
 2023 01:51:44 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::f957:c15a:9c34:71db]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::f957:c15a:9c34:71db%3]) with mapi id 15.20.6863.032; Thu, 12 Oct 2023
 01:51:44 +0000
Date: Wed, 11 Oct 2023 18:51:40 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Shekhar Chauhan <shekhar.chauhan@intel.com>
Message-ID: <20231012015140.GG21382@mdroper-desk1.amr.corp.intel.com>
References: <20231011154526.2819754-1-shekhar.chauhan@intel.com>
 <20231011175832.GL5757@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20231011175832.GL5757@mdroper-desk1.amr.corp.intel.com>
X-ClientProxiedBy: SJ0PR13CA0217.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::12) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|PH8PR11MB6926:EE_
X-MS-Office365-Filtering-Correlation-Id: 45d56703-26b6-4982-380e-08dbcac5c8e8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KQhwOnWVg9TlIPcNyLJ9BL23LpiyBUeUjz/XfdJOttLvxlKqSls789iGRW+vjoXxV4kFzGQ7q7Onajc0zTVTLRYYN3s7OkyEqTyYGadfBCr2SgZn8+heJfIhPe0uKhGzB9Aae/4PXSQzdOZr86EIYGrmX21fMxA4AoHaIwv9gqnylg4ZIDcSveHYuZEV3kz4bk+Bymb5zIs5hxQT64Vr8eY7c32Y16Vk6PNqnzcZ3vTZFXe0jq+ORrwvRfOS+eZWz63+NEPLRfK6rViwNOhZDWV4yQO5psMt+OE+3xBIuDyaeERPAoTWPyWCzdyQ/7HQhchMyWl/ceB0rqVTvfGvyGVlbKlvqrx5XGGiIEdr1cq5/BM2LPp9Ly0kVLthw5dnlIi2AxHpqNha/uRMRCZSHEZNAIOvGAeCoSSNYDuF8ejXY5U8UkpDIF1tjZB1pn763g0lTYoqzS4S6ir5UIofeynKFgspU2PR+9rK2GI4x+0zU0ajaVdMblgcTSt/f57V1TvMyD7UR361c00EcOs6Qetup6bxgTzFcrYRbnts787+/U1elD44nnUhhUliYamI
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(376002)(39860400002)(396003)(366004)(346002)(230922051799003)(1800799009)(186009)(64100799003)(451199024)(1076003)(83380400001)(26005)(6512007)(82960400001)(5660300002)(66556008)(66476007)(6636002)(316002)(8676002)(6666004)(4326008)(6862004)(8936002)(38100700002)(2906002)(66946007)(41300700001)(478600001)(6506007)(6486002)(86362001)(33656002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?RaT+TmiYmFtEA61ROSqe4deCur0b6KoatWX/cKlhAcFlclJZb1p5BxFKmE4/?=
 =?us-ascii?Q?ulNzjjqdZuP2x8ny7BsG3NIgJzi2F97DsGkb5eEMBq6kijP97d+uP6nmTjba?=
 =?us-ascii?Q?GCjQ18d0yxULv++5FmIsFn3CWDSaVUvkIbDhY5DCG7mRUgFLZaPcHFxaBf3K?=
 =?us-ascii?Q?5rU/2AKyEBR7MXvYZWAk2avcbuuBnKyzwkgBl8m+QoojrG+2cHfo2SL+/Jv3?=
 =?us-ascii?Q?8QaoWVVx9aksnDENLb6YNMx+BSJPqhIcWligUcu6raSs5nTLhzBab4rTFJze?=
 =?us-ascii?Q?fCtQHzn0cJCJAEBIocUaxnAz/a85CT+6zyZMqyCTc9rZ9UlM4pp/+jDtioHU?=
 =?us-ascii?Q?+q306q3T1DovnJ9SXinNGCbYFk8Yawj7Klv12WsMULPDDYtDxt/FczBavl9j?=
 =?us-ascii?Q?ITNvHNgf12T2cXrN73PGkqxQtU31kyvXmPPxxlqb4V+7aFzcmXYkRxHdXkVs?=
 =?us-ascii?Q?nlHrVwIMKqzzZO61gKvX+CBsQRNEJYlVtuRTqXpfZfIJcW2zJOEhvqYMaW5i?=
 =?us-ascii?Q?nF+jorb01ytK6Bcbzsop/HRyZW9QhzzJdl2XAc7vQBgVR6SeWhp3lVu3x4y8?=
 =?us-ascii?Q?D3Nq8AdtHWsO3KpfLQjpTJ7dZ/sprYNzf2IiGneaqKsgsE1qBXxRHk7+QFWU?=
 =?us-ascii?Q?lI/MQj0JCFJzhDE2efHcmenNmHPGRScjxqT2r8IKereyXAFAQa0sMBdaxK2+?=
 =?us-ascii?Q?bG4lGgk3Lcr55pTSeE6baeuvEzuolBGKz7tH7AjQVb2rAO2CDGKb9KV91adg?=
 =?us-ascii?Q?bDOuXKa45q5l7UFgEDh4ulV07ENrlg7gTG0su+zrtnyP+vMvz+h3ubpSQ3L4?=
 =?us-ascii?Q?p0vUBleby7QpBUO3dPyBai8L10/0UsKGjmHnR86CI1eX1x45rJF932KYTeE5?=
 =?us-ascii?Q?5yEyk74RkbeMW5kO3zdUAqlcVSFKZi+U1AomPEiu7TOdDT69YSDy01H9dfB5?=
 =?us-ascii?Q?FZKvlf8hdRzX81Jug+vokUf4KlNLPXMeKJxkuVywZVOV7oNF1X6g+szBeZlv?=
 =?us-ascii?Q?+qQ55QiGaYogZJs5ghyg2azHcV87jIJaFI/DzEPkI3bO2msfHfpdO3HDrfJf?=
 =?us-ascii?Q?tWj5GSlBoBGAAjR2P5GhLMMhqaSHQ/7UUAzBc4BHS5boydm+9INrY0WfOta+?=
 =?us-ascii?Q?U1IDoC6eo9njXNnz3uJ7PcWTU3UgTALxP7oVlJBwaUue/uR4RUO7YpNuNTF0?=
 =?us-ascii?Q?l3ayHctaL89e82JVxnUwgBBOJttKTwyBUS/fYoAem8sAYJascwqzojgsaFC4?=
 =?us-ascii?Q?n9YEnK7wIuGYvIu2gCmVV1yWN4e3kXq99sueDPUUUiYZzv1o7rJjAj+L2WPg?=
 =?us-ascii?Q?uGQeAWoI9Q/Gh6up1Hjw6pWBPvonUG1C9+F3IhSXdGuIkYs0HrYR+Cs1E7lu?=
 =?us-ascii?Q?7MDFiyOAHNnyDVbDn9BIG38CEAHN2mXM+8lsuU76srKEjaW9i9T1vKzytmsy?=
 =?us-ascii?Q?LJ7HYpLRsVy1ZxJi6++HpHO6sCJwHJx/S/M523wB5DEp3Trw+PsbO7Bx2/TS?=
 =?us-ascii?Q?UKmAwwrmylJO4hG9XDHAcrZLZ7BqurNLEQY0zH8KqVbl5d59h9eMR03BVhDW?=
 =?us-ascii?Q?gb1i190+2kMwaoQnBuf8ub3cOkHPzrezHhM1rkdqjgAAI/JqbyqpOy/pUFjH?=
 =?us-ascii?Q?NQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 45d56703-26b6-4982-380e-08dbcac5c8e8
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2023 01:51:44.3834 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8oebl1ruwXDl8eWGDtmarNNvSqK3bhfJW1iZvDTpvlXPqIzRx+c8CQuFUJ+WbhO1fvUGdJJivgrC9oenf9QTtx+BzAzRs3OYjOEioSsX3LI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6926
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe/dg2: Remove one PCI ID
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

On Wed, Oct 11, 2023 at 10:58:32AM -0700, Matt Roper wrote:
> On Wed, Oct 11, 2023 at 09:15:26PM +0530, Shekhar Chauhan wrote:
> > The bspec was recently updated to remove PCI ID
> > 0x5698; this ID is actually reserved for future
> > use and should not be treated as DG2-G11.
> > 
> > BSpec: 44477
> > Signed-off-by: Shekhar Chauhan <shekhar.chauhan@intel.com>
> 
> Matches the change we previously made in i915 with commit 3a38be31ec82
> ("drm/i915/dg2: Drop one PCI ID")
> 
> Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

And pushed to drm-xe-next.  Thanks for the patch.


Matt

> 
> > ---
> >  include/drm/xe_pciids.h | 1 -
> >  1 file changed, 1 deletion(-)
> > 
> > diff --git a/include/drm/xe_pciids.h b/include/drm/xe_pciids.h
> > index 29f07a00ac0f..b19478a58694 100644
> > --- a/include/drm/xe_pciids.h
> > +++ b/include/drm/xe_pciids.h
> > @@ -134,7 +134,6 @@
> >  	MACRO__(0x5693, ## __VA_ARGS__),	\
> >  	MACRO__(0x5694, ## __VA_ARGS__),	\
> >  	MACRO__(0x5695, ## __VA_ARGS__),	\
> > -	MACRO__(0x5698, ## __VA_ARGS__),	\
> >  	MACRO__(0x56A5, ## __VA_ARGS__),	\
> >  	MACRO__(0x56A6, ## __VA_ARGS__),	\
> >  	MACRO__(0x56B0, ## __VA_ARGS__),	\
> > -- 
> > 2.34.1
> > 
> 
> -- 
> Matt Roper
> Graphics Software Engineer
> Linux GPU Platform Enablement
> Intel Corporation
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
