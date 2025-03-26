Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAE26C28B30
	for <intel-xe@archiver.kernel.org>; Wed, 26 Mar 2025 04:14:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 866FB10E2AD;
	Wed, 26 Mar 2025 04:14:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CnLPclpS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C657910E2AD
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Mar 2025 04:14:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742962477; x=1774498477;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=pC7T8it8aPfZPpDeluLYrELeX0/fNp1kXfe80dDl9L4=;
 b=CnLPclpSroqd3zCJKvTcxx1gFUeyxhJ4T38sA2IxErdtTbOb0vIYlxrw
 YAefRNmC1kTkqfe+HVmQim6WnRe8oMyp6vdlBRZy0OlAG1SFWdDgQiXFC
 fIWjFFQR3ZPN09wNn9z4KjY3GG10kyuk6bDQNIXYtMF/ipVnjndYeKso/
 eyw2blr08VJsZaDwEYP25ETwfMJTUKOO+A0gYIAlXg3nA6/PJ3tSWuFNK
 sLEk4E98ZZ/UPx/t2OhrCftyPJluO1oDPJb8BFeNbD4ecVEMG/JCH1uAE
 5FsENXfTXWPpDPW+ScsFl4dyqE3zyXHNd3ZLcxnfiPJrnENyW63H/nFVh Q==;
X-CSE-ConnectionGUID: SKlhYSZzTD+X1FhTT72uSQ==
X-CSE-MsgGUID: QwWK3oo7Sm2eXRe60Rau3w==
X-IronPort-AV: E=McAfee;i="6700,10204,11384"; a="55226240"
X-IronPort-AV: E=Sophos;i="6.14,276,1736841600"; d="scan'208";a="55226240"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2025 21:14:36 -0700
X-CSE-ConnectionGUID: RTASR1X1SMyLq8vwaPEGvg==
X-CSE-MsgGUID: +Hs2gqYATbS/UaNt4Aa4Zg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,276,1736841600"; d="scan'208";a="129793961"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Mar 2025 21:14:36 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 25 Mar 2025 21:14:36 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 25 Mar 2025 21:14:36 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.175)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 25 Mar 2025 21:14:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V5rEMZlrmb0wRVn+reLHEwkoi3/faAlGIYfdC3rz1KeUhLuvlmaO2rX04dUqy99zi/gB/b4VFyc4gvBdlLHlPjtmpmYR39CwJksUl3tGqtEBnehD0BF6PCVTOeFdzGiOD0uCnmEgXbQXuz8+ii8eM0pB1FlrxXDxmyX6XthvMdo/08hQoS0PkudOf0owTzehVnzEtWBAlTr5Uj13cgTrHu2Ncv4WzsNn1ClxnQykfkM8EwEV02lyn29ADDNDViGONt5xRDXZUYEqmyUJrw1ZKBVVij1L3WbcD/fjzfxdEAnz2/5x/ZgDdUNxU7Uhuq8ba3s7FsUue1qde7fDD0RNtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mkAgAzbJCkQ0Yfos9Uc01/F5YAj4H/FRrlAm/a8KG/c=;
 b=aJioJ5rgkm6y4/raFtT2HRbzG8EDCfApKM0GLxpeh2XNogCTQ5ESobS1bOkf0PGiUchdy0ae3PQSsMXkbBEdapiM6OGTU7RmlWTZmH0kOQc1bl/ITgOsyRWNTtNiq2M5BCIkbY2wyKltZwHem6PXUyWYRj2WvGgIEBT6i2DQJHPfzznWuYTxd3fNHOXTtXuke8E+vhuYC8AiBpvQa2WrDRTiEC+gHFlTlzo8Wa9fXzOK4que9Q/V2jh3xP/Tg1Zt/RyWN+FQp7hl6IoJoPm+vhXalXSz28QZjOe+1ayJ+SUVqo3XvCFWTM4hrdAUxhAGL0bYeXRS8erwwQrlSn2nSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com (2603:10b6:a03:459::19)
 by MN2PR11MB4517.namprd11.prod.outlook.com (2603:10b6:208:24e::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Wed, 26 Mar
 2025 04:14:21 +0000
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762]) by SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762%6]) with mapi id 15.20.8534.040; Wed, 26 Mar 2025
 04:14:21 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
