Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8068EE4996
	for <intel-xe@archiver.kernel.org>; Mon, 21 Aug 2023 13:25:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFC1210E252;
	Mon, 21 Aug 2023 13:25:58 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F74110E252
 for <intel-xe@lists.freedesktop.org>; Mon, 21 Aug 2023 13:25:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692624356; x=1724160356;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=KSydtQzmxDeMyV6+p6j62oTmc0jgbkQ3U9BFcuBl6p4=;
 b=iYx0p5SgIIdMK3Q2B6/059mL4MaI3PG36M1P70sMMfV2EDDgZUanfrMq
 JeaLX7poAeIssQIbYq7bxsQYthWnsoJzEgJc3AcPbWN9P3wyP40d2lLNQ
 RsZb93rl9SPMlXHzoXIWQ4S5zeb/5Q58Jqis3pD9DqZ9tzRrhR1HR3iiw
 DtugsJ9oSL5Wf0a+7hI4tvMJz4GEaOmM0kPs2QqGnNV21twhu6L7zwEfG
 roRmP8mfw8LdS5KWjaPjL10whsJl7Q76Wvp9BPOaVjogomPN8m4UJ0KHz
 TkAJoYFPGFGLWyF0ZKiI0MwQHr5/VjupJOdvNIc+8FYmbsXygR+pVXr/2 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="376337844"
