Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92801C4167B
	for <intel-xe@archiver.kernel.org>; Fri,  1 Dec 2023 07:04:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4A4110E7F6;
	Fri,  1 Dec 2023 07:04:41 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4695110E7F6
 for <intel-xe@lists.freedesktop.org>; Fri,  1 Dec 2023 07:04:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701414278; x=1732950278;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=cSzxJRs/+hRhFWNmaKPKEF4wBisOPZm4buQhFF8v99Q=;
 b=SotjlXevqQ+3V5hYa0EPN3IPW65uIwmiFGAfTvlfSpgGD+0C8JP173zm
 XT68iiIbClutoN43BHf9ejxxfLlnhFhqARLTT55Xd1ghyBI227s1RyOhM
 c6Fa4AeIM5lYYWYKSsOZY5ER0amK+HtEek/S6B4d1dAhmf4CagUC/rdGV
 Tcp4xfaZhFMYOn+2QYGvZUdH8G8j9q50hYTl/xV4E06J75KIkAXTnuEM/
 vxdu9tVBatwstR2OXAN/Oq4sGHt47MVBv45vj8B1JMoi8Ai5LZ2OymxKl
 /HYsJzzcSePG4f4jG2c5M6p3k91+9iCtCRrjMESwoVFa76OCBwDTKlNox g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="456089"
X-IronPort-AV: E=Sophos;i="6.04,241,1695711600"; 
   d="scan'208";a="456089"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2023 23:04:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="887540209"
