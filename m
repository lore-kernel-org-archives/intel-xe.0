Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DA53D64097
	for <intel-xe@archiver.kernel.org>; Fri,  8 Nov 2024 23:34:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C90F10E027;
	Fri,  8 Nov 2024 23:34:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Yq9T8Qk7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32A5110E027
 for <intel-xe@lists.freedesktop.org>; Fri,  8 Nov 2024 23:34:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731108883; x=1762644883;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=3vi97Y3Uix8+CkkZMNgoA//CsGlP48Kcovo34l+jmT8=;
 b=Yq9T8Qk7ocjykMf2/G8+7SKdBUt0XZz8EaKxhmg/sjgZ2pk7AjGQybhP
 EICXPMvXxaru9IqyWQrU23zYM2zep7d1sjuBoqBhWX/BDY2RY3bibp6tR
 UnbVY9CRXddVIR4hHh4ky/+RDD+YYLIy3aYqonAuZ0V1w0PZaBWI3iP4O
 XlR2CxUGn4RM87MkPYlL6jMnIcAonIzG1pyKEpLQgXsF0jxHK71QVpNLx
 QMTKTfYDM9yEWo30G6Hgvy2N/hWNoQ6UXcB8DGaFzY3a/dC+JyiDNqf9b
 qfsVlO/zIC+UXPn6wnf3nkCxbBrlpTzN1SSW3+H5p6/jh/3PX+lsyhGwr g==;
X-CSE-ConnectionGUID: kJzGdM5RTNSd6gcf9w48HA==
X-CSE-MsgGUID: 3Eh2mQDnQc+2NFV+nEaPAQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="34694399"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="34694399"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Nov 2024 15:34:43 -0800
X-CSE-ConnectionGUID: zI4eH6H/QMCF4BabRuDjig==
X-CSE-MsgGUID: gDn4plGdSVSgNLdM6i8sRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,139,1728975600"; d="scan'208";a="90633602"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Nov 2024 15:34:43 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 8 Nov 2024 15:34:42 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 8 Nov 2024 15:34:42 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.49) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 8 Nov 2024 15:34:42 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CkL5lBMw0tmsB12ePGjZu8Q5+xv8iRF6X6AEgRHbdUkPBnTHNbudSeANMerh+BP/fBOIh+Z8SfyVNd/ySSad/w/6qAW1JUlMxN4i8U/7huFDywBo7ow/5Ks0C/28+OAaK+4d9TKT8T/APSRYo5QxD6QOHwhgiP/Kn449NCEhNhVZ5iKgpfOuV3iMSYSw4toKX5PIUKGCj3UaEIFxO69DaMsrZz+vxcUzI167bUpQTRl/TkfEWN93WvZwWjkD5PIwtPSdQUgW93aZ1qU+Gx0xY2Db0EN2J9zptVPst+qjA3nCrC2f0LYXaQQWR7uR5Y1ZWYJUMVF7JS0e8rwVHzIdoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J1SWGPWVL2G7Dgc/sDp5FXN1uzlrJHW1ow1xX7VeqFU=;
 b=SiCAivmzWaitJXrQQIrKGdCNiDiMXdWAV7bbJ+/tYN1iu309SuVMB2J26qoxrwA+PCuve832y3Zip/Gg3Cc6zgU2FdDQLsYnF7VtNvc4TF2xhFBNDzYuuRBwb71uqG+oY96WPFMenJGLHEJA2V7vUXOetjXhmnTONZ7oib3Kq4GO90FW8WFrY1JwL9aQ8fBm3IPawdp9TG5FxpWFyLFA5nybwr08IDShTy8yT6GzSz0+RIenyvxiU9bEdmIWS0+o91bpnFfcGrpYWJlwJgOXKSOkRdZGgcUr/6gudb2bWjJoBMA3sumXiNXbJ6tM+JO7TgTsXA9aezgX4e/Kq65XBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by CY5PR11MB6090.namprd11.prod.outlook.com (2603:10b6:930:2e::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.20; Fri, 8 Nov
 2024 23:34:40 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%5]) with mapi id 15.20.8137.019; Fri, 8 Nov 2024
 23:34:39 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Teres
 Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>, "Dong, Zhanjun"
 <zhanjun.dong@intel.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, "Cavitt,
 Jonathan" <jonathan.cavitt@intel.com>
