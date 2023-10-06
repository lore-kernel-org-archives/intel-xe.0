Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACEF2E81E1B
	for <intel-xe@archiver.kernel.org>; Fri,  6 Oct 2023 17:33:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72C4C10E533;
	Fri,  6 Oct 2023 17:33:08 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF0B810E54E
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Oct 2023 17:33:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696613587; x=1728149587;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=muZ7Dg1dOJ31FoP0J7N9z7fyOKsOzMOLqXfvJ7AyAmE=;
 b=WflcOMvvnQZoWydhlMOUIioVd6sr/hJ8+uVCCCDYyOzclriuL89NrmGc
 j+HZl3QSu/YJLL5PWxwN0jlfRm+6qpbKbJA3qF0GQSyMqhtfqoNTUupZ0
 DiFPy9pvajxPAEky2MW3pdf0Pt0mvAO2Y6Ql8O4xjc8Qnkydn6wlhgAO7
 22/pL0Z1PQ3IDyXmCawPS/y1KeU79E7bjHJhvGBhWrlCQHXmvuCmuMBII
 9717DyYPpI3Ng8F38jJE8vL/iWOSU17v4CrOKYEBR82dEYUfvjc57DuI3
 UXjsSIlLeVDKoEAjBTv66E4y//Y3Po38bDPAptYwm4EOCEywU36N4xeSC A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10855"; a="5350462"
X-IronPort-AV: E=Sophos;i="6.03,204,1694761200"; 
   d="scan'208";a="5350462"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2023 10:33:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10855"; a="842902834"
