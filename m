Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB047C63797
	for <intel-xe@archiver.kernel.org>; Thu,  2 Feb 2023 23:14:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A88E010E673;
	Thu,  2 Feb 2023 23:14:44 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A463810E673
 for <intel-xe@lists.freedesktop.org>; Thu,  2 Feb 2023 23:14:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675379682; x=1706915682;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=vGeKGnsoHSQL79KyMcRC0ou1MWOEuhswshaw2HYZXuk=;
 b=IBbOR+bwUZzPe3Xno/q6j2IdlQR54UlSfoFDDFSF+HLFGOdVGSEQojrH
 +BRc2fybkNxRbrhvE+LPF6zPcfc4xypvtp/uS6ND5E7FurkNu7CaIH+KZ
 Xva0l5YpjOkhSABa9J8u7DHsYrpGQF7tcdrBYtDkSieBMqWgrIHv10Y4Z
 c+GhD2VHu5mqfspER9UxO4bU+BQyUY+isxi8JAvzxS3GvM5Cm8AeHMOB9
 4EG+X0AUBnJ0cNOsX6r5srBomR31OmeLLyNg+yW65JrE0VBWSwAz5R2P8
 u1bVKbFK62vUpvONk3Th5yUQLhwGs1fvWIbkS+Iy7YLdJ/HSrp+IXTVvI Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10609"; a="393187834"
X-IronPort-AV: E=Sophos;i="5.97,268,1669104000"; d="scan'208";a="393187834"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2023 15:14:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10609"; a="910938583"
X-IronPort-AV: E=Sophos;i="5.97,268,1669104000"; d="scan'208";a="910938583"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga006.fm.intel.com with ESMTP; 02 Feb 2023 15:14:41 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Thu, 2 Feb 2023 15:14:41 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Thu, 2 Feb 2023 15:14:41 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.102)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Thu, 2 Feb 2023 15:14:40 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mQVohwg1JgRHegIHd+0NHgGrHujmkHtN2JdL/j2pqNz1xXR5TfLntsZ4OgA33/LcQ28ANfX2OBpp5Xe+cvwDdWKt6/hCm1fpZcGhO8zsvIiwP39HjsK0KLXgeUvUluAQFrPW73mS4sW0SGeVlE2EYrJ9acNnEcexOBZuh9E9DIbpctcuYiN/K4FDCNaZMzu6Xd3RqOC5UW3ZI69ci39uaTBYGOYGLvGH82w0NzCUXuSuKjOoTOsmSOpQWyUE0bqQA5xMOaE1yqr344LcZhQ5T1cTP7osx/p6JwpU3sSAJvfeoINQrzj2WBCfShSkEg0xEUr+MnAdK2WRWqxAkwlyMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IznQjZWqOWCV1uy27vaSae9JOvi3RtjC/eae0VH2xB8=;
 b=HXsPlmwayfl1PRAkNXtcAmq562rUy8EgyXpv9QesWGUWuEv8PAWu6W2cm5wlOPLGlv13g2bG9T3vIt1cMHzCenBNmDkiSN/b7EWTfYr476hwPfFd2HnZC6vRx1YL2nQbqdv0Pi7qiOFOFEtFezYDLLQQCvVvHTHoY7UVbYWw7XMjOGycAiG2pikfFNAPtBRhmzokQPLpYGQexq5vEaHlO8w96e3l5WuYRUFVsAAZkS4yceYz/k/mxPKy+kNZpSuHGgYKL2zkgcxmGrOJNjiePbue8EPKTTF7+iljhsOas0Qhu9Xscxw7wziXlAJdEj/A1qSnEYcbkjFjzANN2RQY4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 DM4PR11MB6168.namprd11.prod.outlook.com (2603:10b6:8:ab::22) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6043.38; Thu, 2 Feb 2023 23:14:39 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::68d0:f8e0:eaf3:982e]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::68d0:f8e0:eaf3:982e%6]) with mapi id 15.20.6064.027; Thu, 2 Feb 2023
 23:14:39 +0000
