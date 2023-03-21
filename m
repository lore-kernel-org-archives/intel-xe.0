Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00304C6FD1D
	for <intel-xe@archiver.kernel.org>; Tue, 21 Mar 2023 14:36:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D184510E0AC;
	Tue, 21 Mar 2023 14:36:39 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07B4710E0AC
 for <intel-xe@lists.freedesktop.org>; Tue, 21 Mar 2023 14:36:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679409398; x=1710945398;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=pnV2SnZEk/zQoDpp2b7foZEvAZ1dQiP8wS7C5ys+h+Q=;
 b=YvfwVtV1rOm4fF7Tk18rs02AIgb1F7acusSxJLfWuD8kCdKDVoubw4z8
 ao9Kk13fzU8aFiHn+wcR2YKdAdAG3bS1PfWVHHhx3BE/SXenx/qi9uXA/
 tNQK8DYPfOLtDiBF5F0lyE1s1eR5CFvU4xy20yIlBHRfn8F8tvijrR7Og
 Vlc7K3dfYbov4Ea9XNGScczrCcoMv+sTMAGX4MrBYAgBuT4deoYuQ14uC
 1zjDsI0psenZF3G7NFie9St1KEEA9gPrkApJTMUG/KR5lBgCXVRvGi3kG
 TkNLbRM4IGmZRf7edwBZRL9CkxX3ZoM1T6DVs36yPiHGivW7kU1ap/l3K A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="403832056"
X-IronPort-AV: E=Sophos;i="5.98,279,1673942400"; d="scan'208";a="403832056"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2023 07:35:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="855713240"
X-IronPort-AV: E=Sophos;i="5.98,279,1673942400"; d="scan'208";a="855713240"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga005.jf.intel.com with ESMTP; 21 Mar 2023 07:35:17 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 21 Mar 2023 07:35:17 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 21 Mar 2023 07:35:16 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Tue, 21 Mar 2023 07:35:16 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.177)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Tue, 21 Mar 2023 07:35:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d2lNJW0RlErMy7rYSQB4cneTYiKq51uPauA5jio3L+3sGq6CcAiubzgXregA0dQVGjs/k7AcbQgswOsk46HYW9WZuS6x2cICezSRDVP0QnoEugilqk2fAbhifCtZdJSrZOOJbbkqbl6SmhgviczOhEticqrBR8ayIyESJxKAP76rWlpiS4B5j/j6EBGwmxLClzMHIL2A8HTQ6tCxOtLOAc0hkHO7AEAei+Z94J8tZKhG8IBc4qQbDx9pz423HP3fV2RoPJzBi1Ltk3g3+3pbuyPnSzwJk9k6AWFTWEDtLrVA+Z2S/XEpxSuskfz5JvPZ019/onfyPZwYBygDLEXhqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rxynn03iCbtF6fRmSXVE5a44L6ylGpB7Yo4ws8A6YN8=;
 b=MWiOOt0TfdSF6g/cqLA4UL3za3k/ErCILmitjnEcs4CyXkJONaNJ5jDjNjDM+WWuTfziUYK4ba43AVKvj9Ojojauo89naZELGcJMvzMOebjovVR6N/GqCqNstsxUQ947trpDKZjbRldX8SeCWuZd/T5awP8yBB/GJWkQHwQp20dxzuDoaZTTWOhcXjltYff4aF74HN5xyiR/SRyruCHMtRr11ObTc3cDbZhyeYbQ//2NbQdP6ARZD72Bli+3i43h3btyumu+MMI9vJ356LFAuN+fU0/rWzUfZwwzouD/rqp31sqvbOzYe+zUAZRZKgvRva2BrIbBNawa8OBpbHv2Sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by BL1PR11MB5223.namprd11.prod.outlook.com (2603:10b6:208:31a::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Tue, 21 Mar
 2023 14:35:09 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::fc88:c65f:4ef5:c3da]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::fc88:c65f:4ef5:c3da%5]) with mapi id 15.20.6178.037; Tue, 21 Mar 2023
 14:35:09 +0000
