Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7607CCD183
	for <intel-xe@archiver.kernel.org>; Thu, 16 Oct 2025 06:52:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6F1010E165;
	Thu, 16 Oct 2025 06:52:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gpLuoAz/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8745710E165
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Oct 2025 06:52:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760597548; x=1792133548;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=dMkqzsCDREX6zu65fxLJOZXExXWKmmrPypeeK7j8sY8=;
 b=gpLuoAz/V7uK1Fvig4TrgN/kqC+kH/vQfXmIkdTTLf+qV3XkIJuNrwIZ
 SEQE0b/uW4i/qgvgQ2UlBKXAkPhVrkhxxf7ea1P7wvJdGFU/sVmCljcMY
 ZtUQBh7D7IuXCMr7+9GJlRYAKB7YcQKIPAWDLZGq9n8vkVZBwBRMnN6pD
 YBUjmzqRntsNSDpGjLy1PbR0l4M1Y1ufc4ltbLlNPzkYDSf2YQ3MUSUPX
 uq48gFgJk9slrR1YTDpIjYSwztVC0ZDlsigGzF+a/WhKBN3ld67arPwe6
 1mV+jwGiFumdAwD2Qj+jQ6tOeicVtD6V3SfbBdZgJ2RESlo+WgD1Im+3J A==;
