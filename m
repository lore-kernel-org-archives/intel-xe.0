Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3164C25B75
	for <intel-xe@archiver.kernel.org>; Wed, 15 May 2024 20:56:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68FAD10E07E;
	Wed, 15 May 2024 20:56:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SAQNQjWZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00E2F10E07E
 for <intel-xe@lists.freedesktop.org>; Wed, 15 May 2024 20:56:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715806590; x=1747342590;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ORfd5Gmc0dnHwb3IaY94hs0WBGsGPKwneKDM7zA6S58=;
 b=SAQNQjWZedENlU1H2Qsd9AfIS1qUhoztFKQd/bXeEbfjX3kPYSqRYcl9
 JgexkVCZrT8nU533ZiSiGSCNLCYE0OJeErwpMyj0TalqrFKubA2QhpjCl
 jbWgKkl2O2pI8PyNEPrECylQCfrRSLtP7S2zVbzT5o6ex25GF+13XmMaN
 3LtGhYesAvqkutKAB2P+pUJeRfOuErdtcf9hay2ZAwEOftyKMLFM13P7y
 V2RqCcKXXR4M3qAWDkw15BGb1AleWg9RbNkCm5NYQn303CI5BCmaTXWBX
 8C3iBHEJdxbbRd3vgFQYkGDdVTRX2NDfLPHpqdSZln+rZETGKgWSbGW95 w==;
X-CSE-ConnectionGUID: qZqOLdTOR96JypsAizHwaw==
X-CSE-MsgGUID: e/qPXri7TN28wqvKtbxlZQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11074"; a="29406102"
X-IronPort-AV: E=Sophos;i="6.08,162,1712646000"; d="scan'208";a="29406102"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2024 13:56:29 -0700
X-CSE-ConnectionGUID: O3nQnr+LR/ihq3sIqNVdgQ==
X-CSE-MsgGUID: q6FL45XJSd+oGh92iRoQEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,162,1712646000"; d="scan'208";a="35908690"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 May 2024 13:56:29 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 15 May 2024 13:56:28 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 15 May 2024 13:56:28 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 15 May 2024 13:56:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Gp4jO/oivpslx4Cq+NrgHe+eDMkvCZBOzS8SzcoDk0gyDn8mYdj+V5Po8RhuY4+T4/ssAb8wMaeZA78W6QJj+Knj8IsOkGYuu+KNqJZBAEVFLMyFk46Oy5SFhdCg+f3PyfNDgzr5VNFQcX3M6tm173C725CgDx8pEzteyL6236BZ2bBTB2X6DYBXZQQbQo1yPvysrMeM6eq+x6925JDptiUsMx8eRtfjLjeLJHPb0mjyXSF8zz6CPrE1UT6iUm+++rOacGjiLl7mbx2OtbhLSHTXFUCr/SmzllL6WMuPdMMUbW/waAZ2o0ePVgXX2SjTZVLW5N4xyAlKkA9Z8WyUHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h5038mkM14mY5E+/U0CnvHEV7+ccy/phhlxZIYfTaiI=;
 b=FZxMJOkuBqSpOQ5P5oHdexVIgSNwHM9hShBGVqDmPJBWSEYh9OwZGlToECbSBM84DlUETH631FnqR+B4K6qK4krAjFOCtq4xaONF3eNVxGZGs4kDUxxQdJc+Q8pNDy+m/1J0Q6GwMV4vge7U6Auz9T90SgDNkq+ptd7MGnNeYQW7xAdYGvT5J1Q0OKS7Sbw9W3AU8YlZkRlH/CuEKpzPxMjpBdBMbq4C0jNkEIOJKup2KDusvdVKqL+BuBSqx4wlcMliLkAuAeRPmk8tlwA1s23LBPmGORa1Q0chD788gULCOAo+9RR6MsdFWh+blIu/saVz8mZVMRsH/5d3w8eKvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by CYYPR11MB8305.namprd11.prod.outlook.com (2603:10b6:930:c1::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.55; Wed, 15 May
 2024 20:56:26 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::f061:a0b9:4a91:b27c]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::f061:a0b9:4a91:b27c%4]) with mapi id 15.20.7587.025; Wed, 15 May 2024
 20:56:26 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Cavitt,
 Jonathan" <jonathan.cavitt@intel.com>