Date: Tue, 21 Mar 2023 14:34:29 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Message-ID: <ZBnAdXk4+Idtg9lo@DUT025-TGLU.fm.intel.com>
References: <20230317002221.211065-1-matthew.brost@intel.com>
 <f85589d5-b3ac-89c8-6a24-9c51d10d3710@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <f85589d5-b3ac-89c8-6a24-9c51d10d3710@linux.intel.com>
X-ClientProxiedBy: SJ0PR13CA0060.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::35) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|BL1PR11MB5223:EE_
X-MS-Office365-Filtering-Correlation-Id: a0a8c38f-04a6-4f41-a0e1-08db2a1978d1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JnoAxUs6NQzVxmgmW2foxxfFLMVNae/UrSwlsuDXglM7cQqbWKpd0iXDf2duJ5H+57tQNM3uwTPONNSkDkxuhIyFPToorsZzO5vIVba8gz7m+VxirxaGNWZd3OinGeDAPKr0xMBrL/WZGf9xmTWgPuCGYq7u8gHqX7yl744wvgvCPupaZbgn/MtX3D6OkJ9x3744T9y7vnONRCQ/tlcviYj4+8dpzmdCZb3YhWjndZkQSDnsW0MTvZYqlmR/QrfXni8CcXQ8RxBBB81DnQQIidSuOqj0iwvC2x/24P4X3TjzeZAWigciFPjDn0KfUpDo1Ze2KSOyOI4GCSB35R5yKQFnr6DjZXUDRYP+DFOFv87CwsuIx5uzevf2SKgLf6BtJNQiTxmNjgmdCL3QyezO70QDC22bGVWJnMkwsTasSWjSgMLcLdjYZbqiXMpeWJO3EoRF9QdDNaM0kDIDl4p+79Np10d19vcFKCIS7dY8gitUOHloqx13HfaG0xIBq856vwTrrNe/63JbH1emJdNsOpIQ3BrwlxpoQrsWEZ3byttFrfz1wssRvc6KpysCTppvQquaFPs9pfJjVLTn4o4ZN4UZhqOT/+GvYbHS7KYd19DQ5r89UY9iwymkXrrKYo+i+tkYdcmGsQg00n2DTmT/8oZhWBBjx6OoI6o0yDU7WRqOn1gaCUtjWk5bMeZ4CVD0
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(346002)(396003)(136003)(366004)(39860400002)(376002)(451199018)(6512007)(41300700001)(186003)(6486002)(4326008)(6666004)(478600001)(83380400001)(8676002)(316002)(66556008)(66476007)(6916009)(66946007)(6506007)(26005)(53546011)(44832011)(8936002)(5660300002)(38100700002)(2906002)(82960400001)(86362001)(67856001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?GZhJGGxP612Urf7i5T8ex66Ki6pC+OPBNa52rlOpIwTYlxLmzeJzCB4LqLcr?=
 =?us-ascii?Q?GKEAfOUGDvYOIQEMc/Fr/QBZHSSUPjWvF4zUXka2TNIxxxjUA1mgrYkzSm4S?=
 =?us-ascii?Q?8RncxJlC8zPtly4SwpJUFx8s8VFrYNXQbmhyI/EGYhmMmfLDZ36F8Q/CKnML?=
 =?us-ascii?Q?bCE2Qu55OOFfPnJUNWycdMhKFPH73zNgB+s9h738vg8PRlXkBVKchNQm4p/y?=
 =?us-ascii?Q?gcduNdBi0VyIz1C7LTU4C4o6OPlEy/8OhjPRTAmL7I9ejMbESSDjNOlOEV7y?=
 =?us-ascii?Q?dJbES0sMdm7ySKEv8PPAxoUu+Yro0fOrg9CCoUkrTd3oydv9u6UwXIdbqlsR?=
 =?us-ascii?Q?sMaeX75zWucMsiWoxnjPnIU+UySsH/3BHlDSNlczenog0L0gnbpz/22YwVlF?=
 =?us-ascii?Q?FHJ8KfvTomXEVTFzKP3D3HnKWHuE90OsWHsjayR85SVugNS95gfl7UKxV7Rw?=
 =?us-ascii?Q?9CETWGfQSjRpjup+GL/pe3wIAu2UKayCHHlErOL+ZkMbH1QG+BwHWdJu+88J?=
 =?us-ascii?Q?zuwKi8dhSjOY45an3hhlzjYRKJJngYKrlznCInzxMFQmw2nCTvoY1ki4w8xm?=
 =?us-ascii?Q?/4yXHs9XzfWeBsy+KBPKytx2nr8CpBXfwsP7oxLWq9cWZAG14gBC4z6geR0Z?=
 =?us-ascii?Q?bYrwQifQ++eRwVx4yfJ40FDH5UCbIEQLoCTVIkA/CACBs3oTEfO+2f31xXId?=
 =?us-ascii?Q?aWfb+ftevGdTy7fnacLCh4z7ldrEJw/c1QyVhZx7LuKh41r9hnGsMf7wrkx1?=
 =?us-ascii?Q?lVQxoi5QIMoDRQrq/BQHWpcrQUutn5CeB3EmeHc2ihTQklAVzU71saUAssLx?=
 =?us-ascii?Q?Tfq+Q3kjPMo+PAgVl+MSle/jfnPyw6EEGg1Sh69dJ3l+70JZh866TDXKnASc?=
 =?us-ascii?Q?fUF3FCVGcyR0SdDv2hERRxWeDs61fSB7ywhXK+gbr3thTMq01yr7oPZsnnqr?=
 =?us-ascii?Q?607TknkGzUSrCqaNTW+7Ql6CfsbWTzkwcV5192yav1OICV8HDTk3KO6IfpO7?=
 =?us-ascii?Q?JpscrjEo19WrQ1/Wf4RICy1e5OWNFluYlNsJETlzHLyQGsldasnsP9Zp2uHo?=
 =?us-ascii?Q?ykhlN3QVSSL8Q/uqUOL6Puoimm05wj6PzATjHmBbHU+88+7JWFdFxMN6uVXo?=
 =?us-ascii?Q?2gGGTm3kP6WsjY0FmKqz1d9V2OX35sawO3Z/nY2lWitaXwmxEwTo+TpW458x?=
 =?us-ascii?Q?zUGB7VQFjCQ6y33Y0WVqL0FQApNigHw4u17auBc7m9DAMyuf7FcODdw9KDQo?=
 =?us-ascii?Q?2EaM2GejcS0EWp9HVKvKGvccUyekpikrx4VYaONaoddH8FVzg5SHYyjmnQ2p?=
 =?us-ascii?Q?kf6345D7KEjtKCx50aOBOlc3lrnsXmjUtHeAeK/lqnRfNiPZKezdemcau3o5?=
 =?us-ascii?Q?2JKXp1pBSGjylKtVAKNDfwnPlfLMdgz+MX1+7lHBTgQb+1P42FgteK6zNA5j?=
 =?us-ascii?Q?YICUdCKiMeOeJdaLSpzCIc5ngjyyL/0o7MRidDetHFNApsyzFWnSXBCEAte6?=
 =?us-ascii?Q?85YSAjhHVADA+wYdo0tGprmwtqhcqpTrWgNykeh2CHkmFx62ZIMuegV5p9pg?=
 =?us-ascii?Q?i8l8XX3YmwJz/ThEvJppMd3VaW1Al7P1NT00dum0BNEOVOdjtUWV6tp7B2As?=
 =?us-ascii?Q?tA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a0a8c38f-04a6-4f41-a0e1-08db2a1978d1
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2023 14:35:09.4641 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LizBoRlBYbgXWsqrN3pIorZpVDeAAdYpGNw1ETDwwcp44cMngVSMEynOiWwT0y9ywSq8m2PO8RLfTLIj2nAphQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5223
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: Fix locking in CT fast path
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

On Tue, Mar 21, 2023 at 01:25:51PM +0100, Maarten Lankhorst wrote:
> Hey,
> 
> I'm afraid this is not allowed, you can't take a mutex in an irq handler, not even a trylock.
> 
> From Documentation/locking/mutex-design.rst:
> 
> The mutex subsystem checks and enforces the following rules:
> ...
>     - Mutexes may not be used in hardware or software interrupt
>       contexts such as tasklets and timers.
> 

I wasn't aware of this byr DOC makes it clear this isn;t allowed. 

> Lockdep will likely still splat too as a result.
>

Lockdep is happy which is very odd since clearly this isn't allowed per
the DOC.

Anyways, I'm thinking your atomic fix is needed but likely also need a
follow on to this patch as well something like:

xe_device_mem_access_get_if_active();
do CT fast path... 
xe_device_mem_access_put_async();

The key being we can't sleep but also can't power down access to the
VRAM when the CT fast path is executing.

Matt

> Cheers,
> ~Maarten
> 
> On 2023-03-17 01:22, Matthew Brost wrote:
> > We can't sleep in the CT fast but need to ensure we can access VRAM. Use
> > a trylock + reference counter check to ensure safe access to VRAM, if
> > either check fails, fall back to slow path.
> > 
> > VLK-45296
> > 
> > Signed-off-by: Matthew Brost<matthew.brost@intel.com>
> > ---
> >   drivers/gpu/drm/xe/xe_device.h |  9 ++++++++-
> >   drivers/gpu/drm/xe/xe_guc_ct.c | 11 ++++++++++-
> >   2 files changed, 18 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
> > index 25c5087f5aad..0cc4f52098a1 100644
> > --- a/drivers/gpu/drm/xe/xe_device.h
> > +++ b/drivers/gpu/drm/xe/xe_device.h
> > @@ -95,12 +95,19 @@ static inline void xe_device_assert_mem_access(struct xe_device *xe)
> >   	XE_WARN_ON(!xe->mem_access.ref);
> >   }
> > +static inline bool __xe_device_mem_access_ongoing(struct xe_device *xe)
> > +{
> > +	lockdep_assert_held(&xe->mem_access.lock);
> > +
> > +	return xe->mem_access.ref;
> > +}
> > +
> >   static inline bool xe_device_mem_access_ongoing(struct xe_device *xe)
> >   {
> >   	bool ret;
> >   	mutex_lock(&xe->mem_access.lock);
> > -	ret = xe->mem_access.ref;
> > +	ret = __xe_device_mem_access_ongoing(xe);
> >   	mutex_unlock(&xe->mem_access.lock);
> >   	return ret;
> > diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> > index e5ed9022a0a2..bba0ef21c9e5 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> > @@ -1030,9 +1030,15 @@ void xe_guc_ct_fast_path(struct xe_guc_ct *ct)
> >   	struct xe_device *xe = ct_to_xe(ct);
> >   	int len;
> > -	if (!xe_device_in_fault_mode(xe) || !xe_device_mem_access_ongoing(xe))
> > +	if (!xe_device_in_fault_mode(xe))
> >   		return;
> > +	if (!mutex_trylock(&xe->mem_access.lock))
> > +		return;
> > +
> > +	if (!__xe_device_mem_access_ongoing(xe))
> > +		goto unlock;
> > +
> >   	spin_lock(&ct->fast_lock);
> >   	do {
> >   		len = g2h_read(ct, ct->fast_msg, true);
> > @@ -1040,6 +1046,9 @@ void xe_guc_ct_fast_path(struct xe_guc_ct *ct)
> >   			g2h_fast_path(ct, ct->fast_msg, len);
> >   	} while (len > 0);
> >   	spin_unlock(&ct->fast_lock);
> > +
> > +unlock:
> > +	mutex_unlock(&xe->mem_access.lock);
> >   }
> >   /* Returns less than zero on error, 0 on done, 1 on more available */
