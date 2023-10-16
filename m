Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6ECF8CDB465
	for <intel-xe@archiver.kernel.org>; Mon, 16 Oct 2023 09:08:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 441FB10E162;
	Mon, 16 Oct 2023 09:08:31 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E90F10E162
 for <intel-xe@lists.freedesktop.org>; Mon, 16 Oct 2023 09:08:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697447309; x=1728983309;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=PnibnM6/zPtSvHKNXlLj4YqS9LEgABRQwjwsWvTztN0=;
 b=mXA7TkHsih3Ag0pb1mD/N8BSTuc/VS+QHuzOdcDW+UxbK0unFiJHmhda
 SLZFo1Ev9IH9pG6ELDLLGT/7PDnMaoYAypcjMYvLbQgdH5WFmKY8wmKNi
 pfdAbCtVun2WU1r58syE91r3owGPqea6EJkkBzQOSL2pXsfniyDX92Ngz
 Hqa8yUKRJmYSf9eotLxxhNitfo6n8kVQ5VqJjZyBJyPR2ToMwu+nP/YU7
 DIPE6FJhktqyBZ7rR7nF/zM2QPgBEhcVVqg5oq39Qd/A54yc+/ktUBAm3
 JnKufd3SYD6zA9q9WP+CxjBy6bRc+gmbFS+fMMf5oYgCkxW/QJsv6+kfn Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="388346265"
X-IronPort-AV: E=Sophos;i="6.03,229,1694761200"; d="scan'208";a="388346265"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2023 02:08:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="846326219"
X-IronPort-AV: E=Sophos;i="6.03,229,1694761200"; d="scan'208";a="846326219"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by FMSMGA003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Oct 2023 02:08:27 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 16 Oct 2023 02:08:27 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Mon, 16 Oct 2023 02:08:27 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Mon, 16 Oct 2023 02:08:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Zw8ElCW/Deihzye5KJ3vI8834cxExaCpFCMCXPyXYpWI3DakYV8HdsD2BhV6etWRSMoziyjG6HeouMlwGlBZ3iL+smSaSZZRtKEieaNT1/EX1Ug0wp+0UIMvhpBToDaqRygbTnkYCubs4RpkK0RcjpuI03fMlsMjJB4B9YTl+EoOFgC3dporZHr0gTDDFe37jdUhOWh0QhCSCvaJmmkMOUNtbfITI1YVGHC7JwMYMlE0fquPIwwdLpkSWC7JClmytgGIPzXu8sfWrL4SpdOEEhA27mEETD6AMbV28sr2CApjQrLrHHhAqhY0Iyqkqj0iMnYvlRo1bS5SB4QaPbTv/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4QnXuDtejQYVOLV1+REdIS9eGJVnZPoZTP/CDKCvDNs=;
 b=QAvNjrH4bhrJtors3yT1Lm0oq2SQ/PZpMSeBB/pxpeJQdxOE7CU1JLbykeLNIB+x7I8rHi9E+XPxSwTzXuQA2LQWQQjmpj3VB5BaDv2wEle80/LJl+rJxkB9alhPvazfLlXBbKxqW6MBTuUgFYEl4iwg1snQRr+QPvYZi195o7cKkETD8bL/U/nz/0DvvaVQR/8+faJ6wv60TFXz7SAuNWDzNQQovusHR6SBxe5vGETqp9nDMmmYfZ5sTO2ib/xg1Bjc7JppXuID1R9xIOvpkFDyseIxzTK3P0mZD6cm9ifJnl0uvX/qnrGmG+IcLjKBmVKavIIHJiMUy9Kz4GH45w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com (2603:10b6:a03:488::12)
 by DS0PR11MB7457.namprd11.prod.outlook.com (2603:10b6:8:140::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.45; Mon, 16 Oct
 2023 09:08:25 +0000
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::f525:287c:b2c:81c5]) by SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::f525:287c:b2c:81c5%7]) with mapi id 15.20.6886.034; Mon, 16 Oct 2023
 09:08:25 +0000
