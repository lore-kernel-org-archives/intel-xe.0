Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60B53D18153
	for <intel-xe@archiver.kernel.org>; Mon, 14 Oct 2024 21:08:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 022D310E4D2;
	Mon, 14 Oct 2024 21:08:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VgUGTA5m";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADCC110E4D2
 for <intel-xe@lists.freedesktop.org>; Mon, 14 Oct 2024 21:08:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728940094; x=1760476094;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=rzRU1JtZLdnVG9MrPH9DwdFv6fib5Ij8Em+TlAGYpuE=;
 b=VgUGTA5mIlQvaaY8oUx1GHmS+3KEfnBG4VNlFCUnoXNRZum/HP5FJHZD
 yoUPUY8miW7qrLsmFSblxDwjdpj3AKA9Ti9p2JnKp5RnN93Qu4hXCf5Ax
 Rb11IfDJTTjeR3ELEMguC6SCZULyxzKcNdwqG39rxs/DlSXdyO8P2qTws
 hM5+Zbtoj32CtRmfyHEl+l0y6LbDhec3BpmU+lCuQS1Ff6Z6/eTwvompu
 8YeYI2n8i+1GuaMKhRQRprqMKkXAS/X2t6PFfrVVZrgOb2mIogsrbRdYs
 8XmYi1j8LW89ntSU1oB3hR6e20kgWVe42/pVhNkHopJYvHcOiRP3kSpxv w==;
X-CSE-ConnectionGUID: l2Ax5JluRoaCIz+Q+c/4jQ==
X-CSE-MsgGUID: W08WSfI0Qe6PIpuMnifAQQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11225"; a="38944742"
X-IronPort-AV: E=Sophos;i="6.11,203,1725346800"; d="scan'208";a="38944742"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2024 14:08:14 -0700
X-CSE-ConnectionGUID: BKSi+lTDSkK23521o/xL3g==
X-CSE-MsgGUID: 9WOC05D8Qamx20CPgfBSEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,203,1725346800"; d="scan'208";a="81665670"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Oct 2024 14:08:14 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 14 Oct 2024 14:08:13 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 14 Oct 2024 14:08:13 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 14 Oct 2024 14:08:13 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.40) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 14 Oct 2024 14:08:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XlPPTU942cjH8dARgsocx6qeI6Xn8xpDOoHiTFkmsUi2syWrixssBReBu6mpabfLprd73sL6gIiPBjeBcVTXdAwUYgEkHhuQMt6bYhGonqM+BRpzNfixMjOtZxVD3gUuz7a8EdM3rC1sIwXB86KTJKIcf1M2Tg/OsljH1BdvZXkpnqlDwoyTM7khw6Mm0zjG7VmTISkW91GIIQ2PvrrGrmWtIzeioKsUY8hpfVSDjdBm7tKexIDuLKDfpHawq1l86GZHixAMCvPEFodBnt428tzMSNPU+iMCAuA0uRPpOZi56IbjzVM4pYrfNT3lyJNB7yyQVXmmYzqJtYVUHiGLiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Sq7yXKk1PyWZGNBoH4C6LBoxCCxl2CB5ZKrACAxbjaA=;
 b=IgOfSaKKexEI+tEYFbjRxM5e5QZ+0HsPeXHNLcCGnkrZ0QKuEBnbXU95c141TUsU7Ul+WKEYKtHfs68nDWPqMYYnr5kDMnzz1PM87BAloP/IJ3ALG6A89MHw1CTJLFg0WSbtZAaJlsYW3xln+IXzcVavwrRkA4qjT2EKjOh8GNhWGcxJ3lU8hg6bgD6ODC4InMwr0Zb4zXxVox1y2PkBMI37eRREsfmcf/RuHmiFGKv6NKFAMeWS/PTTd5VDfAQDnS2jzyaGJncd01HVJVCz4YNVSy9/rsszd/ghC5WuQWB1XqvmaV9PtnYSH7vOMEYtefYMZBcx6KLpTW2FiP8hjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5456.namprd11.prod.outlook.com (2603:10b6:5:39c::14)
 by CY8PR11MB7011.namprd11.prod.outlook.com (2603:10b6:930:55::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.27; Mon, 14 Oct
 2024 21:08:09 +0000
Received: from DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::b23b:735f:b015:26ad]) by DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::b23b:735f:b015:26ad%5]) with mapi id 15.20.8048.020; Mon, 14 Oct 2024
 21:08:09 +0000
From: "Lin, Shuicheng" <shuicheng.lin@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Roper, 
 Matthew D" <matthew.d.roper@intel.com>, "Vivi, Rodrigo"
 <rodrigo.vivi@intel.com>, "Zuo, Alex" <alex.zuo@intel.com>
