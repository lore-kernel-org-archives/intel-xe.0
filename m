Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8108CC76188
	for <intel-xe@archiver.kernel.org>; Wed,  5 Apr 2023 19:52:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A1F710E42F;
	Wed,  5 Apr 2023 19:52:23 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50D5410E09B
 for <intel-xe@lists.freedesktop.org>; Wed,  5 Apr 2023 19:52:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680724341; x=1712260341;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=u7jG8AbkQNotgJ5MAVURByP4d4V4Uat6+hHK7MIsnCg=;
 b=RFPogqm6lM/TvQv/g1hqeC0GtrSqBGeUwtXcNO8kJczlHz+D92Sd+TS/
 Zs9e5hz1agiHGxpyVnD68lv2BRQLLh4U3Gp8aRTnI2JnyF7ZjgZcBm133
 czpPaDRTPWEOeP0OJzoZ8+WB3/Kh4SvsfFVE+VWg1YNcx2IPorM84CnjE
 nsgn16rr00r/VBm6x8fn6mkub+3C8NXcsPPzDGbTGQX9QoGB5RbAW7AmB
 UoCxnBjmt0XYKP2oUq0RrxcT6O05aehOSswT5XnTIhbpG6+3uakOFTx8G
 5wq24wlMaBrO1YZB4DxLzHWMofup4E2iRaFENl8XxsM8L5shWJzFtu1/p A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10671"; a="326589491"
