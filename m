Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB655C6FD18
	for <intel-xe@archiver.kernel.org>; Wed, 19 Apr 2023 19:49:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93DE010E1ED;
	Wed, 19 Apr 2023 19:49:57 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09F2D10E1ED
 for <intel-xe@lists.freedesktop.org>; Wed, 19 Apr 2023 19:49:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681933795; x=1713469795;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=T6/FEzDGbgb4fnZ967lg2QI2xTsVfZn2iGG4GboLGao=;
 b=mPL5focW120pf9nmbq8UIqf4zxwX7svQEtTuytaYyfLOIYfDWfSKzoyP
 QFNv0eWLPllm2yjsEtIDAHsX+7eG9D1UY6KrGzXo4gKXmMbvTMHzRqp6d
 3/QC4BSrusVPSxdE/e/gefYUtOYas/qo84leXaXnjFQ6wF1oM1dR2mhRZ
 yYK+ZEenoY2/cvWVIA/kCAfpSYvzQZaRJIKb/0rmo1G/8Bvk7uhtMS68T
 Ery99ad6KV+SsgZzwnSrHw5LFNaKWdgWvcTnF9v/bxSj4T8DNGfIMBSbL
 sNc7ZmAbowhJyfgEbDCI5DAmAJhxZYL1b++lm0E/5jTOi7GCxSaxjP6Ac g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="410779704"
X-IronPort-AV: E=Sophos;i="5.99,210,1677571200"; d="scan'208";a="410779704"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2023 12:49:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="835441451"
X-IronPort-AV: E=Sophos;i="5.99,210,1677571200"; d="scan'208";a="835441451"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga001.fm.intel.com with ESMTP; 19 Apr 2023 12:49:53 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 19 Apr 2023 12:49:53 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 19 Apr 2023 12:49:52 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Wed, 19 Apr 2023 12:49:52 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.102)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Wed, 19 Apr 2023 12:49:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gs513K0g3G+KurdO8Iq41qFKtpAWDZgs6Xu0/VCDn8KgiT6Oe8KufcctB8js1fmvaDqWXVrftpcaKIeuFV27w04BbpJ/qBhTWLeZadcY5DcYmTIJ80myNPJUM/2Y63Q+QMgrBXTeeYXpw1ZO1HE0tqIsKpAC7W1EKCVxMPTYj/Aw8niD/2bW1PmommBDTnd3uBqi8r5TnnfmsSckwP2Xg61yF/by2pNVbP+Et6a5vcCl7DMHMro2TQJpORn3bNHhXryVBNRVum4OTaI64XOt7OgKqzZp1XaoJp3nszMazAOT0dU9bN9QR+a340An9RyjLiu9RSs+0a5ax1WKmauFFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IsatazJMFLvhrN1Drj0262RGOPklKq7GVYgeYia037c=;
 b=eB/63Fok8NhVNBoU8SwL9ROzLY/L4erMSjix1q6d/5gWc3ve0fK0cAzgEmzHAuNqRjBPWTuNHBlcnUMWXzXaaYzV0uT9JQ+L4CPnpb08cYfT9JkF31X7++DvsOnKcX7NWxAQbtN9MHx80BxjiS0PrVNX3Ta4S2HK2+QiIEg8qPXGnHZBvaMDQphZqm+D2768snKhtGv3DIEmQK1KVpPERWBCqjPlmolpMWGeibmrVLKlgs1oJ1STORilfzalMjEiVdvbKVDBN8UTgeU4bNCviB+AVWsDyMRoA0vXlqZhtZ7iEU1JS78AzstzGJ8L2RUlBu2iFx+oGQjQSDTGkh3iXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by DS7PR11MB7691.namprd11.prod.outlook.com (2603:10b6:8:e4::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.45; Wed, 19 Apr
 2023 19:49:51 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::f7ec:aae9:1e7b:e004]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::f7ec:aae9:1e7b:e004%5]) with mapi id 15.20.6298.030; Wed, 19 Apr 2023
 19:49:51 +0000
Date: Wed, 19 Apr 2023 15:49:47 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Message-ID: <ZEBF25ZuOMEigkxt@intel.com>
References: <20230419123947.543175-1-jani.nikula@intel.com>
 <20230419123947.543175-3-jani.nikula@intel.com>
 <ZEBCZ8ZhecK0bO4z@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ZEBCZ8ZhecK0bO4z@intel.com>