X-IronPort-AV: E=Sophos;i="6.03,204,1694761200"; d="scan'208";a="842902834"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by FMSMGA003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Oct 2023 10:33:06 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Fri, 6 Oct 2023 10:33:05 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Fri, 6 Oct 2023 10:33:05 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.176)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Fri, 6 Oct 2023 10:33:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Nj0yalgOQwu+Gv0HylWxy2hw+/c8pi+gHg0EJ7B9fr0lKayfKzlASyCPpeKO0TbCkpCnRrbAARn7h2dl45VdOVERcy5/cPLTrMGAl55P21/1UcyIWy68Fe6r6kTF3IDWuc5L0R74KJLsn/GRmWx08pMDKZd1pHZ0HvogxMFgF7dBTUoSSPtBqIGLBiDJDd3MNehSsNAWgtL2x5doqnP3TaW0QURyfExSHFL8M6Hl2935WmdvxlrQn2OwNKutWyUoyJSi0us9wX6BTKI9Wf+VFIsWGZbY+kwcUhft3yt37essUy25pejFqMhyAx/y4H3q9MN4i0i3BOymJZf3qpIYmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0cw437mK4y6VGn3QwHYjYw7fvP4EycF4khrCePqtH78=;
 b=QzQPoIlz+d4jRyErdk6MXqVkhOWUvetbJEm9V/ywjamAGr+kRO9UBFXxsGS8XFGimSDy03Wz4Gfhk5rdN9gtLnWJ+ruJb41rlHWDvlb650jWLyKRkH4xJu/t3mnBIuqy3friNWFiqQ8VPHt4T4ZLEDv0m9dxjzc3FfJQ1VFwFVWPXWcnLrnq8DmPU/eVbs+p92xYvwybngBeQ4maE9Im9tb6BSWqBKe+Jj7dG7ia9+OvTkO0I0ZHArhVPaD+XNujkgKEpYuFHnhHo5ZgJYslEOR/X0yLHSEumFdz73+qEzJ2gWgHN1yCi+4rCjGhlad+mMRkM++B2t23Q7zDV8yLQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6418.namprd11.prod.outlook.com (2603:10b6:208:3aa::18)
 by DS7PR11MB7951.namprd11.prod.outlook.com (2603:10b6:8:eb::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.38; Fri, 6 Oct
 2023 17:33:03 +0000
Received: from IA1PR11MB6418.namprd11.prod.outlook.com
 ([fe80::bff0:69bb:b4e7:dacb]) by IA1PR11MB6418.namprd11.prod.outlook.com
 ([fe80::bff0:69bb:b4e7:dacb%4]) with mapi id 15.20.6838.033; Fri, 6 Oct 2023
 17:33:03 +0000
From: "Ruhl, Michael J" <michael.j.ruhl@intel.com>
To: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Thread-Topic: [Intel-xe] [PATCH v4 1/3] drm/xe/display: Add writing of
 remapped dpt
Thread-Index: AQHZ+Ft6iEubFxyPrUGXzE3JYeLcXLA9BQTQ
Date: Fri, 6 Oct 2023 17:33:03 +0000
Message-ID: <IA1PR11MB64184052BD10FC05F3DBFCBFC1C9A@IA1PR11MB6418.namprd11.prod.outlook.com>
References: <20231006134540.332716-1-juhapekka.heikkila@gmail.com>
 <20231006134540.332716-2-juhapekka.heikkila@gmail.com>
In-Reply-To: <20231006134540.332716-2-juhapekka.heikkila@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6418:EE_|DS7PR11MB7951:EE_
x-ms-office365-filtering-correlation-id: b86ff866-91a3-44a0-3c09-08dbc6924b56
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Z3lwVdi3mRUEoJPgMtirZIYC/uxguo8ArZGNovALKk2d8v9jd8KuaA2OVTRKbW4s2yysY/gQhzIq+EgduUBLGlBx6u0Ztb1c+qMxG1RZyL9K1ymPlwcnP75YL9MBltbZUQa6ZUhIxmYZhqEHvrrwCvQ/yAL135WfXvpUxrPnHbhYmsuVPYT/0Z0khtW297LBFHTlVUql6V8UyaOCmDcIa8kDFciNXO5lU9bGZtnYX0rbFvNdCTu91V7cjMeXWEfmFsqPnRBPgOYxBJIWqyNlP+ov7ppPNhHh5aZ3uVYQVsqiEdwffBj4Jyh4TktReoxz6ziSydqnElhj9GWLpwYq/pJEQQ4RzXPsYuM2+aMPmYcKvJNVooOy7f2BKwPBfZMKI1sHSvTAsQo27s5AQUpS5zUtaiBCmYewSMT25s4zLBWFWIcvV7WyXhl/0Z/TRKsKBKNKYYWx4FhU9hjmgY/5j2U7RAdEUwkJU/NAiNLrTraWBbgLqXVlLcMAAkyfmQFx0PlhOQQoiq+WwXkoeV0MKJbV5y02wHqwaxmSI1aF2fLxoUKPkKQL8OFlUfOz//pHgqG+2GQzTTo3F5i7lXyQupYCPVIzBkr6i5As5cUf1KoAR1npGHLk8jRV1lHDnz5+
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB6418.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(376002)(136003)(39860400002)(346002)(366004)(230922051799003)(64100799003)(186009)(1800799009)(451199024)(316002)(64756008)(66476007)(66556008)(66946007)(66446008)(41300700001)(33656002)(9686003)(26005)(6506007)(71200400001)(7696005)(82960400001)(478600001)(83380400001)(38100700002)(86362001)(122000001)(38070700005)(110136005)(55016003)(76116006)(2906002)(8676002)(5660300002)(8936002)(52536014);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?XxSUaDzyMRWQMkYByyhwZIcc7WN3H0c62EgGm4+hPORu1oyPaK8JPtEC3IKX?=
 =?us-ascii?Q?Cnep1EVO0w0w+ctO5knvEmqRUEQfAv008vpwPg/KjDlOYchDfKalSeTdGzu0?=
 =?us-ascii?Q?7tgdgz0TrGE4pLu0P8O8F/5PBjWQOmKXnHgNiHEemu/HI+SgY4eJr44lm2Dy?=
 =?us-ascii?Q?u68Ggk74tO9Cz8/GvoevfMKcszL6YkpwBxCilKrFWk/la8bQb3wCN38uq8Qp?=
 =?us-ascii?Q?Ps6lEZ+LtuyRIf8eJM23TetPgQan972/XL3vOAdeVXxrgnBuPiQVL8S8N/tp?=
 =?us-ascii?Q?cAolEur2Ka/G52U1NlSrEm1hzj8FbJYLOdzUszljNVdv+9EsF1DnEkyLsTjB?=
 =?us-ascii?Q?GTejlhm3wVmBvB2F17NOJquLE54xeKv7F9sWWEwHveV15kF+kLsJuvSgxZ31?=
 =?us-ascii?Q?+3fA49zz6y9kVTjNsvyNfMyk6rRFLs7bG9lEN9dDit5XbDFL1hlLLZqPP5rE?=
 =?us-ascii?Q?iHS/F+CvrpMtblZE2thBbMxsWGJ3oUoS9l7WFnnhQP8Yq2DJW7etbBkse6tm?=
 =?us-ascii?Q?Z10AFtTzVYVCojggigMR2Wb3UJVzF9+5GT7ORz2niQnrLSSW523ZJJxJHvXy?=
 =?us-ascii?Q?IFRKKdJRfvU6rx7QGIRVh6cLOoTSfCTzhC650B5zzrfOoEAwR8xwMYPHnYv+?=
 =?us-ascii?Q?QerlVZKIFHljcUIJYavPl2K56RgCe6h0VP5wfNCdyKDiwrTiK8KgTIO5wgUZ?=
 =?us-ascii?Q?+uiEt302FDJS0orpNZlPX+yN3jbZLStzVJs97JVy7njFb1yAIKrX1m2hvpSE?=
 =?us-ascii?Q?siqu9/Lb/SHfi4M5DHZUcCyFIbGtp/MHxT7UTMdf8zJ+VP9BlUu6vf0Rwhdf?=
 =?us-ascii?Q?2+dxeH59yGYaBQcnmLeDGAPZA7IM/O0mUCchZG9jtDNK1yRLvEQ3SCHlKIWj?=
 =?us-ascii?Q?hxqje9mDkQGPC97TrG0SewBOcpYCq9cowp5fSnXgBHMO6IRf2l3ztPJQgWe3?=
 =?us-ascii?Q?OLPfdQNBO1WTEKKQy5W23dNi+2gqBbHwu98TOjULVL3q9Crrj9cz0aDKzUDP?=
 =?us-ascii?Q?jl3B9gDy7xVsyvK1ZbAxcdZdb9upb09vxvQKrgKtUL9JopAT0zuNorGr97PR?=
 =?us-ascii?Q?vN1ExTNj23mwoqIqi6gD+2jmJWxBBHTMiWtwIXHpn68OwgRWp47W2EOhzXQL?=
 =?us-ascii?Q?mFnN4JFrNRDQhX81GeRiMSsxfJSejaGKDvszKJFP7C9SRFDrzprmgbelspct?=
 =?us-ascii?Q?7I3F4g3plfaSuFQYMxl3ET5f3wVCmpJ05r1tbr+ylH+LhrKZyyxTUVH57SN/?=
 =?us-ascii?Q?9m2yHbI6uvmLmdwaRvVD6AYdfeD4BLqNqhaMA8zRiVVJeb/HLK9uoTjrmvFs?=
 =?us-ascii?Q?4zpIR3NVg4smnQAAx5v++AS41mN48oSsZmmXee7ScJ659j4RuLPHItJVGf7l?=
 =?us-ascii?Q?eIqyKDqBJn4bC/BtX5fQ3q5dZV5bRu9+1lxEqtvZMmpjp7o7FUbwC8bJuAdP?=
 =?us-ascii?Q?4V6T+4WJh6FQ72oSomQXMrID7P4LoSButN0ELC/veM7tF/GKol6WY9uchGwF?=
 =?us-ascii?Q?uoSKmsX4HIN2ogEJmkyiIBiJ+3LJ+e/FjUnwEei1w0Vc/pWJvvd7u4LUrRur?=
 =?us-ascii?Q?qgqxHCzbeceEyF808pUtqOLfOyc8CtOpnTWdX2Jd?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6418.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b86ff866-91a3-44a0-3c09-08dbc6924b56
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Oct 2023 17:33:03.4214 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: I7nlgnY46/G+UPjeoZmoZonVKuvuCknuz6Rpk7WimHlRQORWKo4l2wSOGj9GfBNzcXCDnmrWJ4Wm7wrGBm/BwzSFkaU1SYxN1zS5k41G40A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7951
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v4 1/3] drm/xe/display: Add writing of
 remapped dpt
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

