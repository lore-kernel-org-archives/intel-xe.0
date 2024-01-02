Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFFEEC47077
	for <intel-xe@archiver.kernel.org>; Tue,  2 Jan 2024 16:53:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F65310E1DC;
	Tue,  2 Jan 2024 16:53:09 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45F2D10E1DC
 for <intel-xe@lists.freedesktop.org>; Tue,  2 Jan 2024 16:53:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704214388; x=1735750388;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=YoQnFp3ChWleHL/tQXKndG6kL5cBGBfE2H9jzB3hRNw=;
 b=JPQVhZYOGbTOWgG2BxijgJyZ7oF+OHEWwqIaTvhM5XToEH1stdmd4BOe
 stuZqqNZARdyxaDk4QIEkqePGOqwGDD8l7U5nvrRgcO0Yx1eaLlxXMPGp
 GV9uy/VWU+/Ug1bFrOkgnpz+1oUII2Fp8iUm8lQVTshH9/Ih0o2ioh9ou
 Ah9BansXBUr/+1bU5LlnjSPd+ykkQp5NoU3HN041HyHKxeXI5v92NTVs/
 s1HHR7EEcjG1PETl81Pjkaumo9wVp6QIO8AyXGXdn21dtcRVoA1rscq/b
 k+NZgbKM1UrUUFTifBZ99cflFb5zMDx7E9OBb11Lt1+4PgJrhMuKC+Gbt w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10941"; a="377053410"
X-IronPort-AV: E=Sophos;i="6.04,325,1695711600"; d="scan'208";a="377053410"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jan 2024 08:53:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,325,1695711600"; d="scan'208";a="14233565"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 02 Jan 2024 08:53:07 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 2 Jan 2024 08:53:06 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 2 Jan 2024 08:53:06 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 2 Jan 2024 08:53:06 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 2 Jan 2024 08:53:05 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EauyUjRCeFIhjBnELUhZ5jSB3l0+t9mTW0TP/gp7IJ7B4ydGZQ+sChtE7kv4luLDt2ay+/ZFkW3jJnHaB2wny5s6saIT4JN4H/HGbgoFj+l7pdnwCJC1yTs/034ABE1J+SxCbbgVBw03cwyl+6BougTLfbJvmVUCiRWb7WXXHE/Ca3WUkSPfB8N+uJ+CzY06tYov+Zt/Eyw21Vo0VwJsd3xRec0DynBp/vWS7UQIXI7EubW8yrjLwMYaBQT4y80dXRRs+Wo9r4K5Hdy+Y+zfLR4ngCVsfMonIe3cd1nFAor+62vmyXHNpLEXjxA/nXYCTuvaHWyG2OBZIfU+D/RWiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9dis3pwG8AcBj0Y2vlCr7jCsXyRVLxev8/+i/zgiyB0=;
 b=mv1qskNumjgMWSVjEHpCPlAdmDZsM+llSya5C37k4GvScptZthSAUeV8oNLV0sS1/8qEl/Si8IPacyjY+Y3BQXBmtFxkzhbIvm1YMNkx3txPlv38HrLFsh8EbL2/Y0AuF4LTh6w8iL2XjG4wwWO0tkpSGA8n+8FojQhlF2IACF/ZGJf2nYUFeqVjKxK1GkJNNIoq1/CGxWiNSAND05nhHFrQ+Bdza2XCNgZYwn2Cf3bFegXmugHlvkivsGjLF9vSCfQJZxbbtRNiPkqouKF6HDO78dTsyXRUSDYsDks14reu7zI79vfB9gkXH7cFFxQcSwMPJ5FYF0cWqRfHc7Od0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA1PR11MB5801.namprd11.prod.outlook.com (2603:10b6:806:23d::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.13; Tue, 2 Jan
 2024 16:53:03 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::b9a8:8221:e4a1:4cda]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::b9a8:8221:e4a1:4cda%4]) with mapi id 15.20.7135.023; Tue, 2 Jan 2024
 16:53:03 +0000
Date: Tue, 2 Jan 2024 16:52:48 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: Re: [PATCH 1/4] drm/xe/guc: Add more GuC CT states
Message-ID: <ZZQ/YM+Ltw9/g+Qi@DUT025-TGLU.fm.intel.com>
References: <20231229043507.1002411-1-matthew.brost@intel.com>
 <20231229043507.1002411-2-matthew.brost@intel.com>
 <6c1429e3-5b0d-4aa9-b244-354dc9b780ac@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <6c1429e3-5b0d-4aa9-b244-354dc9b780ac@intel.com>
