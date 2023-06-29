Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F6C2EB64D9
	for <intel-xe@archiver.kernel.org>; Thu, 29 Jun 2023 04:21:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A4A210E021;
	Thu, 29 Jun 2023 04:21:00 +0000 (UTC)
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADAED10E021
 for <intel-xe@lists.freedesktop.org>; Thu, 29 Jun 2023 04:20:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1688012458; x=1719548458;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=WIsKhf2xaBgN1LkGlfkNaRHSMSDPAyfCbDZnilhcEkY=;
 b=B6CF79z2w2Qd4hl9lTgLvuqCuiMDbMO+gvKAx4CDKQRU2XH0Lf0u7Hk6
 qAFITfGJG/ltIf4OKas3I6dxyuouUOL6WGCpP2NzP+cRuaOykQHOwDB7T
 Z28AbPK7nEq4d7cZaPnfG1aOUB39l/6PMbYekgSj7zDh4DzsUnmXAIz4G
 5dTq4VEUM4hLkfzHYnfVKRoNlgdusouAuiZWYqubCS8fBe2+KpzkJOwJ/
 udUnnHiagEjIg1MCEGKIccf7JrfDAjJgdXEGXrOJB36uAnlFDcxc3Ic4w
 Lf6tmguLT5MNclMr2lAbswZEo3P91JgqdX4EOXGzzQKPq8o7QVq+wh7Pj w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10755"; a="425687373"
X-IronPort-AV: E=Sophos;i="6.01,167,1684825200"; d="scan'208";a="425687373"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jun 2023 21:20:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10755"; a="746885288"
X-IronPort-AV: E=Sophos;i="6.01,167,1684825200"; d="scan'208";a="746885288"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga008.jf.intel.com with ESMTP; 28 Jun 2023 21:20:57 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 28 Jun 2023 21:20:56 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 28 Jun 2023 21:20:56 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Wed, 28 Jun 2023 21:20:56 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.48) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Wed, 28 Jun 2023 21:20:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dzhT0KOtD25bqNKCtThQZD36zva4IXa2Kcuu705/WlD/D29T2RBmrThJe8aXxonHZ93koqWlolQhhhVLv22o/zI3kTQ1igtcal7QTFNJlFjGsqtsUujICtPS1lmrroqnQUCzFsuOz2Jl8bdb8dlUod48pR2iEM1k5R02k3C6H5TRHgqHb0WjM/QfQtjLpSn6cDE4U2idpz1xDL7JNeY1ekGAnITGWpoIO+78j3HKdac5c7buUVX1P/iL/itodw4V0allLNyy1fIBEhWvXto7wxQypHTrglSqci4+G1d9ccBZ9KWK50ahZk1eP7uaAyjuRn221o5/IOR/KYPSzRJs0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J7AmK0ao35Oz6TPjxaSHo0Uu/5DzNs7PB1FjIaGN4uQ=;
 b=YO1McfTR49wTkQfFIOonxtYkFJ58IkSgFxXye4tOl+Ktyhh7rtOanqHL/WOkmpO+fwCOhsJxjDzmiCENtVWT1hwJrJKM6HLQarHawIJ0d1Qt6h0m5Db+QDg6YXn4kozLHK222V/RCJCuxQsT8Y8yRF2s+m1MVlSbJgCy6JWig1n9sC59hjrJs7pCgoGpPJPv19K9W+73e1AO/aVoKH/ykR3MO+Htum2vAgO+q+UBPePlSaIKANI5aLL8jjbNvhN42owtMXy0a/8uQNfXSaT6q6kBhfjRS+eP/d+ba3ZXfXDqSW4mi1hjuyCSDYYv3rIykgwdcKGSYLy+yomMVQxUeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com (2603:10b6:a03:459::19)
 by DS0PR11MB8082.namprd11.prod.outlook.com (2603:10b6:8:157::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.24; Thu, 29 Jun
 2023 04:20:52 +0000
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::2bfb:7d63:f348:1a4]) by SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::2bfb:7d63:f348:1a4%5]) with mapi id 15.20.6521.023; Thu, 29 Jun 2023
 04:20:52 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Vishwanathapura, Niranjana" <niranjana.vishwanathapura@intel.com>
Thread-Topic: [Intel-xe] [PATCH V3 5/6] drm/xe: Add sysfs for preempt reset
 timeout