X-IronPort-AV: E=Sophos;i="5.98,321,1673942400"; d="scan'208";a="326589491"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2023 12:52:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10671"; a="680415733"
X-IronPort-AV: E=Sophos;i="5.98,321,1673942400"; d="scan'208";a="680415733"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga007.jf.intel.com with ESMTP; 05 Apr 2023 12:52:20 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 5 Apr 2023 12:52:20 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 5 Apr 2023 12:52:19 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Wed, 5 Apr 2023 12:52:19 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.175)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Wed, 5 Apr 2023 12:52:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PJVRpSvUDsqxk0cV1BIgQVGmbbNC7n3ZGCDXV5uMFQzf3H9dv+yXRAJAxG8zLahC56awAZ9vHLzfkmW4lF2j7Hyt5peuIz44pjELy/wUm5LhGmPivtsD8Y/AHowJ/OszIFmv1UikWpGQQ6Ra7edXGyrAHDYP8Obg1a5TBGbpT9sU3uYM/jvfXnZXGMnzqUgn+wChir1E/T8UKrzXeTtwTt1hSB75RcBfyVSi5Yh6oKJ2E4jztIj7tE5Y1AXXRNXFBiv8O3XA05Qzw3ybZIyGnc3++v4JOovMSnJe6PHm6/zCK79zG+y27eepXo/vIkyhGhUOMP0rcjUOhprUXlNSNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MfZ1/KnyEldV94uoJqH/lV+JZO7Cim2IGDkotPug2q4=;
 b=fKJyCfwm8xxkpeScj8biP2ojHfOS22C2lzDWrkIx9oPvcFvMBnCYVO/zNXaCYrb+rWuMWec2aKW8/KsswNbMqLc86cN3jUcwLQhX+P4paK5HJY4HtoB6lIpEoOwEMKlKxKDZHz/jSfKs5ScGaH7o8tY0vS5aAB2o8DmtQg5NnWGLPz29Fhw/U9JuWkphDKtDN3YigTVeNRQGJ+Vfzeb+jcpzLGq+pZrYO8KZhVQ8p/HQhZY4k9DtAVxPDfkrFa5zrFrqjgoTwzg2k/7kqzNJ8elr9umM/IoYu0tVzMQMfRjHWVfqo25pdc+ftsxYmBmS9/nvGbKc/oISJfRdZ6941Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY8PR11MB6940.namprd11.prod.outlook.com (2603:10b6:930:58::17)
 by MN2PR11MB4663.namprd11.prod.outlook.com (2603:10b6:208:26f::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.35; Wed, 5 Apr
 2023 19:52:17 +0000
Received: from CY8PR11MB6940.namprd11.prod.outlook.com
 ([fe80::69f8:7f28:f29:2876]) by CY8PR11MB6940.namprd11.prod.outlook.com
 ([fe80::69f8:7f28:f29:2876%9]) with mapi id 15.20.6254.030; Wed, 5 Apr 2023
 19:52:17 +0000
From: "Chang, Yu bruce" <yu.bruce.chang@intel.com>
To: "De Marchi, Lucas" <lucas.demarchi@intel.com>
Thread-Topic: [Intel-xe] [PATCH] drm/xe: follow up on the patch to fix pvc
 unload issue
Thread-Index: AQHZZ+E+yoGoH/e430S1l1TNg1AOO68c+HGAgAADeSCAAA2MAIAAFi+w
Date: Wed, 5 Apr 2023 19:52:17 +0000
Message-ID: <CY8PR11MB694007773EFAEB6AC9BA42EFC3909@CY8PR11MB6940.namprd11.prod.outlook.com>
References: <20230405170815.524853-1-yu.bruce.chang@intel.com>
 <20230405172857.gf6ubjtrhyjkxztg@ldmartin-desk2.lan>
 <CY8PR11MB6940D86EF2BABB63945DE52BC3909@CY8PR11MB6940.namprd11.prod.outlook.com>
 <20230405182952.m65hoo6khvprjjzq@ldmartin-desk2.lan>
In-Reply-To: <20230405182952.m65hoo6khvprjjzq@ldmartin-desk2.lan>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR11MB6940:EE_|MN2PR11MB4663:EE_
x-ms-office365-filtering-correlation-id: 398ee48d-2de2-4945-3ce7-08db360f428a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: EjJjvANfhElAmKODqIygXudYABqsDSY0MVdnbtxmgIoZEGFjbRNeSyyHmOMF1LN+Rt717pjCCWmVQ6MQxkgBV1XjRxuMgOLSjn6ts88NLtizCo5v34wbKx0P22vob7Enh9Hr5NRkRlF2wQVTWxgg8pw2PqcWAwn8pDpwkgLj+I0/2LL9lM+O3wrUDPTHAt4zU8YywmNP17kSp9Cbidspe5BVNdKJJvK1595BxJ260Ffxfz0ABIRuGtzkvWpcBDQMnAFEYazLz263p+1/R5ngKdckV62sOTXj2NeAmQrQVGZhrAHyBr/546lIleHF//UhZHvpfwhpHRIf/h49hi+1DlbAIpfoqmBzxBki+e4W6v++FMJZHtJqUUR2X9zIjU0CDSHGU9G81a3n8Q6145eCXKUNxUgvtHWck0Gp/bsY6XJVhDt39GEMYe2Bjc38CT6BAhXp02QX9GoyM4sedshsO80tfw0kk/A1iX1zijKOKLgrzDFvVUuy7SOCrO58afR6yYlX5hFRlWwrq4f634RJsB7R7EX1ZaaDQUdIps9CaFef/zhlNjSybmBggztx7Br9
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB6940.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(396003)(346002)(136003)(39860400002)(376002)(451199021)(38070700005)(122000001)(82960400001)(83380400001)(55016003)(53546011)(9686003)(966005)(6506007)(186003)(107886003)(38100700002)(6862004)(52536014)(8936002)(26005)(2906002)(33656002)(5660300002)(6636002)(7696005)(478600001)(41300700001)(66476007)(76116006)(64756008)(66946007)(66556008)(54906003)(71200400001)(8676002)(66446008)(4326008)(86362001)(316002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?7925OkM7AhRe1PbmZEW2NXcls75uc1txfXCTwLVh2j37KsyTSshxpgUFKl4B?=
 =?us-ascii?Q?Ocw021lxxti6ByA20TquRE9xXXEv3zyVuDiY5p6Kq1c2SOi9vuIEK/Qr/8s9?=
 =?us-ascii?Q?fOFGz7+bYQjhcae3xh1l7vInmt1a+5Qsa5Q0RpmIlF8rDJ0JWvm6zdGk7a1P?=
 =?us-ascii?Q?zIGudMoLfLNpTdg2XAbW45FwwnqPCJQ+FIIgBDxuTE8E5ekxFAiDE8I+6Mw6?=
 =?us-ascii?Q?/qPGoWkl7oc1KMSKAa1UGtmkFXt+WuRAmnTQdmqYGQCoQ+gbuGxEI5VGlfhg?=
 =?us-ascii?Q?bU7LpYeOd8gOdJMTDPARSUJJbPtdT+sZTELh1UPJGK0+q7L39z9g7N22tMOb?=
 =?us-ascii?Q?Xv4aX/sp/FZ5Xr4dq2nwn77pB0hswl3hCkcD0zMYq3iZzfYflW4D7eu+tKu9?=
 =?us-ascii?Q?MEthg3jd/i7l7P36itkn/nndfFgPUNqscnSurPbSFM3X+BNbB9lvVBusqHHt?=
 =?us-ascii?Q?HREqBhdoN1BYAfP8dfQzWj+aND+Df4Dq1iEGJnNc02Iqm1F3VFJnUgjfIH4M?=
 =?us-ascii?Q?vsdODv+YOVFtxYzqulMmomaUFARBhGQAAj9SFVszvlWtKDnQTNtVSn9LlvJ6?=
 =?us-ascii?Q?8yVSS6XEXiLZKJ8TY7R1CF5/89ly3/dhdFJFINB0jKp9zgqyfr8X8KhJ3h6l?=
 =?us-ascii?Q?YVwBqHTSY1Ik89m7TiL5r428eAIHJemjlrdmiYRYsefoSyCa5TCxpR9h/9Up?=
 =?us-ascii?Q?EWS2tQZV4xgchngjY6sehHAtJKUl6/Tuttl3LtvKhy61L+ujKa4EFcLfCbpe?=
 =?us-ascii?Q?IpL5EBCuLjqVS9el+RItq1hVIJGJB+v4FaYXPwcYBeADgUFi7z8FL0gXKQM7?=
 =?us-ascii?Q?h1Zm+ecW2E+TJWc6W7T9Kgn/ihw5nFxvhs1yx71w6Rmw9B+zR8Wz5NsX9QTs?=
 =?us-ascii?Q?2IBcBfY5jt3htIq+oPmMlJTxQ5JRGOxn/JMJZ3vy1msoSMczOAtAZt67wUKi?=
 =?us-ascii?Q?7ZzNAyc7GbH8G5b1ZxksGF1m4a6R9DZ7pTl0IzbxoKd4gGWeGqW/B8E56FU8?=
 =?us-ascii?Q?IjS30WruYypoa51NFbhGbMDFiQeR4AH4MRhjl0VnF5YteJky0qEb/eBx+EZQ?=
 =?us-ascii?Q?w+Lf24mpoA1NRim7ISuyEiOpiIE/5qY8s9CaQm8zQT0ixttavee0+iJLf8dr?=
 =?us-ascii?Q?gYEVinqE9XeVW07usDkM8l89LdOcKgRdMbGvVQ+SjJDzCpJVTRak24MXQs7I?=
 =?us-ascii?Q?bKGPIvq/xe5IClFXjnIvVwO7wy8cym0gxwykc7lE91TxX3n2iSrfzRK5VPhQ?=
 =?us-ascii?Q?xCyCDlGrgvQabVN7bq0NxCYEA0KDBpb1XoZ3EogoW14eZvMl1p4cjXds8zhn?=
 =?us-ascii?Q?XicsBxCCgjVwwswOiXX81bFsHbU7Q0UvJQ1Ttr+rMXyv2sZC65Lvif5JuUFy?=
 =?us-ascii?Q?+nnhrvdxg76oGQh0RhFhIop6Umt1OuJUbajXt2jPFw3faws1rksnFxoymbhG?=
 =?us-ascii?Q?pYDz1fWH2owqsoZ8UXc8now52rVY+hAqIq4cdl/yMgj1ne0lqNJMLO+suVCx?=
 =?us-ascii?Q?JBW8lApNsmZp9EvguXnt5eSS9q7iGo1HJrQBeMs087YzIlvIOVGEfug7wo4Q?=
 =?us-ascii?Q?8il1SvMiq1Z+V9j6A5ArbZBxq5iM2Sgs8kgDIenG?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB6940.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 398ee48d-2de2-4945-3ce7-08db360f428a
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Apr 2023 19:52:17.1663 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ph3NxKifbAuRqt7z2oPPeY4JId1Iro5mGuL0Hefhe2mj2WWV3k6egiAJhKV3pccmSNT65s5HZ8IsMSn34s8+yh2sf+3rZoUF4EzjXhW2I80=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4663
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: follow up on the patch to fix pvc
 unload issue
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
Cc: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Vivi, 
 Rodrigo" <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>



> -----Original Message-----
> From: De Marchi, Lucas <lucas.demarchi@intel.com>
> Sent: Wednesday, April 5, 2023 11:30 AM
> To: Chang, Yu bruce <yu.bruce.chang@intel.com>
> Cc: intel-xe@lists.freedesktop.org; Vivi, Rodrigo <rodrigo.vivi@intel.com=
>
> Subject: Re: [Intel-xe] [PATCH] drm/xe: follow up on the patch to fix pvc
> unload issue
>=20
> On Wed, Apr 05, 2023 at 11:14:51AM -0700, Chang, Yu bruce wrote:
> >
> >
> >> -----Original Message-----
> >> From: De Marchi, Lucas <lucas.demarchi@intel.com>
> >> Sent: Wednesday, April 5, 2023 10:29 AM
> >> To: Chang, Yu bruce <yu.bruce.chang@intel.com>
> >> Cc: intel-xe@lists.freedesktop.org; Vivi, Rodrigo
> >> <rodrigo.vivi@intel.com>
> >> Subject: Re: [Intel-xe] [PATCH] drm/xe: follow up on the patch to fix
> >> pvc unload issue
> >>
> >> On Wed, Apr 05, 2023 at 05:08:15PM +0000, Chang, Bruce wrote:
> >> >created xe_ttm_sys_mgr.h as suggested by Lucas also fixed a compile
> >> >warning found by Lucas
> >>
> >> Let's rather make this a fixup so we don't keep breaking and fixing th=
e
> build.
> >> We are still rebasing the tree, so let's keep this as part of the orig=
inal
> commit.
> >> Please commit with --fixup=3D01362fbe5e53
> >>
> >Thanks Rodrigo for helping fix this!
> >
> >> >
> >> >Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> >> >Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> >> >Signed-off-by: Bruce Chang <yu.bruce.chang@intel.com>
> >> >---
> >> > drivers/gpu/drm/xe/xe_device.c      |  1 +
> >> > drivers/gpu/drm/xe/xe_device.h      |  1 -
> >> > drivers/gpu/drm/xe/xe_ttm_sys_mgr.c |  1 +
> >> >drivers/gpu/drm/xe/xe_ttm_sys_mgr.h | 13 +++++++++++++
> >> > 4 files changed, 15 insertions(+), 1 deletion(-)  create mode
> >> >100644 drivers/gpu/drm/xe/xe_ttm_sys_mgr.h
> >> >
> >> >diff --git a/drivers/gpu/drm/xe/xe_device.c
> >> >b/drivers/gpu/drm/xe/xe_device.c index 4fb9aff27686..85caf81ae686
> >> >100644
> >> >--- a/drivers/gpu/drm/xe/xe_device.c
> >> >+++ b/drivers/gpu/drm/xe/xe_device.c
> >> >@@ -27,6 +27,7 @@
> >> > #include "xe_pcode.h"
> >> > #include "xe_pm.h"
> >> > #include "xe_query.h"
> >> >+#include "xe_ttm_sys_mgr.h"
> >> > #include "xe_ttm_stolen_mgr.h"
> >>
> >> needs to be sorted alphabetically. See
> >> f4b0bb728995 ("drm/xe: Sort includes")
> >>
> >What if those headers have dependency? Such as ggtt will depend on
> >either vram_mgr or sys_mgr.
>=20
> headers are always self-contained. If they depend on something they shoul=
d
> either include or fwd declare. We prefer fwd declarations so we keep head=
er
> dependencies to a minimum.
>=20
Make sense!

> >
> >> > #include "xe_vm.h"
> >> > #include "xe_vm_madvise.h"
> >> >diff --git a/drivers/gpu/drm/xe/xe_device.h
> >> >b/drivers/gpu/drm/xe/xe_device.h index d9d1b09a8e38..d277f8985f7b
> >> >100644
> >> >--- a/drivers/gpu/drm/xe/xe_device.h
> >> >+++ b/drivers/gpu/drm/xe/xe_device.h
> >> >@@ -116,5 +116,4 @@ static inline bool xe_device_has_flat_ccs(struct
> >> >xe_device *xe)  }
> >> >
> >> > u32 xe_device_ccs_bytes(struct xe_device *xe, u64 size); -int
> >> >xe_ttm_sys_mgr_init(struct xe_device *xe);
> >>
> >> there was a blank line here that needs to remain
> >>
> >So, there needs to be a blank line before #endif It seems the original
> >file was missing the blank line already.
>=20
> I thought it was there already before your patch. It's not a requirement,=
 but
> it's better to follow the same style everywhere
>=20
> >
> >I did a quick check, there are about 7 headers violates this.
>=20
> let's add the newline in them
>=20
Ok, I will do it

> >
> >Is there a way to enforce using a script to help insert a line before
> >push/code review?
>=20
> we are going to have hooks to plug in the CI infra. This can be one of th=
e
> checks. See https://gitlab.freedesktop.org/drm/xe/ci/-/merge_requests/10
>=20
>=20
> >
> >> > #endif
> >> >diff --git a/drivers/gpu/drm/xe/xe_ttm_sys_mgr.c
> >> >b/drivers/gpu/drm/xe/xe_ttm_sys_mgr.c
> >> >index cf5f4f73d4dc..9c2f7d4936d8 100644
> >> >--- a/drivers/gpu/drm/xe/xe_ttm_sys_mgr.c
> >> >+++ b/drivers/gpu/drm/xe/xe_ttm_sys_mgr.c
> >> >@@ -12,6 +12,7 @@
> >> >
> >> > #include "xe_bo.h"
> >> > #include "xe_gt.h"
> >> >+#include "xe_ttm_sys_mgr.h"
> >>
> >> some thing here, this is the header for this specific file. It should
> >> follow what we do everywhere else and be the first include.
> >> See f4b0bb728995 ("drm/xe: Sort includes")
> >>
> >This was from the original code as well.
>=20
> original code? xe_ttm_sys_mgr.c is being added now
>
It was a rename: was xe_ttm_gtt_mgr.c.

I will change it.
=20
> >
> >I think it would be great to put this requirement in a coding standard s=
o it
> will be easily to follow.
> >Not sure if a script is a better idea instead of relying on developers.
>=20
> eventually we are going to have that, when the CI hooks mentioned above.
> Right now we rely on people following what is around, which is always a g=
reat
> way to know how to follow the coding style.
>=20
> >
> >> >
> >> > struct xe_ttm_sys_node {
> >> > 	struct ttm_buffer_object *tbo;
> >> >diff --git a/drivers/gpu/drm/xe/xe_ttm_sys_mgr.h
> >> >b/drivers/gpu/drm/xe/xe_ttm_sys_mgr.h
> >> >new file mode 100644
> >> >index 000000000000..3d70c452a660
> >> >--- /dev/null
> >> >+++ b/drivers/gpu/drm/xe/xe_ttm_sys_mgr.h
> >> >@@ -0,0 +1,13 @@
> >> >+/* SPDX-License-Identifier: MIT */
> >> >+/*
> >> >+ *  * Copyright (c) 2022 Intel Corporation
> >>
> >> we are in 2023
> >>
> >Yes, I also realized this, I assume this needs to be cleaned up for all
> >files. Maybe better to have a separate task to clean up all files every =
year?
> Some files are still in 2021.
>=20
> not really. We don't bother updating them even if we could. But when we
> add new files, we should put the year we are in.
>=20
This was also a rename from existing xe_ttm_gtt_mgr.h to xe_ttm_sys_mgr.h

I can make the change.

Thanks,
Bruce

>=20
> thanks
> Lucas De Marchi
>=20
> >
> >> Lucas De Marchi
> >>
> >> >+ *   */
> >> >+
> >> >+#ifndef _XE_TTM_SYS_MGR_H_
> >> >+#define _XE_TTM_SYS_MGR_H_
> >> >+
> >> >+struct xe_device;
> >> >+
> >> >+int xe_ttm_sys_mgr_init(struct xe_device *xe);
> >> >+
> >> >+#endif
> >> >--
> >> >2.25.1
> >> >