Subject: RE: [PATCH] drm/xe: Log unreliable MMIO reads during forcewake
Thread-Topic: [PATCH] drm/xe: Log unreliable MMIO reads during forcewake
Thread-Index: AQHbHFyODx3U337AWEuEZNEdVk5Rz7KCkPqAgAP1p6A=
Date: Mon, 14 Oct 2024 21:08:09 +0000
Message-ID: <DM4PR11MB54561FE5233DF4CE2E3FF936EA442@DM4PR11MB5456.namprd11.prod.outlook.com>
References: <20241012033445.1090373-1-shuicheng.lin@intel.com>
 <ZwoEbQAQolLNLbeq@DUT025-TGLU.fm.intel.com>
In-Reply-To: <ZwoEbQAQolLNLbeq@DUT025-TGLU.fm.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB5456:EE_|CY8PR11MB7011:EE_
x-ms-office365-filtering-correlation-id: 6807afe8-1a54-43fe-8198-08dcec944e64
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|10070799003|366016|376014|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?41aMsWMeOMq8cVl8BBKsHHjVtVZ112iw606TIsl10ErYeNo00Zi89dLrE+Fd?=
 =?us-ascii?Q?SAfOB6NVh6F8IP2GNbgHCPCA79Px4v8XfLrH9RwcJtHGUSukAD8g+Xq86df8?=
 =?us-ascii?Q?GAjNsG5vTPwEZYDOnji69s/wa1duFnzOSctoN0PJS6LhKXYX1XVgOfnG+CkC?=
 =?us-ascii?Q?5IpEPyDipORRIESrciTgDR7IoLn7U1xqF1RGcrmuiztSnxurIVhM2Aj31pKF?=
 =?us-ascii?Q?rhUWqXzJuNpa2m2GUPQ6PcosB+npiei0l7Azif0KnFd4402GyiBO7hlXKe6n?=
 =?us-ascii?Q?IXGekOg2sI/0KKJjFLUjKDuNr2zoBMmyQ7zJV/J6zLeZr+L5kthpvXUGQptx?=
 =?us-ascii?Q?0XkxAIXLDwC1DWG5UfEP5KY2cI30KbxxHMr0nfBk4AruKiAVLSIwNQ8iFxwK?=
 =?us-ascii?Q?Na7iEEFqNlvtvK3Pl0kyxudxDKJJG2mX7szpdATVjA+CK3bUsy2KF+G24NuA?=
 =?us-ascii?Q?MTJsFaR3o5tmdRA6yn0ijNeBEVll6nFF0XbUpHcbAF16c3YQVYnHOkSNkdvY?=
 =?us-ascii?Q?znNoAbRobt+F/xc+SCraYqZSQqMC1rp5P/sSFy8NkH/3hvICF2YblHbYD+Zn?=
 =?us-ascii?Q?1LfjXAG2+xy/w5QhAF+Cgdm4zNNaPrbsmZGNT51rSQZUs2kyAu2/shu3+gej?=
 =?us-ascii?Q?+jQWjlEWRBI2h/RBPg7kNIQFBZSfsZ4SQx8v65zCxM2yB4b+iHLT4YK7iWK4?=
 =?us-ascii?Q?nC+Q5oI2u/ToadH72WrgWNyWDlng0TSAQB4hnAlXMF1OKkR/If/BMFha4CX+?=
 =?us-ascii?Q?JnOf28VsmeS46FajHVzsHxReoxUirLM4uA3rrdoKWmXhvgRlK7HPrWxe9HMK?=
 =?us-ascii?Q?WT+hDagfUmnfKk53WsDvnP4N8ofqJR8dTz7fbBEnXQXJIwd3CJSOxjAOTRcK?=
 =?us-ascii?Q?7yhUTyFzKk71aW70Nyd+9hOozT3kZe+WJq+7Ok7QeS1ioeQtmJT6ziwyzwEf?=
 =?us-ascii?Q?nWtie2T2K0rgDwbZnapLWHIUiqCVXASjclXIWrtS8ALslIpE4jHpMzWF+N9R?=
 =?us-ascii?Q?i4tXhAoxA53YoMWUbOyEuGxPU2NE8m6Jq5ZGcCmj3igIITV+3p0E9PyQ6/hn?=
 =?us-ascii?Q?UrDaZEyFqwWnt9oPi39HKshaU9vzoCZgmpXj/w3Dy4aq7s0rMfodtcfc1mEw?=
 =?us-ascii?Q?DevrfLVrnL4sjE1FLsTbGNI8h6ridb0WWdnpovOb4IJ1uQyvvZq9g6VjxBng?=
 =?us-ascii?Q?o9qmb39oqQC9ZwkHOcrRil2TJTHuj7/0339GrQz/pdhAXQxKwQqQM1Q/WPYN?=
 =?us-ascii?Q?R8uSGRU/TQ5c+fv31sD1pRQV1YPfQaMLtLCrXfWm7NPAl/2DnVIcAFr/tfOI?=
 =?us-ascii?Q?IaUzRLD1GHPPe6KocBqG513+3h5R+9TYwQTTHtJcndPI3w=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5456.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(10070799003)(366016)(376014)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?VzbTTm+nTwHYCM2Z5JSBpbESfjWkZxfHa0tJIkzUElx3RcNfJ63bCD/nEO2G?=
 =?us-ascii?Q?kWAzgAIaDhcv1/cMN3B45tLy2MSr19vy18D1RRlc04y8LVpmsGJ0VTdvyEi7?=
 =?us-ascii?Q?zbmahXlhY2GZFK/FyPUl3qPrTCIysD52S1U4+Fb0Kc6hE/3rrTUk2nPwCBjJ?=
 =?us-ascii?Q?OZG64YTQS9fn1NS7D5vtqAY13pT+npAQKabZueyd1ruQ8oY0jgdYq+I+K9Hl?=
 =?us-ascii?Q?Ldgpd4EWBHq16hvb8idmFCtZ5j2rTvmu5FBQyNKBs8ggkwkjD2u7AVzAohVU?=
 =?us-ascii?Q?cd8AYTQLP+VhMNzEC5V/T8jC6PWnjPjMW0KzU77dNNLI6uD6sUtOXUqxVnYe?=
 =?us-ascii?Q?WbINuC0zsv1CEaAKboTtig+zwY9DuqBp8SdGFcekin4DYV//7cM+mYgUK0Qu?=
 =?us-ascii?Q?uCTC3F8liK3FBkefPZ3+yMYJmogvW7GHltXZd8fzouP/A7WwaFmn/1iNJkNR?=
 =?us-ascii?Q?dkhe/sF5DP/lP26BMZ52ZhESz5Yac3zcw7Xhwe5BhGkx3fSEw4p2OIjD0AZj?=
 =?us-ascii?Q?CD/D30KMy0fp+5gNkFpzuyAJjB+WFzU3buh2maMlbUKl2uFb/IzzeVjmD3o0?=
 =?us-ascii?Q?0Pn+1LdCJ5vxzHv/+Cw5k6sNrUEaJdEiY/vilRm03Ue36CkSvIMhX674byUk?=
 =?us-ascii?Q?OzAPJmMd9YRkI2hA8gY8swcAeD4GDCFg5K1c/beHbVwpzHzpAMF8xSnvCX3B?=
 =?us-ascii?Q?6XIeLVjHqyoOABqSCPdOvQBGsPTrWj9QQD7WW970wjKnq3R4Z9PpvPlUBqVv?=
 =?us-ascii?Q?GMf1Dk+JHV3ai7j4XW6BMNNAeMwrulKtmuxg4jHTm+H2sK/+QMVJA7mDvfhL?=
 =?us-ascii?Q?1iEXq+E828Q3nQiRbFsTvznOoYMr7arAs3eC7lIMNuNc9V8DII+8HuHP6cBj?=
 =?us-ascii?Q?mGCrdtv14uIX0oSl0fU23UB3+2EaJCg9FX6/ex8sJ2uVkdBXJGc4vzC75Tm/?=
 =?us-ascii?Q?/oUQDle5k3ZbdV5mGzkopJ1aHT6msp77jmzl9hGru7ezrVzKjrdqlwwE86Ur?=
 =?us-ascii?Q?L8kbuN/ocF099bGD9RmplcPZScaUbVLKadTseW2w3NI5R2kp63KGd/pA0Xxq?=
 =?us-ascii?Q?dNCOY0DD7jnQYt5xTPOmzfWNpejXEqhW7YpMVjh/oMUMMJtKycVH+wHokJvN?=
 =?us-ascii?Q?qRjLWXndBkUwfBEnG4OHu8meIBmfBujS428edVuM3+5FWFSRQb1hgEtmQoBK?=
 =?us-ascii?Q?McGLqshLVxPAml4oZtVqXUKCiZiivq4l84tfp3u2N2pLb9FsnoJJOnM4aDJd?=
 =?us-ascii?Q?3ElTE6xvY5Z+B9z/ZF+Nd3HnN2xfNVMqJURnknr9YESENCZOq5fsa9pFzEwc?=
 =?us-ascii?Q?jPfNZC8W092CgyJRmhzOzGBTOSWxp0wpC71GxGCdmjWh4YeGsdyAjEyqKHWB?=
 =?us-ascii?Q?nt/5J2FwhKJ6xeHnY31najSPp1kUyW6Et6RgbpESBcJM3F2P0FLvlnZzfCtT?=
 =?us-ascii?Q?z8BiRdqZXhBVqt0ZCrrRcBXzGCWC1LQfI9a8LWMiGXaa2BggtHZ6Z/9pY2GO?=
 =?us-ascii?Q?kEDzzIwgXtE0xLM3FNXFl6+88KLWtWO0y5Fzj96mn9VXUrJFO+Vopi0k9045?=
 =?us-ascii?Q?4C2TTuwpxoiSomFw7+w6H0YP9Pz8M9b5FDMjqHpDo3L81Sq+JeJvbjIEqimP?=
 =?us-ascii?Q?YZTwaFB4AKnOAiI9VSt7KIcviiE/OiV075SanQB1PNC5?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5456.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6807afe8-1a54-43fe-8198-08dcec944e64
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Oct 2024 21:08:09.4254 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tMDguDFKkFpmm+mKU06zCzy7y4iIK71JtZJnzJ9Oiv0bGpnXXvjfLwbCqlnF+RGxiUYESO9+92iUiwzXGNWCIQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7011
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
> From: Brost, Matthew <matthew.brost@intel.com>
> Sent: Friday, October 11, 2024 10:09 PM
> To: Lin, Shuicheng <shuicheng.lin@intel.com>
> Cc: intel-xe@lists.freedesktop.org; Roper, Matthew D
> <matthew.d.roper@intel.com>; Vivi, Rodrigo <rodrigo.vivi@intel.com>; Zuo,
> Alex <alex.zuo@intel.com>
> Subject: Re: [PATCH] drm/xe: Log unreliable MMIO reads during forcewake
>=20
> On Sat, Oct 12, 2024 at 03:34:45AM +0000, Shuicheng Lin wrote:
> > In some cases, when the driver attempts to read an MMIO register, the
> > hardware may return 0xFFFFFFFF. The current force wake path code
> > treats this as a valid response, as it only checks the BIT.
> > However, 0xFFFFFFFF should be considered an invalid value, indicating
> > a potential issue. To address this, we should add a log entry to
> > highlight this condition.
> >
> > Suggested-by: Alex Zuo <alex.zuo@intel.com>
> > Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_force_wake.c | 4 ++++
> >  1 file changed, 4 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/xe/xe_force_wake.c
> > b/drivers/gpu/drm/xe/xe_force_wake.c
> > index a64c14757c84..46f36d05293a 100644
> > --- a/drivers/gpu/drm/xe/xe_force_wake.c
> > +++ b/drivers/gpu/drm/xe/xe_force_wake.c
> > @@ -114,6 +114,10 @@ static int __domain_wait(struct xe_gt *gt, struct
> xe_force_wake_domain *domain,
> >  	ret =3D xe_mmio_wait32(&gt->mmio, domain->reg_ack, domain->val,
> wake ? domain->val : 0,
> >  			     XE_FORCE_WAKE_ACK_TIMEOUT_MS *
> USEC_PER_MSEC,
> >  			     &value, true);
> > +	if (value =3D=3D ~0)
> > +		xe_gt_notice(gt,
> > +			     "Force wake domain %d: %s. MMIO unreliable
> (forcewake register returns 0xFFFFFFFF)!\n",
> > +			     domain->id, str_wake_sleep(wake));
>=20
> Set the ret value (-EIO) to kick the error to upper layers?
>=20
> >  	if (ret)
>=20
> Then...
>=20
> if (ret)
> 	...
> else if (value =3D=3D ~0)
> 	...
> 	ret =3D -EIO;
>=20
> Matt

In my test system, the hardware appears to auto-recover after returning 0xF=
FFFFFFF, which makes me hesitant to classify this as a failure.
Currently, it's logged as an informational message to highlight a potential=
 issue.=20
If we classify this as a failure, should we also update it to an error log?=
 Thanks!
Another thing is (ret) and (value =3D=3D ~0) may co-exist, so the code will=
 like below:
if (ret)
   ...=20
if (value =3D=3D ~0) {
   ...
   ret =3D -EIO;
}=20

Shuicheng

>=20
> >  		xe_gt_notice(gt, "Force wake domain %d failed to ack %s
> (%pe) reg[%#x] =3D %#x\n",
> >  			     domain->id, str_wake_sleep(wake), ERR_PTR(ret),
> > --
> > 2.25.1
> >
