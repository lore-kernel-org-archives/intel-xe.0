Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0FA6C4345F
	for <intel-xe@archiver.kernel.org>; Fri,  3 May 2024 09:29:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AB2E10ECE9;
	Fri,  3 May 2024 09:29:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CNNy7ipF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BED1C10E220
 for <intel-xe@lists.freedesktop.org>; Fri,  3 May 2024 09:29:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714728546; x=1746264546;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=QrPYyj1n196wQxzQ6RhrgXWtJ+tIvexriNQfHX/nbFE=;
 b=CNNy7ipFoE6VvjKCrUusR1nCCCoeS2ExbBlueEVVCPCJiIYiYcpER/qF
 iEVC2RDc1dVxSGX2BBrPXgzC1DceZKJdneJ75KQSKhy+iNvHu1sy4AKcf
 P2lxbsF8DF+VyLZD3PRzhPS4x4shnjvYkVMmulv8C7Cpy3nmuhdHAwsV7
 IJjSiCCVAkVfI8v96xi1XqF2poHMpJSojVC5NGc9J26E9yBotjiEkxOi4
 /Zsx6Jqywoi/MuJK1zheaDvla5deUcS+oR72fYJ2SrwD/bHbaJ+cLAqiQ
 vYpaXOPNfzvTph7rwHlwaRZUtly2g98R33Wrdi0Zoqj5K/jI3EPUj4DDU Q==;