Subject: RE: [PATCH 2/7] drm/xe: Add ring address to LRC snapshot
Thread-Topic: [PATCH 2/7] drm/xe: Add ring address to LRC snapshot
Thread-Index: AQHbMgWw15n4plELRUKWR+L6KunWx7Kt7xmQgAATloCAAAXp4A==
Date: Fri, 8 Nov 2024 23:34:39 +0000
Message-ID: <CH0PR11MB5444A8A2BFD2FF1C0B22CFB9E55D2@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20241108174312.272792-1-matthew.brost@intel.com>
 <20241108174312.272792-3-matthew.brost@intel.com>
 <CH0PR11MB54441F26FE46E5366FEC4EFDE55D2@CH0PR11MB5444.namprd11.prod.outlook.com>
 <Zy6aVcXWot6hBV1n@lstrano-desk.jf.intel.com>
In-Reply-To: <Zy6aVcXWot6hBV1n@lstrano-desk.jf.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|CY5PR11MB6090:EE_
x-ms-office365-filtering-correlation-id: baba0520-7383-475f-0311-08dd004dea29
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?vDWwBKQK0SquCbMhq1i40naiqbAmYIgooGvARVqEnYoefT0CzEKb57N/Qraa?=
 =?us-ascii?Q?SvbS1E6ab37SZv713ZexHzA33ma5udlqYib71UYIyr7bxcKYzllT2RuyMGv+?=
 =?us-ascii?Q?GE88r+7dMHu2viKk1V0yNzbPzs6+hDGZG7GNL0H0E3EHMPCwX7Y9ZD1U8fzm?=
 =?us-ascii?Q?EBMCqzGrkyTAhyQaRcrZtu8HDhsVzAcyi2QxsrxQ4vdmoX9jNqltxsR7EBnf?=
 =?us-ascii?Q?Zx5W2zdHgsSH0ar4ZvnFACOpDEQfTD4lXcYW4R4/9lqt0RfLvm7Bh1cZgyfY?=
 =?us-ascii?Q?PVElbSGdsqB9kQz9e7vE3JZyP1/YCK1UN8H79ztHqLVF4GnksRAFy16zADLc?=
 =?us-ascii?Q?HYA9yOLYcWBqtqAlUwqo9Dr0u8gi8FriCObLnVJwHZIx9JU8bZ/+JJ25WDTT?=
 =?us-ascii?Q?vjS6KjvVFKmYQUVUXOT35DZ36WG8eVMC/3Blky6n7SGshcngmC3dxzYyQhb2?=
 =?us-ascii?Q?qARzH/16n1prQUVI+8kCPFpG0JLETNfVHQXJ+BUwdPwquF+xjyC6CRhJTNyT?=
 =?us-ascii?Q?g0tFv6osaFe5MF7oCRUUMukgZkjV0f//HqtHeLgj9X3KjzMW9JrQLWFjtE6z?=
 =?us-ascii?Q?HRDcJRvlBaiWJOroQZUDkVJaeXUogkXcL/X8O7fL6Q17YmMKKy7tIjR8hQjD?=
 =?us-ascii?Q?9I0XDyRcNW68jbtBDWFRFsBuCbBlW8UrCKWHu4oX0OY/qhKFdbkftrrLUIJD?=
 =?us-ascii?Q?pND+RlsuI4g1eUbUfKx+tCbRxQxMHRWJPu2tCBh4gm+ZTKBbZpNV6c8YANyk?=
 =?us-ascii?Q?hrkXTkqs3kqXaunt0UYDkz/2JGWX0s9TpoVGMJ04xoC34tPkazLTDeEN+pHg?=
 =?us-ascii?Q?rK/krqRHFx25t5HpV11jfxD/mQMSirtFKNklC+XwTbyUXVi+Ogz2ICnHr3C+?=
 =?us-ascii?Q?PGAGsjMJjW4/1C/3CuqSYpH4WsQD78FMXHIQnc7z01G1LcBLGT9cBISnpm8j?=
 =?us-ascii?Q?siKLwbmFRBvPUwpsFUvKBmdVMj30BlnHXagDIP7fuuPJAaV76HOQCLyKLOrG?=
 =?us-ascii?Q?R13zGp0bMgvy/o01nY92kQYmiD696n+4VkbKjL2yaj+nB0DfyZMpVXdG6lbw?=
 =?us-ascii?Q?fTzF0ThdEMeQ+kogWLnjSXu9spmqWLsLrxeKjJ3mEkZzO31FtJzfe3ZdZ4OQ?=
 =?us-ascii?Q?MU3f0X7fVRZx5dxIV1akSy5SeZS9VrL6zh/Gmpv6FHHvTP+F+Jnpeyombqb2?=
 =?us-ascii?Q?Ks07cOvS0qNnDh1MsgSWlDlSSyF5aARNEubzYYnW4yTreGNDW2d2mMHOdJ+5?=
 =?us-ascii?Q?dExW6mnIsWlkRh2YdEvXT0MPl9ShJJPMIzjOI8u4aH7+YguVRpKUULG1WsYh?=
 =?us-ascii?Q?9W9J3RxbA0ES14ufJB8sYZI5uY61KinyWEJb9MsElEORRhaRg6ZICTh+jizJ?=
 =?us-ascii?Q?9CYITaI=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?iXk9eUTTW33Cm8en4HHm8nmNivcCQczKOgtqk7a10wPtMhn948rC/Tlc311h?=
 =?us-ascii?Q?UdBebqnC4/DJEGUveQ1/jtLlk6vmHq7bEgMhcHcTLJ29dsIK0+LMmWLtcB5R?=
 =?us-ascii?Q?qLqwWfH1DqntObazLb6yfToNvx48Vhf020rTi5miZ+iYhYA8eFdNRnu/TYn8?=
 =?us-ascii?Q?Dsi8uMr9S3RM1q9ZoAfyR9nqgvhLG/PAT7okbVKlprantmcK9EXf9T4oGedv?=
 =?us-ascii?Q?jgspxsdOySekBRY1wNyELFVeLi4Sm4vuu8kNu+RmTkcEWlMJTVW07OfFIY8Y?=
 =?us-ascii?Q?M/5kzDQcGKRtQPb2ff83eHpRfRuYYJxTKKBEXsyUZ3OBKOkxBbl/SLb6edmt?=
 =?us-ascii?Q?RKYeEcMVerNfU6l8q4tCca5e2IHLtvOagGezGmVnlzF+xHcQCfmdplPJ9yRi?=
 =?us-ascii?Q?fS7xo0VuidcBOP7N4iGTx4u2XqJ1l5hVzwIwTrU1DU0NVuRtk7ecAKTRKrC0?=
 =?us-ascii?Q?mY1rpYtfQDRBlKRAMZ2qH3TL6d64QR+lw12dc8AluM0ORbkN34mzTYRSHMCo?=
 =?us-ascii?Q?Wn9iUfwp1TkS8GBsSGZnNQj5bFoq/D3OyxefGvt6H1KQalERIVA79gfyPetY?=
 =?us-ascii?Q?H02A6NSCmU9LO44AYhB0X8vKV8MBIVnVr+7DwXZy7Huc4S0x4lZ9VWtZU1Rc?=
 =?us-ascii?Q?5vPFo0kAtt3EvNmA5+umkDCGDHtjGjcIU6lR9G/cYp3ZdBO9taH/REA+Z8gT?=
 =?us-ascii?Q?JefgmrOdko+qOGSzkqWXrPBZ2+ytlK1SbBImMXYFe0HwsFuxQdHCFkT5cNpX?=
 =?us-ascii?Q?C7OWXeXillq13X+2t5iqgExNPC4KE0jqu5aaZF2/5cMcyTggSRR/yAVTtsKi?=
 =?us-ascii?Q?idkOkzIjLjwA1k+6a+nAz6Z6rmN4lO9TnOJrfnkLrjGtGgsY203x7VQ3R/29?=
 =?us-ascii?Q?cqMfvL609SjBrG0qPBK9rr9K4fQGNk2y1ntcDpOlUwlO05C+D/1jGuVhThJ/?=
 =?us-ascii?Q?A7fkM6nkf+SLnQ0DsWpKPh0ZXkMAzYNZVY8rL+YarommODAetvamFgUAOnb5?=
 =?us-ascii?Q?KV5xTRb0VZSUgiUMnTKp6eSF+m7jtWRZa8/cITPC+aGKSfD5VcRCgxZVrs5o?=
 =?us-ascii?Q?GCSAHjOMAPvYXOG5ty4t1dr/7BNQylHGmjD+NsgJpa39AFhFrdx5+MM0rIbA?=
 =?us-ascii?Q?KZHEH7GkUpTIS5FG0/IjRBxQ69H3AlnX1rcm0wHZDigm0yXETaNsW5oy8Bq5?=
 =?us-ascii?Q?d45GO8eRBTUQ8O/z/W9uLC43hlLjQerz3nZD3w5McXwcLMyxbzuGB4cqjUvW?=
 =?us-ascii?Q?pA2cEaAJ9MD1EHPyXbpcq1SdMdJkqMGCFzLKmwxVPCY1wqMpUPVTH3f+/Jld?=
 =?us-ascii?Q?WtmaliZMQg/sjRT0iEx4O8PUwMcaFLAB5n9Pz2PNCIGWFtLheapVbT7vi1Je?=
 =?us-ascii?Q?zN597HFZqun967SusCqTneGVwPszc0b/cb+kLqR74F6A1wq9YQ8VzyiKKKjN?=
 =?us-ascii?Q?Q+bYpJLq27E7jEFgJiLMlB/C7yUilT+/nJtsfbDdXtcfBc+SDGD8PiCjphSh?=
 =?us-ascii?Q?CFU3gJNshAEYs/Ab7vV9G6Twgx9r5NE1h36ByRNZC971L0iLlewmQLhGVR0p?=
 =?us-ascii?Q?kuu/WBW75u58NRpo/kga8YtfnKgKb/LqrGpY4WUh28NYmNn0lOWJ/R9wQblS?=
 =?us-ascii?Q?gQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: baba0520-7383-475f-0311-08dd004dea29
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Nov 2024 23:34:39.7112 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LcixU0pKahEzu5lqb36NbPgME9uYKNEo1sz/519nUrqKnPjLA3PaR2AS7ee3wCUSQG3AFrGNjzZnjyEKjMcU+09eqwXD3RGffk5sX4dHi1c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6090
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
From: Brost, Matthew <matthew.brost@intel.com>=20
Sent: Friday, November 8, 2024 3:10 PM
To: Cavitt, Jonathan <jonathan.cavitt@intel.com>
Cc: intel-xe@lists.freedesktop.org; Teres Alexis, Alan Previn <alan.previn.=
teres.alexis@intel.com>; Dong, Zhanjun <zhanjun.dong@intel.com>; Vivi, Rodr=
igo <rodrigo.vivi@intel.com>
Subject: Re: [PATCH 2/7] drm/xe: Add ring address to LRC snapshot
>=20
> On Fri, Nov 08, 2024 at 03:05:34PM -0700, Cavitt, Jonathan wrote:
> > -----Original Message-----
> > From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Ma=
tthew Brost
> > Sent: Friday, November 8, 2024 9:43 AM
> > To: intel-xe@lists.freedesktop.org
> > Cc: Teres Alexis, Alan Previn <alan.previn.teres.alexis@intel.com>; Don=
g, Zhanjun <zhanjun.dong@intel.com>; Vivi, Rodrigo <rodrigo.vivi@intel.com>
> > Subject: [PATCH 2/7] drm/xe: Add ring address to LRC snapshot
> > >=20
> > > The ring is currently in LRC BO but this may change going forward.
> > > Include the ring address in the snapshot protecting again any future
> > > changes.
> > >=20
> > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> >=20
> > LGTM, though the terminology we're using to describe the various ggtt a=
ddresses
> > as "descriptors" is a bit confusing, even if it's consistent.  I wonder=
 where that
