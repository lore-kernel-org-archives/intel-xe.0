Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC0BFCDB483
	for <intel-xe@archiver.kernel.org>; Thu, 19 Oct 2023 06:57:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 842D810E488;
	Thu, 19 Oct 2023 06:57:29 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D7DF10E488
 for <intel-xe@lists.freedesktop.org>; Thu, 19 Oct 2023 06:57:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697698647; x=1729234647;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=lLwSm1g1kxhQV+uRpfdGvglBc4LTN+YlGXvUwzAnRkQ=;
 b=U6D0zT1+sNHPf5X6mEQ0Ro/UC/BcdTsNBB9T+pEGYSTQWbyI3n65eUWj
 mLsz3QZV9AEY7Hq8XJusRho8IAubKUy90kTV56Z2clGjSz0hdcm0Aytln
 dGfF/KgDXE2LTGqSwidRqaa98AX5Bostm0p0lC2bUNAoCNHjG3jsYHQJi
 WH8kk74CmmoM8gwXy7XCExzqObecrnKoZibj12AM4OGBl/0658iSbNH1d
 njAaDxEqQPIxVGvJS/e60VcElUQAKeY8xXU9Db67vRd3uNPwcBM8LjY7u
 O5BUX4lp17XymdC+JIFoEaU2vjHqJV1G6BfnJG8+20bTNwxmrhhT9iNIz w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10867"; a="371251860"
