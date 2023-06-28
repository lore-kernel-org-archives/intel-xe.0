Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08BF0EB64D7
	for <intel-xe@archiver.kernel.org>; Wed, 28 Jun 2023 09:52:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FB6910E0E4;
	Wed, 28 Jun 2023 09:52:02 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B9C010E0E4
 for <intel-xe@lists.freedesktop.org>; Wed, 28 Jun 2023 09:51:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1687945920; x=1719481920;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=fV3/QSYleROgC//JBk6DspaRa8ZoVm7N2KYtIhWhZuA=;
 b=Q9tv+joyIHDaWEltkYF7KWjNiHmokoijXakut9hpJPPqcIXrSlUGAeIP
 oly6QoOFolyUJmOhnvtcP7+fir0aXI5gpvtqkt81XqsA2AURiwg6huA3p
 kx4qmkVBB7Nj6/fU20RnRowVURH+oC/27gAovXmqkJ/KGR0qWXsv1D9UN
 4cRC0Vssq26rkE7b4SojecwKujoME8E8ZCIhMHdcwrVv7RUwf+OhvOyoQ
 Y1Evb166I1qrPEizfoNhpAjg0Jrikm5j+rnqVFFzq7YIuWOh8zkVeLL9C
 VUFXTYogQXs0vW7UngWg0ZzchWUj3BR26xMJ9qEmBT8ZxaMDDCjbmODbc w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10754"; a="364351008"
