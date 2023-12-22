Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D58A2C46CD2
	for <intel-xe@archiver.kernel.org>; Fri, 22 Dec 2023 05:48:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6268110E218;
	Fri, 22 Dec 2023 05:48:20 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46E3410E218
 for <intel-xe@lists.freedesktop.org>; Fri, 22 Dec 2023 05:48:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1703224099; x=1734760099;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=hxzZ2bzzb8m3wqkVIOLnAUHAAZH3qsDq1TMi4ByIVAw=;
 b=bURTc6u39LV0RRhCAlVLLI2zPRa22a5BbLeWAUE403ISjtfu2IAP57g3
 Hr5oSANqtzjA3k2FV6chMeNsX4i3RUwxqsMGKLkMANNTPpQ4QAlVhIQDV
 tcK4cnZX6iy4il7kMIzpcCw7N9LLxd4Ooy9RuXzSoRuUctYMyLSWfY8/h
 PJLdorK6xk+VB3RL70pt2EQ1xtF5zfsrY730kqPmq/tb3MZXIpd/labrS
 nvDvRif6RnAaG6yc2cNiXIGclVYm8tTMy6K+1YHOO2o4kuk/BFoB8pYu4
 QjV+ZUbCXEHgHx5n7PAAUdB3CvLcZt3W7D8FgPTgvJRc3QXEzYMPdVQxc g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10931"; a="460410642"
X-IronPort-AV: E=Sophos;i="6.04,294,1695711600"; d="scan'208";a="460410642"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Dec 2023 21:48:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,294,1695711600"; d="scan'208";a="18598556"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Dec 2023 21:48:19 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 21 Dec 2023 21:48:17 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 21 Dec 2023 21:48:17 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 21 Dec 2023 21:48:17 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 21 Dec 2023 21:48:17 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oFAWaRLrJ7TQQU3W1PPVY5TdZl6Zx+eJofFIyfDYxLEYbnGNpVPD63UxrNqkcC9n7E0sl4U7fqmPEtj0s13ZVBfPPARBYNIZSyN6qI10e18PJTJ8+2/qGByno8Qd93JGS1gXqvIthwmRFyrqaHzK0g7x4lIKlx7YXzZqrCjgCBwlM4ACtOpOBqg6F7NR4Y8br68IG0ZuoAx4d0+XdkpsMTzRpREFGLD1aYTtjuMRUDXznn0aE0+P2jzW+wQ1vIKoaTJz4DWHSpe8Szc/L2ICYIGxKG+Z/knnJifhHermAGaRfkqH28ovW3kCqiTKiRmnF8O3Eq+D+6P8dr7tncB9yQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g6FvxoqSKmjUaoLjR0Y277W4pNcxLabvE4zDrVhMa70=;
 b=jWqDQdhjBn2k1oBy2ogfQEp14hoPDwaANmc54ihKbyD5P6FTGlVn7IxFrcaqKMlqsicE1HeP22shzrMkV0zee9yAme4ZY0gLgUZgXRvFsNdkV0I95MciXH2F5+Kxd4D6g1jKBFV83M/vaej/Kx72RClfmP5h3NSbis3E4HpgQgOGGYzpEkyzF66UB5HPO2jR8mgaE2qwfTkIhVkickntFT824SdQMTPW1m69NEXgvdcLzHvFQX4eyNtgM0JADQgdAEdmNivDgN5W3ht6a8UPXwUHizhf+SMK7lYNWFZsINTIlFNbDv77urhF5JSJgBavtne0eIGvs7AGorzvxeb96g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SJ0PR11MB4845.namprd11.prod.outlook.com (2603:10b6:a03:2d1::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.21; Fri, 22 Dec
 2023 05:48:15 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::b9a8:8221:e4a1:4cda]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::b9a8:8221:e4a1:4cda%4]) with mapi id 15.20.7113.016; Fri, 22 Dec 2023
 05:48:15 +0000
Date: Fri, 22 Dec 2023 05:47:17 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Subject: Re: [PATCH] drm/xe/guc: Add more GuC CT states
Message-ID: <ZYUi5ZdXQV+r6J7C@DUT025-TGLU.fm.intel.com>
References: <20231219172824.832873-1-matthew.brost@intel.com>
 <6af59573-3925-4af4-abb4-ad7e1f40b920@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <6af59573-3925-4af4-abb4-ad7e1f40b920@intel.com>
