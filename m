Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D14AC83F1A
	for <intel-xe@archiver.kernel.org>; Thu, 17 Jul 2025 21:20:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7AA810E06F;
	Thu, 17 Jul 2025 21:20:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Cqkc9bD3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A73F510E06F
 for <intel-xe@lists.freedesktop.org>; Thu, 17 Jul 2025 21:20:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752787210; x=1784323210;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Gx2WNIMlshY9y6ZMcE7yiVYRbzeUxlpa/XalHpo/OGU=;
 b=Cqkc9bD3j+uETmy1R9YMR+ck7XUCo4duTxKXV7kyb+3z3UwuS+MKB4kw
 0TEjAL6XjVvaILIyxzJoRuYy2oCMOzmZel9eP4e/40/SIa5srfUF6hk/l
 jnE29q0YZTPWCkATV5fmcoB5esFL4R6zEuaLQUTg4B9nwEavQcXyZt3E8
 tgmvU62ibVQMS4M8j8o/3nbY8XzHAkZLypeWEnktyNenayQy6NJLsFgOm
 8Ba5rWbrnMrlwhzeqVOYJ7uwNzY/a0wBU3diLzXqsTU1XLItCYY7xRThG
 9doINNt+sMqVo0R9hcjHHRXj9o/pOu4sZrtXSsNqlvAaa7yeRejolz/dE g==;
X-CSE-ConnectionGUID: 5CGHhIoxSJ+K5Lb0K/wW8w==
X-CSE-MsgGUID: svLJDGJ7RlGw3xwktmFDRg==
X-IronPort-AV: E=McAfee;i="6800,10657,11495"; a="55223520"
X-IronPort-AV: E=Sophos;i="6.16,319,1744095600"; d="scan'208";a="55223520"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2025 14:20:09 -0700
X-CSE-ConnectionGUID: 8IXTHUKcRmGpz6QUrTu5QQ==
X-CSE-MsgGUID: tBRXQrOeQpem76qCt/uuJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,319,1744095600"; d="scan'208";a="188879554"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2025 14:20:09 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Thu, 17 Jul 2025 14:20:08 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Thu, 17 Jul 2025 14:20:08 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (40.107.94.84) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Thu, 17 Jul 2025 14:20:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MUY4SW/dPgYl7g36OzFi0+sbDrTYZDtCLBgGYV4dzJfl3hdfKUeXNmmpJsyDQCMnAbnpOLgh5He9lfn1WSHKxK5+v0mr3mRpI4NxzfABf/g+Q1IQGwgvwEO3fcygM/FNxvaGYkwfTErxTI3J0UUhtq84ZHxxWLs/9WX+ZD5lXPlSJSrhqjLiwtWHTMLGjOiM735xbl1F70zLUBpsZPO5GzgVaF3m/IyvK1mwzEJHjvxY0jxHCqQq8vZ+mFmc9lK15AYPF9PgIXn1YxIrMaB8oB0oyGYeVhQyamiWq/WTNL2N732ozL6N2FG0AspUJEAUfLJx3Ona1wzh47R5oMXGSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hJrtE8s9sSk3tqrcXbqoDXjIOvpHEsCsBwQk/zZHxx8=;
 b=qev6R6b6pCAMcYTADHhWcodRllMXPUDQ6s9wR+u/s8D72xuQF+AUqxVmSu3h8D1VZACV/beBxEp4omQR80imu2I09dyGYgluHB9Zm8UT2dG1dundzRyP3B6Bfmgv8ATvrFNFuyqeOK3lAODE945wyZCGXI8yd2w6ckTNKKIKOcSpoqqMsUo9tnIxll9qMqls26Yp3haWp5NqCm7IT3Vsex4pptmdLbaS4YwFeUjintd4hpmcR8ALWWwMga0NoxehIWQvbgn16o/4zc3m5cbuMZX3Sb+pfRvHI22fbUbXfHNvCgmmfCLtaHuXCx8sN8RPoU5Cj7Pg1hn84m9Ire51cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by PH7PR11MB7027.namprd11.prod.outlook.com (2603:10b6:510:20a::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.35; Thu, 17 Jul
 2025 21:19:39 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%7]) with mapi id 15.20.8922.037; Thu, 17 Jul 2025
 21:19:39 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>, "De Marchi, Lucas"
 <lucas.demarchi@intel.com>, "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
Subject: RE: [PATCH 4/5] drm/xe/configfs: Allow configurations only for Intel
 VGA devices
