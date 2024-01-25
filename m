Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41C0CC47258
	for <intel-xe@archiver.kernel.org>; Thu, 25 Jan 2024 15:53:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F28B210F93D;
	Thu, 25 Jan 2024 15:53:10 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F8D310ED3D
 for <intel-xe@lists.freedesktop.org>; Thu, 25 Jan 2024 15:53:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706197989; x=1737733989;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=vmOL360DZaNXRy8Cjlb7gl9tSCK82qNFVVl9zVYpoDw=;
 b=n506MoPdTpWz44v2TxQgvBHUzoNvk4aW4JD3QdlmIv5cyouukocTzbfM
 jxH6WZDWka/wBCQtFsje3Z3H1SadtJDqYNCgo0pz6SxCalyFQlKjWjNts
 iivBNjY56k+vV1AjjMa2CKcfCFrA/Ysrpi5U/ULbdE0pORURHg9mhikL+
 y0vBuNkYwT+Kiu+sFKuIHm5E+0M3dQwybSFF7vVaDPb/PdQCK5EBsxP6p
 KyxjOnyD80lsTgUY6Q5D7xPSzYb6RgOEAJ8Bvpe3fO3SadBeh31JMjO0o
 n9w9CecwTo5CvTjOh/Ai8DnY21j96LhqQxxdcZEa6O9skOv7x82FrQYBl Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="9580182"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="9580182"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2024 07:53:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; d="scan'208";a="21089692"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Jan 2024 07:53:08 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 25 Jan 2024 07:53:07 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 25 Jan 2024 07:53:06 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 25 Jan 2024 07:53:06 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.101)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 25 Jan 2024 07:53:06 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i4bjxAc0dZh1DEgZe+u0Dx2zWqcK5kn6kEGSyY/WqRTN8foVIO4NfFg0qidqL03XME9OUNl1RptO5Jhm6cge38riiJLmLDEDrhVWu7ebEJVslNbivQu7ME723IdKlb3mE7dNY/ekR3tyIeKPvMxBrmRBgEzJOu66GjUgLJG/RfmD7sOVgJQn9h3wnl+XV9UKbfJGXt8vevh1IHzRbfuv1dXPNWCa9O+uHFvRHkV1MYhkLlIgn57fjkFcV+knRnWNylgbp0h8Umqq5j0pmNP+EqTMwP1mxcxXEZCf9s1ITIbtfFx9sJasgG6+ibbTSFCpLGeq+wV4/S8KqIFC7LNF4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BjfU1ZQvoSJ/OyY2tNaLaqO7+PEkl84evcYcnFUja1U=;
 b=mtUXLW9x8BByG6EF1IaWK3xfx3UjJlJ5+HE1vYqMrZURMjOBo7VITKvOV3T8BSyPg/gvo2BIk8wj/q/6StTt79CpL6UbiOZn1PG4MbZ+fJhngDVFoEf+UZM79yqbEacvUGz0Rs222nRmi+vzVyVOWbrPb3LK8lwKUfsieEbEEjxfNOkRI6FWXoqgdmlSg4WVknHHPZ4Nb5kydhWvzjkPurxQqTmvQwxOEKJbcRIQd3Tu1GK2vDnLlt6RODeSqv9i0ukgIeFK0Bxdf72qGPAtJ+LGGRWRW8lrSpuzG/gADV6t1TGgmgWpG9VJ7sp2OQDLBR0l6nOUwy5FT9/dy0N6+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6211.namprd11.prod.outlook.com (2603:10b6:930:25::6)
 by CY8PR11MB7731.namprd11.prod.outlook.com (2603:10b6:930:75::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.26; Thu, 25 Jan
 2024 15:53:04 +0000
Received: from CY5PR11MB6211.namprd11.prod.outlook.com
 ([fe80::35eb:1d4b:b90f:e584]) by CY5PR11MB6211.namprd11.prod.outlook.com
 ([fe80::35eb:1d4b:b90f:e584%3]) with mapi id 15.20.7228.023; Thu, 25 Jan 2024
 15:53:04 +0000
From: "Gupta, Anshuman" <anshuman.gupta@intel.com>
To: "Poosa, Karthik" <karthik.poosa@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH] drm/xe/xe_guc: Reduce a print from warn to debug
Thread-Topic: [PATCH] drm/xe/xe_guc: Reduce a print from warn to debug
Thread-Index: AQHaT6ShGDIaqKE+i0WJkiRMHtK9frDqrQqw
Date: Thu, 25 Jan 2024 15:53:04 +0000
Message-ID: <CY5PR11MB6211BC6567CD2B707BD0697A957A2@CY5PR11MB6211.namprd11.prod.outlook.com>
References: <20240125154647.3743708-1-karthik.poosa@intel.com>
In-Reply-To: <20240125154647.3743708-1-karthik.poosa@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6211:EE_|CY8PR11MB7731:EE_
x-ms-office365-filtering-correlation-id: 957c564d-643f-4455-9fd7-08dc1dbdb79a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 3WVycGmIK8yueisScfI8jQTSkh1yCp/KaJll4pBW8FRCK1mjmJ/pdz3hr8L1Vsb2LAVlYcb0dP826xQEqP8pH1Pw+G624NpWLJggRyY4s4RL/v8IIg5PMh6yiy4Q3zmuP2WsGGRcEAFjGsjDSTt8dehSX3cfmRkn8GcChB2NMFd7Q6qPlYPFGasBwF8uOtRZsb8mnbysf7QKh5MWYbjFR/CaFWC0iH/+5Cmz6D24mJk5dgAgd8JLoDPh1EaVY1pEMryCxsZzk0+amZiCyOEWhqlN1PiDiHTVbWnCBwZiAXp3LxDFNN7HSf8tJRfQJ81q0RuOnMhrXiIjeJ1sY7R7s9/H9XbybVBO2CI2a5qJCByF/w/y3IM4idSIniMxtp7p9tZVn4GmTIpEMHay1CF30En5wQQsXYnI/TRj1zY3c9vBMAo6MP3vz5vmGkr1QjryZOzvxVFqfk+X5Jo6YrkKdG0CZXzbIDD+49+g1ZzssXi/OYDJJKoDQSjO8el9Jri5jTHqDAr9pHLou4ClA2hDbJesZc/jS+xCwcgcae62vlvY2ggppSkN34CkhODDwF3//gZkzIe1sJLW1pbYpHdXXSiLUXoUR0AoyW4O3kKRK90m2sM43iOS8LcWb5marJ7AaCWKiJqtyZ6jBDVssEMNwWdZ7aDnW1HuuXw0kzjkiA8=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6211.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(366004)(346002)(396003)(136003)(39860400002)(230922051799003)(230273577357003)(230173577357003)(64100799003)(186009)(1800799012)(451199024)(52536014)(4326008)(8936002)(33656002)(8676002)(5660300002)(76116006)(316002)(2906002)(86362001)(66556008)(110136005)(66476007)(64756008)(66946007)(66446008)(54906003)(38070700009)(478600001)(82960400001)(122000001)(53546011)(38100700002)(7696005)(71200400001)(9686003)(6506007)(83380400001)(107886003)(41300700001)(26005)(55016003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?k3XkqRC2cQ3jGnKqD3RV/YMcuHzgeyJ5Bh21sDdcnoRJ8ifuuRkDtuANK0B0?=
 =?us-ascii?Q?ADhy4ljzvcSxRtIrhZNA4zM3A089ddLEDdUd4hxM99H9h+6J9Y3uK/yEjwBO?=
 =?us-ascii?Q?5j+Ev5d0lPP/3LcBBlztH4k3nVoSS78/AJLN9WV4Nc57N74rDMdzENKlwHEE?=
 =?us-ascii?Q?zKO61IN5jLxfNXYCoKUXrwCSOd++IzLX5NJxdt+dQinSzRKqg2hzv82TZ2Nb?=
 =?us-ascii?Q?1DVmpYRDKjQCx439xelIoa6HGNr91uNuj/ytBYcdWZLNb+24dsFLb5sXb572?=
 =?us-ascii?Q?cwyTP0UdgTTqwpxtuHflLoT3wZpJ3mHV03b5hZ4j/l+NIAF1h9RjuR/kSUmN?=
 =?us-ascii?Q?NwK3Dpr1NU1Pe7xBnOkAdu25aUvz3XSRcWWQQ/3s9gHtD04vuA9PVmHMab44?=
 =?us-ascii?Q?urSeuOO0AmSXqUUCPqwLHtUIHWyAGZijRNpUVyVldiY73b2Ji5SkdbtYR3wE?=
 =?us-ascii?Q?11SKzJL9TE2f+nv9HuF7YnACcJlV3w4OqEXj+WUVgSPVUjfGhyxanBfeTUtz?=
 =?us-ascii?Q?SjBL+XEwdl4u8RCMZq1k0GFqD8A3LQwfGokQTkZIAqNZXk+wogAmBzhwh6tz?=
 =?us-ascii?Q?7j70474N5Swyr5XjAXvCfL4toygyJCtesl8TFPxkRzi4Ke0ILLCtuMc2hH8P?=
 =?us-ascii?Q?e2sdAtTAmoqabz09Nf2KjAMUG/a/CMNMF9WWKIzlYYpNlP7jtiScHke476dv?=
 =?us-ascii?Q?JAqGQ7ukyjhZLq7SyBJAWazD2lkfy8nKgbuSpY9lVH84qtujzJrS6B0kv2Fj?=
 =?us-ascii?Q?MTWTOH/lKgPRmyNnRBcTtkM/fSHkCAmMbsukCQ3hcEJg0k5GhAA+bjvXHuud?=
 =?us-ascii?Q?pdBsqiDCkr1QJ+G6ua9TG+aBlVBJ/W44i0wh8A1plo+qv4iYSGg+zhU5JFZq?=
 =?us-ascii?Q?qpjidSKmgI0Qs1bS8wr+Vg5IeJS3Q1OYxw/hkmKM9UkYp7/2ipi0zEwmtCJQ?=
 =?us-ascii?Q?kJ5dWu+FU6CwZq+DeehZYGhYsh5ehVAYK0Q8TcHryeVmsGV4yHhxnWRlNckp?=
 =?us-ascii?Q?uMZ/BBMp9X4PDCO6PNRjCubGxCYm17NU2ruhDmxvPEEKYybdHHGJwVXnlfLb?=
 =?us-ascii?Q?xhAiziBpkoyuuVCFlQUPlbjzkFksra4+T2o8A9lQr2/RI1KTOkXCGWkczasM?=
 =?us-ascii?Q?+fSid8+hZaSYm8iVHPrmMXOAOwrKGOWe13iLQ39HQU36XtwJ0o+2ApTP1xiF?=
 =?us-ascii?Q?hajdUdT+5Ar1j7ch/ov4LWup5fTGbsi/aK5SYBzl8r1xGdWJB3NUTHMuXISP?=
 =?us-ascii?Q?6EV5fnrdNWwY4L6GYuVecD3R46TmBZCGuM8sUxzOlhiM0HuEQs+SK5HdUP7C?=
 =?us-ascii?Q?C0Nr9vb5hfezhCnr0fwOqdhjJ0cgjmzc+2cmetQ+IdKH0oUD3cllgGMZQFyN?=
 =?us-ascii?Q?3s6wXBrnhaocghM58YtVnpXi6vM053/tcCHDIipW7Y5C1YStUFSiE3xNOu6t?=
 =?us-ascii?Q?uidjSgmUrRdmqA45CM4hI+W7aoI4O/RVckKR+dJI/vvKs4N8PYqh47E0H6gp?=
 =?us-ascii?Q?B1ZZ3LOXcXjRSqMXBpNNyxXXopZUO/2zCeJE29GJ/Gsyhd0hbs7pLUt9QJLM?=
 =?us-ascii?Q?0x9QMlGEo94mv0xeq9taqR4ys/wKNKtE28uSDnPT?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6211.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 957c564d-643f-4455-9fd7-08dc1dbdb79a
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jan 2024 15:53:04.5850 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5pyThvkU2cS8wPx5UtLpgnvr6LVa1Uf9acQgHZz2F9sFsi8XTVAEPX3WDvInKIv2bLRVpYqz6+liQ365gGJfgY4aqk0JCM2nf88OSCnIxzw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7731
X-OriginatorOrg: intel.com
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
Cc: "De Marchi, Lucas" <lucas.demarchi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>



