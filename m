Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1069CDB465
	for <intel-xe@archiver.kernel.org>; Mon, 16 Oct 2023 06:19:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58FCE10E11B;
	Mon, 16 Oct 2023 06:19:13 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BECEC10E11B
 for <intel-xe@lists.freedesktop.org>; Mon, 16 Oct 2023 06:19:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697437150; x=1728973150;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=YyOfLbvj7kF4DP53be4cUQ8auas4Ih6zzWrDYM1hPBc=;
 b=dX8rrcaiJMh9Aex2W17T6vlZh54yl3OIoBFKcvbeMWiy+XsMSuXi4wGa
 sLUQT71EmgccSn5grMBCWQBL3zLPgOC8+U/2JeNFtBx/ea8Y+Ar/Vz+OY
 OQ1DbNGQx4watAWCbEuSUAT9NSqgOEkFDJTmlhGEPHN9+ID+Wccp8WKEX
 4328UzHY3YKoZOC0l6k4OsMlhQlYXKBKPs/J3WZ/gegcbI7m90Zz1yEIL
 t8NAGH4btHJ2Phe+Ri6KkMpcvlwYL8gZr+QYmcyoLEDiChH5vGInj11x8
 9MYm5XZqVAMiKpERH0A7QAkakdKuL3pF9w86w18foKWoiem3r3TuJQf9u A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="416522143"
X-IronPort-AV: E=Sophos;i="6.03,228,1694761200"; d="scan'208";a="416522143"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2023 23:19:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="755571150"
X-IronPort-AV: E=Sophos;i="6.03,228,1694761200"; d="scan'208";a="755571150"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Oct 2023 23:19:01 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Sun, 15 Oct 2023 23:19:01 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Sun, 15 Oct 2023 23:10:11 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Sun, 15 Oct 2023 23:10:11 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Sun, 15 Oct 2023 23:10:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IgPQcj672VeHTn02OPvsp/VAyJDOQLxSoi5XDf/Mgfbx57zv+Dq+0UvCgMd4Z+coo5/+qKadb0z4fjCFS0fQXaKd93gmGB6Gd4LbFkKf4LVxkE7STqRAVt9Mym54SNiYkYEkSV+H6hSgyVbMmi5PfFEi1anW804cjpkHhdKR1g7UqBJAhtOsIRT5Sp/DUUasfstS0mv91/TLu3N2+uUOiJsfalaU440k/sUBueJyX4KZhll93uFvM+iuVs+JtyLvE7NFmrjEFuXauyNl/gOjN8QpUYdOR8Uid+P9DBcUdKMZN/mSVOi9Bn1LU8fjcuQin33quKzfF1UbdZk9SqAM3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9vMxgJ2gtif10fX6eZOo7LQhmiXG4myo+1/gn/6xM7w=;
 b=T6jq57vmfSc1eH4lkd90Ic1AANf1Kp8po3+Q4rbb0Zk2aubRpB1ZgNTxLcsloF0x7K1pwEIVhdKT4Tmo3jUibmJMXUyee07FYF6gZtGQlrZ+WbwQewFtFFboJ4hqbAS6TW9OZ6IkJwSvWRD+Ymy6c0pOetG4+pfONfg0bae9Xtz4mV7YaPfDLX7Afv6pCMJKtHF9GGob4Vg9rfW3q/vh4kQTEpLq0buTJL4v4lvbO4lHtHV7a8F5bwt3RINhL4qL6rQWeOzVBsp1+aULFVWD+MtAtbhYuLNFPPhy5DzTNX+QXJM88AqcV7fceN/ASSMWJUHEJM7v3eFhBAu5IHiH9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com (2603:10b6:a03:488::12)
 by DM4PR11MB7184.namprd11.prod.outlook.com (2603:10b6:8:110::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.35; Mon, 16 Oct
 2023 06:10:08 +0000
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::f525:287c:b2c:81c5]) by SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::f525:287c:b2c:81c5%7]) with mapi id 15.20.6886.034; Mon, 16 Oct 2023
 06:10:08 +0000
From: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
To: "Kandpal, Suraj" <suraj.kandpal@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Thread-Topic: [Intel-xe] [PATCH v5 3/3] drm/xe/hdcp: Define
 intel_hdcp_gsc_check_status in Xe
Thread-Index: AQHZ/ZdTib4ucxARIES346H5WXQSqLBL83qA
Date: Mon, 16 Oct 2023 06:10:08 +0000
Message-ID: <SJ1PR11MB6129E607F1EA4ED73B100F50B9D7A@SJ1PR11MB6129.namprd11.prod.outlook.com>
References: <20231013053455.835094-1-suraj.kandpal@intel.com>
 <20231013053455.835094-4-suraj.kandpal@intel.com>
