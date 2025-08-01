Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B459FC87FCB
	for <intel-xe@archiver.kernel.org>; Fri,  1 Aug 2025 23:01:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E41010E06F;
	Fri,  1 Aug 2025 23:01:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ROLIEI8y";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2346D10E06F
 for <intel-xe@lists.freedesktop.org>; Fri,  1 Aug 2025 23:01:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754089271; x=1785625271;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=5pFf6KxcxQwAQXOCnBMqmJujVWafO0T8cuC8uZr1WwY=;
 b=ROLIEI8yYt+yy9WAXodX9cemRrjB/Rc0vTH/u27NG5dfwrwwgSEJ2E0p
 YEgQR2DbSJzRlFmiCH4Vpw9EU2pBkPxo6ZYGz1Xob14YNhjWylPWFpjjk
 x0+SAKvg5TkOSrEoWZJ9jdlnuynYYSJxNMBXBCdnwGwctwzgDWwdx0J08
 RVgy3gDUA+sRrK4ucJpdt+8IqVYKvGH+KcOTX3UBdwRTahbK0vnhohlWn
 ikESXIyvpST+VxlRKhi1D9EuG+odBC2SMfKQyT+ra8I9wZ0l/xpjBeihu
 4JCh134QIj2kh/dknTjsIUtb/Me2lz6MGWc1N0STi6nEOp6AhqnzgSv0r Q==;
X-CSE-ConnectionGUID: SAH3bChtQZq4jgKOcjctuQ==
X-CSE-MsgGUID: mO0boJ1wTFeuJpCFOiLKqg==
X-IronPort-AV: E=McAfee;i="6800,10657,11508"; a="60081881"
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; d="scan'208";a="60081881"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2025 16:01:11 -0700
X-CSE-ConnectionGUID: rRNLq4d1SCuVafxRhcwGSw==
X-CSE-MsgGUID: UY3sayBLQROgSWb+D+rLGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; d="scan'208";a="164474981"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2025 16:01:10 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Fri, 1 Aug 2025 16:01:09 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Fri, 1 Aug 2025 16:01:09 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (40.107.243.56)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 1 Aug 2025 16:01:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YyZ2PMFzeK639Qod3HBVP83gdfu71wKimT1pe1dWdwpIPujX5Gw6zIbeDsAFP6tQ36wqjWygB1GqGPFq7CMIKCevvHf+GHvg7T402NuYW1hKEnPa3UhRK+e+GbOrpHR3/YQGYiWOQb2VprRvEHucYiHAZCzmSGyYZnLq9NcDYDos3fdYDXCsuyeehq2LEsKp+09aMEdldp4eBMNChEqQBZu8hzml8bV719K7p44wVgrhUjrXj2edCd6W767s4u/QsGqdGeu+AmjMADhBb9PImKZVCrt7uu0lVesJex6WMjobCJiJRqlmYrIUXeuG1yb5AQ3PdulnNHTsq6m/ULKt0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TbkB8WBimNcsU8xsgVNlRUhWNU+T/xbgHYQ4IayvSlw=;
 b=eH4YySIju1/0JCKoPZuQs163i6irDJhgb7tlESV+L0P0rlgidg8lNxQ5rXKHohV/bu5syOr9lrdf/BuvOel+3AnggU6V+OxfIYqw4LtKuo2amCQwY8zw/cjSU8uH/RqF+bzCKjxP6UbgjARO9/lpRgkbrpoG0542d+/qT+/yq7ynIWZxw5GgNxbeRQA1O8ZjHAsjtKFHUcg9GYtz23gLsWAuV6qylSrbE2KxjJjQ7HTkhzJ2xZZAx4X0iHFLoOYyseXognwtk64HKQffZWUYhmkI9hJqfVYbpvIMhp7o9gO/iuRYW9tiOmD6UpukcCXveo0hHz+9jHq9vQ1Rbz/LiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by CY8PR11MB6913.namprd11.prod.outlook.com (2603:10b6:930:5b::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.25; Fri, 1 Aug
 2025 23:01:05 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%4]) with mapi id 15.20.8989.010; Fri, 1 Aug 2025
 23:01:05 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Lis, Tomasz" <tomasz.lis@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
