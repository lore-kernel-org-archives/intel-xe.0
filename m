Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FB21EE4996
	for <intel-xe@archiver.kernel.org>; Mon, 21 Aug 2023 13:26:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E130210E253;
	Mon, 21 Aug 2023 13:26:01 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C33F10E253
 for <intel-xe@lists.freedesktop.org>; Mon, 21 Aug 2023 13:26:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692624360; x=1724160360;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=d7GP2aO9jvhLy2/nDoNrUvPjR7IceCtkXWHfnSyhxSc=;
 b=ODU9HDmliZKQZRB03IEnuTOa/fvHSUngypv9y1cJmG/3Tc2dfuheA0WI
 +eT5mRWOkJy8iXWfQoCUArGPCHzW0L6xnqujT2LfTR2Oita9Xb8X686XX
 OunDJ/oO0MRVCGXVPW/zCtUiOOeXNGxAKujgnyRVvrBTrrIG/s1Q2BUua
 HTWDWkikX0S7zNET0GgcVSwNAxbYcvo+4a6DC8OROk2JxB6g67LaXFFs0
 nOBt9EIgKgPhKn2Ja6wTGC9bzS+pPxN3/OGgagFDk3X2dFT7XWB+Suk5p
 PAj4ESHrAXFHqpoLjKT4ebsWwASFMDx7q0TMP3RZ9hM6e7WP//XI5Sila A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="358568751"