X-IronPort-AV: E=Sophos;i="6.01,165,1684825200"; d="scan'208";a="364351008"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jun 2023 02:51:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10754"; a="861456738"
X-IronPort-AV: E=Sophos;i="6.01,165,1684825200"; d="scan'208";a="861456738"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga001.fm.intel.com with ESMTP; 28 Jun 2023 02:51:58 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 28 Jun 2023 02:51:57 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 28 Jun 2023 02:51:57 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Wed, 28 Jun 2023 02:51:57 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.172)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Wed, 28 Jun 2023 02:51:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cadXcM79c/2y5bbsf9UzX6ioDO9acBw2pwbEipfvmQD/bCxRb0Aw8Wj7R21sf9Pk2KV9Pf71U2oAY4bMKidbnw0xYm4weYkF5Pe+bLC72SeS8LTN1xWSA5FG+Cexn+12Xy1lTzjtXXQGDM1HVx+96STxEdb9QrCuCxc3hsGBCeJPtnoEBMLJtPYndVlk+UAEd+ouwOCMD5YIKUw5ADLTe6B7QzM2zcQ+MG6DyE6wEkpOI/IJiOpuCeWV12r0uTyZrA15BRSfYTpvq46KYrhGhvFYZ+cm69jt5YmME7NK3QPFcUYqm41xyqGlMqI8/8jzFGWwwPfSLMKvNwaLCojAVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CyFiLiqMd/IGCpQx5szCyf0xx1RCCIr3IQ5/WonOh3U=;
 b=XrqIs+T7DwObuRwC0ciDdPTk5B52vlsEIVr0o4l97WtEQxafGamUkq6gelY+N2Q6tm1rulGWnGJXOj8lhNWp/2RpFEOZYZPtu3j3KH+eQY+l5WkQVhOuDDV6ubkWH8IvvNhZIEfIMnd9dNjSgfmfZBa6BysAMrMWvrDO8q/fjiNjsaXXZrb2E2cL7C5cxdSSXf8IsgtuGFqsWpgo9M4ohLc406ti7DOsPtDMRyHG7hgu/ClzMGk6aVlbRoqoW8kyfYRC3ckrZ4Rl9kdcOpcEhp0U8uq/C15maQ26VK0cZTuGyRVhqeQPvF+5GvUzCs1oPkPVwY7U1uf/96DhFLpP9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6211.namprd11.prod.outlook.com (2603:10b6:930:25::6)
 by CO1PR11MB4849.namprd11.prod.outlook.com (2603:10b6:303:90::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.26; Wed, 28 Jun
 2023 09:51:55 +0000
Received: from CY5PR11MB6211.namprd11.prod.outlook.com
 ([fe80::3cc2:6622:cce5:cd02]) by CY5PR11MB6211.namprd11.prod.outlook.com
 ([fe80::3cc2:6622:cce5:cd02%5]) with mapi id 15.20.6521.024; Wed, 28 Jun 2023
 09:51:55 +0000
From: "Gupta, Anshuman" <anshuman.gupta@intel.com>
To: "Auld, Matthew" <matthew.auld@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
Thread-Topic: [Intel-xe] [PATCH v12 08/13] drm/xe/display: use mem_access
 underneath
Thread-Index: AQHZqBwv3ecZkRanb0mQm/l/E8Ohzq+f9Zvw
Date: Wed, 28 Jun 2023 09:51:55 +0000
Message-ID: <CY5PR11MB621160E01D9FCB9B91E365149524A@CY5PR11MB6211.namprd11.prod.outlook.com>
References: <20230626105037.43780-15-matthew.auld@intel.com>
 <20230626105037.43780-23-matthew.auld@intel.com>
In-Reply-To: <20230626105037.43780-23-matthew.auld@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6211:EE_|CO1PR11MB4849:EE_
x-ms-office365-filtering-correlation-id: acfd0380-6874-4b59-7d20-08db77bd4ea0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: U2qJXWvoJ1CkNlH4NAEXfzEkr5uNegQiX8Z4o/rS3aNp7TXtkr5GL7ioNJWq6I6A2SilMTTBa5dVyUR+p1865EmsFjMOKNSN8iNjXPdTS25yP2+uP4HcHCsJZFe1HeRUpNEKTLIsi+XOF6bWTeoMecDNpdAh52Pzw/ayj0U6DQEjoYT8Q1mKtg8KU6chOH8/wn5EF+NYHBlYxcUsqYsvapANPTpk7xoNLPqNYQUJNYElWaxpcucl8k31HeQB4XcMdQ/pph+7ZR+M6teCM/U6m5z82oBYMa/G3Nm7mg4cntkqjKm5FKAWbXAnGerjz70m4EVU4fzwsrAkfE9paltSmd0ZIusgT3SZwcvDVkRdqUgitlvNUS88yy0tN+YpknNr/sCP/YJTXjD9lxNhl9sJWZp0gwiX5ekXtl/A8v7SlMtTDV2tg9bwsgXRvESA+n+wEskegPKq6NJmPbNUlA8ebi4RVBw0IkpW7Glpm6hEi9QINhLvtzt79a828dMngDnTwMgAMdTgxtyZKXTNzD/zRRXebls3k+/lS2VZOm15tAXblzJQo4DNrRVMPpZyLIZvhQ59ZldN115IeraLASvexTZaMwzzBVWzgO0jVb0ZfbEHKJnlHhhT0gs1XmZxK5Jg
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6211.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(136003)(346002)(366004)(396003)(376002)(451199021)(82960400001)(38100700002)(122000001)(38070700005)(83380400001)(33656002)(86362001)(8936002)(7696005)(110136005)(41300700001)(71200400001)(66556008)(66446008)(66946007)(64756008)(55016003)(76116006)(66476007)(8676002)(316002)(53546011)(26005)(9686003)(186003)(6506007)(478600001)(2906002)(5660300002)(52536014);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?2bTBW8pPsDkra6lXFUc7k76dgLqlM+qSx1fOTpLsA3lZd769w6dFz4MtFORZ?=
 =?us-ascii?Q?Ic6Lfn9cV02lr5AiH44TBE0/C7wEQm0/b1nQok+0Gp7f7VaSMOYcuMKKHI1D?=
 =?us-ascii?Q?e1VxPcddHDWjfeNuhYy/r3Q2LucfXy/ZrQhZBZIx64t6reTzu1phvSu31V+3?=
 =?us-ascii?Q?T5vHYM42bMH5/AnG4bnxKLYy7e7MgjDM18fL4ZL/laWb30sGJg7gKS8Uy+Qu?=
 =?us-ascii?Q?q/WRhDfbMd2j9cAE5ICx6AQtsZRdLfGcDVLeQVZLhXNDf5nkMnx138gNvMX8?=
 =?us-ascii?Q?moFVztxeusvl7GXBuhSDxKvxfHUu9VakzPhFHQ4mnGraJAn2s8/tIK3hgMyw?=
 =?us-ascii?Q?AXARhn/Z29QOfycmK9R/ROy3DpuWapHatOrTFQAJxxI7h4sXUZ123SVfHnKx?=
 =?us-ascii?Q?oDvhkCITjJ/FjebTxDr89cB0Sbw3IXKCb3QQXTsmfc6aaEEIUqBiCRVayL+A?=
 =?us-ascii?Q?M7hgxW38JqNXrxF3AN6Kxlnaa7S/RgvbVDrw5Brqbu5Vvl5IVeaEIiBY9oEQ?=
 =?us-ascii?Q?Nk/KgBBbC9P7TyO+h/D9Spr2qpmY9reAZU3EjyQysw0etDQSquRWeaCvy/sd?=
 =?us-ascii?Q?4KYELXMUcuib7GYWx1qvWIM3SHeN5GwIjE1bhA/kr5X+GGd1SIyrjTwv614O?=
 =?us-ascii?Q?MWmmimqMZhtnvTpC0I3txDuTNKNXFk0Nb2kk/0SCk8CyAqvOdIih0F3md8FD?=
 =?us-ascii?Q?qToujuSm3RoCLWInbIbKvXFIgpVBK55Liskywn+BP+iUjScoGqwgz3ABd0/e?=
 =?us-ascii?Q?+Ti0orlLvnl7aZZ3VHg97ayUvJoUiiLRYTMXfeNKjcHkjjc7eos6TeSVLsdY?=
 =?us-ascii?Q?sYAh8tEicPUoiQYTMpIdErm1p87Y12vYLeSdebkMxKq4eFo4km9d9fWD7kdT?=
 =?us-ascii?Q?7oKErZkzsi9qjj4jRkDBoDX7s44xpIDWuBeo0ujsQ+fq0TxPgXUZgNVsF1fC?=
 =?us-ascii?Q?u5JZH2aY26eQQNMozcdmioE+I84VEDBueZdvRNmSeLnnKf5jEzAA6/qL2jqh?=
 =?us-ascii?Q?BaPI6flaNvazDASgOIih/aH1Wqs86vxEu64aVM68Rl5uuExCZf12o5TRqA7x?=
 =?us-ascii?Q?Jzf1uz3htrOyZ3SxoIzTT7OLJHCXvsQWD7nlskYX52kWu60I+XWN/JgJTkup?=
 =?us-ascii?Q?x5GRoFIx+0HYByxEBiGIZbKiPDlrkvp0xq4IblRwP2QQJbp1yxawcKbFGGji?=
 =?us-ascii?Q?JYAG6XVtqOIjYIGokkRJS7XyqSJazgHpS9eXnZ04Ut5RJ/sZNZdToz7NOmLC?=
 =?us-ascii?Q?WjMxazwLVp0kj6iK7/0G1xQQ1mrPpfWbXAh9qJg3y5JDnWb0c8dpfFxUy3lJ?=
 =?us-ascii?Q?wc6OScmtcrdVG87TQ/AThwaAR1MnsSrPbKSaLA2WLC7Tylrl5c2/OUuYRbbc?=
 =?us-ascii?Q?Z/4NB7TwFtoL6T7QtzN8mVPAr/CCWeHk6bvCRB9EKD/H2wYwpT2gDuwBnoaJ?=
 =?us-ascii?Q?tG1EtkwS69sclDtVkdBE8EFVlovXYkq5hMObNkUT4Uad/Tit4VXJsn6eU3/7?=
 =?us-ascii?Q?Oa1uU96fZtZU7eRP7BfhML4dNHaenUu6X1m3ZpLhcSCzhIXNl6RVmSIM7thm?=
 =?us-ascii?Q?bTr/61l/kBp2sJxKVGrSBGAbSy0jr+9xQRGkQVBj?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6211.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: acfd0380-6874-4b59-7d20-08db77bd4ea0
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jun 2023 09:51:55.4317 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eenE69iOp5+y4lm0lbY4DpG7V6D1KtisEN/iJheLLisM9AVArkWq+EkIIZCKHC6oBrCTwTrDSYZ4CEqhQcB9BTk9+ld2JIxXxajLgMjbth0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4849
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v12 08/13] drm/xe/display: use mem_access
 underneath
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



