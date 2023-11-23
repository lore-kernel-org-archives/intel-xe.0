Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0678AC5AD4C
	for <intel-xe@archiver.kernel.org>; Thu, 23 Nov 2023 03:46:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B012110E0B1;
	Thu, 23 Nov 2023 03:46:39 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8553F10E0B1
 for <intel-xe@lists.freedesktop.org>; Thu, 23 Nov 2023 03:46:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700711197; x=1732247197;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=iTLZpHxBgCxSut9X2NrnhRrySod4GYKPIIJCEbwL0xE=;
 b=adS00CLtk21m4BazJp6Li+r/JTSEYEt0l9myP5VihYjhxwmi8r0IQJWn
 iv2bPQbn0V7xW/1TWIdJT7MnDkHpkfhXLg+zUVcG7VRXk/1XwRXlV5TpV
 HqsZ2oxOehG2qYojIfW7D9TjM3s/plZ60VVmDalkovkpKVgLsaSxXgEff
 xVFdOqjSqI3+ZEYj2d3uyMZNQ8msQUqPi7U8NmS4HkaGN8wUQwaDkhoyI
 PdaFPEYVf6Wo64SC8DNVJMRCpX7VQMlbowiPVPQcqzRaqKaTJqZPAbzSX
 UaGe+3qyCuLA/1NJrkCLN+dUtSfpDGrg8/TnYOH9OYQm73HslyzlPb4to A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="391069970"
X-IronPort-AV: E=Sophos;i="6.04,220,1695711600"; d="scan'208";a="391069970"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2023 19:46:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="857992223"
X-IronPort-AV: E=Sophos;i="6.04,220,1695711600"; d="scan'208";a="857992223"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by FMSMGA003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Nov 2023 19:46:36 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 22 Nov 2023 19:46:36 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Wed, 22 Nov 2023 19:46:36 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Wed, 22 Nov 2023 19:46:36 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nejxMi6WWr0pN+w0O0eRp01U5YLT3aFy1r793rnRRnpPQLlmO5N5JfiwtNof+6hd84wYU/Hs8UhTTuGSM/dUzNo6zjsEXxKohqT474aOVR+mme1vM/kioJP3PXf9O5fjmZYqmRBtvfaDHPTNR/vJ6YiSOsJ7XxGWx8KofCzTQluAibpuWhAuCHiOn3pD+05cACyqwT099WObp3vMjpX/H580P3hrDEeCBy/YtBCjMs3xll9YKdxl4u3VDc9RUF8S+i+FoqTjdcXHr5RPcxfR/qYhmm3dayvZ2VDUiW1oGNWGfL/q8EmNMwzZCi0qMvrOICHV8b2Ljps4egTTLcw6Xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k3vn5X8fE3y7SfvUacw0sOj14hP26CJwT7w5F0URnHI=;
 b=CBTzzFymrJTVt2VflKSh5j16hIxkagvmTTeaW9v9Niv8ZW27xn8pE2VgR5yPIC05bKWalkxU9DOlnTz/Bl+PAvAnUePTz2zI8lZh7g1CMhG9ooSty5SZPtp81vO0K3d/ZdExlrSYeNMYKPLgtBMhcgONokyl6jvngHsGagpeq4Gtn7AGvOgaVV7uCI0yvKZUeZ5ap0Gkzgwu6TY8Cu9AWYb4TKkHWJiuCPjt3qIAUoEd9tao02TX9VkXr3c21RU/UhycrI+jqg8X4ZcRyA1eZ59fzvWMdXcB2cPUPDjgQvqiX9Gkp8rcKXuSoPg6HueTs6mlGb7uwYTuhw5uLI2zNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com (2603:10b6:a03:459::19)
 by SA0PR11MB4559.namprd11.prod.outlook.com (2603:10b6:806:9a::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.19; Thu, 23 Nov
 2023 03:46:29 +0000
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::399c:3488:d511:adef]) by SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::399c:3488:d511:adef%7]) with mapi id 15.20.7025.020; Thu, 23 Nov 2023
 03:46:29 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Roper, Matthew D" <matthew.d.roper@intel.com>
Thread-Topic: [Intel-xe] [PATCH] drm/xe/xe2: Add workaround 16020292621
Thread-Index: AQHaG52YloEA+Mi020ed87vYxVgJdrCGptSAgACflUA=
Date: Thu, 23 Nov 2023 03:46:28 +0000
Message-ID: <SJ1PR11MB620481971E337FD878DFA18981B9A@SJ1PR11MB6204.namprd11.prod.outlook.com>
References: <20231120104645.3570901-1-tejas.upadhyay@intel.com>
 <20231122180927.GE5757@mdroper-desk1.amr.corp.intel.com>