Thread-Index: AQHZqbWBroWWzc00rUWWDrV7TPT51q+gq/OAgACCblA=
Date: Thu, 29 Jun 2023 04:20:52 +0000
Message-ID: <SJ1PR11MB6204FC5259F39BEA7DAADFFC8125A@SJ1PR11MB6204.namprd11.prod.outlook.com>
References: <20230628114732.3598169-1-tejas.upadhyay@intel.com>
 <20230628114732.3598169-6-tejas.upadhyay@intel.com>
 <ZJyY6agT9EcfwRbw@nvishwa1-DESK>
In-Reply-To: <ZJyY6agT9EcfwRbw@nvishwa1-DESK>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6204:EE_|DS0PR11MB8082:EE_
x-ms-office365-filtering-correlation-id: c9f9b40b-c8c2-4952-75e2-08db78583993
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: VZLZRPug98yqNN8z7Hh2HX2ItDY+AqDItYuwkq66LibROCTrFj0XcmOtZaNW7K6gyUmfw5C7n3fPpxSfOl1oayYvkCpLT/RTb6SaTR6V8n9TjzJ+GuPw/28sM2j4UNhERdipxDqhz8v04rNU/Kjuk2c+eaTRJmW6KQB8qR8opGEs0gXEePDTtB8/uFXz3w6+pA0x/D9qquyp8jfaYLQi8+YD4MozlMaiLVHikJ6HE74kf4KsPhM3OfgY+VnUtJYt/Xy6th1AutBULcJsNqIZPEikJsP5IOgxsUkD3LEbPQH4AjbWBq6kiTlzxjiTkPhr0nRJngq2rA/U0756jj8x29k7uwXeenNyo7r5JvMpOVPHENNb98eBdxCDSgkqYA0peObG1S/8Eqxk/2QnhsI/DP9n6mJ8ZX9MgA0Ijky/UCYKSA3pDB1RM2b2oQfoYdUKXE6LhX/lNi61qi+AyLjT61/QA4ARDMr3+FR4gW9R3kuT6JCRiooMhgdRaXDdSd2cNz3o7Rcq72TK2yRqP7o+yNDWibCdTDeiupIdxfxs/OcFnAUSu4m8f7h4IuTLmkGzn4IihObqEg18LO4fM7QUpjiFAswWqjoIW1MzYuryQRzqdgTDqpyC4zQk66YRfjEf
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6204.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(396003)(346002)(136003)(39860400002)(366004)(451199021)(5660300002)(6506007)(52536014)(33656002)(64756008)(66556008)(316002)(66946007)(66446008)(478600001)(4326008)(66476007)(76116006)(6636002)(6862004)(8676002)(8936002)(86362001)(2906002)(9686003)(55016003)(41300700001)(7696005)(186003)(38070700005)(71200400001)(53546011)(83380400001)(38100700002)(122000001)(82960400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?4VetVy/tdwTKbcKVbMCUxs51G7fQyT7MRDkEeafuY5J6e9nBkBg5COup8AXc?=
 =?us-ascii?Q?w9mxM/nri4CxdTApkH+WqVXTC0KlqyJ758G9DKh6yiv2e3TvUDrtFlOCjM4T?=
 =?us-ascii?Q?LcK8LbLyqq9fcGcb1uMHW6bDO3eSjD2spxeI2WeXXxALTpzYvvIHOoQVwk19?=
 =?us-ascii?Q?Fh41pUB82CLvrG4tk+LTqvTM90oOflayhP0UG0B5espLXsEjSkdHdmgpM8hb?=
 =?us-ascii?Q?+EsXNGoFdXkhR3mZQCcqzFbFMgvtAbLRMeNQT4vBbp+G8ZIy77xQMupqO+go?=
 =?us-ascii?Q?O2RpCGhg+1++dITzvcw01aXhctlZSe3/HagYpA0VZd9DoFp5miIMN+52K0XN?=
 =?us-ascii?Q?fud0bYP5JPPMTFvGg5ulCNkOOoL8kOktRd/GCmLYUxK8BBjNoHNmOV3qt/Dz?=
 =?us-ascii?Q?DZaAexXU7FAW0u97fTgnJLpfgsmZwuXeE3fCTNTrImLcGaDhDu7U1oZbJaIc?=
 =?us-ascii?Q?z6fUwlbVXKj9C7VNoatyovsDyrEie5Rwx2f/vxuUIhJTXe+Yk4xPNQ/e3T0g?=
 =?us-ascii?Q?uZM+FSALODHMuxJld5txFJ/tiR3rcWcYXcb9boUrK0nCgNBqgtufKM820OZh?=
 =?us-ascii?Q?95vRHuXn0XvLbVdSMsLHFoLTLrRnCoEyO2o/TZmSh1Q0MyJhCiithmYjhmnQ?=
 =?us-ascii?Q?/oYfixEgHMS20th4PiOuTRb05XGpL3CHuwo12ycZmKM1FsjvAwUX64+vItUt?=
 =?us-ascii?Q?vZ/aNbhXTLnuMrIkAs8AOWEiRlPQkR1vTFYXMUptGoJW6xFgzcc8lxmKbiQQ?=
 =?us-ascii?Q?xeqXd1wk9oz3M8dX7tmOCi5kpnEmPnc1GlbhuE9tMAGv9dtGXHnCWDiXo2R3?=
 =?us-ascii?Q?S9UDiKcINsfiCfzZXEydtddVzkhuwYDQlH2OJ40b92h5FJyGiCd7UceLm8OY?=
 =?us-ascii?Q?io784Ld+ta0riDO1jeDEYRfvSrLYro4puyXRigxrjtMcoESy+6qDIdl1n2Ny?=
 =?us-ascii?Q?A/ncqi/nPyV8QBu6Ho9h35CeOpnFz2iQ8rXDBYvoCMlIW0BKrjD5RuupJPch?=
 =?us-ascii?Q?xGqav5VKl2mI/7+CGfWqmpco4qtpdNUP89RIhR4J6fmzI8vmdIY2orDmDIdy?=
 =?us-ascii?Q?2lQlSwCB713M3JDsT98ypVrTqjdxJpWBzhVQutwWedbLCETX7TbVW9rG2imu?=
 =?us-ascii?Q?9Jv6ass9lNnY83yGUHlDxPXjJLIvqHu13Q6Wc3TvVsq8fvr5a9SIHp7/WQXh?=
 =?us-ascii?Q?XCUkCBmQVIjZ5siGyIVDHsXRYuxVNGO6ALoMeYIXx0+MAlyNryauIjfOQAdy?=
 =?us-ascii?Q?zyF+1LgqYn3zBTY598wWJmkZj9WW2gESag/4JB/X6HfnUgG3/mX5MN4Lmz3b?=
 =?us-ascii?Q?Q+dAb3ebKCPEr/k1G+iX5jOxmz9wcvcrSeKtq2bNiQiLYnOGzMa2RhquLsfS?=
 =?us-ascii?Q?qta+/UJ+AsBHg3I05HfjbPNX2FGbhpu6ZNlKnnyY9b/zGuXTPxdAOKTCqDQb?=
 =?us-ascii?Q?tWBlM32kZWqPv6jYLznI7KxyQ+DUj1VefIonh4GOw7v5SEOpvnq1z11FYkfP?=
 =?us-ascii?Q?UiB900THGOQB8V00xytXykdKClGF0TQrRsl8Pob4UQB0OpUtfj/gPKX78vlS?=
 =?us-ascii?Q?IgXY7F3G0WjxiUdbQUirF4fNSNvJuJ/K1Ctn04PsWKOjkB4lTaadYChc/PhN?=
 =?us-ascii?Q?zFOVSbAZ7pHil1C6sf6PjTHAayzEABacu6hm4S+WXE+F?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6204.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c9f9b40b-c8c2-4952-75e2-08db78583993
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jun 2023 04:20:52.1389 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ro7E6Bu4B+Kuodp6vuzM/FSfGbycN3qBExSfe3ay9ZPrOWIgIMsYWZO8qYp5yeadcJ61ThR2inMBLQ3nUA0Pker7SpY+lq3Mh3JD8yMUNik=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8082
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH V3 5/6] drm/xe: Add sysfs for preempt reset
 timeout
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
> Sent: Thursday, June 29, 2023 2:03 AM
> To: Upadhyay, Tejas <tejas.upadhyay@intel.com>
> Cc: intel-xe@lists.freedesktop.org
> Subject: Re: [Intel-xe] [PATCH V3 5/6] drm/xe: Add sysfs for preempt rese=
t
> timeout
>=20
> On Wed, Jun 28, 2023 at 05:17:31PM +0530, Tejas Upadhyay wrote:
> >The preemption request and timeout is used for higher priority context
> >or kill hung context and reset gpu.
> >
> >The preempt timeout can be adjusted per-engine class using,
> >
> >/sys/class/drm/cardX/device/gtN/engines/ccs/preempt_timeout_us
> >
> >and can be disabled by setting it to 0.
> >
> >Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> >---
> > drivers/gpu/drm/xe/xe_gt_sysfs.c | 44 +++++++++++++++++++++++++++++-
> --
> > 1 file changed, 40 insertions(+), 4 deletions(-)
> >
> >diff --git a/drivers/gpu/drm/xe/xe_gt_sysfs.c
> >b/drivers/gpu/drm/xe/xe_gt_sysfs.c
> >index 6ca77c5917cc..4c8f589870ba 100644
> >--- a/drivers/gpu/drm/xe/xe_gt_sysfs.c
> >+++ b/drivers/gpu/drm/xe/xe_gt_sysfs.c
> >@@ -34,6 +34,37 @@ static const struct kobj_type kobj_xe_engine_type =3D=
 {
> > 	.sysfs_ops =3D &kobj_sysfs_ops
> > };
> >
> >+static ssize_t preempt_timeout_store(struct kobject *kobj,
> >+				     struct kobj_attribute *attr,
> >+				     const char *buf, size_t count) {
> >+	struct xe_hw_engine *hwe =3D kobj_to_hwe(kobj);
> >+	u32 timeout;
> >+	int err;
> >+
> >+	err =3D kstrtou32(buf, 0, &timeout);
> >+	if (err)
> >+		return err;
> >+
> >+	if (timeout > jiffies_to_usecs(MAX_SCHEDULE_TIMEOUT))
> >+		return -EINVAL;
> >+
> >+	WRITE_ONCE(hwe->sched_props.preempt_timeout_us, timeout);
> >+
> >+	return count;
> >+}
>=20
> So, these updated values does not affect the already created user engines=
.
> Maybe we can add that to commit description?

