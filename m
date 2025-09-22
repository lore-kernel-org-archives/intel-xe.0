Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D89CCAC592
	for <intel-xe@archiver.kernel.org>; Mon, 22 Sep 2025 17:35:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E495410E4DC;
	Mon, 22 Sep 2025 17:35:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="d3lSdr18";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 669DE10E4D7
 for <intel-xe@lists.freedesktop.org>; Mon, 22 Sep 2025 17:35:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758562543; x=1790098543;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=IvCAgWv303vrUoQBrcqogriRQlf9qwvv/6DRHUwb5AI=;
 b=d3lSdr187a2IOl8mtAmj6h0EwYSp3z16LvtfD1Ymzgv4zAGPlpyzrj8d
 +HmRvfkJwJwBhqEC5ZfRm0lxV3uMhanYOYo1xt7pOFpysniN0dnw4IzS6
 rKRcKjILLADi9k03zFKoq0hAvhgdgSdP9Njb7mCSZSDC0wnKPi0kdz7AK
 oZbTL/m94L4DEsYysGQASNZVpMb8OSq220USJeEC2bVhFl4Za/JcteFCc
 j2YxwcQs8FH8Hn53cY7vtellAy3vnaIcwMObvzJb9ES8FCM23PIs+VxZ/
 8EsodYKyCNyC9jqgHLAs8BYHZl3IS2dEXzcv64/hIAiGJQ1Z94zLgMqKX A==;
X-CSE-ConnectionGUID: nDi6caGMR1Ks3f1n0OSERA==
X-CSE-MsgGUID: Mh0PVsTjQpyPGarv3djXAw==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="64636183"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="64636183"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2025 10:35:42 -0700
X-CSE-ConnectionGUID: 1JwnHiW3Re6HgSrNzKqj9w==
X-CSE-MsgGUID: PXMvjpuFRmCVxKWoxcfjwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,285,1751266800"; d="scan'208";a="175674496"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2025 10:35:42 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 22 Sep 2025 10:35:41 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Mon, 22 Sep 2025 10:35:41 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.1) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 22 Sep 2025 10:35:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=owkdcb6Xm1MQyBjiLGT0frHf4uUfbSQdhidmV/TVvXoyWn2L/JK+Lw69R1lc9wAVsu6QJAOWvQRcKV8FgwCv1txuQm699coMRMo05UitzYxVZaKC++oRC34gF9rNlZtqOA2LfYTlhc6Fb5lWTv4KjL7uneRhb6rVyQK9GVs1f7/Oa3BBvPRPXRLjE3kXCG1xC9J1fHLlz2mYXixQPLT2xMUJ6VWmtnyNXAMVg4THib4evOd0mG5wm/8JVN5z2O+SLY0nHPCTiFzYPbAFdogGrRfvcaOJh/ZEV0fHceeRteWc83nqKjrMSXP6ooy8I7JVDdt1mCIoS8Td9Y2UJvdNfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4Y+4PVieuWAlp6tovngbm2gExLjDNhuBy2cWcVXuBm0=;
 b=sawZwfdkdpzvH1Sw4zg3KF5I0HS9RSV+Wj2fyqNBAKXSTI28a+TUCdLP/RiZfxvkhtzMuj2rlKMTYoxwx5O9ucegBjS9h0hJnbw21sr1V6eCGiMXNbA5QzrI5ifD1IhPU1hPwCSncrx0qyCF1Vd6FrDA1vfx4BfZwDAxVtYxrlSJBK4/3EMKXYDrCxBetLHj6859AAQpstmTGqAOBlt6wN1YDtJbcUfwy1Cu1xp+ppYEa408fJ2vZBitkbq15mafrSKReTbiJBGT7AGYcu+5/FQjbnciNKswDM+yMM1elN4lMbf61DS5Q4EuwYwxMimkJrfMnjCbgfZVRB2X+z/YaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by IA1PR11MB6419.namprd11.prod.outlook.com (2603:10b6:208:3a9::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.19; Mon, 22 Sep
 2025 17:35:39 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5081:cd4:1a4b:a73e]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5081:cd4:1a4b:a73e%3]) with mapi id 15.20.9137.018; Mon, 22 Sep 2025
 17:35:39 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "De Marchi, Lucas" <lucas.demarchi@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Gupta, 
 saurabhg" <saurabhg.gupta@intel.com>, "Zuo, Alex" <alex.zuo@intel.com>,
 "Jadav, Raag" <raag.jadav@intel.com>, "Cavitt, Jonathan"
 <jonathan.cavitt@intel.com>
