Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 699ACEB64D8
	for <intel-xe@archiver.kernel.org>; Wed, 14 Jun 2023 17:54:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC66510E141;
	Wed, 14 Jun 2023 17:54:30 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFA0510E141
 for <intel-xe@lists.freedesktop.org>; Wed, 14 Jun 2023 17:54:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686765268; x=1718301268;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=KkI0lldjZLEriI7xw72ojk24n4XmGVoZWlceUFb1ZyE=;
 b=VvEhsBei0TBQWHv5MZrL2jz5LPo4KiJelscKVpUY9NkZDz6gof//+EM2
 YCe2KqSGX5wV1+FZO8ShxcaPnDYCDz6c41bJDEOk05EZJSfOcmZWPwmJ7
 BsazP0GyWGpEQYXCTJB4o9cGLi7USmJf3j0dKOKmuehDZ6CdLMP0Jf/Lq
 knN5lJQzVFb/tfeH4jRS1yeJa5FZ4av2PKAOoE86Z21AxUoSG6S8E1kea
 Cv0Jqez1+IEdanKZrJZYIoSlqHl1bGVLRTrR829zVYKNLQ8rx4zFo5K8S
 bx4DeB3Z3++2GB3Cd4sXN748jREAdgb4PxiZ3ubO1FZqs0uoasnPdmVWo Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10741"; a="338323363"
X-IronPort-AV: E=Sophos;i="6.00,243,1681196400"; d="scan'208";a="338323363"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2023 10:54:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10741"; a="836342110"
X-IronPort-AV: E=Sophos;i="6.00,243,1681196400"; d="scan'208";a="836342110"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga004.jf.intel.com with ESMTP; 14 Jun 2023 10:54:09 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 14 Jun 2023 10:54:08 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Wed, 14 Jun 2023 10:54:08 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Wed, 14 Jun 2023 10:54:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iO1sL+C8srFuDL91ZRIm9YicuPxvAAF8OD7LVa6zLA8RZnHeDOhyYMEgM/Pmz/DBrpC71neM+nVovX0OGwYU1vVSHCQeIErBJObGDaLO5wiNKUFzSBhdeVmKepDLeHM/nNYAzYXVAvymdvBmrHOA/+oCnFDSAXBMCREzRGB5xYuuVAhR9xIlHdDheTJ0/g2+Fgfv3R9s4xahKymPN48v70ChyxgixEAjDoOnhUUjq+ijb2081zAyvUG2XaUhAGoHB5EiZaNOmosYSPJxcHygRkRHJJ+hcP9+WmOJAEseAa233AB5ItPP7Gow1Ui7SeouiKrF+NBphYOkxHm7x1ZF8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0N5arlmPb8cEBOAWGYNjQW4tdoHWjUJLEMPDvkCiMeI=;
 b=TaZugnyn4COhrVJWB7xAYQhmRVGW4Kkbj/Ikii0D3fJ1yQg8bFnY31+xofGb0aXdqhM87OLxzDO0PWM+7VAtCmu9yZPzYh3S5kNhVticMx6i0V2W6GfZamRlJXSh2sepIYQj6xwXapKCcIfiRcqcvz4dZqG6sAYZIxQRMqrvLhj4jR4w3xcyB1mlAYPH8WrIa2VbZmFv0Or4yMFTq3Sf5LV75XOQxExnF1PuWDZn21Ay+AHU8YRT/8w6Pd9uPJF7JnMRKaVbkf5Ewqe+yRaSMUjEJdFhUCMfT3tSUjs8wBtG9KF67EwglU2b0KgM0gPsn52ombazPQ9Q57XJV+pviQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 CH3PR11MB7842.namprd11.prod.outlook.com (2603:10b6:610:128::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.46; Wed, 14 Jun
 2023 17:54:07 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::9f98:8f3c:a608:8396]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::9f98:8f3c:a608:8396%6]) with mapi id 15.20.6455.043; Wed, 14 Jun 2023
 17:54:07 +0000
Date: Wed, 14 Jun 2023 10:54:03 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
Message-ID: <20230614175403.GI6953@mdroper-desk1.amr.corp.intel.com>
References: <20230613094232.3703549-1-riana.tauro@intel.com>
 <20230613213941.GH6953@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230613213941.GH6953@mdroper-desk1.amr.corp.intel.com>
