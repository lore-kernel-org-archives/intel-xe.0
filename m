Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC57CC35274
	for <intel-xe@archiver.kernel.org>; Fri, 15 Dec 2023 15:00:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9924710EA40;
	Fri, 15 Dec 2023 15:00:09 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A976E10EA40
 for <intel-xe@lists.freedesktop.org>; Fri, 15 Dec 2023 15:00:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702652406; x=1734188406;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=3SFb97JWRnCXqyUMoFtHJ1Dz3EvsA+PgkZFSQomG270=;
 b=iETCgjv0C/mjCgAVL3+TonJrogdA6kNLKSZsBNDC3ooivSX9/zv1TBXN
 2AgJtw0Z1KrgvBGZbJufoJuarK7IMRcNoe2hMh76UgH4Ue+Ogx5QZjeJ5
 Qb1BxlPtO+WZQ6o2gAUUUGTSuuFjuFUohvEVqek01jaliRCYTDKEHRXH3
 7//z/J/ZtrFO6p/3KdQQY8pGm9+L1YeeSDc/O9nMBGoKEFJQppG0J/V8K
 354G+yKQBHw7LwXrliqz+RXxjtDoNsyBtbof9LREc5XXfwtsombbAxirF
 pN4FFjqTogdKN4CiSstOMC3+f4u+8DW/cTmHfxSXCLe7XYYdPZThEkSAH Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="375430979"
X-IronPort-AV: E=Sophos;i="6.04,279,1695711600"; d="scan'208";a="375430979"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2023 07:00:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="918464022"
X-IronPort-AV: E=Sophos;i="6.04,279,1695711600"; d="scan'208";a="918464022"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Dec 2023 07:00:05 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 15 Dec 2023 07:00:05 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 15 Dec 2023 07:00:05 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 15 Dec 2023 07:00:04 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mD/jokjO4K/NixjhiqoTm/A0fa4z98tyHpffQcM9c4/SgBjFjtTAAUJ+3EDbpZXZ51RK3Fx7mKymfY1OBtfrCQcCQ72RkORxWq8YdKI5j8wtntzFm1tYBM4eqlp8f1L5f4dYVUB/ftWMncxRhwDtUK35VbNOcqXz/g63GbhbhpahV1oXj2R36ihtToH8QpJ3+COx5Uz/RJiTWQpK31K938Va7f5KLl0/FfxMJ00jiwGW4i9/hbKrD49qK376QtZ5WQq4sPkCUn2+l3mdwTvekuZed5tqagSZipJ5xZp+eOFq5C0Jk/H+7LaSX5RUKu+RN6mm/S8rJZ7728p326h+bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4/klwOGVZ332qJeWNekEdFvvbjRbA4BVqwlcD5ZKAsU=;
 b=AA4RoSJEi7kD6Y7TVFa5k2rD2DRJyPqE7KCHx9CxDDAU7howSShxWQT5OP3M73AIN9VqfkqCb9mtM5Vugm3SG+JKAS0gh0bFeoZvEjz7uV1PsYB4S5Gc37k93IBLLV84nr5sUpag6nDdCe/mmwJQB04EsbtnyxGRqvoUTaE/t7DCkNZTlg/3cgPShlioNZrtGZaRLElqyyEBoP9boJTBb+xpNy9rAsmOpJyJuLTO3xvYq8zoGjPDZGBm6AEqBlUSd6ULG8EK4vNZ1G4l8u2BotN+8qB+4RQH3VN5MtWPk8xlXMskhrgpEFzS1YUY9uUlNXFslWj+hOmleXZL2PYKeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7828.namprd11.prod.outlook.com (2603:10b6:930:78::8)
 by BN9PR11MB5385.namprd11.prod.outlook.com (2603:10b6:408:11a::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.31; Fri, 15 Dec
 2023 15:00:02 +0000
Received: from CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::7d36:1951:b896:cb37]) by CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::7d36:1951:b896:cb37%7]) with mapi id 15.20.7091.028; Fri, 15 Dec 2023
 15:00:02 +0000