X-ClientProxiedBy: BYAPR05CA0062.namprd05.prod.outlook.com
 (2603:10b6:a03:74::39) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SJ0PR11MB4845:EE_
X-MS-Office365-Filtering-Correlation-Id: 9aef7b4e-db29-475a-f36b-08dc02b19752
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xjSGZzALOLWDjefubxlRoinpzwptuIDIAF4otkIlAgXVuCFmc8zg9Y3pVwPUp90ueOJUoiQOZX4XpuYRWwcpqSHNTocXHrcrN/Xxec0UpnRBzigbwcXl59XUT1JZ749ZXDC0PdNbxWWRlIBUsxFMOyXhQI6gxm0UAS71fVZfqrXsrdMayhGKrWzg1UCb5P+nKGTSP+KoHHcraVSVopVKrxeLm93ddmXAAOad8oc/EFS8XZo4A87kNduBO0wYxWC/quBCpvl60fUqswXEPqXNSmI1t4opsyUkYZltZQOTRRNmShP/KTyzIE1prc6zTtinQcya9Mv6lZGRtAwxP33oWiJCFltdOksSOBAC0LBptAsRraFNX43jluqgMv+RzND5X6u50fSeqeXEPp9OUUAnhqXSAWqG1SAK/3qmLzrq/xu02rrrD3v9/zjEehEA2M+uVMLo8zaZ3AX7acND56lX6xXl5wWzUN7RbiVq2CRBa/h62I5tvklqErGLJlCtnYbEbze4aO3QEqGYtl9CKTcQCLKhfir56NrA/bTyVOJX6s6Uwl7k8na4c+QiIPJWC3tmuwJOKg5/L8ssvQiB81bTjw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(366004)(346002)(39860400002)(376002)(136003)(230922051799003)(451199024)(1800799012)(64100799003)(186009)(44832011)(4326008)(6862004)(8936002)(8676002)(5660300002)(2906002)(478600001)(6512007)(6506007)(53546011)(66946007)(66556008)(66476007)(6636002)(316002)(6486002)(41300700001)(83380400001)(38100700002)(82960400001)(26005)(86362001)(67856001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?XsWYAvQ+XXKc5A0vd6CXp5g0N28a8vPZMEXjrafbOrdV2ZWekIduhr4osQiQ?=
 =?us-ascii?Q?uCE9nnR7ndP4de5cxd0dsSgx/Z7LVEEvBkSQ6bwgeW/vqEJBBcE2GQbtAUOo?=
 =?us-ascii?Q?TgEisCIwV2S9k/mBN0Dxs/yRmF8+ma8B3EYmSf5g6bEqccNpsyUOuZW1eshS?=
 =?us-ascii?Q?fAzEmMDD2Xt6g0ImwouVD0OT3fD5wvhToaM8+6Isk7eZ4TjePT+X1bNGzODd?=
 =?us-ascii?Q?gWYEYiu7qQGerGnjtwH5GqexneD5h8hKQAx5OEYjrqQWrQEUv7v3puVWKYY6?=
 =?us-ascii?Q?mzfN5PsXx4+TquG1fY7VdJ/vwWg9EahqYvYYngMp2S9BGDjCtO9RbTWvNkI7?=
 =?us-ascii?Q?Qjo06DRwnNCNfCP8Bd1vAhoULa8M5LSo26AgdJvSjgjsYQnvOUlyby8YyuP2?=
 =?us-ascii?Q?wjKx6aIMQcrma4Ng6orWS0+r15xaFpHlDpxYTsWBZUE/2i/0aINtNhu+TR1M?=
 =?us-ascii?Q?Lrb4ZpaUe6glHSCaMkMDWc4AQARnw1YQqD/y+pF4Ic/an6jxKr5cAoxFjbIn?=
 =?us-ascii?Q?zLOx88ef38dxDzQLgyanOH6EUAV6CJDNSfaQm9qlLcwDdCUHP6f5xrhAN/+K?=
 =?us-ascii?Q?9GsOnrk+f0CuyGEUoRKYfTEFgSklge3AmCqcO2YQLw/ChcbIAmK/PvNionjf?=
 =?us-ascii?Q?j9ikzjRVwdkkc7BYgQyzSUnZmk9M1hSGG28/5w+eKB1GYjqTvpPHxMyfRxtq?=
 =?us-ascii?Q?H/0YA5wVWEv3N4Nu388v6/B64ksjTGJSt6owCqY2of9g6ZfBHV9Qw/X/GCUw?=
 =?us-ascii?Q?AAJZmemAQiDNqE5e+5Kguyi2/5gZJnPmQjWmOaPa8ysnNx4D6j9/5sO55uXH?=
 =?us-ascii?Q?+PfyqjLc3AiFHC7P8r8fe9Eb39g6ceYlQ7+TkrKBC3PAypYrBAb0O5g36YKT?=
 =?us-ascii?Q?Yc6oV1MXome4bcR1g4OR59fKGPnPcbxWEO3evJC1DK06BTcUJh4OSAqqyMcq?=
 =?us-ascii?Q?WLOGJKHWkRCAp8rZwNLqWOKIjWS73WWeFY9QJS3cZzaEhORQAtpd0biznjSi?=
 =?us-ascii?Q?nqIFaLbjFdCSIz+I44Wlmsuomsi4ZiwrDJwx9UGWqgX7poiFHyiWe9JGnYo2?=
 =?us-ascii?Q?2hk0PYPG5nlpcEhmgHPaE+bNF6W3NCpHHzfdu0S8lAC88bXzledLYvJ9OEQD?=
 =?us-ascii?Q?LWsVk0gg3yC4nAREe9X8NbbpKGeNnHvtMoLvrY+iM0hhB8gQtJQqFrJH9Pjw?=
 =?us-ascii?Q?7uCKgwJcve0I2qk8ConkQeVV6501L2o+JVEWRMS5v0HeiCMxsDMCTN0MGnUy?=
 =?us-ascii?Q?W6tuCfFB/fz1xcQUpWDfURnx4t3Hn2m4sSYZgtsHaoQ8oROvGDrLxrwxnX/G?=
 =?us-ascii?Q?1T5dpWWMOM8aPANm7N2X7UzoGCEPhjiYKHz1sk2ENSMUzeaMbfeHI5RCWdAZ?=
 =?us-ascii?Q?k8/w1C7J8+1foWnotQzCnrrd+Eu9dEHe9kzm3NO94eA0p/S2q1eObQm8gBSS?=
 =?us-ascii?Q?uvUCHtIpWIoSTF5F9bnS2MujVS36GPEN1Rut6HvTHUkaKCha6NSqvKIwJ6e+?=
 =?us-ascii?Q?bpITJ3+aPOKmciFwatI/ZPcZe6/JNbo+nJ+9wISH78A4Q5kJodAq3tiuW4y5?=
 =?us-ascii?Q?jbQIewrINzndSry+OH01B//6Hu1CE1e9L3Z2l2Mccas95X8p8i9WL1nicDJP?=
 =?us-ascii?Q?vA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9aef7b4e-db29-475a-f36b-08dc02b19752
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Dec 2023 05:48:15.2950 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VDvxW6UU96ucJpF0Q4geYK5IDVRyUISgqN3BEe8G9f8cV3+Pt7wHgDCvLTE5y5jDsR8ZMZDss/+l775wyj7nrQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4845
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

On Thu, Dec 21, 2023 at 01:56:33PM -0800, Daniele Ceraolo Spurio wrote:
> 
> 
> On 12/19/2023 9:28 AM, Matthew Brost wrote:
> > The Guc CT has more than enabled / disables states rather it has 4. The
> > 4 states are not initialized, disabled, drop messages, and enabled.
> > Change the code to reflect this. These states will enable proper return
> > codes from functions and therefore enable proper error messages.
> 
> Can you explain a bit more in which situation we expect to drop messages and
> handle it? AFAICS not all callers waiting for a G2H reply can cope with the

Anything that requires a G2H reply must be able to cope with it getting
dropped as the GuC can hang at any moment. Certainly all of submission
is designed this way, so is TLB invalidations. More on that below. With
everything being able to cope with lost G2H their is not a point to
continue to process G2H once a reset has started (or send H2G either).

> reply not coming; e.g. it looks like xe_gt_tlb_invalidation_wait() will

During a GT reset xe_gt_tlb_invalidation_reset() is called which will
signal all waiters for invalidations avoiding timeouts.

So the flow roughly is:

Set CT channel to drop messages
Stop all submissions
Do reset
Signal TLB invalidation waiters.

> timeout and throw an error (which IMO is already an issue, because the reply
> might be lost due to reset). I know that currently in all cases in which we
> stop communication we do a reset, so the situation ends up ok, but there is
> a pending series to remove the reset in the runtime suspend/resume scenario
> (https://patchwork.freedesktop.org/series/122772/) in which case IMO we

This path we would want to put the GuC communication into a state where
if messages send / recv this triggers an error. (-ENODEV).  We don't
expect to suspend the device and then send / recv messages. That is the
point of this patch - it is fine drop messages during a reset, not if
during suspend or if CT has not yet been initialized.

Proper error messages will added based on these new states.

> don't want to drop messages but do a flush instead.
> 

See above. Also unsure what you mean by flush here? Do you mean the G2H
worker? I think that creates some dma-fencing (or lockdep) nightmares if
we do that.

Matt

> Daniele
> 
> > 
> > Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> > Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >   drivers/gpu/drm/xe/xe_guc.c          |  4 +-
> >   drivers/gpu/drm/xe/xe_guc_ct.c       | 55 ++++++++++++++++++++--------
> >   drivers/gpu/drm/xe/xe_guc_ct.h       |  8 +++-
> >   drivers/gpu/drm/xe/xe_guc_ct_types.h | 18 ++++++++-
> >   4 files changed, 64 insertions(+), 21 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> > index 482cb0df9f15..9b0fa8b1eb48 100644
> > --- a/drivers/gpu/drm/xe/xe_guc.c
> > +++ b/drivers/gpu/drm/xe/xe_guc.c
> > @@ -645,7 +645,7 @@ int xe_guc_mmio_send_recv(struct xe_guc *guc, const u32 *request,
> >   	BUILD_BUG_ON(VF_SW_FLAG_COUNT != MED_VF_SW_FLAG_COUNT);
> > -	xe_assert(xe, !guc->ct.enabled);
> > +	xe_assert(xe, !xe_guc_ct_enabled(&guc->ct));
> >   	xe_assert(xe, len);
> >   	xe_assert(xe, len <= VF_SW_FLAG_COUNT);
> >   	xe_assert(xe, len <= MED_VF_SW_FLAG_COUNT);
> > @@ -827,7 +827,7 @@ int xe_guc_stop(struct xe_guc *guc)
> >   {
> >   	int ret;
> > -	xe_guc_ct_disable(&guc->ct);
> > +	xe_guc_ct_drop_messages(&guc->ct);
> >   	ret = xe_guc_submit_stop(guc);
> >   	if (ret)
> > diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> > index 24a33fa36496..22d655a8bf9a 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> > @@ -278,12 +278,25 @@ static int guc_ct_control_toggle(struct xe_guc_ct *ct, bool enable)
> >   	return ret > 0 ? -EPROTO : ret;
> >   }
> > +static void xe_guc_ct_set_state(struct xe_guc_ct *ct,
> > +				enum xe_guc_ct_state state)
> > +{
> > +	mutex_lock(&ct->lock);		/* Serialise dequeue_one_g2h() */
> > +	spin_lock_irq(&ct->fast_lock);	/* Serialise CT fast-path */
> > +
> > +	ct->g2h_outstanding = 0;
> > +	ct->state = state;
> > +
> > +	spin_unlock_irq(&ct->fast_lock);
> > +	mutex_unlock(&ct->lock);
> > +}
> > +
> >   int xe_guc_ct_enable(struct xe_guc_ct *ct)
> >   {
> >   	struct xe_device *xe = ct_to_xe(ct);
> >   	int err;
> > -	xe_assert(xe, !ct->enabled);
> > +	xe_assert(xe, !xe_guc_ct_enabled(ct));
> >   	guc_ct_ctb_h2g_init(xe, &ct->ctbs.h2g, &ct->bo->vmap);
> >   	guc_ct_ctb_g2h_init(xe, &ct->ctbs.g2h, &ct->bo->vmap);
> > @@ -300,12 +313,7 @@ int xe_guc_ct_enable(struct xe_guc_ct *ct)
> >   	if (err)
> >   		goto err_out;
> > -	mutex_lock(&ct->lock);
> > -	spin_lock_irq(&ct->fast_lock);
> > -	ct->g2h_outstanding = 0;
> > -	ct->enabled = true;
> > -	spin_unlock_irq(&ct->fast_lock);
> > -	mutex_unlock(&ct->lock);
> > +	xe_guc_ct_set_state(ct, XE_GUC_CT_STATE_ENABLED);
> >   	smp_mb();
> >   	wake_up_all(&ct->wq);
> > @@ -321,12 +329,12 @@ int xe_guc_ct_enable(struct xe_guc_ct *ct)
> >   void xe_guc_ct_disable(struct xe_guc_ct *ct)
> >   {
> > -	mutex_lock(&ct->lock); /* Serialise dequeue_one_g2h() */
> > -	spin_lock_irq(&ct->fast_lock); /* Serialise CT fast-path */
> > -	ct->enabled = false; /* Finally disable CT communication */
> > -	spin_unlock_irq(&ct->fast_lock);
> > -	mutex_unlock(&ct->lock);
> > +	xe_guc_ct_set_state(ct, XE_GUC_CT_STATE_DISABLED);
> > +}
> > +void xe_guc_ct_drop_messages(struct xe_guc_ct *ct)
> > +{
> > +	xe_guc_ct_set_state(ct, XE_GUC_CT_STATE_DROP_MESSAGES);
> >   	xa_destroy(&ct->fence_lookup);
> >   }
> > @@ -493,11 +501,19 @@ static int __guc_ct_send_locked(struct xe_guc_ct *ct, const u32 *action,
> >   		goto out;
> >   	}
> > -	if (unlikely(!ct->enabled)) {
> > +	if (ct->state == XE_GUC_CT_STATE_NOT_INITIALIZED ||
> > +	    ct->state == XE_GUC_CT_STATE_DISABLED) {
> >   		ret = -ENODEV;
> >   		goto out;
> >   	}
> > +	if (ct->state == XE_GUC_CT_STATE_DROP_MESSAGES) {
> > +		ret = -ECANCELED;
> > +		goto out;
> > +	}
> > +
> > +	xe_assert(xe, xe_guc_ct_enabled(ct));
> > +
> >   	if (g2h_fence) {
> >   		g2h_len = GUC_CTB_HXG_MSG_MAX_LEN;
> >   		num_g2h = 1;
> > @@ -682,7 +698,8 @@ static bool retry_failure(struct xe_guc_ct *ct, int ret)
> >   		return false;
> >   #define ct_alive(ct)	\
> > -	(ct->enabled && !ct->ctbs.h2g.info.broken && !ct->ctbs.g2h.info.broken)
> > +	(xe_guc_ct_enabled(ct) && !ct->ctbs.h2g.info.broken && \
> > +	 !ct->ctbs.g2h.info.broken)
> >   	if (!wait_event_interruptible_timeout(ct->wq, ct_alive(ct),  HZ * 5))
> >   		return false;
> >   #undef ct_alive
> > @@ -941,12 +958,18 @@ static int g2h_read(struct xe_guc_ct *ct, u32 *msg, bool fast_path)
> >   	lockdep_assert_held(&ct->fast_lock);
> > -	if (!ct->enabled)
> > +	if (ct->state == XE_GUC_CT_STATE_NOT_INITIALIZED ||
> > +	    ct->state == XE_GUC_CT_STATE_DISABLED)
> >   		return -ENODEV;
> > +	if (ct->state == XE_GUC_CT_STATE_DROP_MESSAGES)
> > +		return -ECANCELED;
> > +
> >   	if (g2h->info.broken)
> >   		return -EPIPE;
> > +	xe_assert(xe, xe_guc_ct_enabled(ct));
> > +
> >   	/* Calculate DW available to read */
> >   	tail = desc_read(xe, g2h, tail);
> >   	avail = tail - g2h->info.head;
> > @@ -1245,7 +1268,7 @@ struct xe_guc_ct_snapshot *xe_guc_ct_snapshot_capture(struct xe_guc_ct *ct,
> >   		return NULL;
> >   	}
> > -	if (ct->enabled) {
> > +	if (xe_guc_ct_enabled(ct)) {
> >   		snapshot->ct_enabled = true;
> >   		snapshot->g2h_outstanding = READ_ONCE(ct->g2h_outstanding);
> >   		guc_ctb_snapshot_capture(xe, &ct->ctbs.h2g,
> > diff --git a/drivers/gpu/drm/xe/xe_guc_ct.h b/drivers/gpu/drm/xe/xe_guc_ct.h
> > index f15f8a4857e0..214a6a357519 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_ct.h
> > +++ b/drivers/gpu/drm/xe/xe_guc_ct.h
> > @@ -13,6 +13,7 @@ struct drm_printer;
> >   int xe_guc_ct_init(struct xe_guc_ct *ct);
> >   int xe_guc_ct_enable(struct xe_guc_ct *ct);
> >   void xe_guc_ct_disable(struct xe_guc_ct *ct);
> > +void xe_guc_ct_drop_messages(struct xe_guc_ct *ct);
> >   void xe_guc_ct_fast_path(struct xe_guc_ct *ct);
> >   struct xe_guc_ct_snapshot *
> > @@ -22,10 +23,15 @@ void xe_guc_ct_snapshot_print(struct xe_guc_ct_snapshot *snapshot,
> >   void xe_guc_ct_snapshot_free(struct xe_guc_ct_snapshot *snapshot);
> >   void xe_guc_ct_print(struct xe_guc_ct *ct, struct drm_printer *p, bool atomic);
> > +static inline bool xe_guc_ct_enabled(struct xe_guc_ct *ct)
> > +{
> > +	return ct->state == XE_GUC_CT_STATE_ENABLED;
> > +}
> > +
> >   static inline void xe_guc_ct_irq_handler(struct xe_guc_ct *ct)
> >   {
> >   	wake_up_all(&ct->wq);
> > -	if (ct->enabled)
> > +	if (xe_guc_ct_enabled(ct))
> >   		queue_work(system_unbound_wq, &ct->g2h_worker);
> >   	xe_guc_ct_fast_path(ct);
> >   }
> > diff --git a/drivers/gpu/drm/xe/xe_guc_ct_types.h b/drivers/gpu/drm/xe/xe_guc_ct_types.h
> > index d814d4ee3fc6..e36c7029dffe 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_ct_types.h
> > +++ b/drivers/gpu/drm/xe/xe_guc_ct_types.h
> > @@ -72,6 +72,20 @@ struct xe_guc_ct_snapshot {
> >   	struct guc_ctb_snapshot h2g;
> >   };
> > +/**
> > + * enum xe_guc_ct_state - CT state
> > + * @XE_GUC_CT_STATE_NOT_INITIALIZED: CT suspended, messages not expected in this state
> > + * @XE_GUC_CT_STATE_DISABLED: CT disabled, messages not expected in this state
> > + * @XE_GUC_CT_STATE_DROP_MESSAGES: CT drops messages without errors
> > + * @XE_GUC_CT_STATE_ENABLED: CT enabled, messages sent / recieved in this state
> > + */
> > +enum xe_guc_ct_state {
> > +	XE_GUC_CT_STATE_NOT_INITIALIZED = 0,
> > +	XE_GUC_CT_STATE_DISABLED,
> > +	XE_GUC_CT_STATE_DROP_MESSAGES,
> > +	XE_GUC_CT_STATE_ENABLED,
> > +};
> > +
> >   /**
> >    * struct xe_guc_ct - GuC command transport (CT) layer
> >    *
> > @@ -96,8 +110,8 @@ struct xe_guc_ct {
> >   	u32 g2h_outstanding;
> >   	/** @g2h_worker: worker to process G2H messages */
> >   	struct work_struct g2h_worker;
> > -	/** @enabled: CT enabled */
> > -	bool enabled;
> > +	/** @state: CT state */
> > +	enum xe_guc_ct_state state;;
> >   	/** @fence_seqno: G2H fence seqno - 16 bits used by CT */
> >   	u32 fence_seqno;
> >   	/** @fence_lookup: G2H fence lookup */
> 