In-Reply-To: <20231122180927.GE5757@mdroper-desk1.amr.corp.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6204:EE_|SA0PR11MB4559:EE_
x-ms-office365-filtering-correlation-id: 836bad84-6f95-4013-35d3-08dbebd6c670
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: nvAMKFsXXR3+WxQuETSTGfxeYiEAL/86juCqJzvGpYo0yITNK2Zksuifs7nkvqM704dd2zVRXXoVyI26SYn9ZlITyjR//Oy1WC7s7XQVbCL4CUtkaO5fsJ6ddLFI8QgRVSwbB36bY4AJuMekUQUKkRn5Eak0xPjPrkHlwZTmXzjtH4+XOqXz7XjB2kYqg/sjTCX28CtQ2u2oeiSNZAo3sKugBCFUBfrZBHPTTeqHT2AwRbb3uxhKWEliFTbDwK1sjMZJQgtHt8cnbwliuPjbs+mcFefOUo8KkIPvkVCIUtAcxJyyLb9S31DVDuauF9jsEw+rgKxGB9hx/9gdgs79mBAN9DgrgH0qO2QWzh3KrMzEVoZnE8XbuzvTFPqKpVCOEdmgvNZy31aXj+PaasSVvNEYGPjuy4+aR+JUpHUUnZ3+WSst+Du85M1zSB8hAP4kfo9Z+PU+eO/vpdp7/fwAigJ42MTlF5eud749DxOf65dRPjyAzEZcypisHeQVMVM3+H7e11qZg18wkfuEuGv/UupHQgoN3QvVv5tgiIgahBBLZuRavIFOoBqHYNTASpjgw8h0ms6GghWPl+1/MnWwqvtAcNDQrMgGonDy2+Z2tnM=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6204.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(366004)(346002)(136003)(396003)(376002)(230922051799003)(451199024)(64100799003)(1800799012)(186009)(55016003)(71200400001)(52536014)(122000001)(8676002)(8936002)(5660300002)(6506007)(7696005)(4326008)(53546011)(6862004)(41300700001)(33656002)(2906002)(86362001)(66946007)(76116006)(66556008)(9686003)(66446008)(6636002)(38100700002)(66476007)(83380400001)(478600001)(64756008)(316002)(82960400001)(38070700009);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?wjevV9on3khlXFoNHX6ui1aJmXzBCJ++cszvM78MYcmfq43lQYf6m844xLEF?=
 =?us-ascii?Q?Gx6/GkG2CJdnCqPq2R4FWVDnFkNggK8fxkx5lkfmx13ASV6KxPwaFIVVZqre?=
 =?us-ascii?Q?H+uzJSwPg3Yzv8fd1wO8lVlxqafbmisNpnV7K35pQDLZqMI3XmwNRGUHj03V?=
 =?us-ascii?Q?w1CnzSz3Tt/v+nX+Vr6dtvvySPB1r9uhSRaLPNunx6mE0t4YPqJpkM4bK3L7?=
 =?us-ascii?Q?+lsbDZVP+njMemUeix64TvXFxGH/YZfnjATQ2/pkywVux+2+LIXCb3ODtxpu?=
 =?us-ascii?Q?nLnGM2yRBE2yFDDNPNVp/N5d5+yYgB+BkbbfrfVJdAm3cWn6kxp5/NRwhsZ7?=
 =?us-ascii?Q?odNoUq//SkEhVsKjIr4tWb0NkpzXvF9HuTPw5rx6UnrrTdSoJNcB2ooUFy5w?=
 =?us-ascii?Q?VhDYSuktBARsXHWCSE4X4dWPHAnCvNpUZ9eIQXflZFmb1Uap3o2ah64rPy4q?=
 =?us-ascii?Q?3+1GfS97Tms8UXGSz6S/uxym2VCAZWaieIH0NlQm8P+rMis6G/ECelH+hpSj?=
 =?us-ascii?Q?am8I6VrQAS+NuoYhLwnfthX1t7df0QcdVw+h/SNwIl6cqWbnuAGLtcqoW0sE?=
 =?us-ascii?Q?jyOvPSV0CGmtwebd5misZS6W3+8p/l/KYzG6JrLZ3FOZryEZ9J3zB8uu2fFP?=
 =?us-ascii?Q?E83ByEgUuoi2FlVtR+wZPetFekZwX4SWR/GYSLE7R1baw85eVucletiJGfaF?=
 =?us-ascii?Q?8uCMXmhZdoFvAhoojnMyt7S2nv/oZJVgb7K6nBwdBp1qN98bHI3DARGlQUF9?=
 =?us-ascii?Q?dJSKHnexOqrYOgGHT4dmsd8zLmJUo43s/Zo/gzrD5Zrm6TZZMBhgLT5hkZzx?=
 =?us-ascii?Q?zkMYi6wdVkKiKe/wCflmyqzQLEsw1uFHfGA6oK/vRmx7ofjB03cbE91e8jwS?=
 =?us-ascii?Q?7/4lXEHNvE/eIFh18nD3qX0M1X7b1UWQdY2hyan8ANMISWe9IMFPqk3jNbwa?=
 =?us-ascii?Q?lPCeAdiiIU13+5CW1bB+ft57MN5rpEvMGPZ36/YI5wbvRlSJzTPLMO4OWYMk?=
 =?us-ascii?Q?rjEy0FGxnk7S5OhMhXcIghQhx418kua1yvqcpc4f+SG+p7wCfAz+eHZ/b/FG?=
 =?us-ascii?Q?8oaubZZH7lNtQH43A224nby9Pqquv2TnpcZDM8ctG0v2vvfiTzqT4Y5R4qNX?=
 =?us-ascii?Q?2+oH9x4+VZBKBgHnluTC2ObIGkmVnj7mf5h0UFUJCE5xW4Ub89HysEwOCWL1?=
 =?us-ascii?Q?SKUkQ2F92co/orA87FKoN3H114He4d3o7hPfrBVuyeegFrQIZ7cFyD0u0iJY?=
 =?us-ascii?Q?tcfNrTzfrqOe/q2jIrnrYbD/l+1ifTp/+Cl/UK6VI7JJ8GraUIVs3505JuAz?=
 =?us-ascii?Q?4UX80h7zM0BpgRulp5EgAd3VXUU8I9CGdoRH0CLEa+80wS4A42sYTyK+9YQN?=
 =?us-ascii?Q?IHK8/3VBVY3LjvdqpCYA/zeWGJasF/1lVbllXvyxyDYG3hCqj/qx/mlJAS94?=
 =?us-ascii?Q?MyWGwSyeQotgDeYq9M/vszNBXPch8xTL/TJfgPh4bKER1ccW0B4sX19UJQJn?=
 =?us-ascii?Q?dTSoOrHpgR906VLYBfG+DzRkYUqr8v3jfEvh3c7PO7FLvT57ZCLlMR0X4Zns?=
 =?us-ascii?Q?S1CRfJGjWqrBD2HR61jOizAyXNOVmz+OOT0jair/0A9nKBzQUOGH5rgKW7/v?=
 =?us-ascii?Q?Vnn1L42Hbc4B+XzmwpYmCtbeibXuYD8cYvwGOt1V0IgF?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6204.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 836bad84-6f95-4013-35d3-08dbebd6c670
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Nov 2023 03:46:28.7433 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iafVd7g8URfGnXMoeDHVoJUcsdbY2UxqqkPuNCimqbNuZG2TbLMhkFsJIv/WDvhebIa6x/4WNdpyWgluLrtfIL+MGXkJDRYYb77/CyjvUk4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4559
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe/xe2: Add workaround 16020292621
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
> From: Roper, Matthew D <matthew.d.roper@intel.com>
> Sent: Wednesday, November 22, 2023 11:39 PM
> To: Upadhyay, Tejas <tejas.upadhyay@intel.com>
> Cc: intel-xe@lists.freedesktop.org
> Subject: Re: [Intel-xe] [PATCH] drm/xe/xe2: Add workaround 16020292621
>=20
> On Mon, Nov 20, 2023 at 04:16:45PM +0530, Tejas Upadhyay wrote:
> > Workaround applies to Graphics 20.00 as part of ring submission
>=20
> The Xe2_LPG graphics IP used by LNL is version 20.04, not 20.00.  And
> according to the WA database, there should be a stepping check as well si=
nce
> this only applies to A-step hardware.