X-ClientProxiedBy: BYAPR08CA0063.namprd08.prod.outlook.com
 (2603:10b6:a03:117::40) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA1PR11MB5801:EE_
X-MS-Office365-Filtering-Correlation-Id: 0eaf9d44-66b9-4ca7-51ff-08dc0bb34901
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PUh3b3nGtmyUAo7dgnMcmu+XEqy8EYcZfKzu9gbSKNKEuI6H4vhc3XIXC8zCaCAqDQEiLv/hMDDwA1pLu/60AFvxwWPs7d0SM4qxGHpHAgHa7IHx60+UODSnaJ/Iqv0Uxx0UjOsQ/orkR+0Ny2otvVp9LWESroKCKj7LCd6Tlv24GZU+VLtQbaq6gl8k+GxgjWjugTHuOxNDiqdesw6VLQ2zvn7qXLyOa3HdKF+Etuu8DeSBaiEY2jyrusWYa6XxODn47z187K4bQ3ZOQpdK/wBRcswd9bF7geGjIjJFg1Mx5h6oWfVr3GxWVolbjpc+sHcT5Of9T4+UR2FU7jHjHUgY2AYRV4YTf4yDKKlJe61Iw0JoOKik5fdpzKO0KfQEmvcWRYUm99pK2eUrL1bIGxtlNCgNrntrwtEqKE5qsKuw9Z1vfYTo9YwOErl5cy6tj6DxwVrVA1eF5x4t+6gqUWmYJPOJmT4Fu4lmbuGOsJfazR+8pFtCTfO+IcaHhxrtjoiVwYvvZfb3McbkI1yYGzD6BH+3HPmLi3VqBK+58o/VaAqMXAeKPkyR7i0UnMhK
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(376002)(366004)(39860400002)(346002)(396003)(230922051799003)(186009)(1800799012)(64100799003)(451199024)(6862004)(4326008)(8676002)(2906002)(8936002)(83380400001)(38100700002)(26005)(5660300002)(44832011)(82960400001)(107886003)(478600001)(6506007)(6666004)(6486002)(6512007)(41300700001)(66476007)(6636002)(66946007)(86362001)(66556008)(316002)(53546011)(54906003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?hxhAfno3PglZ64Vs6kd1XI0FZRaKcmnkc7uD6/Ubf1mCGeMoNN7Ih1YYsNBd?=
 =?us-ascii?Q?RWfe/zF8hiBlo9v+HC5q+f9jauo4t9HXFa38t/m9utz0F1pBsoqInZAOOtTH?=
 =?us-ascii?Q?ES1MjZsojCDwLxn/acvAiw/IHHfGSbJkviKVMM0u1UHs2uX6h8bSIbgun14m?=
 =?us-ascii?Q?b0Ks/3mz6S01XXlOk0smF1Q2rUgaPrCfUqF6AEFTCZ+XKBSesFDIId2YfnR6?=
 =?us-ascii?Q?4q+igu/+1xeTdDGWC0zD6NxmA27IW7nfE9V80jb7JdAhzoKmpt43pp0oo/EI?=
 =?us-ascii?Q?B010TfvNjgPWLw6WeDJ2bLcg9sdqSML/pVlF0f6gzj8KNyJOMvSA/OT8m8Im?=
 =?us-ascii?Q?xbgDEhei4N5HNmIyth5NxEfPCO/1ROVLU6XJQw+I+A5Kf8JsijtZ9rs9BJgZ?=
 =?us-ascii?Q?lPblIUDJuxV3yiI21gTBgOAQ9PQtlw0DqKg1NJBrrJtrrhKp632Ei/mtK2N8?=
 =?us-ascii?Q?I36t7lJoFAEq5/lmts1WfRFmnZbxO+EP387SFZoHm3woUfl6uwSAhqPAkwxf?=
 =?us-ascii?Q?0wUZ7zHS8irmJA+lY/f0rmhZAbnWoUXIsSaKTbfInVgY7ezlkKn5anQP/i/S?=
 =?us-ascii?Q?3g1bNnaSURCBEqjWG+nM7MbX9a3Gtc41/ns/o4qDKuH9jZm+5zoH3xyRFVB0?=
 =?us-ascii?Q?pLv7J52qvhKbR439+PS4mXzZd3CX1lu6L3rpwnJzM78KaLM8H81BkHbQFT1G?=
 =?us-ascii?Q?KxblO6Twh8SyWqxAjAheynaxXRqiHapaOmc9JWbr3aXIGpuouhBMYSzyi8fU?=
 =?us-ascii?Q?Q/FOfTDMuRsaN+a6EliYV0THibhzkxbMT5TYUaD1Ff98giuWu0aFuhbxpU6h?=
 =?us-ascii?Q?6B+7114goiROICAjezcZyCCcDM3RoXR3Z8VCybtevMtahgWrsK9OktfADlVR?=
 =?us-ascii?Q?5HVoqDOhAR3scRSyGyjIhjN0tOHBnmjOUH6M9sI45cC/SkZqef8TuwFSKwiS?=
 =?us-ascii?Q?bJyxh3dvU8rg2p5taLXRg+MZbh2gtSDNZ4rVwjbaI6lshbgFwgSIahuf182U?=
 =?us-ascii?Q?tukr5/YWCA537Ejh/MCxRmzOuslvfkDZyu05Jwgx572Slxa52VRSsMDgpE/l?=
 =?us-ascii?Q?p5FZyVQnSMoTrcdCZ/a/kISVVHjzvOHduIUF/qwuJorhdZiWYVyqMRJD0Uh7?=
 =?us-ascii?Q?n4Y+0nhR1rn5tOdXEjK1ejJ7HvoxT1jwm1RlQXwWMGDIoXGaL420CJ7QC0mD?=
 =?us-ascii?Q?mZbSdxEK3Z+DdeTYQpiOxjrsDQlB2x6Hi3H6Bs9Oj2AK/NQpqezJ7cNcPabl?=
 =?us-ascii?Q?lpizmXDmG3WQqXdRkX32DpNBlMugpKte5t1geO3R+6vPfCoVmBQ3RmDiowNs?=
 =?us-ascii?Q?Xy3khV8uIarcFsnXfO1rNPA6BG5oApsuDzdZKsEgNhCtWTp4gW5tBvINq4YE?=
 =?us-ascii?Q?/WYWTQ/0ISlHDUZq+z57NpkYMTO2fYtZFHZQxSMSvNRSDUfMoCumoOO07XOF?=
 =?us-ascii?Q?skzz0BGrYXKN6qsgsuT8Tv7wpO+Iv0DAP1xg4UgEgL2qE+WSe6EJJswX9xha?=
 =?us-ascii?Q?3eYRPSpaTiIXnAvItR1eyAVJ+MJIe6R44jNxGZO0nSEjuvAW5MDn0D74cI8k?=
 =?us-ascii?Q?dTXyNPLm9FQrsS20VxXkyTmA3++4tvmPaV7DhidlkEvi72fZlyah9Douta8F?=
 =?us-ascii?Q?Tg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0eaf9d44-66b9-4ca7-51ff-08dc0bb34901
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jan 2024 16:53:03.4598 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WNQ1JC5YTjhDkfUVDyu2B616bdJeNh6LLAvlN8PayPRJvlebW8lcrxeQYAjwv1ABLHxTilXQ4yt4D5NBHJDIxw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB5801
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Sat, Dec 30, 2023 at 12:36:30AM +0100, Michal Wajdeczko wrote:
> 
> 
> On 29.12.2023 05:35, Matthew Brost wrote:
> > The Guc CT has more than enabled / disables states rather it has 4. The
> > 4 states are not initialized, disabled, drop messages, and enabled.
> 
> "drop messages" sounds strange as state name, maybe "stopped" ?
> 

Sure.

> > Change the code to reflect this. These states will enable proper return
> > codes from functions and therefore enable proper error messages.
> > 
> > Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> > Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_guc.c          |  4 +-
> >  drivers/gpu/drm/xe/xe_guc_ct.c       | 55 ++++++++++++++++++++--------
> >  drivers/gpu/drm/xe/xe_guc_ct.h       |  8 +++-
> >  drivers/gpu/drm/xe/xe_guc_ct_types.h | 18 ++++++++-
> >  4 files changed, 64 insertions(+), 21 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> > index 811e8b201270..088f7b01d761 100644
> > --- a/drivers/gpu/drm/xe/xe_guc.c
> > +++ b/drivers/gpu/drm/xe/xe_guc.c
> > @@ -651,7 +651,7 @@ int xe_guc_mmio_send_recv(struct xe_guc *guc, const u32 *request,
> >  
> >  	BUILD_BUG_ON(VF_SW_FLAG_COUNT != MED_VF_SW_FLAG_COUNT);
> >  
> > -	xe_assert(xe, !guc->ct.enabled);
> > +	xe_assert(xe, !xe_guc_ct_enabled(&guc->ct));
> >  	xe_assert(xe, len);
> >  	xe_assert(xe, len <= VF_SW_FLAG_COUNT);
> >  	xe_assert(xe, len <= MED_VF_SW_FLAG_COUNT);
> > @@ -833,7 +833,7 @@ int xe_guc_stop(struct xe_guc *guc)
> >  {
> >  	int ret;
> >  
> > -	xe_guc_ct_disable(&guc->ct);
> > +	xe_guc_ct_drop_messages(&guc->ct);
> >  
> >  	ret = xe_guc_submit_stop(guc);
> >  	if (ret)
> > diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> > index 4cde93c18a2d..8c91d189d859 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> > @@ -279,12 +279,25 @@ static int guc_ct_control_toggle(struct xe_guc_ct *ct, bool enable)
> >  	return ret > 0 ? -EPROTO : ret;
> >  }
> >  
> > +static void xe_guc_ct_set_state(struct xe_guc_ct *ct,
> 
> nit: for static functions this "xe_" prefix is not needed
> 

I don't know if we follow that style in Xe, I think the naming is fine.

> > +				enum xe_guc_ct_state state)
> > +{
> > +	mutex_lock(&ct->lock);		/* Serialise dequeue_one_g2h() */
> > +	spin_lock_irq(&ct->fast_lock);	/* Serialise CT fast-path */
> 
> maybe instead of putting ad-hoc comments we should add bigger
> documentation for lock/fast_lock usage and dependencies?
>

This is a copy / paste from existing code. Perhaps this can be done in a
different patch / follow up.
 
> > +
> > +	ct->g2h_outstanding = 0;
> > +	ct->state = state;
> > +
> > +	spin_unlock_irq(&ct->fast_lock);
> > +	mutex_unlock(&ct->lock);
> > +}
> > +
> >  int xe_guc_ct_enable(struct xe_guc_ct *ct)
> >  {
> >  	struct xe_device *xe = ct_to_xe(ct);
> >  	int err;
> >  
> > -	xe_assert(xe, !ct->enabled);
> > +	xe_assert(xe, !xe_guc_ct_enabled(ct));
> >  
> >  	guc_ct_ctb_h2g_init(xe, &ct->ctbs.h2g, &ct->bo->vmap);
> >  	guc_ct_ctb_g2h_init(xe, &ct->ctbs.g2h, &ct->bo->vmap);
> > @@ -301,12 +314,7 @@ int xe_guc_ct_enable(struct xe_guc_ct *ct)
> >  	if (err)
> >  		goto err_out;
> >  
> > -	mutex_lock(&ct->lock);
> > -	spin_lock_irq(&ct->fast_lock);
> > -	ct->g2h_outstanding = 0;
> > -	ct->enabled = true;
> > -	spin_unlock_irq(&ct->fast_lock);
> > -	mutex_unlock(&ct->lock);
> > +	xe_guc_ct_set_state(ct, XE_GUC_CT_STATE_ENABLED);
> >  
> >  	smp_mb();
> >  	wake_up_all(&ct->wq);
> > @@ -322,12 +330,12 @@ int xe_guc_ct_enable(struct xe_guc_ct *ct)
> >  
> >  void xe_guc_ct_disable(struct xe_guc_ct *ct)
> >  {
> > -	mutex_lock(&ct->lock); /* Serialise dequeue_one_g2h() */
> > -	spin_lock_irq(&ct->fast_lock); /* Serialise CT fast-path */
> > -	ct->enabled = false; /* Finally disable CT communication */
> > -	spin_unlock_irq(&ct->fast_lock);
> > -	mutex_unlock(&ct->lock);
> > +	xe_guc_ct_set_state(ct, XE_GUC_CT_STATE_DISABLED);
> > +}
> >  
> > +void xe_guc_ct_drop_messages(struct xe_guc_ct *ct)
> > +{
> > +	xe_guc_ct_set_state(ct, XE_GUC_CT_STATE_DROP_MESSAGES);
> >  	xa_destroy(&ct->fence_lookup);
> >  }
> >  
> > @@ -514,11 +522,19 @@ static int __guc_ct_send_locked(struct xe_guc_ct *ct, const u32 *action,
> >  		goto out;
> >  	}
> >  
> > -	if (unlikely(!ct->enabled)) {
> > +	if (ct->state == XE_GUC_CT_STATE_NOT_INITIALIZED ||
> > +	    ct->state == XE_GUC_CT_STATE_DISABLED) {
> >  		ret = -ENODEV;
> >  		goto out;
> >  	}
> >  
> > +	if (ct->state == XE_GUC_CT_STATE_DROP_MESSAGES) {
> > +		ret = -ECANCELED;
> > +		goto out;
> > +	}
> > +
> > +	xe_assert(xe, xe_guc_ct_enabled(ct));
> > +
> >  	if (g2h_fence) {
> >  		g2h_len = GUC_CTB_HXG_MSG_MAX_LEN;
> >  		num_g2h = 1;
> > @@ -706,7 +722,8 @@ static bool retry_failure(struct xe_guc_ct *ct, int ret)
> >  		return false;
> >  
> >  #define ct_alive(ct)	\
> > -	(ct->enabled && !ct->ctbs.h2g.info.broken && !ct->ctbs.g2h.info.broken)
> > +	(xe_guc_ct_enabled(ct) && !ct->ctbs.h2g.info.broken && \
> > +	 !ct->ctbs.g2h.info.broken)
> >  	if (!wait_event_interruptible_timeout(ct->wq, ct_alive(ct),  HZ * 5))
> >  		return false;
> >  #undef ct_alive
> > @@ -987,12 +1004,18 @@ static int g2h_read(struct xe_guc_ct *ct, u32 *msg, bool fast_path)
> >  
> >  	lockdep_assert_held(&ct->fast_lock);
> >  
> > -	if (!ct->enabled)
> > +	if (ct->state == XE_GUC_CT_STATE_NOT_INITIALIZED ||
> > +	    ct->state == XE_GUC_CT_STATE_DISABLED)
> >  		return -ENODEV;
> >  
> > +	if (ct->state == XE_GUC_CT_STATE_DROP_MESSAGES)
> > +		return -ECANCELED;
> > +
> >  	if (g2h->info.broken)
> >  		return -EPIPE;
> >  
> > +	xe_assert(xe, xe_guc_ct_enabled(ct));
> > +
> >  	/* Calculate DW available to read */
> >  	tail = desc_read(xe, g2h, tail);
> >  	avail = tail - g2h->info.head;
> > @@ -1291,7 +1314,7 @@ struct xe_guc_ct_snapshot *xe_guc_ct_snapshot_capture(struct xe_guc_ct *ct,
> >  		return NULL;
> >  	}
> >  
> > -	if (ct->enabled) {
> > +	if (xe_guc_ct_enabled(ct)) {
> >  		snapshot->ct_enabled = true;
> >  		snapshot->g2h_outstanding = READ_ONCE(ct->g2h_outstanding);
> >  		guc_ctb_snapshot_capture(xe, &ct->ctbs.h2g,
> > diff --git a/drivers/gpu/drm/xe/xe_guc_ct.h b/drivers/gpu/drm/xe/xe_guc_ct.h
> > index f15f8a4857e0..214a6a357519 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_ct.h
> > +++ b/drivers/gpu/drm/xe/xe_guc_ct.h
> > @@ -13,6 +13,7 @@ struct drm_printer;
> >  int xe_guc_ct_init(struct xe_guc_ct *ct);
> >  int xe_guc_ct_enable(struct xe_guc_ct *ct);
> >  void xe_guc_ct_disable(struct xe_guc_ct *ct);
> > +void xe_guc_ct_drop_messages(struct xe_guc_ct *ct);
> >  void xe_guc_ct_fast_path(struct xe_guc_ct *ct);
> >  
> >  struct xe_guc_ct_snapshot *
> > @@ -22,10 +23,15 @@ void xe_guc_ct_snapshot_print(struct xe_guc_ct_snapshot *snapshot,
> >  void xe_guc_ct_snapshot_free(struct xe_guc_ct_snapshot *snapshot);
> >  void xe_guc_ct_print(struct xe_guc_ct *ct, struct drm_printer *p, bool atomic);
> >  
> > +static inline bool xe_guc_ct_enabled(struct xe_guc_ct *ct)
> > +{
> > +	return ct->state == XE_GUC_CT_STATE_ENABLED;
> > +}
> > +
> >  static inline void xe_guc_ct_irq_handler(struct xe_guc_ct *ct)
> >  {
> >  	wake_up_all(&ct->wq);
> > -	if (ct->enabled)
> > +	if (xe_guc_ct_enabled(ct))
> >  		queue_work(system_unbound_wq, &ct->g2h_worker);
> >  	xe_guc_ct_fast_path(ct);
> 
> if we are not-enabled, shouldn't we treat all G2H messages in the same
> way? why do we continue with fast_path here?
>

Yes, that seems to be an existing bug. Let me fix that first in a
seperate patch.
 
> >  }
> > diff --git a/drivers/gpu/drm/xe/xe_guc_ct_types.h b/drivers/gpu/drm/xe/xe_guc_ct_types.h
> > index d814d4ee3fc6..f74d38c8f9df 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_ct_types.h
> > +++ b/drivers/gpu/drm/xe/xe_guc_ct_types.h
> > @@ -72,6 +72,20 @@ struct xe_guc_ct_snapshot {
> >  	struct guc_ctb_snapshot h2g;
> >  };
> >  
> > +/**
> > + * enum xe_guc_ct_state - CT state
> > + * @XE_GUC_CT_STATE_NOT_INITIALIZED: CT suspended, messages not expected in this state
> 
> "suspended" seems wrong.
> 
> IIUC this is a default implicit state where CT was not yet initialized,
> not a state where CT was _temporary_ suspended.
> 

This comment is wrong, noticed this after sending it. Will fix.

> > + * @XE_GUC_CT_STATE_DISABLED: CT disabled, messages not expected in this state
> > + * @XE_GUC_CT_STATE_DROP_MESSAGES: CT drops messages without errors
> 
> maybe I'm missing something, but shouldn't we just stop processing any
> incoming messages and reject sending new one in this state ?
> 
> "drops messages" suggests that we are reading G2H CTB *and* then
> dropping them without proper processing
>

So s/XE_GUC_CT_STATE_DROP_MESSAGES/XE_GUC_CT_STATE_STOPPED/g and new
comment (stop sending / processing messages without errors?)
 
> > + * @XE_GUC_CT_STATE_ENABLED: CT enabled, messages sent / recieved in this state
> 
> typo

Where is the typo?

> 
> > + */
> > +enum xe_guc_ct_state {
> > +	XE_GUC_CT_STATE_NOT_INITIALIZED = 0,
> 
> hmm, maybe we don't need this state at all, since CT initialization
> failure is fatal and we will abort driver probe
> 
> maybe all we need is to explicitly set XE_GUC_CT_STATE_DISABLED(1) in
> xe_guc_ct_init() and use xe_assert(ct.state) to catch missing
> initialization ?
>

Let's do that. Will change.

Matt
 
> > +	XE_GUC_CT_STATE_DISABLED,
> > +	XE_GUC_CT_STATE_DROP_MESSAGES,
> > +	XE_GUC_CT_STATE_ENABLED,
> > +};
> > +
> >  /**
> >   * struct xe_guc_ct - GuC command transport (CT) layer
> >   *
> > @@ -96,8 +110,8 @@ struct xe_guc_ct {
> >  	u32 g2h_outstanding;
> >  	/** @g2h_worker: worker to process G2H messages */
> >  	struct work_struct g2h_worker;
> > -	/** @enabled: CT enabled */
> > -	bool enabled;
> > +	/** @state: CT state */
> > +	enum xe_guc_ct_state state;
> >  	/** @fence_seqno: G2H fence seqno - 16 bits used by CT */
> >  	u32 fence_seqno;
> >  	/** @fence_lookup: G2H fence lookup */
