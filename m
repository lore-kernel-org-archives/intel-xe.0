Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2DD5C77B75
	for <intel-xe@archiver.kernel.org>; Fri, 12 May 2023 16:29:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD55810E1A9;
	Fri, 12 May 2023 16:29:19 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52E6D10E1A9
 for <intel-xe@lists.freedesktop.org>; Fri, 12 May 2023 16:29:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683908957; x=1715444957;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Sk6XbIVOwthKHDyeWNlXZnATxThbLKw+oQGF8FV7QlY=;
 b=YhxaG/0+KKe2XmwAmDZcyy+rrl+0Wo9V33r9Njj2RRhZHiCN5S8XT/wp
 oX/5ISmL+Wz6UETTsjvf+udKxjWGvFR4QhJev1Xy9QSq0pGqrsU/M4/RF
 C7ovN5iuXNyj7/LuOdbxy0PDoc7riRqBCaVHhmO18E9eRzgBm5oLuLiSA
 dCXKps/NG110Cit5D87pPqFYiKSpU2hqlAFXnxvZAouyrvnNAhclFgTuj
 p9Bo9C3Jx8ZN/pv/w+xBNT81wAlyxR+q23bQzsyjPG6HqiBv28mzgen+O
 uCQmkz3hUlvDYasLYPzKSGJ+JcOI/WWAIsx0kJBuvxQAri81xoDTTpL6F w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10708"; a="331191256"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200"; d="scan'208";a="331191256"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2023 09:28:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10708"; a="1030142926"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200"; d="scan'208";a="1030142926"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga005.fm.intel.com with ESMTP; 12 May 2023 09:28:59 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 12 May 2023 09:28:59 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Fri, 12 May 2023 09:28:59 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.106)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Fri, 12 May 2023 09:28:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DjQXzG84Ob5tG3a8yCUKvXjOpni7fUriwcwym1BAkQnAVrJCLJnTSgInQL9h/QRzMb06+MYBu9OqXGS/KebVASDDd0SaYJe9yWKlcTkO1N7dODlUAfpSyrIMm1eo7Bnr5/E/lJvQWyXuR8CbhWP29bgspxoGDW8A3XVF054Bj7GbsNQzZzzlCh4RHTLx9ww2s9ahYJmXV4F0WrmMiQA4LjIzKbNY0EkArsvjKAdUB0uZB0V8vmOejn4azYf+xsRFsuCd47tCmEVBtn1iZLIwkT8YXQgfkMAi4pnTlt7eH6N3hAE5Rc1VEw+m2v1TGS+gRu1+eI6TZCNK33wpKuh4Lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hhcjmbqsWxzlIs593eemni9mqA5SY9eZWNX6BWar7dU=;
 b=AvlRVMo1mERpM5ec79/1Tj/BQ142tXJwGxpTb73lFmcEY1Un+ToKv2CQG3kNVr6W9guMrmLjZS0hoGFniXVoQt37T4Srq4dF1ACZ0o5HGrjbyTMZTDd4ObGu9NhbgYN/2v1CW2kkIBMcPn2K7g4OvW+h94vYfDEJWK+9DvURicN5E17YT7KxeZ8M4/Snh6T0qWKBtBds7xbifAueXyyOXR8sgb+l44iH0BxfAuR2GvnBxgeG3gB/Zz6t3QUuX1UtUGf5EJZFWEwCKrlavvaQ8n+rvx8W0wtR4mco/Oiy/t/3UAfolVZdUlV0Du7QUfe7Eiq+YOFaSp3TdQoTwMPJng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 CO1PR11MB5187.namprd11.prod.outlook.com (2603:10b6:303:94::12) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6387.20; Fri, 12 May 2023 16:28:38 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::9f98:8f3c:a608:8396]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::9f98:8f3c:a608:8396%7]) with mapi id 15.20.6387.020; Fri, 12 May 2023
 16:28:37 +0000
Date: Fri, 12 May 2023 09:28:34 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: "Iddamsetty, Aravind" <aravind.iddamsetty@intel.com>
Message-ID: <20230512162834.GD10045@mdroper-desk1.amr.corp.intel.com>
References: <20230511034722.1929038-1-matthew.d.roper@intel.com>
 <20230511034722.1929038-5-matthew.d.roper@intel.com>
 <4470f44a-7664-4e7b-398b-4746b8bfd784@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <4470f44a-7664-4e7b-398b-4746b8bfd784@intel.com>