Thread-Topic: [PATCH 4/5] drm/xe/configfs: Allow configurations only for Intel
 VGA devices
Thread-Index: AQHb90t5TwDjmHk060ODwPb6lYwj1LQ2y75A
Date: Thu, 17 Jul 2025 21:19:39 +0000
Message-ID: <CH0PR11MB544431B55F24E0F1688393E4E551A@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20250717184825.851-1-michal.wajdeczko@intel.com>
 <20250717184825.851-5-michal.wajdeczko@intel.com>
In-Reply-To: <20250717184825.851-5-michal.wajdeczko@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|PH7PR11MB7027:EE_
x-ms-office365-filtering-correlation-id: bd1b1026-8597-4f51-48ed-08ddc577a38a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|10070799003|1800799024|376014|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?VhNqc11fktDZ8M210l8To+NpO7BcSUuASxAQT+dBsH+HOXzxuFEm9m/ulCiV?=
 =?us-ascii?Q?WXou8mv/YogxWmGE0nNuzB2zUhh+6nhr9hLW7f6JGbwnWGgybKpzC38fHOD4?=
 =?us-ascii?Q?snyFdpnYLtw1hYLOsP5Wm1tYtSpQDnYmWT2pFyNj+90XP1KIc7Ud6oxUJYEx?=
 =?us-ascii?Q?31mHD3gJo6QqcjU82N3j68E5Z2CwSFHCuzpXpYGWBTV0W3uqVRLLYOI1Ex9h?=
 =?us-ascii?Q?ZgKDR65D0EMFeSDirpTTh/t0RN6E3NB1RavcP7Dg4Jem6HyL3pK1QLMTO1xP?=
 =?us-ascii?Q?/JErbSNHTGNXGDVZzwzAy2zzOgEgQZG1CopWxoB4zmJz5tfh0SzrUefsme4A?=
 =?us-ascii?Q?B3Mbh3eBSwfo6iZeQnFagnWBRYUa7VlLYIsWjLVWZ8EsLnaAUih7UYNufPSE?=
 =?us-ascii?Q?HT8XimZ4ea/YRS1BnODf6nJeVYeYJryo3moQ08nBRuyZffsh83CmyU/QCeUp?=
 =?us-ascii?Q?cAGYgZjFioByQEHHZ/5wn8Wu6FjhkUgbhdfPQPjzwXtPoFnGJ43bz+0SscEX?=
 =?us-ascii?Q?z68U6tUaEmhBXwTB8LTqQWZqPdefiuAJvaEy9aO2FC8raHl0FtpvupBnYYqM?=
 =?us-ascii?Q?IJxkIvJcqMSXNa2TGY/TnZc6QlfuqyaEyyK7Nc+NW6saNg7DxwsUu8xv/mTA?=
 =?us-ascii?Q?0zPnjBVDFXhMDtT0m0E4ohI9C/ez6Q3Zf03mk3FZjqQxO24yv/qan3h1OhKy?=
 =?us-ascii?Q?zOUcDjLgX6L4rFhauA+jUZKAgM10oBn0GmJmy9yUMBQpSI+kf12Pqf95D7tO?=
 =?us-ascii?Q?G76u4FG8J/kcEMQjg33GqdftuUoB/F47/vfE8NjWGaHLZ4ch3dVUNDYAjiU8?=
 =?us-ascii?Q?+1HPilvpGQ5kONOmubI82XNWgKcd2DDHgYZR9k75ZzgfAM0r0nJh0ANOHZhT?=
 =?us-ascii?Q?CeB/LYkGZORLODJbgMpHbkAV5cDb0lfcUKC0CTpASOcj+vK24QUbxzIyg9SS?=
 =?us-ascii?Q?87yxYCe/8BFJl4RCGFcimG1ovQdoQ2+03qVSBWcbz8wDAyuw/aYupr04c/++?=
 =?us-ascii?Q?6iI7v6JumglNE9KIs7O/zIMFoR8GiXLNWn3GREXkk0qMLkPPMqRoPr3Yp/ld?=
 =?us-ascii?Q?46KL4v3WBd+BHd9iUy/GCjVrwBB8js2Jiuy9V3V5OdZNyXKAljDmcY5WYton?=
 =?us-ascii?Q?Q06145gHa7QgiMy6ip3VCoXch/+6J1GthYYiTB3+/zqhxt2DBoEEAjNr7S/u?=
 =?us-ascii?Q?9tTepuwwZ2Wz7kN9fWATTXhYwe7Kte3KBI79NjNJSlAi2wsskIgSWyXthmKf?=
 =?us-ascii?Q?6t/x1kylNXB0JptKbPZGzKjqJ/4pQnF/BUqY1V+fRbBHOIRlPMa9K58UG5B2?=
 =?us-ascii?Q?Lq09ZGuCfphWKJMdPOio5q6FHTNZsyp5xS3zLIWXHECDEZOJQ9vtL2lX3c9n?=
 =?us-ascii?Q?kb8RsyCFdoPxIPFIV9/jLkkd+7TrmosxyIrsyxaDsxhKyB5WrymjTtsprZEN?=
 =?us-ascii?Q?OG/GFjc2Q9Zb9z7lqYs8TvK3wOBpdwqlLbSQBuq3nTGVFQrZlDgGOg=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(10070799003)(1800799024)(376014)(7053199007)(38070700018);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?J4QFMP0/e5lfNodnHMa7gJhWl07W2TvFBalpcoP9bQzbjTfHUv799Ip9LGYz?=
 =?us-ascii?Q?e7FQkD1ki867mK4iBNEg4Jw50eQdPIUa/XEYmR1YGsYwWi2V0Jb0M+douvyW?=
 =?us-ascii?Q?3hJTwyfsoV4DsKFqh3kQvEksKtp8n+p83EcIyJBO+rlJpIBn2hu4gek4ACEw?=
 =?us-ascii?Q?YQ0qLr/Ua3dqu1ult+BpPwRlZ8aINTjhG+kw5yL4teZnxcT2i0iqDREgk7IC?=
 =?us-ascii?Q?eDiKZcYuYxFYSQqse4lo3sihihq61WKX39i1Fr5pLSWwmIwvJR2Rg8Pa6zyx?=
 =?us-ascii?Q?pUcTfs+AJMvXJlaL6sLX9uryShp8iI/tmo24CsysnUSMI8lk2OF49C7Xj7Xz?=
 =?us-ascii?Q?MYIs7sreV1U85ObneJsLzamEDyQOxL/iv3PZUyfvZ7REM06iUmtIdVAHJBOo?=
 =?us-ascii?Q?TuB0dCfj2ZstliSZw1rpvw5SsYruZfarfqOJl1NYJxZ2PGkywJX3NP/fApHS?=
 =?us-ascii?Q?Pn57AGolc89gyL3ejkUsIyJ3c3TkTkU7VVAQZPg7g+L9SnzpJIPkTgsyd05Z?=
 =?us-ascii?Q?86Wi7IylAIQHcHoDNpxbLgYTNOv/2CH/JRMck9IC7R97tnO1Vm8rcaqmtRTI?=
 =?us-ascii?Q?m/IP5AEmEKhSTxhVxfViq+E1RUjvT0QtcTnfF127MwaLDQKsPYRF/Q45Y/Of?=
 =?us-ascii?Q?sxX64RGBt368TZ0DZ6riHRX204vYUFBwOhORH9TfYhNYiCslCpQKv2/AWaJI?=
 =?us-ascii?Q?rb67QU8FsoaE0r0U/9nTttkeDhtJfKbTgvfnsloEK4GoCUQccbo+phb9prF7?=
 =?us-ascii?Q?vXUhbJ3bVxi479vh8/0iI9P6FUX17VBqNwoo3KxR6wRirdNAz7cc4qhjdq96?=
 =?us-ascii?Q?3By6kF2pa7W6UQURCzXKNy6g6t4u2dPjPtrsWvShwBcMbJ9Srq7Ki7tOfIGb?=
 =?us-ascii?Q?xq2heFfsx4x4KMDbOL0rqERRMNn//3tGhEil/tV0QCzCJcTIkPy4X3rI7v1J?=
 =?us-ascii?Q?EG6jPfixiZjY65yGggx3ENMmeM0H+CeJdtsqjoS8fS7oWQd39jxDzJ2wISoW?=
 =?us-ascii?Q?nRmPoZg3Pg7VAGqtyKX9t6sUfBGVmQX9qeh0mBuHMW/RXrF++XQo6wG/rRbY?=
 =?us-ascii?Q?r0nTKdsAJ13Ukm4VLuaZmAyP/tY6DtgaY8qE7rsUQwZ5BqgLS6exPZmBHniT?=
 =?us-ascii?Q?y6o7adFa9nb4tCLMHVKmvatViMvdIHghy5oTv4qZ/WN/C0Qbi0xoi1RfMF+T?=
 =?us-ascii?Q?K3R6bCQm3zO44tIEEXlc5WbREj56Ik4ezXbZ3ZHXEuzKNntojLAqeSHDbs0V?=
 =?us-ascii?Q?wWMHaNa5dxsHgYcsuasq6leF02jq/gzf0ZVIJvDr3G3+rfCGZ86uiWIkCk+f?=
 =?us-ascii?Q?HQ347qEqpm7tDA2w1a+g+xDP0SiUep7dKOc+/QUKYImuSAEylLoe/iNgAoZc?=
 =?us-ascii?Q?dw17zERbApffKuEEjNelpNNRAnCPwCZ/CcVixszQ9Tpg2SoNr+Cz9Dc1sG3K?=
 =?us-ascii?Q?bPUrcPwobovobs/DyOv+UwnaFi5AkoQTZ4yE27fyuoQw+4A/9mcoxyUFVMT/?=
 =?us-ascii?Q?TCACr8ozoqXa9Ln0swmUSQIAeRQ30imK5MVOwsZra08oM+wyO9PO+aF2UqkG?=
 =?us-ascii?Q?AHB/XCUmFTRJ60lIJHlRjggsKXaDi4+1dMQdTTC6xpnThhqD93GJAdDCNUHO?=
 =?us-ascii?Q?eIQTzhwMHuRaarBJGJmCLBz8QYG34v+zHjzAhiRZNB2g?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bd1b1026-8597-4f51-48ed-08ddc577a38a
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jul 2025 21:19:39.1630 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ud1ySEr4lhMFOLtx/EBRUBhKQUfX3Su+W3x2WZGoibYUPm5LA4GlvbBhVqfAlcN1ODARGW4dJcjRDdHSidQFJVI0Hl3Y529VOHMxxcSlQD4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7027
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

