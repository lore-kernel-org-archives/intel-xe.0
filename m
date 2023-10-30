Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4E2FC4332F
	for <intel-xe@archiver.kernel.org>; Mon, 30 Oct 2023 12:23:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0B9D10E2A5;
	Mon, 30 Oct 2023 12:23:23 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 892C210E2A5
 for <intel-xe@lists.freedesktop.org>; Mon, 30 Oct 2023 12:23:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698668602; x=1730204602;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=m4Faaz8SncI9cb3qsbruLfphrkIwNFDIq58lUKhmV14=;
 b=HugO1RCbUVXiEmHchXNDpSSKrOgeCmUqP7Z9pqD3yBeM8wzG52aEyW/5
 jQvV45y3Pu7Jfsej8Jo+Wx1FfZdk8PpUKquNtKSYpG0IzOoS+UKyBOFnh
 vNU0HMZuY6p1B1pLedBsTyqTSsfRjUzITltvjRrT2JO7JqF79SIrGdnbq
 U2HCDkNbwH9Te9KBsEiNXdprptbhuM4cKi6zqu9xJwqOCu15QV57dyi22
 VMFKnYxv36RptMjIs7vTmXP/hI2rGTDQN1MQtR3+IXv3Ik6LHAKUD8nXL
 uVFIFzCVhYyJQPrk741BU8PDfybHi4/J59fObkgCYkIbwIMAOF2F1f78/ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10878"; a="6694016"
X-IronPort-AV: E=Sophos;i="6.03,263,1694761200"; 
   d="scan'208";a="6694016"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2023 05:23:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10878"; a="850900268"
