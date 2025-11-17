Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0C6DCEBF61
	for <intel-xe@archiver.kernel.org>; Mon, 17 Nov 2025 14:26:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B17910E1C5;
	Mon, 17 Nov 2025 14:26:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YusGRVPW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 338F510E1C5
 for <intel-xe@lists.freedesktop.org>; Mon, 17 Nov 2025 14:26:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763389583; x=1794925583;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=uQsNNjn2iNYUApTGg5plxj8PAJHC3IAYzhwFvpcpauw=;
 b=YusGRVPWSOlj12vou2Q1t0hC6DxqW/asXXxYeWkDVk2bwKPNJxlFc3pZ
 CkRFsbscmTacQOtmX12l+9squYOCDXGoasbrVPQf1ln+qA/5a+52Wh7c0
 ingxxmwVFndOl0OGWvbSO3Dg6rymr7Z44s9AAYnAq+Et2pFFJx+v0w7nU
 PYyR5aNceaCaE7ALwCmNFlZiHVc8fjpGi/rh/QVPEVHHH6mbw/HC0cPYU
 kpWxiswrfiacACFPfBmhTIrsAX1rJWCirg/qBT2w6IdkcA/tEMVjA0wmU
 F8TE/WgjrH62PFOSHnFYV8XSKZawl5JPWinxG43ZhH1AQMgyIP4IB7BiO w==;