Date: Thu, 2 Feb 2023 15:14:36 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: "Souza, Jose" <jose.souza@intel.com>
Message-ID: <Y9xD3IlSRBlmgTaA@mdroper-desk1.amr.corp.intel.com>
References: <20230130161723.42602-1-jose.souza@intel.com>
 <Y9f7O86ki5W4Qv1C@mdroper-desk1.amr.corp.intel.com>
 <7c9f39e8eb4ad81926af9b91f45509a5a5a9d347.camel@intel.com>
 <20230130192751.ozgru3btj67iojfa@ldmartin-desk2>
 <12ca0b771f2845509e00a36e6514d456ea39073a.camel@intel.com>
 <Y9rXqCOP+8Y2MC4J@intel.com>
 <2814ffcf60f6be04d450517f16795a86db3c3fa4.camel@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2814ffcf60f6be04d450517f16795a86db3c3fa4.camel@intel.com>
X-ClientProxiedBy: BY3PR05CA0035.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::10) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|DM4PR11MB6168:EE_
X-MS-Office365-Filtering-Correlation-Id: d84c0309-0e52-4d0d-5ca4-08db057341f9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mVKrlVQYaBLO7lPT2bfkUovhX6l4eSIJF5X/2rA9j3imyZq81XJabIQEA4YQqLAZkyQ3eXsincv8+d4etTY5LY69tZA4gZa5u7L7sR0A9gRm2MPiqBqeDcPWZFpTFw88+JT1iQnOPFuA6lsqYz4iX0pU5e6ZvRgoCgXQCZ6N2+y2PaD/Bh94FqFNNafEBoiRTEKPyJtuM/oIV8yyR7Zx9FSlJWJYnTVmA0C3IhmFVWqqlJ8HkNp06mfQIcYBQMWs9u/0QE8cr6zJ+t1Qc0JxwdobB+7SWx33b6gAQj0Rn0yIB7GKLySr0WvzosFfzHTEn4VPoz/pPp7DcE1Bx8e8LQupZHH5s5N8pimQ86I84TnAU15yXN7s0FZ7fxCwKldUCjXM3gTNrW6nOJXOKY8FkqRogpYeejpZE8TWDzDQGNwP7Cm3r1VuptVHU/11rYjuXi1Xa0IFVROvrDm4ba3+YYdCD5G1HcZLUxK9PcafRu2UGpaFh1SOFVhAS5bCpxxDMOZkQNnozOVReXylhjL7bmjOPep1zhyzZlWNm9y6TGAglYEeiTduzCb0AcrZpsdkQwWc8pGZs0xBckx4LiTHbRWOx7oTiXjc5CQMtDbvHF240e+oRVo/QyHFFaFYDOfgsKVtcRAghHHO5wXsJZIi9Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(136003)(396003)(346002)(39860400002)(366004)(376002)(451199018)(82960400001)(86362001)(54906003)(6512007)(6666004)(6636002)(6506007)(26005)(186003)(316002)(2906002)(5660300002)(38100700002)(66476007)(66556008)(6486002)(83380400001)(66946007)(6862004)(8676002)(478600001)(8936002)(4326008)(41300700001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?zbjrkyPfJNuY44Esf32SeeVbIF4lY5ZNhr0ka2kMrywF1ONAWmJsFUuv6G?=
 =?iso-8859-1?Q?x1tgUOLePY7w0wYK3AJKVx02bhn0Iq9ig0F38k7gXvcruHTDzMWUFnWDyp?=
 =?iso-8859-1?Q?pj++XD3PfJq/3IgFUx9cNb4RrP6uth46/jkbEpFYqcjqj0AmthPmq35/Qr?=
 =?iso-8859-1?Q?e3kF0VnuZg49khQfkU+Fk711ids3SHr9U3+/yVnprMtbVXy+4Ys2BXJ1xx?=
 =?iso-8859-1?Q?MgDiVTsdBZZDM9nrtAdFnW5Xu7FTCkd3U2znrleHujmKpZzF9N07K1XXYd?=
 =?iso-8859-1?Q?Dj6VBcq4G/JI5vybBgxbdwUg+nf03cQ3x5TNmPePtjDY7/836O5Hi22uNH?=
 =?iso-8859-1?Q?MjQLtXGkcaBjQ77VMNbxGm0hI5c0ZlJejoFeUY5t+tPLZvVturgRC+LCmZ?=
 =?iso-8859-1?Q?bRAZW9eP2a+UjtEuVhKquT5d1VP8lHWYTDCSdrAbPYQ9dflQlyHs3G9ixw?=
 =?iso-8859-1?Q?tbaroGotwnsWUmzznqUoFIBUqWYMHgISRHHFXzpOabc1bczh4WtzsS+TGV?=
 =?iso-8859-1?Q?MAxGZQnbVPZ/ueKpvDvoXQHJKAEdzz04dVP3QFPWejPdORv1dp0Qr5fLhr?=
 =?iso-8859-1?Q?1STSQVbPK1+9E9aUrmkXbf6ab8+BxrWoAqSaoh8ihA92sKyNLezmu/RaL+?=
 =?iso-8859-1?Q?Ag2dF0LSH5bMVMBI6fhKCsrbTudE/NAXp6xgroDAAoLyYpBInyof4KFuxv?=
 =?iso-8859-1?Q?Als3z1ZehLqj0UwnFD11AWrWcFu+3o7k5889TZ4xYhwuzF1SiXHjoaEcjc?=
 =?iso-8859-1?Q?KLnjmUYqOHhP0PgKKe+F3akqB3QfTtfqWTksEiu7mCkt5/kK2+LpNMGU4n?=
 =?iso-8859-1?Q?48bYfdAPi7OPREvayZfX19+zzAj/hWEXNii23fBmS0n0pklED+7fHlb8eC?=
 =?iso-8859-1?Q?zRbs+eILwup50fiNgH4A6VCyZ1fKhQEfZSz1u4eOm5u4wEh5XN47Z8+BLX?=
 =?iso-8859-1?Q?WNjRMdgfPZOtWX0/gGKgJD4TFeXIJNpPXCo5GBCesSU+nb2HoybWbXx73h?=
 =?iso-8859-1?Q?+bBDJ4vhQzNDbeneX5m0sKd0zjZKllBB7uCgOO3Dk1771nHR6KoGaZI2va?=
 =?iso-8859-1?Q?xof3HwhZWSk3BiSjragrI+KRsvlff7Mz49gBRPvcb6u4VylYT5jyYugto0?=
 =?iso-8859-1?Q?BaC4gkFwHnCgyHn/XarLqdjJewlGUd3V79PD8wc4frMrkSeFelq7Fxv1Ag?=
 =?iso-8859-1?Q?c7OMNQCBu0lugzsXwM7hd2jcjwyXLkCsYfJ9B5uzZp3PIdP4XZ2IsoccUN?=
 =?iso-8859-1?Q?k43VmBonlkUHN6nFN/azhzAHYKusa4g0KOKFCqwZuEHhhdpvTosakTFeKX?=
 =?iso-8859-1?Q?eeTNqYhF915zRXf2j76BTlTZojffiH6Qell+aUJ9GYlBfLgc01Ikj4b8W1?=
 =?iso-8859-1?Q?+MNCCKeprfYeG40s/Nbi/vMJZOSL+ZopCX1LlH6/7oST8+ErraLZ6tcRSP?=
 =?iso-8859-1?Q?UUuE7bpBZUwq4CCp0Jt99yvP7zXBZADkCASTdV9Qh5QueqGIJgl2OqM4Ua?=
 =?iso-8859-1?Q?u2oGTIjK2iUOFemi3dQhl41OhI/hu5jWt0YtShnTWKGX2sS+dVaw1ujzEa?=
 =?iso-8859-1?Q?zVhvDVtxsYMXj7qu8bKZMjhI01KTiclkLV1BkJ8y/oyG8Fci51H76IH6g2?=
 =?iso-8859-1?Q?sEHlv+mUCSfNno7gIxwKUlwZO9Hcdyusi7UOV8B0bmg6Jlqb43meH/ng?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d84c0309-0e52-4d0d-5ca4-08db057341f9
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2023 23:14:39.0702 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1idKEWjz+bGvTAR1zsGY0kX2KVTRXxxw9c0vM0/YeKt9FKhuuSSSPgo/PskbjI4Y2AS92oksHOEv/D3XLCB4J2PKABoXnRw0HJFrjXChBwU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6168
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2] drm/xe: Add fake workaround to maintain
 backward compatible in MI_BATCH_BUFFER_START
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
Cc: "De Marchi, Lucas" <lucas.demarchi@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, Feb 02, 2023 at 02:02:28PM +0000, Souza, Jose wrote:
> On Wed, 2023-02-01 at 16:20 -0500, Rodrigo Vivi wrote:
> > On Mon, Jan 30, 2023 at 07:43:58PM +0000, Souza, Jose wrote:
> > > On Mon, 2023-01-30 at 11:27 -0800, Lucas De Marchi wrote:
> > > > On Mon, Jan 30, 2023 at 10:04:25AM -0800, Jose Souza wrote:
> > > > > On Mon, 2023-01-30 at 09:15 -0800, Matt Roper wrote:
> > > > > > On Mon, Jan 30, 2023 at 08:17:23AM -0800, José Roberto de Souza wrote:
> > > > > > > i915 has the same fake workaround to return MI_BATCH_BUFFER_START
> > > > > > > nested batch buffer behavior in DG2 and newer platforms to the same
> > > > > > > behavior as older platforms.
> > > > > > > 
> > > > > > > So here cleaning up TGL_NESTED_BB_EN in MI_MODE to disable third level
> > > > > > > chained batch buffer level.
> > > > > > 
> > > > > > I was kind of assuming we'd just drop this setting for the Xe driver.  I
> > > > > > believe hardware will be removing the option to turn off nested
> > > > > > batchbuffers in an upcoming platform, so userspace is going to have to
> > > > > > adapt to the new behavior soon anyway; doing it while moving to a new
> > > > > > KMD seems like the easiest time to make that happen since the UMDs are
> > > > > > already updating their programming models.
> > > > > 
> > > > > This would bring even more changes to track when debugging issues in Xe KMD port.
> > > > > Better do this after Xe KMD is stabilized and with better CI coverage in UMDs and KMDs.
> > > > 
> > > > but if we start supporting these platforms with nested bb disabled,
> > > > we can't change it later. At least not for the older platforms that had
> > > > it that way.
> > > 
> > > Xe KMD will not support by default TGL, DG2... anyways.
> > > Why have different hardware behavior between KMDs then?
> > 
> > For the older platforms we will always be behind the force_probe.
> > So we will be able to change the uapi behavior later.
> > 
> > However, I tend to agree with Matt and Lucas that it would be better
> > if we align with the future, instead of trying to align with i915
> > first.
> > 
> > But I'd like to hear from Jose, how much of a trouble this is for the
> > user space? What are the advantages of aligning with i915's current
> > behavior first and then move later?
> > 
> > If you noticed all other uapi, there's not a much of alignment with
> > i915 anyway. Why should we align on this?
> 
> i915 x Xe changes don't affect the files and functions that fill the batch buffers in Mesa.
> Changing the behavior of MI_BATCH_BUFFER_START would be the first change that actually goes to batch buffers.
> Minimal batch buffer changes means less surface to debug in issues that only happens with Xe KMD.
> 
> That is why I would like to postpone this behavior change to when Xe KMD and UMDs support to it are more stable.