X-IronPort-AV: E=Sophos;i="6.01,190,1684825200"; d="scan'208";a="358568751"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2023 06:25:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="801274973"
X-IronPort-AV: E=Sophos;i="6.01,190,1684825200"; d="scan'208";a="801274973"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga008.fm.intel.com with ESMTP; 21 Aug 2023 06:25:55 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 21 Aug 2023 06:25:49 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Mon, 21 Aug 2023 06:25:49 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.177)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Mon, 21 Aug 2023 06:25:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M/g0xgndEWjvSLt7qWq9riHaf/1TqXMWpmwnIyBomaEaCbGs9vVnsJDV8Zof0CCxXtXPkPkqXPE/ftO01+WfTdMDiARZGmFRBRFcn8X1MhTWiPffchHxbhR7m060N++nZNIIY6Bu2wLYt5+G7VCkDkFwgB0p3+MsUDFXWKY7ADWKHPCaNkZi1MnGegOLQpyADwO+GnqyEiQh//UqQUbHr2KykUa4TfPlxnv4LDmTOPaXfRWPQX4xiXZs2yrxi0Wkvv/7qVYAaA15Hz282JKxxmO2DNUwxRaGwBnE63oMUIpUvaRE6JPedjhUkROGZo8Fj42z29icxNcL3tI5xK20Nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cbvxxs3HTbZds0JhNHeMi2WMEh6qB0Np8DYYsRwdjOc=;
 b=YTmsaZjFQ76Pw67WfjOM8CrP0+Gs1nXjmI/GSYAvo6io9UGdZw9rEX3YCHx0yWkyz8G+BMOrfb/oHETrIa/3ZLRBMdcCq7u8UOBmtDBdIcnwQs2n+80vz4kuEIqUYggf50+EuAXvhub8eF87gwYbYNbsRlAwIKtUzeElcUJaLOhi2EM+d3h4SSfHupAEIxosU3ZCbuHjoCESi3C03oxgZ7qEINmElJjaTOzSUCLWXv2My4lQX1d9Q9TbuTFZFG8qNvBjHQpnVOIaIb+u5CKo9tnepdTVBKxFTCmkWha1nBP9dqxaPI8P0vsIPDv7VCnVWQVY2HhbH2OeUsXtyRMdQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6211.namprd11.prod.outlook.com (2603:10b6:930:25::6)
 by DM4PR11MB5568.namprd11.prod.outlook.com (2603:10b6:5:388::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.24; Mon, 21 Aug
 2023 13:25:47 +0000
Received: from CY5PR11MB6211.namprd11.prod.outlook.com
 ([fe80::bddf:185b:23c:241]) by CY5PR11MB6211.namprd11.prod.outlook.com
 ([fe80::bddf:185b:23c:241%7]) with mapi id 15.20.6699.022; Mon, 21 Aug 2023
 13:25:47 +0000
From: "Gupta, Anshuman" <anshuman.gupta@intel.com>
To: "Sundaresan, Sujaritha" <sujaritha.sundaresan@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Roper,
 Matthew D" <matthew.d.roper@intel.com>
Thread-Topic: [Intel-xe] [PATCH 2/2] drm/xe: Sysfs entries to query vram fused
 min, max frequency
Thread-Index: AQHZ1Ca2LVXliAMU302c1FJLney3Da/0u7Ug
Date: Mon, 21 Aug 2023 13:25:47 +0000
Message-ID: <CY5PR11MB6211DF74573ECBDF8E290CBA951EA@CY5PR11MB6211.namprd11.prod.outlook.com>
References: <20230821120728.3871527-1-sujaritha.sundaresan@intel.com>
 <20230821120728.3871527-3-sujaritha.sundaresan@intel.com>
In-Reply-To: <20230821120728.3871527-3-sujaritha.sundaresan@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6211:EE_|DM4PR11MB5568:EE_
x-ms-office365-filtering-correlation-id: 38c89751-6d41-4d43-fa52-08dba24a2142
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: i3f7kuCqCMSsZFjfXBXbuOq5T0kMgWuFd3zQAgR5npzzeaSAcnUqVXfuwECMfmap/edkXTE2qYt+AAezE5jCX901qo1cv/7x0vcQtaBH4EvBMmhS98rSSDixd16lRu1gPsu1q9JaU7/f3ceQ5rduUDvSFlX7emg2gXAo4pSJu3tjeNJXzHyeuVhwYpFaBQjGwLxQ9Aul2mKjNrtftVz+K2xVqUe2cvVOHGHPlpAt65mLM82qy4v2ihoq5Sc+FaJldMEwy3jEKPxXAK9SmrhvrpFuSlzHj/35VpIEwrT9HB29WkederQEfiZZ4LbhsuoTzD0epsdRUS66U859yEt8Y/TlIe4exJQMkHFVq0N8IaIinyIGNVlP4Y1A42HPjYsvyJ/YX87NKqr5q6FDmxtQz8RvSgK92vlgIBh4v7OBWWwI4SMy8MVICZQkHtR30UmTAYp/YzXLrgmL9GQmLgeOesIQCyKDo8ju8P1L3rbaWvMf/Q09nVT2zt5WK4talng7P/viGzm4OiIXHMiTqor1gI6Nhgo9vCBjm59b7qGst5tGjwJZPInzcng9cJaFmp4c3107mp2OxtQTyEIMD9GULzVHFKS7qFOQJT9vveu3hbVHJIqVZHJyicv6jejEbLja
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6211.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(396003)(39860400002)(376002)(366004)(346002)(186009)(1800799009)(451199024)(66446008)(6636002)(64756008)(76116006)(66556008)(66946007)(66476007)(316002)(9686003)(82960400001)(110136005)(8936002)(8676002)(4326008)(107886003)(41300700001)(122000001)(478600001)(71200400001)(55016003)(38070700005)(7696005)(38100700002)(53546011)(6506007)(2906002)(83380400001)(86362001)(5660300002)(33656002)(26005)(52536014);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?k3rFBRj8CKd9nJ1HFKQVv28BUZ54rCxQfQmQ3m73XjOKE5DyHVe9Ik77HDY5?=
 =?us-ascii?Q?qnrBw6HIo6q9RJCowwcHlZXvw1+VsW7DB6HD5sUMNvMUcFi9/46G1z4MCRPd?=
 =?us-ascii?Q?W0IgjynWsQ2dWjJ9LguxX1+J2ZE0CFsCPo1iHAVEtzKaxWVzqyM22nvImjvm?=
 =?us-ascii?Q?ogcgVTXnt6qfpF2iK1QfbfM2iVNoEq+QbmQZhUBwoBXbjDIRDjDO9FEHhFj1?=
 =?us-ascii?Q?QERVhcvFSDsJZLUk7LwzriHxOm99rnLDXD9a8gYk9byERqLaXxBS5t70VVey?=
 =?us-ascii?Q?C5zA3+J78YI9W5EJayJMEl3eYzYXhawMEciF77EHig9uqAsMyC8d3FVv9XD5?=
 =?us-ascii?Q?mgP4/WgvytZp8pl4iRFdwueCJe2xj0eVJ09B7TxQbOy/uQ0y1cWOhI73xJIy?=
 =?us-ascii?Q?suzn2lznmscfxaV/n4tFuvtTOsiLdq6CTsz/ne+Dcp21VeZzodi5sOGxRZti?=
 =?us-ascii?Q?HDs81SAY/XqSIP3eXdzfuweVMLi2liQOnRFnpgUJPDewImgLw5yWDaXeGeD1?=
 =?us-ascii?Q?Kx0XBJmmIC585dNPbBWIaZsB23oOPJexA/yC/SaBQzQWiYt+b+NgQUPOct8C?=
 =?us-ascii?Q?YrCf6rAvbwvmfRY86/D1TlXMEaZ2vKB2UMQV01XjYATWeQr+2TSZtRDE/9JB?=
 =?us-ascii?Q?XbNyPWmIoIVHwrLWVXpchl4+jEeeSWBYVlvzhw7p18egwdlEZoW2oey7MsTX?=
 =?us-ascii?Q?lp6JPubl3/6Pwgm1PQd8uyr/OBYUqGCI+cEgvDmplMJiU3b+5tDU+NUnxOwj?=
 =?us-ascii?Q?mfvsW7OFbFxL3rybv+tferogRGZt+1A47krQIrqba2NpQXDUo+Qta3yb/BCI?=
 =?us-ascii?Q?0iRGCZ/6N+yAFjAIeoT3483laOv8UHBCFtj4B5Q0N6hblO9UeJzwdEpQtvBH?=
 =?us-ascii?Q?O4AuTG8+CYPfIeEULQndn9PLagt6PtDgPKE59DYccAH16GfwJQG6x8l9s1yi?=
 =?us-ascii?Q?tG6FlQKtx8mdFZERY4/LB1yrVNWtp9fIJPGnpyvSFfLlHtGMjcWWDh84w8tF?=
 =?us-ascii?Q?ALv/dBiRKNhBCWMOyYpUVqiv3qACyQftOX/ouPiMqllb6hcBY3qVKjDl1YP6?=
 =?us-ascii?Q?ys9qzQLaRFm+QFd58mmpbC+AUretb7W0w4E5SV2hW1KjmJ0R4IDpnoACq7Wo?=
 =?us-ascii?Q?Hs2193yCMB7nXU2hlUIleiH/WZtF7ZW9U4iY2CtRiguVRNrIUoz6dcCarLv3?=
 =?us-ascii?Q?Dg1odA2BGzQ7hNIrVcif8JfFZdw1fmYTKYof4o7ZS3tgNRlu5ttrfpEGvPaM?=
 =?us-ascii?Q?kYKlvVMZMFIIW5JpRLhs6oDS6YD+xqkARujhDVxEamZOXenhw1S317yE6c3j?=
 =?us-ascii?Q?KP01XBdhJ87SKawD2Up1prD2PYeGRuCNejfhF77as2oGivLAJTKefqc8glIC?=
 =?us-ascii?Q?+MQ9Gc9+nkl46Bb3RITnvuGioGj+Jv7e6Itvyqfr6VBhKv/xOlXGMFqPcgBT?=
 =?us-ascii?Q?DbVtDmTD7cgqunC5ztVEY32gbElCXDgpQyMj5Hz9X3Y6wtZN/Qr1bA2a7gQI?=
 =?us-ascii?Q?42B65LoqNesHzqdH8BlmIk/9f7ci2VxHEj12THIYRkGV/HXA6gizOAmqcvoK?=
 =?us-ascii?Q?3NZWPi5OBmCcnlhAHS4pqaOmKhob6uhfSlRRITbc?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6211.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 38c89751-6d41-4d43-fa52-08dba24a2142
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Aug 2023 13:25:47.2151 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gBatq4jKMPT3mvy69r7kxNOLrjIlSn/PbK/d/UZcfV1bLFgc80yeAl0CHukXYT/+Lb/DqqToaHDmm7N7hkO6kFpdzv/UxWaZmqwrDjibgt4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5568
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 2/2] drm/xe: Sysfs entries to query vram
 fused min, max frequency
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
Cc: "Sundaresan, Sujaritha" <sujaritha.sundaresan@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>



