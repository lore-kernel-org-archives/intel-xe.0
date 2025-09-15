Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26887CAC597
	for <intel-xe@archiver.kernel.org>; Mon, 15 Sep 2025 22:34:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1CB410E5BA;
	Mon, 15 Sep 2025 22:34:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BQOedNkL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5412C10E5BA
 for <intel-xe@lists.freedesktop.org>; Mon, 15 Sep 2025 22:34:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757975693; x=1789511693;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=RKSCvcroHI2kHO5fbIN2lv9NjSEAqNmRgZErrPK2rFg=;
 b=BQOedNkLzFRpdDsfbMpZsWOaKvfv2fNBi6ci/kariqEPCcyg1v5unWp2
 wFUxPDnDleZ2mCGrMtb7HsNFQVN+mdL/6lL5cV5e41ZMXRmPedg/j2oa4
 XUhWEIxGvJyx5DLRgavUgnlWT/bcx+JCJoofmKwK3A23Q06YJY9oOO0cr
 uAGRdBahDpVoBA5o/KPrZzTZqdM2WLwEBwRV5NueybD7n8frRzM6qOuEL
 uyk6vvEJcCrNHB4m6e3ZzlbtBHUhTl/XB1RmPigEC5unBy1+jpmf2uR3e
 +R9Y3B0VzYLHU8Mx8DAWqf0ccvquxDfm7xRPMgBFvNCrAU2TIHcA/lID7 g==;
X-CSE-ConnectionGUID: atkPwmbyQ8yl6JaM6Bj8Pg==
X-CSE-MsgGUID: AoSGCH5zSuyMHw3LTQ8MGw==
X-IronPort-AV: E=McAfee;i="6800,10657,11554"; a="71673808"
X-IronPort-AV: E=Sophos;i="6.18,267,1751266800"; d="scan'208";a="71673808"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2025 15:34:44 -0700
X-CSE-ConnectionGUID: NdJGcC9sSJyLmFCVlU5VyQ==
X-CSE-MsgGUID: L55Wu6UlTey4vuvHo9JLHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,267,1751266800"; d="scan'208";a="174707971"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2025 15:34:44 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 15 Sep 2025 15:34:43 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Mon, 15 Sep 2025 15:34:43 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.6) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 15 Sep 2025 15:34:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QAFgBEsY1NyuEn1caUpmjdioEi/JiUp9Zi9Se2WO7EDUazW1qlCJWEZQvfc7tIA3Nl007LIKV5ar7Y6s6XiLLuWXQAarXQ8Qdnubxsvb8WNsXi2PuU7E0PaYT3/XfG5K8Q7yqXT0g5RQv8FZ47RvbRJPmFujKPCnHVzIGXzEDGzIFKpK7/jRYHFh1p0roDzyvDhFRYlvx+7/voFfjmagbcL7d2Ae1TViPFznTGsaeFh+wiKlySJuSMREXjXHHhjXaeqA/cCmWA7pOF5Q/pXUAoe59oX5LAMe24u9la2MeW4H58dkSj60vxdwj8e6WvHCGZjF+sJo/hQVYdmeTRzjaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Nr9pCJBKmwZMlL9lpsv2CjCz9eRUmDC3Qx1U3f8H6sk=;
 b=va3LQPpl+ipRVMQBOBmJzT5wDc6nX5NZcI0D136nNIOumBOHF3Mi8Fm3XRb6TJbof/fUPQNDz+mEsP+NFG3HdWT6ujzEpscfHUndIkRc9Nyj3wtbU6Drecp/DOik4kxBsKf+2fuZcgXKiMCB/bCl+Ym/4uN8MU55W7PvbPF/MLpPyEuVSkyWfcBnLB3e9sjP3Rp6RFCsackVqA5wD3lMJ3JMZtkSTKSiu/8rqHnN85cko7KIsc15akVZW6z022/rCJhqtKBjRF3HXntUkrEePIWz0UxJ9oaaENflddL7QFZ0LiIlCTyXAkDBsN1GoU5eXblFimrc8c5wXaQNBcTlQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5456.namprd11.prod.outlook.com (2603:10b6:5:39c::14)
 by IA0PR11MB7306.namprd11.prod.outlook.com (2603:10b6:208:438::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.21; Mon, 15 Sep
 2025 22:34:39 +0000
Received: from DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::b23b:735f:b015:26ad]) by DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::b23b:735f:b015:26ad%5]) with mapi id 15.20.9115.020; Mon, 15 Sep 2025
 22:34:39 +0000