X-CSE-ConnectionGUID: fOLgLYS5Tr2uzKcace9BEA==
X-CSE-MsgGUID: Jfh1DFZ0SrGZ72h2GIh4DA==
X-IronPort-AV: E=McAfee;i="6800,10657,11616"; a="90866434"
X-IronPort-AV: E=Sophos;i="6.19,312,1754982000"; d="scan'208";a="90866434"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2025 06:26:22 -0800
X-CSE-ConnectionGUID: fpJ9u2ywS3yMeZAaoOMcvw==
X-CSE-MsgGUID: nnIFCuSwTXGVQecJMsOeOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,312,1754982000"; d="scan'208";a="195403242"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2025 06:26:22 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 17 Nov 2025 06:26:22 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 17 Nov 2025 06:26:22 -0800
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.56) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 17 Nov 2025 06:26:22 -0800
Received: from CY5PR11MB6211.namprd11.prod.outlook.com (2603:10b6:930:25::6)
 by DM4PR11MB5993.namprd11.prod.outlook.com (2603:10b6:8:5c::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.21; Mon, 17 Nov
 2025 14:26:16 +0000
Received: from CY5PR11MB6211.namprd11.prod.outlook.com
 ([fe80::642:db31:123:8343]) by CY5PR11MB6211.namprd11.prod.outlook.com
 ([fe80::642:db31:123:8343%5]) with mapi id 15.20.9320.013; Mon, 17 Nov 2025
 14:26:16 +0000
From: "Gupta, Anshuman" <anshuman.gupta@intel.com>
To: "Jadav, Raag" <raag.jadav@intel.com>, =?iso-8859-1?Q?Ville_Syrj=E4l=E4?=
 <ville.syrjala@linux.intel.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 Rodrigo Vivi <notifications@github.com>
CC: "De Marchi, Lucas" <lucas.demarchi@intel.com>, "Vivi, Rodrigo"
 <rodrigo.vivi@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>, "Tauro, Riana" <riana.tauro@intel.com>,
 "Brost, Matthew" <matthew.brost@intel.com>, "Wajdeczko, Michal"
 <Michal.Wajdeczko@intel.com>, "Nilawar, Badal" <badal.nilawar@intel.com>
Subject: RE: [PATCH v2] drm/xe/pcode: Convert unsupported commands to debug
 level
Thread-Topic: [PATCH v2] drm/xe/pcode: Convert unsupported commands to debug
 level
Thread-Index: AQHcT6uNSwS+e0UxL0+u9ytharQKYbTnHbYAgAAUWgCAB/SBAIAH1LgA
Date: Mon, 17 Nov 2025 14:26:16 +0000
Message-ID: <CY5PR11MB6211951E2F66A1FBE47276D895C9A@CY5PR11MB6211.namprd11.prod.outlook.com>
References: <20251107055746.110055-1-raag.jadav@intel.com>
 <b4f677ximgoni5pzf6bsh6kkchh52fy6drckbiasqsaekvnzbj@o3rkfqwcg6or>
 <aQ3xItyGMVnKdzoi@intel.com> <aRSdenIjmrfTaw8U@black.igk.intel.com>
In-Reply-To: <aRSdenIjmrfTaw8U@black.igk.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-Mentions: notifications@github.com
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6211:EE_|DM4PR11MB5993:EE_
x-ms-office365-filtering-correlation-id: 88e957fd-e6e3-4937-2f02-08de25e544a7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700021;
x-microsoft-antispam-message-info: =?iso-8859-1?Q?XlhM9ehXwGdzmzK49amhc+SatmFloQ+E0nTBVt36rkYcJNdsY0uI3EnhsR?=
 =?iso-8859-1?Q?4/xqLyTetvsiY720IWLy/Lfgml7K9GnaxDLnSIXl4y/oPjuqXXNUDAtYAC?=
 =?iso-8859-1?Q?yoa1JLOjfiUx1yL/bx7HTeDUKf0+O5fWc1debPmIlZayDdO/4zMsSUUj7b?=
 =?iso-8859-1?Q?WHVfrD+zKJqeDBBgwjRDprJRIEGqcxdjJMxcgeEL7zmy8vr9t6loRv0uy0?=
 =?iso-8859-1?Q?xU+znR5h2izlqnrHJvHF2FWXFDUqIH/WbhWjJNOHV6Q7/KoQTez3L9xLBW?=
 =?iso-8859-1?Q?huHKH+YLW7/e2tk2zb5GsuQB0D66ekwO0BHrfFa/pYbCdh5DqEbNKAgwsP?=
 =?iso-8859-1?Q?fUkYCdFv5QRJRDVpZBTZY5r7JqiahGKUQzEeck5Tk/28azAiEQakP6joCw?=
 =?iso-8859-1?Q?rIrewMENc0+7MWCoS9s7tNCMH5KJgrRduH21kZZO0fWLYoqnaw/E4HETtr?=
 =?iso-8859-1?Q?uU5e14j/b4IOU1qIF/7Ig051Wt8g4RSoNF6Ix4S7bYf+jLXXmOmsAppr+/?=
 =?iso-8859-1?Q?042hf1+WKxS7KC+3IzgWPeNnNohX5HxVpAcWnYZ+RBgzta3R36M6CskOii?=
 =?iso-8859-1?Q?EkuPmKtBzqpzwdV2kQyW16Y7faQS6PZJDch5MehVsuAtQabR0dXayndNmT?=
 =?iso-8859-1?Q?YO1aDwFa3o6Lh9q58xv7BG8fiYRFHlxBL4I73hpY9q3DTc8P7uQ/1x8uAg?=
 =?iso-8859-1?Q?qcYKvvwLDxARR4JscSivS/hBVmmseZU4Cazsj1JSRSkcQCfqeSZ3whn0FF?=
 =?iso-8859-1?Q?tAUOpeBMqoZIkKqWcbC2OX95pzJTNtVoPVnp+nvNR6xucZTZmiur+5SSn9?=
 =?iso-8859-1?Q?HADSR3XwY3IahnjbyFMG10GMzN3lPwRzx6iBN8zFcvNDGFu5YxtR5tBWUy?=
 =?iso-8859-1?Q?Ryzv1KZlWJb+ELKkwc0/DUsNIMCo8e/EEjYII8+vUsAfCfEb+1SShoNIDG?=
 =?iso-8859-1?Q?uOUXnScWUgiKWM5IHFS2ox96+maKTNA71nZ5qIHJB+iNKjxkeAsBDKMzSU?=
 =?iso-8859-1?Q?D0oDUE7t1eMR9jsDuu0fH2i6nVHdghx/wZj7oyDdZp0XfbJbprfCZTpPTc?=
 =?iso-8859-1?Q?DQGBl498NCXYbLRSpswMMQiVQOW7Cwv5NEorvYrPFX3FAwEADd4ulpNeTF?=
 =?iso-8859-1?Q?uZcMFxLZuOj7lo+/ugXvyo3lPIp1UQ+VTobocKfJuAPPfN181jktaoXAGn?=
 =?iso-8859-1?Q?3FqYDqP4tFHYwOu91ftltgO+TdsV8p5cT6HJoxqt7LeHFalSaxpcG1SGcs?=
 =?iso-8859-1?Q?fzXjK3Ici7A3KZViV8b0Sf4Us8UmyB07d0n5z/a1Cb/jOYSgEPruTI3TxH?=
 =?iso-8859-1?Q?DKDXmP03/zdiRQBPM6xiSl63XsrTFGLqy8rFKfuUzWkO9KlkFcomKnKYL6?=
 =?iso-8859-1?Q?PQgPVXT+ylk9wcW9MQiyn7eVdpYcEtMyADfrehG0iKWXAY6S0CxJfOgDpD?=
 =?iso-8859-1?Q?HOJ7A+8DcuDbprEp5zDaaEaFBNGAgIr8qPN5CCGmaGu3GcfuIesRqVCD8c?=
 =?iso-8859-1?Q?1Yyc/lvyi60VMCS6cmYWJbjJrQxSqvuJl3CUigpJArnFEOFWJdBHPdmOKC?=
 =?iso-8859-1?Q?EmZ5AdVofZPoQhRD6K69s4huJbHS?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6211.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?hlhVraWVsLtT0kxqL1jNLr2HgUb+7Wyw0RmWPv836cZlK9n7xsBvJlUstr?=
 =?iso-8859-1?Q?g6jwrBijoxZ5rbkEKnVrCts2qj877fc8gVM8cCks465lqY5Q4wvxfI3jSf?=
 =?iso-8859-1?Q?ESNv62Dkw14bvihFOPcZu7WR4gzSx16oZRt7meM+0co3yU8Hr+P1y1XTwe?=
 =?iso-8859-1?Q?Q/S0kKidXVTuz60NjFVItREK/qk//aG/LUWr+7wGE/KW95V+A1y3Z1Pm9L?=
 =?iso-8859-1?Q?M64oh3SUsWAchI3xWe53gHmiY63HY3d6dEa+xFTieFrj3ikei/EuTA9AfD?=
 =?iso-8859-1?Q?3cpWSZDKsH59C6y2HXJGwpS9NpVTjbIplRwZLaGKcjULN07tALjNZWgv0V?=
 =?iso-8859-1?Q?eXK0X8s+MhPbwqRZY9anwk02YkgsZFiSTYqfAKx7p27uE+V6tj/KEBB6Be?=
 =?iso-8859-1?Q?TuA5vfBJsM+FLzEsOx9q/dGYgjUoZD4ru0Rdc9a8YT5BaJiueOhd7FPGnk?=
 =?iso-8859-1?Q?MraA7LrkRPU3kQgH0CT6oHUmuwrGqjATPS6NjY4/LCoAgxFfRwGMGZAZ91?=
 =?iso-8859-1?Q?UQgtuaT8pldq7KBbKIlcjHSS9Xw//UcOFBHKj+cpEKuFrNvGaFRjVfkCCe?=
 =?iso-8859-1?Q?/WrQwpZ+yRVZGQQkd07mo50J9kuitGPC/r2iBZZWcM0IrGnUY5ynKMds4D?=
 =?iso-8859-1?Q?AhwBQGhQf663PwWobc3nNVU3Q+MZg9tyiUCttjvIv18OwHhgnMprL0HPV+?=
 =?iso-8859-1?Q?7eCYnxa6Md8fDfdGoJs5y736gFskL5cdIruyemwTti3tqVaiNpuscFSQc9?=
 =?iso-8859-1?Q?ybRbpLF4BU6OI5sui1Bz7oj4ZoxiaJr63HMvOl4vAwzLDWkSArUGbLZEex?=
 =?iso-8859-1?Q?QOdx5pQnYUTrZbyInphcNYdfgOQrDhlcPEmz/JeoyICq+NWCgSuEbohkoU?=
 =?iso-8859-1?Q?SKuq/Nofu8rMy/iGFeGALkr4Tbtb2lbioh5NZtAcmluTv8iKsJdU2EyT3u?=
 =?iso-8859-1?Q?GHU7cK6k8AllHEFDXG+KhaDHzDejUeGtq/k+LopQrt57+UvQbmq885Goxj?=
 =?iso-8859-1?Q?00GxHzDvDpqsZDfq2c9y1qaYNx+M32NoxYm1JLFUm9QKmePs1/TUwzdcvA?=
 =?iso-8859-1?Q?TFvzeZg9CtTotD1Xms2pV4rwKE/LuNrZF71D3S8ZzF1u0vbO2LSI4lv0Op?=
 =?iso-8859-1?Q?5zT0ZBKHTrKtLR6sGAJNQdZBysFnwluk03O/vrkHPqlM7ZasMHSQ9w71cJ?=
 =?iso-8859-1?Q?Y8EwMRv/EybNOWzW489uOoXYlNywtJrTn2DvBAvvnSMaxtLYJTq4DDDzfd?=
 =?iso-8859-1?Q?qAHA+wDjEH+3+pfqMu4AeCblDsEAQg6EVbBeVgHXe82Dd7dPpOTreCNl/j?=
 =?iso-8859-1?Q?NxAakTu6Zt6rtnE4LVw4FnGCcjixxyBQgpggpMDEQieiCmLJyjByI4v4RG?=
 =?iso-8859-1?Q?FUcC7sYbUXhUA1/8ChGWRSNUBycocPlTZyt8LKTLfl+akF1raQPfZjDPFv?=
 =?iso-8859-1?Q?iy2cRfGcpvnzjpJuxOKMrCBsyzz03T6+1OPg0hnvJuYTjIbWlF6Z5RQxyw?=
 =?iso-8859-1?Q?aTJ7quehkkbAJ22I943ts6R6TewcMh/ixC82twbD7ydGjUXUpR02E4abbP?=
 =?iso-8859-1?Q?wDQh6SHsMB8zerh9VvB4ZdPnmR2qlNo/2g1DFwfy/jhfg7P+gn/jvMM+BF?=
 =?iso-8859-1?Q?Bt3YZvnJsv4UhkFc9PFSu/8pdCo8WFOhMG?=
arc-seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E14TjPjklMtDugBHxBc6Z8lNjRbp5CO/MfomWbUYTUvrRqnj/MDWXQSC+RYHgjAEwzxIl/zOJ2x6EMZm5SaWfmfu8SuxZVJYNdFGkb+8cCT4kBAeCpvBB3ZOZT7WGB3dWrdFxaeQdXahe3KuYF92O/+gPsEzfYEYyB2oaJn6BkXrxJe3EFB5HPZ4u0dx0pV+XyspB0X17LQ3U+RgO0bUtTXar9i1cAuyiN6wFgDklKpvAWGrh5PTcbr8PCtVlC2t3DYJ5LbxVxkRBZMv2RVv3Ngx5Dx7P6Xs1914hG3jctLBVb5QYL2VWjilRemPm3ndQiWSazCBDtATEoj3blNG1A==
arc-message-signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F+TVjl/iJGfyq5Raxw/K0Js/9z+cj3oh/igYVWN8FWA=;
 b=fMFkuf9N9+zAZJyTcI6GD+IM4O3273EtERbjqn/6/t7VSgs0ocI3sAWDjVuEaHrtrKIDXzGT49HNA1TjyXTqkiZNfPLV0POCwFiIhr86dc5q2d3x8syM0Mq0Z+17RrGmr/s8e/+a7LlzTNjQLRZzTyOCXrjvmyDVrLwekrm0fmAQm0djKb5QyhMn8nAhTswOZgCrthQbIK0E46MNHXfDVm4Pwi0JI4E2HoLEv1FhvzRCE/pISVSIM4NCaV3gNjnlfmKiT5/2F3XXPaPrxFGuhqbgMrdiu8fhsLNeCO60g4zTb71yw+SAufmm4Ma/xVnfAd7goqsbvmPMmGRk4bpIHA==
arc-authentication-results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
x-ms-exchange-crosstenant-authas: Internal
x-ms-exchange-crosstenant-authsource: CY5PR11MB6211.namprd11.prod.outlook.com
x-ms-exchange-crosstenant-network-message-id: 88e957fd-e6e3-4937-2f02-08de25e544a7
x-ms-exchange-crosstenant-originalarrivaltime: 17 Nov 2025 14:26:16.2576 (UTC)
x-ms-exchange-crosstenant-fromentityheader: Hosted
x-ms-exchange-crosstenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
x-ms-exchange-crosstenant-mailboxtype: HOSTED
x-ms-exchange-crosstenant-userprincipalname: LfJI4DDIVz018DHlWNHNdsGFyRB7ySde3K3Rs5FQp6EqMj3q7+S0dsd1171OmVemgiqf4C83AvzghIK24Y+VS2M/0Nc1yQ36SkoIaH3YJbs=
x-ms-exchange-transport-crosstenantheadersstamped: DM4PR11MB5993
x-originatororg: intel.com
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
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
> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Raag
> Jadav
> Sent: Wednesday, November 12, 2025 8:15 PM
> To: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> Cc: De Marchi, Lucas <lucas.demarchi@intel.com>; Vivi, Rodrigo
> <rodrigo.vivi@intel.com>; intel-xe@lists.freedesktop.org; Tauro, Riana
> <riana.tauro@intel.com>; Brost, Matthew <matthew.brost@intel.com>;
> Wajdeczko, Michal <Michal.Wajdeczko@intel.com>; Nilawar, Badal
> <badal.nilawar@intel.com>
> Subject: Re: [PATCH v2] drm/xe/pcode: Convert unsupported commands to
> debug level
>
> On Fri, Nov 07, 2025 at 03:16:18PM +0200, Ville Syrj=E4l=E4 wrote:
> > On Fri, Nov 07, 2025 at 06:03:28AM -0600, Lucas De Marchi wrote:
> > > On Fri, Nov 07, 2025 at 11:26:11AM +0530, Raag Jadav wrote:
> > > > If the device is running older pcode firmware, it is possible that
> > > > newer mailbox commands are not supported by it. The respective
> > > > functionality isn't useful in that case but neither is error
> > > > logging, since it doesn't particularly signify anything wrong with
> > > > pcode firmware or device as a whole. This is useful in cases where
> > > > we want to make a decision on driver functionality based on pcode
> > > > return codes and a bit simpler design choice compared to other
> > > > solutions like checking pcode firmware version, which comes with
> > > > additional complexity of binding every single command to a
> > > > specific version and deems pcode commands useless in case driver fa=
ils
> to obtain it for reasons unrelated to pcode.
> > >
> > > yeah.. I don't think we should regress the support in new kernel
> > > versions and require users to update their IFWI. However dropping
> > > the error message here also makes it harder to find cases in which
> > > we are indeed using a wrong command.
> > >
> > > I'd say to decide on err vs dbg based on CONFIG_DRM_XE_DEBUG so
> > > developers can still see the error and take the right action.
> >
> > I think the caller should decide this. If it's explicitly probing for
> > something that may or may not exist then use  dbg(), otherwise use
> > err().
>
> I like the idea. What I'm afraid is that once we open that door it'll pro=
bably
> start getting abused.
@Rodrigo Vivi What is your opinion I here, I really like the idea suggested=
 by Ville here.
Thanks,
Anshuman
>
> So rather we can check if we're really *in* probe()? Wait for a v3.
>
> Raag