In-Reply-To: <20231013053455.835094-4-suraj.kandpal@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6129:EE_|DM4PR11MB7184:EE_
x-ms-office365-filtering-correlation-id: e8af0b24-695b-471a-877b-08dbce0e8ca9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: XGTFcgvLro4tA4AXFEaQfBWiSEn7OMWitkypNF1a4bpcjKgD/kBNGAJKJ9bwxLdQX6SA5aPoNwwiubHat4X4tdrdB4/hzBTBzCJTdBwcUrzqHjCKNlN4U0OyxX7kl/Q4YFs7qmC0lO1lYz3lsqCKJrBL4Gwty2dYOjJpdGH6d1piRlBHZf1Va8hRBss4effX2rwLxijJHX3cKAVdJAS5joc04463xXJ6IqGpO4rQBg++OxcYHFwkN8Hne9AHOp8dLwV7M53aA5+gFavfdv8eoHXnKBT4sCyWPQ+kPAKLheFUy6XXYbg3LPpPP878YcznBJC3SReELzEuluoCXhiX7uoJnse3JAO6hTnd4q98vNKh2s7EpR5vII9XiUHUZI62a4CYfb+kMa7P6vA/HbFTnOMhsifD0htq+JwTVVFWwJBjKbBrUtL+Wmu9PnCDMmBZSFHPyK/CvKTjYZYE0B6VuFLKPPS4vZis8tPT/aB2Wp9J4R+95Vzz+JgFMMTnTzhPfK9/JERcYSLl0mEgD2LwIqZ9bX6wT+aaGrcOzUiB6EtTv4odOM5tcMhVXyeAYmhLByx4iNpjV1DzmJSForWZBOcorDruMdACs9aatOKVKUSFmQKeJCB+bqPifFHrMIfc
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6129.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(346002)(376002)(136003)(396003)(366004)(230922051799003)(64100799003)(1800799009)(451199024)(186009)(478600001)(71200400001)(66946007)(76116006)(110136005)(66556008)(66476007)(64756008)(66446008)(26005)(6506007)(53546011)(7696005)(9686003)(316002)(8676002)(8936002)(52536014)(2906002)(5660300002)(41300700001)(33656002)(38070700005)(122000001)(86362001)(83380400001)(82960400001)(38100700002)(55016003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Ymkl3GXacArdV9aM/v3oTTDxixTqEjsNemMvEQLFdc5fzDBsuD2gn27wqMLu?=
 =?us-ascii?Q?f24XwzYjbgMLOtBH4RmJ5w41LW8pRofB4VQe/L7T1w0kM4gDapY4gZeUBX/Q?=
 =?us-ascii?Q?BC1/su8/gbRBNtYNqJHaQSxA+nyU1V3FOdWPKNrb0nU1xF5pAVZGn+5PgBiY?=
 =?us-ascii?Q?JHc0CLpxXH59ihtd9mmKBDJMwA2x/lBXeSH01jn+3KVwhRc1Hde1S2Xqfk9F?=
 =?us-ascii?Q?BsjS0AFcDnNwIr2p/Gzqwp2DZhT7Xnqoyhp74h4GGnWzfYtdS6eOeW0nUXH9?=
 =?us-ascii?Q?Dnv8fHIreyWHODLS9XtWbmSi7HztMJB0d5A6IkKt4+L9jAiuUA04m1gRMX6q?=
 =?us-ascii?Q?xjpgEVqmmLkMaPax9D9nzu7RDluAMigtSOJ9wr5kZ8IUyISlox0EOaiLUn5S?=
 =?us-ascii?Q?Q7Uaf3ggpQiVjVSsFKfRfLSlJvpivyLMs2yoR8guAGsCQVyjRrjb2/u22TSS?=
 =?us-ascii?Q?A81J15/wWt0Vl9PALTnseDP7ih7POnqOUIW0xciHOYr3qkeyCwbzjMPKI/6V?=
 =?us-ascii?Q?VorFYDJj6d67mF/yAVSU3EU/vxvcBsxUc8wxYrTtTD5bZMqiB+nzE0a1B8fJ?=
 =?us-ascii?Q?hwVk+EHN31/q/vnM0VlkZnKo75CU/45iMJs/yPU3ijIV7UXs2fV/mUyCmdho?=
 =?us-ascii?Q?X2uG9axa1ZL59eoJSPwt84yOpDybsYllOOd1Cdyp0IlnNoQSNUANugSea3fq?=
 =?us-ascii?Q?g7JKWUH9W548ugmaNigeRUUTJaHYIhjWJzgsV01+4bGvDb7+lgl0CRVhRWqA?=
 =?us-ascii?Q?4iRbDLLf6MfxVF3dCRHnKXq9RZletByYolAwEnSKOceut76oOOVMtm9R08gQ?=
 =?us-ascii?Q?WujnzEilE+qvgXD5630vEs5XEPR4khyg/sY+2Uximpslri/6x5LU9tJDxVMP?=
 =?us-ascii?Q?ERobfieR2i3LPlgz5BqXVv6jYQJ6hp4bx6JpvcjVVQVrChtoXzYqV633nVSl?=
 =?us-ascii?Q?xrz8tGFE580JLFREq/UZMxi8S9cNzsGX6FtmoOZ4R0TUyvxghKjK/Tdep+7n?=
 =?us-ascii?Q?Q+iIaj1LgHwlk8vYuAJjAlFS5ecO+yqNy0+eQcfzWvz/fnD9ML3b66fxEiRF?=
 =?us-ascii?Q?S1oOTHfNHKlZ7p8XzO9MudoPMT9UvxSpNXVua9VKBrW4PTaUKuseBtWxzNEN?=
 =?us-ascii?Q?s/AlbKkvMEhWpt5UVoFCepDY06aNZ6EBs6TmOnI0uuI/IwnWgfyd1nAmDh0q?=
 =?us-ascii?Q?P4Aw5q7015InhIKJ77XJUluA6IqNnJhiBjgYouYdulXAl0ah4HkQs5SbBxGB?=
 =?us-ascii?Q?IT3qjR78Qpvu73OdYHjP7cAr6hHmbl1uLiixi4QWRIUi4/gPfysnmoOBbgOj?=
 =?us-ascii?Q?Mw8uaBCnzIp4f6D3OKk6FIME5yomAECKVHbCGV3WoXzYSChAiyCbMyVZHg6O?=
 =?us-ascii?Q?95y9CluLD2XGkHj8d/zfFck7z0hZ9FFEqG3K6JbWLSUkFrS1eoUErDqANd7e?=
 =?us-ascii?Q?SYrG8LCXTBDqg7nccH3INxGxdoOWWr4Aud2ydfmzHpPXmAUW6z2Gfy7IoR7q?=
 =?us-ascii?Q?awIkETVNAD/I3F9gOzHmO3CZ4A6E3PhEjxAa9I5bn0s4dYzHUhTIFH0oSZVD?=
 =?us-ascii?Q?V0yvaLf6dhhBiBDuf/W4PY9Yy8u8gfEudNoXxoi8hp0MLgx5CpXwDujJ/MsW?=
 =?us-ascii?Q?kQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6129.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e8af0b24-695b-471a-877b-08dbce0e8ca9
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Oct 2023 06:10:08.7627 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: A48WZRh3saLHmzJEjfO9tmgTiy8T5Fi5mUf7FxXmhZyrfVbW4RHxJfBKTc2YJrfLWIoP7K+mXxVa0i/1H2EW7GA6zg57tt7RbTAYX0QGvTE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7184
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v5 3/3] drm/xe/hdcp: Define
 intel_hdcp_gsc_check_status in Xe
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