From: "Lin, Shuicheng" <shuicheng.lin@intel.com>
To: "Bai, Zongyao" <zongyao.bai@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
CC: "De Marchi, Lucas" <lucas.demarchi@intel.com>, "Summers, Stuart"
 <stuart.summers@intel.com>, "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>
Subject: RE: [PATCH v3 1/2] drm/xe/xe_device_sysfs: Add cleanup action in
 xe_device_sysfs_init
Thread-Topic: [PATCH v3 1/2] drm/xe/xe_device_sysfs: Add cleanup action in
 xe_device_sysfs_init
Thread-Index: AQHcJopsYkKCmwtSgUC8PVz9QBZ2yLSU1D0w
Date: Mon, 15 Sep 2025 22:34:39 +0000
Message-ID: <DM4PR11MB54567AD1957FA4E653C8EC0BEA15A@DM4PR11MB5456.namprd11.prod.outlook.com>
References: <20250910183233.3971054-1-zongyao.bai@intel.com>
 <20250915214716.1327379-1-zongyao.bai@intel.com>
 <20250915214716.1327379-2-zongyao.bai@intel.com>
In-Reply-To: <20250915214716.1327379-2-zongyao.bai@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB5456:EE_|IA0PR11MB7306:EE_
x-ms-office365-filtering-correlation-id: ff675844-2cac-4f78-b423-08ddf4a80ed9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700021;
x-microsoft-antispam-message-info: =?us-ascii?Q?hmEoNDaq+2VOD1i101PdbvNvCTmNZO9C+0OWT2nghgKyoitfqsWQ2Z7HcYgo?=
 =?us-ascii?Q?X5Q85ClyMPA6EMgr0aIG9yDKpmCv52LCcJPoTe/l6bpm6Kf5H0meYVavldoV?=
 =?us-ascii?Q?OvwqvbMB1Ki1/pJBsof0SyCw8ELwpkEgLTrVY08UYvCt3Aq6zc79JOOaIGN/?=
 =?us-ascii?Q?2+1oNQToBOe2XNg0vE0Boihev0ng++ziRAsPZv8X0Lf2euiB4JVfU1bJhXxF?=
 =?us-ascii?Q?i0RK1s55S61UTHWusM01Wa3YFUPvoiTSQGo/k7fAqm/5yR573aBTHQmCayd5?=
 =?us-ascii?Q?Abot7uiMUQ7G3OKAKlIATccbe2IuwbSjtZiNDc/5RCBsU16hagfr8ffJSYwf?=
 =?us-ascii?Q?M2O+kzGRlYdNW3gd7xvnYHHvUI6nzaUda3ESZP7VV/32PJiZ3WVXmTX8VakN?=
 =?us-ascii?Q?RA88BpvLG7tHaOcjxt/oMrAhB7UI2ZpjhZwXUQRpA3yqiA27cpEmZgbx4IOV?=
 =?us-ascii?Q?IKljNba2OOfdD2rEei8YMShfcR1GyH0rY7w/RKvqaMwC5pBeqwQicGKR4bwP?=
 =?us-ascii?Q?dPq5Po1vqt3TNlZSe3mNnNrOhI8PVnLsSxP9DKJh+1HycQU5D/2mzRD1Sl21?=
 =?us-ascii?Q?XOqxbwNPoxNLdczzQ3ffen9PmouWr71CfE/CbWqCmNqQ0DQZHb2+m0NwAIs9?=
 =?us-ascii?Q?AERL6tYeJFvFoIDyknpoazvmS0km7rPmpb1suuTfOkoeRqIDTtNuAI1POak1?=
 =?us-ascii?Q?s/+Q/WHErgOLmcM8suT0QHIqNC1o/ioJ8C1JwBEjqlMjeVsz7MUhClDEfCfA?=
 =?us-ascii?Q?VpyXv8qhmuV1F5PD/VbSshtXqJPG9a4ViTEhowJ2l7kp786JzPNw2UuAduCJ?=
 =?us-ascii?Q?rqDW08XaVNK+ed09gwtma2/gqX8WYsIAJ7daA24y419YYOi5GN8Cnp8lzS7X?=
 =?us-ascii?Q?q/igy5dT7Hrzed9JhtrMx0rqKvqcHh+TD/YNjh+oJNU+IsD6mJgV84SzWads?=
 =?us-ascii?Q?Dn83C+zdTY51aAYn7Qn4frD4OM3M0UeGjv4HesWrmUcFVD9loJtmOr6/TuQz?=
 =?us-ascii?Q?kTmiBty50bp/+OyWi8ASPwyWdckjKziLKcirNryQ/7Vr9HJuxlMLLChgqh+e?=
 =?us-ascii?Q?SwJZbfzQyk9RUcRqWXbpdiT++Q1pKxU1cZ9ygzNiSLEyxj1O7cxH0gdPIaxA?=
 =?us-ascii?Q?AmbWgE5y8mC/3YFElq8ZGcEa01KA2k0e/+HskcmRomifEO7A7JptdkEQFTZT?=
 =?us-ascii?Q?bds0+lckYgSpo9qpCYGscFLBs7Zd6rdBvD5CbT/Bvce5/qJwg7/xOIG5foFo?=
 =?us-ascii?Q?WSLU3JzjeRtJ7evEj10QTjkEvmTyNaCPk9hx7GB0McnUIec2lxVAMcx4Nysg?=
 =?us-ascii?Q?ozr7Df/1+3CUThfZRO3O1HkHIZgAc0xNxsBkOB4I3KvPI2vLmpKfZFkscLT0?=
 =?us-ascii?Q?e9IwkjMUa6K+IQCyZPcrafhWN6pel8zD6UngcgQGp/Ml9z2Xe0ABKT5acXlz?=
 =?us-ascii?Q?D0nHyb6ck1kwrXRY0RPzXO6nlUoRym0iPmvat3fkA4/YtlG4SNnF/kvBkh8a?=
 =?us-ascii?Q?wTrNUg65UmLcZko=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5456.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?n7LG7Jg4VWD+ecXNYqgBQ1/tm/O8f5jB54kG55g7FRTnS08a7nVacGeMwD9S?=
 =?us-ascii?Q?7xIRq40OPVZvtVvy9JXfrKYqKoJMf+b11cOV/f/AEgs6YO99kp8Di9tzJuNx?=
 =?us-ascii?Q?CjAqkA7ig68hfD5lbLTAKP4Na13hVqnr/EHaPGJxOox9oKnQzY6DnzdWVVIu?=
 =?us-ascii?Q?z1f2XFcT50M0kE33UtEziXHmTQnkdqwSXF0qWLdZ/Wr2c4OukheRU/ahO6dl?=
 =?us-ascii?Q?gQs9prupAJx4fWGpNJxayddw6DoXfGjVdeOlNRtMQiNoZeLCK154FnWh6b0m?=
 =?us-ascii?Q?hnbgVyz06hIyUv9OPMo5q69DEBoe9IXdhAAYwu08Q4tfGPjjL0+AE7r39nNu?=
 =?us-ascii?Q?NauvP9Mixau314MEs6xyHLFJiq000h4JSE+OBsN6oHS7I5FwnLicC3vwbrjS?=
 =?us-ascii?Q?NPE99mdyTgNeSjqITJKK36VN6KWYUoEwbbSzsGeb6pVwOes5bk7lqegsbrPt?=
 =?us-ascii?Q?EN1YLD4KVGPqpJttvW9o+rmkNNR6IKP1nIolgsuNepRRdnjHBN0JcgdOt3mW?=
 =?us-ascii?Q?hLHA5YuGi49YZvMPQTAPA+PTTQLFckAT8DMZvRdMgPvldqV1WHL6YoUprJsN?=
 =?us-ascii?Q?MkjAADKma1SEjWzrJ1nlk17uBue+CnxiDDYFI8gvkzCqjnLnqWP4JmLF7LmI?=
 =?us-ascii?Q?UGXDnpnjAEr/wmWQcrzkWPrB0j7Uux2fkpZbLvo5ep7zeZik0nE5m1eEJChr?=
 =?us-ascii?Q?7yP1K2AwdkZ+IJfUOOE5y/Bipsv6iakoxiFneAaCEtrOg2Z3BMQoQ/EtwM2q?=
 =?us-ascii?Q?VSTmBBKdeaf+020y+sEsx+l7PG0FUOnNZjKnItmy3zNPAK9BupzkO17V5F8S?=
 =?us-ascii?Q?LFKOXeH01f588ZFUhtAYgGuJxKhEXFvvfPgzTedOEiBJ0ApulIHl+XhwKXYJ?=
 =?us-ascii?Q?ClnYPh2X5lM19WG9OKpbBPBv7sOwgmk/yrS3PU9wHhLIXj4h2hjxoQmS032P?=
 =?us-ascii?Q?rcWaLwIcxT65BgFqKd4FnbNz0oCeY3LPTjwa35ddQztlHCC0eMqV7nvfl5Mu?=
 =?us-ascii?Q?jh526ZmTqFWkhWZhm82iA9pRIm6ZeBapIzOKDkbr+/Pq1XWIcgo+KCN/AaZp?=
 =?us-ascii?Q?mSS6VlYZntUuEWktFy7etT6BalgP4AHLh80mMlqEKduKHYoYzGKWrqvP/Dgw?=
 =?us-ascii?Q?EFcCoX4nqFqYaG568m3tenMP8i6Ydy0/I9SOSVzLXTi03emmSLgMEBrLW9sj?=
 =?us-ascii?Q?VQ88zhQ0B/ODlMuZqcnHU6sx8IK0RJ/YdzfPfIsP6djNAkEjCiHR/bp4Tdil?=
 =?us-ascii?Q?Ziik6l2+D7caalWvgeUVM+drQjERAb9a6Ox2rn+11E+dqaDepTMM1H3EhjMt?=
 =?us-ascii?Q?R9PJZuOflHT7N5E4D6NxpLPYPpEXqrHcAM9ipwhkKdpUIyHmdpMn4yLA/zHn?=
 =?us-ascii?Q?Ic667GytBfoSlw/11oXIiyrTjf/bXwQIhXBGQSV4XKhNAnZCmAwlwoZsuAj/?=
 =?us-ascii?Q?krY6Ztb1kixeGAufyyPy6IwBQULP4a6iuuT/xT27f7z1opufdAprZT00IiGn?=
 =?us-ascii?Q?s7laMo/SqXusxgfMiRz+aYyVDICyapvKcd6apqW+anXSkKHmCkn5J7AJTn+3?=
 =?us-ascii?Q?IoE22+I0vpVMBA6+UczzJcaa5aOxGv+S4GZRw69s?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5456.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ff675844-2cac-4f78-b423-08ddf4a80ed9
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Sep 2025 22:34:39.6979 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Mrt5n5QvnpVU+jH1sHpqWthQZ4ZTIEUQuoLM9o88AbBgTJGKIKdlT4V2oQl7FaAD8Dq1roFIeY/88LT6TMTjeA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7306
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