> -----Original Message-----
> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of
> Matthew Auld
> Sent: Monday, June 26, 2023 4:21 PM
> To: intel-xe@lists.freedesktop.org
> Subject: [Intel-xe] [PATCH v12 08/13] drm/xe/display: use mem_access
> underneath
>=20
> There are places in the display code (i915) doing mmio access.
>=20
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> ---
>  drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h
> b/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h
> index 59bf1d4a61d6..7a43f3af1796 100644
> --- a/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h
> +++ b/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h
> @@ -151,6 +151,7 @@ static inline bool intel_runtime_pm_get(struct
> xe_runtime_pm *pm)
>  		xe_pm_runtime_put(xe);
>  		return false;
>  	}
> +	xe_device_mem_access_get(xe);
>  	return true;
>  }
>=20
> @@ -158,14 +159,14 @@ static inline bool
> intel_runtime_pm_get_if_in_use(struct xe_runtime_pm *pm)  {
>  	struct xe_device *xe =3D container_of(pm, struct xe_device,
> runtime_pm);
>=20
> -	return xe_pm_runtime_get_if_active(xe);
> +	return xe_device_mem_access_get_if_ongoing(xe);
>  }
>=20
>  static inline void intel_runtime_pm_put_unchecked(struct xe_runtime_pm
> *pm)  {
>  	struct xe_device *xe =3D container_of(pm, struct xe_device,
> runtime_pm);
>=20
> -	xe_pm_runtime_put(xe);
> +	xe_device_mem_access_put(xe);
This patch does not remove xe_pm_runtime_get() from intel_runtime_pm_get() =
but removes=20
xe_pm_runtime_put() here. It will be unbalanced dev usage_count.
Thanks,
Anshuman Gupta.
>  }
>=20
>  static inline void intel_runtime_pm_put(struct xe_runtime_pm *pm, bool
> wakeref)
> --
> 2.41.0