CC: "Brost, Matthew" <matthew.brost@intel.com>
Subject: RE: [PATCH v2 1/6] drm/xe:
 s/xe_tile_migrate_engine/xe_tile_migrate_exec_queue
Thread-Topic: [PATCH v2 1/6] drm/xe:
 s/xe_tile_migrate_engine/xe_tile_migrate_exec_queue
Thread-Index: AQHapmBvKarOQ9Y5b0+6aGcsjMf/w7GYx3RA
Date: Wed, 15 May 2024 20:56:26 +0000
Message-ID: <CH0PR11MB5444D84446433686892B1A03E5EC2@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20240515004010.100091-1-matthew.brost@intel.com>
 <20240515004010.100091-2-matthew.brost@intel.com>
In-Reply-To: <20240515004010.100091-2-matthew.brost@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|CYYPR11MB8305:EE_
x-ms-office365-filtering-correlation-id: 2d8161a4-b5a3-4432-aba1-08dc75217c67
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230031|376005|366007|1800799015|38070700009;
x-microsoft-antispam-message-info: =?us-ascii?Q?S+tVx1t/OnFTuboU1vvwJalfmZoH5MJwqxOb6uLyrtSiXG2bQGaktJ7EKFaa?=
 =?us-ascii?Q?9EPJQQ1W3tBd1jcBHgmgos/gVBWeKxU75ritJg0d2O1Ui+12oc6MCRvhYgDN?=
 =?us-ascii?Q?XWn6hEPqGwIpdQD4ZKBQoD5Bn+YfYeWlUqWqKxoRDx0WLe5rO5q7+rEubxjx?=
 =?us-ascii?Q?3idA/gYv9Y2++JIvIUbpJmFpSn5bHqIfoRnc2JyIwPOj+5tVlsa9Z9KoPH+4?=
 =?us-ascii?Q?frgz3BmpkCs7ddSVFNoXl9YikzG2KSpdKgOx8I+tf9rrCYSxHz/pK1yqBgz4?=
 =?us-ascii?Q?RMSrkEZrQ2y5UG00FTwJnhp40YFo460N0YPl9XgZJ4vUNifBsGHBt/1HhBY0?=
 =?us-ascii?Q?ZyZztoau8yJq6EAiz7znixF9Nq6D9lxmvFAtDR9zGuFnV0Scd5tDQRnysMq4?=
 =?us-ascii?Q?UHAOoqJjBqBmJhTjUyuWPUOxmLwCY1nFDeQoJK2960Nh8DvNVVz9RquNpMKK?=
 =?us-ascii?Q?YbxzmAJshcmzn0ZNP63nhHYPi/T+d8Rcp8G7yI+k94IB1Jbe93QMvxVwCMLX?=
 =?us-ascii?Q?ydHmVrlsCYVjaWT4Nlj5zgwsZ0cFB9Kv2pkW9y2JDYudL6oXaBm6U5hezUAh?=
 =?us-ascii?Q?FFqRY0qnCnGB3I5qL0VtMpVbbxVHaJOcYP/W60rsTs6gByKad2jwmLuqbZqj?=
 =?us-ascii?Q?o2r0BUL03O8sHtW9p7OEdGlRW/2VitrzoUGXZ+lNu3nAhmKcdAsV2p7tR1Ne?=
 =?us-ascii?Q?YyYlPp/FK8owupgQzZyx2xCkb8UGejEQSbaPCainbvNw2Osg1evMy9mrI7dS?=
 =?us-ascii?Q?Jua0RXgwcGXb7bwJbqkOp2EtZXLIlhY1bJZwEPuidpE2ZS2a3xWW0peF+10r?=
 =?us-ascii?Q?aJXf/hDwIDw5A+LuYanotxEnbeNYu6qyq0giSTk0vOP7TNdxPC6dQrd5vmbR?=
 =?us-ascii?Q?f0425NlpuTPOULw9S9BmFciIcBIqdcP+caKxep+6Nt0pKECqV1DujR9h74Tl?=
 =?us-ascii?Q?df7almjgMsOwpmI6fvxwd5UMiLbS5HvbHJuj0LKQT+F0YwbvHRz6lAd7EN83?=
 =?us-ascii?Q?hk3q4WNH9LMmARERZS8CbXbEFF0bO2rXMzVlCbIUsjTCbINXcej6AXTlPMcZ?=
 =?us-ascii?Q?F1VmUD9NH3o1QLprhMj7PvVCWXcv1NrTCFDJ8jZ/RzLGq47JgyP6hmPD/fv9?=
 =?us-ascii?Q?/AF/ZtKT+OaU1ZK1anV/4WKfC+w9owPbkU8xWBmXaN5IXQxgPkhTRXrdCYSy?=
 =?us-ascii?Q?41b0udUM0D2HKGAnfG9AHQJ9obMBVsF13sBiaSmR3zlv2nxdtm6D9sdlrWYo?=
 =?us-ascii?Q?RUSIDA8mzAAwI9bDGetm1M+XmLQOt5x5+R0YwdFO/SAY87hnQXxBuSS3yeTX?=
 =?us-ascii?Q?pIPf/oB6GF+T02CK95JIMJOJPcNZPx0tK24Mrak6RDrvVA=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?JvxYZTwXc9MvTSeXiiGTe1OWmp41BOj6Svq23u57GH35hztddf6FAmTJz/8Z?=
 =?us-ascii?Q?L3RS+m24amzFZnPTesOqUS/KyMkLFg4Jm+6UFiAocSg0eC1Qyy9g9g6l83RX?=
 =?us-ascii?Q?m64DkTUR1znyNfzqoCOsha4s9nhnXcPb3UPViCsmPqVsvHqOMIB1uAB7UvjV?=
 =?us-ascii?Q?ZXPUg0B/N+FxiziXlvY1uLMzvjnpyHUAshpTgctN28wL7uSLqoP8sn0Sv1V+?=
 =?us-ascii?Q?ufZFWRgbKTUNEm/Q/wrx0SwtlJgalE+Ft3MpKgpi/oyNwfB5+4zi7Elpuq8U?=
 =?us-ascii?Q?lIzICOIEFOBU83ucyuv/O58sReooSnmenm8v7W3F6JgLCa8Oy+NF65uABSKn?=
 =?us-ascii?Q?Ip/kaVJzvbeNKyOK/da+PQQIVyT8qvP56aKYdd+ZhKg0zToG2Y9Oznob0e5y?=
 =?us-ascii?Q?pu1jM2yMx+eqqRHbg45YfYymEnWAY3KyYXAEl+ShZRbAx39UrvMKhwNoyJdY?=
 =?us-ascii?Q?y/sFX3KlX0mW+5mbrHOZLRzWUOG4sK+XkaOVafocskccFrCgNS7hFBEP/fqk?=
 =?us-ascii?Q?EMuP2JdJfW3nnEd060H6KsusVt1cdPDY3C2uAo4LKedLhnZx4qjtASB+6FBq?=
 =?us-ascii?Q?Ge5Wl0aqGtwAAB25ehMJ/p1UQBkuNULijXlmmGshi6VbofSmjr89ZGnZQtJo?=
 =?us-ascii?Q?qKBANz+8VPbLFON5bcr/YXds8LPgw0TFwlEltNchN7mA8nlBAuxQ3XGnc9ij?=
 =?us-ascii?Q?I6vOdZEEjkkOTTpfCJhE4ckG+GZ9wk3ya23HTM+SwYrCxTSvd+9Y+ah7CbgK?=
 =?us-ascii?Q?3Mu2lbDU35vqCcx2PGmXgpJ9AaXTdgu2I7AE3xx0taLb+P6QDnfxwY3+96Nj?=
 =?us-ascii?Q?UAXtwTMLKxP37zlq1oSgDIYGlCHbi2tKPnD3RnCG+cBpzQcy1E2D9BaJJJjt?=
 =?us-ascii?Q?3b8O0hBNEibFiCUyTXeb4s5nUdV5Hk4OrlrwQpfZqIUiyntGe09BjNW2E79z?=
 =?us-ascii?Q?wd9JP7hOq4x2b+O+VYuTnUf7uowuF3V1CjqfZfhxyyYSG3X5S+67XTVfcNn3?=
 =?us-ascii?Q?JmbimXSHQ1ltXZ6Is49BJxNn8tXOaZ+z63rcES3llmbFMWLkMN8VNjV1vrQ3?=
 =?us-ascii?Q?kmWwMXvUQHworUd33BUUaX59nnrZJtsVfF5paJcFC2xbW0zsZY5vx7drzgQP?=
 =?us-ascii?Q?31TMYvPs4ItfMBps9hhcagNr6eYVQ7JUWsHxoZwiUtCVxSv56HZaiXckj2N4?=
 =?us-ascii?Q?ccEp1nhRx/QReTNuhZaKy+6keK9HpdNxzJrYw5SagUistCHZYAmHEDjgTYf9?=
 =?us-ascii?Q?FGM/DaWJWP1qVmW83sN39UO4qLXMrsh1YqVE+79ovxaVsYOfw/oX4QvvkueA?=
 =?us-ascii?Q?FiU0Tyo8u/Z1UIB66ZLAE709zgPf3tt3JsSpeWk/x3Fh4vChQI5jy3ss25xB?=
 =?us-ascii?Q?bDCXWTENZ9lK3A02p5LkQld0/SOCw4kuAVcARnGhA//MCl0F3VG3xgQX1wKZ?=
 =?us-ascii?Q?vi7uM/OpNonYQoEmJ5csl1ZsKDFldmjNS+ikSd3Q521/33qzQu+JhfwcoPX9?=
 =?us-ascii?Q?zhl1HG3zxjXi/DoNNz797ugD/506NnwQgui8fEyfVeLBqZu8OezYFf4APf64?=
 =?us-ascii?Q?tw/B+GAPJ5MlAL70/TujzEGSW+OkXpkBpl4+oQer?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d8161a4-b5a3-4432-aba1-08dc75217c67
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 May 2024 20:56:26.1064 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dBU/vy2/0cG/rB6+HEKlr98Jhc+6cBRv4oypZgKQJ+C+33dAIGEfZLJOwpnuWCcYTg3fexzelErazNUJiqvDLNaPoX5d4WWnwYXgqsZQfRI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR11MB8305
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
From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Matthe=
w Brost
Sent: Tuesday, May 14, 2024 5:40 PM
To: intel-xe@lists.freedesktop.org
Cc: Brost, Matthew <matthew.brost@intel.com>
Subject: [PATCH v2 1/6] drm/xe: s/xe_tile_migrate_engine/xe_tile_migrate_ex=
ec_queue
>=20
> Engine is old nomenclature, replace with exec queue.
>=20
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>