X-ClientProxiedBy: BYAPR03CA0036.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::49) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|CO1PR11MB5187:EE_
X-MS-Office365-Filtering-Correlation-Id: 94e468fc-f4bf-4b51-9aa2-08db5305efd4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XoKinSs1p6yLnD51s3PT7pthCMQhBDCMFwGD7j7d8oefBamknTTODU0pq/JXhJT7Ja5ZLUWQl+uY3rqJYSUU/yidN4KlIDqdpjnVghcghbvPWaePuYojFMM4rsVYg9xJEbWCYB8aLCaBV0dqs/e9/u1AU41ZfbX9gcMPNDEgzvCuEQkR5Tl8S45Li189nJOB0NkOI3dB7PMEnNe/pXR22aAGXDTfiLVp8xdIc5yGgVLxdBpFwV2VBfsuA5w5VaNwYkXZiuF3K7pfR9jTyhDRKUlSwIsACUh5A1pcYhuTX5skAGVTCfeNW4Ko6Qv+wwgSecGivG304lirESxSGX2/GY0DyIZG+3NdozIO6JQLReq+dYPac5IpvcbHYjUEvm+xLMDn9lvhTstb9mMRw+IbaUzNt27ZktvYVt0dXYFMf4pN4f9AxD9py70lTCrKeWn5c/veKuosNNW/X4XFLkvInqUQH1km6/Pact/pPSfWkCli6nhFKN4Vv1Z/htjc1ehni4UZDoZJTINYTASR/5IxyaTh1+MpE+/1jWxWeGEn+M11cr8LL8e8nF1DySNUiJ9F
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(376002)(39860400002)(366004)(396003)(346002)(451199021)(316002)(478600001)(86362001)(6486002)(6666004)(6636002)(66556008)(4326008)(66946007)(66476007)(83380400001)(8676002)(41300700001)(33656002)(8936002)(38100700002)(6862004)(82960400001)(26005)(2906002)(186003)(1076003)(6512007)(5660300002)(6506007)(53546011);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?TLI2uu1JNPILIjalmBefMvdfF+aqTyeSecN/4L7YMsNGmMrjqzCbj/63OiJC?=
 =?us-ascii?Q?dWXfK3cSFGqJ7JawB9A4kVUhbLXfH8eXT9E8ZxiZY1Thw38wWSIZ2Zc+b8Fa?=
 =?us-ascii?Q?V5rqecERGqpQEUCqScUN+ek91WqVj54vy3wFWzzLxIRf8RfesHOA3FiGDfHq?=
 =?us-ascii?Q?DJ/SXqGlQpi1qpEHlzT/TBg9Cqgl/SzL56VelVHUK85Qvb27FvFOhFtBlNRD?=
 =?us-ascii?Q?RrgbR24iYpsHyYVfAqXneX/74Yr6CQcWGVxMC1J0nr7LoEeFWZE9h/Tlv0Yi?=
 =?us-ascii?Q?xNCDQErUHubcd5Lu+/Wy0q+Qx8188c+BNlpUMAwaToqRa8DWGf6ZrZK+7U3Z?=
 =?us-ascii?Q?1xhEE+LuM5GCRJRES8uRoaH2hgJZ6Tk9SA/HCADmjjQVD0OhxydFlCK3q8C/?=
 =?us-ascii?Q?sSdMjBZZskog8WkVJsjJrl170Mf7/FzV0CEkYVUheX8p7fQSIcbQGAjG9T4z?=
 =?us-ascii?Q?KNWJG/zLO/+KfczM0g2ZlI1Hdzdx4Qhvu93QpSdeNow27elJtM9n7X3iQVTr?=
 =?us-ascii?Q?zxN1H8eYR7svGyQD0C3JLhdMVOYKawU0fxQRUGZZ0OmUUm1r2Djgibn+rfxL?=
 =?us-ascii?Q?Q+YPJ9OVGfhwVbczq9a4nkc6vtqVvM6XNu1MYJLcvZU5GJvbEHWdYlfMwxZO?=
 =?us-ascii?Q?IbgPtuIZ1OnrdFEd7X7OqokIJsAb+HkUane7AlJ8YsG9U5XhrtYmdJBHTPq6?=
 =?us-ascii?Q?x1YVc+8CH660G4HOpNV0le7fAerB/ALuxchzhedx9ASy2MNcW6u8QCOoQ1Tz?=
 =?us-ascii?Q?19uVQW5e2jjjU1BvS/m5h46qNxsL1W1iOpjmWw0SoH1yjZy4GFybfIKNw88V?=
 =?us-ascii?Q?LKxnFsu2wbvmL1DTsyi5G6lFYJKrDlojZli0DUFt+KLpaaxXDjRg2e450wyk?=
 =?us-ascii?Q?6esFhkKQ3cupPV1YCl7TzHcIkRGTyUYrntXgrpEaCwiIChtLHRk87LrKlvSs?=
 =?us-ascii?Q?Eqb9SZJf9gY0IWIH22tkFWLd4otopYXybEjKONZPgcQbbMv2IgUf8Gr5e4fi?=
 =?us-ascii?Q?+iSn1i89g6AWZiu1DipwHsEfAN+bsCqFlrY61kAT3V+rSG4yTqyv6ZgqMzMA?=
 =?us-ascii?Q?9TMjRAdTGhowE2dDbYPhv/X5VLJFSY54ldO/hfQszqwrwfo8b3qPlvpqh2KC?=
 =?us-ascii?Q?j1BLIK22r1oMQUO366dZYQG0BwknIh0UsHU7v1KVZM6mJsYFSZR1XfEi54PS?=
 =?us-ascii?Q?7+2YWj++SeOwqew75/lSAHrdDCLa6usxv4H2pXBApAXWhsOoE6wBcVCUwktK?=
 =?us-ascii?Q?xko863d9IHxjLc3ajrBBcsjOLesS1oehONMBBf0QxbuZ6XYHN80Gvza5z3x5?=
 =?us-ascii?Q?wgiX9uxMyDVL/1Zxv+pe2TTPPtOdm6BU5/VmT9XzBTcAOnH8HQGAgPXIKOJu?=
 =?us-ascii?Q?ykWJfsXTX08QUxZ02friLxIcAHDS5VqmmKvSO35SgqTu9oK45bnyzTRALrDH?=
 =?us-ascii?Q?qr7vRmKdtU6VfwlgRO2gbdf/OolseDkm9OTHCa6tCUC0ZtWqU3NkHQ1NL11T?=
 =?us-ascii?Q?E5RNp4jcnCV8IAjRPnjmiFuJylBa2abhbdb9YlmuYXg347aQQ0hUHLZvPHvD?=
 =?us-ascii?Q?TtruDaBuYVGJob4u1Zu7jfb6CLF580fjJeJPIvKeL7e0CQ/F9EBkhJaW2Gjd?=
 =?us-ascii?Q?fA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 94e468fc-f4bf-4b51-9aa2-08db5305efd4
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2023 16:28:36.9665 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 226h78pNLt7YQW6Lciss2BtbDjFUzOkleqYC8LLmTGM14+7ENo596pP/QBJKMHLwFFWYYg1XaKBscR9LOXTnChK3ZeteW1KKlOVNSqCudrE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5187
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 04/26] drm/xe: Add for_each_tile iterator
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