Subject: RE: [PATCH] drm/xe: sysfs_ops needs to be defined on parent directory
Thread-Topic: [PATCH] drm/xe: sysfs_ops needs to be defined on parent directory
Thread-Index: AQHbmMdeG+ib0QKjH0iieC2Qjdkym7OEQi6AgACVJ1A=
Date: Wed, 26 Mar 2025 04:14:21 +0000
Message-ID: <SJ1PR11MB6204E7681720F3D6F7FFA94181A62@SJ1PR11MB6204.namprd11.prod.outlook.com>
References: <20250319121349.288844-1-tejas.upadhyay@intel.com>
 <Z-MAJWTFFlbaZZcj@intel.com>
In-Reply-To: <Z-MAJWTFFlbaZZcj@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6204:EE_|MN2PR11MB4517:EE_
x-ms-office365-filtering-correlation-id: 66c4eab6-6c47-437a-721a-08dd6c1caf49
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?owbelrsk1KVc3xJoq8jxyhADRwA35ottJUVnbbid3LqG8AhqlN5I3yPmr2nR?=
 =?us-ascii?Q?IWbw8YkTzSt/X6FSqjN3VMu9HHGLZUjXFBJBOVP9W0c0weIHtCXX5Q8GnesN?=
 =?us-ascii?Q?YmTo3h+VbI0QrwpWTdkj/l3DR8AiM9km24YRspCBox7Ofd+VV5xRyfOk/dNV?=
 =?us-ascii?Q?4siYsPi2A+R0AQlBs39ovQXpKsvKBsktkBQrCFIFfxs4s0xCUk87yGIVRvn3?=
 =?us-ascii?Q?HgsBhTmDj3j6n6RaTX7lcAF4K1dRREG9yVFDae/wZZVMuXZFPUkLO6Or8Pfi?=
 =?us-ascii?Q?JOisconxxz3NXUVEbjyOwcTrHytarbuCqTyBiKeAo6iAQvnLeUqvO09wCSLd?=
 =?us-ascii?Q?NQ3+GeJv4kPKj5QFLwQl3OJ8ARdwBCZHT8U54Q0yxfY8LoMRGQV+lwbIjq5q?=
 =?us-ascii?Q?4848zvv1ZgqCVEYVbL9/gRrxtF6HNJjOfmptuoP/pSUa7g/gH2YNzOE4eteD?=
 =?us-ascii?Q?Kjx4AIs7Rv5xJT85ua7GRl6OQuJx4sB0dAehat3GaMQbea37Swgtl2x0xCHJ?=
 =?us-ascii?Q?jD8mdqbS7vclu6ltDKxdRR7UyOSOoJ3qinQyk9fIH2Uv87cHNN0ZDuC5F4vM?=
 =?us-ascii?Q?O5of2+JA55xB6VKNktpPelzqnncsceR9lkMs8PGwVefs7jodx5t0GYpYl/9W?=
 =?us-ascii?Q?UO1gpdZ380MjPWxr0uE6UoReYveBxzvQyDeGOnlpCA2JoXBQHee6j7QOC8DN?=
 =?us-ascii?Q?cmNrsb3EMUdruPzDxwd5f0SLlWHL028/1sdt6le3Xe/lbG3C0fUm4h7oIUsW?=
 =?us-ascii?Q?tUWaTU5SCCUdu8TFrg166NCj4GQkfCZp7A4fImtBthUSS4HjICV0ru7hcYTi?=
 =?us-ascii?Q?TWgjw5ZS8LIrn6T/9PGBflH2VhtkdkGbCFuBQf5n/vE8dR3Uw9sJcaKBXTWv?=
 =?us-ascii?Q?4LG4iOFG7EMkOzOSYRnZWavo1Qb6FB1nFVAJPpOa/mIehoVgFEU+UHKPvts5?=
 =?us-ascii?Q?4Bwmfj4aosEmqmNN4MI3BeEgPu9lv23aaBwswGyPcG6LFUFfGtqzmtbQ3QEN?=
 =?us-ascii?Q?wakOzhSZ3u8um22HE6LSP+Aqyp+NYc2XtjBuTtNyh44e5tWJTjGxQRdinASU?=
 =?us-ascii?Q?8F1jfB/ll/dcq/VyQb7yuoSo6sZqoh1ItVizSnfH/YCHpxgjoI5YyRxwRGFy?=
 =?us-ascii?Q?CghFgbg2T0FCUeMROGr+6bltkbJnXgBtxEs5RGeEetqJTuDBNT6vMtmI2Ah5?=
 =?us-ascii?Q?HMkOjtLIjtc3qeWcQBxtdOBENkN0gfp9l08t6Taug8bUSNdQ1Kroy+8idkWZ?=
 =?us-ascii?Q?ZJ9r93u8YU83t5LOwa46lheMScLUAwvaCRzSKAe8PXF3rOiz8iN9FSVmQYvx?=
 =?us-ascii?Q?2ZLi9YMGR9OIqKdM7FkcmrCYqbjanL5Zz32gwAlUaYaNYrX7DJzBj2IJm73l?=
 =?us-ascii?Q?jQqrpQuiTypakUpE+ywb2Sq3kEcwzw8FsO09ZlE7oQ7prL21bYI7hCD8+aCV?=
 =?us-ascii?Q?Be1WF4iY1MyovShWTQblr8KvKNj+j8/3?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6204.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?MzxpQ/F7X+KkLwIKTPP42foJHV92rPoUU8MwmdC7wTzakVBec4HpxT1s2Kjv?=
 =?us-ascii?Q?8kbdyZJ9ZGolfbI+qjEzLFI9kjsSCyjdF/9l7wucb9yln2lkAfaisc9NDTuX?=
 =?us-ascii?Q?LM13rUH03H6K3hrHzp3R4frR038c5o59atFGnwdde+9UBPbDLs+7cq//WPWk?=
 =?us-ascii?Q?GPSjnewg2d2jSSSBymDkb2UdStAFAII/F4ahFZq1X9THlmfwNI+NxPPzn7gD?=
 =?us-ascii?Q?1YmuqAMH3BjIYBlSZQYHN6L/IuVt7aQAvX7Zzq3S/2r4UY+wiKObQfRuSAFm?=
 =?us-ascii?Q?R40/Z8vgCpZA9oqX2cNnon5nE+M4XF95o54xOu0R3x2PHrwDgll+VkeQxoMV?=
 =?us-ascii?Q?m2vuUTpqQDYheqlg90W1rblXzvACoU4pcgu3YkOd64nI99PsRpd4L1naxuxS?=
 =?us-ascii?Q?XaOkDuKN4eevmVLSA4JxmP2Pz+kp3OdDNgVm0lptnvR/sbXMvC05NO5p828G?=
 =?us-ascii?Q?zljgza0f7TeoRfZuoNGUvkKXaO+KLBVAXWyzlSytasVy75xKINbORCHQ5EPW?=
 =?us-ascii?Q?t9cY/0ZK+XFHxz24BynPL1PCfLJMCSWTa2yyGnLblKlBqCfKN+1BVc14OMMz?=
 =?us-ascii?Q?M48CPk2BJJdKLp9xhwSXdJ/4UXfLA0yUWG0REW5ibCtXt0K9KNcNJ4f93Lqc?=
 =?us-ascii?Q?cV8fFt27cOfFutbklYyNyLLFDihVEBZAS0R0R9MKABT9tvX3fL0RUEw4T8vr?=
 =?us-ascii?Q?ayOPw4AYcbisDyv+AUtmHvX9UjLSywimcQrxJQQ4D1KpfV68UFWNSNltq0gc?=
 =?us-ascii?Q?dTpG5c8YspBQ9EWQZD0KhwLhXxem/8Lg+3020mMENUv/kpDb5jG7B4HTEwbd?=
 =?us-ascii?Q?/wWAHev0YJ3Ke+40z2gLq70RVt1s7QLYgkO9G83Qz+A59RbAf5ACg6pPqDH6?=
 =?us-ascii?Q?nOnhCQ+jftxT+8nqJXr8nMRrUqFysIxmnKzlaQDaR19lx7s++XJzr+s+2TuY?=
 =?us-ascii?Q?ZhU5daQCc4O/3DbhAn/kaRujmKGcL1YDT7NbOKdBT7eQYHFkKq+SPMaFfmOk?=
 =?us-ascii?Q?3JYJH569n+zr2OLxJtxBguXvoB9XUJA9RmGlYb8Q7iBFNwgUgmZj81pdTdAr?=
 =?us-ascii?Q?shW7IH04kSBa6vv8o2onNQiF95JcEbPUXOramf4oIdyPYwud3dVdwGXBGlnH?=
 =?us-ascii?Q?Lnc5zhdKpknFNfe67QdbnZts6JXvD/GwcokuHE0JTPq1+ZAVae8vYDusuY2E?=
 =?us-ascii?Q?pYlpW8i3EmdwXZo3Hm0j+dI4RaO4otKILixP1rJDzcOOaD586mdtuZTtBSBT?=
 =?us-ascii?Q?xs0tWuJKpxeSXnRYKchZ09PEb8Fs9hKIwIYKUPsQ9APlw8rV4bhBFXQI/gwb?=
 =?us-ascii?Q?gJH9NFMZAFZnX8UnqJnucE9ZaySBBYfVoSeXhxCVMaGttHvdn/iQMhqvcjLZ?=
 =?us-ascii?Q?+5LN8Mj1l6qy6540C0JXXKWU2d/Zx6M0sVlVKbKqPS+QjCWmfZCGTcBe6wqw?=
 =?us-ascii?Q?oZXZB+DgW3d+PVqR7yPHzMSDzFJJZWA7HYwcPtde27ymXF1CznA2pqKQ3IHI?=
 =?us-ascii?Q?R/medjSOPM/bpfhe2PezNfklBSd/gD8T2tK/QHHGoZspZwykwfc273nSwLyF?=
 =?us-ascii?Q?/Wl6lSbhdaVlot8EdKYINZPR6yN3FzwxyhFcNLT6?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6204.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 66c4eab6-6c47-437a-721a-08dd6c1caf49
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Mar 2025 04:14:21.2074 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YViByUqApN0yaWqIIKH8ccetIp79SmEDqiZyJColRJysyi1acjgb9SUBfK2rKeA/Q/GM8dLqet8HlrlOjxQ9xAJLHfBLr545pQQPB3Y/ifU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4517
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
> From: Vivi, Rodrigo <rodrigo.vivi@intel.com>
> Sent: Wednesday, March 26, 2025 12:43 AM
> To: Upadhyay, Tejas <tejas.upadhyay@intel.com>
> Cc: intel-xe@lists.freedesktop.org; Ghimiray, Himal Prasad
> <himal.prasad.ghimiray@intel.com>
> Subject: Re: [PATCH] drm/xe: sysfs_ops needs to be defined on parent
> directory
>=20
> On Wed, Mar 19, 2025 at 05:43:49PM +0530, Tejas Upadhyay wrote:
> > Currently, xe_hw_engine_sysfs_kobj_type is defining sysfs_ops on wrong
> > directory. Sysfs_ops needs to be defined on immediate parent directory
> > to be able to called on each attribute set/get.
>=20
> Please bare with me, but I'm having a hard time to follow this reasoning =
and
> the patch, why, and everything else going on here...
>=20
> >
> > Fixes: 3f0e14651ab0 ("drm/xe: Runtime PM wake on every sysfs call")
>=20
> Why this patch is claiming to fix this? Please note that this mentioned p=
atch
> just replace the default kobj_sysfs_ops per the new introduced
> xe_hw_engine_class_sysfs_ops. They are basically identical functions.
> The only difference is that the new one call our runtime pm wrappers arou=
nd
> the calls that we need.

