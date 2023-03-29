Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D85EDC6FD18
	for <intel-xe@archiver.kernel.org>; Wed, 29 Mar 2023 19:25:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9EEA10E055;
	Wed, 29 Mar 2023 19:25:46 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF25F10E055
 for <intel-xe@lists.freedesktop.org>; Wed, 29 Mar 2023 19:25:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680117944; x=1711653944;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=I7EWT2rZpU0FAZK89EpowXxX9IahH+/zsIjo73WuXDM=;
 b=J3FuV6SBPmEQ1fygjt3uwyrp3eVTh0VJphQqniPyBGhDE2N2AhIheb5Z
 ZpBIAZ9W8hX1MB6jr5rNhNDTbodxf83U6GX/gwhCgYSPsWImij/3BMbZb
 QqSEo3Tkl9GXvxcZWCBeHMeDfigrsHUWUi82R2FcQShI9twA/iFLXQsO6
 Z8Izzv2upk5SZtt0IRYXWTyD79UDbyUlcC1wkI0/BWq601mYR5gKOGoeg
 /2NtaXoTxHqQMOAH8MSBW0DrvwNHuDycERzsHtVFJqqixEg48k0EDZEv8
 kG0Zua6zEWQu2BRNMESO8pnQBW+gMD6WqWFVTq+YRLvkC19skyvrWVZ2o Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10664"; a="339705139"
X-IronPort-AV: E=Sophos;i="5.98,301,1673942400"; d="scan'208";a="339705139"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Mar 2023 12:25:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10664"; a="828008415"
X-IronPort-AV: E=Sophos;i="5.98,301,1673942400"; d="scan'208";a="828008415"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga001.fm.intel.com with ESMTP; 29 Mar 2023 12:25:44 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 29 Mar 2023 12:25:43 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 29 Mar 2023 12:25:43 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Wed, 29 Mar 2023 12:25:43 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.170)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Wed, 29 Mar 2023 12:25:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M32qcKDKyOIX0QU/wAjDSvWbhrRhrmNfNOpEE310jBe7iMY+ytzEZ2hU7O04B64eufFQU7fVzW9sFR2cK1F/lC1IR8lWRUiyV3Ap3ywbYuBBcqqiV6d6fIZX8C47vz0tibELqJwsZpzgrPvIhOLzvT0VA3oKAtfM4fBeWrY50FN9CyFXT24Xm56df/TNfveP13iorf/gfivPRZ7jGff2fAp4Xdq7i9i9ENHSpsutPIfRy5BwfPpQuwKJ6UbWutTLNGKLstlpascHva3NUYcrkUXUfjwZtzogK34nxO1ncstTT4FibCvzyVJAayuAjGDMg0C4Irg+a7nrVqQTnIJsPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x+OhGVk51YBPSz8GUZrZHItFdU5GCrccRK1NqwvEZd0=;
 b=IKClUxnhxXlNuIceie4IGyz5So/YVz+MM2eQXW0E/rmOLeE7N8qXSXYK2esWggYKZEXJpEEelH96vmWr4bg5W4IR1gb1jcb9PVaC5v+uuBCtH3I6zVf6q1d3FPO7hjHB6B4/y+paHgF6JduS6A6zPWxmtzyI/cRnyWUEJzSe/XHMhSDruIe0OWlryri1jbbqkr3lZznICQ/bPO9eRYLSkgH1D068ekoty3Oa8IYDeUKUTbsAhepJnkuRRwkG+Zm8BVRd3BAr5mStKuE2mtXpwoxTK1Kyokn+GadXS57F9A+edF2azwn1flmUxDg0KZmIdr2tzsN7bShG2tmzQYX2WA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SJ0PR11MB4895.namprd11.prod.outlook.com (2603:10b6:a03:2de::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.35; Wed, 29 Mar
 2023 19:25:41 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::2b57:646c:1b01:cd18]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::2b57:646c:1b01:cd18%6]) with mapi id 15.20.6222.032; Wed, 29 Mar 2023
 19:25:41 +0000