-----Original Message-----
> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Mich=
al Wajdeczko
> Sent: Thursday, July 17, 2025 11:48 AM
> To: intel-xe@lists.freedesktop.org
> Cc: Wajdeczko, Michal <Michal.Wajdeczko@intel.com>; De Marchi, Lucas <luc=
as.demarchi@intel.com>
> Subject: [PATCH 4/5] drm/xe/configfs: Allow configurations only for Intel=
 VGA devices
>=20
> The Xe driver supports only Intel GPUs devices that all are PCI
> VGA class devices. Reject creation of configuration directories
> for PCI device addresses that are not Intel or VGA.
>=20
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_configfs.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_con=
figfs.c
> index 00bb4e412c12..1df8cce78f13 100644
> --- a/drivers/gpu/drm/xe/xe_configfs.c
> +++ b/drivers/gpu/drm/xe/xe_configfs.c
> @@ -260,6 +260,7 @@ static struct config_group *xe_config_make_device_gro=
up(struct config_group *gro
>  	struct xe_config_device *dev;
>  	struct pci_dev *pdev;
>  	char canonical[16];
> +	bool match;
>  	int ret;
> =20
>  	ret =3D sscanf(name, "%x:%x:%x.%d", &domain, &bus, &slot, &function);
> @@ -275,8 +276,14 @@ static struct config_group *xe_config_make_device_gr=
oup(struct config_group *gro
>  	pdev =3D pci_get_domain_bus_and_slot(domain, bus, PCI_DEVFN(slot, funct=
ion));
>  	if (!pdev)
>  		return ERR_PTR(-ENODEV);
> +
> +	match =3D pci_is_vga(pdev) && pdev->vendor =3D=3D PCI_VENDOR_ID_INTEL;

This match check is relatively short.  Debatably, we could just do the comp=
arison
directly in the if-statement instead of assigning the result to a new varia=
ble.

I won't block on it, though, since clearly labeling these comparisons is im=
portant.  Though,
perhaps we should call it "op_supported" instead of "match"?  I understand =
why it's called
"match" here (it's more in line with how it's used in patch 5), but maybe t=
his check and the
check in patch 5 should be separated out?

Just a suggestion.

Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
-Jonathan Cavitt

> +
>  	pci_dev_put(pdev);
> =20
> +	if (!match)
> +		return ERR_PTR(-ENODEV);
> +
>  	dev =3D kzalloc(sizeof(*dev), GFP_KERNEL);
>  	if (!dev)
>  		return ERR_PTR(-ENOMEM);
> --=20
> 2.47.1
>=20
>=20