> > terminology came from?
> > This is just a rhetorical question.  I'm not suggesting it be changed.
> >=20
>=20
> LRC descriptors is name copied over from i915 and may even be in the bspe=
c.
>=20
> But yea, indirect_state_desc and ring_desc are bad names. Will change to
> 'ring_addr' here.

IMO it would probably be better to leave it as "ring_desc" for now as it's
consistent with surrounding struct members.  We can do a pass of the full
XE kernel for inaccurate uses of the "desc" qualifier in the near future an=
d
fix the naming scheme here as a part of that fixup.

My RB still stands either way.
-Jonathan Cavitt

>=20
> Matt
>=20
> > Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> > -Jonathan Cavitt
> >=20
> > > ---
> > >  drivers/gpu/drm/xe/xe_lrc.c | 3 +++
> > >  drivers/gpu/drm/xe/xe_lrc.h | 1 +
> > >  2 files changed, 4 insertions(+)
> > >=20
> > > diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.=
c
> > > index e219657535cf..afb0f4f44748 100644
> > > --- a/drivers/gpu/drm/xe/xe_lrc.c
> > > +++ b/drivers/gpu/drm/xe/xe_lrc.c
> > > @@ -1636,6 +1636,7 @@ struct xe_lrc_snapshot *xe_lrc_snapshot_capture=
(struct xe_lrc *lrc)
> > >  		xe_vm_get(lrc->bo->vm);
> > > =20
> > >  	snapshot->context_desc =3D xe_lrc_ggtt_addr(lrc);
> > > +	snapshot->ring_desc =3D __xe_lrc_ring_ggtt_addr(lrc);
> > >  	snapshot->indirect_context_desc =3D xe_lrc_indirect_ring_ggtt_addr(=
lrc);
> > >  	snapshot->head =3D xe_lrc_ring_head(lrc);
> > >  	snapshot->tail.internal =3D lrc->ring.tail;
> > > @@ -1693,6 +1694,8 @@ void xe_lrc_snapshot_print(struct xe_lrc_snapsh=
ot *snapshot, struct drm_printer
> > >  		return;
> > > =20
> > >  	drm_printf(p, "\tHW Context Desc: 0x%08x\n", snapshot->context_desc=
);
> > > +	drm_printf(p, "\tHW Ring: 0x%08x\n",
> > > +		   snapshot->ring_desc);
> > >  	drm_printf(p, "\tHW Indirect Ring State: 0x%08x\n",
> > >  		   snapshot->indirect_context_desc);
> > >  	drm_printf(p, "\tLRC Head: (memory) %u\n", snapshot->head);
> > > diff --git a/drivers/gpu/drm/xe/xe_lrc.h b/drivers/gpu/drm/xe/xe_lrc.=
h
> > > index 9d64cedc4d14..a2058a501353 100644
> > > --- a/drivers/gpu/drm/xe/xe_lrc.h
> > > +++ b/drivers/gpu/drm/xe/xe_lrc.h
> > > @@ -25,6 +25,7 @@ struct xe_lrc_snapshot {
> > >  	unsigned long lrc_size, lrc_offset;
> > > =20
> > >  	u32 context_desc;
> > > +	u32 ring_desc;
> > >  	u32 indirect_context_desc;
> > >  	u32 head;
> > >  	struct {
> > > --=20
> > > 2.34.1
> > >=20
> > >=20
>=20