Sure

>=20
> >+
> >+static ssize_t preempt_timeout_show(struct kobject *kobj,
> >+				    struct kobj_attribute *attr, char *buf) {
> >+	struct xe_hw_engine *hwe =3D kobj_to_hwe(kobj);
> >+
> >+	return sprintf(buf, "%u\n", hwe-
> >sched_props.preempt_timeout_us);
> >+}
> >+
> >+static struct kobj_attribute preempt_timeout_attr =3D
> >+__ATTR(preempt_timeout_us, 0644, preempt_timeout_show,
> >+preempt_timeout_store);
> >+
> > static ssize_t timeslice_duration_store(struct kobject *kobj,
> > 					struct kobj_attribute *attr,
> > 					const char *buf, size_t count)
> >@@ -100,6 +131,7 @@ __ATTR(job_timeout_ms, 0644, job_timeout_show,
> >job_timeout_store);  static const struct attribute *files[] =3D {
> > 	&job_timeout_attr.attr,
> > 	&timeslice_duration_attr.attr,
> >+	&preempt_timeout_attr.attr,
> > 	NULL
> > };
> >
> >@@ -261,10 +293,14 @@ int xe_gt_sysfs_engines(struct xe_gt *gt)
> > 		}
> >
> > 		err =3D sysfs_create_files(&khwe->base, files);
> >-		if (err) {
> >-			kobject_put(kobj);
> >-			return err;
> >-		}
> >+		if (err)
> >+			goto err_object;
> >+	}
> >+
> >+	if (0) {
> >+err_object:
> >+		kobject_put(kobj);
> >+		return err;
> > 	}
>=20
> I am not sure if we really need this 'if (0)' construct. We could instead=
 do,
>=20
>       return 0;
> err_object:
>       kobject_put(kobj);
>       return err;
>=20
> In any case, we should do it in patch #3 (where this code is added) inste=
ad of
> here.

Ok, will check.

>=20
> Niranjana
>=20
> >
> > 	return err;
> >--
> >2.25.1
> >