> -----Original Message-----
> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of
> Sujaritha Sundaresan
> Sent: Monday, August 21, 2023 5:37 PM
> To: intel-xe@lists.freedesktop.org
> Cc: Sundaresan, Sujaritha <sujaritha.sundaresan@intel.com>
> Subject: [Intel-xe] [PATCH 2/2] drm/xe: Sysfs entries to query vram fused
> min, max frequency
>=20
> Add sysfs entries to query fused min and max frequency of vram
>=20
> Signed-off-by: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc_pc.c    | 55
> +++++++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_pcode_api.h |  8 +++++
>  2 files changed, 63 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c
> b/drivers/gpu/drm/xe/xe_guc_pc.c index c03bb58e7049..d7e9609c74c0
> 100644
> --- a/drivers/gpu/drm/xe/xe_guc_pc.c
> +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
> @@ -20,6 +20,7 @@
>  #include "xe_map.h"
>  #include "xe_mmio.h"
>  #include "xe_pcode.h"
> +#include "xe_pcode_api.h"
>=20
>  #define MCHBAR_MIRROR_BASE_SNB	0x140000
>=20
> @@ -568,6 +569,54 @@ static ssize_t freq_max_store(struct device *dev,
> struct device_attribute *attr,  }  static DEVICE_ATTR_RW(freq_max);
>=20
> +static ssize_t freq_vram_rp0_show(struct device *dev, struct
> device_attribute *attr,
> +				  char *buff)
> +{
> +	struct xe_guc_pc *pc =3D dev_to_pc(dev);
> +	struct xe_gt *gt =3D pc_to_gt(pc);
> +	u32 val;
> +	int err;
> +
> +	err =3D xe_pcode_read_p(gt, XEHP_PCODE_FREQUENCY_CONFIG,
> +			      PCODE_MBOX_FC_SC_READ_FUSED_P0,
> +			      PCODE_MBOX_DOMAIN_HBM, &val);
> +	if (err)
> +		return err;
> +
> +	/* data_out - Fused P0 for domain ID in units of 50 MHz */
> +	val *=3D GT_FREQUENCY_MULTIPLIER;
> +
> +	return sysfs_emit(buff, "%u\n", val);
> +}
> +static DEVICE_ATTR_RO(freq_vram_rp0);
> +
> +static ssize_t freq_vram_rpn_show(struct device *dev, struct
> device_attribute *attr,
> +				  char *buff)
> +{
> +	struct xe_guc_pc *pc =3D dev_to_pc(dev);
> +	struct xe_gt *gt =3D pc_to_gt(pc);
> +	u32 val;
> +	int err;
> +
> +	err =3D xe_pcode_read_p(gt, XEHP_PCODE_FREQUENCY_CONFIG,
> +			      PCODE_MBOX_FC_SC_READ_FUSED_PN,
> +			      PCODE_MBOX_DOMAIN_HBM, &val);
> +	if (err)
> +		return err;
> +
> +	/* data_out - Fused P0 for domain ID in units of 50 MHz */
> +	val *=3D GT_FREQUENCY_MULTIPLIER;
> +
> +	return sysfs_emit(buff, "%u\n", val);
> +}
> +static DEVICE_ATTR_RO(freq_vram_rpn);
> +
> +static const struct attribute *vram_freq_attrs[] =3D {
> +	&dev_attr_freq_vram_rp0.attr,
> +	&dev_attr_freq_vram_rpn.attr,
> +	NULL
> +};
> +
>  /**
>   * xe_guc_pc_c_status - get the current GT C state
>   * @pc: XE_GuC_PC instance
> @@ -921,6 +970,12 @@ int xe_guc_pc_init(struct xe_guc_pc *pc)
>=20
>  	pc_init_fused_rp_values(pc);
>=20
> +	if (IS_DGFX(xe) && xe->info.platform !=3D XE_DG2) {
Add this attribute only for PVC ?
> +		err =3D sysfs_create_files(gt->sysfs, vram_freq_attrs);
vram attribute should be per tile instead of GT.
A tile can have multiple GT in theory, so associating vram attributes with =
GT is
theoretically  wrong.
Cc: Matt Roper <matthew.d.roper@intel.com>
Thanks,
Anshuman Gupta. =20
> +		if (err)
> +			return err;
> +	}
> +
>  	err =3D sysfs_create_files(gt->sysfs, pc_attrs);
>  	if (err)
>  		return err;
> diff --git a/drivers/gpu/drm/xe/xe_pcode_api.h
> b/drivers/gpu/drm/xe/xe_pcode_api.h
> index 837ff7c71280..846c99aba3bc 100644
> --- a/drivers/gpu/drm/xe/xe_pcode_api.h
> +++ b/drivers/gpu/drm/xe/xe_pcode_api.h
> @@ -25,6 +25,14 @@
>  #define PCODE_DATA0			XE_REG(0x138128)
>  #define PCODE_DATA1			XE_REG(0x13812C)
>=20
> +#define   XEHP_PCODE_FREQUENCY_CONFIG		0x6e	/* xehp, pvc
> */
> +/* XEHP_PCODE_FREQUENCY_CONFIG sub-commands (param1) */
> +#define     PCODE_MBOX_FC_SC_READ_FUSED_P0	0x0
> +#define     PCODE_MBOX_FC_SC_READ_FUSED_PN	0x1
> +/* PCODE_MBOX_DOMAIN_* - mailbox domain IDs */
> +/*   XEHP_PCODE_FREQUENCY_CONFIG param2 */
> +#define     PCODE_MBOX_DOMAIN_HBM		0x2
> +
>  /* Min Freq QOS Table */
>  #define   PCODE_WRITE_MIN_FREQ_TABLE	0x8
>  #define   PCODE_READ_MIN_FREQ_TABLE	0x9
> --
> 2.25.1