X-ClientProxiedBy: BY3PR05CA0038.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::13) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|CH3PR11MB7842:EE_
X-MS-Office365-Filtering-Correlation-Id: c61d330f-5535-41d9-d130-08db6d00593e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9hSW1/b3GDAAjPHnpRwLsER6Q6Aw4COLLvovTZ5WyUmK/2PFl0R+HZIELkfOOam0GOR/bJiIoRncCUjNh7WfgJDwUMS6cSaEtGw3XaNq1at1E1Q0PJGM0ZcuZLyRTqjMEDq5NkKacaNztLmSuP19d/E9IRMAIHE6rQcGfB30noVh93N3hwJ+LHA6yQ/HJjtt5bcpPluqdlQyeuaD/ejONqHVel5ppvTnTpitREsX0QP8BqrZ7xfUydgKFSkLU30BqjuOLS1XsOrVoI904P6Hk0tjxqJ5Fc55FB419FbKSPh7gDS3ARu2ipBbfyFC+Ck/QtErrU/ZngUnZHc+pyxkazbvqnI5bKUIuZh5NNY9DIrcAJXlBQC4i/oHHfrBHvI/d5GURUW2rQikiOBTM/vA+VRa7GDHCg+slCSYDEDlW0cGxnxt9tiUjsWd0szHeQ8jKJ43vHVbnx3+APO6wEmIB7F+kqjw5b5bdcTXMLGioAoiMi2G3wKQDNT+WZrjHDdMrP66tExSLexO8O0McKaf9JmwSXTOrNTVRsY/OLiCY8Uf6rRUGqWra15bqQzYOH/E
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(376002)(39860400002)(396003)(346002)(136003)(451199021)(83380400001)(82960400001)(33656002)(86362001)(38100700002)(478600001)(4326008)(6666004)(6486002)(6862004)(2906002)(8936002)(8676002)(5660300002)(316002)(66476007)(66556008)(66946007)(6636002)(186003)(41300700001)(6512007)(6506007)(1076003)(26005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ZZ16f4lL8SfrGq83RmqgPam1F54waFUKSg1Ym9AhsokpnvF12BcRfHUPQj28?=
 =?us-ascii?Q?WJC5ENcEauFF4Q9FbvUVyK4wAOvHruM+BYkCzu+c3LBTRlHzaeIcMbEzHLIe?=
 =?us-ascii?Q?ZB0EDmb8g/gJljU9fTqaELdZBHDOt9khGuRlFnc3CQSwL1qvJsK/62QluAN1?=
 =?us-ascii?Q?tluWsvX1FbNWdd4Dvl3DjNykhB5hhrKYnhZqIIMxqTj3knHZr1lVze6DLKUB?=
 =?us-ascii?Q?2Z4n6FJWeCM1cxN5mDI38jSjUXOmlc+753CnvvRLWrA5bpmWkJg3oFLimAhP?=
 =?us-ascii?Q?eeKDFWh08wPxc5PPK2wOqDPASPsK+gn7kGvHWyx44TuyZ/IsXKsW4J+yfB/v?=
 =?us-ascii?Q?pPYL2LAi2o9qIQt3Az6TGdJKuhED45dK05qY3AQ6ijnqzGlFPtm/8SSNp6ha?=
 =?us-ascii?Q?3DUi4nq6jW3KYSia5ZR9qdwC3N14Lg3dAQdCuSMsuX+Vjkh9cODojZqdsKmd?=
 =?us-ascii?Q?HjIFcQg4pVms9gKmWVC5WOzfm0uuU5ozBqYPYEowpVXr9BcKAT/XJ5NejoHZ?=
 =?us-ascii?Q?OKIyzqpMc09oOuCCFmtpRDdLUZfcDPVEbaecd8G/XZ83Mc1F/M3a0FXk20DX?=
 =?us-ascii?Q?mkGk9UsXtxrw2iC1Ea/Wu2l2sDi32VopI3tbE6CahDCCAldhD3UigfpqqPst?=
 =?us-ascii?Q?KEraq5AShGNHYz2U2D9tgoxdqz/Xxl68zQCgHozgbQD1V7tBs7kbEgBG9TWW?=
 =?us-ascii?Q?X6p1TlahWorCaucngplyJ1KO7IVbK0jNvT4IiK+yJaSbkIZeYm5/sWeXiTB4?=
 =?us-ascii?Q?u0PRTyRw6s6bTCPI1QV6HjD12Pwzhmdt7QRLadtl2tKvMJB88cH/gyT2yL5T?=
 =?us-ascii?Q?9flL+Duv+/0pg7Igx53/u2wCgD+YtdT4PAil50gsOCt61zhOulzM9SSmAfgg?=
 =?us-ascii?Q?WVaLb+iw9TlCIFNDy43eq+pKBAvGYaJWlBZuHkOavgA9bryfgUja+bVNqn0R?=
 =?us-ascii?Q?oBbOuf3nIfbvPGlFVHfbf+MJ6/XhPhWIZM8yfruxCj1vfNOCOll2gqhJxIGm?=
 =?us-ascii?Q?rdmLxqdXmg62uP3TDVHMccLcHW8Bq0tmN2pbdg+JrPxIJoAmzU9K8V0lZfq6?=
 =?us-ascii?Q?JAaIH/j5LZxFUoDojeKBEO8sdDD9S6DS0p+yfrEQ+b/KUhqx90ad42UhGBsz?=
 =?us-ascii?Q?4ga+Mnm00F8O7oYTdsFHhQ8BsBPvHcxlG2jtwBMqefDq5IOrdTomgnpBZ27e?=
 =?us-ascii?Q?9V9p08Hk0kyfElRqpDANlFeWSN38VNrI1DeaC/B2ItzIssSMQBi67UmquYiD?=
 =?us-ascii?Q?4wd67hGvSM/0ap9ldxvNSdUhUBoBFHR3Ad6K+jyHi0nUp3+8N5TVtqqLSh/7?=
 =?us-ascii?Q?P4rbq/lTxoYjjBiJkgeh6BpGNT4vXKnERf6w33g1VVS6j8JL/e7vgqmpFbzH?=
 =?us-ascii?Q?OBSWdwFHp8AgH+p/hscaZyxbDm8qyw+nZbqN04syDvEn64VHnL3+PkLxwikA?=
 =?us-ascii?Q?0lJ76dmpF7Vdx8qNiSangrb8BB4ik/YhmNR/hfFl4SHNWQqlQHprzZ8g0TCO?=
 =?us-ascii?Q?6A29syXNmfPSooS5qjWntpaGBLnNM4/M8LydBHwikJdgmpb5DFnAyKeXvUT2?=
 =?us-ascii?Q?HZmfGg3srU43pTtsCf7NmybrtriHDDq3gOXZObVF4GIwAYpDtyh3x0mVKbQt?=
 =?us-ascii?Q?3Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c61d330f-5535-41d9-d130-08db6d00593e
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2023 17:54:06.9986 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d2s1i5MxagI10rfqzmhy4br+MtOZz66gkCIkHkNDN0WF1vWqi+0yzq/lx5h0g3HKaXfy7wxjevHOFsbQWfxQuuwMqPaIy+LFmmy2Z8cPXrs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7842
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe : Fix GT looping for standalone media
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

On Tue, Jun 13, 2023 at 02:39:45PM -0700, Matt Roper wrote:
> On Tue, Jun 13, 2023 at 03:12:32PM +0530, Riana Tauro wrote:
> > Currently the id of primary gt is set using gt_count and not
> > the media gt.
> > 
> > set gt->info.id of media gt using gt_count
> > 
> > Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_pci.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> > index bd1f59b49928..2991cf5365d5 100644
> > --- a/drivers/gpu/drm/xe/xe_pci.c
> > +++ b/drivers/gpu/drm/xe/xe_pci.c
> > @@ -590,7 +590,7 @@ static int xe_info_init(struct xe_device *xe,
> >  		 * up with platforms that support both together.
> >  		 */
> >  		drm_WARN_ON(&xe->drm, id != 0);
> > -		gt->info.id = 1;
> > +		gt->info.id = xe->info.gt_count++;
> 
> 1 is always correct today since MTL is the only platform with a
> standalone media GT, and it's a single-tile platform (so the GTs are
> 0/1).  This will also be true for any future single-tile platforms with
> standalone media.
> 
> If/when we eventually have a platform that's both multi-tile _and_
> multi-gt, we need to decide how we're going to identify GTs.  Since no
> such platform exists today, we also don't know for sure whether every
> tile will have both GTs, or whether only some of the tiles will have
> multiple GTs.  It's not clear that using gt_count++ will necessarily be
> the right thing to do; maybe we want to make primary GTs 2*tile and
> media GTs 2*tile+1 (i.e., intentionally skip IDs if some of the tiles
> have both and others do not).  We may also want to adjust how we
> approach GT identification in the uapi in general --- maybe we don't
> even want to give GTs a global ID anymore and instead want to move
> toward identifying GT with a (tile_id, gt_id) tuple where gt_id is an
> intra-tile number (i.e., 0=primary, 1=media).
> 
> The current GT and tile series aimed to just preserve the existing uapi
> without changes, and using an ID of 1 for media (with all the FIXME
> comments in the code) does that for now.  But sometime soon we do need
> to make a formal decision on exactly how we want to work with tiles and
> GTs in the uapi, going forward and that needs to be something that we
> loop in our userspace partners on; we can't just make the decision
> ourselves on the kernel side.

So looking at this patch again, the important part isn't actually the ID
of the GT (that's already being set correctly); what's important is that
we need to bump the GT count again when initializing the media GT,
otherwise gt_count will stay "1" forever, even when it should be 2.  So
with an updated commit message that focuses on the gt_count rather than
the ID,

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

I can make that tweak to the commit message while applying; no need to
re-send.


Matt

> 
> 
> Matt
> 
> >  	}
> >  
> >  	return 0;
> > -- 
> > 2.40.0
> > 
> 
> -- 
> Matt Roper
> Graphics Software Engineer
> Linux GPU Platform Enablement
> Intel Corporation

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