X-CSE-ConnectionGUID: zVd9iac/RWmeQWzyouPPcw==
X-CSE-MsgGUID: benMo7ZQTSS4f6T2dmJIQQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11583"; a="62492269"
X-IronPort-AV: E=Sophos;i="6.19,233,1754982000"; d="scan'208";a="62492269"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2025 23:52:28 -0700
X-CSE-ConnectionGUID: Qs8Xi7GVTra0uK0jfrbVqQ==
X-CSE-MsgGUID: YB7XXs8PSRmlMk1/GYPgNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,233,1754982000"; d="scan'208";a="213333155"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2025 23:52:28 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 15 Oct 2025 23:52:27 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 15 Oct 2025 23:52:27 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.44) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 15 Oct 2025 23:52:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YL8KRRy3/hd2EX4Q93DvXd7/7A3Jh3NGTrGMikx+wEbPj+8FYNecHeqkMFbrRaSGS+CkBXaWLy/9yRhJliznIJVaj1sguzb+GeX0BHagWg9GulizQW+YEjRnXAvIRaePtD8KYvysgJqBc+KVJ7rzd8hTisgLlDlAzA1vzZB5fZISI4b32eP8IkK4R9bMFu9gsXhQqHYIihLK6EJTnEotESdMaTIxHQtXMHwVkn7cEhBlYgKLx+7UxZJ/wBmpmxBQ2uKIOVQfrThwLWnobSSRuzmXP2WIKw0D7PNvX7tcbR1NsfTiyXPc0jZYm9ZdWSRfCWB/63DygFo53+d6uwLYjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XAsPPG1W+e7ME3RSexxwr6+GUcDEhU829Ghv/MFuNo4=;
 b=tuzdGmFXugqQ4YVOQWY+z0RODmRxO5jbCnW31eMaTTHafVsoepffBjXtEkVhVLUEmuWP09GkZtLbVKtC/blwJDMLbl0kMmc2Js5OmrNheSChTkksWcPPvH3IwoAukUczuA1hfE2WLmhyZb3MZjsur8Bz4LQnK8rgfeyweyg02ZRCjGRfwHwCsEDNDfFreBYzpY7sSJ82VUxMakImIQbg3oo6W00su32EscNN2MVpLbclsTe9xOkAj9mCx72q4r5SSZ3MGj0YUw17r/gIhSK2rJHgZjx3HdFSrSVpcJXcO++PEu275Jbk9SP7eS3gpXqTz8RA3unZjMOxaEmT2u2CoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6105.namprd11.prod.outlook.com (2603:10b6:a03:48c::21)
 by CO1PR11MB4996.namprd11.prod.outlook.com (2603:10b6:303:90::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.12; Thu, 16 Oct
 2025 06:52:20 +0000
Received: from SJ1PR11MB6105.namprd11.prod.outlook.com
 ([fe80::7edc:d129:cb8f:6343]) by SJ1PR11MB6105.namprd11.prod.outlook.com
 ([fe80::7edc:d129:cb8f:6343%4]) with mapi id 15.20.9228.009; Thu, 16 Oct 2025
 06:52:20 +0000
From: "Muqthyar Ahmed, Syed Abdul" <syed.abdul.muqthyar.ahmed@intel.com>
To: "De Marchi, Lucas" <lucas.demarchi@intel.com>, "Roper, Matthew D"
 <matthew.d.roper@intel.com>, "Lahtinen, Joonas" <joonas.lahtinen@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Chauhan, Shekhar" <shekhar.chauhan@intel.com>, "Vivekanandan, Balasubramani"
 <balasubramani.vivekanandan@intel.com>, "Upadhyay, Tejas"
 <tejas.upadhyay@intel.com>, "Ghimiray, Himal Prasad"
 <himal.prasad.ghimiray@intel.com>
Subject: RE: [PATCH v2 19/22] drm/xe/xe3p_xpc: Add support for compute walker
 for non-MSIx
Thread-Topic: [PATCH v2 19/22] drm/xe/xe3p_xpc: Add support for compute walker
 for non-MSIx
Thread-Index: AQHcPiAWenVFXwhnfECIysR2BTa5f7TD5YcAgABa9oCAABTswA==
Date: Thu, 16 Oct 2025 06:52:20 +0000
Message-ID: <SJ1PR11MB6105ACD99635C212C80B80A5EEE9A@SJ1PR11MB6105.namprd11.prod.outlook.com>
References: <20251015-xe3p-v2-0-b9189b3056a2@intel.com>
 <20251015-xe3p-v2-19-b9189b3056a2@intel.com>
 <20251016000742.GM5409@mdroper-desk1.amr.corp.intel.com>
 <2c4yb7mcc5r2nbnnb2ncg2kmjhl2vp62da5u3gafh7lz7uudyk@nkeqesrnpbqy>
In-Reply-To: <2c4yb7mcc5r2nbnnb2ncg2kmjhl2vp62da5u3gafh7lz7uudyk@nkeqesrnpbqy>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6105:EE_|CO1PR11MB4996:EE_
x-ms-office365-filtering-correlation-id: de50a9c4-bac4-4b9b-22fa-08de0c808d70
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|38070700021|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?K/80exqxEDxUlH256jONS58NEegI3/PAjAxWTAYMNlFaCShGP7HW/0HBy/YA?=
 =?us-ascii?Q?v+nBpp0G1MEl5fI660uIOYOoMrdp8ZFKnmLgLG7IgQlkCUw2tMnFv9BV/SZJ?=
 =?us-ascii?Q?HO6Uy+rIsS20fdEf5bxV/SpCqtgUFji+8l5lLiNFuZq7Bjfwn9CGEGOnREfS?=
 =?us-ascii?Q?IIgW4Q9QpV8T0ajtvZ0Tu4LPcVCuOLi7wWLRe+hCxfD40HJ342moQ3/MuSz8?=
 =?us-ascii?Q?keTp/F+sgzK67oUgR5LE/wVdrszeAyWVWPRWFT1iUwlgoZ67ckuPawQQUW1+?=
 =?us-ascii?Q?bGxT+jTow2XBpjIrYsaxi8CrIXilFAcNKjKsvADiONGwPeehc4cwOpCOdWTQ?=
 =?us-ascii?Q?eOgBQWmJFzCEQ+qAuErLn/LQ92Hau5jrekpcXwNhuiqHBa+PaZMXqJWWHXU0?=
 =?us-ascii?Q?/Lufd/q3Q53VWZcCkhWukB53mrKm0AKuiCKrR3uT5houX6D0maC8xZrR3Eqi?=
 =?us-ascii?Q?y1UOdG5/6KqgDrAL1SnF1f2UII6kh3RrRr6SbxgYWiyg7qofZ5Twyl17gG9V?=
 =?us-ascii?Q?ETRHLq3w7Nv42C14eGa29nxARe+8viBwrfLw3L/UOp5FkPW2mgot2vU466FH?=
 =?us-ascii?Q?CNdIpicPCU9kFTw+N3es8jqOI7oshk58k968TaFATtvk57svuskOpWGbiLpA?=
 =?us-ascii?Q?ai6LQNeBCUpTQLIiR1RDLMDZVq2zJ3EhMIzSZFRClY9BKS+5uJl0xRoriy8V?=
 =?us-ascii?Q?EFPpqq+/78hUDcM8pgg4e76YE3ul+k2PrZxME337CPxZxFv8HIqTglyyV9XU?=
 =?us-ascii?Q?2TwhjvFVseAgLg31T9RGFmWFLpwP1GLgyQw/u33STkN9S1IjXJiiQ3Q9xjmv?=
 =?us-ascii?Q?SUNFqjwoEXBBlJkNJjDurtyRfzAqlhRNdOpy0nvmOapET7YWE0g3FkRlagiU?=
 =?us-ascii?Q?iiuf9bNd3s04uEY3mL1R86vDq/i2X2VKl+tPUIdr3rwhH5uj7tQ8cFZyoNOb?=
 =?us-ascii?Q?IKYmwNSiq3FC5ikvhvQMnAgoyC3nKSiW6YKEaNehVAiW14/zBVdz1oA8nquB?=
 =?us-ascii?Q?lnGXFL6nqbNoBik66KANxHkDEuovsNvqy0hUeRuBIT4DdbGShSHFPHs7pFfa?=
 =?us-ascii?Q?785iUhZ4ylryXlT1Pu7NyOSRqkHipTld3j/36TJiDX2aVw1rzMwXCzcEUOWz?=
 =?us-ascii?Q?D720Q9sTBfBe8Xoznmymb7hFyvvqXny7pVhtdDZ0ZULQfdKumA2vXIbU/jOJ?=
 =?us-ascii?Q?nD0Ql0W9vBVSDdqkwFne+9T699oBkZe5sDKgrwad1ueHrYMrTGlRn6Bs/vcv?=
 =?us-ascii?Q?CceDd9vCqcFK73HC8Upo409BhUmdApTxl2ONnbV+Uglk6dgjLTrlrIRaLmBQ?=
 =?us-ascii?Q?258Q/RelQWFmIDhsZowwK1nkhv5kxusns5dv/jCNOyksJbiVymeKKetGwZMF?=
 =?us-ascii?Q?mchtKVKctQ8X0HynXvOcEi/i+c+yDgX+tvt5kqrGNxnAF8Vdh8U1Hag5KZEk?=
 =?us-ascii?Q?rA1Fbcfra5sTiCJMOEBEGV7jMZyyLiZc+d8K/rJPSekUMGCdlOvm/mbha1d+?=
 =?us-ascii?Q?ZEK2lA5W3KUi3X1G3zb2h+lUN39KfDUP0bD0?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6105.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700021)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?wFd9O1pFSUYdM3SomDc5PYetoE0uVCIlQVJ8NQSI8wuHOSptw9ESj3fLOQ9t?=
 =?us-ascii?Q?20A7M3pvv5o1o9oKsLOOv6vDx1S9GmIbPVDuQB4/pQEzAMlsIbW9N64+C4Lf?=
 =?us-ascii?Q?hZN27z4HhGpGJRjjgydy9v9kwB29mv6ZG611nh6cOPchwKfG5+dYyDNsP9hH?=
 =?us-ascii?Q?RSOIISmdrmFfoDlhaUZuP6fx4/avUeZKkY95dXZhXEiDQVsSs6Sh9xf9XGjv?=
 =?us-ascii?Q?3YVIMweJS0S41iLDvi+VnDwv1beudqLUAZS1gMAql8qPmRsmiGya89ePBY+E?=
 =?us-ascii?Q?oHNdqbZUE3dp6AUgKqqCrWt4Yq+m9ePNoMCfnfSg9lKXPFcV+ZkwS3L66CTd?=
 =?us-ascii?Q?6cNyjIhnjyZlVbitLMVGld2V5V434it36WYJEjdgU1Fe/yR1RZrnqr7IcnqV?=
 =?us-ascii?Q?Wds/xC+cGCYo/apHv7i19hVaOl53Ej74P44HVCVn4I8MmV7hyQ1Mv9i60Eyf?=
 =?us-ascii?Q?0LkSSlxzVfxdsBGqypP1ueoi+lcl8KcWYBRFkfHqUbjAUtRRaikdV2inmKb4?=
 =?us-ascii?Q?lMIlL6BDEA+WdeGvRZFM70OTKEYP/0G4QfJwPjVq15+61g7X8ERC8xTIgCfH?=
 =?us-ascii?Q?1whepQP25V2/j/g06BL6YR/dRyveYpT7490JH2Cg7FlW3zjiM8yDZ6xC0kf6?=
 =?us-ascii?Q?F0gBlaV8cXh7Pm4PsnwiqiReYiHv+HndNef0Bu/3/w7l+poIDLnVv85ZA1JU?=
 =?us-ascii?Q?ADKgW8+aMyW2GQeb4kSrJyVPlA2BUIKkP5WK8jPXTz4HUre1KI5nHqMw5ajc?=
 =?us-ascii?Q?mnu5fNeNpukN+4EgUHU+0bFVHjPMKqQMNzp6LRz5sAWOzN82NhpEMeyb4HrK?=
 =?us-ascii?Q?ddRAlQGMDUKcE0qww/N8YpJR5uw4H0/sXrxXM62qYrHcGJnYpUvwBv4HhEZF?=
 =?us-ascii?Q?9mCqKPoFb1BGC77OESL/gaD7e+Bo5cNJcTUSS5EyVH9a3hp8ASCvGFUVv2yF?=
 =?us-ascii?Q?YnL84+k4oP+0ytfl++dIszjGdC2+iQWcIufH7MTVMEv96Fgn6EpCRlMfcRS+?=
 =?us-ascii?Q?cRFj6kOkuQeLlXiRA1aLof/QtoT0RUZ6XGEcM770YoT9VTWlNQShBYU2LLxM?=
 =?us-ascii?Q?oIAKxxmYaRaWdKnAM+9EjwOcBrhikTz1IPGBuorvdgKIxbnOTll4lmuJMWae?=
 =?us-ascii?Q?+J7R6meMJm0yoBWKP7FBhz/MtQhBmCDrcXYY4GVztpL9dwDGqd3SQElPn+9t?=
 =?us-ascii?Q?cj33TuqrHteZv03vZconWySC1Np1pgeoCCeGnGAoUgYmmAC+kr/pWg0P37vp?=
 =?us-ascii?Q?jikR1/oBimMr3KdGVJtMnBs7D8WJsSAScCHkeBKFeJfOoHlP0FIQmoX0f4qo?=
 =?us-ascii?Q?0+YSRuUV+LJZhT1hjTBvDEJrmeycg1/77JFbzFCX63p5r9++kLK3XlNo84nr?=
 =?us-ascii?Q?UUmtWMczl1D/JEyT7/coxvXe+Kq+E+uzKYyb0mazCKNjmILHlN8kE5yUK332?=
 =?us-ascii?Q?CBdJwORyAPi6g1wVpF7OZ82fJuNdMKMzGXBF3whTCj4655Hdyy6J6bciVpcJ?=
 =?us-ascii?Q?+j1tNGA/xyGbsQk1gSsX71MpxQHnDVqgcC7njILZ4yUKMeKnQx3+X71t8hcJ?=
 =?us-ascii?Q?ZWt6zVL/QP5BpPDj6h0zCHlXRmLdbOW0jueMju9T0IyuwZO5NsRDwws81GIe?=
 =?us-ascii?Q?5g=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6105.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: de50a9c4-bac4-4b9b-22fa-08de0c808d70
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Oct 2025 06:52:20.0388 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BIM1mHuZXdNtHJh5XzhVg1wDdqQI0uHoSOaNjYrqplDUpZ7oTJD5ghi9vMeHOE2eRbZD42f2I/n6oZuKEEVnAb1TO4rYxqgSRZ+2swglYMSGc+dfIn3nm46+aL/4BFA/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4996
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
> From: De Marchi, Lucas <lucas.demarchi@intel.com>
> Sent: Thursday, October 16, 2025 11:03 AM
> To: Roper, Matthew D <matthew.d.roper@intel.com>
> Cc: intel-xe@lists.freedesktop.org; Chauhan, Shekhar
> <shekhar.chauhan@intel.com>; Vivekanandan, Balasubramani
> <balasubramani.vivekanandan@intel.com>; Upadhyay, Tejas
> <tejas.upadhyay@intel.com>; Ghimiray, Himal Prasad
> <himal.prasad.ghimiray@intel.com>; Muqthyar Ahmed, Syed Abdul
> <syed.abdul.muqthyar.ahmed@intel.com>
> Subject: Re: [PATCH v2 19/22] drm/xe/xe3p_xpc: Add support for compute
> walker for non-MSIx
>=20
> On Wed, Oct 15, 2025 at 05:07:42PM -0700, Matt Roper wrote:
> >On Wed, Oct 15, 2025 at 03:06:34PM -0700, Lucas De Marchi wrote:
> >> Current implementation of compute walker has dependency on GPU/SW
> >> Stack which requires SW/UMD to wait for event from KMD to indicate
> >> PIPE_CONTROL interrupt was done. This created latency on SW stack.
> >>
> >> This feature adds support to generate completion interrupt from GPGPU
> >> walker which does not support MSIx and avoid software using Pipe
> >> control drain/idle latency.
> >>
> >> Suggested-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> >> Signed-off-by: S A Muqthyar Ahmed
> >> <syed.abdul.muqthyar.ahmed@intel.com>
> >> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> >> ---
> >> v2: Rebase on split mask per engine class
> >> ---
> >>  drivers/gpu/drm/xe/regs/xe_irq_regs.h | 1 +
> >>  drivers/gpu/drm/xe/xe_irq.c           | 6 ++++++
> >>  2 files changed, 7 insertions(+)
> >>
> >> diff --git a/drivers/gpu/drm/xe/regs/xe_irq_regs.h
> >> b/drivers/gpu/drm/xe/regs/xe_irq_regs.h
> >> index 7c2a3a1401424..9c46b5fb81412 100644
> >> --- a/drivers/gpu/drm/xe/regs/xe_irq_regs.h
> >> +++ b/drivers/gpu/drm/xe/regs/xe_irq_regs.h
> >> @@ -82,6 +82,7 @@
> >>  #define   GSC_ER_COMPLETE			REG_BIT(5)
> >>  #define   GT_RENDER_PIPECTL_NOTIFY_INTERRUPT	REG_BIT(4)
> >>  #define   GT_CS_MASTER_ERROR_INTERRUPT		REG_BIT(3)
> >> +#define   GT_COMPUTE_WALKER_INTERRUPT		REG_BIT(2)
> >>  #define   GT_RENDER_USER_INTERRUPT		REG_BIT(0)
> >>
> >>  /* irqs for OTHER_KCR_INSTANCE */
> >> diff --git a/drivers/gpu/drm/xe/xe_irq.c
> >> b/drivers/gpu/drm/xe/xe_irq.c index 103804546b280..ac5524cbe4b9a
> >> 100644
> >> --- a/drivers/gpu/drm/xe/xe_irq.c
> >> +++ b/drivers/gpu/drm/xe/xe_irq.c
> >> @@ -149,6 +149,12 @@ void xe_irq_enable_hwe(struct xe_gt *gt)
> >>  	if (xe_device_uc_enabled(xe)) {
> >>  		common_mask =3D GT_RENDER_USER_INTERRUPT |
> >>  			      GT_RENDER_PIPECTL_NOTIFY_INTERRUPT;
> >> +
> >> +		/* Enable Compute Walker Interrupt for non-MSIX platforms
> */
> >> +		if (GRAPHICS_VERx100(xe) >=3D 3511 &&
> !xe_device_has_msix(xe)) {
> >> +			rcs_mask |=3D GT_COMPUTE_WALKER_INTERRUPT;
> >> +			ccs_mask |=3D GT_COMPUTE_WALKER_INTERRUPT;
> >> +		}
> >
> >It probably doesn't matter since our execlist support isn't functional
> >and we only really support GuC-based submission, but technically
> >shouldn't this be outside the 'uc_enabled' check so that we'd also get
> >these interrupts if we tried to use execlist submission?
> >
> >BTW, is there more support for this coming in future patches?  Without
> >MSI-X, what's the mechanism by which userspace finds out this interrupt
> >has fired?  We're unmasking/enabling the interrupt here, but I don't
> >see how anything happens once the interrupts start showing up.
>=20
> Himal / Syed: any detail missing here?
>=20
> Yes, AFAIU we are still missing the change in the irq handler to get the
> notification and the mechanism on exec queue creation for registration.
>=20

For exec queue creation control can only be supported on  platform supporti=
ng MSIX .=20
This is for non-MSIX/MSI.=20
For this irq handler just need to wake up waiting kernel or user thread and=
 that is happening for all irq lines in handler so nothing special need to =
be handled.

> Lucas De Marchi
> >
> >
> >Matt
> >
> >>  	} else {
> >>  		common_mask =3D GT_RENDER_USER_INTERRUPT |
> >>  			      GT_CS_MASTER_ERROR_INTERRUPT |
> >>
> >> --
> >> 2.51.0
> >>
> >
> >--
> >Matt Roper
> >Graphics Software Engineer
> >Linux GPU Platform Enablement
> >Intel Corporation
