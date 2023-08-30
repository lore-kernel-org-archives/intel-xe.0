Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE50FC83F01
	for <intel-xe@archiver.kernel.org>; Wed, 30 Aug 2023 23:50:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8239C10E632;
	Wed, 30 Aug 2023 23:50:31 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 472D910E632
 for <intel-xe@lists.freedesktop.org>; Wed, 30 Aug 2023 23:50:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693439429; x=1724975429;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=jg85CmYsiD8MUytDJC24OkmWboaFXRroMJ6iPiJWTp8=;
 b=J6Ya/EU/xvqprbKon9Yp66cP1Ae4Afg6qVwOKxZkrBSDDmox4eoIQJGs
 4qQRxtKklTpPIupCEL7AdnETqMGux1iAZCCW3XCOJWQ7Bxhev6p2lmVVp
 gy3U1u7Igl4m1/AZwwwVwwbmXJoYohwOUW9IGxQ9iTvNFvw8PoVt+CVYP
 y19JiY0ATdCmQh9GUSk/7i7Ds37nyPbPOq/XeZTVVgA3TaVjtyP52kwgw
 ihY0Vso/cwP/qXAA6ElxULPWGkhhlWXaPpKKq6BFSRNpXebJ59E1OtRuf
 aFBSnxXCs+Gvdik5MI6XXThR77vWuPG1Coett0lqALy0jfdVsANeNMAXn Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="379525412"
