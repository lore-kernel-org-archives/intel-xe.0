Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A5E6C46CD2
	for <intel-xe@archiver.kernel.org>; Tue, 30 Jan 2024 17:14:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E022810F904;
	Tue, 30 Jan 2024 17:14:31 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DCF0113320
 for <intel-xe@lists.freedesktop.org>; Tue, 30 Jan 2024 17:14:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706634870; x=1738170870;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=/WcLaMfsvJid1nq/zBs8MuAlPMKtRMVbfvTm0rpOfGg=;
 b=YMuTPGumVglQ5TfQA+48tkLc03Bf67buId/QBrErFSOEGLu0WZMb0wZr
 cH5w4YeIx71FaQluFdGw2w3QXso9RPjzylRplVCdDeiZz+vJjRvhwfhTU
 klP5o6z1oCKWVZyWyjb0wxmNht0gJzZGZEL+hpcQaYdSAdtLMa+dA/a6D
 gTHebFF3pNvx5lqiRfhbmVYv817Xr1QNxnGShr3ycNM7437SsGZPM77Ld
 lAjqa/WM3AOw5mGPOTQjoDwyJWHBGLvfMyKjOemlB/cl5BwtY36IilEup
 Lr2jFb3ESN7QVy12fzq3P9vV37nKwTiT1RLCU6DiIehE+RjUFYeVNv0br g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="10090645"
X-IronPort-AV: E=Sophos;i="6.05,230,1701158400"; d="scan'208";a="10090645"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2024 09:14:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="961344355"
X-IronPort-AV: E=Sophos;i="6.05,230,1701158400"; d="scan'208";a="961344355"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 30 Jan 2024 09:14:29 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 30 Jan 2024 09:14:28 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 30 Jan 2024 09:14:28 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 30 Jan 2024 09:14:28 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 30 Jan 2024 09:14:28 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IK307UEzH0T1SQn79+ZS4+AkJqZh9pKFElpBA3kgv9tZLWetdjZKytDEIlqaC71l7LL610niWKILJvD7LYll7PZem/PnipD44GvmTcFp+ETxLIFEIr9OQVuY6R79WhpUDiU3y3ZumDt731FxT2OpfFVRUd53CjiiHlC6mKpmbjONtKTo0uLDK0/oPSBpbsz0zbIGm7hK/FCjFGKH5zZmlzl2HACERE1r5JsUjoaWl0SzQMWdLBv7aUyJXsv/mLacSPYYLsEFk7B87kGWWzAYI9oiz2Re0FOwGlUyTxOOu3CBLAnnqCvcCbQuBPib7DM0O5A/WSEjQmdBuNqeJXeM+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1HmNSsmmFu8Rw09mkzlsBDwL7WWdNhZMxJUdKhH0h3E=;
 b=ghRbJ5Kd1BiP4nqzzFHns41AZ9GvXpxPdkxzc5QgyGnNIjpqgb77Ls3suLoZBK5zX0BoerXcSXqCcYJQhfLICHvtgWtRu03RwpDWXvLfA5avMjxsYxfPM3VRaXtls2M0KFlwqBl+KwRIosd2n27SewuShujte/TuGtjXzY5CFU5MmKYprMDzN8wTcNHmVuY9Bjf/90gOIS3hXVoyMnqkGkrOvT7NtKFN/yvevhb6NqfedwadaXX87eErWGZk9qpk+neMboZNCa9XpMFXFhT31vPhj250wreaGBcrtuEk72QLBr9mTVz6fdbD+DFns/H9jhxv9zpP0gcbgtPTjw8nVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CO6PR11MB5636.namprd11.prod.outlook.com (2603:10b6:5:357::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.34; Tue, 30 Jan
 2024 17:14:26 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::b9a8:8221:e4a1:4cda]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::b9a8:8221:e4a1:4cda%4]) with mapi id 15.20.7228.028; Tue, 30 Jan 2024
 17:14:26 +0000
Date: Tue, 30 Jan 2024 17:14:04 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
Subject: Re: [PATCH v2] drm/xe: Prefer BIT/GENMASK macros over shifts
Message-ID: <ZbkuXLIG1qpEd1Wg@DUT025-TGLU.fm.intel.com>
References: <20240123212317.1600836-1-matthew.brost@intel.com>
 <87il3jkqtn.fsf@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87il3jkqtn.fsf@intel.com>
