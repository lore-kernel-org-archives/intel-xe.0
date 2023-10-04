Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE263E7B61D
	for <intel-xe@archiver.kernel.org>; Wed,  4 Oct 2023 13:58:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DE1C10E385;
	Wed,  4 Oct 2023 13:58:39 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2D7410E119
 for <intel-xe@lists.freedesktop.org>; Wed,  4 Oct 2023 13:58:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696427917; x=1727963917;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=tRXEmDJUPlpORI5IFgJqrCEP/VvE7RhkE1FO9zOLd0w=;
 b=SYY0lVtREjKKSxm/dkglme4tTapxG0SfqBPCOvT/MHtqRU44IwWXH17B
 q3Im+oP865FOhgUunGpGQSv3aUc6yn8fms37oV9H3fn5p1zZW2mJPPEFh
 gygwW6k21za3LPe4KV3CMBdetoC74ecJn2UMVljCUR0B8vf5tl7uyweNJ
 wNpg3yTm1pnkQJm8BzhzM8JRYbi/XV+OJbg9ycPBh69elb0MjAft/aFLJ
 c993XAeo+EOqcKw5/OU0UTRLiIMYuuakGgliY/UYHRWbygMXiyp6bE1SE
 VfPxMgHNi41lIG+Rbb/x4jIVcOWP2Mh26k0xD+2Jpk2OM4hG3ykHevS4S Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="373516926"
