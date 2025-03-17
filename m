Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EEC3C282EC
	for <intel-xe@archiver.kernel.org>; Mon, 17 Mar 2025 07:13:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3DF310E31E;
	Mon, 17 Mar 2025 07:13:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="loQyytgz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E74BE10E31E
 for <intel-xe@lists.freedesktop.org>; Mon, 17 Mar 2025 07:13:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742195596; x=1773731596;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=1igdAiVWRuZ1rH878+egMxL00PfyxQi/4WSuvVC4nco=;
 b=loQyytgzLZYj7jozqf3/WYgDt+sxQxViOauq85CVkmTX6FSwiTsQ0qN/
 EDw3qsW10sgH4MCrMf8cVtOiycN80AjREVJRe+8rNXYbDMhwAhhGd7X+f
 N0HnRbF0cL5eRPzXggUmRVzW7oP2RSvElRnObutdMsp98Aqj4PEHboK1J
 VhyAoSnJy7mH1rHsbb1Bt97S8Ru5wnDh24a/4f+GBf58AWlakE+TBvANb
 2nD9hRervPubwel0Ad910O/uP3zy2y7lUA6WcZJPFO6tERfi93czOVa43
 Z9CFGW07ZLTspG50zrQNWOuKT3cnNIn5OK+0zbRU+pj6GDFx0SIxogezM g==;
X-CSE-ConnectionGUID: k2v5WHmwS5Oe0PuK/B76jA==
X-CSE-MsgGUID: g833Ki+YRee8KwD6L7mIzg==
X-IronPort-AV: E=McAfee;i="6700,10204,11375"; a="60817754"
X-IronPort-AV: E=Sophos;i="6.14,253,1736841600"; d="scan'208";a="60817754"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2025 00:13:16 -0700
X-CSE-ConnectionGUID: ev7sqG7cTzaO3003U4FT0Q==
X-CSE-MsgGUID: uBMnwLeTQsus7tsjTGgbog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,253,1736841600"; d="scan'208";a="122368097"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2025 00:13:15 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.1544.14; Mon, 17 Mar 2025 00:13:14 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 17 Mar 2025 00:13:14 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.48) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 17 Mar 2025 00:13:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NsDIT+3V8ZbPNDFelfDg30p8dpEEjMBJ4/HFdfM2awcNEapTofxo+VN9KF0a0goiz46B4TrDt2lUmCxjbA6x+gOZsdcOmmiX6br9hxgYkm4hrxhei+9ctlEd72t5a+y3OfrG3nDAvtXF1DbgQH3wv2TV3RcxVGVcUy8X8X75u0c809VwTKpjo0QoVf4tERT7DQd4sSJ6MdtaKubE3z2H7sYpydjO+yYAxHAt/I5DCvHy/105Po8h+EYVLbG8vkwHUmYXHVG/2E/l8os9ucmmS0MmYrsR6xgMeilJ+VqlgZkNZtWYNWscmrcTAHFWWybsrKxfZGYaBHVlE1Ra+W0HYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R85dWYw75x749uJAcAuOONcZQl39yHB3sDSnsybZ1ss=;
 b=Ct9swCLpmLA7wCIGoQZprCJ3SbtYN+ceZCeQCHF+tL35UqaL5NKH6n8t5mZtqyt9Typow71OO8eLfXMaEux056hoNunDwAPiEnMBA9B33jPbFhuhUKjoDWqqQjx/TAYGmxlILCNyYpib2MbQZzJw5eRa+7T5wldsJhmSe/obBkvi0Cyoa3QSOnWOLQn0wgdAZS0XsijpTvca7EWmpjVOxyhvApJ3+EL/780BwUWCbpRRnnRz0TgiP2knBXIUpLXM6EG8ssXbCv9YNk2p6X7JjwgNa6l5E0R4C4Z+4iU959XD39Yjw+eU2vsn3Mv69wAGEOUPQE+GPpAecl0ryMITEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com (2603:10b6:a03:459::19)
 by CY8PR11MB7779.namprd11.prod.outlook.com (2603:10b6:930:77::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.33; Mon, 17 Mar
 2025 07:12:54 +0000
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762]) by SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762%4]) with mapi id 15.20.8534.031; Mon, 17 Mar 2025
 07:12:53 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Dugast, Francois" <francois.dugast@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Dugast, Francois" <francois.dugast@intel.com>