X-CSE-ConnectionGUID: iYgN70AhSXmSnWb/MUD7rg==
X-CSE-MsgGUID: QptZt74pSw234IuvrCtt7w==
X-IronPort-AV: E=McAfee;i="6600,9927,11062"; a="10357892"
X-IronPort-AV: E=Sophos;i="6.07,251,1708416000"; d="scan'208";a="10357892"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2024 02:29:06 -0700
X-CSE-ConnectionGUID: MvVaW6A6QqaNrMMr0r8DNw==
X-CSE-MsgGUID: 6qbUstTXQxOXqUq9X18lCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,251,1708416000"; d="scan'208";a="27431320"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 May 2024 02:29:05 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 3 May 2024 02:29:05 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 3 May 2024 02:29:05 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 3 May 2024 02:29:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iZWbAX0mYQJ7pWLe7DfxYBm5sgKoYMp1xcisxcMesu1CxbVEcsCpve4pqKsMZM2L0HlaP+lsrT19gc6qMZ8bm7lRVsI8j1SrFXo56ZjeEmB/yjmk3at33xCzlmJwqZaY2HkKt3ZjmwxCsPL68OrfJC4KbDU14B+8OlIGgm7Enu7/09+C0WfQvae/fC6MAY4WG81JDn8qYINj1qXJbLl7BSCWvqCCdqix9DJEEqxiQy8tyvgLWb2+7qlSwlhIeRKSPy0k8tqdglelOJfXho3+JcNsv4iSkuZB6RDYHG++T93AKsUX446nxsPemTTmSLRncs14by/RoH05wfXiQdNZsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VJIz7GafMmv79vW68dvodVrxg7EMILRifTkXBdQ4DOE=;
 b=Ux4QDH1Xqu28TUcuk6HIE4cvH9y9EJ4wL0dHykcPSMgBBTf+Te8E9XZVGnnHccnvi3PH7gHb1PqLFl6VzTac0X3wKAHsSbsmiFHQZhHgB3RtA+lOhxJmfSXsetUiDDR5gU6reRaY05Z1zbXzlkDp2sC3gVvmjkffE+xjeTGem9hRTbWzVRHYeuwXembmM0+VyHJ78GHkz4iWpjMsG/GGje70k4th8p2UkI7bg0VAD6j8XHWT/6SgY3Oj0uJB9IHDN/DLjR5ABhuBxQYaIBQzLtDmxis+0x96Df1TEkHj+QYbUKfRCizM2bAZ6b3OyHwyxo/XCgyw2ETZ2pjIFbbISg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL1PR11MB5286.namprd11.prod.outlook.com (2603:10b6:208:312::16)
 by SJ2PR11MB8372.namprd11.prod.outlook.com (2603:10b6:a03:539::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.34; Fri, 3 May
 2024 09:29:02 +0000
Received: from BL1PR11MB5286.namprd11.prod.outlook.com
 ([fe80::2d44:534d:f79f:2f36]) by BL1PR11MB5286.namprd11.prod.outlook.com
 ([fe80::2d44:534d:f79f:2f36%2]) with mapi id 15.20.7544.029; Fri, 3 May 2024
 09:29:02 +0000
From: "Bommu, Krishnaiah" <krishnaiah.bommu@intel.com>
To: "De Marchi, Lucas" <lucas.demarchi@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Upadhyay, Tejas" <tejas.upadhyay@intel.com>, "Roper, Matthew D"
 <matthew.d.roper@intel.com>, "Ghimiray, Himal Prasad"
 <himal.prasad.ghimiray@intel.com>
Subject: RE: [PATCH v2] drm/xe/xe2: Add workaround 14021402888
Thread-Topic: [PATCH v2] drm/xe/xe2: Add workaround 14021402888
Thread-Index: AQHakYHD90rmQhWMLE6gUSpoRXGOLLGA9j+AgARfPGA=
Date: Fri, 3 May 2024 09:29:02 +0000
Message-ID: <BL1PR11MB52861C0BCDD83792A18897F89D1F2@BL1PR11MB5286.namprd11.prod.outlook.com>
References: <20240418111534.481568-1-krishnaiah.bommu@intel.com>
 <4hwfcik2ipstr3ubip4f7irmotsqnnsqcjscnwsnt5zj3kfrps@nprslxk6piam>
In-Reply-To: <4hwfcik2ipstr3ubip4f7irmotsqnnsqcjscnwsnt5zj3kfrps@nprslxk6piam>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR11MB5286:EE_|SJ2PR11MB8372:EE_
x-ms-office365-filtering-correlation-id: b17c2b28-9948-4cf7-2cc3-08dc6b537852
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230031|366007|376005|1800799015|38070700009;
x-microsoft-antispam-message-info: =?us-ascii?Q?zEU2g7E6MvbSyXfYFnfzSQKuWtHj1jcohXV2bJcgF3CPyr3Q3QW3/mx4ic7g?=
 =?us-ascii?Q?kAY0v+0UDUNjj0Epa9ahDRj62P7eKb6Ufm/fcl/MQqpNGuVRFpaZB3KeeNIm?=
 =?us-ascii?Q?/+6yBvLs7ZQWdkjThgaJmHdKjZNi5koShkkTdF0gmGIf3fMkD5W4Bs6yYNHI?=
 =?us-ascii?Q?4Mn6UnHvDfMDPum2xtWDQL14GY8kbLi/3eUZY5jCvpwo195XWVWw67ngisYz?=
 =?us-ascii?Q?+1Tvdn44Kk+fvL9X56NI+mYHB0latFTvo4cFHBSIQ4u5Xy0WLxQfJ/0jWWId?=
 =?us-ascii?Q?6fFwccCKKPnZNos97fYL5W7pgzNbq1S4FMqoYH65rLlXW6B0S894N3LO7ZVt?=
 =?us-ascii?Q?gDBJ5cNhkCABWM7Okk35B27PU2ZiHBknlpC/BgmuOPbma8N915pw0rnTVcyS?=
 =?us-ascii?Q?Q/VvYSRrMs3unAvrde6IuKf7412/c6SbRSR7LL9CXIG8Qt2TgxVpi4lg2v0S?=
 =?us-ascii?Q?I9UWzuqP3SLWqzuaeQS43Qnebz8+ni3VhKK3/WcDvQz/os6X0KuPSHiyeEic?=
 =?us-ascii?Q?uLO+zyLKh6cXXexYrMuSmQ/GARJ/Tnx5kSTDvxdmwv+Aq6pcItXYlOzMvfBF?=
 =?us-ascii?Q?p98NednHNnbaYfc3sO50U5lX3FozYy6fJzXZzImzmR9i+CbokadcxHSXtM8a?=
 =?us-ascii?Q?kvxy4JENlF5Vf+L7RCtjXNUUouHePtLdUe4JTlsBeHs26trevLvFVYfuMsuE?=
 =?us-ascii?Q?g83h12a+K+oSni8HfCBtUphhvnPZEJyKD5OwQ44hWU+kg21SQnjsKjs+zWMX?=
 =?us-ascii?Q?JnTyn3B7H6nQJ+W6YC75NxIMSM2Bj+SyX4ZC9qjSK7gzCyTI85FO6/c61V1o?=
 =?us-ascii?Q?BCExXi+bzGpep04dhJLoYvjkSjx5DpEBf5vMvOudDVMKqttFF2GUlSQbWHFP?=
 =?us-ascii?Q?ODLE7QtHwj2cjm7knoEE89iRPSYfkP6H3OLgGevHIJTsF9ldCS+n1cbjtqM/?=
 =?us-ascii?Q?l3wmPhxUvUrn7i78MSIPXj6ForHwET4vVj6gB/mrPyigXbfng1PzkY5bgV3k?=
 =?us-ascii?Q?r6CZpjXhZCBzxbxUJbelf/3w49IP2tUuh+0wJHa4J19DQOFau/Z0B4DvBJl6?=
 =?us-ascii?Q?jRZqhGKGdfBzSa2Yk2/5st8GnXapSDMUjjaNRN/10Oeh1D3YMXiF9dnJJxb8?=
 =?us-ascii?Q?0FSNgqEyvX9WdF3hcbQGSNOJEzznNILXjTeBGHKFqZuqjrfy9xoEi6lPI/Kd?=
 =?us-ascii?Q?VA2UGEIok+K+TaD2yJnhuSfj+jDF4GgM6z3mlZ0dmlMwTZQ7+pRhLaOOWKMw?=
 =?us-ascii?Q?JKaAf2LgVWH5oxcrTLN/LepZ6LU1nO24cusioprFcdOf/vUzkHfxyEzLoss4?=
 =?us-ascii?Q?KfPOaqUbXLq9kHZcgxRTtdQKH5Zw4Y7k0ukQgIM++QN/hw=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5286.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?hKi/czY7h04eR7tF70UD/twsGj6kWNOo8H8n3RABXEnyqIKK9dUyjIpQv5Pd?=
 =?us-ascii?Q?ZnCVAbXPZ4WCvBZq5OWnkgrMYsXHFDDvQ8G5HozPgWhPYQbwCafv45/c3pRF?=
 =?us-ascii?Q?vZUB0xRkE4S9nlIUTrY2vInqpkHBvsJFZ+RVhYy9CdjkFkUy77BDVX1pRd68?=
 =?us-ascii?Q?qgCvjqDkCbTRPKHqq6/h++9a+A2kPjhV/6/0sU440zLAlkaAw9WrZgUn11F3?=
 =?us-ascii?Q?HYkgDXYKvHGUULUL0kddMcgcuOZ7Cce4jQJvCuAlWOIFBzHf2gJ4ReZLc2dL?=
 =?us-ascii?Q?T7SGaljeB839Ad+Mdd9Ym7ZQrbA5cmM70G97YT/wxakrPhUvEkErF+zl3eFk?=
 =?us-ascii?Q?Cw4jPB2KEzE01OhgpGBRrtT0MjpZ4Ijb/tU+L/9Rq86CLzTMCiXGuHMOlCpr?=
 =?us-ascii?Q?wLIugbYJpPjbieOjgEjQKtb9Qg9LMx8dhRev8VUlH5cMLSjG5HhF6uv77jlF?=
 =?us-ascii?Q?QOdcEV4P28ulokuGD3tgbMU/LCVm1h3h1tTlG6BN6An3/EhGbdRzUM/HPaMF?=
 =?us-ascii?Q?gmUJG/T2kqvGvWkisx5AFiZRpEjxW+UCsev4ZUFUHace70Lct9kM96pFKc8b?=
 =?us-ascii?Q?aeunBM/LdsH/kwmD+WozPzN739exQ5/n4QY82Cv57/I/BetxUmXH6bZ2Om/H?=
 =?us-ascii?Q?Ddq2QCvLiWdcc4vm8EoyJXMBeqkxzf8CO/lSR4d0isjJJ2qrsO3jmS5bcIfV?=
 =?us-ascii?Q?h6cHOQTPhGZ4m4z+H61X9UqqOvuvbVrmgsHXcf2XdLZNoMZEOxYKzgULBm2E?=
 =?us-ascii?Q?yuowsCd5kpPeWu8hdn5CthN7jvLuXNiTOd3IJ/iT8QAfobrJH+QQt9I6noAt?=
 =?us-ascii?Q?ACiLjcHUGvD6DXd+Omg4YZBn/3sCBFOoLaueiFC36ywY8EeLPaaazs02XT9N?=
 =?us-ascii?Q?5vzvfNRgmAe6HXzgLE+5gWg+BHF7bFAVxtFeSLAqy725X763M6kua139LaTE?=
 =?us-ascii?Q?UZL19b1F5i4ZgyluWwc1gIqJthU21Seny0vK87ODThcjgPli9hZkLzC57f2f?=
 =?us-ascii?Q?e1UaD5Ksx11a2cyTpazRu2R2naARHOWLmbiV37Ybk44MFQ9tkRAfCUueJGxb?=
 =?us-ascii?Q?ByIzuMX0jgPHZ8YF+oUC8WjMcXtDpTLboct0Fan1EdFOxA7DHDrJwBhCmzYZ?=
 =?us-ascii?Q?ZzgOPNfDCHksBKgEvBNX4DxoGj9zqK5/aqVf9AG1f+4670hwv12PkIbNTR8M?=
 =?us-ascii?Q?V/zh+lOSVCETHw814TSXky5m+dDZVeI7IAVWRnK+hfB/21MJ8Ie3mkLoGpA9?=
 =?us-ascii?Q?uLGmE9xsI0SX8PGvhpTL26Aq6Awz76Uj30SCpLebW5174eLtiQ2REEtmwb0S?=
 =?us-ascii?Q?JaBztxRIVYGcfR0WGpx37G/XphG09BuHtoAdP9Lhqjrjo4M9UJmTs+fncsj9?=
 =?us-ascii?Q?wRMPyMkOmZlfNz6MWG5j6hEy+nhLCqeE1jGWmvg9dfn3rdEZS70DNn735PRz?=
 =?us-ascii?Q?xCz0oc8uUqn75bEjxAUIzj8iTXNwoKuU+/ibKUSNlwPtZBCNRe4p6A1W+Fnt?=
 =?us-ascii?Q?RWKHn6zwjJbwoK/M6gO8iDC+mdXsg7cIYSJSHsM89TIv7mXeVW5wnhftz4cQ?=
 =?us-ascii?Q?XzjYw6JYqVLS8ZIPpdrtqbYE/r2OMjU0aa8GBGJg?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5286.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b17c2b28-9948-4cf7-2cc3-08dc6b537852
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 May 2024 09:29:02.4645 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Aw5hKrKhp8YkV1vdCKjJK1UpYDPPI2vWxJjTI7Wwo7QrQA+6CVzZAiTnZlXRcMNFljAh1AzV1d7POTW+7ANEo2CcUfUBT2EG2xGZVzyQIX8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8372
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
> Sent: Tuesday, April 30, 2024 8:13 PM
> To: Bommu, Krishnaiah <krishnaiah.bommu@intel.com>
> Cc: intel-xe@lists.freedesktop.org; Upadhyay, Tejas
> <tejas.upadhyay@intel.com>; Roper, Matthew D
> <matthew.d.roper@intel.com>; Ghimiray, Himal Prasad
> <himal.prasad.ghimiray@intel.com>
> Subject: Re: [PATCH v2] drm/xe/xe2: Add workaround 14021402888
>=20
> On Thu, Apr 18, 2024 at 04:45:34PM GMT, Bommu Krishnaiah wrote:
> >This workaround applies to Graphics 20.01 as RCS engine workaround
> >
> >Signed-off-by: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
> >Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
> >Cc: Matt Roper <matthew.d.roper@intel.com>
> >Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> >---
> > drivers/gpu/drm/xe/regs/xe_gt_regs.h | 1 +
> > drivers/gpu/drm/xe/xe_wa.c           | 4 ++++
> > 2 files changed, 5 insertions(+)
> >
> >diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> >b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> >index 94445810ccc9..23c302af4cd5 100644
> >--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> >+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> >@@ -350,6 +350,7 @@
> >
> > #define HALF_SLICE_CHICKEN7
> 	XE_REG_MCR(0xe194, XE_REG_OPTION_MASKED)
> > #define   DG2_DISABLE_ROUND_ENABLE_ALLOW_FOR_SSLA	REG_BIT(15)
> >+#define   CLEAR_OPTIMIZATION_DISABLE			REG_BIT(6)
> >
> > #define CACHE_MODE_SS				XE_REG_MCR(0xe420,
> XE_REG_OPTION_MASKED)
> > #define   DISABLE_ECC				REG_BIT(5)
> >diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
> >index 632bd9066f8d..31e140968f4a 100644
> >--- a/drivers/gpu/drm/xe/xe_wa.c
> >+++ b/drivers/gpu/drm/xe/xe_wa.c
> >@@ -534,6 +534,10 @@ static const struct xe_rtp_entry_sr engine_was[] =
=3D {
> > 		       FUNC(xe_rtp_match_first_render_or_compute)),
> > 	  XE_RTP_ACTIONS(SET(LSC_CHICKEN_BIT_0,
> WR_REQ_CHAINING_DIS))
> > 	},
> >+	{ XE_RTP_NAME("14021402888"),
> >+	  XE_RTP_RULES(GRAPHICS_VERSION(2001), ENGINE_CLASS(RENDER)),
>=20
> we don't have BMG in CI so we have to be cautious on applying WAs. We had
> cases that we merged it just to realize the WA was not really working. Di=
d you
> check the WA is applying correctly?

I validated this changes on BMG before sending. Device boots properly and s=
ysfs node shows this wa applied too

Regards,
Krishna.
>=20
> Lucas De Marchi
>=20
> >+	  XE_RTP_ACTIONS(SET(HALF_SLICE_CHICKEN7,
> CLEAR_OPTIMIZATION_DISABLE))
> >+	},
> >
> > 	/* Xe2_HPM */
> >
> >--
> >2.25.1
> >
