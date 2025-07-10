Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DCADC83F17
	for <intel-xe@archiver.kernel.org>; Thu, 10 Jul 2025 14:23:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB08610E381;
	Thu, 10 Jul 2025 14:23:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BGHVU7PS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C24410E381
 for <intel-xe@lists.freedesktop.org>; Thu, 10 Jul 2025 14:23:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752157392; x=1783693392;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=2DqSWkM2u+MZntPw6z7F5zjq/DX0pSqMLUubAmQp+1Y=;
 b=BGHVU7PSpWq6nXn8vON9Pej7o7wpzuJ/3HXWDm3+zZYCxwWwNxJ8Dlzg
 /5ao5ZziSXiWlNClT3D985lbzNvjGyPafLKwrKHFBSmfQReeY1W/jivfA
 xFTRvrt4vhGGSLEq9uFigrY7NqCdWhuujtw00mPzGW0pTixKdYxQ3GoI9
 Pz7pNki025HKBovVxn2jfvr1INIwJdriD7h0AfasZoKq4KXV0u/YJ2RLF
 clPtHWQY9l1Fm9Fob8Ui5+LlKp3JCZS0WW0gkThiRQuoD06oPx1l3qjxp
 Z89F+hGL8Mbg3PafCTj3tM6TEQ2LOhg0c/Qt3hmQ8jiPsfeBN6yt6J79r g==;
X-CSE-ConnectionGUID: UJ9rfETwT1GML0EhOSko9A==
X-CSE-MsgGUID: zRfTyDPfTk+sZiF/z4TJ2A==
X-IronPort-AV: E=McAfee;i="6800,10657,11490"; a="76983560"
X-IronPort-AV: E=Sophos;i="6.16,300,1744095600"; d="scan'208";a="76983560"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2025 07:23:12 -0700
X-CSE-ConnectionGUID: N11uQL46Tkm2gcMMHhbivA==
X-CSE-MsgGUID: jLf2DhdDRPaRwaQUUOlchw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,300,1744095600"; d="scan'208";a="187083600"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2025 07:23:11 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 10 Jul 2025 07:23:10 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 10 Jul 2025 07:23:10 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (40.107.243.87)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 10 Jul 2025 07:23:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xDcey6fPgEAwGjWfn35huAhyOPxfuAR13QguGUaPvTCmEGDnueLC5vXFkcFUetzyVQxfcFyxasGnpMQkhXxb1FideVha/LgCvX050q/92iKzHTuAR/m1hwvybJ3fAkrPdpQq7Ua5ts5LjNSeHAvMPWKaIq6MKbRBg74RjHTnndZzxmYIupNdYNZ0FbwQhIegghAIXvbz992uNh7pVfwwtpTEbdSsblu3ntqcV4AkS3mD75pNDH9AmBmwUyyiIYr/Ugjxf3zNfM0cqxVXywn/xLuCLvEZ6o5BMJcs0K0Lpu7XUdrUshRD8u/wcHVsEWZufYU8VnCpL1QeSHM4ol20FQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jigntFfQTIdWf1V9ncYMaKTsxnsZaTg3Sr1xsZ0zaa8=;
 b=NH1HxNArg4P+7JcflWonT2z1kCNGyQB3q/u+rkX5PJfks4RPJI8T59+kaomXCqIcVU2ifVnW3CI/y/ZF+VGxzh1NrSlx/pmk7AQ+6hfo+pKXsOekHerFBQ0lxUZHaDmRjzfpvBaUrRuv9NvjL63zbop1klUT6y33lNpWgn120V+Y/Px6lwYVE6/6BmvjtExFE6R3Gk2bbz4Ew6tkAeHWwfeDjPjhp0GBERADjJ51EkYS3AWRAnH+Hxur+Pwjwmj5pa6X+oOXL1Vfb3zfdA9dpboZeS4vHeEzfVYn5B9TUiyyG2qmyVxcXHm4pYdmZuvpa5SZxQWnuliFQN0nGl7bgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by BN9PR11MB5228.namprd11.prod.outlook.com (2603:10b6:408:135::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.27; Thu, 10 Jul
 2025 14:22:28 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%5]) with mapi id 15.20.8901.024; Thu, 10 Jul 2025
 14:22:26 +0000