On Mon, Sep 15, 2025 2:47 PM Zongyao Bai wrote:
> xe_device_sysfs_init(): on partial failure, any sysfs files created befor=
e the
> failure will be cleaned up via xe_device_sysfs_fini, ensuring no leaked s=
ysfs
> entries.
>=20
> v2: Using "goto cleanup" to reduced code duplication.(Stuart)
>=20
> v3: Split patch & remove unnecessary notes (Lucas)
>     Adjust the comments accordingly.
>=20
> Fixes: 0e414bf7ad01 ("drm/xe: Expose PCIe link downgrade attributes")
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: Stuart Summers <stuart.summers@intel.com>
> Cc: Shuicheng Lin <shuicheng.lin@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Signed-off-by: Zongyao Bai <zongyao.bai@intel.com>

LGTM.
Reviewed-by: Shuicheng Lin <shuicheng.lin@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_device_sysfs.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_device_sysfs.c
> b/drivers/gpu/drm/xe/xe_device_sysfs.c
> index 6ee422594b56..e5e3c56ea53c 100644
> --- a/drivers/gpu/drm/xe/xe_device_sysfs.c
> +++ b/drivers/gpu/drm/xe/xe_device_sysfs.c
> @@ -311,12 +311,17 @@ int xe_device_sysfs_init(struct xe_device *xe)
>  	if (xe->info.platform =3D=3D XE_BATTLEMAGE) {
>  		ret =3D sysfs_create_files(&dev->kobj,
> auto_link_downgrade_attrs);
>  		if (ret)
> -			return ret;
> +			goto cleanup;
>=20
>  		ret =3D late_bind_create_files(dev);
>  		if (ret)
> -			return ret;
> +			goto cleanup;
>  	}
>=20
>  	return devm_add_action_or_reset(dev, xe_device_sysfs_fini, xe);
> +
> +cleanup:
> +	xe_device_sysfs_fini(xe);
> +	return ret;
> +
>  }
> --
> 2.34.1