Subject: RE: [PATCH] drm/xe/hw_engine_class_sysfs: Allow to inject error
 during probe
Thread-Topic: [PATCH] drm/xe/hw_engine_class_sysfs: Allow to inject error
 during probe
Thread-Index: AQHblM8JPw2KWNjM4kan1E5Ggas8abN27irg
Date: Mon, 17 Mar 2025 07:12:53 +0000
Message-ID: <SJ1PR11MB6204C7B86899A14F3B93927581DF2@SJ1PR11MB6204.namprd11.prod.outlook.com>
References: <20250314105050.636983-1-francois.dugast@intel.com>
In-Reply-To: <20250314105050.636983-1-francois.dugast@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6204:EE_|CY8PR11MB7779:EE_
x-ms-office365-filtering-correlation-id: ca4afb5b-2478-4f00-5aab-08dd652322c8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?46ehBNc9LyFkhdgOVOR3/vOVbF1E0c6bhh8wu5USaoEgV2h7M9/UcMMZdb3e?=
 =?us-ascii?Q?pmaGheJZzR9uVByb2HV8Ja9J6k3SPWHCEZQd5b/gz5EdAvGBDs5QGQbYGcqL?=
 =?us-ascii?Q?VXDoO3emw2a4181+61S/7EQUg/jNXSvf/NHPdF6j4m2eQUCLxaz10mcMPdFU?=
 =?us-ascii?Q?/CdRhBZCcURgsKqlUI1P0/9ShQ6QdXj3nn4rez6Idf16ht30E606HXnzJFud?=
 =?us-ascii?Q?XdIilxwiSVcP2oaG5vJYi9LBXl21ZvshiOLTyj8ShBdIjIq36mqp2ncWOHZ7?=
 =?us-ascii?Q?C6PNgC4DbENAuBYyFaQRQV2pEe9Lvm4TLPYN2FcC1DPieGYrff7tZnZer9Hp?=
 =?us-ascii?Q?obcDdM8ENaI5aqGecslJbw+5YxPZ8jXNaFIX6areTp8YfDVga7BysZutZRWZ?=
 =?us-ascii?Q?PQ58cXRw7ayiDN5tSux+7di0X0Bt6fCe0lgoW1FAd5smPupl443hxQr8ENjJ?=
 =?us-ascii?Q?zKCmF7Cseb3kcn4JtV9At2n+hMlVU3arMwEnDc5Z79dcCw+kC7gMBdvFyNu3?=
 =?us-ascii?Q?DqzOMAbKz483bPO+J4qJSpM0k4Rcj4ZDRvTGV9wkjX/VXXCQD1/TMoq5utGG?=
 =?us-ascii?Q?AbY9POTM0ROwzb76/AMaetMbTiRN+SkYl9NltddMX3yj3+saI9ivYueQ0T1d?=
 =?us-ascii?Q?a1z83WNgOgLLz545SxmgCuMtl774lMBDdYANuVjbRTBBdVo6JWe+5sCdMG21?=
 =?us-ascii?Q?BwPJwP/IKNRfCDA4EBCxH85XptCFMkSMc8R8ZYiM9VRrhnUIdbPa/gLuxy/r?=
 =?us-ascii?Q?rh085ugwySLQeqMsFqv8A3EXRah2Jup+xoDG7YTq1MyBkttU7AQDSMU3qQGq?=
 =?us-ascii?Q?GyAYTZATe8IW3PAijiKptZ7SEIbZ96QZd/aDAXYdjRDHxGeXCi4lhOBmb1iW?=
 =?us-ascii?Q?CpdlK/F+kS9bFqUZoYNr3W8JKBTEG4JlMY4dHjpFIdtMThXnADoCmNdywh6l?=
 =?us-ascii?Q?wBLZDHvNU/1BkqucP/yQ19anl81hRgMmhqqp2malI2DxreOUyeakHQB7s7VF?=
 =?us-ascii?Q?c+vBzQb4sZTv560AI1mScgOXAzqED/EWSU67elxzLqrmkGdi8zguB6T9+bqe?=
 =?us-ascii?Q?GBT+/v+Vopo10RfpMyrfM4nQ1KRHjz4KT33Q752nYHZp1HNudTU/LyxIowvX?=
 =?us-ascii?Q?dTwMU3y7SixrLTUgpv15L+Iovz3UHUafIdLcHnuGLVUttWxDiBmWWFrPptk3?=
 =?us-ascii?Q?GeilxZ9XJExAQqgLc0aZjWjNkqnK8uEMtbWkJrERfJwsvK8FT4mWwrXzTwei?=
 =?us-ascii?Q?XxQYDUFhR37ptMpvh5tpuJeEy5JZluj8eg+wTHu4CPRfz++dyt2WoSy3MnOG?=
 =?us-ascii?Q?ztWSAYAedwHe/DekYdwAS9ED5tXWgRm7UtMLXuEt+L9CI5FAhOqSu2TZPdNV?=
 =?us-ascii?Q?yOtT1HdZQHCxh4STeiQ1idhMHTLDpl+8OeJ59eOwJ3BGvFrSUnC6evhIJWjT?=
 =?us-ascii?Q?HHiPb2rCChTqdkkqdycIBW497ogJtp5w?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6204.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?m/5uJnl47lg09KicQ9FgB2px5W7/tmaF+2ddauPOX0uf0IRbdzXsO8yY2yL5?=
 =?us-ascii?Q?koiCHsouDUQeSZKHv/bLrtyjVo4wPFaIliz0VT38JNXTTGgMWd115KDG6R3s?=
 =?us-ascii?Q?+ywXfy+mthCrmj/FjYpaHOO1hYS00NGxUZgUbtP7s0m6lTpjH6gaMN5CvpQ8?=
 =?us-ascii?Q?Py9dHhxwZjCEPgvWbN+iGZsFnzCW4qa9iVkz6VfRP7fkbKFeGTmzcWjUhSW1?=
 =?us-ascii?Q?9OaxOBjjT0tCkNnvuwi+tlS+DDLawshqB98JskqnQUemF2+tk/TZUaZoRmBF?=
 =?us-ascii?Q?kwb/0aS93prsLyLhpOoCibvUpgLrrW0kWxIPkKL/frTZxdiAne8kOLuO5bGY?=
 =?us-ascii?Q?s+rFrUuOzUexhMvUSc7kUEzgSSxywBlDphIuEyt5CXvOKwHl/wTWNKQ/iEqQ?=
 =?us-ascii?Q?9/n+7IkihLzWStRzAqJMHMFgO+Jhz6n7bGEA40u420Uf8wy2CxwLsJxrQUW9?=
 =?us-ascii?Q?INHmOkz8vu0CWM++oLziE7pWJy4ZbCUtMRBSKzjx/cMtBfHoiixZGcJvdaWK?=
 =?us-ascii?Q?rc1dSt1WFroMXLV5Guj7w1QEcCIro9TmLWVkzbtnqd16d4QFeEJIH8fJUVs2?=
 =?us-ascii?Q?QW+REBqnrz2Fd9MCEBUy3AIhTcYP9HPLvi+Jrmoxbhs344NTxH2l1ceMePDB?=
 =?us-ascii?Q?3bG1u1Ab5+2wH0iLuQARHqKSGoLTYDwv9lP4fa0mVGQxFS1OsnKYiv68z9Mq?=
 =?us-ascii?Q?lM0zSa/36oGKJa2sbJsJZON5MfN3KnJOjMVaJOIUNMB1i2ddG1Zjwy1hm3YF?=
 =?us-ascii?Q?NdsewkPq5ZvSiOqt/WZiNC9hNlV13yvQ7tngOcXMe2rXBlHCFe8WCXC1K1sB?=
 =?us-ascii?Q?h1FYOUgMdEJlb3mN7pjF48gCMZzS9EnHbRThluaMOnIIw33ck3BAgP/IKmiK?=
 =?us-ascii?Q?k2y32wq2IxWmgGVrF9EbML9WJx/szHJmsSj7nhSObErwnVVEYuu3jMFskLfi?=
 =?us-ascii?Q?KJ+Ys0Cufpe+acxboKPVt8m/AL0Pvr6yM/JQT/ngG/CAdptPpO7Erhn53sBH?=
 =?us-ascii?Q?oOINGCVTV1hzxR9+ZM/qu9+fYu9jdBo+nX/BcxC2KgSAiBlqXRcylRuPhxdt?=
 =?us-ascii?Q?nryAGCQa1Q0SkYzA7R+4CxkRnreFQrattIVllxD13zQ/JNpS/crcaT7f9a0Y?=
 =?us-ascii?Q?lamJxoBgYiQ2zZQuaZp+/Dfhht4YJny4fMOEcnEJBdDLCRUjeBFZZGWdyEyv?=
 =?us-ascii?Q?/GLaO8zvtqyx4j3tAPVXz6YHj0yb/s1cwE9+4wtPJ80SmxdfixczIFpsLXW0?=
 =?us-ascii?Q?9lg2J3i60c+wS654lcPpNi2Akp1Dkoz7/sCaUC8sZtycI5pvxtgCGttwLCCi?=
 =?us-ascii?Q?ZZgFWkVCdXWb8T+zkA4RZA7wtcVtg9J4HCUDRMcv8A6XBwKevKza29yT8Za9?=
 =?us-ascii?Q?hCgtFz5gRPEcqrUWpxd9nyhAjiiZfEjJswCgAAWcTKay0mTVfAKL5n8VeCib?=
 =?us-ascii?Q?XKxZhLnhp+TnjnbAJpjPkcFH7nqxcxtszViVjwG8S344lNTdHB+aC5Ytwrgp?=
 =?us-ascii?Q?iwz9R5Jtin+YF53eynEDGSpRX5g627sw2IgFmppGsQz3wzkn7yKeEv2zLcSV?=
 =?us-ascii?Q?ioVDcudfyXzbSa2VFekup0vUA3yoiFR90qVpAwuH?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6204.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ca4afb5b-2478-4f00-5aab-08dd652322c8
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Mar 2025 07:12:53.7947 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ji7GRpepu1Exz+TknzRbX/YyOGzVu/vfdQjFtsEVD753v78BpQUx/4DJh342rwCL9Ap2gbp22WwgdPK9/PkXtGdPKzgOsceFKMQilN5oQP4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7779
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>



> -----Original Message-----
> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Fran=
cois
> Dugast
> Sent: Friday, March 14, 2025 4:21 PM
> To: intel-xe@lists.freedesktop.org
> Cc: Dugast, Francois <francois.dugast@intel.com>
> Subject: [PATCH] drm/xe/hw_engine_class_sysfs: Allow to inject error duri=
ng
> probe
>=20
> Allow fault injection in a function used during initialization by
> xe_hw_engine_class_sysfs_init() so that its error handling can be tested.
>=20
> Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c
> b/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c
> index b53e8d2accdb..e238c0e9fdd0 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c
> +++ b/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c
> @@ -558,6 +558,7 @@ static int xe_add_hw_engine_class_defaults(struct
> xe_device *xe,
>  	kobject_put(kobj);
>  	return err;
>  }
> +ALLOW_ERROR_INJECTION(xe_add_hw_engine_class_defaults, ERRNO); /*
> See
> +xe_pci_probe() */

Reviewed-by: Tejas Upadhyay <tejas.upadhyay@intel.com>

Tejas
>=20
>  static void xe_hw_engine_sysfs_kobj_release(struct kobject *kobj)  {
> --
> 2.43.0

