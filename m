Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FB7BC47073
	for <intel-xe@archiver.kernel.org>; Mon,  1 Jan 2024 14:37:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C069B8825B;
	Mon,  1 Jan 2024 14:37:31 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 582FE8825B
 for <intel-xe@lists.freedesktop.org>; Mon,  1 Jan 2024 14:37:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704119850; x=1735655850;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Up3zVuIHBiqrjhrJfMBKWRqo7eL/AObO+kEa6ABJlxA=;
 b=adMBwN+2J7nnL+x9VRpQTIM5BEuB+kUBRZYBP5wMmCxSLuUu2dcuohI6
 YxJpM/tpiohr/fex4xnqgOTdAOllRlrFYeOZtLYcbEZBOEuRFOK///gmL
 WTMNTVNnxsLmO9YagLVlljxQEY7SiznFQyR/34aFWcPUraPXjjCfqoNa1
 q8vhutQ763ewUb+B5kP49n5I7Ws7LfJh3g0qChSBUV9ahflELeuUoN9uf
 at7LUjx40Jy2D5i9kL9U7N9nyriau3PC3IhvgsBrDuqHCuprymHFl1nwf
 7kWdSHtMjX3o3qwkBwfYjaV6Cv97YLcR0N22n/of3F9RP8wv3MboU1+s5 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10940"; a="18338934"
X-IronPort-AV: E=Sophos;i="6.04,322,1695711600"; d="scan'208";a="18338934"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jan 2024 06:37:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10940"; a="808283722"
X-IronPort-AV: E=Sophos;i="6.04,322,1695711600"; d="scan'208";a="808283722"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 01 Jan 2024 06:37:27 -0800
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 1 Jan 2024 06:37:28 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 1 Jan 2024 06:37:28 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 1 Jan 2024 06:37:28 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h5NWwFPHwrJLWmPgkk5Iqyj0dk6h+2bQJMDwNKSAm3tBC6zEjnVHubcM4sRgoTlphpF4ax+rCJ8ySX2X/hIkPJFTZZxG+x7Ub2scs9SkVttv5E09cMt89ucdtkQz8r4n4r9Z9vKKcYceP3Et8dG4kDZZRglsZRPY5SU12k0JWvuQSVC6iFrvNVG9ttCoTDzJVtLJ8PXMlgWJHjy/NhPa8UtO1eknbQfnnTIflGbykvReWfP6cWRVLVOJyx1xN1uq7YMpTq9N6ruSa7toxzxT19bt0IxGnExzvH+jW5TQqm7A4zXWhcbQImqt8WoBZog19zbiQWXnIDTLlRdDyQBpog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cPWH8GS+lSp9HPpGPQ4YLDLiyeAGrLpofOjWo13KWgc=;
 b=UVPWXcbcWGKgMEZdZyVc+34KFOWXN6yMnn6iZT3yQnC+nEsymmnPF6AiQswu2Hujf7ibuLn7MnsrIpz5mqiDrRDZuNWf2BuhG3G3WV+q3F3x21tkkYTd4vsv6Boy6Iq5nodZlKwjj7m/y1pM8R7dx7uIcYMe0J22SSGRZS4vegbIYrDWHFPata+K5RDZqN9eyrTuIix1SuG4H5CPA7l4mUCBgswU46xqjSWx+7hNkDyBpGFWHQQ6NwhbYwfAuk32B4ggVEiyQx2Lx/LE6JMCdXV/Np+O1h1CK4NtFiGs0au2lEc0TCj9h4p8SD4pViRSn38BKAI+mKj15lcipPcohQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6211.namprd11.prod.outlook.com (2603:10b6:930:25::6)
 by BY1PR11MB8077.namprd11.prod.outlook.com (2603:10b6:a03:527::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7135.23; Mon, 1 Jan
 2024 14:37:21 +0000
Received: from CY5PR11MB6211.namprd11.prod.outlook.com
 ([fe80::a226:f114:4de2:5762]) by CY5PR11MB6211.namprd11.prod.outlook.com
 ([fe80::a226:f114:4de2:5762%4]) with mapi id 15.20.7135.023; Mon, 1 Jan 2024
 14:37:21 +0000
From: "Gupta, Anshuman" <anshuman.gupta@intel.com>
To: "Poosa, Karthik" <karthik.poosa@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH] drm/xe/debugfs: Add support for gt synchronous force reset
Thread-Topic: [PATCH] drm/xe/debugfs: Add support for gt synchronous force
 reset