Date: Wed, 29 Mar 2023 15:25:36 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
Message-ID: <ZCSQsJ6iSAW+vwjr@intel.com>
References: <20230328161021.669017-1-rodrigo.vivi@intel.com>
 <20230328161021.669017-5-rodrigo.vivi@intel.com>
 <20230328202446.GL4085390@mdroper-desk1.amr.corp.intel.com>
 <fbd73cb1d45a956ed723ba4806e38c78337b37e0.camel@intel.com>
 <09b3de5d-4b8a-bf41-5e18-c583958b39b1@intel.com>
 <87o7ob52ga.fsf@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87o7ob52ga.fsf@intel.com>
X-ClientProxiedBy: SJ0PR13CA0048.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::23) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SJ0PR11MB4895:EE_
X-MS-Office365-Filtering-Correlation-Id: ec7cbfbb-d625-4f09-9a54-08db308b6252
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dn0G5Qs+PABGXOBV9RLgHg1chKt8YHp2+AZmeEZbZV56qNByYa2gDg/MDfwsUH7YU9JAiy5kXkp24M5i6womYB5zyHp9jIRy6Uc/vFK7AI/1jaPiC48VEe6Drwfu4DR4K0tyqs06BTZkASFDC9PzEYuD93mMGS9ZeAUnUfWmiJTjwawECr5b15cDcQwzPsMv2ESoU+NeJSbJg1n4EAeccSH+xeGVTcVfDAkBwST6HY1oERgigC0JghbwI6bIYsHjGxHLl/jYC/bjOqIPMYNAvfCeMZzuXLNDqCYUt+agkBOUz3I4AbN2RJtjBQIYgAq1SsiA3UgLTYwamUVgvgK9fAT05BfTMWKl2/e8M9hRlJpoY0f9ySst6DsEQPuVE9yewgbIuNs+xmEnS4FoDYVa+uelrzzKU7GdCNkRuTjZFIJ+hWoTNY2xJCuv8LMdlsWfFz1XHymSzIX+iY6TIx3cG5b3rZo1zBLDMPyhHsbbgsJmOiBiIf8opyc+/glTZJWgIMxnNgcdaF/I3J+EUG42oRP6rOLI5IVLQXtS5RA98F9sqkxwmaEwbffIWEdCt8Q2aw+oMleh497EYGqUd607efcZksge2ABwp2cYXoeaAVE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(346002)(396003)(366004)(39860400002)(136003)(451199021)(26005)(6666004)(82960400001)(53546011)(38100700002)(6486002)(2616005)(478600001)(186003)(44832011)(5660300002)(8936002)(2906002)(6506007)(36756003)(316002)(54906003)(6512007)(4326008)(41300700001)(6916009)(86362001)(66946007)(66476007)(8676002)(66556008)(83380400001)(66899021)(67856001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?9FLzieHuok8tBr9EzK4o/f/ZahyZuVrO+IH6ZqzI+62DPN+oD6tJpPYaw+?=
 =?iso-8859-1?Q?nJAhe8rFDGiDKYVUim/ZmsO2eSUf7TFFbo9YdiMBRzF6MoOSjxfqS95k2p?=
 =?iso-8859-1?Q?YTwJfwzz+c/Ke2TsBuWo7wTGNnDAZkjP/KweY+FJmcBz16u8tQYIbAVuFg?=
 =?iso-8859-1?Q?ZXhpBAM02q00taPXLnG7wL+WLn85d/+1udee2hkziBaAU/hf5lgpNP0i5l?=
 =?iso-8859-1?Q?+pD2BeXmtIUJlBVAbglvcugDDj5KWGy6Xr5ALXKxNhKwLIGWp5gkVOKa1K?=
 =?iso-8859-1?Q?njPoG97YkkCUk44ZlDV1b5rbfBfiKdoaGYbNMU/EQN5F2oqlitXVM6CnoD?=
 =?iso-8859-1?Q?tlSR1qcnD6KjsiGJRPrHQkTHBoLic1PzVGIR4V++sUKEYiHWNR1rVVuOGl?=
 =?iso-8859-1?Q?29lbH2/RLVks+sda+R93d0OM7/KPDSNesIUGUwJ1DyXITeSBvnmAnTUdVH?=
 =?iso-8859-1?Q?JWskRn2wPO5UU0UywyLnD5caV5l1NdISkLeo0kjwac8xxkoX4SYwSfvfGV?=
 =?iso-8859-1?Q?r8xU+A58kdKOtSzvPZbnZcFdflNl1TkCplPWfRZZbs9UrV8/3EYNN+gRZA?=
 =?iso-8859-1?Q?dckcEwS9gc2nDKD13MnGMOUcxwEC9ohG8rova9gUIvFaRuE6qCm8g8VMDi?=
 =?iso-8859-1?Q?8DRhPxT/BIkO60V3bEdVccdVxl44l+CT9Wq1nU+3kCkppfpUNfcrVDpAO+?=
 =?iso-8859-1?Q?P/19yPYHo8694iewbegKFISjBIkBypkVp19tNYthEgzZhSBGWcYLVKZGiq?=
 =?iso-8859-1?Q?U4mG9njMV+e2tJEC7YYk1wFfDkLh3foxo8Wmhjjcfi80c4KLjk/qJpdaZL?=
 =?iso-8859-1?Q?MYhwbwVkSPoDlE0ZHUh0OHogPdYNDXNpUh55bgk9muuA0P8AjQH+hCRMww?=
 =?iso-8859-1?Q?wH+hh45gjEa1lVpUww80CizxnhB+SwRfjj+0V2otpdo42UFO7+SxQuC+6N?=
 =?iso-8859-1?Q?ILS8VFHY8FXRdy9hd6f1PcdnvbgXYHp/0USUieLxkL4U/eGISubQmInN3k?=
 =?iso-8859-1?Q?Df72+cjDJC6X9kNDjM28OtXYFP3bApQ/SufTS8nJ1tKKfWs6Cz/iBul7oL?=
 =?iso-8859-1?Q?z7a55p6ZueedhBdpDSYdrN80B7giKGIdi6VXbnsMS+uvahT9vRQf82kNcU?=
 =?iso-8859-1?Q?u7rm+r5t/xKIqX91S3LaDsjBujszUeILRyU/kqoJBNxaBkz3MiiEk6L6QB?=
 =?iso-8859-1?Q?/+a/bCrtRtFzKj0uW5cJ5iqTXFBAtpGvnRc6d4l+R6Lslv39TfnTse0a8v?=
 =?iso-8859-1?Q?f47/vle+Tfe/IvFek1xH+JsJSuvm7pTHs3Y0c/aipjIQPeIYuHeznVRM5F?=
 =?iso-8859-1?Q?9H/DRHOJ+lr3Z2d0JUjPJHixCUESBslGzqVzEYWZJyFEIAlY429DNAxZxN?=
 =?iso-8859-1?Q?deLMU/B+iX2zuD/egg3suO8fF34pxcw1VRNSwOjMBYzvsi8Djcbu4jg2sB?=
 =?iso-8859-1?Q?Nbt0Qw2w2J+8USF0wN2HjKl+cqy/t+xCgNXT5HlQlusNQ7mgq+L/Od1XGd?=
 =?iso-8859-1?Q?3/IGOgb14faXzv8qoqrz6F6uwD4TNiqNMR/UsLU6SRnmT74/bC8tL39r+B?=
 =?iso-8859-1?Q?0S5+UtR1NEJV/MQtMr3lj+N3qqu349U0Ci6dqjaxbQGBUB1Ir3UV+7VhQ0?=
 =?iso-8859-1?Q?AeEcmhryZkh76Iz2v4FFBc3+AFGNKchCQm?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ec7cbfbb-d625-4f09-9a54-08db308b6252
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Mar 2023 19:25:41.4929 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0KbBh0FlwP6WwMcGkyJfJSyANV1WdE3hIwSh5pbJzhy9nvbzpEiF6JVeJSolvu4HKKx/suJb2La4FS7hoBXuDA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4895
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [RFC 4/5] drm/xe: Remove useless XE_BUG_ON.
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
Cc: "Roper, Matthew D" <matthew.d.roper@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, Mar 29, 2023 at 12:31:01PM +0300, Jani Nikula wrote:
> On Tue, 28 Mar 2023, Michal Wajdeczko <michal.wajdeczko@intel.com> wrote:
> > On 28.03.2023 22:27, Vivi, Rodrigo wrote:
> >> On Tue, 2023-03-28 at 13:24 -0700, Matt Roper wrote:
> >>> On Tue, Mar 28, 2023 at 12:10:20PM -0400, Rodrigo Vivi wrote:
> >>>> If that becomes needed for some reason we bring it
> >>>> back with some written reasoning.
> >>>
> >>> From a quick skim through this patch, most/all of these shouldn't be
> >>> BUG_ON either.  These are assertions that we don't expect to get
> >>> triggered, but if we do screw up somewhere we shouldn't be bringing
> >>> down
> >>> the entire machine; a WARN (and possibly an early exit) would be more
> >>> appropriate for most of these.
> >> 
> >> yeap! I fully agree on that. I get frustrated when I hit one of these
> >> BUG_ONs that should be a graceful exit with a warn without a panic...
> >
> > Recently there was another discussion with proposal to introduce
> > XE_ASSERT as a replacement of XE_BUG_ON - is this still considered ?
> >
> > We likely don't want to pollute production driver with too many
> > redundant BUG_ON/WARN_ON, but still want be paranoid on debug builds
> > (with just WARNs and continuing until the unavoidable crash).
> 
> There are a number of related factors here. From least subjective to
> most subjective:
> 
> First, the trend in kernel is to pretty much never use BUG_ON. The idea
> is that you WARN_ON, and it's the userspace policy to set panic_on_warn
> to oops. This includes the CI.
> 
> Second, each of the macros could use a comment describing what it does,
> what it does not, what it should be used for, and what not. Currently
> there is zero, neither in xe or i915. Everyone just figures it out for
> themselves or cargo-cults.
> 
> Third, I think having *BUG_ON/*WARN_ON in the name of a local macro that
> behaves differently from the originals is misleading. To this end I
> suggested naming it ASSERT something or other to model it after C
> standard library assert(3) that generates no code for NDEBUG. IMO it
> implies debug build behaviour better than *BUG_ON. I think the current
> *BUG_ON/*WARN_ON give a false sense of security regarding input
> validation.
> 
> (I understand the need for asserts that generate no code for non-debug
> builds when the asserts have a performance impact.)

But is this a problem only for i915 and xe? how other drivers are dealing
with this?

> 
> Fourth, I do think the current *BUG_ONs are being used too
> liberally. They're everywhere, so more is added everywhere. That's the
> example being followed. Shouldn't happen so no harm in adding a check,
> right? Well, I'm not so sure about that. There are 1300+ GEM_BUG_ON's
> and GEM_WARN_ON's in i915. (Of which only 4 under display, but that's
> probably due to the "GEM" naming as well as my opinion of them.)

should we already scrutinize all the XE_BUG_ON and move most of them
to XE_WARN_ON? then do the renaming? and probably create the assert?
or the other way around?



> 
> 
> BR,
> Jani.
> 
> 
> 
> -- 
> Jani Nikula, Intel Open Source Graphics Center