The other thing to consider here is that the Xe driver will presumably
be adding SRIOV support soon.  If our behavior differs from the Windows
driver, then I believe userspace Windows software running in a VF under
a Linux PF could potentially see unexpected behavior.


Matt

> 
> > 
> > Thanks,
> > Rodrigo.
> > 
> > > 
> > > > 
> > > > Lucas De Marchi
> > > > 
> > > > > 
> > > > > > 
> > > > > > 
> > > > > > Matt
> > > > > > 
> > > > > > > 
> > > > > > > v2:
> > > > > > > - replace IP_VERSION_FOREVER by XE_RTP_END_VERSION_UNDEFINED
> > > > > > > - move fake workaround to lrc_additional_programming table
> > > > > > > 
> > > > > > > Bspec: 45974, 45718
> > > > > > > Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> > > > > > > Cc: Matt Roper <matthew.d.roper@intel.com>
> > > > > > > Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
> > > > > > > ---
> > > > > > >  drivers/gpu/drm/xe/xe_gt.c |  1 +
> > > > > > >  drivers/gpu/drm/xe/xe_wa.c | 28 ++++++++++++++++++++++++++++
> > > > > > >  drivers/gpu/drm/xe/xe_wa.h |  1 +
> > > > > > >  3 files changed, 30 insertions(+)
> > > > > > > 
> > > > > > > diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> > > > > > > index 84a73eeccd297..5d07e1e7bd506 100644
> > > > > > > --- a/drivers/gpu/drm/xe/xe_gt.c
> > > > > > > +++ b/drivers/gpu/drm/xe/xe_gt.c
> > > > > > > @@ -311,6 +311,7 @@ int xe_gt_record_default_lrcs(struct xe_gt *gt)
> > > > > > > 
> > > > > > >  		xe_reg_sr_init(&hwe->reg_lrc, "LRC", xe);
> > > > > > >  		xe_wa_process_lrc(hwe);
> > > > > > > +		xe_wa_process_lrc_additional_programming(hwe);
> > > > > > > 
> > > > > > >  		default_lrc = drmm_kzalloc(&xe->drm,
> > > > > > >  					   xe_lrc_size(xe, hwe->class),
> > > > > > > diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
> > > > > > > index 3325de3edf691..744b7d0982683 100644
> > > > > > > --- a/drivers/gpu/drm/xe/xe_wa.c
> > > > > > > +++ b/drivers/gpu/drm/xe/xe_wa.c
> > > > > > > @@ -288,6 +288,21 @@ static const struct xe_rtp_entry lrc_was[] = {
> > > > > > >  	{}
> > > > > > >  };
> > > > > > > 
> > > > > > > +static const struct xe_rtp_entry lrc_additional_programming[] = {
> > > > > > > +	{ XE_RTP_NAME("FakeWaDisableNestedBBMode"),
> > > > > > > +	  /*
> > > > > > > +	   * This is a "fake" workaround defined by software to ensure we
> > > > > > > +	   * maintain reliable, backward-compatible behavior for userspace with
> > > > > > > +	   * regards to how nested MI_BATCH_BUFFER_START commands are handled.
> > > > > > > +	   */
> > > > > > > +	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1255, XE_RTP_END_VERSION_UNDEFINED)),
> > > > > > > +	  XE_RTP_CLR(RING_MI_MODE(0),
> > > > > > > +		     TGL_NESTED_BB_EN,
> > > > > > > +		     XE_RTP_FLAG(MASKED_REG, ENGINE_BASE))
> > > > > > > +	},
> > > > > > > +	{}
> > > > > > > +};
> > > > > > > +
> > > > > > >  static const struct xe_rtp_entry register_whitelist[] = {
> > > > > > >  	{ XE_RTP_NAME("WaAllowPMDepthAndInvocationCountAccessFromUMD, 1408556865"),
> > > > > > >  	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1200, 1210), ENGINE_CLASS(RENDER)),
> > > > > > > @@ -362,6 +377,19 @@ void xe_wa_process_lrc(struct xe_hw_engine *hwe)
> > > > > > >  	xe_rtp_process(lrc_was, &hwe->reg_lrc, hwe->gt, hwe);
> > > > > > >  }
> > > > > > > 
> > > > > > > +/**
> > > > > > > + * xe_wa_process_lrc_additional_programming - process additional LRC programming
> > > > > > > + * table
> > > > > > > + * @hwe: engine instance to process workarounds for
> > > > > > > + *
> > > > > > > + * Process additional context programming table for this platform, saving in
> > > > > > > + * @hwe all the registers changes that need to be applied on context restore.
> > > > > > > + */
> > > > > > > +void xe_wa_process_lrc_additional_programming(struct xe_hw_engine *hwe)
> > > > > > > +{
> > > > > > > +	xe_rtp_process(lrc_additional_programming, &hwe->reg_lrc, hwe->gt, hwe);
> > > > > > > +}
> > > > > > > +
> > > > > > >  /**
> > > > > > >   * xe_reg_whitelist_process_engine - process table of registers to whitelist
> > > > > > >   * @hwe: engine instance to process whitelist for
> > > > > > > diff --git a/drivers/gpu/drm/xe/xe_wa.h b/drivers/gpu/drm/xe/xe_wa.h
> > > > > > > index 1a0659690a320..872f3e4ddc73c 100644
> > > > > > > --- a/drivers/gpu/drm/xe/xe_wa.h
> > > > > > > +++ b/drivers/gpu/drm/xe/xe_wa.h
> > > > > > > @@ -12,6 +12,7 @@ struct xe_hw_engine;
> > > > > > >  void xe_wa_process_gt(struct xe_gt *gt);
> > > > > > >  void xe_wa_process_engine(struct xe_hw_engine *hwe);
> > > > > > >  void xe_wa_process_lrc(struct xe_hw_engine *hwe);
> > > > > > > +void xe_wa_process_lrc_additional_programming(struct xe_hw_engine *hwe);
> > > > > > > 
> > > > > > >  void xe_reg_whitelist_process_engine(struct xe_hw_engine *hwe);
> > > > > > >  void xe_reg_whitelist_apply(struct xe_hw_engine *hwe);
> > > > > > > --
> > > > > > > 2.39.1
> > > > > > > 
> > > > > > 
> > > > > 
> > > 
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