Thread-Index: AQHaO/c32XSTumEbpUmARO5Bf0wThLDFA+KQ
Date: Mon, 1 Jan 2024 14:37:20 +0000
Message-ID: <CY5PR11MB62114F7D75F8A7DBF6066A6A9562A@CY5PR11MB6211.namprd11.prod.outlook.com>
References: <20231231144733.568481-1-karthik.poosa@intel.com>
In-Reply-To: <20231231144733.568481-1-karthik.poosa@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6211:EE_|BY1PR11MB8077:EE_
x-ms-office365-filtering-correlation-id: a9d864ea-9dbe-4d7b-9431-08dc0ad7293a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Sz+wgcxK8eXQUpP5UOzBZa/31NPzv73wa7/OVprUUIFyqJClElwIigM4+dVSCGsXSCz7RxSGAtQcs1uSvYd0zo3JwGrqhKwKBBe7R8qDQkGLoicZaZ3/f1Tm5qIiPVDRt4/7rvBpQ75lTRx7f+Jn9U2EM/JHhY1uEHCSCtLLJkhqbDoLq27r/CNNIoLubfhIdVf192uUDYD4s9Xfaiu8SNNqvfkfZekbcbkvf24+kGaHoOG8TE8P0MoV38vA+Kmv4r/jJrelw3MruTdEUjeSeRWk+3P1enIEG72FGJ6I1H+hlQCy0D81YNVNqwihiHAVoN3IRg6qxZ706dtyUwv1Z+1v9KS8exBQY9oqP53NapVdVlvtV0yd7oUxB99P3xfDreV2+Jcw2Zy31chhA9nXFUzoQDTr7seLg+GJU6ucntcEtfUekt6TVBS5Bp1u1Mkz2WLhB121cTjDLsKzePu1fnsDmTRULfffQeFlhiaa3UQSY9P2PYVdGlwLxCryzk4N7IUbAqdr3/oPhR4rHo1LdUqpDsjmQCgnlamb5Q0zB3+HTrsm+AvK9Ex1vkXjQOYVPnQEoYAD3QJ4xefbUg3289Y2mv0LNd87aIc8YXZv/xiVTcrsiFMHLR5i7wskHzC/MPijfbk5ptFjAFRx7km+bg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6211.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(366004)(39860400002)(136003)(376002)(396003)(230922051799003)(1800799012)(451199024)(64100799003)(186009)(55016003)(107886003)(83380400001)(26005)(86362001)(38070700009)(38100700002)(33656002)(82960400001)(4326008)(52536014)(53546011)(9686003)(71200400001)(6506007)(7696005)(66946007)(54906003)(76116006)(316002)(8676002)(8936002)(64756008)(5660300002)(122000001)(66556008)(66476007)(66446008)(2906002)(41300700001)(110136005)(478600001)(309714004);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Q4DIdHs3sAJvhzedj04lm0NllHOcfBOKOLOXqNRQmnx5htZjFudbgJwFKijl?=
 =?us-ascii?Q?iYB8YXmTKl6n9Q+o83fv8eyJ/UuPfpXngJkLCI3chV7Cn/RKsoiLktV+PAO6?=
 =?us-ascii?Q?CF8eOnLqhBccy4R69KlsEBrU/tqZVdgklN4xRvf3YFW0SLza0QMooZF7CSxo?=
 =?us-ascii?Q?n9mVEVDZAVykD8vUxeogXS39aLlK5WqfOEfMrRcOuXk1rFy6iI+baqGb+cvm?=
 =?us-ascii?Q?GI8wTA67mGTRi/77da8dYrrZKNIEBvtWPVMmGkaQ3YH7/OeQI7gHCEfsmTi1?=
 =?us-ascii?Q?oMAowhtK6CjwkL/NL+3DFn6quy0j2SOJcgwPpFDPxlyCvfrFN+uTxCQP2WXx?=
 =?us-ascii?Q?3f7vfBUxx5V/aCXeUbiXmru8BUGRmp5hSeqHBFGSRBDu+f61CJDp5q7JFCjj?=
 =?us-ascii?Q?on9HD+fqt4IKiL9i3neYjxZTtXC+bZwHoPk/GaG+S/GQMrBXOLoNEVXmII4l?=
 =?us-ascii?Q?ZPKzujACu2hfPGPPisn4WROm1dF3F6o9LQsLSoS9QyGTDiXP5OzmtPwwMPCj?=
 =?us-ascii?Q?lRnw+tn3sRMhJb/zu77726wgbqPlnWQRVTMr/oPTq7H9YL5lH1aUYp8qSk6P?=
 =?us-ascii?Q?IADgeV1ZdNJX9TW8OVqLzWlu0/y15Vi2P/9NRSvPxi314mrdouuFx3i+06UL?=
 =?us-ascii?Q?EUdPRuyQA/7UNPhqdqis54g3JLD8A66L5QwQmNDiBFlJDK3b2J8Uw3DEQtSM?=
 =?us-ascii?Q?tSbgk0mxeHeYa5DjBc/UCEWvPszz6L6OqMHZtp1/Lud5aHAsOjNtkRHkCsiF?=
 =?us-ascii?Q?JLKF/RfAjEvqjeP0JXq12woRovrlm07jFEmHinhU/M/7OEX26VbYpzbotnPW?=
 =?us-ascii?Q?ZK4sDWHCrwLEdv37LpCoiWRBEYrlvSiQxjny+HU6C5ntiikjUMhvfsxHjplq?=
 =?us-ascii?Q?cbVPaKveE27HN4eDcIBwbxTNASEgeRj0CQYb/WWL7L059566VZ+5rwdpc4d6?=
 =?us-ascii?Q?Mtuo8XmSHUjKc5Jusm9ofbUNPhR+zP92UjpjhLByZxtlp++DlKGsKqQZeuJQ?=
 =?us-ascii?Q?VrDVwoPqd9ChPF0xUS5SEVmdnO+3LCHk+7pfe/jM1zvhBcPhqyOt+EXgGmZN?=
 =?us-ascii?Q?J1uH3Faw/uxbmLLvymShzpplaGW/FEU57zCFc6FPJt+fSIZxRkU6r+UxQhjH?=
 =?us-ascii?Q?RTq8/kRwcWU+j/cN3RDUfL6ncOxPX5vZC8hRuoWnjO4xVdF3EJxT/KBnpHde?=
 =?us-ascii?Q?347l6A0eHQ23zpAxzsMvIy0eD+RfLqoSxGYTPCaZBKWo41HlHM8Y4DWMVbZ6?=
 =?us-ascii?Q?if5l+73j4Aroylk9DX7QspT4s4G4U+U+h09yTL6zF+ffCtMqTS9uFCTW8x9t?=
 =?us-ascii?Q?aaMOhcz3BrZk3L/8VyCVPDtGu+rWOCC+OXUHHdq1+Qp49uYQfJhTfJSeoErT?=
 =?us-ascii?Q?H5dv9gVe2wkx0To+qjuAvax2hw3meuYuVAyLFZR3RCT/jbbfvbxVAbUMlTNz?=
 =?us-ascii?Q?MGHzXxDWQpIh4hLNIoEzC6UhqLjTJrEAmPSJZOXW1P6+ucgE2D8vTSkEMAiz?=
 =?us-ascii?Q?yNt4DpPjyuMTmy8C2LaoY2q0zgWw2lkSgcC97hnpY93kA0q9VSA+U7V7JhU7?=
 =?us-ascii?Q?JqlWxhCpIm07wuL4Fl9wKCWqzbSMUwCo+21aVmYN?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6211.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a9d864ea-9dbe-4d7b-9431-08dc0ad7293a
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jan 2024 14:37:20.5292 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OPRtGvaKGMAwf25X5s/ViF4JYU645HZ1s4dU1hGSgTCXI3EZrOtwYxIP0ifE2rsWN6QdTEwd6l/WmwcoFKEeBXdCow09sndAkXciceN05l0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR11MB8077
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
Cc: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>