Hello Suraj,

> -----Original Message-----
> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Sura=
j
> Kandpal
> Sent: Friday, October 13, 2023 11:05 AM
> To: intel-xe@lists.freedesktop.org
> Subject: [Intel-xe] [PATCH v5 3/3] drm/xe/hdcp: Define
> intel_hdcp_gsc_check_status in Xe
>=20
> Define intel_hdcp_gsc_check_status in Xe to account for changes in i915 a=
nd
> Xe.
>=20

Can we add the reason behind returning always true in Xe in the commit mess=
age?

Regards
Chaitanya

> --v5
> -Define intel_hdcp_gsc_cs_required()
>=20
> Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
> ---
>  drivers/gpu/drm/xe/display/xe_hdcp_gsc.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/xe/display/xe_hdcp_gsc.c
> b/drivers/gpu/drm/xe/display/xe_hdcp_gsc.c
> index 0453293af8ef..0f11a39333e2 100644
> --- a/drivers/gpu/drm/xe/display/xe_hdcp_gsc.c
> +++ b/drivers/gpu/drm/xe/display/xe_hdcp_gsc.c
> @@ -6,6 +6,16 @@
>  #include "i915_drv.h"
>  #include "intel_hdcp_gsc.h"
>=20
> +bool intel_hdcp_gsc_cs_required(struct drm_i915_private *i915) {
> +	return true;
> +}
> +
> +bool intel_hdcp_gsc_check_status(struct drm_i915_private *i915) {
> +	return false;
> +}
> +
>  int intel_hdcp_gsc_init(struct drm_i915_private *i915)  {
>  	drm_info(&i915->drm, "HDCP support not yet implemented\n");
> --
> 2.25.1