Earlier we were not doing any common ops for all attr set/get, each attribu=
te has individual setter/getter. With 3f0e14651ab0 ("drm/xe: Runtime PM wak=
e on every sysfs call"), we introduced common ops on all attr set/get and w=
hich is must to be called now. Thus I though of adding fixes. Please let me=
 know if you guys think otherwise I will just remove, not strong objection.
=20
>=20
> It never touched anything that this patch is touching below.
>=20
> Perhaps if we also need on the sysfs on upper directory, perhaps we need =
to
> also replace the default sysfs_ops on other places like in the upper dire=
ctory?
>=20
> > Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c | 67
> > +++++++++----------
> >  1 file changed, 33 insertions(+), 34 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c
> > b/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c
> > index b53e8d2accdb..25592f178482 100644
> > --- a/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c
> > +++ b/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c
> > @@ -492,39 +492,6 @@ static const struct attribute * const files[] =3D =
{
> >  	NULL
> >  };
> >
> > -static void kobj_xe_hw_engine_class_fini(void *arg) -{
> > -	struct kobject *kobj =3D arg;
> > -
> > -	sysfs_remove_files(kobj, files);
> > -	kobject_put(kobj);
> > -}
> > -
> > -static struct kobj_eclass *
> > -kobj_xe_hw_engine_class(struct xe_device *xe, struct kobject *parent,
> > const char *name) -{
> > -	struct kobj_eclass *keclass;
> > -	int err =3D 0;
> > -
> > -	keclass =3D kzalloc(sizeof(*keclass), GFP_KERNEL);
> > -	if (!keclass)
> > -		return NULL;
> > -
> > -	kobject_init(&keclass->base, &kobj_xe_hw_engine_type);
> > -	if (kobject_add(&keclass->base, parent, "%s", name)) {
> > -		kobject_put(&keclass->base);
> > -		return NULL;
> > -	}
> > -	keclass->xe =3D xe;
> > -
> > -	err =3D devm_add_action_or_reset(xe->drm.dev,
> kobj_xe_hw_engine_class_fini,
> > -				       &keclass->base);
> > -	if (err)
> > -		return NULL;
> > -
> > -	return keclass;
> > -}
> > -
> >  static void hw_engine_class_defaults_fini(void *arg)  {
> >  	struct kobject *kobj =3D arg;
> > @@ -611,6 +578,38 @@ static const struct kobj_type
> xe_hw_engine_sysfs_kobj_type =3D {
> >  	.sysfs_ops =3D &xe_hw_engine_class_sysfs_ops,  };
> >
> > +static void kobj_xe_hw_engine_class_fini(void *arg) {
> > +	struct kobject *kobj =3D arg;
> > +
> > +	sysfs_remove_files(kobj, files);
> > +	kobject_put(kobj);
> > +}
> > +
> > +static struct kobj_eclass *
> > +kobj_xe_hw_engine_class(struct xe_device *xe, struct kobject *parent,
> > +const char *name) {
> > +	struct kobj_eclass *keclass;
> > +	int err =3D 0;
> > +
> > +	keclass =3D kzalloc(sizeof(*keclass), GFP_KERNEL);
> > +	if (!keclass)
> > +		return NULL;
> > +
> > +	kobject_init(&keclass->base, &xe_hw_engine_sysfs_kobj_type);
> > +	if (kobject_add(&keclass->base, parent, "%s", name)) {
> > +		kobject_put(&keclass->base);
> > +		return NULL;
> > +	}
> > +	keclass->xe =3D xe;
> > +
> > +	err =3D devm_add_action_or_reset(xe->drm.dev,
> kobj_xe_hw_engine_class_fini,
> > +				       &keclass->base);
> > +	if (err)
> > +		return NULL;
> > +
> > +	return keclass;
> > +}
>=20
> I couldn't spot any difference from the both chunks above. So this patch =
is
> more moving things around than doing any change right? perhaps a differen=
t
> patch or a mention on the commit message itself?

The change is, immediate parent directory should be defined with attr_show/=
store ops if we want it to be called on every attr set/get call. Currently =
we had sysfs_ops defined on parent to parent directory which does not get c=
alled on underlying child's attr set/get call.=20

Tejas
>=20
> >  static void hw_engine_class_sysfs_fini(void *arg)  {
> >  	struct kobject *kobj =3D arg;
> > @@ -640,7 +639,7 @@ int xe_hw_engine_class_sysfs_init(struct xe_gt *gt)
> >  	if (!kobj)
> >  		return -ENOMEM;
> >
> > -	kobject_init(kobj, &xe_hw_engine_sysfs_kobj_type);
> > +	kobject_init(kobj, &kobj_xe_hw_engine_type);
>=20
> now it looks like this is the only real chunk of this patch, last touched=
 when
> you added it:
> 038ff941afe2 ("drm/xe: Add sysfs entries for engines under its GT")
>=20
> And now, after this patch, who is now using xe_hw_engine_sysfs_kobj_type?
>=20
> Looking further to both types, perhaps we need to kill the
> kobj_xe_hw_engine_type itself in favor of the xe_ one?
>=20
> Or perhaps we need something like this:
>=20
>  static const struct kobj_type kobj_xe_hw_engine_type =3D {
>         .release =3D kobj_xe_hw_engine_release,
> -       .sysfs_ops =3D &kobj_sysfs_ops
> +       .sysfs_ops =3D &xe_hw_engine_class_sysfs_ops,
>  };
>=20
> >
> >  	err =3D kobject_add(kobj, gt->sysfs, "engines");
> >  	if (err)
> > --
> > 2.34.1
> >
