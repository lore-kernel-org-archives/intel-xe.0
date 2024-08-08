Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0A8AC3DA4A
	for <intel-xe@archiver.kernel.org>; Thu,  8 Aug 2024 22:15:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5ECD910E826;
	Thu,  8 Aug 2024 22:15:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LRml2Zvl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9245D10E829
 for <intel-xe@lists.freedesktop.org>; Thu,  8 Aug 2024 22:15:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723155352; x=1754691352;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=bbBMqipJl4ibN6vLykuwVPNLrMUuyUmR7RfRPE/GbBs=;
 b=LRml2ZvljfVk9kr9ObsVVh6IF+fbPStAuS40en2zPyXJV5Yc3Ey7OcWB
 RB/3+DfiJHq8V6QBn/7dMdfTRBviDeo8NSF5zeBtLQoMUzjW9k6fzqYiy
 ++8v8A58SWd4Pi5k9NLdzvBSco3BDE+rnccKibOYgXt/sSgYBZPKzQmya
 t0W8Npy6yGxhbSCET3gvQtNb5zFRP+pHJ8Yz9Q33QSB8eo9cUUI7Yz0Ek
 fp/6Vw8i88iEaX2TBEJppT1AkHQxrYEo1JfdIgVBNDczgewE4lr+T90Az
 qcVm7utN2eM9XGTM0CR0TlJISzU0MIxKruyLjUSmlMpXC8yDs+G+3uoHd g==;
X-CSE-ConnectionGUID: QWAc1tBJSFSS0ijLf9rrVw==
X-CSE-MsgGUID: AUHQl8EpROyFo5R003EsBQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11158"; a="43827664"
X-IronPort-AV: E=Sophos;i="6.09,274,1716274800"; d="scan'208";a="43827664"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2024 15:15:51 -0700
X-CSE-ConnectionGUID: A4NSivy7Qvm1cQ2LAL4NUg==
X-CSE-MsgGUID: O1mKmxh0Qe+v81vjd/czgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,274,1716274800"; d="scan'208";a="57603810"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Aug 2024 15:15:51 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 8 Aug 2024 15:15:50 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 8 Aug 2024 15:15:50 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 8 Aug 2024 15:15:50 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.45) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 8 Aug 2024 15:15:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N5rpwYmf+ItxekqV1KHsJocpQdZChwZpN5xmwhf5n6fOmLakbKzAfBQXaOla6BdDz4qi9ffBxY8+3E7W7oB2GZQxEUirXzUCYGeGdGCXdkh9JS6wN1nOdY82UIed0VTfOAWWCQZlkRZoiumT1X+Ngyt+sHvFFccNMSqKJwD75MmqqolBUYjm681vBC9mSSmuVpiDY+so9lR7EF2hKNJJrweFOJyBCsvqTqPkuOUX/kzNv1Ze/WBT1Qv4M9wSZ15dZ1RKrStexF0F9zCysT24DFyjjYL6w96uQdeHnHZawwS5D1YX8ZqIS662R9yxePCAisSXbvRB0p7LDLScpgQmdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SxS948Ty/B4bDNvIGMxSDPtwmf7LOHskHTjm1mfIxFQ=;
 b=q5nShR+L+kz8w5d1kvqCO+fBGUzWhdiyKIb6kG1QxPapEZtpLV0DSnwkIT3dIw8iijLrLCHotmpeznsllNOjjZigJAa2LUdA6j4YjhDB/oCEqIpKk/Fyjb9LCJqaJ8quH1Y8ojvRdflObi2DlvqaZzJDPv15Dcaeq4Gbg6348bMVq0MEm29MLwcgySeO2P7WiyV7/p2EQ8AP7tbMdYOT1KL66GL+sOOieRY0xtvQWcIe6y9gpozu3h4c9wuHWQaxZOxvpAO2evUCLlRs1tn/gWK8e3Vhva3IUSNW+G3CpFjxyEb9ZvmBJ8fXlEJQ5tdCJQpgjQUsqG4O/JML3q1Bjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by LV8PR11MB8723.namprd11.prod.outlook.com (2603:10b6:408:1f8::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.26; Thu, 8 Aug
 2024 22:15:46 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%6]) with mapi id 15.20.7828.023; Thu, 8 Aug 2024
 22:15:46 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Nerlige Ramappa, Umesh" <umesh.nerlige.ramappa@intel.com>, "Souza, Jose"
 <jose.souza@intel.com>, "Landwerlin, Lionel G"
 <lionel.g.landwerlin@intel.com>, "Cavitt, Jonathan"
 <jonathan.cavitt@intel.com>