LGTM.
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
-Jonathan Cavitt

> ---
>  drivers/gpu/drm/xe/xe_migrate.c | 9 ++++-----
>  drivers/gpu/drm/xe/xe_migrate.h | 2 +-
>  2 files changed, 5 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migr=
ate.c
> index bacb23de411b..eb52185662f2 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -84,15 +84,14 @@ struct xe_migrate {
>  #define MAX_PTE_PER_SDI 0x1FE
> =20
>  /**
> - * xe_tile_migrate_engine() - Get this tile's migrate engine.
> + * xe_tile_migrate_exec_queue() - Get this tile's migrate exec queue.
>   * @tile: The tile.
>   *
> - * Returns the default migrate engine of this tile.
> - * TODO: Perhaps this function is slightly misplaced, and even unneeded?
> + * Returns the default migrate exec queue of this tile.
>   *
> - * Return: The default migrate engine
> + * Return: The default migrate exec queue
>   */
> -struct xe_exec_queue *xe_tile_migrate_engine(struct xe_tile *tile)
> +struct xe_exec_queue *xe_tile_migrate_exec_queue(struct xe_tile *tile)
>  {
>  	return tile->migrate->q;
>  }
> diff --git a/drivers/gpu/drm/xe/xe_migrate.h b/drivers/gpu/drm/xe/xe_migr=
ate.h
> index 951f19318ea4..a5bcaafe4a99 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.h
> +++ b/drivers/gpu/drm/xe/xe_migrate.h
> @@ -106,5 +106,5 @@ xe_migrate_update_pgtables(struct xe_migrate *m,
> =20
>  void xe_migrate_wait(struct xe_migrate *m);
> =20
> -struct xe_exec_queue *xe_tile_migrate_engine(struct xe_tile *tile);
> +struct xe_exec_queue *xe_tile_migrate_exec_queue(struct xe_tile *tile);
>  #endif
> --=20
> 2.34.1
>=20
>=20
