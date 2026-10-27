Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC3DF606A31D
	for <intel-xe@archiver.kernel.org>; Tue, 27 Oct 2026 11:57:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=bg0o7Ilv
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAD4910E3EB;
	Tue, 27 Oct 2026 11:57:54 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B1F310E3EB;
 Tue, 27 Oct 2026 11:57:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793102269; x=1824638269;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=DkHUA+YT9+zsZeb+Dwi3gLJNk+8xtyq/L2naGNsh8qY=;
 b=bg0o7IlvJ1XJnCYbQ4BkQXCcMP0TtuYw9IpoJ+50D/qnJ2nV9laM2hQB
 t62VfpOmKoRdmf9yOA+HuIdYmGQ3z0Q1HQsiYdgVc8MTSwT3esfE/A9Ku
 TbzbBOJRqqN2cxWT0HjIDj7HsMRj+2rIZtg2ZQsncBBwFiUjHmAWv6Y+I
 UUbXi5nfe8OvBPt3ySWEdAlRwTrxT0wTWHHikSzXeRh8oWQ1sCNX9vBXL
 d6Cq6OjqBPxes737VZgs5a3o0AnTDe7RKNjcDAyDeBmSHeTTK/oNyIz5C
 IhEJhnBuC80RW/aLTGyPJmVexHXDLxXuetiq3/DDqRUnf29OPFGUQbAWh A==;
X-CSE-ConnectionGUID: ZROT4zqKQmiw8LXNQkBP5g==
X-CSE-MsgGUID: sGexJIi1Tm2LTq7uIlkAtw==
X-IronPort-AV: E=McAfee;i="6800,10657,11947"; a="1689537"
X-IronPort-AV: E=Sophos;i="6.27,181,1787036400"; 
   d="scan'208";a="1689537"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2026 04:57:48 -0700
