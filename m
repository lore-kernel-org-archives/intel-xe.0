Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C2ACC77B7C
	for <intel-xe@archiver.kernel.org>; Sat, 13 May 2023 02:52:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD53110E09F;
	Sat, 13 May 2023 02:52:48 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21C7210E09F
 for <intel-xe@lists.freedesktop.org>; Sat, 13 May 2023 02:52:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683946365; x=1715482365;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=D8Fck7mbO3aLpP3b7/Jp7LsMZIlx1BWoXrQffricSH0=;
 b=PIYk+cH+2er0AwjtCKpx4dCnG3yj+gqOSjVYdkrJIBxJ08q+2z0yVbvg
 udFuFcubIg4aHJ2q78TQvweEGjZpLEnKWd4DZevlAO0W683v4iuwVP6oi
 bx1v9ngodR9w6kQ858C7/RIyDRtNmrordFVf4BCe+k5aj48y51BhrYjoH
 XN9U/3KHjhHKhYtXtWxBNbRtJkKR0Aq+t2a5Tm8e9SE9syb07NRbTsyWS
 6RQCd/6Pr1e88lxNRqltH8237hDyzwFeEBEuGFLiHAgst8BObcrKc2t/L
 PhhdS91aChoyooAtCfoNrDdHiptbRoV+sPlIbOAsMdELPv5E4yIGCg9MQ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10708"; a="331285919"