From: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
To: "Kandpal, Suraj" <suraj.kandpal@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Thread-Topic: [PATCH v6 2/3] drm/i915/hdcp: Move checks for gsc health status
Thread-Index: AQHaAA+vczD05TgSYEuYB1vTBA5JdLBMIHbg
Date: Mon, 16 Oct 2023 09:08:25 +0000
Message-ID: <SJ1PR11MB6129505BE3F7A0910653DFAFB9D7A@SJ1PR11MB6129.namprd11.prod.outlook.com>
References: <20231016090139.850525-1-suraj.kandpal@intel.com>
 <20231016090139.850525-3-suraj.kandpal@intel.com>
In-Reply-To: <20231016090139.850525-3-suraj.kandpal@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6129:EE_|DS0PR11MB7457:EE_
x-ms-office365-filtering-correlation-id: 7c70f62c-92cc-4d69-9923-08dbce277430
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ZvMH9FQW4Wv4gpS+Y/D5wJqCTKmYCXifIlkQ2dtToVPwsSLNEISseNZDZHQSViF+9DJxe4SJi4VDJf7ZEQ1PWP0m7ZQnydyXTXVN7qlM4PB4zDxoLGhxh5aOJIfnoypGVy8nLAKlz3YYbEqMNr08/F4OXDuZsyBsFs7BMJDoZJecycoZkSomkGHprbkcwde7acO+xfzYZUeept18Q+haHpEqNPekZkxv+eN4K0Ut+7r6QPdMP9lk61qFIqcygFRiGdtwKTubKYQoQe6TpvhjoKeCpB/tq7Q75VyyHID7NFcM4cIyvwjG0BvWyjYrin47V9RrRWHPsUYYd8nydcknNeuiwxc9aJU/wqxYcRWC0Dk7Aags6tVD+PTdJBba5ruiUB+20IJ2RNgmbQ2KAr8hLBSl9IEcSi95KWCNo8wBi+3m9mf5UZzsghjy4jXbZSf94wCgX/jBo1jjGRGfdWn9s9pbQiLEHix1O7zT0aC4LL3nxWeRO8NK9tQ5oUafkc20V9L3AMqD8ifkao8P28AvWaiYCEKGW6N2b9yK6dyLVIdXX+gWs4NYVUzqrtGlPbEiHuAvczH0Uotqf4WHdoHlLII73a0zqreCYLgrrelxyTc=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6129.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(346002)(136003)(366004)(396003)(39860400002)(230922051799003)(186009)(1800799009)(451199024)(64100799003)(76116006)(7696005)(53546011)(966005)(316002)(6506007)(9686003)(110136005)(66946007)(64756008)(66446008)(66476007)(66556008)(478600001)(71200400001)(107886003)(55016003)(52536014)(8676002)(8936002)(4326008)(41300700001)(26005)(86362001)(2906002)(38070700005)(5660300002)(83380400001)(122000001)(38100700002)(82960400001)(33656002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Y8mQk4nPtZGqOHua4H7jZIOFFHOi0yjB7BULSzoZQKON57nrdiJwFC3TnD1/?=
 =?us-ascii?Q?z6RmpPlZnPzCCGThmgN2qFGsT5PS2GYi4vsHuEXg97ewlLvP7Prwi68C8ILh?=
 =?us-ascii?Q?ZhtFs5ldmWBFfC2uZ6k2TxM4+z/+2VyAZLDgBYKuWgh9IPYo9y/05mjTaaN3?=
 =?us-ascii?Q?41NMtcELzQDXlac/z3wc0Oq690pFn4sFcAXwIRS1nqlpnlZNc+uOrIJ3Emn5?=
 =?us-ascii?Q?IRDJtnb+X+64bqmLR8xAYt/GSQ5ojCkFf/+VPeoNxTrAiLbpV8+vCjB/32+2?=
 =?us-ascii?Q?49UhAgvhCkAGewcg+X7K4kkzUglpsPlQ2omc9CaVu9P0PLo6N/vaXe2POpSP?=
 =?us-ascii?Q?gbg9K7PpHLlf8nxpGiOwW5e8Mlp5C4sBcNgOBzRLJCymHpWR81mTmhLP6VZK?=
 =?us-ascii?Q?PyUx95Ar2w2Xo8b/L0oBAc92G75X4p4yuZN2kdC2zTpcQlLfUYkPCSA9qPzx?=
 =?us-ascii?Q?mCCcrk+aSPuJPl3Kj37Ns3tpwm0WMLLA6xAEFz0+NzsVUt1U01qOWQO6//I2?=
 =?us-ascii?Q?uyTvxrldYxVqBF9fLUZCDOxPHiZ4ma3br14Wizuixs0ZDtQD76OxpwlYeVZR?=
 =?us-ascii?Q?ITJpz/f0qJjsTpR2SGXmuPheNfKYCiXPZrbILjaETJDl/a+y7RcZ4zryvB4p?=
 =?us-ascii?Q?yB3x1IUvfacJEk2dQKA4hvOxhZffViznMhw4KX4+Bv7tJvdkJwXmIdX+eKvN?=
 =?us-ascii?Q?32s7xjta/ohHMSNjbnOTvhL8m9qO+N/1xFgXP/J7e/eDjvp5+77FOpaswqCU?=
 =?us-ascii?Q?KxNpuJQihJnUeQbYBLyXlqLVgucwEG+lz3OSs15EkNNbKddLtcUPxhJv2ZHy?=
 =?us-ascii?Q?4HYqFJfgQjQp/09+Yq2Wx+tKzR5DPw5VLM8HsqG0zKBhj0VdZ6Nfy8RfXnjf?=
 =?us-ascii?Q?7cFfYhNc4Q/Gb6qMiHq+qg4348pIy2wEI1qkXGPXEPG83hVjeUNhVC2lwamW?=
 =?us-ascii?Q?Rc3osD1ruXvx7G/oriL91sNEHUkFX3vFkZS66wPRRR6tnZasF42R5+qiIHdN?=
 =?us-ascii?Q?u5fyD2GzkMxnPjq17pHRcZU5QVJjmRkaSQmvlOZejEIdxfFST9Y6v97M+Zn7?=
 =?us-ascii?Q?BHWwhEWM2sf4LVJpb0/7f6ZGBulyTD8icW0G0qraCZZc/ChLcYPBydG0jypU?=
 =?us-ascii?Q?d/H+pO7On/TYrz5ZsZ+oSuYYB6dEQ0dT7h7pVGvl54SLd9wW5P6+9qummR/I?=
 =?us-ascii?Q?S0L+BWCKGF9UbUKnHljFD3T5zYYv1Ptg+KD/T7+Jw8mAFvMBI3szZ9UVQ1AQ?=
 =?us-ascii?Q?zGgLheEF3/ZTkBXFJ+dYlShzoad+g0Ra6d3joMW5I3GilUGmLXmAO17Qj1gu?=
 =?us-ascii?Q?ObMk1f6F+2GOlYiAoWv2wEmElIgjgkNEJt1ax6BFjRYSA96WV/0zHhyoh8O6?=
 =?us-ascii?Q?dienLvX5EBq2aSWVyUrRsIvCjIOKeCq7le+8p9VscEPm7BGTNm1XVK0KN2J2?=
 =?us-ascii?Q?avFAnlC7eRWAsfpr5SwJNUSOZJgUIxXHVTZPz6bB6ouN6+T8BKaB48rDbj8A?=
 =?us-ascii?Q?8P6guaom6TVQkwmEoNVSJUtRdjCeZUBaADhV9IfxQV3U7596sTVj28Q1HZ90?=
 =?us-ascii?Q?UM/N06yn1t0/8eocvkaw+lW1K/3ctsWMMslQxJbsmm+pMk3V1FPWMFQdjWKv?=
 =?us-ascii?Q?yQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6129.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c70f62c-92cc-4d69-9923-08dbce277430
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Oct 2023 09:08:25.0946 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Lu5RpUJLdhshSAM1TKUha+ZyWXNkj13UENU7nk6rKi8CTxcV6aPL5/IhX7ph7JPUCByGao78kyarzbgiIolKEfZqgdo571bXOECHoQQX0FU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7457
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v6 2/3] drm/i915/hdcp: Move checks for gsc
 health status
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
> From: Kandpal, Suraj <suraj.kandpal@intel.com>
> Sent: Monday, October 16, 2023 2:32 PM
> To: intel-xe@lists.freedesktop.org
> Cc: Shankar, Uma <uma.shankar@intel.com>; Borah, Chaitanya Kumar
> <chaitanya.kumar.borah@intel.com>; Kandpal, Suraj
> <suraj.kandpal@intel.com>
> Subject: [PATCH v6 2/3] drm/i915/hdcp: Move checks for gsc health status
>=20
> Move checks for gsc components required for HDCP 2.2 to work into
> intel_hdcp_gsc.c. This will also help with XE refactor on HDCP's side.
>=20
> Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
> Reviewed-by: Uma Shankar <uma.shankar@intel.com>
> Signed-off-by: Uma Shankar <uma.shankar@intel.com>
> Link:
> https://patchwork.freedesktop.org/patch/msgid/20231009095537.653619
> -2-suraj.kandpal@intel.com
> (cherry picked from commit
> 99f106ad5063444361139f9bd727e61383b2b93c)