CC: "Winiarski, Michal" <michal.winiarski@intel.com>, "Wajdeczko, Michal"
 <Michal.Wajdeczko@intel.com>, "Piorkowski, Piotr"
 <piotr.piorkowski@intel.com>, "Brost, Matthew" <matthew.brost@intel.com>, "De
 Marchi, Lucas" <lucas.demarchi@intel.com>, "Cavitt, Jonathan"
 <jonathan.cavitt@intel.com>
Subject: RE: [PATCH v8 6/8] drm/xe/vf: Post migration, repopulate ring area
 for pending request
Thread-Topic: [PATCH v8 6/8] drm/xe/vf: Post migration, repopulate ring area
 for pending request
Thread-Index: AQHcAobHVimliWlQ3k28ilLP87KlVbROXeRg
Date: Fri, 1 Aug 2025 23:01:05 +0000
Message-ID: <CH0PR11MB5444F19A1183BBB241AEAB7DE526A@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20250801015045.957609-1-tomasz.lis@intel.com>
 <20250801015045.957609-7-tomasz.lis@intel.com>
In-Reply-To: <20250801015045.957609-7-tomasz.lis@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|CY8PR11MB6913:EE_
x-ms-office365-filtering-correlation-id: 169ec473-269c-4cd2-b474-08ddd14f4b9d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?nQBEh6Xy0NtdkelPabCCywhjn7nSddU4z+V32JAM5g8tD20l4xNJImL4YK2R?=
 =?us-ascii?Q?harWN+FT50nwzjcV8J3sBlTh4ef64wh1i3XvVGMZ702D/lYOgUBz6invwH2N?=
 =?us-ascii?Q?gHnAFpeGvkrt3GkEaReR4+LQqwiJg/x/gTRvd2RM3rW1O5L5PkeSS2Ck6H2d?=
 =?us-ascii?Q?LTaNN9+ENu2NvpxaUbqbUd0STRRQgleZZEh2BdJZKFdM0E9zkyCAhlNDAiza?=
 =?us-ascii?Q?jibzwHc6cnGlkh0nDrQWQ/yzi+JkOHE7cp66EMEHMtnCT8hmZOtHKF66gf0h?=
 =?us-ascii?Q?7djZXrIycQpU4KUJWyzUA9J/1OQZ0Xk04awRo2XjLKiAOxiSjWuH65EIcixV?=
 =?us-ascii?Q?H3Qb9/7wXpC9O4LWpbwFxYK5aliDJ/rxa9CzCE+PkfJPTPA8K8IiBV9RtoqQ?=
 =?us-ascii?Q?rVc25ZgiCMzOCrrj/jpTueXcaKuOzD7YUH/jCmT19Zcw87vORopKjmFT/VjZ?=
 =?us-ascii?Q?2MFkHucGvRAPEMruQozRv9Hk6ASVaKqa2/w+FfghRCugPNoljX5WiQvdUMPS?=
 =?us-ascii?Q?cG4/CElHg+6+1mwziPS/sHW4gkcIPtu1YVqqZxHm9+Xdr8EjrZ4Qk4iiJeGX?=
 =?us-ascii?Q?T+lRcz37kLuc6uXR0dz7pWAEySVjeERb12cb93XXhdDiGSaXc9dWf54DyHhQ?=
 =?us-ascii?Q?aKcW47BzjjHcTk2muNBbThsEXLSHXdk1Fg1cO0dhw0NFJxMxzTbMSgdF8CIx?=
 =?us-ascii?Q?Q9CrHS+6cyCzFxXuMxqmZZrdlexmZz6UzoDAQyn45ihnFz6iN643dJzi6m1j?=
 =?us-ascii?Q?indtjFlSykYK/0V5oZimViPV+VbVhhTaua9Us3rOW5VaBvOD7g16KDH/TEoX?=
 =?us-ascii?Q?RHt1DkICAwxdlk3bBt69S1K8K2Dt9zGjouFBhffDEbaSuoUKjoHVk+um7yRK?=
 =?us-ascii?Q?Zjxra1aulPF1+PseQ+pFpG1iTXC9nGRdL56V7dkX/6yFK/oIxNPDxrMmbisa?=
 =?us-ascii?Q?F7gQk241MXgTxUif3hIaob9rKBK50O7iI/DX0lqOipizApDB+5Gvs3uB2z0V?=
 =?us-ascii?Q?6dVXlY2Ixb0xFWchNqKmdHgBr/dy/fwvJyp2jAOdtFaqJLrh4PtXFnOmdQmY?=
 =?us-ascii?Q?xGkao5UsXh3q9RYi9jCby7/AwnRJP3GrKVjUx2tyJIKu5JZLoNcbQaCi30E3?=
 =?us-ascii?Q?W9kr948lutbmrEvR1NCNMiAXSQkEFuZRR15pJTCXePX6XtoFb1gmsnt1wTif?=
 =?us-ascii?Q?FMEr/aFMIuGsiAdyNwNQKKDA+BFMgguWFLUu9J7R95CRAA0xwxTfmEzDvADL?=
 =?us-ascii?Q?O5cwNW/TtmU9yyrAI+7LeK6q8X4k4SXGJEicXyUJPAJG+shpc4HEVLmM/m5l?=
 =?us-ascii?Q?vmQBKQYrfcwyXtYX7piNEgxueLoYLLQTHT+FYDmb+lcyueTC2VUQN5TzTEZn?=
 =?us-ascii?Q?SSJC3MTdZqhWdyGN0IIRfie8fDe1s+xjgZSZsqH8G+Kaq5qqmJWRu1Wd5GK/?=
 =?us-ascii?Q?v3l7cqJnJPSjF25vRuQisYEMhbsQYSlYU2wLk4YW1dtSVdjh3TYDUZhmACgR?=
 =?us-ascii?Q?qJ+0Dfjirqi2Mq4=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?LqtHnYNagG3PPedA1C1YR+wdYguykbVnUZeFVmurmKIEOLAVUuSVDIYXJKHx?=
 =?us-ascii?Q?vwG784zPyNfm3+bh3Xym6diBc8kVdL1Tm+3JTIls381jv+P6OJidW07/Ekys?=
 =?us-ascii?Q?zk2rJhRJa22HvT9g65XUCEdfg6XU/Khn0Jic5aFYUSU04BvAQoSX+5jxDHP8?=
 =?us-ascii?Q?87+8mWoFRlYPazeT80sLu3JOOF/NBDwbT1BZPMinPts1KqNVtBJnwvJBzFZA?=
 =?us-ascii?Q?6U9+wIPIEqEoYo8d0KMSc3YYSRn/419sG4hBqnp/lzFxn1laefOMxf9WmPO3?=
 =?us-ascii?Q?hXaF8cuY3WvCEaf/sc30VzlHYaR4b+KEPTzlBy/+cy4zHYHNQFH6XY8RcuGK?=
 =?us-ascii?Q?lY/yIAgndhFpwjnl7ekKsgKnNfIHqn9Ij5NbCr8bVylI46Vx4h0YOz/uK2CY?=
 =?us-ascii?Q?0rJ5ivqMe81aVHciNYmETz4kEpEcw2cqXhHTYxiXS7kDAWJ3EnZuZdOQ3Pqh?=
 =?us-ascii?Q?Uv3sAQ6ER03evPMqawSgA/Z8XT93wSA+BhO/lbeRY3C8+HYFiqcLAngB/CuE?=
 =?us-ascii?Q?rVg/3ZFhz1ppbyZBwORfzOIs/kr2sGrBTpWpCSZwiG6HLWNIWGBTLqdigtME?=
 =?us-ascii?Q?tU6bgjh0cUds4fxH7ulEc04HxaziihkFtRH4nn1fOCVMl0GBf8D+T+ql72wo?=
 =?us-ascii?Q?WaOqTIljTynqjojy16CnRgE8hxDFhis2jTTSCxYmHWFS+Ka6SucNm1kZ0x7r?=
 =?us-ascii?Q?QOA7R8pzNyKd5fXS3b/3WaL/ZKoeBbyj5ME/4CLCRmpgB0v8hAy1fMJw3QoD?=
 =?us-ascii?Q?zYvUG+4DbRtOEs/kYVNRLlRpS2L8dPfKdjNW52ZuOnT/2DeGBKMBmtyMPonw?=
 =?us-ascii?Q?SjndC08DcbiZyrl+01WTeC+vXqwhub4MEqX85cEOKE3/ev+9OLg6NDFZL3K5?=
 =?us-ascii?Q?LQ3xeXPAQygyIUv67RemTZqFgsSDfecRoS/MZbkXAccSBVY2A0ZBKCMh9/KI?=
 =?us-ascii?Q?6zJZ9azyZL1IIUMVwbGcrCkb5fAOodMW79QtGtI0d2Stm7L21Cs7LYAl9gKR?=
 =?us-ascii?Q?HU8tHd7hjboQg2WcciRSHfanHXb2PGC42/Rw77CcxBFYq58hbGybpTLADX7m?=
 =?us-ascii?Q?k55dz+ywL4pZ0hqBgaEsZ9o78xiWpvl5RK0f+0TwB5/JVSp+5SNJBF0vuLhc?=
 =?us-ascii?Q?2Ds+Ht/MkyhkaRHcIUANBtWqR/QnsFrDDwqzq4sTKRzNST5zBX/n2Xih4nTN?=
 =?us-ascii?Q?NYyx54dl4nAau6VOCqfhkFm1cZt5fbeNpuL5leOoZelEUZreCVU9AgRWg548?=
 =?us-ascii?Q?ZJx7e+G+qW02di5nzeSknzVK0TrrrS/qKFrxNVp4/c3/PztV1i0KtRxz9YQh?=
 =?us-ascii?Q?50sk3wZg/BH8VtrqE5g/8YbPsdBeh0UQeGd2xuYtzKIu3bDxdyv0Wu4vYMDf?=
 =?us-ascii?Q?mSfY2OW/mnCIV1rJfcfEuxoGqlGtWqkjZLShxWIVCMakIfo3x2IAVX+UTFil?=
 =?us-ascii?Q?16LDMvWDsOAxkQ2aa+m/vUJPsyxtqLsI8Jyy+Tz8sJ7THJHt4d8+Zwvcj+km?=
 =?us-ascii?Q?HP8/8o80Sc9HW7hpOGIEKw6KrP79t+Qap8JGuebOjYGzeGAC5gvIa4GpDuBq?=
 =?us-ascii?Q?KH2gNFrlWi7O6FEJ94gtHrCdfLxySs+J+l/igrn7?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 169ec473-269c-4cd2-b474-08ddd14f4b9d
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Aug 2025 23:01:05.7557 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JTjaqCfrwgrAyljYuLffcWERQMd9/J4sWEQOhFe4mnMj5p/R/ilyom8T0ttmDLL4ga5xW83I9/gV7mQjBchyMnqbQH8ZYuRNotrhVDATAf0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB6913
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
From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Tomasz=
 Lis