There was some confusion here, as this workaround I implemented for Xe2_HPG=
, at least HSD which I am following is talking about Xe2_HPG and it says dr=
iver_permanent_wa. Also it does not say anything about LRI to NOPID, it jus=
t says "Add a pipecontrol command as the last command in the Ring. It can e=
ither be stalling or non stalling. "

However I found another HSD talking about Xe2_LPG and pipecontrol with LRI =
to NOPID post sync. So looks like different WA for different platform!

Tejas

>=20
> >
> > Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_ring_ops.c   | 22 ++++++++++++++++++++++
> >  drivers/gpu/drm/xe/xe_wa_oob.rules |  1 +
> >  2 files changed, 23 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c
> > b/drivers/gpu/drm/xe/xe_ring_ops.c
> > index 59e0aa2d6a4c..42eff69dff9e 100644
> > --- a/drivers/gpu/drm/xe/xe_ring_ops.c
> > +++ b/drivers/gpu/drm/xe/xe_ring_ops.c
> > @@ -184,6 +184,22 @@ static int emit_render_cache_flush(struct
> xe_sched_job *job, u32 *dw, int i)
> >  	return i;
> >  }
> >
> > +static int emit_stalling_pipe_control(struct xe_sched_job *job, u32
> > +*dw, int i) {
> > +	struct xe_gt *gt =3D job->q->gt;
> > +
> > +	if (XE_WA(gt, 16020292621)) {
> > +		dw[i++] =3D GFX_OP_PIPE_CONTROL(6);
> > +		dw[i++] =3D PIPE_CONTROL_CS_STALL;
>=20
> The workaround asks for a post sync LRI to NOPID which seems to be missin=
g
> from the PIPE_CONTROL generated here.
>=20
> > +		dw[i++] =3D 0;
> > +		dw[i++] =3D 0;
> > +		dw[i++] =3D 0;
> > +		dw[i++] =3D 0;
> > +	}
> > +
> > +	return i;
> > +}
> > +
> >  static int emit_pipe_imm_ggtt(u32 addr, u32 value, bool stall_only, u3=
2
> *dw,
> >  			      int i)
> >  {
> > @@ -294,6 +310,8 @@ static void __emit_job_gen12_video(struct
> > xe_sched_job *job, struct xe_lrc *lrc,
> >
> >  	i =3D emit_user_interrupt(dw, i);
> >
> > +	i =3D emit_stalling_pipe_control(job, dw, i);
>=20
> Why are we doing this for video?  I don't see anything asking us to on th=
is
> platform.
>=20
> > +
> >  	xe_gt_assert(gt, i <=3D MAX_JOB_SIZE_DW);
> >
> >  	xe_lrc_write_ring(lrc, dw, i * sizeof(*dw)); @@ -342,6 +360,8 @@
> > static void __emit_job_gen12_render_compute(struct xe_sched_job *job,
> >
> >  	i =3D emit_user_interrupt(dw, i);
> >
> > +	i =3D emit_stalling_pipe_control(job, dw, i);
>=20
> If we're not checking the engine type here, we should do so inside the
> function so that we don't do this on CCS engines.
>=20
> > +
> >  	xe_gt_assert(gt, i <=3D MAX_JOB_SIZE_DW);
> >
> >  	xe_lrc_write_ring(lrc, dw, i * sizeof(*dw)); @@ -374,6 +394,8 @@
> > static void emit_migration_job_gen12(struct xe_sched_job *job,
> >
> >  	i =3D emit_user_interrupt(dw, i);
> >
> > +	i =3D emit_stalling_pipe_control(job, dw, i);
>=20
> Same here; I don't see anything asking us to do this for BCS engines.
>=20
>=20
> Matt
>=20
> > +
> >  	xe_gt_assert(job->q->gt, i <=3D MAX_JOB_SIZE_DW);
> >
> >  	xe_lrc_write_ring(lrc, dw, i * sizeof(*dw)); diff --git
> > a/drivers/gpu/drm/xe/xe_wa_oob.rules
> > b/drivers/gpu/drm/xe/xe_wa_oob.rules
> > index 752842d734be..0b9d29f8897c 100644
> > --- a/drivers/gpu/drm/xe/xe_wa_oob.rules
> > +++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
> > @@ -20,3 +20,4 @@
> >  16017236439	PLATFORM(PVC)
> >  22010954014	PLATFORM(DG2)
> >  14019821291	MEDIA_VERSION_RANGE(1300, 2000)
> > +16020292621	GRAPHICS_VERSION(2000)
> > --
> > 2.25.1
> >
>=20
> --
> Matt Roper
> Graphics Software Engineer
> Linux GPU Platform Enablement
> Intel Corporation