LGTM

Reviewed-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>

> ---
>  drivers/gpu/drm/i915/display/intel_hdcp.c     |  8 +-------
>  drivers/gpu/drm/i915/display/intel_hdcp_gsc.c | 14 ++++++++++++++
> drivers/gpu/drm/i915/display/intel_hdcp_gsc.h |  1 +
>  3 files changed, 16 insertions(+), 7 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_hdcp.c
> b/drivers/gpu/drm/i915/display/intel_hdcp.c
> index 8cca4793cf92..c89da3568ebd 100644
> --- a/drivers/gpu/drm/i915/display/intel_hdcp.c
> +++ b/drivers/gpu/drm/i915/display/intel_hdcp.c
> @@ -173,14 +173,8 @@ bool intel_hdcp2_capable(struct intel_connector
> *connector)
>=20
>  	/* If MTL+ make sure gsc is loaded and proxy is setup */
>  	if (intel_hdcp_gsc_cs_required(i915)) {
> -		struct intel_gt *gt =3D i915->media_gt;
> -		struct intel_gsc_uc *gsc =3D gt ? &gt->uc.gsc : NULL;
> -
> -		if (!gsc || !intel_uc_fw_is_running(&gsc->fw)) {
> -			drm_dbg_kms(&i915->drm,
> -				    "GSC components required for HDCP2.2 are
> not ready\n");
> +		if (!intel_hdcp_gsc_check_status(i915))
>  			return false;
> -		}
>  	}
>=20
>  	/* MEI/GSC interface is solid depending on which is used */ diff --git
> a/drivers/gpu/drm/i915/display/intel_hdcp_gsc.c
> b/drivers/gpu/drm/i915/display/intel_hdcp_gsc.c
> index d753db3eef15..d355d610bc9f 100644
> --- a/drivers/gpu/drm/i915/display/intel_hdcp_gsc.c
> +++ b/drivers/gpu/drm/i915/display/intel_hdcp_gsc.c
> @@ -17,6 +17,20 @@ bool intel_hdcp_gsc_cs_required(struct
> drm_i915_private *i915)
>  	return DISPLAY_VER(i915) >=3D 14;
>  }
>=20
> +bool intel_hdcp_gsc_check_status(struct drm_i915_private *i915) {
> +	struct intel_gt *gt =3D i915->media_gt;
> +	struct intel_gsc_uc *gsc =3D gt ? &gt->uc.gsc : NULL;
> +
> +	if (!gsc || !intel_uc_fw_is_running(&gsc->fw)) {
> +		drm_dbg_kms(&i915->drm,
> +			    "GSC components required for HDCP2.2 are not
> ready\n");
> +		return false;
> +	}
> +
> +	return true;
> +}
> +
>  static int
>  gsc_hdcp_initiate_session(struct device *dev, struct hdcp_port_data *dat=
a,
>  			  struct hdcp2_ake_init *ake_data)
> diff --git a/drivers/gpu/drm/i915/display/intel_hdcp_gsc.h
> b/drivers/gpu/drm/i915/display/intel_hdcp_gsc.h
> index cbf96551e534..eba2057c5a9e 100644
> --- a/drivers/gpu/drm/i915/display/intel_hdcp_gsc.h
> +++ b/drivers/gpu/drm/i915/display/intel_hdcp_gsc.h
> @@ -23,5 +23,6 @@ ssize_t intel_hdcp_gsc_msg_send(struct
> drm_i915_private *i915, u8 *msg_in,
>  				size_t msg_out_len);
>  int intel_hdcp_gsc_init(struct drm_i915_private *i915);  void
> intel_hdcp_gsc_fini(struct drm_i915_private *i915);
> +bool intel_hdcp_gsc_check_status(struct drm_i915_private *i915);
>=20
>  #endif /* __INTEL_HDCP_GCS_H__ */
> --
> 2.25.1