> -----Original Message-----
> From: Poosa, Karthik <karthik.poosa@intel.com>
> Sent: Sunday, December 31, 2023 8:18 PM
> To: intel-xe@lists.freedesktop.org
> Cc: Gupta, Anshuman <anshuman.gupta@intel.com>; Nilawar, Badal
> <badal.nilawar@intel.com>; Brost, Matthew <matthew.brost@intel.com>;
> Vivi, Rodrigo <rodrigo.vivi@intel.com>; Poosa, Karthik
> <karthik.poosa@intel.com>
> Subject: [PATCH] drm/xe/debugfs: Add support for gt synchronous force res=
et
>=20
> This support added as igt test freq_reset_multiple fails sporadically in =
case
> xe_guc_pc is not started.
> A completion is added in force_reset for this.
> Writing non-zero to force_reset debugfs entry does synchronous reset.
We need IGT patch as well for this patch.
>=20
> v2:
> - Changed wait for completion to interruptible (Anshuman).
> - Moved timeout to xe_gt.h (Anshuman).
> - Created a debugfs for updating timeout (Rodrigo).
>=20
> v3:
> - Update force_reset debugfs with write support.
>   value 0 -> async reset, non-zero -> sync reset (Matthew Brost).
>=20
> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt.c         |  2 +
>  drivers/gpu/drm/xe/xe_gt_debugfs.c | 72
> ++++++++++++++++++++++++++++--  drivers/gpu/drm/xe/xe_gt_debugfs.h
> |  3 ++
>  drivers/gpu/drm/xe/xe_gt_types.h   |  8 ++++
>  4 files changed, 82 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c inde=
x
> 3af2adec1295..c8d2c18b0c62 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -65,6 +65,7 @@ struct xe_gt *xe_gt_alloc(struct xe_tile *tile)
>=20
>  	gt->tile =3D tile;
>  	gt->ordered_wq =3D alloc_ordered_workqueue("gt-ordered-wq", 0);
> +	init_completion(&gt->reset.done);
>=20
>  	return gt;
>  }
> @@ -633,6 +634,7 @@ static int gt_reset(struct xe_gt *gt)
>  	xe_device_mem_access_put(gt_to_xe(gt));
>  	XE_WARN_ON(err);
>=20
> +	complete(&gt->reset.done);
>  	xe_gt_info(gt, "reset done\n");
>=20
>  	return 0;
> diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c
> b/drivers/gpu/drm/xe/xe_gt_debugfs.c
> index c4b67cf09f8f..3518ab89ccfc 100644
> --- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
> @@ -55,15 +55,71 @@ static int hw_engines(struct seq_file *m, void *data)
>  	return 0;
>  }
>=20
> -static int force_reset(struct seq_file *m, void *data)
> +static int force_reset(struct xe_gt *gt, bool is_sync)
>  {
> -	struct xe_gt *gt =3D node_to_gt(m->private);
> +	struct xe_device *xe =3D gt_to_xe(gt);
> +	long ret;
>=20
>  	xe_gt_reset_async(gt);
>=20
> +	if (is_sync) {
> +		drm_info(&xe->drm, "waiting for gt reset completion");
> +		ret =3D wait_for_completion_interruptible_timeout(&gt-
> >reset.done,
> +							msecs_to_jiffies(gt-
> >reset.timeout_ms));
> +		if (ret <=3D 0) {
> +			drm_err(&xe->drm, "gt reset timed out/interrputed,
> ret %ld\n", ret);
> +			return -ETIMEDOUT;
> +		}
> +	}
> +
> +	return 0;
> +}
> +
> +ssize_t force_reset_write(struct file *f, const char __user *buf,
> +size_t len, loff_t *offset) {
> +	struct xe_gt *gt =3D file_inode(f)->i_private;
> +	struct xe_device *xe =3D gt_to_xe(gt);
> +	char arg_str[5];
> +	size_t size;
> +	unsigned long arg;
> +	int ret;
> +
> +	size =3D min(sizeof(arg_str)-1, len);
> +	arg =3D copy_from_user((void *)arg_str, buf, size);
> +	if (arg < 0) {
> +		drm_err(&xe->drm, "reading force_reset arg failed, ret %ld",
> arg);
> +		return arg;
> +	}
> +	arg_str[size] =3D '\0';
> +
> +	ret =3D kstrtoul(arg_str, 0, &arg);
> +	if (ret) {
> +		drm_err(&xe->drm, "force_reset arg parse failed, ret %d", ret);
> +		return ret;
> +	}
> +
> +	ret =3D force_reset(gt, (arg && 1));
How about  !!arg
 > +	if (ret !=3D 0)  {
> +		drm_err(&xe->drm, "force_reset failed, ret %d\n", ret);
> +		return ret;
> +	}
> +	return len;
> +}
> +
> +ssize_t force_reset_read(struct file *f, char __user *buf, size_t len,
> +loff_t *offset) {
> +	struct xe_gt *gt =3D file_inode(f)->i_private;
> +
> +	force_reset(gt, 0);
>  	return 0;
>  }
>=20
> +static const struct file_operations force_reset_fops =3D {
> +	.owner =3D THIS_MODULE,
> +	.write =3D force_reset_write,
> +	.read =3D force_reset_read,
> +};
> +
>  static int sa_info(struct seq_file *m, void *data)  {
>  	struct xe_tile *tile =3D gt_to_tile(node_to_gt(m->private));
> @@ -192,7 +248,6 @@ static int vecs_default_lrc(struct seq_file *m, void
> *data)
>=20
>  static const struct drm_info_list debugfs_list[] =3D {
>  	{"hw_engines", hw_engines, 0},
> -	{"force_reset", force_reset, 0},
>  	{"sa_info", sa_info, 0},
>  	{"topology", topology, 0},
>  	{"steering", steering, 0},
> @@ -245,5 +300,16 @@ void xe_gt_debugfs_register(struct xe_gt *gt)
>  				 ARRAY_SIZE(debugfs_list),
>  				 root, minor);
>=20
> +	gt->reset.fr_dentry =3D debugfs_create_file("force_reset", 0600, root,
> xe,
> +			    &force_reset_fops);
Please use DEFINE_SHOW_STORE_ATTRIBUTE here to create rw debugfs entry.
Use force_reset_show and force_reset_restore function name.
> +	if (!gt->reset.fr_dentry)
> +		drm_warn(&xe->drm, "force_reset debugfs file creation
> failed");
> +	d_inode(gt->reset.fr_dentry)->i_private =3D gt;
> +
> +	debugfs_create_u32("gt_reset_timeout_ms", 0600, root,
> +					&gt->reset.timeout_ms);
> +	/* set a default timeout value */
> +	gt->reset.timeout_ms =3D 1000;
xe_gt_debugfs_register() should only do the job of debugfs registration.
This is odd here.
> +
>  	xe_uc_debugfs_register(&gt->uc, root);  } diff --git
> a/drivers/gpu/drm/xe/xe_gt_debugfs.h
> b/drivers/gpu/drm/xe/xe_gt_debugfs.h
> index 5a329f118a57..40adcf1822c6 100644
> --- a/drivers/gpu/drm/xe/xe_gt_debugfs.h
> +++ b/drivers/gpu/drm/xe/xe_gt_debugfs.h
> @@ -6,8 +6,11 @@
>  #ifndef _XE_GT_DEBUGFS_H_
>  #define _XE_GT_DEBUGFS_H_
>=20
> +#include <linux/fs.h>
>  struct xe_gt;
>=20
>  void xe_gt_debugfs_register(struct xe_gt *gt);
> +ssize_t force_reset_write(struct file *f, const char __user *buf,
> +size_t len, loff_t *offset); ssize_t force_reset_read(struct file *f,
> +char __user *buf, size_t len, loff_t *offset);
>=20
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_gt_types.h
> b/drivers/gpu/drm/xe/xe_gt_types.h
> index f74684660475..d6134215094b 100644
> --- a/drivers/gpu/drm/xe/xe_gt_types.h
> +++ b/drivers/gpu/drm/xe/xe_gt_types.h
> @@ -148,6 +148,14 @@ struct xe_gt {
>  		 * code to safely flush all code paths
>  		 */
>  		struct work_struct worker;
> +		/** @done : completion for GT reset */
> +		struct completion done;
> +		/** @timeout_ms : gt synchronous reset timeout in ms */
> +		u32 timeout_ms;
> +		/** @dentry: dentry for force_reset */
> +		struct dentry *fr_dentry;
> +		/** @is_sync_reset : gt reset is synchronous */
> +		//bool is_sync_reset;
Remove thus unused var.

Thanks,
Anshuman Gupta.
>  	} reset;
>=20
>  	/** @tlb_invalidation: TLB invalidation state */
> --
> 2.25.1

