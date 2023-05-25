Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 448D4C77B7A
	for <intel-xe@archiver.kernel.org>; Thu, 25 May 2023 15:01:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F132E10E16E;
	Thu, 25 May 2023 15:01:18 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F94F10E16E
 for <intel-xe@lists.freedesktop.org>; Thu, 25 May 2023 15:01:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685026876; x=1716562876;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=by32TYv69qDGuCxM9xGzNu+jTfx5vclGDJEJIjzgmiI=;
 b=a+0ovgKI+IKLTuaoHXFDrFbpaWD1baMYNAkLAmFtFcsEEYo7WXLmWQWL
 Aq20ma3xczxqdnhqsDXi5HyPpearcEZhIxk8ieMkt0CuKNoj5tc2zC+Ti
 fWlkuMlEVwe2BI80ZRrohmDBLWRXisXCwidQvUeyCX1t1CcQKV/NlmxNA
 bj8SD0530FEmTfxCMbd+xZCOH+COtA5FSI7qd6yRm5BIr6moytJAMS2hM
 oK3+zHtjMDuRi6v8ZH9a5N8ii5blXd4FGmf2R43/ari7hmTmdLRFo5zig
 KXv2d5QetLMUEi476SPQmj75O2RyTCgVARDW7p6uAl3EP5y0RhZD+dIxH Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10721"; a="440265339"
X-IronPort-AV: E=Sophos;i="6.00,191,1681196400"; d="scan'208";a="440265339"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2023 08:00:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10721"; a="704828717"
X-IronPort-AV: E=Sophos;i="6.00,191,1681196400"; d="scan'208";a="704828717"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga002.jf.intel.com with ESMTP; 25 May 2023 08:00:57 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 25 May 2023 08:00:56 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 25 May 2023 08:00:56 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.177)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 25 May 2023 08:00:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ETWEwOHNDTW21ewbCc5oOND90L3lle1OxFhgqPhGjFEJldIMZtVqGodEoJSs72uZCpSMafWIWI3b3+JcXrFxtedWlmdTU4SwAXnvt1zu/kLsuSckwkIkwYOaUUPHgEf0kM2UBghaTTRw1dc0fldtJ2dKqhrBc0NIafrPwTr2l3EszKlI18PKcr6HjPW6BlsHHD8941coezpkgIR84gASln2fuZXW+OSWftIzwmKZRVKsJeM46NRgcmqg0VXWDltZ10VqaH9WDgjgco9gFQ5p8mX0Gkk9ZDTC9BG86/2WGFevQqNK09kgJcNfLltkUBKy/gJ66j51lOIFAbidCU6lpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KH2PDwI+m66DdaVIlT4AstwEwb7KPApEf48QKHA4veY=;
 b=NKsmHUoOf+Q5udE7dH0wKGb8IxTVl42eq8u+m0dGpQqM7DlQ/suh0he9YSseSrNAwNSlmfPwIo25/kcBoCuGcSB0rY1sq0mOsmxPGgPMytNZztrgLSEDVBQ/rnmyidcR+apN3ZklG8/ymQgbjmrg+SFE28gwxMZfxxYS6xj3p/06yW+JcYFbakFRNZjFnfdbuFbAo/aRXveRFfl/Tn3AZg6Dm9DwSd1s8vVWuvKnPoTRm9Vtmbl73zTpnQmp4kFx+r2B3SOd2iymrBfWx4JjGSQioXRCGpjwn+o6t5alPbAQkMuy+HREjd8D1sw3L5Hu9tzP4WJPBdLl9JbMtm8oBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 IA0PR11MB7953.namprd11.prod.outlook.com (2603:10b6:208:40d::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.15; Thu, 25 May
 2023 15:00:54 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::9f98:8f3c:a608:8396]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::9f98:8f3c:a608:8396%3]) with mapi id 15.20.6433.016; Thu, 25 May 2023
 15:00:54 +0000
Date: Thu, 25 May 2023 08:00:51 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: "Kalvala, Haridhar" <haridhar.kalvala@intel.com>
Message-ID: <20230525150051.GS10045@mdroper-desk1.amr.corp.intel.com>
References: <20230524192635.673293-1-matthew.d.roper@intel.com>
 <f6192c01-5aa0-632a-5833-d4cccab949cf@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <f6192c01-5aa0-632a-5833-d4cccab949cf@intel.com>
