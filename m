Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4123C6FD20
	for <intel-xe@archiver.kernel.org>; Fri, 24 Mar 2023 15:29:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA56C10E4E4;
	Fri, 24 Mar 2023 15:29:16 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8346F10E558
 for <intel-xe@lists.freedesktop.org>; Fri, 24 Mar 2023 15:29:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679671754; x=1711207754;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=xq8ORYvpDlBonlVic4UhwLV40syZr20b6kFgnHWix6U=;
 b=ltVv+Xs3VYznLev+aiHlKWTiDYBEKRXjlFWKzOG3w2A9bP33S+P3sem4
 SpJQibiKV83aQty2IfWIuHkrHgA00puhuPWDAtu3+CgjpgCNQP/YiMwzo
 lRIrQM7q0Y3M5vca1PKg5Vpnv55VICo79UFDI9ypIUMUAZssnu8SIP5PS
 /OUZRhKGh+Fnbqa0T9ymE2tLs8qZ3uShMb38B7Yap+qRe+nxKO0GrRJAY
 mP2q55vaujXTXqRI6qZAWON1nXc56b3bnUG7YPZDD3SnQjZq29JiuAV1I
 6a/WmMBlzfDiyS8eE5TTwZknPNDCPOqvHJfoKM8z0Hxv6zsUE1oD7awee A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10659"; a="338525435"
