Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E67DAEB64D8
	for <intel-xe@archiver.kernel.org>; Thu, 22 Jun 2023 12:51:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A933110E1A5;
	Thu, 22 Jun 2023 12:51:56 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C048510E1A5
 for <intel-xe@lists.freedesktop.org>; Thu, 22 Jun 2023 12:51:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1687438315; x=1718974315;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=LcI4fWSykO4exau8uIjzFUHVG91zOtEGeev+6BAs4v4=;
 b=lHbn317LpX8JAuIdKS9x5AUUOX/g1Pab9mcZuFWehW5EGsdxBzh1ePi9
 Cj4zPjsucvpWPxopm3QKDoo4aD0uBsZAgfyXqzqcCGlvjUZ1SR0eh4hFt
 1uzh9tdG2g6gSAEI79S9qO+XXubKSQJOmlwL+AYN6PofXwzlO3FkIkHK+
 sTsDg/D0bjAoCzpz7l+nGScftZOww4ihMvxfu5fNH/Zouch00W6pOmlqj
 +nRSn1eCH1VKov06SuPtVYfIn1Qp6jSbu+Chx5sfZDrgO9jiKbmty9Lg6
 Ma3ZPAXzqAIxN6Czn4Mxa96/sl6Cr0UVSEy/QQoOYhq3ZBghaxBeDzqH1 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10748"; a="340814580"
X-IronPort-AV: E=Sophos;i="6.00,263,1681196400"; d="scan'208";a="340814580"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2023 05:51:53 -0700
X-IronPort-AV: E=McAfee;i="6600,9927,10748"; a="749262886"
X-IronPort-AV: E=Sophos;i="6.00,263,1681196400"; d="scan'208";a="749262886"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga001.jf.intel.com with ESMTP; 22 Jun 2023 05:51:53 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 22 Jun 2023 05:51:52 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 22 Jun 2023 05:51:52 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.102)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 22 Jun 2023 05:51:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FtMXFJofFzrBs5+xW7UwrNFwM81N0hXPLqDZeBHRQCTTblcLNFnOygPD+vsJKUxgLq7dfHju6uZUOX7gxrhEi2yNBTxcD3Xm/tsfFCYOu2x5bFMS306iWLSRdst/8ARf+Ck5lgglcOzANJtFGQJHR5XMHe8G8HO8D8x9eCli/gLE1J+JJgGE+jKWErq33XgJa9MxPj6jSYUb793YsCngbkWCFB5VwvmI4TrDPXVXmYP1MeYW0o1k2NG3q1pf6ueCgd77lw+wRnNi3vWz0hOj/+r7QXXap0+9tLERqb5KQ2+eNLB457PlShH0+qpyRwHheBA+6vJQ9lBqxWlTQfzKHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HsMaW6nh+fec0v2ySbM/1Grw6PJf8iqAeGq2tA2qm2E=;
 b=EiHS0JNWhblNXWl4wrkhE3ymQ+Ivy0gBAxP9ItjPkDXoeI4DdTzMtXWn2gqYQZHGBWx1Kfb38TaA9WPGiwda58Wi7PuOUCY33jILcKJQWUMkqvC+p2hGHl/tKJGJRqjXla8eZRVQp7VbPEKw65D6XoclWbFm0+xetsbJOqeQ9BXuTXzrI0a+4P4sDUu4kQ9NOzj8WhYUeh9W7c9q7LfryhSo/1vgSMB6+TTKVACYYcATfyRLV7UfWGxVgLoT6Tmm5ESekDlgHnGZJmiiArLK+saoA0yN4G0O4Ias7Mr7EBE0kSdUc4UQ4oaa4bb2/Qiw0r8quSX6GLQB04n1k9Bjow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com (2603:10b6:a03:459::19)
 by BL3PR11MB6410.namprd11.prod.outlook.com (2603:10b6:208:3b9::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.24; Thu, 22 Jun
 2023 12:51:49 +0000
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::2bfb:7d63:f348:1a4]) by SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::2bfb:7d63:f348:1a4%5]) with mapi id 15.20.6521.023; Thu, 22 Jun 2023
 12:51:49 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Vishwanathapura, Niranjana" <niranjana.vishwanathapura@intel.com>