Sent: Thursday, July 31, 2025 6:51 PM
To: intel-xe@lists.freedesktop.org
Cc: Winiarski, Michal <michal.winiarski@intel.com>; Wajdeczko, Michal <Mich=
al.Wajdeczko@intel.com>; Piorkowski, Piotr <piotr.piorkowski@intel.com>; Br=
ost, Matthew <matthew.brost@intel.com>; De Marchi, Lucas <lucas.demarchi@in=
tel.com>
Subject: [PATCH v8 6/8] drm/xe/vf: Post migration, repopulate ring area for=
 pending request
>=20
> The commands within ring area allocated for a request may contain
> references to GGTT. These references require update after VF
> migration, in order to continue any preempted LRCs, or jobs which
> were emitted to the ring but not sent to GuC yet.
>=20
> This change calls the emit function again for all such jobs,
> as part of post-migration recovery.
>=20
> v2: Moved few functions to better files
> v3: Take job_list_lock
>=20
> Signed-off-by: Tomasz Lis <tomasz.lis@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Michal Winiarski <michal.winiarski@intel.com>
> Reviewed-by: Michal Winiarski <michal.winiarski@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_exec_queue.c | 24 ++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_exec_queue.h |  2 ++
>  drivers/gpu/drm/xe/xe_guc_submit.c | 24 ++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_guc_submit.h |  2 ++
>  drivers/gpu/drm/xe/xe_sriov_vf.c   |  2 +-
>  5 files changed, 53 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_e=
xec_queue.c
> index 0beb6388acb0..1a7950d18800 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> @@ -1092,3 +1092,27 @@ void xe_exec_queue_contexts_hwsp_rebase(struct xe_=
exec_queue *q, void *scratch)
>  		xe_lrc_update_hwctx_regs_with_address(q->lrc[i]);
>  	}
>  }
> +
> +/**
> + * xe_exec_queue_jobs_ring_restore - Re-emit ring commands of requests p=
ending on given queue.
> + * @q: the &xe_exec_queue struct instance
> + */
> +void xe_exec_queue_jobs_ring_restore(struct xe_exec_queue *q)
> +{
> +	struct xe_gpu_scheduler *sched =3D &q->guc->sched;
> +	struct xe_sched_job *job;
> +
> +	/*
> +	 * This routine is used within VF migration recovery. This means
> +	 * using the lock here, introduces a restriction: in no place we
> +	 * can wait for any GFX HW response when that lock is taken.
> +	 */

s/here,/here
s/in no place we can/we cannot
s/response when that/responses while the

Above changes also apply to duplicate comment below.

These requests are blocking.
-Jonathan Cavitt

> +	spin_lock(&sched->base.job_list_lock);
> +	list_for_each_entry(job, &sched->base.pending_list, drm.list) {
> +		if (xe_sched_job_is_error(job))
> +			continue;
> +
> +		q->ring_ops->emit_job(job);
> +	}
> +	spin_unlock(&sched->base.job_list_lock);
> +}
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.h b/drivers/gpu/drm/xe/xe_e=
xec_queue.h
> index da720197929b..0ffc0cb03aa6 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.h
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.h
> @@ -92,4 +92,6 @@ void xe_exec_queue_update_run_ticks(struct xe_exec_queu=
e *q);
> =20
>  void xe_exec_queue_contexts_hwsp_rebase(struct xe_exec_queue *q, void *s=
cratch);
> =20
> +void xe_exec_queue_jobs_ring_restore(struct xe_exec_queue *q);
> +
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_g=
uc_submit.c
> index 452fb6e63f31..8d090dced9cf 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -781,6 +781,30 @@ guc_exec_queue_run_job(struct drm_sched_job *drm_job=
)
>  	return fence;
>  }
> =20
> +/**
> + * xe_guc_jobs_ring_rebase - Re-emit ring commands of requests pending
> + * on all queues under a guc.
> + * @guc: the &xe_guc struct instance
> + */
> +void xe_guc_jobs_ring_rebase(struct xe_guc *guc)
> +{
> +	struct xe_exec_queue *q;
> +	unsigned long index;
> +
> +	/*
> +	 * This routine is used within VF migration recovery. This means
> +	 * using the lock here, introduces a restriction: in no place we
> +	 * can wait for any GFX HW response when that lock is taken.
> +	 */
> +	mutex_lock(&guc->submission_state.lock);
> +	xa_for_each(&guc->submission_state.exec_queue_lookup, index, q) {
> +		if (exec_queue_killed_or_banned_or_wedged(q))
> +			continue;
> +		xe_exec_queue_jobs_ring_restore(q);
> +	}
> +	mutex_unlock(&guc->submission_state.lock);
> +}
> +
>  static void guc_exec_queue_free_job(struct drm_sched_job *drm_job)
>  {
>  	struct xe_sched_job *job =3D to_xe_sched_job(drm_job);
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.h b/drivers/gpu/drm/xe/xe_g=
uc_submit.h
> index 9a2718c81d43..92a6f0ade615 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.h
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.h
> @@ -34,6 +34,8 @@ int xe_guc_exec_queue_memory_cat_error_handler(struct x=
e_guc *guc, u32 *msg,
>  int xe_guc_exec_queue_reset_failure_handler(struct xe_guc *guc, u32 *msg=
, u32 len);
>  int xe_guc_error_capture_handler(struct xe_guc *guc, u32 *msg, u32 len);
> =20
> +void xe_guc_jobs_ring_rebase(struct xe_guc *guc);
> +
>  struct xe_guc_submit_exec_queue_snapshot *
>  xe_guc_exec_queue_snapshot_capture(struct xe_exec_queue *q);
>  void
> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf.c b/drivers/gpu/drm/xe/xe_sri=
ov_vf.c
> index 43ac73e432d4..a219395c15de 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_vf.c
> +++ b/drivers/gpu/drm/xe/xe_sriov_vf.c
> @@ -284,7 +284,7 @@ static int gt_vf_post_migration_fixups(struct xe_gt *=
gt)
>  		xe_tile_sriov_vf_fixup_ggtt_nodes(gt_to_tile(gt), shift);
>  		xe_gt_sriov_vf_default_lrcs_hwsp_rebase(gt);
>  		xe_guc_contexts_hwsp_rebase(&gt->uc.guc, buf);
> -		/* FIXME: add the recovery steps */
> +		xe_guc_jobs_ring_rebase(&gt->uc.guc);
>  		xe_guc_ct_fixup_messages_with_ggtt(&gt->uc.guc.ct, shift);
>  	}
> =20
> --=20
> 2.25.1
>=20
>=20