Subject: RE: [PATCH] drm/xe/configfs: Correct mask and pattern check in
 lookup_engine_info
Thread-Topic: [PATCH] drm/xe/configfs: Correct mask and pattern check in
 lookup_engine_info
Thread-Index: AQHcK9lkLy5ymKPuok2Jc6mz5CHLLbSfdZeAgAAAUmA=
Date: Mon, 22 Sep 2025 17:35:39 +0000
Message-ID: <CH0PR11MB5444DC317FD0734EA4A9E441E512A@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20250922155544.67712-1-jonathan.cavitt@intel.com>
 <rf6v73qkdzduxcctem7e4o3zs6pdoijcctbginwfkuqv3dg5gg@txogogihmmlq>
In-Reply-To: <rf6v73qkdzduxcctem7e4o3zs6pdoijcctbginwfkuqv3dg5gg@txogogihmmlq>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|IA1PR11MB6419:EE_
x-ms-office365-filtering-correlation-id: 55844ab1-4fcf-4c0d-cbc7-08ddf9fe7256
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|10070799003|1800799024|366016|38070700021|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?q4rr3WJvjoDRrsbw527jAgUzP/7TfBh1D3dvM+CF9Cktmj+C0u0l/NhhCZZk?=
 =?us-ascii?Q?ir9gnnrhsf7m9l7TpqU/NGl/T+cXcryDHhrMMtGEHKxwezgFtBowkdU8ZX50?=
 =?us-ascii?Q?Jr0Zy+Bg94b/o75jODHOvR5b0Gb7+JLtkR7HzLrtbTeIBvgunOwKAOjV7Vic?=
 =?us-ascii?Q?3jLY83UbzhPfc1YRpikwJGLt90DTfzrTYmjEZxnHtYGkC/4l1XKhB/YCEDfm?=
 =?us-ascii?Q?WIExiq+5rcHyxFPg85BCciTHA8mQNjkHR46tgEGDdHBsARSdZjCnAyXFFDq6?=
 =?us-ascii?Q?uxUAtZpSfwGj8o/XHzRUg6+VCtlean4z3nwA3x4NkgXmvm3C/tnml63ZQCf8?=
 =?us-ascii?Q?ZZ5WwM6TcZY/gW+Ygu8jF75NkFCbiAI5bDFjs3GCJ3mBbzkBmVM0OXmD/qD1?=
 =?us-ascii?Q?qcg6vYkRcikVS2L3JgUKJtLQ+iSG6yEGbfJA/5dXiWmvKUi0B1JOln9kye1+?=
 =?us-ascii?Q?z4DJo1nb6/wAmbTWWH0QZ52uh1/4SNEX410kdHU7Ner2BepYQuvYCZyb0VEG?=
 =?us-ascii?Q?UNgOApaWMTMPterWHvaetvIUpuj+jTnUu5WUVeLfZ/gKMhMSMWi1EwNzTvRA?=
 =?us-ascii?Q?3Ic0GuHcEKTyPZwQpIlLx7Zlh6plZ60+zV3ke2HWV/nxSqQS2kxxCJEYrXny?=
 =?us-ascii?Q?bZYYPjUJrxHcEWaRTwkri5v9mF/mue1WBNsNbk7+x8YAl5Un0WhdNipLgRmP?=
 =?us-ascii?Q?J1bi42duAZ0fdj3ys8ZbPylkT++I5UDcPwbAwodvcxlvVKXa+MGfGaub4m+p?=
 =?us-ascii?Q?RcWSc7kPiCNIWYeeUvP/HwdRTLus0FHiPenl1H56+/I/YZ/TWq5r+td8hpAz?=
 =?us-ascii?Q?WGetwSwgNOeOENopw52GKNMghhPWr4ODHgAB/tfUPKXN7FO3+XA9UNdTDUqJ?=
 =?us-ascii?Q?gM5CaqoNy/PMgFPZ4IvfdxF2KTJQvsz7KnsGJf4jj+MkkIg4V5h5mgz4taZP?=
 =?us-ascii?Q?e8PNmncw83Keg8d5Vcdc5vorD0VMbx5xGkPxadPkAVPF7RZBaYcafi9L6RXK?=
 =?us-ascii?Q?XucLF4N1esYiO2oSeAUEjAAmV0DLvrg+tofRdBcz/HGb3sSMwm8b3VrxM6K6?=
 =?us-ascii?Q?exFCOr8iOJt1qYUD8GhBZbwVF8amVSygPPOvteodE5MAO01hUs8FNmE3J5Qe?=
 =?us-ascii?Q?Dhzyo22ATpPbeYHjxZP1Y+VUQsuoQXetoK7yDtw04EueL6w+WocG0bvVANmt?=
 =?us-ascii?Q?Oa84gAIaextVh0yVoxtUoamnvlAKQ53+JFfz+PP3WARyrN7RtztG/uOmGVsq?=
 =?us-ascii?Q?MHLyaXOdcjKU6qevT1D8RSRb8UxSwwaial5euvKU8hc0SdTNJs1vHZL1Pfyc?=
 =?us-ascii?Q?W5hYcsFmGwnl/hS27+SSk/Ie0WXHCRU+0vzPzF6ESrSpeLC+rhBno71VN/x+?=
 =?us-ascii?Q?CQqd5PSEGEKU6skqQrTe8BwBEXHZWGGmN7M6ibNLecjZxVRaWgph0pLqpJQt?=
 =?us-ascii?Q?h2pRzQi63o29lIxSJxsIRKhy1H7t4plgR8c+2s2Cng8MOlsU9jP4VS9PXinm?=
 =?us-ascii?Q?jNrVMjZrnWXaLiA=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(10070799003)(1800799024)(366016)(38070700021)(7053199007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?FZ+oV+yPX1L6rDQCh369dBXblXYIDvetq/oOzlmaq11COTUILzk24KsnuUgP?=
 =?us-ascii?Q?r4xQMDnFVgShvbnpKCHne2FMTkbv4qrC6dNOVVeIJfP9+EFQtBLzXeeeBnlD?=
 =?us-ascii?Q?onmzZGaGih/pC5Kx5CbvnSENFscduqdofBEtVffTR6LojH05mu7HBs4YzHK1?=
 =?us-ascii?Q?swUirLujoXAkmZfDkhUA6vnSidXI6n46QX9eEQzDd5qbZP8x9nx2vI6h6WH2?=
 =?us-ascii?Q?DMKTe8H8E+M/WsT2tlelMTTbILSek63ROFf1RCcalu6ksnu+Xe6ToDHgyCSv?=
 =?us-ascii?Q?rOSHvaIDn/nv2FA1LfOjANG3vZS3cPZYu+B2AyTku43NEatDD9gTJVH1d2IN?=
 =?us-ascii?Q?7IWcn1swn1lM7j48DuVfTvV27h5wEOrXVEn8mWHVRxZDaBRNTDG0SZIV6Nrw?=
 =?us-ascii?Q?1Y+8I4HXpLkLZvrpZQrAfMtZYiwMHUfwLXwIr7cOjjzrcAJtDn3pbLO4PzRL?=
 =?us-ascii?Q?NppyoPwyQ2u71NQ12ajM0s7sJu/rjx4olxKi5zsyZg2/aaNucMwvFOP9YJeG?=
 =?us-ascii?Q?tud58dEtfVwC0JoPkS5cuOIdP/N/TmT6vLNXLZ7QWFvAQgOjHxcUNvKu+SLL?=
 =?us-ascii?Q?diLqYDYBy1fD85Tnk99Kpdg0Y99MOsGTueO+Hd5l8fejPQ3xPzgDH0ZEvoBr?=
 =?us-ascii?Q?V5Oq+fnmPgdH7oRv0XSeZ3FelEeuAOuUFfOBaFWGdE9Gcntwz4XHL5fi8TkI?=
 =?us-ascii?Q?sOChnlvcT9gAEmmsNSlA7+PFilGChgg7e+JLmv0K8Ai7Di2oULDlltCLcrVZ?=
 =?us-ascii?Q?H+NJWy90GhhBIiIOzeaptAjtiQ/V6Y5iPq7n5G2hIuMc0u97//3f91eKUTev?=
 =?us-ascii?Q?v84nUO5mce1Jmy/GK0QCECQlQ2OTp6cXQMuin49SpoI0VTEJHoubsCSvXsO1?=
 =?us-ascii?Q?+du+PMyg9aVuSYbMq6J4JF8fAtFdHK5cu6N6rl+GaT+Vf+fjRoLBdSsUtz86?=
 =?us-ascii?Q?WIBmrj0G3oD5ZuXeBYsaGgO5fufvmgYQXT+Nn/hZZoy89Xx9IJdw7hSpIcEt?=
 =?us-ascii?Q?I1ipvCk5b6EjoII7ipZ4l7bWKJe9NwaeFCNtSyCHJBKGQLaxKmmAjmb4oo7U?=
 =?us-ascii?Q?5jxnoBq4EqROSS3vKMtR1pOpSbaFMxzakEC+/P8x9AFc6iN1bb6Bt+Ad8uFL?=
 =?us-ascii?Q?MvvTmdyhV7U4+0D/1qiIQd6qn7f1d6trF/2BIimBw+EoYSghUIfCxhgKIK9U?=
 =?us-ascii?Q?dX+u05iVoOzRjZbld7xs9sweSb5hO85sUyutwp4UGi3rKjSLJIrv5K6jaN/g?=
 =?us-ascii?Q?xBDQViUsygVQjoDiuKHh2Sf/1+ALWn1YxGKYlK8bruU+tg3zqlmJlJNvbWha?=
 =?us-ascii?Q?/8VervBCHZQ/7LF79te/XibkYEqqtnNUaWLGFS02JekbJCaXv/BnS4o1I4ju?=
 =?us-ascii?Q?LKB4+qvXczQBGiSsHXdj++/VyqDcr/sZbL0fdkpdw8w+UMU+JCUmIbW1zT3l?=
 =?us-ascii?Q?fT81dd4vNUYTzTY+GY6ONVyYg2Ztv0HM/LEOXJBuukiUG2nApk0xGBzgLkPk?=
 =?us-ascii?Q?hoiG70lfRxWHqV4Ze4QAFXwlJp8/amVHgYbYdd4mq4EFmVRr7oJgCLTCMBQT?=
 =?us-ascii?Q?/jmvq/PcZ01UaI7M8C8WjcaJrMZ14zfOBmS+ozDcukZ/+uYBOiw4fftA5xxQ?=
 =?us-ascii?Q?/Uk1YCvr8fmC8gn0/adJtLFri4MZ5pE2c1qmRsYswyAp?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 55844ab1-4fcf-4c0d-cbc7-08ddf9fe7256
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Sep 2025 17:35:39.1219 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SRGEDsO52b4OPFdEImk+fJEfpmYMqU/1neMP4UFTuJq67UdW9g3+aNN2KLsKMPF7fC2eYI4N/yYa4KFflTtI3g9sMMtcC14aC5joKbW4WdE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6419
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
From: De Marchi, Lucas <lucas.demarchi@intel.com>=20
Sent: Monday, September 22, 2025 10:31 AM
To: Cavitt, Jonathan <jonathan.cavitt@intel.com>
Cc: intel-xe@lists.freedesktop.org; Gupta, saurabhg <saurabhg.gupta@intel.c=
om>; Zuo, Alex <alex.zuo@intel.com>; Jadav, Raag <raag.jadav@intel.com>
Subject: Re: [PATCH] drm/xe/configfs: Correct mask and pattern check in loo=
kup_engine_info
>=20
> On Mon, Sep 22, 2025 at 03:55:44PM +0000, Jonathan Cavitt wrote:
> >lookup_engine_info is described as such:
> >
> >"Lookup engine_info. If @mask is not NULL, reduce the mask according to
> >the instance in @pattern"
> >
> >According to the description, we should be exiting the execution early
> >if mask is NULL.  However, we appear to only do this if mask AND pattern
> >are NULL, as opposed to when mask OR pattern are NULL.  Fix this.
>=20
> that's not true. the condition is if mask is NULL and we are at the end
> of the pattern string, i.e. *pattern is '\0'.
>=20
> Passing mask as NULL means the caller is only interested in the engine
> info.
>=20
> 	lookup_engine_info("rcs9", NULL);
>=20
> we don't want this to pass neither:
>=20
> 	lookup_engine_info("rcs", &mask);
>=20
> Lucas De Marchi

This is to correct an issue where mask is being dereferenced while NULL.
-Jonathan Cavitt

>=20
> >
> >Fixes: e2a9854d806e ("drm/xe/configfs: Allow to select by class only")
> >Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> >Cc: Raag Jadav <raag.jadav@intel.com>
> >Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> >---
> > drivers/gpu/drm/xe/xe_configfs.c | 2 +-
> > 1 file changed, 1 insertion(+), 1 deletion(-)
> >
> >diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_co=
nfigfs.c
> >index 8a9b950e7a6d..0c048d4a33ab 100644
> >--- a/drivers/gpu/drm/xe/xe_configfs.c
> >+++ b/drivers/gpu/drm/xe/xe_configfs.c
> >@@ -324,7 +324,7 @@ static const struct engine_info *lookup_engine_info(=
const char *pattern, u64 *ma
> > 			continue;
> >
> > 		pattern +=3D strlen(engine_info[i].cls);
> >-		if (!mask && !*pattern)
> >+		if (!mask || !*pattern)
> > 			return &engine_info[i];
> >
> > 		if (!strcmp(pattern, "*")) {
> >--=20
> >2.43.0
> >
>=20