> -----Original Message-----
> From: Poosa, Karthik <karthik.poosa@intel.com>
> Sent: Thursday, January 25, 2024 9:17 PM
> To: intel-xe@lists.freedesktop.org
> Cc: Gupta, Anshuman <anshuman.gupta@intel.com>; Nilawar, Badal
> <badal.nilawar@intel.com>; Ceraolo Spurio, Daniele
> <daniele.ceraolospurio@intel.com>; Harrison, John C
> <john.c.harrison@intel.com>; De Marchi, Lucas <lucas.demarchi@intel.com>;
> Poosa, Karthik <karthik.poosa@intel.com>
> Subject: [PATCH] drm/xe/xe_guc: Reduce a print from warn to debug
>=20
> Reduce debug print from warn to debug to avoid uncessary warning message =
in
> dmesg (Lucas).
Please use  Suggested-by: <> tag to provide such credits.
Thanks,
Anshuman
>=20
> Fixes: c5a06c9169f3 ("drm/xe/guc: Enable WA 14018913170")
> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c in=
dex
> 576ff2c1fbb9..6fbeddc557af 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -174,7 +174,7 @@ static u32 guc_ctl_wa_flags(struct xe_guc *guc)
>  		if (GUC_VER(version->major, version->minor, version->patch) >=3D
> GUC_VER(70, 7, 0))
>  			flags |=3D GUC_WA_ENABLE_TSC_CHECK_ON_RC6;
>  		else
> -			drm_warn(&xe->drm, "can't apply WA 14018913170,
> GUC version expected >=3D 70.7.0, found %u %u %u\n",
> +			drm_dbg(&xe->drm, "can't apply WA 14018913170, GUC
> version expected
> +>=3D 70.7.0, found %u %u %u\n",
>  				 version->major, version->minor, version-
> >patch);
>  	}
>=20
> --
> 2.25.1