X-IronPort-AV: E=Sophos;i="6.03,236,1694761200"; d="scan'208";a="371251860"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2023 23:57:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10867"; a="880531697"
X-IronPort-AV: E=Sophos;i="6.03,236,1694761200"; d="scan'208";a="880531697"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Oct 2023 23:57:26 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 18 Oct 2023 23:57:25 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Wed, 18 Oct 2023 23:57:25 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Wed, 18 Oct 2023 23:57:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D4Arhtu39jtLxHA69uHj9Ou/OVqvNBxd2T9gaMAQWXLWnR9k8Ky052MFeqeNUDm0gRDlS/N+WbBV8wtTo8Tmnnx/mrV2t3MueHhqqwXj5lhnvR2cXwieyKGahWGhzg248fp2yNRtJF6nuRcoBVzA4wm5dtzPzqhHNagP1kCvfvvp+NxscHogT0aB1afQ7fwbX+3JlYEHp3hevMQD0R893JrrWj1bGTjYR7f3U1vdkrjTEH53sUK2lsl9W3YbTGsY4d6JrT/RxmrrQYFPeO7k1tP+5wswdFStATzgUDylBr5JW3soEwsl4wANMmxt1N1vzMZzrsGbZdUTo3z7qSeogA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PSlUm+/p8zKPLubM6wg/7pG7PSs8KRe26O7CzRWe9EQ=;
 b=CHyzThohm3APLZA3poDVIjF3jC4Lmv1ioPXPVgeZ2Qzwg1Ase1ir9HyqfQzV0wUQJfzCGxBzf05+XLRwbhVVu9iRrCdo/Q7vJeI/tqJTejSAKw/37khnTAWg3v2AoECjE2u22v1DJxF2jUMCMBM/qpIZPx92f2z+t93RAaP+BsGVBTxxzh2IBSIztGdfqoLVF27Bq6aJ+ekHzJC4XowUMHX3ty1JLXujfOgs+wUJG7PaMERawnrAAImXNPLLL82FPR9ChAMHxUFLWpjRCPSsyCn5h0hueuy0wIQnPy2HxOFwk8q8mO7NiOq64M1BdzTH/hNw8DDN5eXmAyFloDGCZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6211.namprd11.prod.outlook.com (2603:10b6:930:25::6)
 by MN2PR11MB4742.namprd11.prod.outlook.com (2603:10b6:208:26b::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.21; Thu, 19 Oct
 2023 06:57:20 +0000
Received: from CY5PR11MB6211.namprd11.prod.outlook.com
 ([fe80::413:a622:bff4:bdd6]) by CY5PR11MB6211.namprd11.prod.outlook.com
 ([fe80::413:a622:bff4:bdd6%4]) with mapi id 15.20.6907.025; Thu, 19 Oct 2023
 06:57:20 +0000
From: "Gupta, Anshuman" <anshuman.gupta@intel.com>
To: "Nilawar, Badal" <badal.nilawar@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Thread-Topic: [PATCH v2 3/3] drm/xe/hwmon: Expose power1_max_interval
Thread-Index: AQHaAfTCmdg9+SlsVECjbCZQQ2i/mbBQqOxg
Date: Thu, 19 Oct 2023 06:57:19 +0000
Message-ID: <CY5PR11MB621157098936EC2503E79BBC95D4A@CY5PR11MB6211.namprd11.prod.outlook.com>
References: <20231018190341.726098-1-badal.nilawar@intel.com>
 <20231018190341.726098-4-badal.nilawar@intel.com>
In-Reply-To: <20231018190341.726098-4-badal.nilawar@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6211:EE_|MN2PR11MB4742:EE_
x-ms-office365-filtering-correlation-id: 60987ae9-e499-48cc-325c-08dbd070a369
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ZEp0fdpPxdYsN267kEeB1oLELg4V7RCvPtzqI41KyFtG88fbJ8IpQxSh4eUcj4PA5sIjKD9Yg7+TTpjNu7fmMaSlTUHFVvyIa2c32IVf5I3soYt3JBLp6pp0k8cYaGoxqRgxxQaYRSbfGq+lJlv2G3dhLSMbE0/5vPSpln3+W5LeeD/dxbomeKMdPJTtvO7etYv0f51HhXWPu8S4wU6SHHlDrv0yZb9n1STmDF/00AeKSblHIPqxAiJA2t33+cmFqgaMEFFjf8zsBSNO/pB8y4H7aM0RRd8u25cfn3vutn389kVLEBpXqqXg6V1WHR0pgV8z5gTIVFu+IKJJKP3mPla3cuK79fmsI3xGZyVaDipHnEY2slLTCHkuUTuSbwWm0ntyJJ57nnhe5rV3FkMtD0UK4sIZyrDpuQ67v5PVL8+HKhBq7cU32QwYw9pHrRvSfsaV6Or+ig+1E9b19jTqMZhpL9QKDwG/KBZP2pa6v3CxC8ZKsrAs3oPJbquf0G7WuuIKVBdCAgd2vi+/n+xORcU4KVMUPvbHpXlsQtZceZ/O3I+c6gaMDHUQwyVZ6UYW9KrJeU14Vrxs0+pGa4XBnAk1N4JoPpBL/mFdOIGN+8m5BwslcAW1RZIaOVLscLoI
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6211.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(346002)(396003)(136003)(376002)(39860400002)(230922051799003)(451199024)(64100799003)(1800799009)(186009)(478600001)(71200400001)(55016003)(66899024)(76116006)(86362001)(66446008)(66476007)(316002)(82960400001)(64756008)(110136005)(54906003)(66946007)(66556008)(38070700005)(33656002)(41300700001)(52536014)(8936002)(38100700002)(4326008)(5660300002)(122000001)(2906002)(8676002)(9686003)(26005)(7696005)(83380400001)(53546011)(6506007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?okcLxu5bp7x01YyRPXXnggKDq95ZOAWo0Ge5LrPKnesu4X8NQwFWccRH5GYG?=
 =?us-ascii?Q?qNquw7FmULuthFXja9ffLMTcjqig22VmXY231Ab/AZapumGtfznYFlXdKmjX?=
 =?us-ascii?Q?1yb7S+pPEqTxbIJmEbx72rZaffaoArdAOklwTdtfbGy1m/PATnFmpHBNRLui?=
 =?us-ascii?Q?5hXaCQilbHzo8cpmDmrZQTmdDdJaPA/f3SoUA/TSRb79Ua6BtRFyfSr0CUH0?=
 =?us-ascii?Q?325gY44W49STBBwanrGoXj7yyh1FI/CsLDga4WKVuSmoclc2Dfss1Z2usHse?=
 =?us-ascii?Q?5WKOMJG03JTTTy3UMC7pASHjIM85M6PHWuCyjo9n1K9hEpg8L/rPyY02TshE?=
 =?us-ascii?Q?AyZmojGA552cqw7nqOftAGvxqM8K6jfNXeUg39y0pgpjmQtZZ1I5QA8o3UKB?=
 =?us-ascii?Q?DCVTZDVS+v+IGxV9V0jnsUDKo5lAWgIUdPSG0GmjLHA0RsPRxLSaDyURrmIn?=
 =?us-ascii?Q?IpJx0FOfkKu9pPrbj0xUmwZQ+7v4jJpyX266N1H4Bz0aYkezF0RSK7OOOcQ7?=
 =?us-ascii?Q?wyDmAyglucanjT4aGtGX4rf38lK/UtkoFO1vQrnZStgCtaXxQ0QJ5hZ0GLbs?=
 =?us-ascii?Q?4I9kW79oLqcdn/YWZGok1W49HLIwvqwy51R2E8hKsAJn89YLe7fAAZZDrdTD?=
 =?us-ascii?Q?AZvkCkPJP3Rso5afpzoRLUrO9uIABDBtmi8izuXdk9FcuWAIdz0XEQF93cQh?=
 =?us-ascii?Q?b2e9K4LAAYJm7IPIPId3HLhkU8dkG7ME59G3Sou7XWEw2aGeBkO76Hwpn7IJ?=
 =?us-ascii?Q?bw+3DpSa8m4EiyGMhbNqzn+m+/T8pJJTsHDI/w4cm5g9uczrBrRlIeSwOoOX?=
 =?us-ascii?Q?/FwCmAIKgXdVsWOvi125DBWL9+GeV0FROvdeefu1CgKbdetVqw5QNCGNzHsD?=
 =?us-ascii?Q?LNCodbppnr1hgyQ+EjTXl8PylEPoXhARlPQBi7FRpsa9EtsS7uj44gwNXZw/?=
 =?us-ascii?Q?m5kGrQxGMd2HRoyRLszLVfA2ST8m3Wzzjc4kzGGRpjZBc/PEQlsntcjrp0qI?=
 =?us-ascii?Q?StLiI5sahngOzFRfWMFY/H/KHKtAnlRxtZBCo5eyuwTOv61qkq6arPyQIxhV?=
 =?us-ascii?Q?SBb9VyOhPo/N7IhswFFUdilGGS/5/pexmSMDTEFl0dkqinubY4n8Y6TX3jkf?=
 =?us-ascii?Q?9xFeLGnE9I/fMshhFdblwF1Yf0ZxVnw9pTQ8GevE995U7Ct1LH6s20gRGUiF?=
 =?us-ascii?Q?kVqeb2KpWybU0rSjubiV/j7493bn8SJHIbb279yiCjFw5sN3fkez4ymF/S+Y?=
 =?us-ascii?Q?m0fRi5lEQNNPk259BzY1nPZ85hue4jObFzUhL3WA9Z9SDbd3xAykOjIAHnHV?=
 =?us-ascii?Q?6TELcVc6nmvBdYHgiwyeib2G1LouvrcsR8m2Rt6UUyP3F/JfpY+NoL0SPCci?=
 =?us-ascii?Q?Ta9H66/tUuuACh8nkayldxH8IY3PCDLwrY1UFQV5BSQrXd3qGYwyTUXqCwDt?=
 =?us-ascii?Q?ouyS5077vass6a3R3V5jXfQTxjLCCm6rwEyz0OcBQsI7QzWRRg1uCSKxOv+r?=
 =?us-ascii?Q?RapffbSIqrp6stGbIsslSmHCft7pXcRH5wmN5bZnh+KO7wJM7TEIN56wv8YL?=
 =?us-ascii?Q?IHDr1cF0vVqmxdFJDtJxqEnHncZdMw1uz5RoRd7s?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6211.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 60987ae9-e499-48cc-325c-08dbd070a369
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Oct 2023 06:57:19.9254 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nmCvNK581TVkJljplIVAXxdV+GOQhkXvSqvCvuA9vpCb3hurzI8IBQdfmhsL2K75K3DVjuQ6IK82+NHNkZRQfocYEGEaHoLMLy0UN2EcU5Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4742
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 3/3] drm/xe/hwmon: Expose
 power1_max_interval
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
Cc: "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>



> -----Original Message-----
> From: Nilawar, Badal <badal.nilawar@intel.com>
> Sent: Thursday, October 19, 2023 12:34 AM
> To: intel-xe@lists.freedesktop.org
> Cc: Gupta, Anshuman <anshuman.gupta@intel.com>; Dixit, Ashutosh
> <ashutosh.dixit@intel.com>; andi.shyti@linux.intel.com; Tauro, Riana
> <riana.tauro@intel.com>; Vivi, Rodrigo <rodrigo.vivi@intel.com>
> Subject: [PATCH v2 3/3] drm/xe/hwmon: Expose power1_max_interval
>=20
> Expose power1_max_interval, that is the tau corresponding to PL1, as a
> custom hwmon attribute. Some bit manipulation is needed because of the
> format of PKG_PWR_LIM_1_TIME in PACKAGE_RAPL_LIMIT register (1.x *
> power(2,y))
>=20
> v2: Get rpm wake ref while accessing power1_max_interval
> v3: %s/hwmon/xe_hwmon/
> v4:
>  - As power1_max_interval is rw attr take lock in read function as well
>  - Refine comment about val to fix point conversion (Andi)
>  - Update kernel version and date in doc
> v5:
>  - Fix review comments (Anshuman)
>=20
> Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
> ---
>  .../ABI/testing/sysfs-driver-intel-xe-hwmon   |   9 ++
>  drivers/gpu/drm/xe/regs/xe_mchbar_regs.h      |   8 +
>  drivers/gpu/drm/xe/xe_hwmon.c                 | 149 +++++++++++++++++-
>  3 files changed, 165 insertions(+), 1 deletion(-)
>=20
> diff --git a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
> b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
> index 1a7a6c23e141..8c321bc9dc04 100644
> --- a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
> +++ b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
> @@ -59,3 +59,12 @@ Contact:	intel-xe@lists.freedesktop.org
>  Description:	RO. Energy input of device in microjoules.
>=20
>  		Only supported for particular Intel xe graphics platforms.
> +
> +What:		/sys/devices/.../hwmon/hwmon<i>/power1_max_interval
> +Date:		October 2023
> +KernelVersion:	6.6
> +Contact:	intel-xe@lists.freedesktop.org
> +Description:	RW. Sustained power limit interval (Tau in PL1/Tau) in
> +		milliseconds over which sustained power is averaged.
> +
> +		Only supported for particular Intel xe graphics platforms.
> diff --git a/drivers/gpu/drm/xe/regs/xe_mchbar_regs.h
> b/drivers/gpu/drm/xe/regs/xe_mchbar_regs.h
> index d8ecbe1858d1..519dd1067a19 100644
> --- a/drivers/gpu/drm/xe/regs/xe_mchbar_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_mchbar_regs.h
> @@ -22,15 +22,23 @@
>  #define   PKG_TDP				GENMASK_ULL(14, 0)
>  #define   PKG_MIN_PWR				GENMASK_ULL(30,
> 16)
>  #define   PKG_MAX_PWR				GENMASK_ULL(46,
> 32)
> +#define   PKG_MAX_WIN				GENMASK_ULL(54,
> 48)
> +#define     PKG_MAX_WIN_X			GENMASK_ULL(54, 53)
> +#define     PKG_MAX_WIN_Y			GENMASK_ULL(52, 48)
> +
>=20
>  #define PCU_CR_PACKAGE_POWER_SKU_UNIT
> 	XE_REG(MCHBAR_MIRROR_BASE_SNB + 0x5938)
>  #define   PKG_PWR_UNIT				REG_GENMASK(3, 0)
>  #define   PKG_ENERGY_UNIT			REG_GENMASK(12, 8)
> +#define   PKG_TIME_UNIT				REG_GENMASK(19,
> 16)
>=20
>  #define PCU_CR_PACKAGE_ENERGY_STATUS
> 	XE_REG(MCHBAR_MIRROR_BASE_SNB + 0x593c)
>=20
>  #define PCU_CR_PACKAGE_RAPL_LIMIT
> 	XE_REG(MCHBAR_MIRROR_BASE_SNB + 0x59a0)
>  #define   PKG_PWR_LIM_1				REG_GENMASK(14,
> 0)
>  #define   PKG_PWR_LIM_1_EN			REG_BIT(15)
> +#define   PKG_PWR_LIM_1_TIME			REG_GENMASK(23,
> 17)
> +#define   PKG_PWR_LIM_1_TIME_X			REG_GENMASK(23,
> 22)
> +#define   PKG_PWR_LIM_1_TIME_Y			REG_GENMASK(21,
> 17)
>=20
>  #endif /* _XE_MCHBAR_REGS_H_ */
> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c
> b/drivers/gpu/drm/xe/xe_hwmon.c index c87d028f1955..661d5269fb5b
> 100644
> --- a/drivers/gpu/drm/xe/xe_hwmon.c
> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
> @@ -38,6 +38,7 @@ enum xe_hwmon_reg_operation {
>  #define SF_CURR		1000		/* milliamperes */
>  #define SF_VOLTAGE	1000		/* millivolts */
>  #define SF_ENERGY	1000000		/* microjoules */
> +#define SF_TIME		1000		/* milliseconds */
>=20
>  struct xe_hwmon_energy_info {
>  	u32 reg_val_prev;
> @@ -50,6 +51,7 @@ struct xe_hwmon {
>  	struct mutex hwmon_lock; /* For rw attributes */
>  	int scl_shift_power;
>  	int scl_shift_energy;
> +	int scl_shift_time;
>  	struct xe_hwmon_energy_info ei;	/*  Energy info for
> energy1_input */
>  };
>=20
> @@ -239,6 +241,149 @@ xe_hwmon_energy_get(struct xe_hwmon
> *hwmon, long *energy)
>  				  hwmon->scl_shift_energy);
>  }
>=20
> +static ssize_t
> +xe_hwmon_power1_max_interval_show(struct device *dev, struct
> device_attribute *attr,
> +				  char *buf)
> +{
> +	struct xe_hwmon *hwmon =3D dev_get_drvdata(dev);
> +	u32 x, y, x_w =3D 2; /* 2 bits */
> +	u64 r, tau4, out;
> +
> +	xe_device_mem_access_get(gt_to_xe(hwmon->gt));
> +
> +	mutex_lock(&hwmon->hwmon_lock);
> +
> +	xe_hwmon_process_reg(hwmon, REG_PKG_RAPL_LIMIT,
> +			     REG_READ32, &r, 0, 0);
> +
> +	mutex_unlock(&hwmon->hwmon_lock);
> +
> +	xe_device_mem_access_put(gt_to_xe(hwmon->gt));
> +
> +	x =3D REG_FIELD_GET(PKG_PWR_LIM_1_TIME_X, r);
> +	y =3D REG_FIELD_GET(PKG_PWR_LIM_1_TIME_Y, r);
> +
> +	/*
> +	 * tau =3D 1.x * power(2,y), x =3D bits(23:22), y =3D bits(21:17)
> +	 *     =3D (4 | x) << (y - 2)
> +	 *
> +	 * Here (y - 2) ensures a 1.x fixed point representation of 1.x
> +	 * As x is 2 bits so 1.x can be 1.0, 1.25, 1.50, 1.75
> +	 *
> +	 * As y can be < 2, we compute tau4 =3D (4 | x) << y
> +	 * and then add 2 when doing the final right shift to account for units
> +	 */
> +	tau4 =3D ((1 << x_w) | x) << y;
> +
> +	/* val in hwmon interface units (millisec) */
> +	out =3D mul_u64_u32_shr(tau4, SF_TIME, hwmon->scl_shift_time +
> x_w);
> +
> +	return sysfs_emit(buf, "%llu\n", out); }
> +
> +static ssize_t
> +xe_hwmon_power1_max_interval_store(struct device *dev, struct
> device_attribute *attr,
> +				   const char *buf, size_t count)
> +{
> +	struct xe_hwmon *hwmon =3D dev_get_drvdata(dev);
> +	u32 x, y, rxy, x_w =3D 2; /* 2 bits */
> +	u64 tau4, r, max_win;
> +	unsigned long val;
> +	int ret;
> +
> +	ret =3D kstrtoul(buf, 0, &val);
> +	if (ret)
> +		return ret;
> +
> +	/*
> +	 * Max HW supported tau in '1.x * power(2,y)' format, x =3D 0, y =3D 0x=
12
> +	 * The hwmon->scl_shift_time default of 0xa results in a max tau of
> 256 seconds
"Add . full stop above"
> +	 * For DG2, PVC PKG_PWR_SKU does not show valid PKG_MAX_WIN
> so going with default
I think we need something like below, you can format that as code comment.
"Ideally we should have read PKG_MAX_WIN  from PKG_PWR_SKU register but our=
 discrete GPU
does not provide the correct value, therefore using the default constant va=
lue, future discrete GPU
should fix that and  we should read the PKG_MAX_WIN  from  PKG_PWR_SKU "
With that.
Reviewed-by: Anshuman Gupta <anshuman.gupta@intel.com>
" "
> +	 * For future platforms this limitation may get addressed.
> +	 */
> +#define PKG_MAX_WIN_DEFAULT 0x12ull
> +
> +	/*
> +	 * val must be < max in hwmon interface units. The steps below are
> +	 * explained in xe_hwmon_power1_max_interval_show()
> +	 */
> +	r =3D FIELD_PREP(PKG_MAX_WIN, PKG_MAX_WIN_DEFAULT);
> +	x =3D REG_FIELD_GET(PKG_MAX_WIN_X, r);
> +	y =3D REG_FIELD_GET(PKG_MAX_WIN_Y, r);
> +	tau4 =3D ((1 << x_w) | x) << y;
> +	max_win =3D mul_u64_u32_shr(tau4, SF_TIME, hwmon->scl_shift_time
> + x_w);
> +
> +	if (val > max_win)
> +		return -EINVAL;
> +
> +	/* val in hw units */
> +	val =3D DIV_ROUND_CLOSEST_ULL((u64)val << hwmon->scl_shift_time,
> +SF_TIME);
> +
> +	/*
> +	 * Convert val to 1.x * power(2,y)
> +	 * y =3D ilog2(val)
> +	 * x =3D (val - (1 << y)) >> (y - 2)
> +	 */
> +	if (!val) {
> +		y =3D 0;
> +		x =3D 0;
> +	} else {
> +		y =3D ilog2(val);
> +		x =3D (val - (1ul << y)) << x_w >> y;
> +	}
> +
> +	rxy =3D REG_FIELD_PREP(PKG_PWR_LIM_1_TIME_X, x) |
> +REG_FIELD_PREP(PKG_PWR_LIM_1_TIME_Y, y);
> +
> +	xe_device_mem_access_get(gt_to_xe(hwmon->gt));
> +
> +	mutex_lock(&hwmon->hwmon_lock);
> +
> +	xe_hwmon_process_reg(hwmon, REG_PKG_RAPL_LIMIT,
> REG_RMW32, (u64 *)&r,
> +			     PKG_PWR_LIM_1_TIME, rxy);
> +
> +	mutex_unlock(&hwmon->hwmon_lock);
> +
> +	xe_device_mem_access_put(gt_to_xe(hwmon->gt));
> +
> +	return count;
> +}
> +
> +static SENSOR_DEVICE_ATTR(power1_max_interval, 0664,
> +			  xe_hwmon_power1_max_interval_show,
> +			  xe_hwmon_power1_max_interval_store, 0);
> +
> +static struct attribute *hwmon_attributes[] =3D {
> +	&sensor_dev_attr_power1_max_interval.dev_attr.attr,
> +	NULL
> +};
> +
> +static umode_t xe_hwmon_attributes_visible(struct kobject *kobj,
> +					   struct attribute *attr, int index) {
> +	struct device *dev =3D kobj_to_dev(kobj);
> +	struct xe_hwmon *hwmon =3D dev_get_drvdata(dev);
> +	int ret =3D 0;
> +
> +	xe_device_mem_access_get(gt_to_xe(hwmon->gt));
> +
> +	if (attr =3D=3D &sensor_dev_attr_power1_max_interval.dev_attr.attr)
> +		ret =3D xe_hwmon_get_reg(hwmon, REG_PKG_RAPL_LIMIT) ?
> attr->mode : 0;
> +
> +	xe_device_mem_access_put(gt_to_xe(hwmon->gt));
> +
> +	return ret;
> +}
> +
> +static const struct attribute_group hwmon_attrgroup =3D {
> +	.attrs =3D hwmon_attributes,
> +	.is_visible =3D xe_hwmon_attributes_visible, };
> +
> +static const struct attribute_group *hwmon_groups[] =3D {
> +	&hwmon_attrgroup,
> +	NULL
> +};
> +
>  static const struct hwmon_channel_info *hwmon_info[] =3D {
>  	HWMON_CHANNEL_INFO(power, HWMON_P_MAX |
> HWMON_P_RATED_MAX | HWMON_P_CRIT),
>  	HWMON_CHANNEL_INFO(curr, HWMON_C_CRIT), @@ -555,6
> +700,7 @@ xe_hwmon_get_preregistration_info(struct xe_device *xe)
>  				     REG_READ32, &val_sku_unit, 0, 0);
>  		hwmon->scl_shift_power =3D REG_FIELD_GET(PKG_PWR_UNIT,
> val_sku_unit);
>  		hwmon->scl_shift_energy =3D
> REG_FIELD_GET(PKG_ENERGY_UNIT, val_sku_unit);
> +		hwmon->scl_shift_time =3D REG_FIELD_GET(PKG_TIME_UNIT,
> val_sku_unit);
>  	}
>=20
>  	/*
> @@ -601,7 +747,8 @@ void xe_hwmon_register(struct xe_device *xe)
>  	/*  hwmon_dev points to device hwmon<i> */
>  	hwmon->hwmon_dev =3D
> devm_hwmon_device_register_with_info(dev, "xe", hwmon,
>=20
> 	&hwmon_chip_info,
> -								NULL);
> +
> 	hwmon_groups);
> +
>  	if (IS_ERR(hwmon->hwmon_dev)) {
>  		drm_warn(&xe->drm, "Failed to register xe hwmon (%pe)\n",
> hwmon->hwmon_dev);
>  		xe->hwmon =3D NULL;
> --
> 2.25.1

