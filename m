Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29F70C74A5B
	for <intel-xe@archiver.kernel.org>; Tue, 21 Mar 2023 15:55:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E735E10E7D2;
	Tue, 21 Mar 2023 15:55:49 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B89D10E7D2
 for <intel-xe@lists.freedesktop.org>; Tue, 21 Mar 2023 15:55:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679414147; x=1710950147;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=6QVygGRilUatjQfSnHmsmlBXXJZUu4tAkt73PH73PGM=;
 b=TM4O9kkHAAxkHbzMtI5+nBBQvQAGg6+gNNGTKJEj5Q4Kn6mT42horbpA
 5PxY/XcxL5+NTodB9zR300qX6XFAo8JcBf2QztRAy4sJV6eJUTOwok2yt
 +Mh8wyRDDRW0+GAPubZKzfM4+vWva9n+ndnvQbbwqBTD4x3JhwXxXqig0
 5SSEijfh2fqdLeypSK2oqcODe7gg5RvglfC622tEKDsWS8QHsIvR5n/+/
 P8Tf8WeQiC1bRakot7sdInykZ6NbB9iMW0rtrLsNA4MgjhR/T1IrXNfMh
 1crolS9JuuMQ6saPMvk1w5Zt3opZAsNjJDrcFnGfV9ujLRy4YYPP4zKNE Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="337701947"
X-IronPort-AV: E=Sophos;i="5.98,279,1673942400"; d="scan'208";a="337701947"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2023 08:55:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="855741655"
X-IronPort-AV: E=Sophos;i="5.98,279,1673942400"; d="scan'208";a="855741655"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga005.jf.intel.com with ESMTP; 21 Mar 2023 08:55:46 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 21 Mar 2023 08:55:46 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 21 Mar 2023 08:55:44 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Tue, 21 Mar 2023 08:55:44 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Tue, 21 Mar 2023 08:55:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kTz0X8DIB45x9rYAUFrKUV/j0O4XTrLSLnBEMobLHJk6SrtLJJThR8G2j86GQG/lFR3EQEd6UXgbVGgGxVm36YTywFMScMz/alQ08O1K/jZAjXv1TuGHK4PN+UFDkKiVWAcgjZtEaRqoD7Ijv9kVQNqbCjd/Jxno//p0zfXNk/OJfzAe3H9fAKkWII0KIGuukdJ08lD3//ZzjlQQUZ0/Chhr1umI0XZA/dLabiTIQAus73LTmgq6ubtlThOinjjVVStMRMBQaBFhd5pKkbJqCoUvC9s0lxSZjxC6BGeSesnPKyad+IAOi9ZSiQbWMOqAKoiT8SDVOAQobSu49lvSYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xbzB4xYfXDvkG+0qPmcdZmYzFGs9JCS3HKVxCGc6/dQ=;
 b=JHbTizK3zWZcfcsm0rqQXUty9zsSQmK7QEVGuCkjLWrZiBlqOZcekzClPprMfLmuTwLSI7vvcTODkWCm8270VoRE6MyajwpqcKPE06KwDVSMDEye4UXZdDjMCg3Yk2NyhTTZ9ub5nZidPpp8zCKjtWKXDWxrcjhhbYwQ+wukHBIN5O0WbdSLXxvaBz79YVBSJHh0XilpZ94btBFbztu/4PMK0d8zSQ90qX/o8L5iSxY/VIg324Cr5frRPmoLkSIrCJAEkJg5Oaf7RwUTC6lGLrMSMblFSHp8E+rjorUVLvva7DdFRbKz4lLVS7JyMs9QhQD/c4MIDkAyB61I4rjAKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 DM6PR11MB4515.namprd11.prod.outlook.com (2603:10b6:5:2a9::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6178.37; Tue, 21 Mar 2023 15:55:34 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::1c61:b69d:4ca:10d0]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::1c61:b69d:4ca:10d0%7]) with mapi id 15.20.6178.037; Tue, 21 Mar 2023
 15:55:34 +0000
Date: Tue, 21 Mar 2023 08:55:30 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Anusha Srivatsa <anusha.srivatsa@intel.com>
Message-ID: <20230321155530.GL4085390@mdroper-desk1.amr.corp.intel.com>
References: <20230320235254.3288679-1-anusha.srivatsa@intel.com>
 <20230321153447.GJ4085390@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230321153447.GJ4085390@mdroper-desk1.amr.corp.intel.com>