X-IronPort-AV: E=Sophos;i="6.04,241,1695711600"; d="scan'208";a="887540209"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 30 Nov 2023 23:04:36 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 30 Nov 2023 23:04:35 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Thu, 30 Nov 2023 23:04:35 -0800
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.40) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Thu, 30 Nov 2023 23:04:35 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JrrS0vtg6xae7gqswOgROICyoXYAHfZKfFXEQUS8XJLCtAvrsEW2eMwpzLz5yEF/2M0YVq7LoZTFAkW+eDpCQFO5H99j7VwhQze7G6fZ1qVMaoXAaaQzEePLguC45I6sof1jACyn9ENntAQgdaOV8y7W4DFQM2Z5FYEdXZR1C0qMKxa3us+GpwrWIkPH8e/kJUVRIEo35RpXl7HG2ExSOnn/6eb3qsjEN6KJ4sCKQGfBWTLQgc8pSFebzloNQk/cQMKrQ1lXyG3JAH5EMua3MYZvsWUOLrp0BZGaI0rfHCwDWyYZGwMoJKYrm5RmNjPMJFqWzFZHN8Ad0/v8kOH9Vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lTYxIabApXoTrdquFCxmfF5wuV/DdnSMj/4hVJDU2Ig=;
 b=mF5gIy6xadh6tImIfKRLahyhOoTSfd9jIruVjmEzxjjB+/o8QlCchIRLVJGZMQR/Z4qCHiSGQkIE+h4Jyw/iIegayYorOaaHHUQz1ZphHgQQaeD60Qw3SWdHOn6S2IGQKtekKgE/OCuuSfEu7gClxxTBXI6s+Zwq4B849F8N5Jx7V5A5geywltKgvcrlQrwYw7NMFKsIPXg0fQGNjCqyXqHA7ccjehwI/mnug5EeYREWwO0Be22j09ZAp/bzXqSLz2iWXTO/5OEnsU6A2bjdKP709OxuH9/aOMkufhDxthG+4NT1f7CoQx2OYyBWmeHaR6UrphOwG3YQzMwui7fR4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6211.namprd11.prod.outlook.com (2603:10b6:930:25::6)
 by SJ1PR11MB6274.namprd11.prod.outlook.com (2603:10b6:a03:457::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.24; Fri, 1 Dec
 2023 07:04:31 +0000
Received: from CY5PR11MB6211.namprd11.prod.outlook.com
 ([fe80::a226:f114:4de2:5762]) by CY5PR11MB6211.namprd11.prod.outlook.com
 ([fe80::a226:f114:4de2:5762%4]) with mapi id 15.20.7046.024; Fri, 1 Dec 2023
 07:04:31 +0000
From: "Gupta, Anshuman" <anshuman.gupta@intel.com>
To: "Sundaresan, Sujaritha" <sujaritha.sundaresan@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Thread-Topic: [Intel-xe] [PATCH] drm/xe: Change the name of frequency sysfs
 attributes
Thread-Index: AQHaI0Y7DZdSonGJEUqZjvsLIK2lAbCT/COw
Date: Fri, 1 Dec 2023 07:04:31 +0000
Message-ID: <CY5PR11MB62111912243CC6683902785B9581A@CY5PR11MB6211.namprd11.prod.outlook.com>
References: <20231130043914.343820-1-sujaritha.sundaresan@intel.com>
In-Reply-To: <20231130043914.343820-1-sujaritha.sundaresan@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6211:EE_|SJ1PR11MB6274:EE_
x-ms-office365-filtering-correlation-id: 008a6313-2441-487b-986d-08dbf23bc483
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: g5vzDc3nUvvEbZ057+31/sR8DGpODYGQ2KNYgHMNqgu40pxtYLXDIdXs/KqqN71DMwRWUMWnvsY2oqL/8Sp2+Mvs1CzKtFNnb/mtmHrbsrN5sDWcrt1+PUzlfCM5ETahzjC6nq2vF5Tdr/F+XyLI7gIvWVh3jGddnzfcHTJPzjKaPaEJwqpzF0KnBG/chzaLjlLZWvR6yP3hlT4+p5oTm7hVKXAlxrwYxikdN6O5b0JySZWVo+FvqHC8Tgl63Y359o6SWmthmb1NpyQoxiZaAtpD5YAc4so1Bjlm0uA+BP+BK63LjzQryzSMA1k8ZA3LmjPQENOedwcgiDnBdzGIenaVdRoIJf7ypvzHnYSQtUsmzQyIINz4fDocmD2sjystgQ59WWHb0+Vkf9w7thTQIyadyYB9qvAsnq2Rp7UEdxx5Fnh21b6DohVZMl4M2pHlxASJlS/FMkBZt9RoVLYYCnzSYHbgcd2ioCU/sHwrURlQojMzlU2kywsy7M9GVPvKpx1IPioHRLgHCV+jIYIoR3M0dgoXN3UhkYhWNjoW4aI06R+IKpkZZ9qRN8NYetjC2DVi1Af/SlmnttC9hWWGMCR1UFRFHFnXntfq6fCTNK3HTvpOhsBTO9GxRBgIS/Fr
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6211.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(136003)(396003)(39860400002)(366004)(346002)(230922051799003)(1800799012)(451199024)(186009)(64100799003)(55016003)(38070700009)(122000001)(33656002)(5660300002)(41300700001)(2906002)(86362001)(83380400001)(9686003)(71200400001)(53546011)(82960400001)(38100700002)(107886003)(6506007)(7696005)(26005)(76116006)(478600001)(110136005)(52536014)(4326008)(66446008)(64756008)(66556008)(316002)(54906003)(8676002)(8936002)(66946007)(66476007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?7wyAv0bDBzAo0wOJK0aeTRTsBqGK+ODwC8lg3wnr+WFw2XXxEEgGhROlx+DC?=
 =?us-ascii?Q?tk4MMViD9hEQoGTjDjo+QVT30YnKqD2WKwjXeXDFwuCZ9Sbd3sRDnXSVmBMn?=
 =?us-ascii?Q?LCNlH36MpGreruvaiJujST+H75yFxFvMP8Rp8lAkGZOYK89ACCAeKtKpD6fI?=
 =?us-ascii?Q?2CFfWH2jsG2zOXqKrlB0MTddMKY4N/qVK/re6J/dWE0Lesbi8RGLwkHm62gS?=
 =?us-ascii?Q?iYqslu2jDWNzPWlZ4QOJzN2Uyqx2Qd/q6qAR3aMMdpstpXdWSsrHy8y0dPss?=
 =?us-ascii?Q?myEGsVkdDHrQKcczltGJRBdwX7O+QPds6tMMCYvXawaq71sJLi2qxEuvhIXG?=
 =?us-ascii?Q?OMWd8weGCIpobboO+rI+GjvjV96M3SlniVaxWZUEgxBQnY4tVmV4d0S5KgDX?=
 =?us-ascii?Q?gK1KHxNe/EkfEiO3zoPoUdUIgRoT7dkGz16YiurNpnifpUMrc+qGdfBiMsiz?=
 =?us-ascii?Q?f4NDeNNunJaqTzo7c7PRmej8ZZyJoHxl5VNr2IJSHpzuBiVjq0ull79BPqTS?=
 =?us-ascii?Q?3sFhe+gJSnmGZpYjoXfRakCxf8vySz1TmxA2Ulj5q7X4KN+sMusi8c/H6H5C?=
 =?us-ascii?Q?X+QuTYBu/q0my/EjBFgZ2wLKPJvumPnTeu03E7eaU1EtAsg2CsakBgOIF9eq?=
 =?us-ascii?Q?KWSm8DvHXjy+LevfDzzhGc8lSX7JrRkF1WqeAO1lAspbb+qHJHslFYeLDkmN?=
 =?us-ascii?Q?VW8seNbLMCDsMxFoqdwG9e1758NSonkTNXZoyfC20gjgg+Js2kRS8GjOCFcc?=
 =?us-ascii?Q?HREwbS0iprGQUCX2yYWJWDpWqj/6rUBfMfgp302UBgDIH2RVtzSQOkA1onqh?=
 =?us-ascii?Q?lTd5z5L4u+VwpI+TlVqCm2qidGOFWDlO6uQDI5zLIn3VW6QnPpVRrMlKsud+?=
 =?us-ascii?Q?RRINiRneWWjwlQeJ7/KG3tLuiP0rpOI7/Xp/tyUBck0t4rLt+fyB/B9/6kf7?=
 =?us-ascii?Q?lbNYZJp/56aCBUkCxi4evx+42jLRAC8h3vI6Ky3A+0jtOKIRSd4Ecl3CLxlH?=
 =?us-ascii?Q?VhZQox0Dq33o+wxaEEDTPR3hfxWN6ecyZp3tySgoh9Ippg78rLnBPAUAChT6?=
 =?us-ascii?Q?vzsVsnG52kabAYr6t2Np8jFbqwphyFC4HoC763+7wpwxopkgFNl3Rdcdgh6X?=
 =?us-ascii?Q?33Po4GHUZb/Rc5sBaEYzIAFj7opm95hMAwh91u7xa7txap+hYrguOsXEXZ7V?=
 =?us-ascii?Q?QHa+fZMv4GT7nz0hM21f5Xsr2XfmIYvO+wZV9WPwHnbPlIfaC5S4zKCHM7rC?=
 =?us-ascii?Q?Ac6QP1hDJXd5BU6vWOR2o2q7sFf38nfSdr+xI8Gqp4s/iWi5EM7xqxu0NJMO?=
 =?us-ascii?Q?YrnWMlSo9wfAaExLLaEs44BgmC4eCd1x63WDkPcNZ+3CGpDCHhSDu+uJjuQj?=
 =?us-ascii?Q?zbRlDamiT/4RIc0Mm6gG26aat1AiW0lgGugHQemyQXxaCpC3OgCBfDvp0tEg?=
 =?us-ascii?Q?pTwrW1sPt2SEFADJdkaRauSoHFVHllreEbYaz1RxG2g+UALDKbDBAjp/IBoc?=
 =?us-ascii?Q?KKP/7UimmtQyUb4IhcV9nreqXhbf1JsshR+XIzOpIfpL23//xMQLTAKROlrz?=
 =?us-ascii?Q?UyAbbsjnBzPWhGXWAjjmqstscTALobmDD5slyka5?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6211.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 008a6313-2441-487b-986d-08dbf23bc483
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Dec 2023 07:04:31.6952 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8SqObtFi7D+WMRLNJ2Co4PTmr/gaLb6Cc4JF1qKXUlCJnxt+mi0b6Hkyoyc1rH8GyFzlb0dKWqeSoBHmi22tXx/HHZTETcIfAhROPwQmZh8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6274
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: Change the name of frequency sysfs
 attributes
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
Cc: "Sundaresan, Sujaritha" <sujaritha.sundaresan@intel.com>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>



> -----Original Message-----
> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Suja=
ritha
> Sundaresan
> Sent: Thursday, November 30, 2023 10:09 AM
> To: intel-xe@lists.freedesktop.org
> Cc: Sundaresan, Sujaritha <sujaritha.sundaresan@intel.com>; Vivi, Rodrigo
> <rodrigo.vivi@intel.com>
> Subject: [Intel-xe] [PATCH] drm/xe: Change the name of frequency sysfs at=
tributes
>=20
> Switching the names of frequency sysfs attrbutes to align with required d=
evfreq
> changes. The name changes are as below;
>=20
> -freq_act -> act_freq
> -freq_cur -> cur_freq
> -freq_rpn -> rpn_freq
> -freq_rpe -> rpe_freq
> -freq_rp0 -> rp0_freq
> -freq_min -> min_freq
> -freq_max -> max_freq
This would be better to be floated with the series of other devfreq related=
 patches.
Otherwise it raises a question why do we need these name changes ?

Br,
Anshuman Gupta.
>=20
> Signed-off-by: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc_pc.c | 60 +++++++++++++++++-----------------
>  1 file changed, 30 insertions(+), 30 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_p=
c.c
> index 1943893a3fd7..8233277b76e4 100644
> --- a/drivers/gpu/drm/xe/xe_guc_pc.c
> +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
> @@ -60,15 +60,15 @@
>   * Xe's GuC PC provides a sysfs API for frequency management:
>   *
>   * device/gt#/freq_* *read-only* files:
> - * - freq_act: The actual resolved frequency decided by PCODE.
> - * - freq_cur: The current one requested by GuC PC to the Hardware.
> - * - freq_rpn: The Render Performance (RP) N level, which is the minimal=
 one.
> - * - freq_rpe: The Render Performance (RP) E level, which is the efficie=
nt one.
> - * - freq_rp0: The Render Performance (RP) 0 level, which is the maximum=
 one.
> + * - act_freq: The actual resolved frequency decided by PCODE.
> + * - cur_freq: The current one requested by GuC PC to the Hardware.
> + * - rpn_freq: The Render Performance (RP) N level, which is the minimal=
 one.
> + * - rpe_freq: The Render Performance (RP) E level, which is the efficie=
nt one.
> + * - rp0_freq: The Render Performance (RP) 0 level, which is the maximum=
 one.
>   *
>   * device/gt#/freq_* *read-write* files:
> - * - freq_min: GuC PC min request.
> - * - freq_max: GuC PC max request.
> + * - min_freq: GuC PC min request.
> + * - max_freq: GuC PC max request.
>   *             If max <=3D min, then freq_min becomes a fixed frequency =
request.
>   *
>   * Render-C States:
> @@ -388,7 +388,7 @@ static void pc_update_rp_values(struct xe_guc_pc *pc)
>  	pc->rpn_freq =3D min(pc->rpn_freq, pc->rpe_freq);  }
>=20
> -static ssize_t freq_act_show(struct device *dev,
> +static ssize_t act_freq_show(struct device *dev,
>  			     struct device_attribute *attr, char *buf)  {
>  	struct kobject *kobj =3D &dev->kobj;
> @@ -413,9 +413,9 @@ static ssize_t freq_act_show(struct device *dev,
>  	xe_device_mem_access_put(gt_to_xe(gt));
>  	return ret;
>  }
> -static DEVICE_ATTR_RO(freq_act);
> +static DEVICE_ATTR_RO(act_freq);
>=20
> -static ssize_t freq_cur_show(struct device *dev,
> +static ssize_t cur_freq_show(struct device *dev,
>  			     struct device_attribute *attr, char *buf)  {
>  	struct kobject *kobj =3D &dev->kobj;
> @@ -442,18 +442,18 @@ static ssize_t freq_cur_show(struct device *dev,
>  	xe_device_mem_access_put(gt_to_xe(gt));
>  	return ret;
>  }
> -static DEVICE_ATTR_RO(freq_cur);
> +static DEVICE_ATTR_RO(cur_freq);
>=20
> -static ssize_t freq_rp0_show(struct device *dev,
> +static ssize_t rp0_freq_show(struct device *dev,
>  			     struct device_attribute *attr, char *buf)  {
>  	struct xe_guc_pc *pc =3D dev_to_pc(dev);
>=20
>  	return sysfs_emit(buf, "%d\n", pc->rp0_freq);  } -static
> DEVICE_ATTR_RO(freq_rp0);
> +static DEVICE_ATTR_RO(rp0_freq);
>=20
> -static ssize_t freq_rpe_show(struct device *dev,
> +static ssize_t rpe_freq_show(struct device *dev,
>  			     struct device_attribute *attr, char *buf)  {
>  	struct xe_guc_pc *pc =3D dev_to_pc(dev); @@ -465,18 +465,18 @@ static
> ssize_t freq_rpe_show(struct device *dev,
>  	xe_device_mem_access_put(xe);
>  	return sysfs_emit(buf, "%d\n", pc->rpe_freq);  } -static
> DEVICE_ATTR_RO(freq_rpe);
> +static DEVICE_ATTR_RO(rpe_freq);
>=20
> -static ssize_t freq_rpn_show(struct device *dev,
> +static ssize_t rpn_freq_show(struct device *dev,
>  			     struct device_attribute *attr, char *buf)  {
>  	struct xe_guc_pc *pc =3D dev_to_pc(dev);
>=20
>  	return sysfs_emit(buf, "%d\n", pc->rpn_freq);  } -static
> DEVICE_ATTR_RO(freq_rpn);
> +static DEVICE_ATTR_RO(rpn_freq);
>=20
> -static ssize_t freq_min_show(struct device *dev,
> +static ssize_t min_freq_show(struct device *dev,
>  			     struct device_attribute *attr, char *buf)  {
>  	struct xe_guc_pc *pc =3D dev_to_pc(dev); @@ -513,7 +513,7 @@ static
> ssize_t freq_min_show(struct device *dev,
>  	return ret;
>  }
>=20
> -static ssize_t freq_min_store(struct device *dev, struct device_attribut=
e *attr,
> +static ssize_t min_freq_store(struct device *dev, struct
> +device_attribute *attr,
>  			      const char *buff, size_t count)  {
>  	struct xe_guc_pc *pc =3D dev_to_pc(dev); @@ -543,9 +543,9 @@ static
> ssize_t freq_min_store(struct device *dev, struct device_attribute *attr,
>  	xe_device_mem_access_put(pc_to_xe(pc));
>  	return ret ?: count;
>  }
> -static DEVICE_ATTR_RW(freq_min);
> +static DEVICE_ATTR_RW(min_freq);
>=20
> -static ssize_t freq_max_show(struct device *dev,
> +static ssize_t max_freq_show(struct device *dev,
>  			     struct device_attribute *attr, char *buf)  {
>  	struct xe_guc_pc *pc =3D dev_to_pc(dev); @@ -571,7 +571,7 @@ static
> ssize_t freq_max_show(struct device *dev,
>  	return ret;
>  }
>=20
> -static ssize_t freq_max_store(struct device *dev, struct device_attribut=
e *attr,
> +static ssize_t max_freq_store(struct device *dev, struct
> +device_attribute *attr,
>  			      const char *buff, size_t count)  {
>  	struct xe_guc_pc *pc =3D dev_to_pc(dev); @@ -601,7 +601,7 @@ static
> ssize_t freq_max_store(struct device *dev, struct device_attribute *attr,
>  	xe_device_mem_access_put(pc_to_xe(pc));
>  	return ret ?: count;
>  }
> -static DEVICE_ATTR_RW(freq_max);
> +static DEVICE_ATTR_RW(max_freq);
>=20
>  /**
>   * xe_guc_pc_c_status - get the current GT C state @@ -667,13 +667,13 @@
> u64 xe_guc_pc_mc6_residency(struct xe_guc_pc *pc)  }
>=20
>  static const struct attribute *pc_attrs[] =3D {
> -	&dev_attr_freq_act.attr,
> -	&dev_attr_freq_cur.attr,
> -	&dev_attr_freq_rp0.attr,
> -	&dev_attr_freq_rpe.attr,
> -	&dev_attr_freq_rpn.attr,
> -	&dev_attr_freq_min.attr,
> -	&dev_attr_freq_max.attr,
> +	&dev_attr_act_freq.attr,
> +	&dev_attr_cur_freq.attr,
> +	&dev_attr_rp0_freq.attr,
> +	&dev_attr_rpe_freq.attr,
> +	&dev_attr_rpn_freq.attr,
> +	&dev_attr_min_freq.attr,
> +	&dev_attr_max_freq.attr,
>  	NULL
>  };
>=20
> --
> 2.25.1