>-----Original Message-----
>From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Juha-
>Pekka Heikkila
>Sent: Friday, October 6, 2023 9:46 AM
>To: intel-xe@lists.freedesktop.org
>Subject: [Intel-xe] [PATCH v4 1/3] drm/xe/display: Add writing of remapped
>dpt
>
>Xe need to use remapped display page table for tiled framebuffers
>on anywhere else than DG2. Here add function to write such dpt
>
>Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
>---
> drivers/gpu/drm/xe/display/xe_fb_pin.c | 31
>++++++++++++++++++++++++++
> 1 file changed, 31 insertions(+)
>
>diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c
>b/drivers/gpu/drm/xe/display/xe_fb_pin.c
>index b7a04fba3585..8a1cb6c28eb0 100644
>--- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
>+++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
>@@ -45,6 +45,37 @@ write_dpt_rotated(struct xe_bo *bo, struct iosys_map
>*map, u32 *dpt_ofs, u32 bo_
> 	*dpt_ofs =3D ALIGN(*dpt_ofs, 4096);
> }
>
>+static void
>+write_dpt_remapped(struct xe_bo *bo, struct iosys_map *map, u32
>*dpt_ofs,
>+		   u32 bo_ofs, u32 width, u32 height, u32 src_stride,
>+		   u32 dst_stride)
>+{
>+	struct xe_device *xe =3D xe_bo_device(bo);
>+	struct xe_ggtt *ggtt =3D xe_device_get_root_tile(xe)->mem.ggtt;
>+	u64 (*pte_encode_bo)(struct xe_bo *bo, u64 bo_offset,
>+			     enum xe_cache_level cache) =3D ggtt->pt_ops-
>>pte_encode_bo;
>+	u32 column, row;
>+
>+	for (row =3D 0; row < height; row++) {
>+		u32 src_idx =3D src_stride * row + bo_ofs;
>+
>+		for (column =3D 0; column < width; column++) {
>+			iosys_map_wr(map, *dpt_ofs, u64,
>+				     pte_encode_bo(bo, src_idx * XE_PAGE_SIZE,
>+				     XE_CACHE_WB));
>+
>+			*dpt_ofs +=3D 8;
>+			src_idx++;
>+		}
>+
>+		/* The DE ignores the PTEs for the padding tiles */
>+		*dpt_ofs +=3D (dst_stride - width) * 8;
>+	}
>+
>+	/* Align to next page */
>+	*dpt_ofs =3D ALIGN(*dpt_ofs, 4096);

I know that this is mirroring the rotate code above, so the 4096 is "the sa=
me".

But  there is XE_PAGE_SIZE used in th iosys_map, and the alignment is set i=
n patch 2
with XE_PAGE_SIZE.

Is the 4095 "ok", or should this be XE_PAGE_SIZE?

If it is ok:

Reviewed-by: Michael J. Ruhl <michael.j.ruhl@intel.com>

Otherwise, the r/b will be good after that update.

Thanks!

M

>+}
>+
> static int __xe_pin_fb_vma_dpt(struct intel_framebuffer *fb,
> 			       const struct i915_gtt_view *view,
> 			       struct i915_vma *vma)
>--
>2.25.1