X-IronPort-AV: E=Sophos;i="6.03,200,1694761200"; d="scan'208";a="373516926"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2023 06:58:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="780784155"
X-IronPort-AV: E=Sophos;i="6.03,200,1694761200"; d="scan'208";a="780784155"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Oct 2023 06:58:37 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 4 Oct 2023 06:58:36 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Wed, 4 Oct 2023 06:58:36 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Wed, 4 Oct 2023 06:58:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nfA5hAX2PlXsPcuax6v1NrNACDAhjr0mqzPtql5mXGLEZqymrzfecwcq5J/7TfN1egTHwVr42q7+KQWPTtr45mUggX137JSWc2feFk1OhmoXOVwdPoy5MuUUUW7H92HYkN/T1/NPXUm8AElvNJG8pGjUQCKt6DFhIWsF3BX+KwNqstTJxZsdkn+Il/LdV6AAfW7IQSZmH+Tt8Ncbjg5Bq/MW8KhzNPtF5Kz6W43K1klrMuaNqx1CXtMoXNF4BDd7sx1N0p9faeTzwlMFHKMDTqYx1SfZ4xQkgGKWw38tYU97UndIp5ymhHMNYELjsd2Jh5oDUz9SF71XovEiBwAJoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ifuu6CTuz+Uh0xci0qbWObYNBCM55EQMoQG+vw0HcrQ=;
 b=UMTRx7vJz69hOyjaupP2FBvf10LS1SXEMhfE1Cg+UH39FiotmfZh9qRThTC1RdxqqP24dfSGaWofu2GYyPZb+d8EcdLGHmGcwmSz/Sljtb3c5Zu8YETi1l8T1hQx5TkRpgFOMnzAlo6GCGQowHXyrFo/j7CCa0fNoZjrASXcgOkvfPHPrtMInfWvyPvnN0ijoohJiRIhacGNFufPLkIOZxDIGC2fpCIBObxPRjcSssAY+G697c904P+EhKUvVtyR1euuFD6IzC6N4L58W31Hd7zy3yxG5dm5EnUEXRAzb+JobkDvUSMh/tgRqlvgF5XL0rsXUkJVxfENBz5cSjrKtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ0PR11MB5866.namprd11.prod.outlook.com (2603:10b6:a03:429::10)
 by SA0PR11MB4621.namprd11.prod.outlook.com (2603:10b6:806:72::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.26; Wed, 4 Oct
 2023 13:58:33 +0000
Received: from SJ0PR11MB5866.namprd11.prod.outlook.com
 ([fe80::8272:9148:30e8:383a]) by SJ0PR11MB5866.namprd11.prod.outlook.com
 ([fe80::8272:9148:30e8:383a%3]) with mapi id 15.20.6838.016; Wed, 4 Oct 2023
 13:58:33 +0000
From: "Kershner, David" <david.kershner@intel.com>
To: "Vishwanathapura, Niranjana" <niranjana.vishwanathapura@intel.com>
Thread-Topic: [PATCH v3 1/2] drm/xe/xe_migrate.c: Use DPA offset for page
 table entries.
Thread-Index: AQHZ9kgOIfozZ8DqJEm4cK+Amtm7gbA4sYkAgAD3bHA=
Date: Wed, 4 Oct 2023 13:58:33 +0000
Message-ID: <SJ0PR11MB5866889973B4AD7426E0B7F281CBA@SJ0PR11MB5866.namprd11.prod.outlook.com>
References: <20231003222145.4090918-1-david.kershner@intel.com>
 <20231003222145.4090918-2-david.kershner@intel.com>
 <ZRyf0DHi/DXWAoHP@nvishwa1-DESK>
In-Reply-To: <ZRyf0DHi/DXWAoHP@nvishwa1-DESK>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR11MB5866:EE_|SA0PR11MB4621:EE_
x-ms-office365-filtering-correlation-id: a823b952-1731-44f0-b6a5-08dbc4e1ff94
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Fr1DRnd9lUb92B0QvAIkzEk66f/9omdc4gprvMPsK0ON57WC3zQP/RU+RFINacxd5Yu29lcZ94EEheRyLSUT2PuidL0l2TG0nul2qFoJaQya0hmNdzERIE0bFWvkT7xFce2uZmrue2JqWzI57ca0ZCdDmWRKD4BdAweR+SLn35RH2VjliIQr5kqLwF0lQRgwIM4VBN4tZH6+R8UX52vDXbYfD0v2FEHnyVNEUyt3Y1qmStX+6tMaMgpL8VjvFQeB6f6m7AFsW3crK90AbOCofmL88X6J88ACTEZUmHxRhJesDw6anCRuyL3O2fTIVi5sApZ8P6beUXe3RnIDsE/hgCAMDH89WcuvXgdjj245N4wPwEBSayziA8DXmjkDB2KvQ3Lj9vThHIZQKzIoP+ajdM1WH94AyQMu6TklTgXSCafwRA+hTnO72SccK4pAskn1aA8NJwZqJru57TfP+u0sdQzgBBKsNjSJumMMfC9ZezCUyvk76haL44XYjDNXBQMg1PKm19w46xK8mTpVWwzFCjPHhXWyzFVyCRa8KeJfKxzjnugqckfzYs12KHx4bHZKCoQp2XanCxAZnu/5k5iZH8noV9rSH/Rwb3fwV9f4C5Lgvz758sbnpYSCW8Bjql/2
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB5866.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(376002)(396003)(39860400002)(346002)(366004)(230922051799003)(1800799009)(186009)(451199024)(64100799003)(54906003)(66476007)(76116006)(26005)(52536014)(41300700001)(6636002)(316002)(53546011)(2906002)(7696005)(71200400001)(5660300002)(6506007)(478600001)(107886003)(66446008)(8936002)(66556008)(83380400001)(8676002)(64756008)(6862004)(4326008)(66946007)(9686003)(122000001)(82960400001)(38070700005)(38100700002)(86362001)(33656002)(55016003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?mq9KapR8ADreRVCHSy6GFOFYsJgqGMuU7WDTqTsDAkdXttJUq+ZwT3vYKUkB?=
 =?us-ascii?Q?pPaKBST92ceGCCqn0YNdYUAh6SSEiseduYka+tpbe4l9lq8P36DSkbOJ7BRb?=
 =?us-ascii?Q?AH5RwB9XbnXnUGQuTwlIRqy+FJvdIcgrVZfGceRPafWuoaOtGBGj7nZRH6Et?=
 =?us-ascii?Q?rsi7q5pRYbGz6Kjbawguk/Om5EcHiJfjhNDMBDfiUtdsHCVzrfptmUtnqL+L?=
 =?us-ascii?Q?0h7EdbVI09KmB2ezEJz0KKeqjHZCA8izeySmLR5sDksnWRR2E0KhYbm0/uR2?=
 =?us-ascii?Q?3ndIGcTAg/J9Oj4Fn8yxap6l0mRWW7LmPY5nf2Uvnxnf0fKF54cHiMelb8tT?=
 =?us-ascii?Q?qWGQRQJJ+b8UNlHxA+fBVc0WHZXMzd12S3VMdWqZ4tqsUVz137t09TfCpqDa?=
 =?us-ascii?Q?RdHeqT5nmP7Iqd5DVu+eA54dROxvOF4BXbh8eqSKH3pX3l5Wq56+eKVxP+Zi?=
 =?us-ascii?Q?aB3aU3qq+z60DcJlEDIHXmTrpCJzqy0vgrheWkcxxsMwW8hWB89/l1ZNlZ7L?=
 =?us-ascii?Q?uAqjcgkrZsaohWKKAli7o3QxnQepLEAFsk4RMvOSbbidTNt7YqHqmfvQMayW?=
 =?us-ascii?Q?YbI4SznxPEUW2UhUBDgkJSOWBzlDNFDl2eJXzzicMqAVHB00WIG9M0ONa+qV?=
 =?us-ascii?Q?dSlneLDMVkosiF0L75yaR9W4hr/3g8not/k1VWE+pa7o0f86jK5Nt2gmMBHE?=
 =?us-ascii?Q?6ij+geBXFQZz4vOKII0eKwW9GN5hdz7NfTDnk1eZqb5APeJsTf4Ho0CinSFD?=
 =?us-ascii?Q?INlTrC2c3qRqFfzsF2Ou6O2uMkgcTivVV7uIRLFvNuJ84lrgvT+fintdKyBc?=
 =?us-ascii?Q?PcOJYe4Ue6HijXdF277y/dZ8r5nq75pHymmttgETGtZhPDji11gj391+1Ope?=
 =?us-ascii?Q?DyfbvzOJTDUiaXkk6QgLH4jaJLsfT0Ge2rLS1bppp+dLPZQ+/v+utCpBL8Vw?=
 =?us-ascii?Q?Pr5eWxjw8I3MTNE1CFdeTY7xnM+5zXRL2O3UcS5FdkIiXe3qbAC+P4jxvnNB?=
 =?us-ascii?Q?8QMf2IRjfsLP8C9uGkwTqgXkl4JEsrvcGeke3hJYVGaVqQ2l5Xg+4w+9QwQ8?=
 =?us-ascii?Q?mpXyk1YZAkFycGkyQt0O0Nlt7bFo1GVYTSGM/lrJEtIRRGiEsSnBWUoAb/ar?=
 =?us-ascii?Q?dSUMLtC5IONFCX6hmw+nuoAE3wIiIrnLjojWWAotvpUHHG4k4H79f+B2xnTz?=
 =?us-ascii?Q?AtGhs0nmFkVLzdp8LB5KC2p7aw02fNAbE41bWE2nReuJUkejWIbt3TqHsh2Z?=
 =?us-ascii?Q?idKzhe1KnyhzZFGRMDiGGCbhFpYw0QwrAix4bh5Ll27savo16rarR6Q7t72Z?=
 =?us-ascii?Q?vWM0hAwx5q4bK8G2bvWeu/EURx/Ohsztb0h9VOxBLzkC/ioCkAcndTFEYeC3?=
 =?us-ascii?Q?f27w5D8yghOioOLLRrGksBuqfYmsTCGg0LBzcxurOzSGnVz7AyvKLXA/M+tr?=
 =?us-ascii?Q?u1jZ/REmY4SblNwadrLBoaMuahisQxGI2xvvNZo0YaZRlPetP0cDCr+dW/+s?=
 =?us-ascii?Q?7ypWaWn2usfNsUkv2RTrMrNcRqJV3NKhBswjll7OCZeqhZCYDGfN4S05MjPm?=
 =?us-ascii?Q?HWW9efeig9cF2gB3eqcxDTHCR+wudnov6ummrEBn?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5866.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a823b952-1731-44f0-b6a5-08dbc4e1ff94
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Oct 2023 13:58:33.7567 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: k7g/ubYNo05NlkVaOSqewkAcyZsqNXHcfA7nMoC1Klmv0ntpkywkAImf5tgeehBw6MIaWd87wQWpPfaKNWr3WHQ4o6Y3BvnimoFe77M7inY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4621
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v3 1/2] drm/xe/xe_migrate.c: Use DPA offset
 for page table entries.
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
Cc: "Fleck, John" <john.fleck@intel.com>, "Summers,
 Stuart" <stuart.summers@intel.com>, "Roper,
 Matthew D" <matthew.d.roper@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>



> -----Original Message-----
> From: Vishwanathapura, Niranjana <niranjana.vishwanathapura@intel.com>
> Sent: Tuesday, October 3, 2023 7:12 PM
> To: Kershner, David <david.kershner@intel.com>
> Cc: intel-xe@lists.freedesktop.org; Ruhl, Michael J <michael.j.ruhl@intel=
.com>;
> Fleck, John <john.fleck@intel.com>; Roper, Matthew D
> <matthew.d.roper@intel.com>; Brost, Matthew <matthew.brost@intel.com>;
> Summers, Stuart <stuart.summers@intel.com>
> Subject: Re: [PATCH v3 1/2] drm/xe/xe_migrate.c: Use DPA offset for page
> table entries.
>=20
> On Tue, Oct 03, 2023 at 06:21:44PM -0400, David Kershner wrote:
> >Device Physical Address (DPA) is the starting offset device memory.
> >
> >Update xe_migrate identity map base PTE entries to start at dpa_base
> >instead of 0.
> >
> >The VM offset value should be 0 relative instead of DPA relative.
> >
>=20
> Overall looks good to me. Some minor comments.
>=20
> >Signed-off-by: David Kershner <david.kershner@intel.com>
> >---
> > drivers/gpu/drm/xe/tests/xe_migrate.c | 37
> ++++++++++++++++++++++++---
> > drivers/gpu/drm/xe/xe_migrate.c       | 22 ++++++++++------
> > 2 files changed, 47 insertions(+), 12 deletions(-)
> >
> >diff --git a/drivers/gpu/drm/xe/tests/xe_migrate.c
> >b/drivers/gpu/drm/xe/tests/xe_migrate.c
> >index 6906ff9d9c31..75b06f0bd755 100644
> >--- a/drivers/gpu/drm/xe/tests/xe_migrate.c
> >+++ b/drivers/gpu/drm/xe/tests/xe_migrate.c
> >@@ -99,7 +99,7 @@ static const struct xe_migrate_pt_update_ops
> sanity_ops =3D {
> > 		} } while (0)
> >
> > static void test_copy(struct xe_migrate *m, struct xe_bo *bo,
> >-		      struct kunit *test)
> >+		      struct kunit *test, u32 region)
> > {
> > 	struct xe_device *xe =3D tile_to_xe(m->tile);
> > 	u64 retval, expected =3D 0;
> >@@ -111,7 +111,7 @@ static void test_copy(struct xe_migrate *m, struct
> xe_bo *bo,
> > 	struct xe_bo *sysmem =3D xe_bo_create_locked(xe, m->tile, NULL,
> > 						   bo->size,
> > 						   ttm_bo_type_kernel,
> >-						   XE_BO_CREATE_SYSTEM_BIT
> |
> >+						   region |
> >
> XE_BO_NEEDS_CPU_ACCESS);
>=20
> In this function, we should now change the bo name from 'sysmem' to
> 'remote'
> or something similar.
>=20
> > 	if (IS_ERR(sysmem)) {
> > 		KUNIT_FAIL(test, "Failed to allocate sysmem bo for %s: %li\n",
> @@
> >-187,6 +187,27 @@ static void test_copy(struct xe_migrate *m, struct xe_=
bo
> *bo,
> > 	xe_bo_put(sysmem);
> > }
> >
> >+static void test_copy_sysmem(struct xe_migrate *m, struct xe_bo *bo,
> >+			     struct kunit *test)
> >+{
> >+	test_copy(m, bo, test, XE_BO_CREATE_SYSTEM_BIT); }
> >+
> >+static void test_copy_vram(struct xe_migrate *m, struct xe_bo *bo,
> >+			   struct kunit *test)
> >+{
> >+	u32 region;
> >+
> >+	if (bo->ttm.resource->mem_type =3D=3D XE_PL_SYSTEM)
> >+		return;
> >+
> >+	if (bo->ttm.resource->mem_type =3D=3D XE_PL_VRAM0)
> >+		region =3D XE_BO_CREATE_VRAM1_BIT;
> >+	else
> >+		region =3D XE_BO_CREATE_VRAM0_BIT;
> >+	test_copy(m, bo, test, region);
> >+}
> >+
> > static void test_pt_update(struct xe_migrate *m, struct xe_bo *pt,
> > 			   struct kunit *test, bool force_gpu)  { @@ -349,7
> +370,11 @@
> >static void xe_migrate_sanity_test(struct xe_migrate *m, struct kunit *t=
est)
> > 	check(retval, expected, "Command clear small last value", test);
> >
> > 	kunit_info(test, "Copying small buffer object to system\n");
> >-	test_copy(m, tiny, test);
> >+	test_copy_sysmem(m, tiny, test);
> >+	if (IS_DGFX(xe) && xe->info.tile_count > 1) {
> >+		kunit_info(test, "Copying small buffer object to other
> vram\n");
> >+		test_copy_vram(m, tiny, test);
> >+	}
>=20
> Probably we don't need IS_DGFX() check. tile_count check should be good
> enough?
>=20

We're concerned with multi tile internal devices, if this is not an issue, =
then we can drop the check.

David Kershner
> >
> > 	/* Clear a big bo */
> > 	kunit_info(test, "Clearing big buffer object\n"); @@ -366,7 +391,11
> >@@ static void xe_migrate_sanity_test(struct xe_migrate *m, struct kunit
> *test)
> > 	check(retval, expected, "Command clear big last value", test);
> >
> > 	kunit_info(test, "Copying big buffer object to system\n");
> >-	test_copy(m, big, test);
> >+	test_copy_sysmem(m, big, test);
> >+	if (xe->info.tile_count > 1) {
> >+		kunit_info(test, "Copying big buffer object to opposite
> vram\n");
>=20
> s/opposite/other/
>=20
> >+		test_copy_vram(m, big, test);
> >+	}
> >
> > 	kunit_info(test, "Testing page table update using CPU if GPU idle.\n")=
;
> > 	test_pt_update(m, pt, test, false);
>=20
> This test update should be in a separate patch.
>=20
> >diff --git a/drivers/gpu/drm/xe/xe_migrate.c
> >b/drivers/gpu/drm/xe/xe_migrate.c index 15f091a7bba3..42942aeef595
> >100644
> >--- a/drivers/gpu/drm/xe/xe_migrate.c
> >+++ b/drivers/gpu/drm/xe/xe_migrate.c
> >@@ -114,8 +114,12 @@ static u64 xe_migrate_vm_addr(u64 slot, u32
> level)
> > 	return (slot + 1ULL) << xe_pt_shift(level + 1);  }
> >
> >-static u64 xe_migrate_vram_ofs(u64 addr)
> >+static u64 xe_migrate_vram_ofs(u64 addr, struct xe_device *xe)
> > {
>=20
> The convention is to have 'xe' as first argument, so it is better to foll=
ow that.
>=20
> >+	/* Remove the DPA to get a correct offset into identity table for the
> >+	 * migrate offset
> >+	 */
>=20
> Comment format followed elsewhere is,
> /*
>   * comments line1
>   * comments line2
>   */
>=20
> Better to follow that.
>=20
> >+	addr -=3D xe->mem.vram.dpa_base;
>=20
> Should never happen, but probably a good idea to add an assert that addr =
>
> dpa_base? Otherwise, we will endup with hard to debug issues.
>=20
> > 	return addr + (256ULL << xe_pt_shift(2)); }
> >
> >@@ -149,7 +153,7 @@ static int xe_migrate_create_cleared_bo(struct
> >xe_migrate *m, struct xe_vm *vm)
> >
> > 	xe_map_memset(xe, &m->cleared_bo->vmap, 0, 0x00, cleared_size);
> > 	vram_addr =3D xe_bo_addr(m->cleared_bo, 0, XE_PAGE_SIZE);
> >-	m->cleared_vram_ofs =3D xe_migrate_vram_ofs(vram_addr);
> >+	m->cleared_vram_ofs =3D xe_migrate_vram_ofs(vram_addr, xe);
> >
> > 	return 0;
> > }
> >@@ -225,12 +229,12 @@ static int xe_migrate_prepare_vm(struct xe_tile
> *tile, struct xe_migrate *m,
> > 	} else {
> > 		u64 batch_addr =3D xe_bo_addr(batch, 0, XE_PAGE_SIZE);
> >
> >-		m->batch_base_ofs =3D xe_migrate_vram_ofs(batch_addr);
> >+		m->batch_base_ofs =3D xe_migrate_vram_ofs(batch_addr, xe);
> >
> > 		if (xe->info.supports_usm) {
> > 			batch =3D tile->primary_gt->usm.bb_pool->bo;
> > 			batch_addr =3D xe_bo_addr(batch, 0, XE_PAGE_SIZE);
> >-			m->usm_batch_base_ofs =3D
> xe_migrate_vram_ofs(batch_addr);
> >+			m->usm_batch_base_ofs =3D
> xe_migrate_vram_ofs(batch_addr, xe);
> > 		}
> > 	}
> >
> >@@ -268,7 +272,9 @@ static int xe_migrate_prepare_vm(struct xe_tile *til=
e,
> struct xe_migrate *m,
> > 		 * Use 1GB pages, it shouldn't matter the physical amount of
> > 		 * vram is less, when we don't access it.
> > 		 */
> >-		for (pos =3D 0; pos < xe->mem.vram.actual_physical_size; pos +=3D
> SZ_1G, ofs +=3D 8)
> >+		for (pos =3D xe->mem.vram.dpa_base;
> >+		     pos < xe->mem.vram.actual_physical_size + xe-
> >mem.vram.dpa_base;
> >+		     pos +=3D SZ_1G, ofs +=3D 8)
> > 			xe_map_wr(xe, &bo->vmap, ofs, u64, pos | flags);
> > 	}
> >
> >@@ -443,8 +449,8 @@ static u32 pte_update_size(struct xe_migrate *m,
> > 		cmds +=3D cmd_size;
> > 	} else {
> > 		/* Offset into identity map. */
> >-		*L0_ofs =3D xe_migrate_vram_ofs(cur->start +
> >-					      vram_region_gpu_offset(res));
> >+		*L0_ofs =3D xe_migrate_vram_ofs(cur->start +
> vram_region_gpu_offset(res),
> >+					      tile_to_xe(m->tile));
> > 		cmds +=3D cmd_size;
> > 	}
> >
> >@@ -1062,7 +1068,7 @@ static void write_pgtable(struct xe_tile *tile, st=
ruct
> xe_bb *bb, u64 ppgtt_ofs,
> > 	xe_tile_assert(tile, update->qwords <=3D 0x1ff);
> > 	if (!ppgtt_ofs) {
> > 		ppgtt_ofs =3D xe_migrate_vram_ofs(xe_bo_addr(update-
> >pt_bo, 0,
> >-							   XE_PAGE_SIZE));
> >+							   XE_PAGE_SIZE),
> tile_to_xe(tile));
> > 	}
> >
> > 	do {
> >--
> >2.35.1
> >