X-ClientProxiedBy: SJ0PR13CA0083.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::28) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|IA0PR11MB7953:EE_
X-MS-Office365-Filtering-Correlation-Id: 6c33f423-d50d-41e4-1bf6-08db5d30d653
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iiDoRIp/9uFWiXnUgl0wbSFwubIZW0xw4kv2pFmOxZ164dR9RezozUKwkQLtBH1YDePVoQtJ0I6/YeFbwusIC+S2nuVc6qbaHX89cJEloU2hA83TmNdHxbXGJrtQRXU+Ald7Wg0DtYSP8tfKnk+uZ85KDNmaaDWGlBHHxiv00igXCABb0AHq0YBTkX4U2ANBpvPXdS1xokY62ceYqgsjFd6IzngkTMWKHMQPoDRilPtwhg8RqAys3VlOQpaIVHDbfdmO03sKKJumvRZ8liHHeu8LQPZSJtBSUbZoReRj4x03VZauUGDVxWoBlgjn64AlbE0tjAmB3gymWAnwrCqgqEJyLPMq6JC7VxjkLpGMOzmcDCIYCaaVI/h+9dohxv7it+4zFALpLfEkB3Jp0IbPMBXiIelB9rkuEEUhdzpN7ov0/KMEGtlJy611vGY2FN37gjibbYBtxQ5LF8MwAG6D7SKlI/eOY9UCkQ6uzquoAhqzzQEQ9TPOhhGRmO+qD5h2C/tVhHhBZk7XuROPZnO+8PfgjarXdbH6o2M2/JElUmHepBD9YXgZm2KmFCWxEt4H
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(346002)(39860400002)(396003)(376002)(366004)(136003)(451199021)(5660300002)(8676002)(6862004)(8936002)(2906002)(186003)(33656002)(83380400001)(86362001)(38100700002)(82960400001)(6512007)(26005)(6506007)(53546011)(1076003)(316002)(66476007)(66946007)(4326008)(6636002)(6666004)(66556008)(478600001)(6486002)(41300700001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?MdD56K+aym3Dr7mjelTzRRRQn6BIRizGvc1AtJkxTAtnIvBh2Ts+IMcIcr99?=
 =?us-ascii?Q?9ZUSWlgnlee1I5HTZ2fKyn5HcHHe2msdtEpnRAy6YMwyhbyJz6e9fE/pO7IP?=
 =?us-ascii?Q?K42nfoqrvmLjQaVKTdEvXCx8ZXjla5RLX06rsrrdvzwQjklsOT5th8G1cIaZ?=
 =?us-ascii?Q?ze3CsVLaKja+tmeEbZz0a7miYpMdC213CabS7nILGGDn+gRwFJwLiAFKS0xI?=
 =?us-ascii?Q?/V3jmbyPThZotc158k4SWNIrxJo6NMwPHGhUjMIBQjW8KI8dgIr0DSidRO++?=
 =?us-ascii?Q?rVT03Frp7pi+NpjxxZahWPF4kPc7I+lvKrU3qI2dw+UtHV3li+/hQFHj9Qg7?=
 =?us-ascii?Q?Du6iaEankVvt6umRpNyaY70yUGIL6WGzLc676C68ZH1FstbfKMgsRK0Ptpzc?=
 =?us-ascii?Q?PRHWiPD6LFxZBeV1ZJkquhVh9NHzosiF+TixaE81yK5Y252laOjExm4M15Ma?=
 =?us-ascii?Q?IDDEyYG7okwFSIXPfUo4MRIReGo71nbIkEPlG3Fcn7/q65h5XJ6xJxcEof0J?=
 =?us-ascii?Q?BgGBAcFwViTlCn7LnwOQSY8lI/RDxNfKSsuDDXrBznWRJIm6+jklO7Y3ox6q?=
 =?us-ascii?Q?dH757VZ/O/U1scAy9p+X1akQs6B0421lAHB9ondIlS5rZlELtfmEUKS62Dfd?=
 =?us-ascii?Q?YQEd5FkgFZvZ7fFWUna9/GeWr6b3agyb+azc3MbECFJ2kAX0MVP4o1OFA/NU?=
 =?us-ascii?Q?VtT1PbV0yBDCFX9iYeabsIC7+neDYD+p0KrYaUUBerOnLCTE79Mf146idY8q?=
 =?us-ascii?Q?VXWYRkLAb3aawMjPi3MlHEygEPRVHbSGWHW7OMXMEnJhMrLViZzWKfvCii2Y?=
 =?us-ascii?Q?Z7/T2BfVdBB0JE8S/EpGgCOL5N1wp9rAuxAT1p0cmw3gO1T1ZoYBTaZKlDCV?=
 =?us-ascii?Q?ulc54+EsxwYrCKaMN9mKiDhpQHOocCQYCwjgj850+8G8NMtlxZrPexv8tHVq?=
 =?us-ascii?Q?KGEdkauVXcVtxhg2m9cwiJKqOi6LOmvPwXzuUTvpnRkdUC361RjZQAF6DMi/?=
 =?us-ascii?Q?8YiUEKWtpZGclnhg+b4CsL1rocqpptv2G+ryuR5YLMESs8VxFxZoGf9L+BVa?=
 =?us-ascii?Q?vej1oMIgIEeXA6hYFPr0S2pfr6npyZQpbHuNvPH45kHgh2zE7KM6OW1iTaLa?=
 =?us-ascii?Q?gqy4XTdM6lhlBFAIPeFhTJOrNAl8r3YoNCoTWWnhEuWGI9pG3mDFqqp1TMjo?=
 =?us-ascii?Q?LEEACDp3/2qD0RckI8cnxT5Yr0rGzB39LR7zr5oxbHle5c8AgknUlEU7nJXS?=
 =?us-ascii?Q?a7p8+nK6nBbad7lOAQMb+f9pxuiS1U7tPp4mBTDxQC6qtzXnjl2yuVpA+efO?=
 =?us-ascii?Q?O9iGbO6vVEcTZUX8/D8/pKoX12DPheQfUykJdaekabk4X4OOBkljrwFmXmTE?=
 =?us-ascii?Q?+/OkW2HUt4Etjv9kTl9KnFkC7tuZYG+uE1HWEG6xCW1vEXdRtSSHJLnr6rdi?=
 =?us-ascii?Q?1dQZTf6UWQK/kTRSY3itlF1hcA4TRj84uTO5QgHeL9vsDe/3yJ94Qb/b52y0?=
 =?us-ascii?Q?5piHeqoThF8axoGsNmkNy5uFgu0WN3MJ0jCGTeAuy+v8Yw3Dwhb00ovo/oKE?=
 =?us-ascii?Q?ox5Eygog9qa6mG/HMaz4lmGBmaOV8ZialHHwRvyANEvNxAir4jte/AEODsVs?=
 =?us-ascii?Q?uw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c33f423-d50d-41e4-1bf6-08db5d30d653
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2023 15:00:54.1178 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IOLcJH2mq6iV5OBbVjtx2ByMq2tQc9Km6+9nsELed9lPwXeDKT6X45ft11VTQZGJi7qH11Ezx47ZNf/HX7NkwMFRFpdz1WTF2YAzhh/vjxA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7953
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe/pvc: Don't try to invalidate AuxCCS
 TLB
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

On Thu, May 25, 2023 at 06:46:03PM +0530, Kalvala, Haridhar wrote:
> 
> On 5/25/2023 12:56 AM, Matt Roper wrote:
> > Generally !has_flatccs implies that a platform has AuxCCS compression
> > and thus needs to invalidate the AuxCCS TLB.  However PVC is a special
> > case because it has no compression of either type (FlatCCS or AuxCCS)
> > so we should avoid writing to non-existent AuxCCS registers.
> 
> Hi Matt,
> 
> Looks good to me.
> 
> Just a query, if their is no compression support, do we need to remove flag
> 
> ".has_flat_ccs" from PVC description structure.

You mean from graphics_xehpc?  That already indicates that flat_ccs is
disabled:

        .has_flat_ccs = 0,

which is correct.  The change here is just to make sure that the driver
doesn't assume that lack of flatccs implies that we have auxccs instead
(on PVC we have neither flatccs nor auxccs).


Matt

> 
> Regards,
> 
> Haridhar Kalvala
> 
> > Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> > ---
> >   drivers/gpu/drm/xe/xe_ring_ops.c | 16 ++++++++++++++--
> >   1 file changed, 14 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c b/drivers/gpu/drm/xe/xe_ring_ops.c
> > index 74c1b5dfbaee..d2fa0b4c8bcc 100644
> > --- a/drivers/gpu/drm/xe/xe_ring_ops.c
> > +++ b/drivers/gpu/drm/xe/xe_ring_ops.c
> > @@ -190,6 +190,18 @@ static void __emit_job_gen12_copy(struct xe_sched_job *job, struct xe_lrc *lrc,
> >   	xe_lrc_write_ring(lrc, dw, i * sizeof(*dw));
> >   }
> > +static bool has_aux_ccs(struct xe_device *xe)
> > +{
> > +	/*
> > +	 * PVC is a special case that has no compression of either type
> > +	 * (FlatCCS or AuxCCS).
> > +	 */
> > +	if (xe->info.platform == XE_PVC)
> > +		return false;
> > +
> > +	return !xe->info.has_flat_ccs;
> > +}
> > +
> >   static void __emit_job_gen12_video(struct xe_sched_job *job, struct xe_lrc *lrc,
> >   				   u64 batch_addr, u32 seqno)
> >   {
> > @@ -202,7 +214,7 @@ static void __emit_job_gen12_video(struct xe_sched_job *job, struct xe_lrc *lrc,
> >   	dw[i++] = preparser_disable(true);
> >   	/* hsdes: 1809175790 */
> > -	if (!xe->info.has_flat_ccs) {
> > +	if (has_aux_ccs(xe)) {
> >   		if (decode)
> >   			i = emit_aux_table_inv(gt, VD0_AUX_NV, dw, i);
> >   		else
> > @@ -248,7 +260,7 @@ static void __emit_job_gen12_render_compute(struct xe_sched_job *job,
> >   	i = emit_pipe_invalidate(mask_flags, dw, i);
> >   	/* hsdes: 1809175790 */
> > -	if (!xe->info.has_flat_ccs)
> > +	if (has_aux_ccs(xe))
> >   		i = emit_aux_table_inv(gt, GFX_CCS_AUX_NV, dw, i);
> >   	dw[i++] = preparser_disable(false);
> 
> -- 
> Regards,
> Haridhar Kalvala
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