X-ClientProxiedBy: SJ0PR03CA0054.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::29) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CO6PR11MB5636:EE_
X-MS-Office365-Filtering-Correlation-Id: 29da5cf4-af18-4238-dbff-08dc21b6e940
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HhQcHnzQdhcjRGazI7fGQLswYTQS0/t6onHuTy7JQgwfh9tgWwhCoIodaxCRJ00iU4HImKsFYxPSOfvhK7DNAfTqJhW9onrFuHUEqJXzy8m+iuL8X6Mbv66ScEjnyrYZQjo+tQ48koaFOD50h93n4vqB2kVSs3gIVr+j+oUzIXlHus7+bboa20Z0XUJ86Nn79vPlOPU1z/f9Rz4AZ33pHr//YdeVNxShx0yC4Rg7KL18jFN2mV+azJDeZP2g/zOVrtdnGPW4+f3c0HBPyqrlLXAyheOW26snBcYIO6HYSsq579aMAlHfT2UePQBNnxCl0j5AOFqI9rXYWqTA+RlkeBxaAmSwBLGYSHDGNbsw7y9ssklAQIU3BC6Gsf8sJ1bQCNR43BeIT7jTV2EgaQCQDDoyq8CmriQ67QP8lfz3+4cLCpI3sG9Zu2omgvfgoag0e+7hsm50b94AteTxDuy+l7p4dY3t8YEorlzbiVnQC5SWIy0FjqDzqNdKk7TPtyfl3g29jFnmUEFvCtZRdJoqANdEfv9WE0NDdmSCFGlbxt8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(396003)(136003)(366004)(346002)(376002)(230922051799003)(64100799003)(186009)(1800799012)(451199024)(41300700001)(478600001)(6666004)(86362001)(6512007)(6486002)(6506007)(5660300002)(38100700002)(30864003)(966005)(2906002)(44832011)(82960400001)(6916009)(66946007)(66556008)(4326008)(8936002)(66476007)(8676002)(316002)(83380400001)(66574015)(26005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?bOOyA2Ayf79GmjV0Q6J6K+W4bp5vrGraqxI93BuQfnOtZ4fKRqkE/p9ftO?=
 =?iso-8859-1?Q?9V+UHEri0sDtb5Ik/mzS8YbSdcVSmEkJC95T9Gr4gRZMKXSio4MRxj2vIk?=
 =?iso-8859-1?Q?bVuzWQPMFssyde3Raom01HqV2V5/1mDmywa+GFNYVXpFWw9/maMj7j7pB6?=
 =?iso-8859-1?Q?l1qzSZzZQSuclEcyUb89tkTQoVLM9zcjHWAyBiaBBgx+SKIHxDLXJcPKiJ?=
 =?iso-8859-1?Q?SVYrujvOKdSULHsSp/fOd3SEl/JJHgzNGUeSkEjKh+k4y6FCUq3nSTUwho?=
 =?iso-8859-1?Q?nyoOJGcV4y5mLAk4+UD/Wglh1+KnPd+X4hFrehsHIvIZmGKZiH3oTbTznS?=
 =?iso-8859-1?Q?4J7icKhWCl8pd7nct6W64ZNBL31veZXNUK3j0+QXtw0DWTE0AKTTVsDOBj?=
 =?iso-8859-1?Q?hsL/BDNacrGTzNHujkHwa/FSdWi+520ZiuGHlL+1F+eejBibFq+d0q+Mus?=
 =?iso-8859-1?Q?gTswHeg+ws7OwTlV06K8x/DqeBwtiqtfYHca6PEDRgyf6MbuBb9wlfnxAb?=
 =?iso-8859-1?Q?YLHDYWbK8HWNZJwVeDE9h0NsBtBh0k9cQeTU8fzWiqu8xMFQlctYezX3cJ?=
 =?iso-8859-1?Q?I01bZqh1ZVuIHHZmmt4HWUmry+OJ6NpbjPwpZkrqTh5DdehYF5L9jqTp0p?=
 =?iso-8859-1?Q?AlMywfAHcR5ug6E3SNHfY/axh+aWoFRo60diFYO5ji+F100vgjUsb/D/2j?=
 =?iso-8859-1?Q?R+czVSiRF1Csm2Er2hOifOOIJq9IeLgiV/Eld0I7Vx8pl/gl3nQMMKpA2L?=
 =?iso-8859-1?Q?DqCC0Db/XOCUrxyNx7Lqy8CmtPnrIHok7z+WTuvHD0u+ZxqxUVGnam0wZo?=
 =?iso-8859-1?Q?R8vCltlqE9Uy0mDqpN6vG91AZfhKH5JeNfn4FnZzehhXAhE+q1BtEe1Ci5?=
 =?iso-8859-1?Q?BZAakHWnmgiJB/vEFWzzSP7QBl2KnDmsB4ef+EH7OZsQROwY6ONxQzVx7C?=
 =?iso-8859-1?Q?OoK/EUec3ERgPIKNRPIlHmGkXB3x80YgSRba2d/yIkge7zB1Liyrv5EfKH?=
 =?iso-8859-1?Q?iYx0d4DeHAns7yn86sHS/bpsKkb1lIKgi5wHtfhHLbRicMW+CE+KK1o1ls?=
 =?iso-8859-1?Q?jLkB98HUgOrDEZowZlBwhtV95Y7PajZzBAlPrjZaG7sBv2af+PXKN8Q0qB?=
 =?iso-8859-1?Q?AADf0DbUaii706x8ZXSqnL80VekAX+aUi2PdSAzzxQDd8cCVl2Ayo3RRwz?=
 =?iso-8859-1?Q?IxnWw1GVi8I1TEpWbXvwNQT545DF08OFOkzxKHdUJo6H7Xo4k3OelFuxCA?=
 =?iso-8859-1?Q?g/iJeaQCXyk5k1mKgAqh5rdmT1vn1RYoYSElooEDe5OLelQ7gxkptidAvP?=
 =?iso-8859-1?Q?knmp2Rzyqj3uKSZzVAz2SqekK5F9dxvCbdgVdWJZgV45U6nNc4iB9I1rV0?=
 =?iso-8859-1?Q?Qhc49hBG4DhJGf14Wh/QeZBl3ynj6vsPaTUcGQfB6zhVYrcc1K4jAUeYZQ?=
 =?iso-8859-1?Q?7IQsVLgHr1MDRzxYJ094M96n6CwXm/RocK6JWyTalDVG7NgjRY6f2RqRAC?=
 =?iso-8859-1?Q?KCowYxR26nD1nKsG15/opVCQ56/GVx3BNUTTS12YRnSPhJwnMu6RcPDy9C?=
 =?iso-8859-1?Q?PzCV4AI7d8QK6d2Vky7WAbaGrolGq+ny/nuNsIj224M3I7OHVdbsNFkUZg?=
 =?iso-8859-1?Q?vYF1nzkrCuOpIkJ+kQlXLS8eWeU5jY4xdQYCZnXujMaKQqUAlZzyx6hw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 29da5cf4-af18-4238-dbff-08dc21b6e940
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2024 17:14:26.1877 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jzRxV90lHpkq/CF7uX8oXp/EOsSd927FxuPjAVfI2VmjJRYAKzl9kxPlKAv+dT5gu9JmOOuhu68ZMO6JvpZ6ug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR11MB5636
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, Jan 24, 2024 at 11:45:24AM +0200, Jani Nikula wrote:
> On Tue, 23 Jan 2024, Matthew Brost <matthew.brost@intel.com> wrote:
> > Using BIT/GENMASK macros is a better convention than using manual shift
> > and will also fix build errors [1].
> 
> One of the reasons i915 does not really use BIT and GENMASK directly is
> that their type is unsigned long, and thus their size is different on 32
> and 64 bit builds, while almost invariably you need one or the other to
> describe hardware or firmware interfaces. Not something that depends on
> the build.
> 
> Using %lu or %lx as format specifier should work, but people find it
> weird to have to use that for essentially 32-bit things, and forget. And
> there's confusion when you still have stuff like:
> 
> #define GUC_CTB_STATUS_NO_ERROR				0
> 
> instead of 0UL i.e. some of the macros end up being unsigned long with
> variable size, and some, like this, not.
> 
> I'm sure the REG_BIT and REG_GENMASK macros feel off-putting for things
> that aren't exactly registers (like the firmware interface), but let's
> hope we get Lucas' fixed-size BIT and GENMASK macros merged [1], and can
> use them.
> 