On Fri, May 12, 2023 at 11:15:08AM +0530, Iddamsetty, Aravind wrote:
> 
> 
> On 11-05-2023 09:17, Matt Roper wrote:
> > As we start splitting tile handling out from GT handling, we'll need to
> > be able to iterate over tiles separately from GTs.  This iterator will
> > be used in upcoming patches.
> > 
> > Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_device.h | 4 ++++
> >  drivers/gpu/drm/xe/xe_pci.c    | 3 +--
> >  2 files changed, 5 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
> > index f7acaf51a1fc..745dbb16d417 100644
> > --- a/drivers/gpu/drm/xe/xe_device.h
> > +++ b/drivers/gpu/drm/xe/xe_device.h
> > @@ -83,6 +83,10 @@ static inline void xe_device_guc_submission_disable(struct xe_device *xe)
> >  	xe->info.enable_guc = false;
> >  }
> >  
> > +#define for_each_tile(tile__, xe__, id__) \
> > +	for ((id__) = 0; (id__) < (xe__)->info.tile_count; (id__++)) \
> > +		for_each_if ((tile__) = &(xe__)->tiles[(id__)])
> > +
> >  #define for_each_gt(gt__, xe__, id__) \
> >  	for ((id__) = 0; (id__) < (xe__)->info.tile_count; (id__++)) \
> >  		for_each_if ((gt__) = xe_device_get_gt((xe__), (id__)))
> 
> as mentioned in earlier patch, this looks to always return primary gt only

Correct; primary GT is the only GT that exists at this point in the
series.  Patch #23 of the series updates this code to prepare for the
return of media GTs, and patch #25 finally re-adds the media GT support.


Matt

> 
> Thanks,
> Aravind.
> > diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> > index 87c328106aca..bef65d3a440e 100644
> > --- a/drivers/gpu/drm/xe/xe_pci.c
> > +++ b/drivers/gpu/drm/xe/xe_pci.c
> > @@ -525,8 +525,7 @@ static int xe_info_init(struct xe_device *xe,
> >  		subplatform_desc->subplatform : XE_SUBPLATFORM_NONE;
> >  	xe->info.step = xe_step_get(xe);
> >  
> > -	for (id = 0; id < xe->info.tile_count; ++id) {
> > -		tile = &xe->tiles[id];
> > +	for_each_tile(tile, xe, id) {
> >  		tile->xe = xe;
> >  		tile->id = id;
> >  

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