Date: Thu, 10 Jul 2025 10:22:21 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Andi Shyti <andi.shyti@kernel.org>
CC: Heikki Krogerus <heikki.krogerus@linux.intel.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Thomas =?iso-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>, Jarkko Nikula
 <jarkko.nikula@linux.intel.com>, David Airlie <airlied@gmail.com>, "Simona
 Vetter" <simona@ffwll.ch>, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>, Mika Westerberg
 <mika.westerberg@linux.intel.com>, Jan Dabros <jsd@semihalf.com>, Raag Jadav
 <raag.jadav@intel.com>, "Tauro, Riana" <riana.tauro@intel.com>, "Adatrao,
 Srinivasa" <srinivasa.adatrao@intel.com>, "Michael J. Ruhl"
 <michael.j.ruhl@intel.com>, <intel-xe@lists.freedesktop.org>,
 <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v6 0/5] drm/xe: i2c support
Message-ID: <aG_MnWWlTIp9g9WI@intel.com>
References: <20250701122252.2590230-1-heikki.krogerus@linux.intel.com>
 <s7kfne6budueamqqbshbrrtql6awrp7mvfhqlkrvtyhqjqsech@qemfad4phmlj>
 <aGWqCfpcYUla6T2e@intel.com>
 <2qhkmfveb7vrjuhmeeij2off6wiczfh4hetzayizsrbuc57ewe@kbu6th33p5pp>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <2qhkmfveb7vrjuhmeeij2off6wiczfh4hetzayizsrbuc57ewe@kbu6th33p5pp>
X-ClientProxiedBy: SJ0PR03CA0118.namprd03.prod.outlook.com
 (2603:10b6:a03:333::33) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|BN9PR11MB5228:EE_