Thread-Topic: [PATCH 2/6] drm/xe: Add sysfs for default engine scheduler
 properties
Thread-Index: AQHZn5OxKKn5IfJOJEycMUexqZ8NEa+N5kQAgAOtYZCAAx8xgIACHBcg
Date: Thu, 22 Jun 2023 12:51:49 +0000
Message-ID: <SJ1PR11MB62048484DCF51331DFD109F18122A@SJ1PR11MB6204.namprd11.prod.outlook.com>
References: <20230615141933.2865583-1-tejas.upadhyay@intel.com>
 <20230615141933.2865583-3-tejas.upadhyay@intel.com>
 <ZIzInHB8NmkuwWd8@nvishwa1-DESK>
 <DS7PR11MB6197AC215DD38AD284EF93CE815FA@DS7PR11MB6197.namprd11.prod.outlook.com>
 <ZJJ8tRDKimj0Jrrz@nvishwa1-DESK>
In-Reply-To: <ZJJ8tRDKimj0Jrrz@nvishwa1-DESK>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6204:EE_|BL3PR11MB6410:EE_
x-ms-office365-filtering-correlation-id: 55126baa-f421-458f-2d11-08db731f71e8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: +VyWZVzrCGpn15cLbZCI6XF6Q1TkfqzRGmraov64kBSpUjTGWviPXWw0E2sNX1GpzmghJ46Ea4XQfevENOb0sw+M8tpa04HM+Ohnf0qWKExQ4V+0t8IGFsdd0ZjbfTuYUD410aanzY4iXkD8/uQKnadVx4IzclknXQYrNHFJMMy3qmVqui+ZDZMWa2+Z72PNi3Au2KtmRLrN6xwA5ePzMzXu54ab9yzvSnptck64N9D5hSApLsJhOiLNl9pv0npD2VQDaeOgI3Zj90AyxYDLxEsFtA69wqgfRMng4gkz3u8fW/stpfNFIaGM43dHgsbbScaLfq8RcMq0nMBx+aL6sYJqOmV++LvekujfodqSC6SJxF6OgRMkQzHvxlnugVv4MgaNwIoMGWy2kJn0H+Z8CGa2s0mUaIgOx9eUTcvk/kJYWDFs/94IxNr37qhVyjyprZmbiH6XwkfNm1PH4mhMIhrKLrEOYZbILhbiwmac5n+rWhHAJns06Jjs844BmsoKPkvXh8HgzEZqpTkVxR4vgy6G9moLQWKIOIAepGmsQU0qZN/Dn1bSYM3BJxkg410oQDRLOR7RvnOWrXw5HpPvnoiqUdhFJbxRm3z73+OZ4A/I6eh+GkhUDkGaReoxWvRH
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6204.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(136003)(366004)(346002)(396003)(376002)(451199021)(30864003)(38100700002)(122000001)(82960400001)(53546011)(9686003)(6506007)(83380400001)(186003)(55016003)(107886003)(2906002)(33656002)(52536014)(41300700001)(5660300002)(6862004)(8676002)(8936002)(71200400001)(7696005)(478600001)(38070700005)(4326008)(6636002)(64756008)(66446008)(66476007)(66556008)(66946007)(76116006)(316002)(54906003)(86362001)(66899021);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?8n6LDPkCJyqdBSZxG7ItCO9zOcofJL9yESS1kOVJgNaholbUl2j4YWqzegxC?=
 =?us-ascii?Q?025nqbfT6ic2RRXC5wQC9RwxEWoKBF9IxnvF+ewyMYNadWirHhJxCq+R0wmy?=
 =?us-ascii?Q?BBidjIjoshmTroYOwR8Cics9ZgREvkALtGlmttH6Lc/Isp6qrVmoVXTrYhTk?=
 =?us-ascii?Q?AIr0F5jW+sTfpbCMXEtT1aG31FC4/+7q2R46xEfs/vfLrO1U7WFKGb93Bkxi?=
 =?us-ascii?Q?QMIlfaeDgFTIuP2iM+o/Fxbw4rlYUqteZTtkBjeHYoTC64q1YDGGu3GyWAz0?=
 =?us-ascii?Q?4Av0UVLDUxDv1Tgdy2+eUo6d97ufjGlhSnWc99FxqORbC3PFPu2ke8kVmbM6?=
 =?us-ascii?Q?qGmafCjJHluJLsFh8LBW4AbJPVJ9kZ1AQa79/6ncaYJX6Eat5vhi55j6uUC6?=
 =?us-ascii?Q?7tmbZe2m8DTUNQ+CfuRRjsfu4xVKeS9n9FraDEI/NCAH1eTwG/eTQ0Rpc2Ip?=
 =?us-ascii?Q?V1k+ZKoeCe/OFe34I7nTnQCiBXIPKjACs0u1clMzhepgQeqR078XPzYYWsbm?=
 =?us-ascii?Q?OMp5/Aiq4smn3Nh9TKtXc8JuaICQzmePX2n8m0kov0mC2UaLFvF2OrRNTzpY?=
 =?us-ascii?Q?IguQyXNcP5BAOGaeH1B49pVV/tTZK2LUbWlhozCO9nrnsKDpyD7//jaND9np?=
 =?us-ascii?Q?hjT6CHcJFJLktebtGRncYL+8QJnpjy7KSRptJauOmThHzXPbDLQgBAFv2JXE?=
 =?us-ascii?Q?sPugrNiKIsGa+uFSLN0r8rsEIUffBQORl3jmOuYV89Gz/I9ZCKjaEuL4pKDp?=
 =?us-ascii?Q?bcm9cFiH6y99RKvs/zuobKR9uy2x9hWZ1rINl1GaeOC42MoHlNTezuEVCf2T?=
 =?us-ascii?Q?sYuoE7LCuCulNS7CTO1m68GuLTm/S0RI+FS8EdTeClPRtPUI6dVKnWzwNkYy?=
 =?us-ascii?Q?m0v+3Kk842SfaRuT+gGMX/RTq0N9U8fY/vefZCfefpiglPoRFfWhjHCEbKOv?=
 =?us-ascii?Q?K1XxdHDUF3/GKEfnmXqSe+vkeg5i5jZ1su8dNRjhifgl/7TkypTK6ipHuyQN?=
 =?us-ascii?Q?xZVizfZL7s5oMdu3vHUaMlSBAkDDag463M3VUL3T2LJn6BcvB7SyQvM038AC?=
 =?us-ascii?Q?GXJq5kJx0dCVcRElG7zAa9gcprttQT6mqK24Q6VNj5J3IXYgifOZkVxyNXZl?=
 =?us-ascii?Q?DYOf+HsxJZ8Y+rTHWfywSrXigz8elmTOZppVtlfK1N3zbr9Lviy+GvStksuq?=
 =?us-ascii?Q?MIZL1hgTXMR2/T9K7tTostEc/xidFUEgU/WMafPx6ve9+1kSh0Kb2scQriO1?=
 =?us-ascii?Q?Ft8eA9edamnqGYTXr9X4jlrfUSzblDEDGlmzDEuNVZKofjTJo1hI7dKGvm4R?=
 =?us-ascii?Q?e2WvJyGqtMX8tqq2eKCL4F5T7rxt59RE3KBpcI5+sziJzjuFPu39K2a5aWel?=
 =?us-ascii?Q?i26TeOQs3p56Pmz+mKMr9CPnxeUQyD6AkVlajry9vCZgTc3ftS0cpweavBce?=
 =?us-ascii?Q?2pOGKTeJ6rhRcm2vWgja6Yaqw2wMPSSt+bSeIdnP3f8UtaK3S8YcSWS0rZjO?=
 =?us-ascii?Q?T/kezsZl5HZuTIjkENqAQG53AVqaN8PGI6e38kyBVjv+amZoJOJO1HBOYbsS?=
 =?us-ascii?Q?iSPt55JRGCTPm7kVDHMxOPLsYFPEkFTTCjCyMA5Rf6sD/SVmTPGmbMnREU0J?=
 =?us-ascii?Q?dEy4QP95JxGHKxM2DGIhq/l+HbP2suRhQ0lRi70utxh0?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6204.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 55126baa-f421-458f-2d11-08db731f71e8
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jun 2023 12:51:49.4888 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OWJAO7TBDxPVNnWcnrhpxG/gJekpPyfIdn/qPGUvEzr+qyaFeHYZhBAIWvCWL56GT7+JGtBT60GuuIBzHhGRQrcL1PTkUUTPQeA0gsStq3s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6410
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 2/6] drm/xe: Add sysfs for default engine
 scheduler properties
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
> From: Vishwanathapura, Niranjana <niranjana.vishwanathapura@intel.com>
> Sent: Wednesday, June 21, 2023 10:00 AM
> To: Upadhyay, Tejas <tejas.upadhyay@intel.com>
> Cc: intel-xe@lists.freedesktop.org; Iddamsetty, Aravind
> <aravind.iddamsetty@intel.com>; Ghimiray, Himal Prasad
> <himal.prasad.ghimiray@intel.com>; Brost, Matthew
> <matthew.brost@intel.com>
> Subject: Re: [PATCH 2/6] drm/xe: Add sysfs for default engine scheduler
> properties
>=20
> On Sun, Jun 18, 2023 at 10:01:45PM -0700, Upadhyay, Tejas wrote:
> >
> >
> >> -----Original Message-----
> >> From: Vishwanathapura, Niranjana
> >> <niranjana.vishwanathapura@intel.com>
> >> Sent: Saturday, June 17, 2023 2:10 AM
> >> To: Upadhyay, Tejas <tejas.upadhyay@intel.com>
> >> Cc: intel-xe@lists.freedesktop.org; Iddamsetty, Aravind
> >> <aravind.iddamsetty@intel.com>; Ghimiray, Himal Prasad
> >> <himal.prasad.ghimiray@intel.com>; Brost, Matthew
> >> <matthew.brost@intel.com>
> >> Subject: Re: [PATCH 2/6] drm/xe: Add sysfs for default engine
> >> scheduler properties
> >>
> >> On Thu, Jun 15, 2023 at 07:49:29PM +0530, Tejas Upadhyay wrote:
> >> >For each HW engine under GT we are adding defaults sysfs entry to
> >> >list all engine scheduler properties and its default values. So that
> >> >it will be easier for user to fetch default values of these
> >> >properties anytime to go back to default.
> >> >
> >> >For example,
> >> >DUT# cat /sys/class/drm/card1/device/gt0/engines/bcs/.defaults/
> >> >job_timeout_ms         preempt_timeout_us     timeslice_duration_us
> >> >
> >> >where,
> >> >@job_timeout_ms: The time after which a job is removed from the
> >> scheduler.
> >> >@preempt_timeout_us: How long to wait (in microseconds) for a
> >> preemption
> >> >                     event to occur when submitting a new context.
> >> >@timeslice_duration_us: Each context is scheduled for execution for t=
he
> >> >                        timeslice duration, before switching to the n=
ext
> >> >                        context.
> >> >
> >> >Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> >> >---
> >> > drivers/gpu/drm/xe/xe_engine.c          |  4 +-
> >> > drivers/gpu/drm/xe/xe_gt_sysfs.c        | 94 +++++++++++++++++++++++=
--
> >> > drivers/gpu/drm/xe/xe_gt_sysfs.h        |  5 ++
> >> > drivers/gpu/drm/xe/xe_gt_sysfs_types.h  | 13 ++++
> >> > drivers/gpu/drm/xe/xe_guc_submit.c      |  5 +-
> >> > drivers/gpu/drm/xe/xe_hw_engine.c       |  5 ++
> >> > drivers/gpu/drm/xe/xe_hw_engine_types.h | 11 +++
> >> > 7 files changed, 128 insertions(+), 9 deletions(-)
> >> >
> >> >diff --git a/drivers/gpu/drm/xe/xe_engine.c
> >> >b/drivers/gpu/drm/xe/xe_engine.c index b3036c4a8ec3..e72423bc398a
> >> >100644
> >> >--- a/drivers/gpu/drm/xe/xe_engine.c
> >> >+++ b/drivers/gpu/drm/xe/xe_engine.c
> >> >@@ -53,8 +53,8 @@ static struct xe_engine *__xe_engine_create(struct
> >> xe_device *xe,
> >> > 	INIT_LIST_HEAD(&e->multi_gt_link);
> >> >
> >> > 	/* FIXME: Wire up to configurable default value */
> >> >-	e->sched_props.timeslice_us =3D 1 * 1000;
> >> >-	e->sched_props.preempt_timeout_us =3D 640 * 1000;
> >> >+	e->sched_props.timeslice_us =3D hwe->sched_props.timeslice_us;
> >> >+	e->sched_props.preempt_timeout_us =3D
> >> >+hwe->sched_props.preempt_timeout_us;
> >> >
> >> > 	if (xe_engine_is_parallel(e)) {
> >> > 		e->parallel.composite_fence_ctx =3D
> >> dma_fence_context_alloc(1); diff
> >> >--git a/drivers/gpu/drm/xe/xe_gt_sysfs.c
> >> >b/drivers/gpu/drm/xe/xe_gt_sysfs.c
> >> >index 7528cc723699..72809078bd83 100644
> >> >--- a/drivers/gpu/drm/xe/xe_gt_sysfs.c
> >> >+++ b/drivers/gpu/drm/xe/xe_gt_sysfs.c
> >> >@@ -32,22 +32,92 @@ static struct kobj_type kobj_xe_engine_type =3D {
> >> > 	.sysfs_ops =3D &kobj_sysfs_ops
> >> > };
> >> >
> >> >-static struct kobject *
> >> >-kobj_xe_engine(struct kobject *parent, char *name)
> >> >+static ssize_t job_timeout_default(struct kobject *kobj,
> >> >+				 struct kobj_attribute *attr, char *buf) {
> >> >+	struct xe_hw_engine *hwe =3D kobj_to_hwe(kobj->parent);
> >> >+
> >> >+	return sprintf(buf, "%u\n", hwe->defaults.job_timeout_ms); }
> >> >+
> >> >+static struct kobj_attribute job_timeout_def =3D
> >> >+__ATTR(job_timeout_ms, 0444, job_timeout_default, NULL);
> >> >+
> >> >+static ssize_t timeslice_default(struct kobject *kobj,
> >> >+				 struct kobj_attribute *attr, char *buf) {
> >> >+	struct xe_hw_engine *hwe =3D kobj_to_hwe(kobj->parent);
> >> >+
> >> >+	return sprintf(buf, "%u\n", hwe->defaults.timeslice_us); }
> >> >+
> >> >+static struct kobj_attribute timeslice_duration_def =3D
> >> >+__ATTR(timeslice_duration_us, 0444, timeslice_default, NULL);
> >> >+
> >> >+static ssize_t preempt_timeout_default(struct kobject *kobj,
> >> >+				       struct kobj_attribute *attr,
> >> >+				       char *buf)
> >> >+{
> >> >+	struct xe_hw_engine *hwe =3D kobj_to_hwe(kobj->parent);
> >> >+
> >> >+	return sprintf(buf, "%u\n", hwe->defaults.preempt_timeout_us);
> >> >+}
> >> >+
> >> >+static struct kobj_attribute preempt_timeout_def =3D
> >> >+__ATTR(preempt_timeout_us, 0444, preempt_timeout_default, NULL);
> >> >+
> >> >+int xe_add_engine_defaults(struct kobject *parent)
> >> > {
> >> > 	struct kobject *kobj;
> >> >+	int err =3D 0;
> >> >
> >> > 	kobj =3D kzalloc(sizeof(*kobj), GFP_KERNEL);
> >> > 	if (!kobj)
> >> >-		return NULL;
> >> >+		return -ENOMEM;
> >> >
> >> > 	kobject_init(kobj, &kobj_xe_engine_type);
> >> >-	if (kobject_add(kobj, parent, "%s", name)) {
> >> >+
> >> >+	err =3D kobject_add(kobj, parent, "%s", ".defaults");
> >> >+	if (err)
> >> >+		goto err_object;
> >> >+
> >> >+	err =3D sysfs_create_file(kobj, &job_timeout_def.attr);
> >> >+	if (err)
> >> >+		goto err_object;
> >> >+
> >> >+	err =3D sysfs_create_file(kobj, &timeslice_duration_def.attr);
> >> >+	if (err)
> >> >+		goto err_object;
> >> >+
> >> >+	err =3D sysfs_create_file(kobj, &preempt_timeout_def.attr);
> >> >+	if (err)
> >> >+		goto err_object;
> >> >+
> >> >+	if (0) {
> >> >+err_object:
> >> > 		kobject_put(kobj);
> >> >+		return err;
> >> >+	}
> >> >+
> >> >+	return err;
> >> >+}
> >> >+
> >> >+static struct kobj_hwe *
> >> >+kobj_xe_engine(struct kobject *parent, char *name) {
> >> >+	struct kobj_hwe *khwe;
> >> >+
> >> >+	khwe =3D kzalloc(sizeof(*khwe), GFP_KERNEL);
> >> >+	if (!khwe)
> >> >+		return NULL;
> >> >+
> >> >+	kobject_init(&khwe->base, &kobj_xe_engine_type);
> >> >+	if (kobject_add(&khwe->base, parent, "%s", name)) {
> >> >+		kobject_put(&khwe->base);
> >> > 		return NULL;
> >> > 	}
> >> >
> >> >-	return kobj;
> >> >+	return khwe;
> >> > }
> >> >
> >> > int xe_gt_sysfs_engines(struct xe_gt *gt) @@ -72,7 +142,7 @@ int
> >> >xe_gt_sysfs_engines(struct xe_gt *gt)
> >> >
> >> > 	for_each_hw_engine(hwe, gt, id) {
> >> > 		char name[MAX_ENGINE_NAME_LEN];
> >> >-		struct kobject *khwe;
> >> >+		struct kobj_hwe *khwe;
> >> >
> >> > 		if ((hwe->class =3D=3D XE_ENGINE_CLASS_OTHER) ||
> >> > 		    (hwe->class =3D=3D XE_ENGINE_CLASS_MAX)) @@ -109,6
> >> +179,18 @@ int
> >> >xe_gt_sysfs_engines(struct xe_gt *gt)
> >> > 			kobject_put(kobj);
> >> > 			return -EINVAL;
> >> > 		}
> >> >+
> >> >+		khwe->hwe =3D hwe;
> >> >+		hwe->sysfs_hwe =3D &khwe->base;
> >> >+
> >> >+		err =3D xe_add_engine_defaults(&khwe->base);
> >> >+		if (err) {
> >> >+			kobject_put(kobj);
> >> >+			drm_warn(&gt_to_xe(gt)->drm,
> >> >+				 "Warning: adding .defaults to engines
> >> failed!, err: %d\n",
> >> >+				 err);
> >> >+			return err;
> >> >+		}
> >> > 	}
> >> >
> >> > 	return err;
> >> >diff --git a/drivers/gpu/drm/xe/xe_gt_sysfs.h
> >> >b/drivers/gpu/drm/xe/xe_gt_sysfs.h
> >> >index a531aebd10d6..a539cf031c7d 100644
> >> >--- a/drivers/gpu/drm/xe/xe_gt_sysfs.h
> >> >+++ b/drivers/gpu/drm/xe/xe_gt_sysfs.h
> >> >@@ -19,4 +19,9 @@ kobj_to_gt(struct kobject *kobj)
> >> > 	return container_of(kobj, struct kobj_gt, base)->gt;  }
> >> >
> >> >+static inline struct xe_hw_engine *kobj_to_hwe(struct kobject *kobj)=
 {
> >> >+	return container_of(kobj, struct kobj_hwe, base)->hwe; }
> >> >+
> >> > #endif /* _XE_GT_SYSFS_H_ */
> >> >diff --git a/drivers/gpu/drm/xe/xe_gt_sysfs_types.h
> >> >b/drivers/gpu/drm/xe/xe_gt_sysfs_types.h
> >> >index d3bc6b83360f..d0a5eae1bbb4 100644
> >> >--- a/drivers/gpu/drm/xe/xe_gt_sysfs_types.h
> >> >+++ b/drivers/gpu/drm/xe/xe_gt_sysfs_types.h
> >> >@@ -23,4 +23,17 @@ struct kobj_gt {
> >> > 	struct xe_gt *gt;
> >> > };
> >> >
> >> >+/**
> >> >+ * struct kobj_hwe - A hwe's kobject struct that connects the
> >> >+kobject and the
> >> >+ * hwe.
> >> >+ *
> >> >+ * When dealing with multiple hwe, this struct helps to understand
> >> >+which hwe
> >> >+ * needs to be addressed on a given sysfs call.
> >> >+ */
> >> >+struct kobj_hwe {
> >> >+	/** @base: The actual kobject */
> >> >+	struct kobject base;
> >> >+	/** @hwe: A pointer to the hwe itself */
> >> >+	struct xe_hw_engine *hwe;
> >> >+};
> >>
> >> More on this below.
> >>
> >> > #endif	/* _XE_GT_SYSFS_TYPES_H_ */
> >> >diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c
> >> >b/drivers/gpu/drm/xe/xe_guc_submit.c
> >> >index b209e4c2a3a9..bc0ffcf9fb1c 100644
> >> >--- a/drivers/gpu/drm/xe/xe_guc_submit.c
> >> >+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> >> >@@ -1063,13 +1063,16 @@ static int guc_engine_init(struct xe_engine
> *e)
> >> > 	ge->engine =3D e;
> >> > 	init_waitqueue_head(&ge->suspend_wait);
> >> >
> >> >-	timeout =3D xe_vm_no_dma_fences(e->vm) ?
> >> MAX_SCHEDULE_TIMEOUT : HZ * 5;
> >> >+	timeout =3D xe_vm_no_dma_fences(e->vm) ?
> >> MAX_SCHEDULE_TIMEOUT :
> >> >+		  e->hwe->sched_props.job_timeout_ms;
> >> > 	err =3D drm_sched_init(&ge->sched, &drm_sched_ops,
> >> > 			     e->lrc[0].ring.size / MAX_JOB_SIZE_BYTES,
> >> > 			     64, timeout, guc_to_gt(guc)->ordered_wq, NULL,
> >> > 			     e->name, gt_to_xe(e->gt)->drm.dev);
> >> > 	if (err)
> >> > 		goto err_free;
> >> >+	/* Record timeout value, in order to show current set timeout */
> >> >+	e->hwe->sched_props.job_timeout_ms =3D timeout;
> >>
> >> But, timeout can be MAX_SCHEDULE_TIMEOUT which can be more than
> the
> >> max defined in the patch#6 right?
> >
> >Yes, how should we handle this, any thoughts? Thanks for pointing this o=
ut.
> I think we need to change default max timeout in that case to match our
> config?
> >
>=20
> Yes, I think so, but will let others comment.

After looking more into it, this is passed base on VM_flags passed from use=
r, so user explicitly wants no timeout. We should also let this set in our =
parameter like below I am doing. Right! Any new timeout settings will still=
 be restricted regularly.

Thanks,
Tejas
>=20
> >>
> >> >
> >> > 	sched =3D &ge->sched;
> >> > 	err =3D drm_sched_entity_init(&ge->entity,
> >> DRM_SCHED_PRIORITY_NORMAL,
> >> >diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c
> >> >b/drivers/gpu/drm/xe/xe_hw_engine.c
> >> >index 68cd793cdfb5..8314429cfa90 100644
> >> >--- a/drivers/gpu/drm/xe/xe_hw_engine.c
> >> >+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
> >> >@@ -361,6 +361,11 @@ static void hw_engine_init_early(struct xe_gt
> >> >*gt,
> >> struct xe_hw_engine *hwe,
> >> > 	hwe->name =3D info->name;
> >> > 	hwe->fence_irq =3D &gt->fence_irq[info->class];
> >> > 	hwe->engine_id =3D id;
> >> >+	/* FIXME: Wire up to configurable default value */
> >> >+	hwe->sched_props.job_timeout_ms =3D HZ * 5;
> >> >+	hwe->sched_props.timeslice_us =3D 1 * 1000;
> >> >+	hwe->sched_props.preempt_timeout_us =3D 640 * 1000;
> >> >+	hwe->defaults =3D hwe->sched_props; /* Record default props */
> >> >
> >> > 	xe_reg_sr_init(&hwe->reg_sr, hwe->name, gt_to_xe(gt));
> >> > 	xe_wa_process_engine(hwe);
> >> >diff --git a/drivers/gpu/drm/xe/xe_hw_engine_types.h
> >> >b/drivers/gpu/drm/xe/xe_hw_engine_types.h
> >> >index d788e67312b9..406a1e33a05e 100644
> >> >--- a/drivers/gpu/drm/xe/xe_hw_engine_types.h
> >> >+++ b/drivers/gpu/drm/xe/xe_hw_engine_types.h
> >> >@@ -107,6 +107,17 @@ struct xe_hw_engine {
> >> > 	void (*irq_handler)(struct xe_hw_engine *, u16);
> >> > 	/** @engine_id: id  for this hw engine */
> >> > 	enum xe_hw_engine_id engine_id;
> >> >+	/** @sched_props: scheduling properties */
> >> >+	struct {
> >> >+		/** @set_job_timeout: Set job timeout in ms for engine */
> >> >+		u32 job_timeout_ms;
> >> >+		/** @timeslice_us: timeslice period in micro-seconds */
> >> >+		u32 timeslice_us;
> >> >+		/** @preempt_timeout_us: preemption timeout in micro-
> >> seconds */
> >> >+		u32 preempt_timeout_us;
> >> >+	} sched_props, defaults;
> >> >+	/** @sysfs: sysfs kobject pointing to this hwe */
> >> >+	struct kobject *sysfs_hwe;
> >>
> >> Whwere is this sysfs_hwe used?
> >> I wonder whether we really need 'struct kobj_hwe'.
> >> Why can't we just have kobject defined here in the xe_hw_engine
> >> sturcture instead of having a pointer to one. That way we don't need t=
o
> kzalloc it.
> >
> >You are right, its miss. I initially thought same and added sysfs_hwe an=
d
> ended up not using it. As container of does not work on pointers.
> >
> >If we add it as part of xe_hw_engine then also allocation will happen ri=
ght!
> And other reason to keep this way was to maintain uniformity the same way
> GT sysfs is doing and same way its done in tile sysfs patch(which is on
> patchwork) as well.
> >
> >Thanks,
> >Tejas
> >>
> >> Niranjana
> >>
> >> > };
> >> >
> >> > /**
> >> >--
> >> >2.25.1
> >> >