I'm fine with using these new macros but I believe we need to get a fix
into 6.8 and unsure if Lucas's series is going to land before then. Are
you ok with landing this series as is for now and updating all of the
defines in Xe in a follow up? Or do you have other ideas of how to
proceed for 6.8?

> BR,
> Jani.
> 
> 
> [1] https://lore.kernel.org/r/20240124050205.3646390-1-lucas.demarchi@intel.com
> 
> 
> >
> > [1] http://kisskb.ellerman.id.au/kisskb/buildresult/15112475/log/

Need to fix this link too.

Matt

> >
> > v2:
> > - Include abi/*.h files (Jani / Michal)
> >
> > Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
> > Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >  drivers/gpu/drm/xe/abi/guc_actions_abi.h      | 13 ++++----
> >  drivers/gpu/drm/xe/abi/guc_actions_slpc_abi.h |  4 +--
> >  .../drm/xe/abi/guc_communication_ctb_abi.h    | 14 ++++-----
> >  drivers/gpu/drm/xe/abi/guc_klvs_abi.h         |  6 ++--
> >  drivers/gpu/drm/xe/abi/guc_messages_abi.h     | 31 +++++++++----------
> >  drivers/gpu/drm/xe/xe_guc_ct.c                |  2 +-
> >  drivers/gpu/drm/xe/xe_guc_relay.c             |  2 +-
> >  7 files changed, 35 insertions(+), 37 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/xe/abi/guc_actions_abi.h b/drivers/gpu/drm/xe/abi/guc_actions_abi.h
> > index 3062e0e0d467..083bd966829b 100644
> > --- a/drivers/gpu/drm/xe/abi/guc_actions_abi.h
> > +++ b/drivers/gpu/drm/xe/abi/guc_actions_abi.h
> > @@ -50,8 +50,8 @@
> >  
> >  #define HOST2GUC_SELF_CFG_REQUEST_MSG_LEN		(GUC_HXG_REQUEST_MSG_MIN_LEN + 3u)
> >  #define HOST2GUC_SELF_CFG_REQUEST_MSG_0_MBZ		GUC_HXG_REQUEST_MSG_0_DATA0
> > -#define HOST2GUC_SELF_CFG_REQUEST_MSG_1_KLV_KEY		(0xffff << 16)
> > -#define HOST2GUC_SELF_CFG_REQUEST_MSG_1_KLV_LEN		(0xffff << 0)
> > +#define HOST2GUC_SELF_CFG_REQUEST_MSG_1_KLV_KEY		GENMASK(31, 16)
> > +#define HOST2GUC_SELF_CFG_REQUEST_MSG_1_KLV_LEN		GENMASK(15, 0)
> >  #define HOST2GUC_SELF_CFG_REQUEST_MSG_2_VALUE32		GUC_HXG_REQUEST_MSG_n_DATAn
> >  #define HOST2GUC_SELF_CFG_REQUEST_MSG_3_VALUE64		GUC_HXG_REQUEST_MSG_n_DATAn
> >  
> > @@ -177,15 +177,14 @@ enum xe_guc_sleep_state_status {
> >  #define XE_GUC_SLEEP_STATE_INVALID_MASK 0x80000000
> >  };
> >  
> > -#define GUC_LOG_CONTROL_LOGGING_ENABLED	(1 << 0)
> > -#define GUC_LOG_CONTROL_VERBOSITY_SHIFT	4
> > -#define GUC_LOG_CONTROL_VERBOSITY_MASK	(0xF << GUC_LOG_CONTROL_VERBOSITY_SHIFT)
> > -#define GUC_LOG_CONTROL_DEFAULT_LOGGING	(1 << 8)
> > +#define GUC_LOG_CONTROL_LOGGING_ENABLED	BIT(0)
> > +#define GUC_LOG_CONTROL_VERBOSITY_MASK	GENMASK(7, 4)
> > +#define GUC_LOG_CONTROL_DEFAULT_LOGGING	BIT(8)
> >  
> >  #define XE_GUC_TLB_INVAL_TYPE_SHIFT 0
> >  #define XE_GUC_TLB_INVAL_MODE_SHIFT 8
> >  /* Flush PPC or SMRO caches along with TLB invalidation request */
> > -#define XE_GUC_TLB_INVAL_FLUSH_CACHE (1 << 31)
> > +#define XE_GUC_TLB_INVAL_FLUSH_CACHE BIT(31)
> >  
> >  enum xe_guc_tlb_invalidation_type {
> >  	XE_GUC_TLB_INVAL_FULL = 0x0,
> > diff --git a/drivers/gpu/drm/xe/abi/guc_actions_slpc_abi.h b/drivers/gpu/drm/xe/abi/guc_actions_slpc_abi.h
> > index 811add10c30d..ff49f283f5c3 100644
> > --- a/drivers/gpu/drm/xe/abi/guc_actions_slpc_abi.h
> > +++ b/drivers/gpu/drm/xe/abi/guc_actions_slpc_abi.h
> > @@ -242,8 +242,8 @@ struct slpc_shared_data {
> >  		(HOST2GUC_PC_SLPC_REQUEST_REQUEST_MSG_MIN_LEN + \
> >  			HOST2GUC_PC_SLPC_EVENT_MAX_INPUT_ARGS)
> >  #define HOST2GUC_PC_SLPC_REQUEST_MSG_0_MBZ		GUC_HXG_REQUEST_MSG_0_DATA0
> > -#define HOST2GUC_PC_SLPC_REQUEST_MSG_1_EVENT_ID		(0xff << 8)
> > -#define HOST2GUC_PC_SLPC_REQUEST_MSG_1_EVENT_ARGC	(0xff << 0)
> > +#define HOST2GUC_PC_SLPC_REQUEST_MSG_1_EVENT_ID		GENMASK(15, 8)
> > +#define HOST2GUC_PC_SLPC_REQUEST_MSG_1_EVENT_ARGC	GENMASK(7, 0)
> >  #define HOST2GUC_PC_SLPC_REQUEST_MSG_N_EVENT_DATA_N	GUC_HXG_REQUEST_MSG_n_DATAn
> >  
> >  #endif
> > diff --git a/drivers/gpu/drm/xe/abi/guc_communication_ctb_abi.h b/drivers/gpu/drm/xe/abi/guc_communication_ctb_abi.h
> > index 4aaed1cb4e12..d7e4dd92c313 100644
> > --- a/drivers/gpu/drm/xe/abi/guc_communication_ctb_abi.h
> > +++ b/drivers/gpu/drm/xe/abi/guc_communication_ctb_abi.h
> > @@ -49,9 +49,9 @@ struct guc_ct_buffer_desc {
> >  	u32 tail;
> >  	u32 status;
> >  #define GUC_CTB_STATUS_NO_ERROR				0
> > -#define GUC_CTB_STATUS_OVERFLOW				(1 << 0)
> > -#define GUC_CTB_STATUS_UNDERFLOW			(1 << 1)
> > -#define GUC_CTB_STATUS_MISMATCH				(1 << 2)
> > +#define GUC_CTB_STATUS_OVERFLOW				BIT(0)
> > +#define GUC_CTB_STATUS_UNDERFLOW			BIT(1)
> > +#define GUC_CTB_STATUS_MISMATCH				BIT(2)
> >  	u32 reserved[13];
> >  } __packed;
> >  static_assert(sizeof(struct guc_ct_buffer_desc) == 64);
> > @@ -82,11 +82,11 @@ static_assert(sizeof(struct guc_ct_buffer_desc) == 64);
> >  #define GUC_CTB_HDR_LEN				1u
> >  #define GUC_CTB_MSG_MIN_LEN			GUC_CTB_HDR_LEN
> >  #define GUC_CTB_MSG_MAX_LEN			(GUC_CTB_MSG_MIN_LEN + GUC_CTB_MAX_DWORDS)
> > -#define GUC_CTB_MSG_0_FENCE			(0xffff << 16)
> > -#define GUC_CTB_MSG_0_FORMAT			(0xf << 12)
> > +#define GUC_CTB_MSG_0_FENCE			GENMASK(31, 16)
> > +#define GUC_CTB_MSG_0_FORMAT			GENMASK(15, 12)
> >  #define   GUC_CTB_FORMAT_HXG			0u
> > -#define GUC_CTB_MSG_0_RESERVED			(0xf << 8)
> > -#define GUC_CTB_MSG_0_NUM_DWORDS		(0xff << 0)
> > +#define GUC_CTB_MSG_0_RESERVED			GENMASK(11, 8)
> > +#define GUC_CTB_MSG_0_NUM_DWORDS		GENMASK(7, 0)
> >  #define   GUC_CTB_MAX_DWORDS			255
> >  
> >  /**
> > diff --git a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
> > index 47094b9b044c..076d072cb8b3 100644
> > --- a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
> > +++ b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
> > @@ -31,9 +31,9 @@
> >   */
> >  
> >  #define GUC_KLV_LEN_MIN				1u
> > -#define GUC_KLV_0_KEY				(0xffff << 16)
> > -#define GUC_KLV_0_LEN				(0xffff << 0)
> > -#define GUC_KLV_n_VALUE				(0xffffffff << 0)
> > +#define GUC_KLV_0_KEY				GENMASK(31, 16)
> > +#define GUC_KLV_0_LEN				GENMASK(15, 0)
> > +#define GUC_KLV_n_VALUE				GENMASK(31, 0)
> >  
> >  /**
> >   * DOC: GuC Self Config KLVs
> > diff --git a/drivers/gpu/drm/xe/abi/guc_messages_abi.h b/drivers/gpu/drm/xe/abi/guc_messages_abi.h
> > index ff888d16bd4f..7cc79c0ce3bb 100644
> > --- a/drivers/gpu/drm/xe/abi/guc_messages_abi.h
> > +++ b/drivers/gpu/drm/xe/abi/guc_messages_abi.h
> > @@ -6,6 +6,8 @@
> >  #ifndef _ABI_GUC_MESSAGES_ABI_H
> >  #define _ABI_GUC_MESSAGES_ABI_H
> >  
> > +#include <linux/bits.h>
> > +
> >  /**
> >   * DOC: HXG Message
> >   *
> > @@ -41,10 +43,10 @@
> >   */
> >  
> >  #define GUC_HXG_MSG_MIN_LEN			1u
> > -#define GUC_HXG_MSG_0_ORIGIN			(0x1 << 31)
> > +#define GUC_HXG_MSG_0_ORIGIN			BIT(31)
> >  #define   GUC_HXG_ORIGIN_HOST			0u
> >  #define   GUC_HXG_ORIGIN_GUC			1u
> > -#define GUC_HXG_MSG_0_TYPE			(0x7 << 28)
> > +#define GUC_HXG_MSG_0_TYPE			GENMASK(30, 28)
> >  #define   GUC_HXG_TYPE_REQUEST			0u
> >  #define   GUC_HXG_TYPE_EVENT			1u
> >  #define   GUC_HXG_TYPE_FAST_REQUEST		2u
> > @@ -52,8 +54,8 @@
> >  #define   GUC_HXG_TYPE_NO_RESPONSE_RETRY	5u
> >  #define   GUC_HXG_TYPE_RESPONSE_FAILURE		6u
> >  #define   GUC_HXG_TYPE_RESPONSE_SUCCESS		7u
> > -#define GUC_HXG_MSG_0_AUX			(0xfffffff << 0)
> > -#define GUC_HXG_MSG_n_PAYLOAD			(0xffffffff << 0)
> > +#define GUC_HXG_MSG_0_AUX			GENMASK(27, 0)
> > +#define GUC_HXG_MSG_n_PAYLOAD			GENMASK(31, 0)
> >  
> >  /**
> >   * DOC: HXG Request
> > @@ -87,8 +89,8 @@
> >   */
> >  
> >  #define GUC_HXG_REQUEST_MSG_MIN_LEN		GUC_HXG_MSG_MIN_LEN
> > -#define GUC_HXG_REQUEST_MSG_0_DATA0		(0xfff << 16)
> > -#define GUC_HXG_REQUEST_MSG_0_ACTION		(0xffff << 0)
> > +#define GUC_HXG_REQUEST_MSG_0_DATA0		GENMASK(27, 16)
> > +#define GUC_HXG_REQUEST_MSG_0_ACTION		GENMASK(15, 0)
> >  #define GUC_HXG_REQUEST_MSG_n_DATAn		GUC_HXG_MSG_n_PAYLOAD
> >  
> >  /**
> > @@ -119,8 +121,8 @@
> >   */
> >  
> >  #define GUC_HXG_EVENT_MSG_MIN_LEN		GUC_HXG_MSG_MIN_LEN
> > -#define GUC_HXG_EVENT_MSG_0_DATA0		(0xfff << 16)
> > -#define GUC_HXG_EVENT_MSG_0_ACTION		(0xffff << 0)
> > +#define GUC_HXG_EVENT_MSG_0_DATA0		GENMASK(27, 16)
> > +#define GUC_HXG_EVENT_MSG_0_ACTION		GENMASK(15, 0)
> >  #define GUC_HXG_EVENT_MSG_n_DATAn		GUC_HXG_MSG_n_PAYLOAD
> >  
> >  /**
> > @@ -190,8 +192,8 @@
> >   */
> >  
> >  #define GUC_HXG_FAILURE_MSG_LEN			GUC_HXG_MSG_MIN_LEN
> > -#define GUC_HXG_FAILURE_MSG_0_HINT		(0xfff << 16)
> > -#define GUC_HXG_FAILURE_MSG_0_ERROR		(0xffff << 0)
> > +#define GUC_HXG_FAILURE_MSG_0_HINT		GENMASK(27, 16)
> > +#define GUC_HXG_FAILURE_MSG_0_ERROR		GENMASK(15, 0)
> >  
> >  /**
> >   * DOC: HXG Response
> > @@ -221,12 +223,9 @@
> >  #define GUC_HXG_RESPONSE_MSG_n_DATAn		GUC_HXG_MSG_n_PAYLOAD
> >  
> >  /* deprecated */
> > -#define INTEL_GUC_MSG_TYPE_SHIFT	28
> > -#define INTEL_GUC_MSG_TYPE_MASK		(0xF << INTEL_GUC_MSG_TYPE_SHIFT)
> > -#define INTEL_GUC_MSG_DATA_SHIFT	16
> > -#define INTEL_GUC_MSG_DATA_MASK		(0xFFF << INTEL_GUC_MSG_DATA_SHIFT)
> > -#define INTEL_GUC_MSG_CODE_SHIFT	0
> > -#define INTEL_GUC_MSG_CODE_MASK		(0xFFFF << INTEL_GUC_MSG_CODE_SHIFT)
> > +#define INTEL_GUC_MSG_TYPE_MASK		GENMASK(31, 28)
> > +#define INTEL_GUC_MSG_DATA_MASK		GENMASK(27, 16)
> > +#define INTEL_GUC_MSG_CODE_MASK		GENMASK(15, 0)
> >  
> >  enum intel_guc_msg_type {
> >  	INTEL_GUC_MSG_TYPE_REQUEST = 0x0,
> > diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> > index ee5d99456aeb..fc5cc2b2bcc5 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> > @@ -866,7 +866,7 @@ static int parse_g2h_response(struct xe_guc_ct *ct, u32 *msg, u32 len)
> >  	 */
> >  	if (fence & CT_SEQNO_UNTRACKED) {
> >  		if (type == GUC_HXG_TYPE_RESPONSE_FAILURE)
> > -			xe_gt_err(gt, "FAST_REQ H2G fence 0x%x failed! e=0x%x, h=%u\n",
> > +			xe_gt_err(gt, "FAST_REQ H2G fence 0x%x failed! e=0x%lx, h=%lu\n",
> >  				  fence,
> >  				  FIELD_GET(GUC_HXG_FAILURE_MSG_0_ERROR, hxg[0]),
> >  				  FIELD_GET(GUC_HXG_FAILURE_MSG_0_HINT, hxg[0]));
> > diff --git a/drivers/gpu/drm/xe/xe_guc_relay.c b/drivers/gpu/drm/xe/xe_guc_relay.c
> > index c0a2d8d5d3b3..2d1f19270d9a 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_relay.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_relay.c
> > @@ -300,7 +300,7 @@ static int relay_send_transaction(struct xe_guc_relay *relay, struct relay_trans
> >  		ret = -EPROTO;
> >  	}
> >  	if (unlikely(ret < 0)) {
> > -		relay_notice(relay, "Failed to send %s.%x to GuC (%pe) %*ph ...\n",
> > +		relay_notice(relay, "Failed to send %s.%lx to GuC (%pe) %*ph ...\n",
> >  			     guc_hxg_type_to_string(FIELD_GET(GUC_HXG_MSG_0_TYPE, buf[0])),
> >  			     FIELD_GET(GUC_HXG_REQUEST_MSG_0_ACTION, buf[0]),
> >  			     ERR_PTR(ret), (int)sizeof(u32) * txn->offset, buf);
> 
> -- 
> Jani Nikula, Intel