Subject: RE: [PATCH 8/8] drm/xe/oa: Allow only certain property changes from
 config ioctl
Thread-Topic: [PATCH 8/8] drm/xe/oa: Allow only certain property changes from
 config ioctl
Thread-Index: AQHa6bpKYzWu56fxVUm7tcTx3KvX5rId41/w
Date: Thu, 8 Aug 2024 22:15:46 +0000
Message-ID: <CH0PR11MB5444C7149251786144857BD8E5B92@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20240808174139.4027534-1-ashutosh.dixit@intel.com>
 <20240808174139.4027534-9-ashutosh.dixit@intel.com>
In-Reply-To: <20240808174139.4027534-9-ashutosh.dixit@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|LV8PR11MB8723:EE_
x-ms-office365-filtering-correlation-id: c85ada92-10af-4848-bca9-08dcb7f7a6d6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?0B0wIseOkVGzKWyKOC+QkF2IF/M+dzL9cye7r3d2Sa5txX/0k0UddURm5rsl?=
 =?us-ascii?Q?qkQvMtYP14zxQMLKnxHgSmGhYi5pHvW5IgYPCwk+FENPV7sZ7UvQF8YroLpe?=
 =?us-ascii?Q?yi02iRgPWj8PCMjWH3jV3AR2btEF0k4KvcnXxkPFPYV3PhZCBH0W+LtHBhWz?=
 =?us-ascii?Q?Pz7an1KT++3OTMJbYzZE9tK2nv7Kgsdfi66ifPUxFui2OXqTmv20L0iyHvIC?=
 =?us-ascii?Q?LZMrdlyG3dNz3YagxB5/zyrT9F2udUERVHtqKkvBoCiY9aEFJYEMhn8YjImJ?=
 =?us-ascii?Q?j4eToZ5tWoxHgwkKHnW9xA94QIxdC07/f76AhJMm0rtqTV8Vn0HKgHRCv9kv?=
 =?us-ascii?Q?cVmZ/wmPubxhRRWFA/gidXOePdnRN1JdfRM1jvKD9cOCPiKZoMfuhK/zGpck?=
 =?us-ascii?Q?y+3JUeGj1Dc3UdaNWWYo0PZ/Gc5BZZ3XJeyUp5PzxPOl9uFKLIX+ihLanmTq?=
 =?us-ascii?Q?RgDaxwEUWF9oVOwwcjtdUGS+NJ0MTuVTCpU0nUWAGAO9XdDT+vCmU9kgpJ27?=
 =?us-ascii?Q?tv1dWELHqRhdEmNBy1JyVgPVW0HJEZfIm1uv2shBGlTMI44S3pXlNZ/Uh1+M?=
 =?us-ascii?Q?nPNg8D1c7ru+VAfQhcb2khYCsAsPpRqNShxg426trrL2ijrTRVoWByDEZMQo?=
 =?us-ascii?Q?fWguvF5gGnkiyBxsFgUB17Sn5+9m5YvLaK2RDs7PEfhFsGEF5jrcRDwT/yue?=
 =?us-ascii?Q?+KgDRxRaitAq2xP5DLIUbTleEltCeFgWh3ytU+1TdUtqrlLfCMhWhr8jgi5n?=
 =?us-ascii?Q?M1yfJv+6+n18ZtUacT9fr+u7QX73pT1Ps0utENf0RtmkeYZRfYM7liTwsD7c?=
 =?us-ascii?Q?cDWy+FEKmPJDgLxRIzXPcWKfAXG5LenE+jkUrgedU+8JLR6jp3i/VGICHrMH?=
 =?us-ascii?Q?XG4s8N5ANSJjsPLuTnwbbgqglW7NgHd7rURXM5w3v851LgtSO51rcJoeX7BO?=
 =?us-ascii?Q?0LVRKAlDleXPLbUS8bP5Cr3D450XBD0QaTkmYdr6uN0r+Jfkr+2r2vuupU6l?=
 =?us-ascii?Q?A/W65Cu1el3lgym71NazcjYmrbg3KCVLLA05iwoUfMc9WEJ/kPUvo+92kuGI?=
 =?us-ascii?Q?gJ0WL556TiuOUUv2bUDlQPfnA7Z0SMDO1A52xkI+NMJKBiZiwfg6UZRgodYm?=
 =?us-ascii?Q?i/5DvwZaAU+Dz5pObdZFT0Hm7jEJGO0r2bjuJYtEe1R95xEQ027aYBiezGpk?=
 =?us-ascii?Q?A+rX+oT5zBu5kLCt0jRP28gSebBbqEQ46TE3Uu+243sZ6t9lUwHLl2V7ZSrQ?=
 =?us-ascii?Q?D171nwjfnUV+TQY1rkZ8rYkbOwnIjc3XPS2Q6UBWXLGxiJTj2UzpM3yQuYl6?=
 =?us-ascii?Q?d+9kKA4Nzb+s+e1JVmXTf5I9M7GMGh9iGM+UgEtCt2NAo7Q9y40Rk9P661FE?=
 =?us-ascii?Q?/h7bKN8NYbBk/6Hq6cWOcEGxFN91e0vl+Up5DscmjCYPQLSK6A=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?kZ+/cCL9qm7JXHnFGfqdog/o11AL75y4bOcXyLXV8xyEzDKELHs3+gqr10w8?=
 =?us-ascii?Q?6sFAjEYWJBmQVM418TYIYkeFzIa/5+3umrvZxFkcxtu5x4X5lhPO8acFSaTF?=
 =?us-ascii?Q?pygyk+xuAuvcl+pXNAYI9JjCfzpIPUozRytt2MaNu2bK48oLrbtF5sENb0Kk?=
 =?us-ascii?Q?KgAIBmzp640Z3fsQmICt74w6ufhRcmBJwevrp3hZc+yqpj7UmkVuf3HUEI1v?=
 =?us-ascii?Q?W5lf9Oaex7gRBQ+y+ZCh08cq8FspDdgstfDmBmNqjHF/r+qXzbnvJiVncj5P?=
 =?us-ascii?Q?ETw1FCyOUuUnitPHCAugeNTCEdveaF+sCRLHRWkv3u48ddMQ3f8iu9kQebce?=
 =?us-ascii?Q?96SL/W/YJCOP2Vyr00onVq9LA7la2mu4CE4HG9DAujXIUQmaxVBzu6R2L5ou?=
 =?us-ascii?Q?MrCJPKMuhHGxGA/3ZpRR/SJwkzPREzQFjrTWa5pSI7FeJPlsqCBI9xo3XGKe?=
 =?us-ascii?Q?lYVgETJJjkpqivfbDY9SSZlN6vDyDBntBBEmJjj8uwSvO0YIW20njSAUEVce?=
 =?us-ascii?Q?NHFwN/t/V1FUKd+NGE5mm7MGCmT9hBqSmSaKVKkuOkss1pCvl72EwOT5ymP4?=
 =?us-ascii?Q?I9wtSEwQH8/FdTMKppRG5PEh7QE6R556VwJxrIz1bP4YAFscTP9lRR0+EmoT?=
 =?us-ascii?Q?pFME6te8OkY5zDqG+WR6VIqKDiQff/fW2PpAENQP6dnxR+DusB6p4NBicjU2?=
 =?us-ascii?Q?xjgBhXX4vYtChLqPQMK9wZ3D6A2Nym9KIlqKh50NDagJ1yu40hvUnjAJnwoW?=
 =?us-ascii?Q?838qoxiWJ1qgVuL0V8NQMlG1fWAxaz1Tiaq5lWmulaW8TkZTzrFVjM8qVilO?=
 =?us-ascii?Q?In2AYI/Au/NsO5BtVvsUvBUckSEPNNfYdUVyI3c+zvn8KbPU+vkk+nmwnqNe?=
 =?us-ascii?Q?97vQv2tHbAW3JBVsa2z3fh9fYwhjcIrnTOlDwHG/fbhs9rIAQN8pGgnRGAQN?=
 =?us-ascii?Q?RTKCAToWu88zuUcJyz72KkUVuEw3YOypr4j6EduvDpfpqCuj+eI13iTRc2qD?=
 =?us-ascii?Q?suetiy1RFAkeX6wq5egLUipyeW57U5seo8p1lER58XqyaBlhYV3xop+rK8Bi?=
 =?us-ascii?Q?RSJACMoj9DLYLghJnLJZU5S0VXcUJdHEHcrApqVanajlTK8bOpod8RN4MSWH?=
 =?us-ascii?Q?gtQpgNyK7BZL2CLzWU6QT/BBx75EdOb/41WUButioLHUsg2IrzBQcr3347zl?=
 =?us-ascii?Q?KIsVQ4rBr782I8QMSYr2tWfzqIIXCEXnZo6E0xVnH/3DYLcPA4LpRuTBzywA?=
 =?us-ascii?Q?ReUQ4etvfROn7tlcXHceYa18yWC20L2v59bu2xschuqcj9lNopyFdEyonSR0?=
 =?us-ascii?Q?R5klM/DWFXqX/LacDtB7P4ZkPaR3qYY3rmBlF/yEEvoqiHgnb2At0SL5gdrf?=
 =?us-ascii?Q?V86sgeXWbTfImcXQf/KVhdgiFYJgBaRTFhS9myyaT/soy5Vj0qc1cxSa72c0?=
 =?us-ascii?Q?I2gtJkJtIgdOPWbt7R0gL5PqEoYblbUp3aiiv+LZ0zRxaorjmbeI829i/cTH?=
 =?us-ascii?Q?zNP/Oa+C642TZ4T4sSlHSOlXwBYoik7SFwfBh/8XrugPcHUQUdZakspmms0s?=
 =?us-ascii?Q?ScZpfdAEnTBvQygeA4d42QM1f08lj9PYJrHwz81K?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c85ada92-10af-4848-bca9-08dcb7f7a6d6
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Aug 2024 22:15:46.3552 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OknMzRRsKngrTaW84XJq9R1Abkx7TqByo1y1fehVWTF+E2NbsazS4vhNrZ01rYeqM1o2Q/XR2INkTvBBnEHbrEDJBayAeZrodecDr7KEOe4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8723
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
From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Ashuto=
sh Dixit
Sent: Thursday, August 8, 2024 10:42 AM
To: intel-xe@lists.freedesktop.org
Cc: Nerlige Ramappa, Umesh <umesh.nerlige.ramappa@intel.com>; Souza, Jose <=
jose.souza@intel.com>; Landwerlin, Lionel G <lionel.g.landwerlin@intel.com>
Subject: [PATCH 8/8] drm/xe/oa: Allow only certain property changes from co=
nfig ioctl
>=20
> Whereas all properties can be specified during OA stream open, when the O=
A
> stream is reconfigured only the config_id and syncs can be specified.
>=20
> Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_oa.c | 69 ++++++++++++++++++++++++++------------
>  1 file changed, 47 insertions(+), 22 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
> index c9f77f0342b60..27654a0d4358f 100644
> --- a/drivers/gpu/drm/xe/xe_oa.c
> +++ b/drivers/gpu/drm/xe/xe_oa.c
> @@ -1133,9 +1133,12 @@ static int decode_oa_format(struct xe_oa *oa, u64 =
fmt, enum xe_oa_format_name *n
>  	return -EINVAL;
>  }
> =20
> -static int xe_oa_set_prop_oa_unit_id(struct xe_oa *oa, u64 value,
> +static int xe_oa_set_prop_oa_unit_id(struct xe_oa *oa, u64 value, bool a=
ll,
>  				     struct xe_oa_open_param *param)
>  {
> +	if (!all)
> +		return -EINVAL;
> +
>  	if (value >=3D oa->oa_unit_ids) {
>  		drm_dbg(&oa->xe->drm, "OA unit ID out of range %lld\n", value);
>  		return -EINVAL;
> @@ -1144,25 +1147,32 @@ static int xe_oa_set_prop_oa_unit_id(struct xe_oa=
 *oa, u64 value,
>  	return 0;
>  }
> =20
> -static int xe_oa_set_prop_sample_oa(struct xe_oa *oa, u64 value,
> +static int xe_oa_set_prop_sample_oa(struct xe_oa *oa, u64 value, bool al=
l,
>  				    struct xe_oa_open_param *param)
>  {
> +	if (!all)
> +		return -EINVAL;
> +
>  	param->sample =3D value;
>  	return 0;
>  }
> =20
> -static int xe_oa_set_prop_metric_set(struct xe_oa *oa, u64 value,
> +static int xe_oa_set_prop_metric_set(struct xe_oa *oa, u64 value, bool a=
ll,
>  				     struct xe_oa_open_param *param)
>  {
>  	param->metric_set =3D value;
>  	return 0;
>  }
> =20
> -static int xe_oa_set_prop_oa_format(struct xe_oa *oa, u64 value,
> +static int xe_oa_set_prop_oa_format(struct xe_oa *oa, u64 value, bool al=
l,
>  				    struct xe_oa_open_param *param)
>  {
> -	int ret =3D decode_oa_format(oa, value, &param->oa_format);
> +	int ret;
> =20
> +	if (!all)
> +		return -EINVAL;
> +
> +	ret =3D decode_oa_format(oa, value, &param->oa_format);
>  	if (ret) {
>  		drm_dbg(&oa->xe->drm, "Unsupported OA report format %#llx\n", value);
>  		return ret;
> @@ -1170,11 +1180,14 @@ static int xe_oa_set_prop_oa_format(struct xe_oa =
*oa, u64 value,
>  	return 0;
>  }
> =20
> -static int xe_oa_set_prop_oa_exponent(struct xe_oa *oa, u64 value,
> +static int xe_oa_set_prop_oa_exponent(struct xe_oa *oa, u64 value, bool =
all,
>  				      struct xe_oa_open_param *param)
>  {
>  #define OA_EXPONENT_MAX 31
> =20
> +	if (!all)
> +		return -EINVAL;
> +
>  	if (value > OA_EXPONENT_MAX) {
>  		drm_dbg(&oa->xe->drm, "OA timer exponent too high (> %u)\n", OA_EXPONE=
NT_MAX);
>  		return -EINVAL;
> @@ -1183,49 +1196,61 @@ static int xe_oa_set_prop_oa_exponent(struct xe_o=
a *oa, u64 value,
>  	return 0;
>  }
> =20
> -static int xe_oa_set_prop_disabled(struct xe_oa *oa, u64 value,
> +static int xe_oa_set_prop_disabled(struct xe_oa *oa, u64 value, bool all=
,
>  				   struct xe_oa_open_param *param)
>  {
> +	if (!all)
> +		return -EINVAL;
> +
>  	param->disabled =3D value;
>  	return 0;
>  }
> =20
> -static int xe_oa_set_prop_exec_queue_id(struct xe_oa *oa, u64 value,
> +static int xe_oa_set_prop_exec_queue_id(struct xe_oa *oa, u64 value, boo=
l all,
>  					struct xe_oa_open_param *param)
>  {
> +	if (!all)
> +		return -EINVAL;
> +
>  	param->exec_queue_id =3D value;
>  	return 0;
>  }
> =20
> -static int xe_oa_set_prop_engine_instance(struct xe_oa *oa, u64 value,
> +static int xe_oa_set_prop_engine_instance(struct xe_oa *oa, u64 value, b=
ool all,
>  					  struct xe_oa_open_param *param)
>  {
> +	if (!all)
> +		return -EINVAL;
> +
>  	param->engine_instance =3D value;
>  	return 0;
>  }
> =20
> -static int xe_oa_set_no_preempt(struct xe_oa *oa, u64 value,
> +static int xe_oa_set_no_preempt(struct xe_oa *oa, u64 value, bool all,
>  				struct xe_oa_open_param *param)
>  {
> +	if (!all)
> +		return -EINVAL;
> +
>  	param->no_preempt =3D value;
>  	return 0;
>  }
> =20
> -static int xe_oa_set_num_syncs(struct xe_oa *oa, u64 value,
> +static int xe_oa_set_num_syncs(struct xe_oa *oa, u64 value, bool all,
>  			       struct xe_oa_open_param *param)
>  {
>  	param->num_syncs =3D value;
>  	return 0;
>  }
> =20
> -static int xe_oa_set_syncs_user(struct xe_oa *oa, u64 value,
> +static int xe_oa_set_syncs_user(struct xe_oa *oa, u64 value, bool all,
>  				struct xe_oa_open_param *param)
>  {
>  	param->syncs_user =3D u64_to_user_ptr(value);
>  	return 0;
>  }
> =20
> -typedef int (*xe_oa_set_property_fn)(struct xe_oa *oa, u64 value,
> +typedef int (*xe_oa_set_property_fn)(struct xe_oa *oa, u64 value, bool a=
ll,
>  				     struct xe_oa_open_param *param);
>  static const xe_oa_set_property_fn xe_oa_set_property_funcs[] =3D {
>  	[DRM_XE_OA_PROPERTY_OA_UNIT_ID] =3D xe_oa_set_prop_oa_unit_id,
> @@ -1241,7 +1266,7 @@ static const xe_oa_set_property_fn xe_oa_set_proper=
ty_funcs[] =3D {
>  	[DRM_XE_OA_PROPERTY_SYNCS] =3D xe_oa_set_syncs_user,
>  };
> =20
> -static int xe_oa_user_ext_set_property(struct xe_oa *oa, u64 extension,
> +static int xe_oa_user_ext_set_property(struct xe_oa *oa, u64 extension, =
bool all,
>  				       struct xe_oa_open_param *param)
>  {
>  	u64 __user *address =3D u64_to_user_ptr(extension);
> @@ -1258,18 +1283,18 @@ static int xe_oa_user_ext_set_property(struct xe_=
oa *oa, u64 extension,
>  		return -EINVAL;
> =20
>  	idx =3D array_index_nospec(ext.property, ARRAY_SIZE(xe_oa_set_property_=
funcs));
> -	return xe_oa_set_property_funcs[idx](oa, ext.value, param);
> +	return xe_oa_set_property_funcs[idx](oa, ext.value, all, param);

We might be able to reduce the amount of times the "all" Boolean param need=
s to get
propagated if we had a separate xe_oa_set_property_fn array for the reconfi=
guration
case.  Say:

"""
static int xe_oa_set_prop_inval(struct xe_oa *oa, u64 value,
				  struct xe_oa_open_param *param)
{
	return -EINVAL;
}

static const xe_oa_set_property_fn xe_oa_set_property_funcs_recon[] =3D {
	[DRM_XE_OA_PROPERTY_OA_UNIT_ID] =3D xe_oa_set_prop_inval,
	[DRM_XE_OA_PROPERTY_SAMPLE_OA] =3D xe_oa_set_prop_inval,
	[DRM_XE_OA_PROPERTY_OA_METRIC_SET] =3D xe_oa_set_prop_metric_set,
	[DRM_XE_OA_PROPERTY_OA_FORMAT] =3D xe_oa_set_prop_inval,
	[DRM_XE_OA_PROPERTY_OA_PERIOD_EXPONENT] =3D xe_oa_set_prop_inval,
	[DRM_XE_OA_PROPERTY_OA_DISABLED] =3D xe_oa_set_prop_inval,
	[DRM_XE_OA_PROPERTY_EXEC_QUEUE_ID] =3D xe_oa_set_prop_inval,
	[DRM_XE_OA_PROPERTY_OA_ENGINE_INSTANCE] =3D xe_oa_set_prop_inval,
	[DRM_XE_OA_PROPERTY_NO_PREEMPT] =3D xe_oa_set_prop_inval,
	[DRM_XE_OA_PROPERTY_NUM_SYNCS] =3D xe_oa_set_num_syncs,
	[DRM_XE_OA_PROPERTY_SYNCS] =3D xe_oa_set_syncs_user,
};
"""

Then from there, say:

-	return xe_oa_set_property_funcs[idx](oa, ext.value, param);
+	if (all)
+		return xe_oa_set_property_funcs[idx](oa, ext.value, param);
+	else
+		return xe_oa_set_property_funcs_recon[idx](oa, ext.value, param);

I guess at that point, we'd want to rename oa_set_property_funcs to somethi=
ng else
(such as "xe_oa_set_property_funcs_all") for clarity.

The alternative would be to rename "all" to "open" so that later down the e=
xecution
stack, it remains clear that we're blocking the execution of the various fu=
nctions in the
reconfiguration case (or the "not open" case, if you will).

Either change by itself would be sufficient, I think.

-Jonathan Cavitt

>  }
> =20
> -typedef int (*xe_oa_user_extension_fn)(struct xe_oa *oa, u64 extension,
> +typedef int (*xe_oa_user_extension_fn)(struct xe_oa *oa, u64 extension, =
bool all,
>  				       struct xe_oa_open_param *param);
>  static const xe_oa_user_extension_fn xe_oa_user_extension_funcs[] =3D {
>  	[DRM_XE_OA_EXTENSION_SET_PROPERTY] =3D xe_oa_user_ext_set_property,
>  };
> =20
>  #define MAX_USER_EXTENSIONS	16
> -static int xe_oa_user_extensions(struct xe_oa *oa, u64 extension, int ex=
t_number,
> -				 struct xe_oa_open_param *param)
> +static int xe_oa_user_extensions(struct xe_oa *oa, u64 extension, bool a=
ll,
> +				 int ext_number, struct xe_oa_open_param *param)
>  {
>  	u64 __user *address =3D u64_to_user_ptr(extension);
>  	struct drm_xe_user_extension ext;
> @@ -1288,12 +1313,12 @@ static int xe_oa_user_extensions(struct xe_oa *oa=
, u64 extension, int ext_number
>  		return -EINVAL;
> =20
>  	idx =3D array_index_nospec(ext.name, ARRAY_SIZE(xe_oa_user_extension_fu=
ncs));
> -	err =3D xe_oa_user_extension_funcs[idx](oa, extension, param);
> +	err =3D xe_oa_user_extension_funcs[idx](oa, extension, all, param);
>  	if (XE_IOCTL_DBG(oa->xe, err))
>  		return err;
> =20
>  	if (ext.next_extension)
> -		return xe_oa_user_extensions(oa, ext.next_extension, ++ext_number, par=
am);
> +		return xe_oa_user_extensions(oa, ext.next_extension, all, ++ext_number=
, param);
> =20
>  	return 0;
>  }
> @@ -1439,7 +1464,7 @@ static long xe_oa_config_locked(struct xe_oa_stream=
 *stream, u64 arg)
>  	struct xe_oa_config *config;
>  	int err;
> =20
> -	err =3D xe_oa_user_extensions(stream->oa, arg, 0, &param);
> +	err =3D xe_oa_user_extensions(stream->oa, arg, false, 0, &param);
>  	if (err)
>  		return err;
> =20
> @@ -1989,7 +2014,7 @@ int xe_oa_stream_open_ioctl(struct drm_device *dev,=
 u64 data, struct drm_file *f
>  	}
> =20
>  	param.xef =3D xef;
> -	ret =3D xe_oa_user_extensions(oa, data, 0, &param);
> +	ret =3D xe_oa_user_extensions(oa, data, true, 0, &param);
>  	if (ret)
>  		return ret;
> =20
> --=20
> 2.41.0
>=20
>=20