X-ClientProxiedBy: SJ0PR13CA0064.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::9) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|DM6PR11MB4515:EE_
X-MS-Office365-Filtering-Correlation-Id: 658ceb3a-80da-4c03-eab5-08db2a24b422
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0e3BSSdAYKY1wWLspauy9q0K5SZ+GOZgGeFdryzWz91tCaoilR9s9DNvv8AKNKVg9piW+Y0CXy3/7G8jjxt37giNuzOavfcb5TRSOsWfWyd2eDBApaDykTIfB1Tsn4mW1z9ynoxfDp7xCmE99VmYHUEI+FNL5A4Wa7ZFOHnTHQNTbURGvj04GatrYXJJFpWfNcWDVkiMcFi7WoNRpq23TEUq1H03cVf2e85pOuWNcaeyshjO4lLiiQKV2gxor7f4k8tJ6cy49c1E4fWp/3RHqcHegADjNXS5ZkHI9a6oSWgybmV5oO5sQ8d/VsNiDB84zCq4qRPNUSKJPv6Lht7W80mEc2aairyY72XpvhqjYtTl/BaacNqckgudTykAdgBYan1FaWuvH1ozgcIcCp/grf6O6JcfTa7gexEzWMMC1uoE0gkJfklSHc6WUgFrBBrqGIWxA2mLrwcovyTfJqoDUfjBiiPCUA+y10NernMyDzhFF6yQRLKZseAEcdXagBrezEZzcn+WtnJs9LgQBFcDBzkHi/r3psPMRhXRlpNDyxFDDIahuEFeSq91iZR4Mggv2hQcG5aoHpR5W8Rt/D1VMhkCgZ4/NI33EPO0Gp+lVMqdpkqXrEHZMAPQMAXExw7qhSjFU4KAt1LQ9o8YhfmZ1caHHP6kaAM2P+XpFrBmI5OJ5I91GC+i4l9kXSTzLSoRWvnRmNpkU4UR0o78L6d9Qjeakjjgu/rjQGg+4u7Xlfol2vcEQKqJcBC/Z0mDwZZF
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(39860400002)(136003)(366004)(376002)(346002)(396003)(451199018)(41300700001)(8676002)(4326008)(66476007)(66556008)(66946007)(2906002)(82960400001)(38100700002)(8936002)(5660300002)(6862004)(6666004)(6506007)(1076003)(6512007)(6486002)(33656002)(26005)(186003)(86362001)(54906003)(316002)(83380400001)(6636002)(66899018)(478600001)(87944009);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?BJFs3SFCezDXgGIT3CWQJobkf5XXO986wbOwpw354N0dezfsm0Dg2vTFwqR9?=
 =?us-ascii?Q?YEDSb2BMZVEGFEcBeqsn5Ax2FCjkYQIyWQp0GtOrD9WRbxxEpONBorrIqOOt?=
 =?us-ascii?Q?JPbqQ9KktE3WIGNRDaUPpEu/8m+24OfIe9qEX6Hm0SWXJsDGeoniJ4ifQOqV?=
 =?us-ascii?Q?01Ljd+YYEGmH+MC+RYt79sh/J1Ildhfr3s91BgWBfW/xoc80nwJFf4m3uL00?=
 =?us-ascii?Q?w9YHoNaEOfHBX0R2sXi6++O30qROOqXj2BRVSIGBDgjQYjsD06QJfPMRJQev?=
 =?us-ascii?Q?oyxlxrU2Nq4CVibULCo3ZVmlXwNZpluxNnlw5AXFB5r3EIyJfgfodYsi2WnH?=
 =?us-ascii?Q?OSDwfkk1J6bvZAJAeJzLdkIhaqJ250BoSzmRHw4/VO+JZDWImaLlE8i9mZlm?=
 =?us-ascii?Q?H3jkVmtKNWMCFvgMvkuI+GbzDzv30h++YNgIkhB99QfvwqJmnmmww7rQ1zmT?=
 =?us-ascii?Q?8rt4f/qk8VA1CCB5/0adcMORgyJ1nJ8/ZrYw5iYuPwv7VfIS44V5VUuOc/nJ?=
 =?us-ascii?Q?sE6wt3/ySdxRWRMgv2XQUW3+vT43CJTw8ICwCch5GyOkkWOjjLJ9DTpRH87H?=
 =?us-ascii?Q?+6USL4cFhDJnKC/Q0xd/1uskL+5XHLVZbB3SZJOuTxHgK0KCFJ5rHFXV7flb?=
 =?us-ascii?Q?zWbshsTgPXKuFPbr/Crbseft25onUtjW6jUS8OPZ9Dd1QWqb69O9/d+e+mSW?=
 =?us-ascii?Q?3icx/DSaq1+LsNaiqAItyqIGhXSAx9gBOXx2oJSe83afdi8KLojoF1rs7Dl1?=
 =?us-ascii?Q?LvDi1iU5HKw66vfa/LpvoF8v1eznCOkkpq2muM3pCT5FDvqq2ZLSd7TnpYEt?=
 =?us-ascii?Q?05r3tY6nyUMHi1+lmCrUTCxqZt5AsIow2pmxnzp79AVA0cSlfMUEPschN04s?=
 =?us-ascii?Q?Uug1YKeIuzjKj0i5oet3hg7f//zhzUevOxFzXToFUeBH6qna7YtMd0AVPs8p?=
 =?us-ascii?Q?oyzNc1TlR3ebHAcZoSe0heSxN4RmTEdCX3oFR9fm/oqpmWRWZpEW+5j35WhL?=
 =?us-ascii?Q?RgbEmkRJlXzM7ROhSTOmScyMeKCwwGHf0BSskkKS03hE6EQxVEl/wS2dfBf1?=
 =?us-ascii?Q?IldLTjDIESGAQLiMQ68+QFrklO1Oh/O60nI8edQETkEyHezoVBtdI6jOPJUC?=
 =?us-ascii?Q?Gdh/OWAv9yPvQRUYRUVMfcem+w0oJOvmAK/nKmUwNI7HmCZzg9+U6o5UVvwk?=
 =?us-ascii?Q?aZWa+yAZI//+mJjpLEOz0V0JBc8ocWw7h3KoRcGyeMLEB5XoHnjal0vMuWPs?=
 =?us-ascii?Q?Ot/omLrzrnWYDYX14hRqApWFD3caBPhMn7BFAblMQHbAXo0CbcZwMZd2gXRM?=
 =?us-ascii?Q?b9AxVweJ+3wEZGnddZhIZQwgR0ndZKNSwUN+8iYi2wS4xLV6mxwzchjtBaZY?=
 =?us-ascii?Q?MdM7W4wIBOIhYg0tSuTLYmgUX+a0+/dN3VO6lR4DJS43FZHOyxf6Ancbv1L4?=
 =?us-ascii?Q?4B3SXYzxB8kf64VS2p9DyEIoNbK0gTziVhNZv4F/S4MOX4MhfDFE1tNUeIDJ?=
 =?us-ascii?Q?RZJoJoWiSYStuLd+3aXciyrD/WBnPwJSNuwi3/mPUw0ogFFnzUcooDoeSOY9?=
 =?us-ascii?Q?6GaX8QR9yf8U1eC3XZOprsW2RJc+QJvdjg6isYEBdEu9ZFy4rTSwzMDJ27+G?=
 =?us-ascii?Q?iQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 658ceb3a-80da-4c03-eab5-08db2a24b422
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2023 15:55:33.8840 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Cbp9orwFu91LLC7QB27pN2FLZ1IQ/WP33JahjaItPJdgufOjVd6dEEjkfXrfl4XZWC0NmJyhY5h04QStl5RbmDBaQQE22ttT94f8HwUgq2Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4515
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 1/2] drm/xe: Add checks to load huc from a
 previous platform
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Matt Atwood <matthew.s.atwood@intel.com>, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, Mar 21, 2023 at 08:34:47AM -0700, Matt Roper wrote:
> On Mon, Mar 20, 2023 at 04:52:53PM -0700, Anusha Srivatsa wrote:
> > Platforms like ADL-S use TGL HuC. Add suitable condition
> > so driver does not disable HuC.
> > 
> > Cc: Matt Atwood <matthew.s.atwood@intel.com>
> > Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> > Signed-off-by: Anusha Srivatsa <anusha.srivatsa@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_uc_fw.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
> > index 00408f1b73e1..e2e5f7fbe9db 100644
> > --- a/drivers/gpu/drm/xe/xe_uc_fw.c
> > +++ b/drivers/gpu/drm/xe/xe_uc_fw.c
> > @@ -139,7 +139,7 @@ uc_fw_auto_select(struct xe_device *xe, struct xe_uc_fw *uc_fw)
> >  	fw_count = blobs_all[uc_fw->type].count;
> >  
> >  	for (i = 0; i < fw_count && p <= fw_blobs[i].p; i++) {
> > -		if (p == fw_blobs[i].p && rev >= fw_blobs[i].rev) {
> > +		if (p >= fw_blobs[i].p && rev >= fw_blobs[i].rev) {
> 
> Isn't this going to make various platforms pick up firmwares that we
> don't want it to?  I.e., how do you deal with platforms that don't
> want/need a HuC now if they automatically just start picking up a HuC
> for the next older platform?
> 
> It's not clear to me why this is needed either; once you pass the code
> through the preprocessor ("make drivers/gpu/drm/xe/xe_uc_fw.i"), the GuC
> firmware table looks like:
> 
> static const struct uc_fw_platform_requirement blobs_guc[] = {
>   { .p = XE_METEORLAKE, .rev = 0, .blob = { .major = 70, .minor = 5, .path = "i915/" "mtl" "_" "guc" "_" "70" ".bin" }, },
>   { .p = XE_ALDERLAKE_P, .rev = 0, .blob = { .major = 70, .minor = 5, .path = "i915/" "adlp" "_" "guc" "_" "70" ".bin" }, },
>   { .p = XE_ALDERLAKE_S, .rev = 0, .blob = { .major = 70, .minor = 5, .path = "i915/" "tgl" "_" "guc" "_" "70" ".bin" }, },
>   { .p = XE_PVC, .rev = 0, .blob = { .major = 70, .minor = 5, .path = "i915/" "pvc" "_" "guc" "_" "70" ".bin" }, },
>   { .p = XE_DG2, .rev = 0, .blob = { .major = 70, .minor = 5, .path = "i915/" "dg2" "_" "guc" "_" "70" ".bin" }, },
>   { .p = XE_DG1, .rev = 0, .blob = { .major = 70, .minor = 5, .path = "i915/" "dg1" "_" "guc" "_" "70" ".bin" }, },
>   { .p = XE_TIGERLAKE, .rev = 0, .blob = { .major = 70, .minor = 5, .path = "i915/" "tgl" "_" "guc" "_" "70" ".bin" }, },
> };

Sorry, that's the GuC table.  The HuC table is

 static const struct uc_fw_platform_requirement blobs_huc[] = {
  { .p = XE_DG1, .rev = 0, .blob = { .major = 7, .minor = 9, .path = "i915/" "dg1" "_huc_" "7" "." "9" "." "3" ".bin" }, }, 
  { .p = XE_TIGERLAKE, .rev = 0, .blob = { .major = 7, .minor = 9, .path = "i915/" "tgl" "_huc_" "7" "." "9" "." "3" ".bin" }, },
 };

But it should still just be a matter of adding table entries for the
other platforms to specify which firmware we want them to load now,
right?  Otherwise, we're going to wind up with stuff like all of DG2,
PVC, ADL-S, ADL-P, and MTL automatically falling back to use the DG1
firmware, which isn't what we want.


Matt

> 
> so it seems like the direct == test would still be what we want?  The
> only platform missing from the table today is RKL, but we can add that.
> 
> As an aside, the platform ordering here and in the definition of 'enum
> xe_platform' seems incorrect.  Since they're both incorrect in the same
> way, I don't think it causes a problem, but we should probably clean
> that up at some point too.
> 
> 
> 
> Matt
> 
> >  			const struct uc_fw_blob *blob = &fw_blobs[i].blob;
> >  
> >  			uc_fw->path = blob->path;
> > -- 
> > 2.25.1
> > 
> 
> -- 
> Matt Roper
> Graphics Software Engineer
> Linux GPU Platform Enablement
> Intel Corporation

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