X-IronPort-AV: E=Sophos;i="6.01,190,1684825200"; d="scan'208";a="376337844"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2023 06:25:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="825923075"
X-IronPort-AV: E=Sophos;i="6.01,190,1684825200"; d="scan'208";a="825923075"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by FMSMGA003.fm.intel.com with ESMTP; 21 Aug 2023 06:25:55 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 21 Aug 2023 06:25:54 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Mon, 21 Aug 2023 06:25:54 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.103)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Mon, 21 Aug 2023 06:25:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fF53Ay96VVlOAfoljJ5e1P989/86bY0lt0c7K6o4eNy1BH/8SRd9EXPwLNpmzaT1QqXrjh2+yo41x1iqobm4ZB596gIDiFvPIlmzP3WS3o7GJzA2uSjfmiSClpf3x994ZghreSzM5TGhF7vFDzfa9cwMqSNL/UwwlolQYUlmakiTPErz4XikPN+sbvUo1P78q4g7GTPjl1R7nyZClIlStzU5Vgg3rbkZqFJA0fVujyj+m0ECP5WH5x1ibsP2mVNfxWSHvD7vCSb3uyg+65YE+Ot6BcKk1U8VrQskBALXQD0RUBSNxnBY9w0Q0E8B7zzvshlVqQue9w+bAdn43xUrXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HpKnJ6PwOO9XFGU6pTX/4N1e4WfHDO1qZoLrUBDpzKs=;
 b=dDxe6STOkSD4XnSR0dA839WbUBwEmRW37buQ614EXPWAddGFY6XwwmKDyd9FjqSAX5imHwGZZeTNId2fVvBOqeSFaGWN2plWgd1FT7S4nkyEDj+HgXMh6WQoCvyjwzVqv2GKL44f8I5afDuY5VIY6D+5k0NUTJm8alVczN7Mn67B3TBE6qECek27BCFu0y86H5+smLOlVhBFt4I3rE1rmAjr/xVGL/vjiNJrCsKjLfWJzxfM4B0A0bUPHINmXVboYvmIydqpet8rxPdlgcu/hAY8xJJzddCRbHa7N3pmpJlYTCOmmpkaXsXtzolvdH0b5fb2WKcMZwoj1AzDY8lndA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6211.namprd11.prod.outlook.com (2603:10b6:930:25::6)
 by DM4PR11MB5568.namprd11.prod.outlook.com (2603:10b6:5:388::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.24; Mon, 21 Aug
 2023 13:25:52 +0000
Received: from CY5PR11MB6211.namprd11.prod.outlook.com
 ([fe80::bddf:185b:23c:241]) by CY5PR11MB6211.namprd11.prod.outlook.com
 ([fe80::bddf:185b:23c:241%7]) with mapi id 15.20.6699.022; Mon, 21 Aug 2023
 13:25:52 +0000
From: "Gupta, Anshuman" <anshuman.gupta@intel.com>
To: "Sundaresan, Sujaritha" <sujaritha.sundaresan@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Thread-Topic: [Intel-xe] [PATCH 2/2] drm/xe: Sysfs entries to query vram fused
 min, max frequency
Thread-Index: AQHZ1Ca2LVXliAMU302c1FJLney3Da/0u2Ow
Date: Mon, 21 Aug 2023 13:25:51 +0000
Message-ID: <CY5PR11MB6211CCF155D51F1A42496166951EA@CY5PR11MB6211.namprd11.prod.outlook.com>
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
x-ms-office365-filtering-correlation-id: 76751a3e-feb9-4dfd-03ad-08dba24a241a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: yTOW9M1YnscBxx8tnIBaf/Oitne7MjOf99wwJobY23BvCPJ9lvt+jlda7VDiN3mYHrHzosJat7kA7ds9l4rLRF7JztUOIMVlprpiwAEFTTgy+L6A3D5KV7Q5Yo8z3LeIVCVivVhR/yaicWT6E3lLUUy4lcBW4un5zr0hCym6w5dfuImx2Wb1/mmkuIB0VYMJvc7d1af2qxCeo0FHMQFBQguilg9h3FCk1y54n4EJdk4dfwGxMuZmweE/U/XmKHibzxxQQjCI6VSqAKDkk0KDEf/TkCa5g8bJvdMlqpXMqUEkhM0fd8n95etNmx2g170jKq+LmMf1tKhpZn6GihPZGxYM4Q8HIKt6QDS5MkWB2W7jGBQEf7fp2wIk25x4kt4RMXL7Jq6IDCkBI85Rx69vKl0Po42NsG3RszJjRn1TZQcILImG6EYTssOAOKB+5tdPCijikrmo/e6o15qJ+X5bo6tfN5dwPDR6mHdWygvx5tb2OcCoocJO+1J4pQ8y1dyD39dFywdLbQDR7k+mTeJZgEwVh9HXeFla+7uG6+qjsYlLgEqzWGoix1uDn+oFORzNhwUS9KUYqoG8M+rN+zn6VBiP58H8BlALz9dRZWBbNhsEN2cfbLZvrGqFTTACMisl
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6211.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(396003)(39860400002)(376002)(366004)(346002)(186009)(1800799009)(451199024)(66446008)(64756008)(76116006)(66556008)(66946007)(66476007)(316002)(9686003)(82960400001)(110136005)(8936002)(8676002)(4326008)(107886003)(41300700001)(122000001)(478600001)(71200400001)(55016003)(38070700005)(7696005)(38100700002)(53546011)(6506007)(2906002)(83380400001)(86362001)(5660300002)(33656002)(26005)(52536014);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?qtGQ/VOXNJpX05Uo95yxIA00sNRqpRdIxATahp1Fp7+kAfpuKGKYVarmUuMV?=
 =?us-ascii?Q?I43SZeIeShRcH65QY5RPO/V3KHR+ds0up6cSksIP3HP5Q4/ZUQ9Pac9jTZoJ?=
 =?us-ascii?Q?6iPypi/2HNOYK7nmv+1vD4v1Bbk4cYd+37S1OLPfvmmGlGbPqo+7gSzJKBox?=
 =?us-ascii?Q?ejpAy+mLkxP8cTOKyXs4dZhUkao6MRGFC+tKPuqyCHlDLRzS7X2fOOaX/iU8?=
 =?us-ascii?Q?LzxD3UEJMGfr/RYR065ekO3HwzVNBZWzuLdd0ZxRv58C/3pW2l/laV66MuRf?=
 =?us-ascii?Q?1/AG249jm3bnuzgReIS2pL1rPEGltF++b6pMOj7u64L6kfk42WxzG9X9zGPn?=
 =?us-ascii?Q?Ew+kYTKnpboKX+D+QpajnjM0cWdJsllk6nrjfDFN1Bo6TFcV8AJcnCBIXWQI?=
 =?us-ascii?Q?8nCLs7vCYGxYhQ1G3lTW4jyjg2FtoTv2gvcAwgHtd8nrbsKg+/nDpUL6mt+p?=
 =?us-ascii?Q?GgEzTGHWmGL5ilWCxMAFtTRsEasAPpBeXRv3f8rgoDudyt1eYK1WaBHJlBp1?=
 =?us-ascii?Q?nrzw8Ssasv+3ztlCgmC8SOBQko9tpE7T2/XgfGLE77u9Dfhs/ith4S2iG630?=
 =?us-ascii?Q?gtFL3hIqAWEZyyT5/ybC8yIYEWSZ8PkoW6wZ1Jqu/t7z3sw3hYwH3B5h37Od?=
 =?us-ascii?Q?6FTiOIyoojaxCAU1+kbEDcxQN7vivs/NwGxAAu0Y2Jzk0Ywt3FwKZlohw7g8?=
 =?us-ascii?Q?cVsVfo+QYhT7eSvkvjJ+VEhp6pNtSRJVz+8OQlHKzY0ofUFntyCAhfjsWtAn?=
 =?us-ascii?Q?+UaPSMR81PICAS+MZYQTRozDzqoqu8ktJHHs0WtP9J64Tl0ghCvfTXeN1BqY?=
 =?us-ascii?Q?HfhHUdeJbkdSZyCeGTWqa9VDe24l6BesSk4wF5qxL6WF0wDNqVdT3skod2cH?=
 =?us-ascii?Q?C13ItCXGNMbh/bBrjeawciCZqd0RFDsPPGil/ANASQUhlL+4sihTgy5sgr03?=
 =?us-ascii?Q?FU83v7I/oRVYy9ZxQCK8rZ30y15nx0UEgAXlq3KaH8EuEY5pOJFSnK6leZCI?=
 =?us-ascii?Q?FuwA+q4TsMvwtTW8LlOeZbj99Aki8tHdypiPOZ0UpyUpNf8/oCHSbhA9UE7P?=
 =?us-ascii?Q?tdHtkjnI/JQHgXLkSxxK6eXrclqJ1ez3qqLmMuwI0/C19tybDnwcXrGXubhp?=
 =?us-ascii?Q?XpHOCK5d3oooxJvJFe1QhliB3ipHDQYolxcqm1UTv0uCjDHjRtPo5TOk6VTP?=
 =?us-ascii?Q?uYZiIPpm5jM9asqDdm4FVCVQt0QiKTSObkJx3TlTaXT4N/cGj9ISiFvRqF9s?=
 =?us-ascii?Q?dSaSAmKks9ehOqpH2HJhiU1jYsVOT2UcNEmpXuqs/wtGsX/HCr4ShqSlJnR3?=
 =?us-ascii?Q?SBXQosDqeHFcBJW6JAR58Eztf5rleZnMihUfolU1aCFWrP1BsPIp//1SjEap?=
 =?us-ascii?Q?scgZT2DUnKNrXTWwZhXPe4foNOnb+/Zib7x6uW0ASh7jrqzj3C0NDsKuccnJ?=
 =?us-ascii?Q?8iJo2t64Gu/9zdLsyV75PO/ohlu7zJyP9n5tuh+L3nVdvY6ckAaYMquN82uM?=
 =?us-ascii?Q?fvijxYn7xqFEkctNst3/OGeUavoDdlhZBScR1ychilgsTp0bMhXxc/kn69bI?=
 =?us-ascii?Q?nX8TjlL7FoGs3sFwnGEQi7+BtKproMAu5qo/l4qk?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6211.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 76751a3e-feb9-4dfd-03ad-08dba24a241a
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Aug 2023 13:25:52.0020 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DOIziPgH6/z4tXDgzfPnKv7F+1JHUNrJKCIwWS41O46V9tRxaBMwIxupCo5RJXZYxPh9SKwhqmc3J7+V+cDwzvupM/7QABqiQmTzrfjjT8s=
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
Let's be specific add this only for PVC.
> +		err =3D sysfs_create_files(gt->sysfs, vram_freq_attrs);
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