X-CSE-ConnectionGUID: jLpQpl+zQV2HPkpDt12qbg==
X-CSE-MsgGUID: xtRpX7/uTn+0c8ycv881tQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,181,1787036400"; 
   d="scan'208";a="4484550"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2026 04:57:48 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 27 Oct 2026 04:57:47 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Tue, 27 Oct 2026 04:57:47 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.33) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 27 Oct 2026 04:57:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fHX3NRIy6BYOsp65rVmRb2ZJeU2ueXq7waGSxYzJgrqUcRy6DSd9BsxAkdsMLd9nzLRe8G/BEq1OMko16o++F9iV/JZMgC/TalKl1+r7jQgWeINeQgxu27GSBeLFA/nETVyckxyvea2WgPg0RZNQIACZZbw/3fJEiQGzvtCmjJi3Bw59ttN+vLKEl5HSDIzvWvXui2X3IGT6ll4FhRyxA7eQHj0Je2gBDlMOwEtVHhMfkzANxqNPiEfKIhStzPozVwLgomXiKK70190glu59qOFaraBRrc+FrL460viedyNCJfLAU6XAbM160NBdNfiWu+nMNDqz4ijhc6azM7UM/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qXj6meEcFCahUFzk0+BrJvn4zgKqn/xei+9wKAUjoRY=;
 b=JPS3GV78d3Mm86ZXwstuGtACfjLgK4wNgXBcMwR/nLdwF+GQwmP9h5fnPFtThmTcxTzI5Ad9g8SFYJ+GKjvc+soBZKq7zCDgHMZHvZ7Y43/ySP1iwYHGSE+5kiCB+suUPiIyk6Gdx0TqUvF8suVF3M5KUJw6uE2t+GxuEKMcG/HCykGYY82xiurKKoT8vWNZMPEVgcTNX6srA3HrQieg3qRpvx0f9L8lA88p74PFzSzhBr9sp+3ENE75RbVdKRwICTldo9Gy1ZEmhUYrI0t1YtLc8CWWq1QNgpWmba2dxA3c0/HdnR9r8Md6fIV1dr/tesaN7AMyRIl3+I8gX1EJqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB8252.namprd11.prod.outlook.com (2603:10b6:510:1aa::14)
 by CH3PR11MB8773.namprd11.prod.outlook.com (2603:10b6:610:1cb::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Tue, 27 Oct
 2026 11:57:45 +0000
Received: from PH7PR11MB8252.namprd11.prod.outlook.com
 ([fe80::9f66:9d6f:3199:78b2]) by PH7PR11MB8252.namprd11.prod.outlook.com
 ([fe80::9f66:9d6f:3199:78b2%4]) with mapi id 15.21.0546.021; Tue, 27 Oct 2026
 11:57:45 +0000
From: "Srinivas, Vidya" <vidya.srinivas@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Shankar, Uma" <uma.shankar@intel.com>, "Lin, Charlton"
 <charlton.lin@intel.com>
Subject: RE: [PATCH v3] drm/i915/display: Limit scaler count and disable pipe
 joiner on WCL
Thread-Topic: [PATCH v3] drm/i915/display: Limit scaler count and disable pipe
 joiner on WCL
Thread-Index: AQHdZc27QOlFB066qUWE6mf/z6r7E7cRPO8AgAAL7hA=
Date: Tue, 27 Oct 2026 11:57:45 +0000
Message-ID: <PH7PR11MB825295A7CB6EF43E9DC4F27C89602@PH7PR11MB8252.namprd11.prod.outlook.com>
References: <20261007072334.1801956-1-vidya.srinivas@intel.com>
 <20261027043335.1906466-1-vidya.srinivas@intel.com>
 <4ce16eb36f580b8e1f7b71d9555bf6c0cbd8a3bd@intel.com>
In-Reply-To: <4ce16eb36f580b8e1f7b71d9555bf6c0cbd8a3bd@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB8252:EE_|CH3PR11MB8773:EE_
x-ms-office365-filtering-correlation-id: 6701b61e-597f-449d-1254-08df34218382
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|23010399003|376014|1800799024|366016|261026140227099003|38070700021|260925021311599003|260925021911599003|260925022911599003|4143699003|11063799006|56012099006|261022105027099003|261021121427099003|261022075727099003|261009223027099003|261021123027099003|10067099003|22082099003|18002099003|261026121527099003|6133799003;
x-microsoft-antispam-message-info: Nbkz26MKIrMIHV4grMIN0/m/o549zki6S+k32WKJt2MDR9KQ7GYDoPd+l/RgCNIkqP007VUFCsxwlK9jV/0Ynz61dGTeMPThLLYI9OXQAon7Tgt81m0gDJkygm9zgf9ainyIlBxds+EN8fzsyL6Dp8wyDkYmvQwRaFYvOdkBf0lOXGixHL58bNb/bZMHrLQU0OuCMjcQN+TlK/xiDIyNAOEtTxDha/1S4u1hGXUSPf/Huw+QrNez1em9Q8moaNATn/N1n84NErM5Mk3kB3ZF5huBvatys+qSP6x8mAYHZldax/U6Zpg42whpWYdeJleDmv9jG1Yj/6OuYCxXDXve+M646E0exRmnEGzv1Xl8yJLB6bbXzI8J9HqI4vHlBGLhW/dQpoUFh+v2gjBq2r0bclwKwNxpg/ksJXj6EY/LI9SEs7VRPqjlQ97yCV5x7SQjJpFEC5RQnEi7woo7GDKcATodVBbElNupQN5B/5DZDDASNs6y2YEskxnDcwlEegJ/1rJzyH10B96VZHtEkzhpuYivvRNcX7/RkZ7jh+t5EX2OidjzhxpoM0+ILkRQbBwyIGO+oJuYElyIre3Xp6bV+pw33vGrcoxMsUGXF0UA8ZxItoWRCym4Uhrkuekyp6fEn6ZdzZ/k31qwkLPjZYrf5OFTTbJv6yA/gUNFPkNxUprUsMVcZ9vz4mHi7hSidIs6ZGYXMlMzvhlrazIYTNBS2yJen/8YkZWdDGvcCoqWnzw=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB8252.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(261026140227099003)(38070700021)(260925021311599003)(260925021911599003)(260925022911599003)(4143699003)(11063799006)(56012099006)(261022105027099003)(261021121427099003)(261022075727099003)(261009223027099003)(261021123027099003)(10067099003)(22082099003)(18002099003)(261026121527099003)(6133799003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?fuVFo85y4aCTxpiVgj5veQFgOjXZopoOsgffgn59Zbb77Ln/kS3vQqcoHzGS?=
 =?us-ascii?Q?cqf/VpXNCFNODcVZMOExjvdRvZR70/VEJLsvTcTe7LlPQpYPiWu2dfH6+DVu?=
 =?us-ascii?Q?Y75aP5WF/ibeUtOn1RL2XFNC8YDWmsOQ92lyKYczgVmbeBmNA/hsrkTWX1RG?=
 =?us-ascii?Q?jjKf9Z74Pi+Or0b1bETQmB+ih9nWo4GZkcB6wTMZvisNVHYpRVAtvp2kyZDG?=
 =?us-ascii?Q?OCOOQH5bmmIEDnQ1EAIVH4eL10EGoz1oXalHsOHzOhPeGm5MUX0fFSlXy0dS?=
 =?us-ascii?Q?c3dehIs+IshoULmnA/rWba9mOHg9pbCbunhefmL6eV4b+9QgKya8KxEYbaW4?=
 =?us-ascii?Q?FhEiTq9QCtXnWQUUHY9qcNRBJC/fPMMutpz/wk4yCjb9GZz1gin8DNY/zvnB?=
 =?us-ascii?Q?EeiP4WRzzuuhe6x/VFMzod/NwjijXaL2dUgQgC9ZJNXsSDKmEnTQmLjEuIbg?=
 =?us-ascii?Q?Hc1dZegHjF2lrMZGtsXZY8FkhezM8wZnfAEt4tK+JEGNb6H04GdDwQodALli?=
 =?us-ascii?Q?oH5e01ruAOmdZDz2/H1FW8vegvRQS98ZG+wWvFV9ivhUCF9mk6qh+SiwLONA?=
 =?us-ascii?Q?CLFNZFnjgUmx8PwZL5efPT0rp1v0Sen4recI9HFQSb/CWgyUT3Bg6S/PsO48?=
 =?us-ascii?Q?a8muBV2jHYyMYYf4jHXWvR5O/iMnkmZQ8yQHIkYrCbpVHL2fjL2abx8RLU1Y?=
 =?us-ascii?Q?94mOLUqc2wF1N971ZGeBmEdJbQfrsLajElHtrDCnEHfkZ3Dh3s1zCCPt6q5e?=
 =?us-ascii?Q?JFh7jaqwWHDlSKoWvs4kSU19Jzi1XPi9ODnxMQ4/LJG2Dntt5B/v6ZcCDIlh?=
 =?us-ascii?Q?kWYPxBuShT5GSmGUY0YEnNgw+zdfSk3LGo/7V+Fm+7No9zyglOeJ+SjK6dYX?=
 =?us-ascii?Q?YrGvxrUMukcVIOj7o6o3m6aY1ldIRbAlEkEDPYq/GNE9hrIcjkHgXI7fFyWW?=
 =?us-ascii?Q?hFkm5OJfzjEaXlyDVDwEYWhPbW9+VQ80KZrKy1kC6509n6s8ZoJBI+4bc2m0?=
 =?us-ascii?Q?7b1hd31UrxLtZm95Nv+MS2igRk7864CofrcOKoCt+c2WZm983OgwdBWI5xnB?=
 =?us-ascii?Q?gopSVw+vxUz952WpYwaYsgQXKt3PeiFUWykaOHEqEivEvMkg7GC0kHYowxfr?=
 =?us-ascii?Q?aS11HPmo6BBNC8GQjGOcHPN6tB1LabkFaZkeF1RsHQneiuMikCNHmQT8wspl?=
 =?us-ascii?Q?5/VjRH4FwMFkjNAZsBoNeyi+bYBr3ItoxcjyMwvQytClXD0w4j2qSwCIxDXT?=
 =?us-ascii?Q?/KpN4LsY9WrQ62U/CMCvyFm11vDk2U3tZP5CKvZRknE3VmqqahRe+J7aAOjN?=
 =?us-ascii?Q?f5eV2FyNzD5yojSdiZW/tTpfkIPc8v8sow0x6NgC+aCfcBgvVdS9hFoXEf/0?=
 =?us-ascii?Q?NdQvyzEW13fs3W73mB9h1omHiNhumf+H+QeAhWrhn2wvTWynojT8yWwH50qe?=
 =?us-ascii?Q?o0StwCCTykX3VHaXW1lqmdaL85WgczyNUOSrO/96MZa2uvbYYjFdMzz0cZeZ?=
 =?us-ascii?Q?COjlLYjsSmPmSCvg1y21UtIqS8Es7XnkQ7i33zlqfe+yhJ5MMxtFpCpz6oJh?=
 =?us-ascii?Q?yDP79AJ8+MVogz9EPUCqlv78q9gelyl1Tv+C7E0kdtFXMNG7y9qA+iuNplyK?=
 =?us-ascii?Q?CHI3b2pb0Ao0qCcdGhD0UzTqaf4Zp94/f7NkReh3E0b5Abip2QMOpE8petHf?=
 =?us-ascii?Q?l1luvEaKdnFfACJOWtZBKu1ac+n5fhSnArhdjmzJ1yN0N3TspVzcfEXrDgCy?=
 =?us-ascii?Q?sGk6nWB8zw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: Q4MJ6A7RWPNM4N4Q2Y2ysK9J1uIMHuCRmnm8ZdL/+EhmmbtVaJnNf1RSB+sOQ4Fzc8vaDWQwYFYjEZR0l3xOYybDi+ObRsox4vC7GtejHeMzj6NA9a++8Zi3UH47EFAUFr2/7QGBoUXGcIEdPr0n0nEGKJR/hpIqZgp3XEAuCtLCZwAN3ylrLkVj1z3GdmR16IK2XCXBMplUfCXUA0iiIYu9bqZMMtL5YTvIAkeP0Wk4xEqIv3QfiB5FcLEUPJJHRxE/1wxrnVQH7mTvFzCMt6bdljYazp13B6INxzyS3or2GV+sZSh6B5FVf5iQqzi+lcXhX7XZgHCHdFRCOmtJKA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB8252.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6701b61e-597f-449d-1254-08df34218382
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Oct 2026 11:57:45.4356 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0zddDpeTz3D1HaT6njQWSgpdY03u/hGQmnRYCO0DXMFkkLI0y9aQ/1XcKXaEzkPljC7VW12EmmMXBb9vS/lzneTenI2tcmybFzOcqGnDA2A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8773
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



> -----Original Message-----
> From: Jani Nikula <jani.nikula@linux.intel.com>
> Sent: 27 October 2026 16:44
> To: Srinivas, Vidya <vidya.srinivas@intel.com>; intel-gfx@lists.freedeskt=
op.org
> Cc: intel-xe@lists.freedesktop.org; Shankar, Uma <uma.shankar@intel.com>;
> Srinivas, Vidya <vidya.srinivas@intel.com>; Lin, Charlton
> <charlton.lin@intel.com>
> Subject: Re: [PATCH v3] drm/i915/display: Limit scaler count and disable =
pipe
> joiner on WCL
>=20
> On Tue, 27 Oct 2026, Vidya Srinivas <vidya.srinivas@intel.com> wrote:
> > Pipe joining is not supported in the WCL display configuration.
> > Modes that would require joining are rejected, matching the 4k 60Hz
> > maximum resolution documented for the platform.
> >
> > Also, WCL support single pipe scaler instead of two.
>=20
> One change per patch, please. The changes are functionally unrelated.
>=20
> > Bspec: 74286
>=20
> Git commit trailers go together with no blank lines in between...
>=20
> > v2: Rebase onto latest upstream
>=20
> ...and certainly not the changelog in between. And v3 changes are missing=
.

Hello Jani

Thank you so much. Will address this and float again.

Regards
Vidya

>=20
> > Suggested-by: Charlton Lin <charlton.lin@intel.com>
> > Reviewed-by: Uma Shankar <uma.shankar@intel.com>
> > Signed-off-by: Vidya Srinivas <vidya.srinivas@intel.com>
> > ---
> >  drivers/gpu/drm/i915/display/intel_display_device.c | 5 ++++-
> >  drivers/gpu/drm/i915/display/intel_dp.c             | 4 ++--
> >  2 files changed, 6 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/i915/display/intel_display_device.c
> > b/drivers/gpu/drm/i915/display/intel_display_device.c
> > index f17fc2c68472..c74256359c25 100644
> > --- a/drivers/gpu/drm/i915/display/intel_display_device.c
> > +++ b/drivers/gpu/drm/i915/display/intel_display_device.c
> > @@ -1813,7 +1813,10 @@ static void
> __intel_display_device_info_runtime_init(struct intel_display *displ
> >  	if (intel_display_wa(display, INTEL_DISPLAY_WA_14011765242))
> >  		for_each_pipe(display, pipe)
> >  			display_runtime->num_scalers[pipe] =3D 0;
> > -	else if (DISPLAY_VER(display) >=3D 11) {
> > +	else if (DISPLAY_VERx100(display) =3D=3D 3002) {
> > +		for_each_pipe(display, pipe)
> > +			display_runtime->num_scalers[pipe] =3D 1;
> > +	} else if (DISPLAY_VER(display) >=3D 11) {
> >  		for_each_pipe(display, pipe)
> >  			display_runtime->num_scalers[pipe] =3D 2;
> >  	} else if (DISPLAY_VER(display) >=3D 9) { diff --git
> > a/drivers/gpu/drm/i915/display/intel_dp.c
> > b/drivers/gpu/drm/i915/display/intel_dp.c
> > index 00e02e019d25..ef164a797618 100644
> > --- a/drivers/gpu/drm/i915/display/intel_dp.c
> > +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> > @@ -485,9 +485,9 @@ bool intel_dp_has_joiner(struct intel_dp *intel_dp)
> >  			return false;
> >  	}
> >
> > -	return DISPLAY_VER(display) >=3D 12 ||
> > +	return ((DISPLAY_VER(display) >=3D 12 && DISPLAY_VERx100(display) !=
=3D
> > +3002) ||
> >  		(DISPLAY_VER(display) =3D=3D 11 &&
> > -		 encoder->port !=3D PORT_A);
> > +		 encoder->port !=3D PORT_A));
> >  }
> >
> >  static int dg2_max_source_rate(struct intel_dp *intel_dp)
>=20
> --
> Jani Nikula, Intel