Date: Fri, 15 Dec 2023 15:59:56 +0100
From: Francois Dugast <francois.dugast@intel.com>
To: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
Subject: Re: [PATCH] drm/xe/uapi: Remove reset uevent for now
Message-ID: <ZXxp7LmFh-CSqc_1@fdugast-desk.home>
References: <20231215004351.1520696-1-rodrigo.vivi@intel.com>
 <MW4PR11MB7056E2099198099CC15AA2A6B393A@MW4PR11MB7056.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <MW4PR11MB7056E2099198099CC15AA2A6B393A@MW4PR11MB7056.namprd11.prod.outlook.com>
Organization: Intel Corporation
X-ClientProxiedBy: FR4P281CA0370.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f8::16) To CY8PR11MB7828.namprd11.prod.outlook.com
 (2603:10b6:930:78::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7828:EE_|BN9PR11MB5385:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d0f5b58-5a6e-46ef-c659-08dbfd7e83c8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xORqrXgf7qL7YXW/7wB6hsMBNUwqlZxk6+WnFyPg7RzFgTBOQDCYBdpryh5rDEKD/jSvl0IXyYSlRFBMdq1dOAr6eN5TLrkMFuD5odPApWYgNXXcwKn0WwDB2UwwWnFMUjWi4nstkURvB0uz7r9y053N5VSj7pszNln57pUcf/wAkMcq/30tcu8JyequMVSN5TXwJPWzJKZ72mpyFyj1dA1/qbusDbr5aiHv3G/UfxiaxdVTblw5Wfm17Ko2X3OIA8DFN/g683fKQ3mJwfu7A6eSYks5UCaI5v9NMQQPfUX4/bMPP+4MAg9g4S11dOel3IRRqjk1Fg8SpDfshIGexYDws+TMPbWfk0CSj2sC0om3bn4OB5k2MdzSLMR8OdGaFlXIw9Ij7BErP7uC0hpCXEV2shWm+nFypmnMutMSnHXnljC+T7nGh6zM5uxqaNDuKm/KFFEnoL/IL3CGsLI/2ZDomWMHZ/4Zrb/aUMETKSsV5Dl2oGTb2dSxI9dlGdZ2f1WPpFhR2ZJQ+/7RXFSqrm3FalfZ5xBKj8XILGuEHUUCdkOsUuXJG3kVVfdxJW1W
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7828.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(39860400002)(396003)(346002)(366004)(376002)(230922051799003)(186009)(451199024)(1800799012)(64100799003)(83380400001)(6486002)(478600001)(82960400001)(6666004)(36916002)(6506007)(9686003)(53546011)(6512007)(26005)(66556008)(66946007)(66476007)(54906003)(316002)(6636002)(38100700002)(86362001)(8676002)(6862004)(4326008)(44832011)(8936002)(5660300002)(2906002)(36756003)(41300700001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?pBJ2fVRRkwmrXfHeRaptUwitcDVZDOq28zmiWCDNpk95sGWzX7jpvit3whAS?=
 =?us-ascii?Q?nTOnHl3kxr3W13Kpv9IdwqfW5Z5gTxXyaUs2YiX5KGKOXnk+h6AOQP5XZIa6?=
 =?us-ascii?Q?4wBZz3ZvjqzkhzSD8x49ISBHXSj46RxLQV/ckNpgz7/vdRYksVrRVKqZzsTs?=
 =?us-ascii?Q?l+yxEkZMTifuQ+9WIXVBekH55+V64hqxImsQLY1s+Xkf0iZLmq1/VLjtUUBD?=
 =?us-ascii?Q?CZgyKFVf0fKR/TLF8Qcy/rnnk+mYfIvf/HtHYdwKS4F9LleqtsUafLJx87L8?=
 =?us-ascii?Q?GsJqserylW/yGgRHhszWS/WjyYpQeznFSlBYDWy99IOpzU7I06YNzsvoOk+3?=
 =?us-ascii?Q?O/nq9Z7Gw9fPUEe3r03TCHFs+C8XcQhDd4KBF8YO23QQeiK/DY3549nMtUKL?=
 =?us-ascii?Q?GwpCQCJzz7xgk+rkA9DMrZYrdOZ3bNx1gtt0ji2zW+ogU890oe8jeyx2o86u?=
 =?us-ascii?Q?ivRQkFCRWM1pGdixbDYhVpp80MR/g9oIHuR7diBV0o8SjYxLSeSycQYyTGVq?=
 =?us-ascii?Q?Qy3Hw+Sxmj5unF+89a9bCDLKW27BXR3AOHnEqFSzD3lI2JVHDBQbxFpGq/VA?=
 =?us-ascii?Q?gy4GaxY8fevEii90IX73/rDyYp4QPq2nc8CDx1ZbmbAxhlJzseq6eMUG4qb+?=
 =?us-ascii?Q?3vaBhTAVwOb1Gtu9kuXM5nvhuTLDGr/6c1D/LNdee4ATtwfnv2/6o6Ze842f?=
 =?us-ascii?Q?qzHMVVLpfkwoOPf7LzLfDftJhnN4LBClE4LWAiNzqugGhh0qPemgNYR+l0dT?=
 =?us-ascii?Q?bUpcVPuyL29gUModsNo7nrZ07rloYTEJFiWY0/nPbSUO2tiwO0cHUWls7WT1?=
 =?us-ascii?Q?3yzN/wHqQ6lupj7WmWdUDpmq7odaNlFMzR21osAaE++nTeKht5Fm0t3YwG0C?=
 =?us-ascii?Q?DyPro5KpvqwLNjwrNsNSSOiuKOK6sdUK0KBth5qs+8CRK6E107B7jcQXuGAz?=
 =?us-ascii?Q?UdZXmog2eGS9qA/bf+OCswRA0uPZCv7i36YgjZt4hk9x/LzWGsIgg2A3CwDS?=
 =?us-ascii?Q?ezYEnt1tYfymKASP7uVIw6CxdyuaZlRnF57M+PMcLq+bRATepKPB4gxY3qTj?=
 =?us-ascii?Q?HvFAdGPo4c5j5thk32+GLHv34rAtmmXlxTySeUSl933agb9wcUUxKl+ndSeS?=
 =?us-ascii?Q?dk9mKBofWIAsTIcxlPWa9ngNz3Dq46KhDKmCsFPaF0YEPpFGw9UabhsFlxFI?=
 =?us-ascii?Q?Zp/w/4Vphe7K+uK614lpnNK4UgqoPaeO1PppXXVseVw5+eMLgdMk6clg4JAw?=
 =?us-ascii?Q?7kLLtc1jod/TOgAqDXsTnyzm2rJas6NoaAo8r2AI9oKIytJl3RvqJc4fN5lK?=
 =?us-ascii?Q?ChNsEqJv4P3OmYB4Kvq2xgEwXQnE56CXt1JDAO8J2amKif63blrh+8fjBmiO?=
 =?us-ascii?Q?TMKOXBEGR3N78/HWlNqliML9CQZJtq5EQZY0s496mXe1uGWv95cm3G4thPDh?=
 =?us-ascii?Q?FwfR1upQF75CFSaQNYMypkJ+2z88sZnggTzI1hYVGEunfde897tCVgLHa350?=
 =?us-ascii?Q?2YDBP987dUfuPnA/hHrgJjNI34Vuj5r8wTbgUZdfzSM1dj8PBgFUpoR1hctX?=
 =?us-ascii?Q?F9DX64wABpvdV9d+6jHIBuTWnjOM8Zt4wwDhAaAxdQWyvr+++f8KxgygsJzw?=
 =?us-ascii?Q?Pw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d0f5b58-5a6e-46ef-c659-08dbfd7e83c8
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7828.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2023 15:00:02.2888 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1NLD9A/hFRgQAHllmzqiunZKh4DiWUIYxTooJadmTP6Y5ZdPdYl2M2kzxbnCHyIzDDAMJgrjc01IDqTP2w51rphIpvUk85HgWEO7KL3DHb0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5385
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
Cc: intel-xe@lists.freedesktop.org, "De Marchi,
 Lucas" <lucas.demarchi@intel.com>,
 "intel-xe@lists.freedektop.org" <intel-xe@lists.freedektop.org>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

+ intel-xe@lists.freedesktop.org

(There was a typo in the original submission to the mailing list)

On Fri, Dec 15, 2023 at 03:37:24PM +0100, Ghimiray, Himal Prasad wrote:
> 
> 
> > -----Original Message-----
> > From: Vivi, Rodrigo <rodrigo.vivi@intel.com>
> > Sent: 15 December 2023 06:14
> > To: intel-xe@lists.freedektop.org
> > Cc: Vivi, Rodrigo <rodrigo.vivi@intel.com>; Ghimiray, Himal Prasad
> > <himal.prasad.ghimiray@intel.com>; De Marchi, Lucas
> > <lucas.demarchi@intel.com>; Dugast, Francois <francois.dugast@intel.com>
> > Subject: [PATCH] drm/xe/uapi: Remove reset uevent for now
> > 
> > This kernel uevent is getting removed for now. It will come back later with a
> > better future proof name.
> > 
> > Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> > Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> > Cc: Francois Dugast <francois.dugast@intel.com>
> > Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_gt.c | 18 ------------------  include/uapi/drm/xe_drm.h
> > | 10 ----------
> >  2 files changed, 28 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c index
> > dfd9cf01a5d5..9f9527329842 100644
> > --- a/drivers/gpu/drm/xe/xe_gt.c
> > +++ b/drivers/gpu/drm/xe/xe_gt.c
> > @@ -589,20 +589,6 @@ static int do_gt_restart(struct xe_gt *gt)
> >  	return 0;
> >  }
> > 
> > -static void xe_uevent_gt_reset_failure(struct pci_dev *pdev, u8 tile_id, u8
> > gt_id) -{
> > -	char *reset_event[4];
> > -
> > -	reset_event[0] = DRM_XE_RESET_FAILED_UEVENT "=NEEDS_RESET";
> > -	reset_event[1] = kasprintf(GFP_KERNEL, "TILE_ID=%d", tile_id);
> > -	reset_event[2] = kasprintf(GFP_KERNEL, "GT_ID=%d", gt_id);
> > -	reset_event[3] = NULL;
> > -	kobject_uevent_env(&pdev->dev.kobj, KOBJ_CHANGE, reset_event);
> > -
> > -	kfree(reset_event[1]);
> > -	kfree(reset_event[2]);
> > -}
> > -
> >  static int gt_reset(struct xe_gt *gt)
> >  {
> >  	int err;
> > @@ -659,10 +645,6 @@ static int gt_reset(struct xe_gt *gt)
> >  err_fail:
> >  	xe_gt_err(gt, "reset failed (%pe)\n", ERR_PTR(err));
> > 
> > -	/* Notify userspace about gt reset failure */
> > -	xe_uevent_gt_reset_failure(to_pci_dev(gt_to_xe(gt)->drm.dev),
> > -				   gt_to_tile(gt)->id, gt->info.id);
> > -
> >  	gt_to_xe(gt)->needs_flr_on_fini = true;
> > 
> >  	return err;
> > diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h index
> > 0895e4d2a981..a98cfd3d0496 100644
> > --- a/include/uapi/drm/xe_drm.h
> > +++ b/include/uapi/drm/xe_drm.h
> > @@ -16,16 +16,6 @@ extern "C" {
> >   * subject to backwards-compatibility constraints.
> >   */
> > 
> > -/**
> > - * DOC: uevent generated by xe on it's pci node.
> > - *
> > - * DRM_XE_RESET_FAILED_UEVENT - Event is generated when attempt to
> > reset gt
> > - * fails. The value supplied with the event is always "NEEDS_RESET".
> > - * Additional information supplied is tile id and gt id of the gt unit for
> > - * which reset has failed.
> > - */
> > -#define DRM_XE_RESET_FAILED_UEVENT "DEVICE_STATUS"
> > -
> Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> >  /**
> >   * struct xe_user_extension - Base class for defining a chain of extensions
> >   *
> > --
> > 2.43.0
> 