X-IronPort-AV: E=Sophos;i="6.02,215,1688454000"; d="scan'208";a="379525412"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2023 16:50:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="739262327"
X-IronPort-AV: E=Sophos;i="6.02,215,1688454000"; d="scan'208";a="739262327"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga002.jf.intel.com with ESMTP; 30 Aug 2023 16:50:24 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 30 Aug 2023 16:50:24 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 30 Aug 2023 16:50:23 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Wed, 30 Aug 2023 16:50:23 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.174)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Wed, 30 Aug 2023 16:50:23 -0700
Received: from SJ2PR11MB7715.namprd11.prod.outlook.com (2603:10b6:a03:4f4::20)
 by CO1PR11MB5090.namprd11.prod.outlook.com (2603:10b6:303:96::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.35; Wed, 30 Aug
 2023 23:50:21 +0000
Received: from SJ2PR11MB7715.namprd11.prod.outlook.com
 ([fe80::ec0a:6c6e:1cd3:d622]) by SJ2PR11MB7715.namprd11.prod.outlook.com
 ([fe80::ec0a:6c6e:1cd3:d622%7]) with mapi id 15.20.6699.034; Wed, 30 Aug 2023
 23:50:21 +0000
From: "Srivatsa, Anusha" <anusha.srivatsa@intel.com>
To: "De Marchi, Lucas" <lucas.demarchi@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Thread-Topic: [igt-dev] [PATCH igt 4/4] tests/xe_debugfs: skip page table
 level check for Xe2
Thread-Index: AQHZ2oMEqnNWn2r66UmxUyL6WvMIw7ADhFsg
Date: Wed, 30 Aug 2023 23:50:21 +0000
Message-ID: <SJ2PR11MB7715DB82985E89D8C26E0CE3F8E6A@SJ2PR11MB7715.namprd11.prod.outlook.com>
References: <20230829141107.1505705-1-lucas.demarchi@intel.com>
 <20230829141107.1505705-5-lucas.demarchi@intel.com>
In-Reply-To: <20230829141107.1505705-5-lucas.demarchi@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ2PR11MB7715:EE_|CO1PR11MB5090:EE_
x-ms-office365-filtering-correlation-id: cd955374-4d25-4e7d-15ba-08dba9b3df63
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: rKdGsBZO3BUUH5svkByafbKewuua5+2yD+7RlOp+0tgVsnbXc4egPPd6Bm0ClJwlvYJ4fiQR+g/y8MIW0ffy1y4yRIYG4OpyalJUuZvo9E3ocoO4tvFgG9zMbe5r/R2jNL7R5zBj0zq7mFPJqQdxZMh1+TamHNpJ5k3ORUV7Bf0khkutmw0jPI71kUr25P1UcT1DBDA2RnPYPySMQ9IGEXjAmp3lgUi89omDNFvc42JaDk9faOE3ZdrpoJviXLbqr2bhRhBss1mwn+bazVbxKEXtf/eXC3z0+0uBW9P64aPzhlaB4pSB8SQKQSpxG+qbbTpCRSOlA1anXLYP4dTTf9Pl8l6gNVfA8xgvrLDQjJzi3UwVWn2Nblli6a8tZGO1JCcsj3u+m/QudKr9qJbw3ocYGAQ4YGGOX51Qaxs/IU42IJ/ik3D3sJuvIDv42Ob0ToKmnMUX1r8mDt/VC+7sGHFFu7oMQtOXOT4qINYrqEIVsuRjyN/WM06Sw5gyM4PVUzn0z28NaPm0XLH8sML9sdYkoxHSX7HpWnNesUOziXSPAr6QYnnkpNafJI4gCbXK6LNIcuJxx4UrIf99AjOObclZ+CxnHPO1Wvwf6aCCCzPj0e9K5BedMBNjju6P6D4q
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ2PR11MB7715.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(396003)(136003)(39860400002)(376002)(346002)(451199024)(1800799009)(186009)(38070700005)(122000001)(71200400001)(6506007)(9686003)(7696005)(33656002)(82960400001)(86362001)(55016003)(38100700002)(2906002)(478600001)(26005)(110136005)(83380400001)(53546011)(64756008)(8676002)(66556008)(52536014)(5660300002)(4326008)(66946007)(450100002)(76116006)(66476007)(41300700001)(54906003)(66446008)(316002)(8936002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?7QUCDRI4uKrA0RlSTPZ8/y8YJE0aF6NPoYXdghI+uXn+xpTDDNR1fBfUKtvu?=
 =?us-ascii?Q?4Ibqr8VYK9HeL4wP3HEOPbqnxpdFCdCFnJ3Pc97r3M5pdAj0bpnmQcvzSD8S?=
 =?us-ascii?Q?UXLrGrmNmyefNPgAJZenXoB+02BDb4D0+HbkyNT1B9BBKSbyop0CDszjoMrX?=
 =?us-ascii?Q?wbQa0lRecy0Rk1ICDsoDIaE9Cd+cnYr7LqALPtjrDPQIHT8VHHspUn2lo+oB?=
 =?us-ascii?Q?8PJ2pxDDvrw9jtFdQRa0QKzBEasaBMODh7/gFn0BgcrMs9be3ygyGGvIi2HW?=
 =?us-ascii?Q?8jMndoCOXi0nCyylTVYLrqzapCHCum9kmrFkutHhmGLkuPYTnvJiEz/7hR6d?=
 =?us-ascii?Q?Cwpjmkbqjev8zSWiHNrDo/zUxlakazm5NxYBKqgInEhCEI1lGj9KkR31nLIX?=
 =?us-ascii?Q?SzoTNlv+Av04cQNYSVLwWQgBKw9QyezowCHWBgRee3+xsem/SbCzCQIGkjsk?=
 =?us-ascii?Q?oP2LP5iVKdOugJj04528xfr8aVPhDv1lEQr6jEJd1udT5NKSY37RJMo75UtH?=
 =?us-ascii?Q?SKFz1CxotAEN8YLrBHwOjylYQRHx46MMav5HVaUHYCVbH3xBWTAIQshje/M9?=
 =?us-ascii?Q?3A3fVqRlBl2+eJlK63vfTsnCaCOr2rIwKoGHo7+cT+qq4hHXpe89xHJn+4af?=
 =?us-ascii?Q?/Q33ogLW6GYz4tOAWEy54aN+IO3X6G2iOCYraS9dxEyfooPRhOqBSK7Rf3/S?=
 =?us-ascii?Q?C6/C9KodvgDOslM8H9V3Sl5yj+9FFwK1OXTo41yqZeq4TcQn/Xx1wHlaXY0H?=
 =?us-ascii?Q?sIkVgeDkl1oulO3jxr0juhKEG4UXSTqdnNkG/34I5Ps+1uabGlAdbzv18G+u?=
 =?us-ascii?Q?n8OUwFaZPytPYcvcLC5ssSNX0CDkB1wenU76E8KfmK35BJSfYPB0dDt8RXFs?=
 =?us-ascii?Q?GbxGf43N6N70Pwmfw4JfhmH41N68YBolvWHerulplZ3Vc28Ey5vlUeALf3mo?=
 =?us-ascii?Q?3mDoL/WfjtGhLgegRtowD565WZBKAPvVP99F6BnPQ0E6ue7bR/FUTrAsEXlg?=
 =?us-ascii?Q?Z0FLS5h7McSaVQLtEYeiCgHY9FTY90gC09pGKsoxS8DKAfEkjQgNQ4uKTp2y?=
 =?us-ascii?Q?ReU5d77wQw95FQ4Chim4pyce+67c7VaiskAzDPlJsW0cL2/c3JwRzMK+Rdcb?=
 =?us-ascii?Q?sOYuvnJja9gCY8EuiNLnoxF0+6+CChpsRqiSaP+wfhJZzNyjdfnv7+3pXuHG?=
 =?us-ascii?Q?JsW/K9GyAU6JFS+jsfung8kMvmNeDiQUkvOuR7AZrRrz4NVg0pwg2KO5CnoC?=
 =?us-ascii?Q?U+jswxknEOZ+AgrDe+6JrmygQFjLUlIlGoK7z6EspVDUIbieHEcNSasnfp2Q?=
 =?us-ascii?Q?MeIU51MRy8rZwm/VUnCFOHxZmjMIdGanc/G6wHHNRpq9HpjrVZ3PSzmsJqcW?=
 =?us-ascii?Q?367KbLlT083bME5R5a0IRGWOjBpGQbc1iCSqzjKwWgacui5BoDqrbrMCYnvh?=
 =?us-ascii?Q?VHyWsNDQzI8m6x1yMBhYjL3E2uOUAU0Dz8vjx/wm0ujqqTXHMDaUKXfHoaaI?=
 =?us-ascii?Q?PmKpO44+3HejqB0acm42hF+b//RUM4P1exNnCuTrrpZsHgL14bjlXgFl5bep?=
 =?us-ascii?Q?uX4RS8eWvFUuKQqCIpqwjecAUMU46O5PTOK69a1z?=
arc-seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gnuGt138FN6azvNjxrkVXLc7GXaVKn5M4knnHczV0pVskZ6+bVpD9yvcHy2JTRp7KPLjegw2T8vHOTGl8/A8ZSJp/iNm+lF11L4Knc2f1ZvKjb1rnPJFRLWlUL9mE4Tkk2P82ctMmPxu2aJSTekq74O/qEmLyRUUBs1gLj9dz+8lkZqgpwzGves187a9dg9SCVDeb8A1VF4T2yymD/5ZInXvw0A0bIdq/h+D0hjRb+43wCg/DYX9IEauebtb2ltFANKlYjABl07YwJsu02RhVsonCvALMJO/ZTVj5EvVWYcPM4JQFmC6c88eH/NDiFg5ONbW8kCznPG239KuQyvVrA==
arc-message-signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A+wso9l65rEIW81p4VJRYoWX7emR4NC4s3nTXJIUsXo=;
 b=RqTUszWTSHqfClWVNciULjb5EIUb+fMdz33Iva8cTnbjLn5VS3JvDVt0dVQjnw92durLmP++SkYzU5Q0OIc+1MfUp1qUeg36BLYD3bCfPTCPbaFrrxZHiJN4sgrPcOEYX0c6yacq/BqAGHVhKs3PEIeF7jNVifKTNELj6pPXys2lW3sUzi5WunrvS2sqRxnF4dQordu5ySkEShcKF8w2XbMJAkfJDiTBxgo6bRDsML+4Z1e6qM80xIfFonr1+J6BsKlZ5+GgvcY1FtYjTWpW72IzSzoGWvJO9KzOKqgp1EHfyTp+5B3HtCkjZK+2VQzLGFHmSFPmpjQkCd+A+uGekg==
arc-authentication-results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
x-ms-exchange-crosstenant-authas: Internal
x-ms-exchange-crosstenant-authsource: SJ2PR11MB7715.namprd11.prod.outlook.com
x-ms-exchange-crosstenant-network-message-id: cd955374-4d25-4e7d-15ba-08dba9b3df63
x-ms-exchange-crosstenant-originalarrivaltime: 30 Aug 2023 23:50:21.4764 (UTC)
x-ms-exchange-crosstenant-fromentityheader: Hosted
x-ms-exchange-crosstenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
x-ms-exchange-crosstenant-mailboxtype: HOSTED
x-ms-exchange-crosstenant-userprincipalname: 8pKBK5yzXMekZoFEMuSL9xdhEFFYnV5ZVV+ZUCpV/XkOBzlKVo6VhNJHJmMhJEQ95+FKYnJyJgZfVFT3rBwKHmA2R0hVGc4JpojH+kAj4S8=
x-ms-exchange-transport-crosstenantheadersstamped: CO1PR11MB5090
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [igt-dev] [PATCH igt 4/4] tests/xe_debugfs: skip
 page table level check for Xe2
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
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>



> -----Original Message-----
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Lucas =
De
> Marchi
> Sent: Tuesday, August 29, 2023 7:11 AM
> To: igt-dev@lists.freedesktop.org
> Cc: De Marchi, Lucas <lucas.demarchi@intel.com>; intel-
> xe@lists.freedesktop.org
> Subject: [igt-dev] [PATCH igt 4/4] tests/xe_debugfs: skip page table leve=
l check
> for Xe2
>
> From: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
>
> Starting with Xe2, a 5-level page table is always used, regardless of the=
 actual
> virtual address range supported by the platform. Do not depend on VA rang=
e to
> configure max page table level.
>
> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> Signed-off-by: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Anusha Srivatsa <anusha.srivatsa@intel.com>

> ---
>  tests/xe/xe_debugfs.c | 23 +++++++++++++----------
>  1 file changed, 13 insertions(+), 10 deletions(-)
>
> diff --git a/tests/xe/xe_debugfs.c b/tests/xe/xe_debugfs.c index
> e51d03661..72c069bfc 100644
> --- a/tests/xe/xe_debugfs.c
> +++ b/tests/xe/xe_debugfs.c
> @@ -74,6 +74,7 @@ static int validate_entries(int fd, const char *add_pat=
h,
> const char * const str  static void  test_base(int fd, struct drm_xe_quer=
y_config
> *config)  {
> +     uint16_t devid =3D intel_get_drm_devid(fd);
>       static const char * const expected_files[] =3D {
>               "gt0",
>               "gt1",
> @@ -86,7 +87,6 @@ test_base(int fd, struct drm_xe_query_config *config)
>               "clients",
>               "name"
>       };
> -
>       char reference[4096];
>       int val =3D 0;
>
> @@ -104,16 +104,19 @@ test_base(int fd, struct drm_xe_query_config *confi=
g)
>
>       igt_assert(igt_debugfs_search(fd, "info", reference));
>
> -     switch (config->info[XE_QUERY_CONFIG_VA_BITS]) {
> -     case 48:
> -             val =3D 3;
> -             break;
> -     case 57:
> -             val =3D 4;
> -             break;
> +     if (!AT_LEAST_GEN(devid, 20)) {
> +             switch (config->info[XE_QUERY_CONFIG_VA_BITS]) {
> +             case 48:
> +                     val =3D 3;
> +                     break;
> +             case 57:
> +                     val =3D 4;
> +                     break;
> +             }
> +
> +             sprintf(reference, "vm_max_level %d", val);
> +             igt_assert(igt_debugfs_search(fd, "info", reference));
>       }
> -     sprintf(reference, "vm_max_level %d", val);
> -     igt_assert(igt_debugfs_search(fd, "info", reference));
>
>       igt_assert(igt_debugfs_exists(fd, "gt0", O_RDONLY));
>       if (config->info[XE_QUERY_CONFIG_GT_COUNT] > 1)
> --
> 2.40.1