X-IronPort-AV: E=Sophos;i="5.98,288,1673942400"; d="scan'208";a="338525435"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2023 08:29:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10659"; a="713108183"
X-IronPort-AV: E=Sophos;i="5.98,288,1673942400"; d="scan'208";a="713108183"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga008.jf.intel.com with ESMTP; 24 Mar 2023 08:29:13 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 24 Mar 2023 08:29:13 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Fri, 24 Mar 2023 08:29:13 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Fri, 24 Mar 2023 08:29:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QlPaPW9KaTJiCaNx+Vf3mTq8U27ELVsVObl+oa165B2p5Wi45JKBA2f+18bgqyI3hqhXyhLVwiTsbtoiFD0+1l0pwD8yw+6j/WlYvdiUuSSR/boOE09cHBnC0j9PQ3JrWTl3f2D54PAk/UYDRYep9WN2kaVZ/69fQP6MySZfy1ll4fdXwKvpGGBob3tLmVaVSCkDJlCtMWhnxYc5RdG1dwunXw361XJpcIMO1bLPesCnXxlsayKtQ1LvCqoojwHAeY6xTjwrSbSHArGX+LHdvtqmM/aKUcl5Kav1K9adEV4LsvcJ1mgL2TcR5UdPq1DjQ8o4HdPkk/09mKJ5zqSKQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GIyTmqOZ/wPsv6tOCBzIG7kKvh5GYM4GXPNEfv1HOX0=;
 b=hLzK3niM5pJY30sEvgBgFHQG3k/OkQHyEGVX9wBGn+2Hp7X1xESveMzclUsPnauIAQoNhRp6oWIjIlJnqTlmuuIXGKBvSiA5zTVXKtWZHfH5DYbG3poiOQujPwjN6jFBAIGhEBW6cAZ5SmEQeHd9pfXcLzsmCWDoLzqByyqyL+d7Fmyy1+QQdtx6lsLFTDaHTMwM50HfCG9YoHwb5DLGrwaHr2hHf2JRwm4jFeasg3EIH0mgs/IqZmIa0V/ipmH9ZHg+h1ptIHeZr7dHXiu1auite3l5xLhA4oAkAymJAkHNxbMZ1+PqRGlQdleVmptNJaEoWAgtmrpyWnKnJno4pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY8PR11MB6940.namprd11.prod.outlook.com (2603:10b6:930:58::17)
 by CH3PR11MB7937.namprd11.prod.outlook.com (2603:10b6:610:12c::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.38; Fri, 24 Mar
 2023 15:29:10 +0000
Received: from CY8PR11MB6940.namprd11.prod.outlook.com
 ([fe80::69f8:7f28:f29:2876]) by CY8PR11MB6940.namprd11.prod.outlook.com
 ([fe80::69f8:7f28:f29:2876%9]) with mapi id 15.20.6178.038; Fri, 24 Mar 2023
 15:29:10 +0000
From: "Chang, Yu bruce" <yu.bruce.chang@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>, "De Marchi, Lucas"
 <lucas.demarchi@intel.com>
Thread-Topic: [Intel-xe] [PATCH v2] drm/xe: Use fast virtual copy engine for
 migrate engine on PVC
Thread-Index: AQHZXe8+G7txZcHulEafSM+XRoM2ga8JXTKAgAAjQgCAAIxPMA==
Date: Fri, 24 Mar 2023 15:29:10 +0000
Message-ID: <CY8PR11MB69406B340F0DD44161F3B691C3849@CY8PR11MB6940.namprd11.prod.outlook.com>
References: <20230324012329.1195977-1-matthew.brost@intel.com>
 <20230324045311.h32fyw7mh6o6eyic@ldmartin-desk2.lan>
 <ZB1KSkvCngrSs3bR@DUT025-TGLU.fm.intel.com>
In-Reply-To: <ZB1KSkvCngrSs3bR@DUT025-TGLU.fm.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR11MB6940:EE_|CH3PR11MB7937:EE_
x-ms-office365-filtering-correlation-id: c0258b81-7ab0-4527-766a-08db2c7c8406
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 91GaaUKqDhS0Uo4HiRYQMjT5iDQACYRZNQV0FNKKLSnG+lSkRo89iTqfn8oVlfI6BGTx0KTGVDyN7bX5YP55c75MaulP4n7kWrrT1xx5z+D78LfotyTuHKFrqdnBilk+dnWGoyQNllC8A6oFHXKot44Fpwx93n/tUq/VXgGbRkBFSFWZ0BxRGfJYFmrc5NibHp6reHqgyXHOH5UoWiWVXeEpt/2khAXoSb0PfRWw3dSCpZsL0HNqS+lSaIAuc7IuMyNSDYNvGzUrfDxTiVupTO3Wh8yX8TAgSzilsLS/IJNZ3wR1MpmKlwsEZwRuOT9IOFTXMNKnNbVmx9vfyXfg7ZLJiauUC1Y71bApQblOO9lVkK8aTVloRQzDdMAjofKT0zSnKAjEmW/k1BG2b1/qn3O1sXQlzZMb/HuNQlXMYyv8DcaqOUue59rwl2dFaloZkjIWD/TW9ZEorl5t1mXwplvAXXoKH2lc4yBXQyeoutXO+3H1p9NXITYRbwmBPksa3SKL4miIio1tc7iY67DQLFzYhvmf5HlCRrkqLZfuekBbPVa6Jg5dR/DZ4qCqilhtuzyb8PshuvBvgfekv3T8ECvmb4P+R2hUmDDu9zX5sHyETA8AjhOjkvpkjPTTmx0Z3LTcFdNW7HK5az3O+B/ksqUuqBofPdAj8Th+ZijOdyX2ek71NsDKfPIP3G0HXhEKsafS1dwRG51C7Ix9sF6UJ3V4lsw+njLGYncgM+vOIkw=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB6940.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(366004)(376002)(136003)(396003)(346002)(39860400002)(451199018)(2906002)(55016003)(38100700002)(38070700005)(66899018)(478600001)(7696005)(83380400001)(33656002)(186003)(9686003)(86362001)(71200400001)(6636002)(316002)(66946007)(110136005)(76116006)(66476007)(8676002)(64756008)(4326008)(5660300002)(53546011)(66556008)(66446008)(52536014)(8936002)(122000001)(6506007)(26005)(82960400001)(41300700001)(21314003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?9gmK9208euCESvCg20XvLn5Mtkm50smxnIsUdpAWWdCS7WLTJAjE1XtjDMy5?=
 =?us-ascii?Q?7w93VCiEhEFcReL66PbhofgsJ3FSCwSh6JOf/okxKfjUAEh/9Rok9SXPtUXk?=
 =?us-ascii?Q?6+d44C52iJzWLDbNAiTeZtjMlICvDWBaFQHm+ASU9V5h+cwzqStlhS60cZJV?=
 =?us-ascii?Q?IEmfwRvCBgk8iPKHeZYAXohfReNTj5jLjIcYth8/OzF8vpEudMorZJp0zzDW?=
 =?us-ascii?Q?AqbVTWYapLe2jIYhuj+g4pMzKWn7l9MLFVRzKeSqO+bbhkZ0NrEy3r8VL5ar?=
 =?us-ascii?Q?YLqK0VZhrWKUR5XEF1p65x9VQIn2B9E8k9ntitmv05VkLkBiLAckCZ53Pi6B?=
 =?us-ascii?Q?pQTglHkE+u7dAzlA3UoDZx8s8a+0K6mRouWeZiNvoQzGsGty2B6AVHHKEbtZ?=
 =?us-ascii?Q?6682kCVIW1ZstojxNBw8Taiefm/18hGDt7eCGLGiPhoIW8yipAHD4/q0bo6x?=
 =?us-ascii?Q?fYo1mFn/dQOqeLZ/eBEXqupz8gYdZuW9DuszdM2Artq7djNFUy7o++rSGbbX?=
 =?us-ascii?Q?JLD76zY1L8SEk5eozXD7QgfLJ4b3osujBW+1R/3jen5SYNR++qYarj8Vjjsr?=
 =?us-ascii?Q?vPNdXxRSpg0f/CGh059lTlH2GYz94cqhTQs2VsjlmkidechwWvoFtF5ce/CG?=
 =?us-ascii?Q?7ShCoPXstkyFeDfX+YB92yYVEmVfK7dGyq8fFoIRxm0hkdWVmxWRboveD83U?=
 =?us-ascii?Q?jfMXQ/41ZqWeM82lSlxL0e8o7/p/uO45UuDlNTex+POTD5K3knDTb6WaeKsy?=
 =?us-ascii?Q?L2v2xtnXrnI1GdWyRdhiH3r0/TEN1PS4+2u2qvYiU0mUKz5GSiei3AGAmaWa?=
 =?us-ascii?Q?SuvOf2HLqQojo47wkihg7sq2HhXa2hyciphnj84+leF0CUpoXtG7uwcAVU6y?=
 =?us-ascii?Q?ubRwnxTafHkVvmsCJuXJZDBqSid1gLda8p1VU5eu27l3MntnTLf27KNHAHBQ?=
 =?us-ascii?Q?r/+mMhfgTWBkV4k0TZ+9jEROjLu//vvD2SOgV8foLogbcznnuyc2Xts659q+?=
 =?us-ascii?Q?aRLHp90xixzb3pSBkbFtYymGhSSTtY5sZe9/vufkh1E4qLL1k5s+SuHiFnZF?=
 =?us-ascii?Q?iZv7nfQbz5uVWShPUdmNuEaUHZorXS10azR1Uj/yTRTJ1jX9V1ck2niKoDwQ?=
 =?us-ascii?Q?CAyP1b5xiLRy49iYxonRZN18B2GbqjaOCvxXBvKKBSH5aXLQnoYM3Re2dRyc?=
 =?us-ascii?Q?eQMyasfvRtbZbGle5kBN1RPluwOGwOi8NSASXE9EJgpuzuRhfQKDthED4Zks?=
 =?us-ascii?Q?ik4Vl8HY5CGETfZZhmW33kiTjS8J8Qpl2IuYqll6o0mAgQnD9fgH1lHw2WkU?=
 =?us-ascii?Q?PPMviHRlzh8kDha0Y27KBR1Coq0a3F6sw+VExYabdgHNNFRExE3PPrJKayxE?=
 =?us-ascii?Q?pSx+jU2Z7W6URfrYIS+azmd1Ks3QQ15sjkPCT08qOQg/Darot0bL7dHIzJeQ?=
 =?us-ascii?Q?/Wrar8OR03q9LSP69z6aVSM/SSuAZ6lsCWSOs2j3RNUt7517c+YWNcfaVXl2?=
 =?us-ascii?Q?0ee2Dw4Gwiqz0o7Fu83t8syYPIr7usI+k3H1Q9viNAsY/fl5CB4R9kySH5QJ?=
 =?us-ascii?Q?54l8G0zlt+K3mUMmQDG/CyRNKzmtRhgnqSyPznDT?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB6940.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c0258b81-7ab0-4527-766a-08db2c7c8406
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Mar 2023 15:29:10.5327 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: svYvOUxDg9oSOXeW92NjIfrzg5RNjocAhRAM0+YyjOqheknfo1PfkadveBzZpBMzgFhYk5CVQxmBhnmlUKblylrO65pcyZ8Q7+ub25kIAcA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7937
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2] drm/xe: Use fast virtual copy engine for
 migrate engine on PVC
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
Cc: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>



> -----Original Message-----
> From: Brost, Matthew <matthew.brost@intel.com>
> Sent: Thursday, March 23, 2023 11:59 PM
> To: De Marchi, Lucas <lucas.demarchi@intel.com>
> Cc: intel-xe@lists.freedesktop.org; Chang, Yu bruce
> <yu.bruce.chang@intel.com>
> Subject: Re: [Intel-xe] [PATCH v2] drm/xe: Use fast virtual copy engine f=
or
> migrate engine on PVC
>=20
> On Thu, Mar 23, 2023 at 09:53:11PM -0700, Lucas De Marchi wrote:
> > On Thu, Mar 23, 2023 at 06:23:29PM -0700, Matthew Brost wrote:
> > > Some copy hardware engine instances are faster than others on PVC,
> > > use a virtual engine of these plus the reserved instance for the
> > > migrate engine on PVC. The idea being if a fast instance is
> > > available it will be used and the throughput of kernel copies,
> > > clears, and pagefault servicing will be higher.
> >
> > how faster and/or why?  If it was related to being link copy engine vs
> > main copy engine it was very understandable as the commands available
> > are different and optimized for certain usages. However below you are
> > setting to the odd link copy engines + the main copy engine
> > + whatever was reserved for USM.
> >
> > Without a proper reason here or numbers or spec, it's hard to judge
> > where this is coming from and understand in future.
> >
>=20
> Your right, probably need to get a spec reference or something to justify=
 this.
> I came up with this bit mask from IM conversation with Bruce, maybe he ca=
n
> point me to the spec. Also I looked at the i915 code for this and it is j=
ust BCS0
> | reserved BCS so definitely need to dig into what is the ideal mask.
>
Please find the detailed information from the i915 patch below:

INTEL_DII: drm/i915/pvc: Force even num engines to use 64B

    On PVC observed gt_fatal_7 as arbiter is out of credits while
    running Molten Concurrency stress+ 2 HPLs + ProcHot + Warm Idle
    + Solar DVFS + ASPM + Link Width Change.

    Its root caused to HW bug and SW workaround proposed to use
    all even instance engines to do 64B transfer while using
    system memory.

    So this change implements below scenario :
    ------------------------------------------------------------
    L7  |  L6  |  L5  |  L4  |  L3  |  L2  |  L1  |  L0  |  Main

    8      7      6      5      4      3      2      1

    64B    256B   64B    256B   64B    256B   64B    256B   64B
    -------------------------------------------------------------

Bug-id: 16017236439

The 64B will limit the transfer BW. The main copy engine has several backen=
d,
So it may not be impacted much, but other link copy engine such as the rese=
rved
bcs8 will slow down to possible ~20% for host transfer.=20

-Bruce
> >
> > >
> > > v2: Include local change of correct mask for fast instances
> > >
> > > Cc: Bruce Chang <yu.bruce.chang@intel.com>
> > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > ---
> > > drivers/gpu/drm/xe/xe_engine.h    |  2 ++
> > > drivers/gpu/drm/xe/xe_hw_engine.c | 20 ++++++++++++++++++++
> > > drivers/gpu/drm/xe/xe_migrate.c   |  7 ++++---
> > > 3 files changed, 26 insertions(+), 3 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/xe/xe_engine.h
> > > b/drivers/gpu/drm/xe/xe_engine.h index 1cf7f23c4afd..0a9c35ea3d34
> > > 100644
> > > --- a/drivers/gpu/drm/xe/xe_engine.h
> > > +++ b/drivers/gpu/drm/xe/xe_engine.h
> > > @@ -26,6 +26,8 @@ void xe_engine_destroy(struct kref *ref);
> > >
> > > struct xe_engine *xe_engine_lookup(struct xe_file *xef, u32 id);
> > >
> > > +u32 xe_hw_engine_fast_copy_logical_mask(struct xe_gt *gt);
> > > +
> > > static inline struct xe_engine *xe_engine_get(struct xe_engine
> > > *engine) {
> > > 	kref_get(&engine->refcount);
> > > diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c
> > > b/drivers/gpu/drm/xe/xe_hw_engine.c
> > > index 63a4efd5edcc..d2b43b189b14 100644
> > > --- a/drivers/gpu/drm/xe/xe_hw_engine.c
> > > +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
> > > @@ -600,3 +600,23 @@ bool xe_hw_engine_is_reserved(struct
> xe_hw_engine *hwe)
> > > 	return xe->info.supports_usm && hwe->class =3D=3D
> XE_ENGINE_CLASS_COPY &&
> > > 		hwe->instance =3D=3D gt->usm.reserved_bcs_instance; }
> > > +
> > > +u32 xe_hw_engine_fast_copy_logical_mask(struct xe_gt *gt)
> >
> > this deserves its kernel-doc, probably with similar info asked for in
> > the commit message.
> >
>=20
> I thought I added kernel DoC but apartently forgot. Will fix in next rev.
>=20
> Matt
>=20
> > Lucas De Marchi
> >
> > > +{
> > > +	struct xe_device *xe =3D gt_to_xe(gt);
> > > +	struct xe_hw_engine *hwe;
> > > +	const u32 fast_physical_mask =3D 0xab;	/* 0, 1, 3, 5, 7 */
> > > +	u32 fast_logical_mask =3D 0;
> > > +	enum xe_hw_engine_id id;
> > > +
> > > +	/* XXX: We only support this function on PVC for now */
> > > +	XE_BUG_ON(!(xe->info.platform =3D=3D XE_PVC));
> > > +
> > > +	for_each_hw_engine(hwe, gt, id) {
> > > +		if ((fast_physical_mask | gt->usm.reserved_bcs_instance) &
> > > +		    BIT(hwe->instance))
> > > +			fast_logical_mask |=3D hwe->logical_instance;
> > > +	}
> > > +
> > > +	return fast_logical_mask;
> > > +}
> > > diff --git a/drivers/gpu/drm/xe/xe_migrate.c
> > > b/drivers/gpu/drm/xe/xe_migrate.c index 11c8af9c6c92..4a7fec5d619d
> > > 100644
> > > --- a/drivers/gpu/drm/xe/xe_migrate.c
> > > +++ b/drivers/gpu/drm/xe/xe_migrate.c
> > > @@ -345,11 +345,12 @@ struct xe_migrate *xe_migrate_init(struct
> xe_gt *gt)
> > >
> XE_ENGINE_CLASS_COPY,
> > > 							   gt-
> >usm.reserved_bcs_instance,
> > > 							   false);
> > > -		if (!hwe)
> > > +		u32 logical_mask =3D
> xe_hw_engine_fast_copy_logical_mask(gt);
> > > +
> > > +		if (!hwe || !logical_mask)
> > > 			return ERR_PTR(-EINVAL);
> > >
> > > -		m->eng =3D xe_engine_create(xe, vm,
> > > -					  BIT(hwe->logical_instance), 1,
> > > +		m->eng =3D xe_engine_create(xe, vm, logical_mask, 1,
> > > 					  hwe, ENGINE_FLAG_KERNEL);
> > > 	} else {
> > > 		m->eng =3D xe_engine_create_class(xe, gt, vm,
> > > --
> > > 2.34.1
> > >