X-MS-Office365-Filtering-Correlation-Id: db2c40ad-1131-4f9d-6c69-08ddbfbd31ab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ppyv+PGE5UyZTtm3ohAOigmUJrTqEKmas190niekJNe0xKXNPuaNQ4LiETV+?=
 =?us-ascii?Q?OBpcsPM+rW4isTfPqg88KCMJwUvX3xS2FGsHs8j7x6MfjcwEZ+6fUL6Vwib5?=
 =?us-ascii?Q?2+boJAmb5xO7WUAoDaCmhfJTqQENiiGl3OAwo5wWQtFoA2TNWz+YTnnz7b8y?=
 =?us-ascii?Q?bcmUSe1akbMziPZ+7V/uctOOdZl4vDdt8GGpFCKStHlomvDIwSePp6b8g6x2?=
 =?us-ascii?Q?ZnN2cn+kMT8/Q6N+c7hSCq/UwmfAxslnjgBvERJP8bwBMd8eHT/V2TQOuUXC?=
 =?us-ascii?Q?22t+LjGWppvkgQOBdPUPQNq3eACrFjMB+BVCx/OexbNVd3PmB4LAV6dPax0C?=
 =?us-ascii?Q?VWcQ90ZU7jA9RKQZRpW3SkUl1Zb4C1zc+a98MQG6f/TlGQFBWxbxzAP0eSCM?=
 =?us-ascii?Q?Yi+28e1g+x6ZXEn5cmY0ElGZZDE5ocJEfVXqP+GiIt3vLAEkiOD0sj4bffch?=
 =?us-ascii?Q?djsfwzx95yCVVYH5ytB7s1M+pIKn62CsZL+o/ejTcDjxCuU/3y7+VQvzgXVW?=
 =?us-ascii?Q?v7ri5s+dtXhzUZfiLqWExyJLEmmMJ/tclzBsdUto+0c96yrekrw+509ovYF2?=
 =?us-ascii?Q?SXl0vEmp+y0SJdJTrUc4wXjQ+CzPQwbK+vmfLPcpl/AV47v7PjKdVDRxV/FO?=
 =?us-ascii?Q?UWo3CofOcAU75FHXr/0Hc9iohLoaPIJiiEYKaTkTw8nTbV/aUya2XA1Cms/p?=
 =?us-ascii?Q?vo0v1dlSG8jzRg20oiSINP2JsZeiJZUlWMVqV1h4I8+YbZH8JFJLuVFCkZgR?=
 =?us-ascii?Q?VmpQ7N4UaoB1EYCgbihW5Pzg9TzsXA1w1JDNAyQz6CMyLFaTDTG62wc8svI/?=
 =?us-ascii?Q?bFqd2WdE7iARXHgN65+U3iZPjp4Oaz6oY0UaEowVxVHtkyK9x7DGcfvG1wj0?=
 =?us-ascii?Q?07TW43p+FHLqohwORTB0d8q2fxSJBESr09ypPI4UGjSe7D4lOKtKdVNM+RTb?=
 =?us-ascii?Q?wCR9VcJDVz0PHP2/7CMULCul6QdEz2ogFK8uIKnoKnCm6JXCDuC1W5Wt4ooG?=
 =?us-ascii?Q?MRxfV4TxC4J27+S8CCWYzyXFMBXo33bAeLWR3oSmZOltG5IqIxquHI4dbMwI?=
 =?us-ascii?Q?NEhPhKuJvsmSbV8rdvH/24+0cdYUDq7HeiTGcYWlHnNeFBtShzdbIWcCHYGz?=
 =?us-ascii?Q?g37G1f/8RpkfFc6ApQWf6yNOcFe+F+dSB9sg8HEYKRAgUCemlT6nWk+NzMJp?=
 =?us-ascii?Q?Zw1lNsGLiqeNGFn8imv0UjeTN1dCci6tKYOf1y1LgVLDIX2lXspgjQUPicxr?=
 =?us-ascii?Q?vsgqpr7Wp3VHJ/U6bfVHmbNBeWoQectkC2UgUPfNAW0a49uBhMW4xaLgWU+g?=
 =?us-ascii?Q?WS7AoQlYy6tmKV93cvA/OAkFDZk4IdmN9I252w72gtHM3N7mb8TqPYGWonPb?=
 =?us-ascii?Q?pUfxty49kl0cQmR2reSSrVi7mCHrWMpwkuE5/oFTPUH3IGCxtVP9D2nXqKdu?=
 =?us-ascii?Q?3vvFMiM45lM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Pfxy/lgSAFtt2WmDXuegtEkLEU7qi39kFCQTovjwWiLwDvmokox5j61elEm4?=
 =?us-ascii?Q?wNG8NR4NjjDWcRgiFqK6q2STaREz12YyBxo5S5VQ6HqYweikEY7jxqQshrxA?=
 =?us-ascii?Q?iD2sb/0gY/1y6JU/pVB0E19qjxAAaY964bvhS+oXL7JkDLfakxE5q480Uwzg?=
 =?us-ascii?Q?LZPIZKo4IjlF+F9pRKHulvLi88Qxr81G8LaM4F090vuOheU7N4jI98pY2CWD?=
 =?us-ascii?Q?odcRlR09ZbIVCkdmp+uovr9NiGF8E54XGoPKmRjPvDQHuR/FfK4mQIk4Lp+t?=
 =?us-ascii?Q?UO8UXEvTLJQ6blwrWutfB23I+UhpndjW0UhV6Zxiq1KvM2i+33wICE+8/+B/?=
 =?us-ascii?Q?KC5hJgQWB61sxRz4to2U14iLL2AMmI3RRXGxZoIf5Jdadu2awIeMSST2SjcH?=
 =?us-ascii?Q?u9nh7g6Tpxh5m7ZWVydEf/3DkNG7KEWeuYbHXPboPJgW14IgSvVavQstcX3I?=
 =?us-ascii?Q?w9UBEY91ZO02XadWsm/zy4n2QDn14KC0ffjBzwwD8sdo+pU7a/oxoPSvWAFS?=
 =?us-ascii?Q?bq32wSNLzSY3FwayveoVutduyLh8bu2gBdA8Tg+8Ghi5ToGnhDSZxkuLPdCE?=
 =?us-ascii?Q?fFhZkcQm5lxkqkKB+VkLvTK+Hz6O8SUODIIZ144UP7FQrjlPvuQ9kbAUIIOF?=
 =?us-ascii?Q?BtyWC7abYdTK97KyPQ0Q0fiLFMsHnuw7tm4UBQio5rbjkI639RFeu5j1myx8?=
 =?us-ascii?Q?A3d/WXlO+XOQNGyYY6ntcbxF1fqv64Id8pXSTJd7+JvXLZ0xgz4rzvRoKZ62?=
 =?us-ascii?Q?6/LRwOSDk+Kza+a7ip14ufJI5fkC6Wq3WxOlGxePTg7B8N3n67/uNmwsNj7f?=
 =?us-ascii?Q?FTeElJnCQLRRXqgcpQ9iNthUstAki2sUx1bt4UruXDB7x9gUBmPOz1FEbVFW?=
 =?us-ascii?Q?/tbIFhB3evF7OVv40sWqq+R0o712ERdo+f/WhPrifmf2OTdbm1DGL8QuLExZ?=
 =?us-ascii?Q?rM+/mB5+jBDnV7vJuZmCiNaYWbEhcsarIiLy8NlSm2XZZEJPDwv704pXvgLk?=
 =?us-ascii?Q?IiLLglVWiGWv2AdsLjqLWf4ZxAE4+ZvOUxtMpTkTZWMm6J/DFBczbNOF9ssN?=
 =?us-ascii?Q?1hUfdIRxVlpGhzPgwj7yVkJCqtpRC68p6H+z6sjlAj41Cq8CNxSihHLGcPdj?=
 =?us-ascii?Q?F+DQqediwV9BYeQ1Swk1p0vfL41Q6yf1YLQGsL2PKx6S2++jm62wJoUgx9Vu?=
 =?us-ascii?Q?wElD23bPjfsTwXkyPIq40pG0/DiWga51zt4GFDSz6djkX8AY5GiaI63DfLnM?=
 =?us-ascii?Q?tM+M4WLEIqj3SIGGgpd5bqAYOqbZXzyn2JobNCoI9+8ZuOd3kns8z8ZditnD?=
 =?us-ascii?Q?18PbMFem/cSdkfPDuAcgU8l1JNm2VQsGl7wLJAZweRElIRRDaToA6fxgjokG?=
 =?us-ascii?Q?s8YWOnw0mCLq3WDUw07Ry5+PE3FLu40kzSxyqYBhm4Nh5RAlqBv84jlxNjK3?=
 =?us-ascii?Q?RX00+e779PlQj3HCect1Z0H2JGqBMitWBUMK47IH08/mZRsyx0Lih58YLVZg?=
 =?us-ascii?Q?U4hPvgIZndPwGPeBaxVcuBuL+JtJpDehyyRKauKwV8sx+ft+tS13UYbZLU3T?=
 =?us-ascii?Q?kQIDum8Pl1k78+iAlYj5ijGIH9GfRIm4IrPKgFM/d2WRsglFT1u53+IhKoyb?=
 =?us-ascii?Q?sQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: db2c40ad-1131-4f9d-6c69-08ddbfbd31ab
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2025 14:22:26.2043 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HBfNDpBX+A25Z7k0k2zC0Ao6BCCxVvfJEeyHtCZhKQQGj9LrQs7/UN+X8Fq2wNQiKygfVSsbhsJGOPeGIkDyPA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5228
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

On Thu, Jul 03, 2025 at 07:41:05PM +0200, Andi Shyti wrote:
> Hi Rodrigo,
> 
> On Wed, Jul 02, 2025 at 05:52:09PM -0400, Rodrigo Vivi wrote:
> > On Wed, Jul 02, 2025 at 07:18:50PM +0200, Andi Shyti wrote:
> > > > Heikki Krogerus (3):
> > > >   i2c: designware: Use polling by default when there is no irq resource
> > > >   i2c: designware: Add quirk for Intel Xe
> > > 
> > > I think you could have kept Jarkko's ack here. Up to you.
> > > 
> > > Anyone against me taking the two above already?
> > 
> > I was thinking about keeping Jarkko's ack and get all merged at
> > once in drm-xe-next.
> 
> fine with me.

pushed to drm-xe-next

I fixed the SPDX header and the tags while pushing it

thank you all!

> 
> Andi