X-IronPort-AV: E=Sophos;i="5.99,271,1677571200"; d="scan'208";a="331285919"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2023 19:52:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10708"; a="1030271194"
X-IronPort-AV: E=Sophos;i="5.99,271,1677571200"; d="scan'208";a="1030271194"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga005.fm.intel.com with ESMTP; 12 May 2023 19:52:45 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 12 May 2023 19:52:45 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 12 May 2023 19:52:44 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Fri, 12 May 2023 19:52:44 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.102)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Fri, 12 May 2023 19:52:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iSdOpCWvnz7grgCSAej/cvz30vqwTvCXY+GZS93JoV/PETjyE+tW7OIFo5pgyvZTdR05iXnEfXHKBpNzoCJFhN1M2hr2bU5w7BBhb3Obsnn1uJxmpSGVS1GutefDixQc/Qp5PhiOBMDIrmxiqJE8G1118F57N+mv7oE4Sa8tQw+4KjWxrIsA0OFhWLzAu69BQSwNWnfLKNMubQL2WurSNAWnK9Zz1QGve5cxhc0w19ZUL/7fgjKFquwxrGWkBUar9SkvAfjvWwtRLBZGLVsPHXhSmn/twiRLkF3LYQU0/xwZXsgp+0DeVvCnDavHbdOq63mOnN4l3+OChLqiO5o/fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uNLnGXLeuKqQGc/l16b9Z0qRv0A8fNmTbXiGYDBYgmU=;
 b=F6nslhXc7/OzMukejuHzi6dIBdfAdlx3GLkHDVr7+OSfJS8uK2IDUolTkaTUJjiu2x9upW+jGn9qWZmeDj8w3KvfMmZKXxrLd1v2/bM4b7+/7bT33pOzomZ+VblQzxtRWdsEKGO2kNiSU9FKMDJb4/+R+qVP862iuBVDR9haUzJb75NRKTjGam1ds3Z4sKfnEQGKreYj7VAa7I7Ato6fEg/siceBhDsOeglWAJPzJJOIfGJl6+Maa7cCStWEhv39Mbw2vWFFqz4T+PoXq3y1fLIi1dqTQ4kKSd17nNTQZR4pcRMqQUKPiavnnbo2nCvKf4rsKiUJa4sphTHXI1n5rQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ2PR11MB7715.namprd11.prod.outlook.com (2603:10b6:a03:4f4::20)
 by IA1PR11MB7756.namprd11.prod.outlook.com (2603:10b6:208:420::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.23; Sat, 13 May
 2023 02:52:30 +0000
Received: from SJ2PR11MB7715.namprd11.prod.outlook.com
 ([fe80::dc02:fa20:2d25:dc]) by SJ2PR11MB7715.namprd11.prod.outlook.com
 ([fe80::dc02:fa20:2d25:dc%7]) with mapi id 15.20.6387.018; Sat, 13 May 2023
 02:52:30 +0000
From: "Srivatsa, Anusha" <anusha.srivatsa@intel.com>
To: "De Marchi, Lucas" <lucas.demarchi@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Thread-Topic: [PATCH] drm/xe: Load HuC on Alderlake P
Thread-Index: AQHZhSqzQh6h2pNHYECAOVPlFWop169XgXFA
Date: Sat, 13 May 2023 02:52:30 +0000
Message-ID: <SJ2PR11MB7715FAC48407AC06DAEB9C65F87A9@SJ2PR11MB7715.namprd11.prod.outlook.com>
References: <20230512233649.3218736-1-lucas.demarchi@intel.com>
In-Reply-To: <20230512233649.3218736-1-lucas.demarchi@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ2PR11MB7715:EE_|IA1PR11MB7756:EE_
x-ms-office365-filtering-correlation-id: 9030f987-91d8-482f-7302-08db535d181b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ntqPphwm+cd0+TSUEspx+O5nqPKqIWoiR/CXlemrnejjT575rBYhCPYgOyCPom1hiB+t3XC3oTYEzxZJioWSsRdkNSRkwnQNHwjrHnbe/fi94yiwSsilSoytSNIvWkK/SAB7Z5lhkWpuYh+N9deENftJvg13QjX/B97Vnncmju4ngHRT0phbUMhT0CXo2blSG/XrOBkjmrbrq79KhxH9NifCj51kbIrAk9VkoMuHWEcTbKETqZVi0yi0u35cJZYIDYw46C0NUKgkeUx7hJ/4LlWy8/zdEZiRpSM8uOqxAqacDfMu3qTk8UCN0KVFpYW+K2T1Z+keIm4oWxTA4lyuVm+noJ2We2TnYY41Qu2wjtdHzYCXdZNOf80UNLgNfP8i57HkHJ78uzwCIRQeSerphmGcEjFX9Z/o943pe1lT0pTZLCsjTfTvYIM8RIv8hKPIndOSX2fMskL5TgGdvjxJ+/02DbNAPzobDogI3Jsij+j7Y3SW0ouqKjaBHtNJqFRs4aYxB1VcGER+77VJeYmTfwgIN8pcb3PqP3Uk2apE511K+iJIUTH35FcwQMyqp9jeq3bJKkIMBD9uV5Yu3cqbyPw6O53MM0/4RFdoa+IvDGgufafbBZYuzMdfW5fhoMm0
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ2PR11MB7715.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(366004)(39860400002)(376002)(396003)(346002)(451199021)(122000001)(82960400001)(38100700002)(52536014)(55016003)(33656002)(38070700005)(86362001)(5660300002)(8936002)(8676002)(53546011)(6506007)(26005)(9686003)(186003)(2906002)(64756008)(66476007)(66556008)(66946007)(66446008)(478600001)(110136005)(71200400001)(316002)(41300700001)(76116006)(7696005)(83380400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?kNt9ak/8As4ekHaeuaLUxpiU2EPFIvGF2CYQgnx0QF5awcAioYUueMmJgIQd?=
 =?us-ascii?Q?I3GsPd2PIsZkx/u8AlkVEdOLTmwVmazUsP47KYUrSWXlGNZBK9BXB5NRsx5o?=
 =?us-ascii?Q?jFeLhFsIUUdXu4PsW6qVqlGu5UMDqxbB1YpQ6tlocUZpCTuBUjkmKmwT7gMt?=
 =?us-ascii?Q?AU+isD2sgtKhrvSRXE7YQCN8tfCc76Cgsvh2qqIr8g+yKfb2GLgIKUDN/U9P?=
 =?us-ascii?Q?W46s7NxniHgxwSgVcSEGQPv6YIob111NoMHCgv2cWK+jJ/vw0NamUVdWzyrv?=
 =?us-ascii?Q?eRfm41rHZPqWs7qBGwzEoJQAHZr2k1aXMZALFRmS0wSOPb7j0dCX4VtWpyby?=
 =?us-ascii?Q?XHj+c94NVynBtT6rn+8CJ8grr2Dm//KKcqIvPJoFdKAZTvScA0PMf78gb4DA?=
 =?us-ascii?Q?iimONMvDb95p+tvTJ9usSE7IIW30aXS6OkQmJVREowkK9aCNykTNtXYF+XeE?=
 =?us-ascii?Q?1rMdFmx8o4dXV8TcqkRGmoMnCbP2SGK9kUkljWoTePlAw/OkGof7kzmEchq0?=
 =?us-ascii?Q?HjESeoqCaMgWFsBDBe/OHIoGfDl4s3Z2Isnh7Hb+hXKffz07uD9gjtzM4gq2?=
 =?us-ascii?Q?GKAbTh5FAmFPkux5/208V00GXZiVe1tXz8hg1xA5OPuQFvrA/abiTu5yaC4s?=
 =?us-ascii?Q?tx3+5GWVX+vWHsSBtweIsvivdgIz+75fzaGUF0NekiOsRDF45/WmIS7CiFYw?=
 =?us-ascii?Q?ppsB2QzG0audq+JP5auwoGnPS39sW+gZVjNiO/PWG38IMy0nFziTfvKY912H?=
 =?us-ascii?Q?e5LBp/dBaWcaYQN/hJx8VQezlvGMphZMFKQXHewOx8sYQrZAVpo30o26i+8e?=
 =?us-ascii?Q?sAfjpQK5xxfB5apIfLZiScNyJ0CUFxfe1ISSFdnnFTeXhCSVbwvAOK0GaUVr?=
 =?us-ascii?Q?5BFYs2cD8tCHk2tqsMoeVefa/wiY+G/BM2RAoPZ2HJO1LUYJKYc7Ntr/tg0e?=
 =?us-ascii?Q?5YtAJ3Qxy5dZPqXnBwBvZRNgeEGWG0/9Mid9bQsMb+hfFZHVW/voDz+N6O2J?=
 =?us-ascii?Q?xhJ2S0g2eXefYBsicY6Upgblnd5f+9mKIQMLg2I5XJ9p4LlCBgkCvP10tEMs?=
 =?us-ascii?Q?yYyQlXTLZbGd+Aoz+yKAYNQg+D4zwNN1f54FJ7PU2ADJaW6F3UlEEROFFXQr?=
 =?us-ascii?Q?MNnMHGSC7ZnfgHjsBCE+eIclQ3YrqOeAe3aXeTRqZ6xWAK9Lh/UyOC9TvpFX?=
 =?us-ascii?Q?YjKX86bb+m20Rdof+WUpgl7/z95BGBfkxyLItjMpdsWqlrn5VjyT5wRmsVvx?=
 =?us-ascii?Q?aAfBkAEGvsJ4xmKG0+tAH4fAIfSMeCWZ/fNZgrk8eqrEp4fZfs77K0RG+fCX?=
 =?us-ascii?Q?Bq6Rk9Uh1UT4HSkEbWxL7PcNGHRczdWHzBhalrkv+QzrsArdEn3TxpEiH6il?=
 =?us-ascii?Q?eLR+XTrEsRWixcmdbXSoDVQmLJkG4hMXp5poEikeeMhcgdcimt6dq684xZ9b?=
 =?us-ascii?Q?UBSFAqo99/xuroEAYHToys5iPXhkrHIiP5yqbaABFQlxLHGlxMQp/6QATlqk?=
 =?us-ascii?Q?qDHIabJAlQO9ddoLOemwOVvS2u+h4TQepfg6l3LaNLmR3s13Hcu17JWGlZEz?=
 =?us-ascii?Q?Pc/DG7xVXA/VvNowO3HvGCHI5rs1WZD/AHrBPDoH?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7715.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9030f987-91d8-482f-7302-08db535d181b
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 May 2023 02:52:30.4463 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uvxrh8OTkIrvPia4RvRgTT8M/DlHkA2JQFy9b6ED6WSIXL6FHqWX/31cmJ7ctW3wc2Y1apaS2K+XW+MlbWsGupAuGi6xcznCo6igZedQr9c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7756
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: Load HuC on Alderlake P
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

Thanks for the patch.

Reviewed-by: Anusha Srivatsa <anusha.srivatsa@intel.com>


> -----Original Message-----
> From: De Marchi, Lucas <lucas.demarchi@intel.com>
> Sent: Friday, May 12, 2023 4:37 PM
> To: intel-xe@lists.freedesktop.org
> Cc: Srivatsa, Anusha <anusha.srivatsa@intel.com>; De Marchi, Lucas
> <lucas.demarchi@intel.com>
> Subject: [PATCH] drm/xe: Load HuC on Alderlake P
>=20
> Alderlake P uses TGL HuC and it was not added together with ADL-S, becaus=
e it
> was failing for unrelated reasons. Now that those are fixed, allow it to =
load HuC.
>=20
> 	# cat /sys/kernel/debug/dri/0/gt0/uc/huc_info
> 	HuC firmware: i915/tgl_huc.bin
> 		status: RUNNING
> 		version: wanted 0.0, found 7.9
> 		uCode: 589504 bytes
> 		RSA: 256 bytes
>=20
> 	HuC status: 0x00090001
>=20
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_uc_fw.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.=
c
> index 305e7f8992ea..317c541753fb 100644
> --- a/drivers/gpu/drm/xe/xe_uc_fw.c
> +++ b/drivers/gpu/drm/xe/xe_uc_fw.c
> @@ -111,6 +111,7 @@ struct fw_blobs_by_type {
>  	fw_def(TIGERLAKE,	major_ver(i915,	guc,	tgl,	70, 5))
>=20
>  #define XE_HUC_FIRMWARE_DEFS(fw_def, mmp_ver, no_ver)
> 		\
> +	fw_def(ALDERLAKE_P,	no_ver(i915,	huc,	tgl))
> 	\
>  	fw_def(ALDERLAKE_S,	no_ver(i915,	huc,	tgl))
> 	\
>  	fw_def(DG1,		no_ver(i915,	huc,	dg1))
> 	\
>  	fw_def(ROCKETLAKE,	no_ver(i915,	huc,	tgl))
> 	\
> --
> 2.40.1