X-IronPort-AV: E=Sophos;i="6.03,263,1694761200"; d="scan'208";a="850900268"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by FMSMGA003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 30 Oct 2023 05:23:21 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Mon, 30 Oct 2023 05:23:20 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Mon, 30 Oct 2023 05:23:20 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Mon, 30 Oct 2023 05:23:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MH3RzMy9elrymeT48i2ncMwluXwEqQEFSAHQ59rgGm+9mvkNdp7fwSunTx2/9mS9dM/zUpq7PxOxmnvqq+L+ZtHL0+ETbxD0GApv29qIXE3mrMmMmZ7ugNYWE/1PXTPtp1fioWD99KwaX2u+HQ9MblnbbcuvlxpyC3t8+hi/ZteKSQUncCQAMBp9E5kCkalfIx0hXijp8Tn3oaFWHjLU8t974mMuXyF+NIRf7Ks/X/UoEi7oD8VUOaT2/UGg8FN9tkvPwX3r6UprZ6IpswIk0VZyt5Sx0vIRSLawRAhg/shwSykHaydJn3t0voJYWHv5Au/g28kfwDDlakHsU/96hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6kvGQeWANan0fG4cKWn58sUBnvdMwTZey2WkcbHRsws=;
 b=XuxSHGtaKDatUMq3wYKpcfSIiLwKx6vhdd3mhCNsHPyEpVu1XyCFXGt84x6OyJVpVDUjGkOD6QykxBsISl4gCVj95VVNmuaDrIQrvVbGY67QXz8SYTpP3amIymsiJzkyqybbiXmm8ZzUSUFC/bHORlxoe+TRDDzIlORXiyVEf3x8xjCk2lgFA6WnSw8AUEuC9Je6Oik2Ym/HAJZenrFK+LXzYT63s62KV7WY3RyoFqdDTnt+GAQdM2EJPL+GFYztlZvoRo6gLD1/me3H7VvhNX5L5ZWJY9cR8h4+kHpkMt+iKAKbSm++MjVzUuaxg9tGD4OfjuoXUSaZ2wYKVkkPmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6211.namprd11.prod.outlook.com (2603:10b6:930:25::6)
 by SN7PR11MB6946.namprd11.prod.outlook.com (2603:10b6:806:2a9::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.26; Mon, 30 Oct
 2023 12:23:13 +0000
Received: from CY5PR11MB6211.namprd11.prod.outlook.com
 ([fe80::413:a622:bff4:bdd6]) by CY5PR11MB6211.namprd11.prod.outlook.com
 ([fe80::413:a622:bff4:bdd6%4]) with mapi id 15.20.6933.024; Mon, 30 Oct 2023
 12:23:13 +0000
From: "Gupta, Anshuman" <anshuman.gupta@intel.com>
To: "Nilawar, Badal" <badal.nilawar@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Thread-Topic: [PATCH v3 2/3] drm/xe/hwmon: Protect hwmon rw attributes with
 hwmon_lock
Thread-Index: AQHaCycF7t8RNiaDO0ubdKkffYo+gbBiQTwg
Date: Mon, 30 Oct 2023 12:23:13 +0000
Message-ID: <CY5PR11MB6211DB1906C7C856A3F29AFD95A1A@CY5PR11MB6211.namprd11.prod.outlook.com>
References: <20231030115618.1382200-1-badal.nilawar@intel.com>
 <20231030115618.1382200-3-badal.nilawar@intel.com>
In-Reply-To: <20231030115618.1382200-3-badal.nilawar@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6211:EE_|SN7PR11MB6946:EE_
x-ms-office365-filtering-correlation-id: 8bfede54-2504-4880-b2fa-08dbd942fcb8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: bMbqZe+YjeS7d9qoAdSXgLjngQsaRXGL8m14IS/kI0y8B7Dqs0I1c72T9zhXfAaVpc+LYzzRnkhScft0NY3dTw6DC4Mfxggmb/imJ1Rqn2K1hUejZ4537TJjQOC2LM7LpdH25aw/cEC5tdTLzduzlsMWCEVZcvbNTXGkIcBsvPPIpi+X43Sk8NqtCBfr+XXkRD8dOtdn+UkwDBGC0pevTUU9aqMp/2mxiFTZmqZAH/4i0noQzKb2V5Rv7/PvMtUCDF0hKAcWEgENlqIqYo4kMOUtMMcFHw11uiY4+f7w4l/uPCm0tns3fPKkySQs1yYStGJ2l3Cujffa2HbUOlwEtHItv55PQ0w+hD0HUccrnIdS3gjb+swRP1FkQu2jhO5IJ6xVo1/1edb4dtJVojiMKVUkrraoCvu/qqW4VJO4cB+a63U98JsMLVXfz4Mb/JbLv5EmEgy6DPEf97V3WYhpatJrN4ThxYrVkUAljeCY1xV9FQ7dorqVxUnJD97OplQ94JS45v+hWDgNGAMIfncYBfwHws9eG5w409eQr7yOyActoD+YCMh02/372bWGV0HReK1MciJ/er18xMtO92ioNFRtBJ4Z1hfzrhgLbddMJ3Y9AVe+g5XLv4DaBKuOh4cI
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6211.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(346002)(136003)(376002)(39860400002)(396003)(230922051799003)(186009)(64100799003)(451199024)(1800799009)(122000001)(38100700002)(86362001)(71200400001)(82960400001)(478600001)(53546011)(6506007)(7696005)(9686003)(41300700001)(8936002)(4326008)(8676002)(52536014)(83380400001)(26005)(5660300002)(2906002)(33656002)(66556008)(66946007)(66446008)(76116006)(110136005)(66476007)(316002)(54906003)(38070700009)(55016003)(64756008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?9ASztMLpgc7qURjXlTCL16SGmz1mgqBFwxjajkC/BhFj5jpIQrjecOCHBEnH?=
 =?us-ascii?Q?FBdWh2p4PvuPbPlk8JIb4k8VJwZD/Bsa2i7mkPP8lyTu5Ct49awMp1kooW6g?=
 =?us-ascii?Q?AXuIunv+W8p8M/rvuO3w+ve0MnWiIXJIbFTrjKc+yZASIGLSACzkcNcyp7wD?=
 =?us-ascii?Q?NvZ20K+dKmbBYpks0C07SaEf15FQCZq/iXYeGUkPWhvBo0GdGZkRuwm18s/K?=
 =?us-ascii?Q?ycF2rpwA+AnHdnxj8i8tT9Ge/srKZX5mGI1LmgDz7tF7ifbefyLVB9j0V9JC?=
 =?us-ascii?Q?O8/qcKgmQvxi8m2UqVVCiOclbEgOS1LNB8Jy2oj2+TmudEW/gVFjSlrvDANb?=
 =?us-ascii?Q?2LiXUc/ww7smXz6RYLQMuWeLLcQAHlZj1OuDMzuu+LWdzdZ4j1tkQJDidEXd?=
 =?us-ascii?Q?GNwAsawYHYrI91zeh7x1MIpibgjFuJHtQnZT33hX+YDpsqww3uzzlmvgdhtg?=
 =?us-ascii?Q?sqO36L+zovndI/y/ZXfR2UXh2eYXk+iu/15robMyTHJL9Zrkt6gasgmGAe6P?=
 =?us-ascii?Q?sJ5ME9hzip9oAVkP9RgH0AMNtn57hEKXW77iR6aBWSdBBS4GFShrrdMKBHkT?=
 =?us-ascii?Q?D6hc7LlsvBkes43bjiPLdfKvaQYq5ZGxt3IK21Amy9ThSFDQ3FRHGtiWZkV/?=
 =?us-ascii?Q?qI0aqVOAwG5AugJJoz+UrvIQcIXh97bmu52o1TiSHsHe/LtV8cLqD2WiBr3k?=
 =?us-ascii?Q?R1grYrw6kPRZOcHsYE6CDIuyMbQ96hMLU0EPPEKU+bf0QdIFI8ejWqJAh06q?=
 =?us-ascii?Q?uMeqtGge7YmgBsl6OhLm7xJnfdD1JaDaaYRapQbx5UdhzOUd+I5QtCH+badL?=
 =?us-ascii?Q?K3uBcW2+vJJBuprgLTHG7lc2SfgBuWp4P4atijLBF178YiYAeIIATqEv4A1y?=
 =?us-ascii?Q?b1rZHYnlhIPkZsHcFTkivzPgVVYA9q66F/8vqiA8er/K3jXMj1KPr7OFceiH?=
 =?us-ascii?Q?n4VSkJQvPM7l3o4CeEMEDM4PyE2529JNW6wDY6BR92R17wGJ3cPlzhV/neFU?=
 =?us-ascii?Q?/q+//J3q/Wf3NO0PqZmieg6dE98XCl/NZ8Ojf+woDOs02oJLTbc7m1n9N8ly?=
 =?us-ascii?Q?pejRstjYguh8ChKLTYFia+Hlnis9pUIee/gLPCt+IY+lGpf+wZ1sZZR5mEbt?=
 =?us-ascii?Q?8UxzJG8aL2CDLuWdlgDBFFr8T5bLM0Ff+3glzZgaO5ccTNODAw/0RqA3sitF?=
 =?us-ascii?Q?zPI4XbhZkTB5lTE58HygyinyZ24/ls52NzoNWD2FL0Vq02OyZOPNJXXmQLcW?=
 =?us-ascii?Q?x9MRecF0QS/206yZ4UO6bkiW1HER11jzczLhJmbJE9Zv+w7asHQF6H0K0rU2?=
 =?us-ascii?Q?YuNQG5gQMSc3TcVPeo1tGYFu/LGHfryAdeGxg+r9eafWTa1+wBG+pwbhjb6U?=
 =?us-ascii?Q?jFDiKzi4p9P9lbTyFbcrK53+0x4r4XDJBlNBUHniki+Mw/mopjuCBmcgmRnU?=
 =?us-ascii?Q?6c62VP+DZx8WeDcTkcn1NwKp5dfBX68JHNTrGbnYKBECqeGXMPTsWo3sU1r1?=
 =?us-ascii?Q?PDHtrrTrLu9/akN8H3pCzQzOp+l1cExalx3MF7tsK9Dq7NrxrTg3PXDljTUo?=
 =?us-ascii?Q?rU/Y2HT0EHiIDB2BT/U6ucljVVEx8X83cJhH+S/d?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6211.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8bfede54-2504-4880-b2fa-08dbd942fcb8
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Oct 2023 12:23:13.3681 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cc5MWVitxJ/IBkJBkiHiwRoz2+UWSXoFD/E7RfyDCZryueourDZ1SLYpMD8kPHZkoMPb4OF9pY2sTsQlvkh5xBcs+f6CeVFROmuZSRpsT/w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6946
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v3 2/3] drm/xe/hwmon: Protect hwmon rw
 attributes with hwmon_lock
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
> Sent: Monday, October 30, 2023 5:26 PM
> To: intel-xe@lists.freedesktop.org
> Cc: Gupta, Anshuman <anshuman.gupta@intel.com>; Dixit, Ashutosh
> <ashutosh.dixit@intel.com>; andi.shyti@linux.intel.com; Tauro, Riana
> <riana.tauro@intel.com>; Vivi, Rodrigo <rodrigo.vivi@intel.com>
> Subject: [PATCH v3 2/3] drm/xe/hwmon: Protect hwmon rw attributes with
> hwmon_lock
>=20
> Take hwmon_lock while accessing hwmon rw attributes. For readonly attribu=
tes
> its not required to take lock as reads are protected by sysfs layer and t=
herefore
> sequential.
>=20
> Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
> Cc: Anshuman Gupta <anshuman.gupta@intel.com>
> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
Reviewed-by: Anshuman Gupta <anshuman.gupta@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_hwmon.c | 35 ++++++++++++++++++++++++-----------
>  1 file changed, 24 insertions(+), 11 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.=
c
> index 9b7773441f62..7b4f88fdf647 100644
> --- a/drivers/gpu/drm/xe/xe_hwmon.c
> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
> @@ -57,7 +57,7 @@ struct xe_hwmon {
>  	struct device *hwmon_dev;
>  	/** @gt: primary gt */
>  	struct xe_gt *gt;
> -	/** @hwmon_lock: lock for rmw operations */
> +	/** @hwmon_lock: lock for rw attributes*/
>  	struct mutex hwmon_lock;
>  	/** @scl_shift_power: pkg power unit */
>  	int scl_shift_power;
> @@ -149,11 +149,13 @@ static void xe_hwmon_power_max_read(struct
> xe_hwmon *hwmon, long *value)  {
>  	u64 reg_val, min, max;
>=20
> +	mutex_lock(&hwmon->hwmon_lock);
> +
>  	xe_hwmon_process_reg(hwmon, REG_PKG_RAPL_LIMIT, REG_READ32,
> &reg_val, 0, 0);
>  	/* Check if PL1 limit is disabled */
>  	if (!(reg_val & PKG_PWR_LIM_1_EN)) {
>  		*value =3D PL1_DISABLE;
> -		return;
> +		goto unlock;
>  	}
>=20
>  	reg_val =3D REG_FIELD_GET(PKG_PWR_LIM_1, reg_val); @@ -167,12
> +169,17 @@ static void xe_hwmon_power_max_read(struct xe_hwmon
> *hwmon, long *value)
>=20
>  	if (min && max)
>  		*value =3D clamp_t(u64, *value, min, max);
> +unlock:
> +	mutex_unlock(&hwmon->hwmon_lock);
>  }
>=20
>  static int xe_hwmon_power_max_write(struct xe_hwmon *hwmon, long value) =
 {
> +	int ret =3D 0;
>  	u64 reg_val;
>=20
> +	mutex_lock(&hwmon->hwmon_lock);
> +
>  	/* Disable PL1 limit and verify, as limit cannot be disabled on all pla=
tforms
> */
>  	if (value =3D=3D PL1_DISABLE) {
>  		xe_hwmon_process_reg(hwmon, REG_PKG_RAPL_LIMIT,
> REG_RMW32, &reg_val, @@ -180,8 +187,10 @@ static int
> xe_hwmon_power_max_write(struct xe_hwmon *hwmon, long value)
>  		xe_hwmon_process_reg(hwmon, REG_PKG_RAPL_LIMIT,
> REG_READ32, &reg_val,
>  				     PKG_PWR_LIM_1_EN, 0);
>=20
> -		if (reg_val & PKG_PWR_LIM_1_EN)
> -			return -EOPNOTSUPP;
> +		if (reg_val & PKG_PWR_LIM_1_EN) {
> +			ret =3D -EOPNOTSUPP;
> +			goto unlock;
> +		}
>  	}
>=20
>  	/* Computation in 64-bits to avoid overflow. Round to nearest. */ @@ -
> 190,8 +199,9 @@ static int xe_hwmon_power_max_write(struct xe_hwmon
> *hwmon, long value)
>=20
>  	xe_hwmon_process_reg(hwmon, REG_PKG_RAPL_LIMIT, REG_RMW32,
> &reg_val,
>  			     PKG_PWR_LIM_1_EN | PKG_PWR_LIM_1, reg_val);
> -
> -	return 0;
> +unlock:
> +	mutex_unlock(&hwmon->hwmon_lock);
> +	return ret;
>  }
>=20
>  static void xe_hwmon_power_rated_max_read(struct xe_hwmon *hwmon, long
> *value) @@ -229,8 +239,6 @@ xe_hwmon_energy_get(struct xe_hwmon
> *hwmon, long *energy)
>  	struct xe_hwmon_energy_info *ei =3D &hwmon->ei;
>  	u64 reg_val;
>=20
> -	mutex_lock(&hwmon->hwmon_lock);
> -
>  	xe_hwmon_process_reg(hwmon, REG_PKG_ENERGY_STATUS,
> REG_READ32,
>  			     &reg_val, 0, 0);
>=20
> @@ -243,8 +251,6 @@ xe_hwmon_energy_get(struct xe_hwmon *hwmon, long
> *energy)
>=20
>  	*energy =3D mul_u64_u32_shr(ei->accum_energy, SF_ENERGY,
>  				  hwmon->scl_shift_energy);
> -
> -	mutex_unlock(&hwmon->hwmon_lock);
>  }
>=20
>  static const struct hwmon_channel_info *hwmon_info[] =3D { @@ -279,12 +2=
85,16
> @@ static int xe_hwmon_power_curr_crit_read(struct xe_hwmon *hwmon, long
> *value, u3
>  	int ret;
>  	u32 uval;
>=20
> +	mutex_lock(&hwmon->hwmon_lock);
> +
>  	ret =3D xe_hwmon_pcode_read_i1(hwmon->gt, &uval);
>  	if (ret)
> -		return ret;
> +		goto unlock;
>=20
>  	*value =3D
> mul_u64_u32_shr(REG_FIELD_GET(POWER_SETUP_I1_DATA_MASK, uval),
>  				 scale_factor, POWER_SETUP_I1_SHIFT);
> +unlock:
> +	mutex_unlock(&hwmon->hwmon_lock);
>  	return ret;
>  }
>=20
> @@ -293,9 +303,12 @@ static int xe_hwmon_power_curr_crit_write(struct
> xe_hwmon *hwmon, long value, u3
>  	int ret;
>  	u32 uval;
>=20
> +	mutex_lock(&hwmon->hwmon_lock);
> +
>  	uval =3D DIV_ROUND_CLOSEST_ULL(value << POWER_SETUP_I1_SHIFT,
> scale_factor);
>  	ret =3D xe_hwmon_pcode_write_i1(hwmon->gt, uval);
>=20
> +	mutex_unlock(&hwmon->hwmon_lock);
>  	return ret;
>  }
>=20
> --
> 2.25.1