X-ClientProxiedBy: BYAPR03CA0025.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::38) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|DS7PR11MB7691:EE_
X-MS-Office365-Filtering-Correlation-Id: f83fa560-acad-4ced-13ae-08db410f3d3a
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Vny2v3n7uJ1NtANRC0U4DT53zNuD9pexb0yaFebxBfTtEZdbhLT2KxDjvfB9hT2TBFbjmD8cwNs4p17tkMaAx7Mvgbs4Mq+hNW2ZI3eMNyULpSgu0AJd9g4fG92JKPMIN4aFjILL9aH53zyMQggcBuOPjAGkSZa0hUr+Txy1qOmNu8TzXYlDZ43t/HPKS7HNLC3So6y1ohfkkPDtFESmI8XGmzf4Zs4FXPkwmysbVv9lW9HjRrlIGOvXLsxRrWQzVYoJ+idndxHkduOqlKjv+CbLOZwsup8xz5GyHbc8l0GCPYED+Vdx/Y6OFx4HyOkiKtBEzJLZkg9zo8S3/wHUDr4GlqWDklsdb/Y5bb0YFXKVgDYGO/j1MzDYIUgUw43Ws6c/NtwHM9pYbcWqga/jyfjAXj05s+UXx2zprAqEG6VBoJd6OwXAJ5KQdCrzkAsGfKvrIPLg5lvu9XyBzeUCFR1JNleSXKqkOar02O3ojyoibw/ZweqLGfkiNoG4du/6TYyB72OdEKIHOqL/4ZmE6g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(376002)(39860400002)(346002)(396003)(366004)(451199021)(36756003)(186003)(37006003)(4326008)(316002)(66556008)(6636002)(966005)(66946007)(66476007)(6486002)(478600001)(6666004)(8936002)(8676002)(5660300002)(6862004)(41300700001)(44832011)(82960400001)(2906002)(86362001)(38100700002)(2616005)(26005)(6512007)(6506007)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?eMTqMOIFDXXuS8FnZq7SNO3N/Crx0NsFoCIebOuOVWNnap68Gd6oczT8V8qf?=
 =?us-ascii?Q?H64++s4QoLDEW66jY6sQyQexNyRtjWCY+VXrsN6mir1S+jGRUQrAbvgowPL3?=
 =?us-ascii?Q?1GdWhkXIZ3m8rYEkPWlWDkh1ZGTpvn/GyJbvEB4xAQZVkDtp8eWbLlfPpVhC?=
 =?us-ascii?Q?taOCoE7j8TqbkR0THRO5lPybXJTogBj95FjcHFR8YthjAQgIOfLPYjDfHrBy?=
 =?us-ascii?Q?83ECRReMQI97jPhu7luW8oOANUZAqdgFX7RnNccsff2sWjujqDRmS3dUjLte?=
 =?us-ascii?Q?x8gk60W7k4SuGWIu30rkAc0u3Zr2kDgKFONd4ZLLbTR6bFsJriTbB4DIGNdv?=
 =?us-ascii?Q?FS9FqUXLZEK8pCc6m/2U01KPvwGc3jKR4J8Wug2hjkFVZSkMsEShLbuNaikU?=
 =?us-ascii?Q?0dwvSEaJJ1Q9bGF1uNj2LU/9DCfG1tDYkdX3Q7pEAaPQ98962bffs9FNjuxI?=
 =?us-ascii?Q?4SLSedwBVleHTGwA9bszo7DsJWqm+W2Zs0c6rlJtFLrfq/lV+qYQFICJNHyI?=
 =?us-ascii?Q?pBRtBIljMN6y6HZOQwlYA/RkKjBFUM9j91dbCqc/w9Vt6EQdDk/2FpL7Aj3f?=
 =?us-ascii?Q?Mp8yvPwUH+Il2E74TSAmXFaOnbNYPQR5pkJQVyIrMlKz3G/1TeE/No8C7X9q?=
 =?us-ascii?Q?Qmk+KA/Ibg+KiGruuHWSRFmrpBkr7iNLhkQGflbAqvtm+EqUBGtxz0Dt+1+f?=
 =?us-ascii?Q?Jdcc/X2K+V9N3ottaoifq9hony5UnDfWGW7AvLpDZbY4T0BWa7e0UUnCOKIk?=
 =?us-ascii?Q?6G8tz0s6zsjq+HjNOXf+iD5yLVM7qhLT6fMtTvt7qAHIqa8g338+lv6LwrxX?=
 =?us-ascii?Q?jZymnU0XiNBtrFOO60hrdvG5lY8wYLyzz+8/ycSKeyLOGQZS7VdOGwNrpXfh?=
 =?us-ascii?Q?ZVC4ESfQVM5VUpwm6vQun4wAAYAD7iUcsLINWX1meNzvXr1SK2/OqtjyFgsq?=
 =?us-ascii?Q?5ocW1HfrtMxhkdzcsR1RuuyYUBSiWCFEZruFh8zJWpgYVqjStil5Hpo3/pHi?=
 =?us-ascii?Q?c8QnBtash0hCAQ+hqhC1sTJPuG51FeMXTnM2AAKv8J6tcqNfFCN91xbLJdhZ?=
 =?us-ascii?Q?Ns0+EoYTZ8IcTWKwpLtFE4xKkszaQn9U1WnDtFzjDPBdCk73gPsQCqP5fYNf?=
 =?us-ascii?Q?DcM7fRi0aLritRxf0rXYHb4hvSbLEfrCDsScD8wCZsh5wSZcO0lq+p5J4Imq?=
 =?us-ascii?Q?yElFJ3PMnRZqSnW+VoR0wHVJMryQL2klRyj21rk3tzbMTDriP99EHRFT9QhZ?=
 =?us-ascii?Q?sqaY+JCaZvGaxVrtXIVnxiRxXH3D5rA+LP3l9pl8hLYY7cn5HQZrA7HKjAdG?=
 =?us-ascii?Q?9hMCVF0W4flqmsdUnSfhS4eZ71XM5TwITNjC1HuPVERkEtdV0b5yEMgs7njt?=
 =?us-ascii?Q?p7z6/z1FrUSqbzpyybBaf2T7GQc1MvdUbH4nugXsPozcYVIkD7qRmaP3b+2V?=
 =?us-ascii?Q?Sy8HB4IzyyCtxrq6BwXnkHMdLHAstBPs3o/uk1Fwpp3Y3D4T3RfmAxfeH4s+?=
 =?us-ascii?Q?6zNPLI6zemUqxWmtXB3AuOMsIFyN8AXhIyJtPr/IGOTlaObNpDDqpEImqyi8?=
 =?us-ascii?Q?5cH4dUSIJldat025H6mfw0SkyRfdMKCqux5oraYpfYv1rgds1zEuvwtfjbbO?=
 =?us-ascii?Q?+g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f83fa560-acad-4ced-13ae-08db410f3d3a
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2023 19:49:51.3639 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5WCnDQ5g+8U+PWoXBSbiCkGCjVoXgvxHbG8vI0KNBosN8g83VYRyPh2CIcE4069OmRiunRJK8fp3m/LWAm3r2w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7691
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 2/9] drm/i915/wm: remove stale and unused
 ilk_wm_max_level() declaration
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
Cc: lucas.demarchi@intel.com, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, Apr 19, 2023 at 03:35:03PM -0400, Rodrigo Vivi wrote:
> On Wed, Apr 19, 2023 at 03:39:40PM +0300, Jani Nikula wrote:
> > The declaration was removed earlier, but got accidentally resurrected in
> > i915xx_wm.[ch] refactoring. Remove harder.
> 
> Should this be a fixup? or a patch to i915? I got confused on this...

nevermind... I just noticed you also sent it there and Ville reviewed.

> 
> > 
> > Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> > Link: https://patchwork.freedesktop.org/patch/msgid/20230419115449.422214-1-jani.nikula@intel.com
> > ---
> >  drivers/gpu/drm/i915/display/i9xx_wm.h | 1 -
> >  1 file changed, 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/i915/display/i9xx_wm.h b/drivers/gpu/drm/i915/display/i9xx_wm.h
> > index a7875cbcd05a..b87ae369685a 100644
> > --- a/drivers/gpu/drm/i915/display/i9xx_wm.h
> > +++ b/drivers/gpu/drm/i915/display/i9xx_wm.h
> > @@ -12,7 +12,6 @@ struct drm_i915_private;
> >  struct intel_crtc_state;
> >  struct intel_plane_state;
> >  
> > -int ilk_wm_max_level(const struct drm_i915_private *i915);
> >  bool ilk_disable_lp_wm(struct drm_i915_private *i915);
> >  void ilk_wm_sanitize(struct drm_i915_private *i915);
> >  bool intel_set_memory_cxsr(struct drm_i915_private *i915, bool enable);
> > -- 
> > 2.39.2
> > 
