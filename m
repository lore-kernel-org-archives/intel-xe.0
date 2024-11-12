Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1054AD597A1
	for <intel-xe@archiver.kernel.org>; Tue, 12 Nov 2024 20:16:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEA7B10E148;
	Tue, 12 Nov 2024 20:16:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ddLCnOlj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0992C10E148
 for <intel-xe@lists.freedesktop.org>; Tue, 12 Nov 2024 20:16:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731442611; x=1762978611;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Vrb1JOb61U61IVdhAKAd4M8y3/VIQA91tC+evvk7gAg=;
 b=ddLCnOljNOA0u6gnJpZ+ralgKF0KsxpjFGVd0grK9amDCo4I1XDODNXR
 l7hm47r6J5GyA69niTrXbH1JcwKqJcIrDwu+PCaFHiT5ORwuKFhYwtNQD
 DAqq+XlEeo07i/OVjJq7+3Jxh5pRXBVq1/Z3jJ54gFz2pmVgE24aVDDWO
 KcdklEptUiUSMw5lM1IK7ymNyrHVn6DYfeP+5uYBJJoA6xjpkodySQoHG
 a71iJ8TlQqvUX1B3KR0GagqdfjRr7qjQ2CDzGe9Y+DQ5oyA9QqgLcO6tm
 NG2Tpn+erVxZbC8VxBthoozxUsZCBpxXHKDX6zkfhs+45B528XkIurZ9e A==;
X-CSE-ConnectionGUID: TgZLGygtQmu/mx3w+c0Rbg==
X-CSE-MsgGUID: ABWej3DbTuWKV9G9qI8lWQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11254"; a="42710248"
X-IronPort-AV: E=Sophos;i="6.12,149,1728975600"; d="scan'208";a="42710248"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2024 12:16:51 -0800
X-CSE-ConnectionGUID: ZWB8kcU6QbKg1oGyDhpibw==
X-CSE-MsgGUID: FgteXaKdR7Oa23I/klI2Bw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="92567198"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Nov 2024 12:16:51 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 12 Nov 2024 12:16:50 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 12 Nov 2024 12:16:50 -0800
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.45) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 12 Nov 2024 12:16:49 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SIJ2Sb/NPXElyVD14dnWk7+jj+a1OSEt/knbw+c2Mr8EC3zzHG2IaaBlWcK52/AjJk8y1KRioEIAtfwTThId3YMW68ZQnMniItw5bSR3TjE2EHSC2obmE/AteGaWuQXX6igD3ocMKIRNgSxM8UmsM+HVCO9bS4B+uKF7o3rixKn+qZu0i6oedUH6qw99VtIeDOBnX7mkEF0+OZa2G+Ovr/D4WfZLI/tTkSC/pULbH9oXH68VK7cGd67zMtAmbjxtZEDGBAI7JryGSjBPJouOwVbagFzTO2MQrTiIXgYuFJlCjrI6zeN5ZY1iUaee8nwoD7Ls39PVdGfc1p/WwzmhBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6s3N4ENrJLrUEOvMIuquiSkKg7kND9Sue3788d8CP+w=;
 b=rY/6uMyVT1skC8Op4GeuDIiSY42M3qHgZwx7+S1xljJVNggkp+4lWYOzDQZ3O3TUUPhM+FL311W0YMCJd8GAMjEMej5LOzK4t0I1c37SRe9DuhaUt0FqODoJXUCqdGS6OYC92QC4ElrSXOYAjlLwm5WZbBJ8LSyLKKgbSx3bXq/j9Y30PI1/qt6HX4bSXuu6JZR4zlETogS5ogXCYjAdIwcQgq8hqzxQJz9OnXaONBCjh6DpDWBo6f6xt2Elnj3aBoLxnTuWU9rZHE0FkrdJU02DRMPQF+I9+zzrCQwQCw28MxiAsDB61u99ShschYmSKc/JoyOvZ9zx6dXWc61wHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by MW6PR11MB8365.namprd11.prod.outlook.com (2603:10b6:303:240::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.26; Tue, 12 Nov
 2024 20:16:47 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%6]) with mapi id 15.20.8158.013; Tue, 12 Nov 2024
 20:16:47 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>, "Harrison, John C"
 <john.c.harrison@intel.com>, "Roper, Matthew D" <matthew.d.roper@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Teres
 Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>, "Dong, Zhanjun"
 <zhanjun.dong@intel.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
Subject: RE: [PATCH 2/7] drm/xe: Add ring address to LRC snapshot
Thread-Topic: [PATCH 2/7] drm/xe: Add ring address to LRC snapshot
Thread-Index: AQHbMgWw15n4plELRUKWR+L6KunWx7Kt7xmQgAATloCAAAXp4IAF7IkAgAAFQQCAACDGsA==
Date: Tue, 12 Nov 2024 20:16:46 +0000
Message-ID: <CH0PR11MB544468E5716752CB21F19C2AE5592@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20241108174312.272792-1-matthew.brost@intel.com>
 <20241108174312.272792-3-matthew.brost@intel.com>
 <CH0PR11MB54441F26FE46E5366FEC4EFDE55D2@CH0PR11MB5444.namprd11.prod.outlook.com>
 <Zy6aVcXWot6hBV1n@lstrano-desk.jf.intel.com>
 <CH0PR11MB5444A8A2BFD2FF1C0B22CFB9E55D2@CH0PR11MB5444.namprd11.prod.outlook.com>
 <9d829b21-4327-4cbf-ad72-b3e47d57fa74@intel.com>
 <ZzOb3FtRFAMAQzt3@lstrano-desk.jf.intel.com>
In-Reply-To: <ZzOb3FtRFAMAQzt3@lstrano-desk.jf.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-Mentions: matthew.d.roper@intel.com
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|MW6PR11MB8365:EE_
x-ms-office365-filtering-correlation-id: a1033251-0caa-4211-564c-08dd0356ef1a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?zp2/Dh53JAJ2KLVfWQVdZbhbs7mO/mJ0yhbkinhepLTiN7VN12umK3rUPLQ3?=
 =?us-ascii?Q?myV4QEouXp45z5WcSW2wYW/DB+5jGmsxz856FHEgNxWTJGDuSZbQYv/N0+dV?=
 =?us-ascii?Q?nwm8sUzniz+BQELopUFMgnxBfaPqJkVEVabSSOCetFSFQ6DXJ3pRbhX36FGU?=
 =?us-ascii?Q?AU56FScT3AuoqWYu3GczlsDbBqsZZpkCbZFNCru36I9RFrlxleXi13k/bMzN?=
 =?us-ascii?Q?HyJvbQGwsRijAfjVTefQXk0gNriqnGipIXY1HcXaOt/wQYV7qX8reFdPXpJb?=
 =?us-ascii?Q?L0fhN1A1J2syMkdNgG5AvggtBsnnNV/QZYv+786xsVFbpPXBIvck8YWfLxCe?=
 =?us-ascii?Q?kFF+fMH+oYdKmUf5Y865cBFRU5Xqu6D/Eb+qS7ntocXtJH1whoToZftvRL/Q?=
 =?us-ascii?Q?tiEJxP0YOpE61ZGQ/KchAQnMot4AQbk6QUHhHGgiqVSLRZJLknvuwSqDy/7+?=
 =?us-ascii?Q?6QxDUOYuyo2g2HZ+J1zaGIb3IGHCj3FJudYH2efW4Koin2rd4ylt4koRllFR?=
 =?us-ascii?Q?x/X5+7s6eNPOAAywM55WV46PPdOvF/puHf3S17VYQ4IX5rxA+zoryUbqHvQe?=
 =?us-ascii?Q?o3w4SD+TJlNdS60R35TAN8yz3AQFXOhCIaeUeAwdFRs8KKc5JhbwBQ6mCqIt?=
 =?us-ascii?Q?QvaCx7i8vD283R+DHR6yuv+1d+N5x70rscXfL5c9+M6+ZkXMebkxo/7zK4hS?=
 =?us-ascii?Q?zQO1eBbt9XYcQCJUSWNZlP0mjTFLE/YMzgRjHPZb4uiEXGsqYjOsT9LqmrGh?=
 =?us-ascii?Q?roGiIBT85hMKR3zCKsNCD7vMz5Az6A5hfXXdOFmDyTm/czIOWu+E7cV6X8E8?=
 =?us-ascii?Q?YDmNmSF3DUC5MAFT0aOHLnkkTf8bBo/RkeorGMdnjWdjZ4JIwwqfV89qQKmp?=
 =?us-ascii?Q?4PK2pp4PYUO6/lqGNgtwHt2G1m8B2wXBCYhzce+GqdlTy/tIM+5FL0W5Vkb5?=
 =?us-ascii?Q?TcH2ujNO/xfSDaCPj25SQcVtKDwKtBkPiSkJEKs6OnS9OVCqpxAAm4PQdckI?=
 =?us-ascii?Q?awxlvEwGz5+Rp8T71Jqjanc5/J9sSoCVJUU39+s9fQEhlVa7huvtGGuEdPAP?=
 =?us-ascii?Q?6LoTTh41xxwJE9yGqRsxuw+oczO4MAgdFt3KJX6j407sgFinZpJe5mckL1Hw?=
 =?us-ascii?Q?MgefS7mYVE9sXBC5nugkzg6AhaN5WUVUtPKZXpOhJUN4MM0mFbDv0MHndLRb?=
 =?us-ascii?Q?9piGfss1F9wMd+DTJMt+nyzlmkjvenXyO6wsB9Oxx+8sHk3Xpc0ty0kSTdNf?=
 =?us-ascii?Q?3JdMJJKqGDsxzCEd16fvN0gYt6Kio8OkOwjXQrrRxmmx73x91LuS+FxM+cxR?=
 =?us-ascii?Q?xuIKGpklr9RBnY+f+651LSk+H5OpJvdzpYSzfRlkqqy5n0uAdFMX/QagYji4?=
 =?us-ascii?Q?FEINfLE=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?ddoGYc+l3txgpM2UWly5/NY+cWvYDVxKGyCHzDnTgTm7EorAeWhHJ1TtPfXX?=
 =?us-ascii?Q?/uLrCeowHdtz5/qYmfRn8OUax4q/Kr3ed71Zx9xIAbeULDH3nIwJa2fCkcTo?=
 =?us-ascii?Q?xAfKSF1aZcXijiN6EN2VOTvooot+Wb5n1gTbWkBTLah3qMzj5E1+fUHY705m?=
 =?us-ascii?Q?KtOtd4yhTMqqZ5R6vhQG/fS+hSZ9T4hF53fOlV2Ib7JJppgl0GIDpx6ptFfJ?=
 =?us-ascii?Q?X6wPWOZ+L24nGKOkbtrrAGE1jKYlTl+XOyebkL6S1RkPXwOoJfPZcpZWauGm?=
 =?us-ascii?Q?7nB+DZs3Ox8Fd1VHw+KbzE245KNs75bB6bDMnUMwZC7R4xaBpv9N0oOop3tP?=
 =?us-ascii?Q?K7xZOEqlzDu9X2bL0PzeZeg87iu5QGgvGc3NCjltveyCFsP56k6TevhvF3fx?=
 =?us-ascii?Q?OovXT8NAhJMtMtPLWra78MvGnQoaUw4UD9Pc0K7r/KGLhUZ1B5zU8nFL1GfF?=
 =?us-ascii?Q?D8J8gdSi0aj/sYYwJmavnabh+EpSeaoDdItwYU++JdUuqkfDmzMqZQKjMlUH?=
 =?us-ascii?Q?UUjwhsqB1b5UsHp0zGGI7kjNqHK5VNco01yrCMAjb/S29sDNPjB6dZtjCWi5?=
 =?us-ascii?Q?BZQO/QJhO5vKNFtViXxe1xdlW3TJFvsASPzZlIe+LHQAdp61MUeOXjEW2joj?=
 =?us-ascii?Q?zoMxlieMesIIXcqvZ1DddgjXOfzOJl2QagKV75j9+7faIjlK8XIm3szCD2Ut?=
 =?us-ascii?Q?jqVBwXUFYYkFXS+dLgJgPnD0+glEW4Ikeit8uk7V6a8imh3Xf92uK2q0J77H?=
 =?us-ascii?Q?wrCf+X+D/d1OHY++JxGhHEZQTL76r33qJJIHuPkThUD7gqA5zARy7vySvS47?=
 =?us-ascii?Q?uVSGY/fa7zrQl4DsbiAkFiWWLwJlDJQzXhDFKArMGQQNUDlXPIvWUtE5t9mz?=
 =?us-ascii?Q?3lzv+TiylzbabPNTqqtOJRJsBh3oWU8uH26Zf0EFI4gNJfhwTOFWQuVbA9zT?=
 =?us-ascii?Q?ygzLkd1D0/DxXw6WOR2MhsHJXMtFGvhjcgxp1OaMPQTo9jKtp6MqwIjauTuf?=
 =?us-ascii?Q?r1rFNpJXu4dvZMw3C4+EBwQLu+VOqbdPXFr34oK/RaSfz4ty5FWOGtFDE9dc?=
 =?us-ascii?Q?ktGDPMln5R/dbr/h1AH/2ixoAJgN8/kPxMQojKYUAVcrcXupTzQT0F0o5jRs?=
 =?us-ascii?Q?nXFo1BJvo+pelswqiP20Vpl/NHrXPubcicnjyAqe3QhLcXE8ElfdWI7XDCKx?=
 =?us-ascii?Q?WUvwSzZ33v1MGTh5mk4k7lpTHk1AHvMqDc7mvEZlmC/+ek1vhW6QXHlGv45L?=
 =?us-ascii?Q?sUfXnh2JsZJPVeem1e+JkNzVG0bip6CD9o2D1RanesPzAbjzs5rIiV6eUgHR?=
 =?us-ascii?Q?24v6p3JZpa56sJa7kPtxFCa35EoEfYKEGLQbUNGYd0fdVpnsqhZm6RLDdh4P?=
 =?us-ascii?Q?5tiYwGrUqkGLqUncX+rXXdXxgwGEgTlCPrhrR5re4AVUoiqaaKDDTf29/vGR?=
 =?us-ascii?Q?FdhKiMEEan7dtZTUC5HZiLKY+PeyQq6UieBaWW6s0VX0eGQn+ANIMW6oNy2E?=
 =?us-ascii?Q?z/5EQFUOvodd4xddL+25eBPz/1YSJvkMCKIU5x8XDterZ4tIBWGcGv/JsU0s?=
 =?us-ascii?Q?q2h1v31wndMDOo7PEAv7ElYyNwRnvGpcSRkoG616?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a1033251-0caa-4211-564c-08dd0356ef1a
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Nov 2024 20:16:46.9900 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 76StAf8avq2pHxpIf3jwhQlyi8pB/DA3Nuc7S2ClQ/+QsDWclKAxsQSU20gwLDcNdF/32Y/uV6NivvDJPPBTMhovsb6RTyssFsSIqBv3BKM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR11MB8365
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
Sent: Tuesday, November 12, 2024 10:18 AM
To: Harrison, John C <john.c.harrison@intel.com>
Cc: Cavitt, Jonathan <jonathan.cavitt@intel.com>; intel-xe@lists.freedeskto=
p.org; Teres Alexis, Alan Previn <alan.previn.teres.alexis@intel.com>; Dong=
, Zhanjun <zhanjun.dong@intel.com>; Vivi, Rodrigo <rodrigo.vivi@intel.com>
Subject: Re: [PATCH 2/7] drm/xe: Add ring address to LRC snapshot
>=20
> On Tue, Nov 12, 2024 at 09:59:16AM -0800, John Harrison wrote:
> > On 11/8/2024 15:34, Cavitt, Jonathan wrote:
> > > -----Original Message-----
> > > From: Brost, Matthew <matthew.brost@intel.com>
> > > Sent: Friday, November 8, 2024 3:10 PM
> > > To: Cavitt, Jonathan <jonathan.cavitt@intel.com>
> > > Cc: intel-xe@lists.freedesktop.org; Teres Alexis, Alan Previn <alan.p=
revin.teres.alexis@intel.com>; Dong, Zhanjun <zhanjun.dong@intel.com>; Vivi=
, Rodrigo <rodrigo.vivi@intel.com>
> > > Subject: Re: [PATCH 2/7] drm/xe: Add ring address to LRC snapshot
> > > > On Fri, Nov 08, 2024 at 03:05:34PM -0700, Cavitt, Jonathan wrote:
> > > > > -----Original Message-----
> > > > > From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf=
 Of Matthew Brost
> > > > > Sent: Friday, November 8, 2024 9:43 AM
> > > > > To: intel-xe@lists.freedesktop.org
> > > > > Cc: Teres Alexis, Alan Previn <alan.previn.teres.alexis@intel.com=
>; Dong, Zhanjun <zhanjun.dong@intel.com>; Vivi, Rodrigo <rodrigo.vivi@inte=
l.com>
> > > > > Subject: [PATCH 2/7] drm/xe: Add ring address to LRC snapshot
> > > > > > The ring is currently in LRC BO but this may change going forwa=
rd.
> > > > > > Include the ring address in the snapshot protecting again any f=
uture
> > > > > > changes.
> > > > > >=20
> > > > > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > > > LGTM, though the terminology we're using to describe the various =
ggtt addresses
> > > > > as "descriptors" is a bit confusing, even if it's consistent.  I =
wonder where that
> > > > > terminology came from?
> > > > > This is just a rhetorical question.  I'm not suggesting it be cha=
nged.
> > > > >=20
> > > > LRC descriptors is name copied over from i915 and may even be in th=
e bspec.
> > > >=20
> > > > But yea, indirect_state_desc and ring_desc are bad names. Will chan=
ge to
> > > > 'ring_addr' here.
> > > IMO it would probably be better to leave it as "ring_desc" for now as=
 it's
> > > consistent with surrounding struct members.  We can do a pass of the =
full
> > > XE kernel for inaccurate uses of the "desc" qualifier in the near fut=
ure and
> > > fix the naming scheme here as a part of that fixup.
> > I strongly disagree. Just because A is broken doesn't mean we should ad=
d a
> > broken B and C! It makes no sense to add a name we know is bad just so =
that
> > we can change it later. Anything new should be done properly from the s=
tart.
> >=20
>=20
> I agree with John here.

Okay, I submitted a patch to change the name from context_desc to context_a=
ddr,
and it was rejected because context_desc is actually correct.  But if conte=
xt_desc
is correct, then would ring_desc *also* be correct?

Pinging @Roper, Matthew D
-Jonathan Cavitt

>=20
> Matt
>=20
> > John.
> >=20
> > >=20
> > > My RB still stands either way.
> > > -Jonathan Cavitt
> > >=20
> > > > Matt
> > > >=20
> > > > > Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> > > > > -Jonathan Cavitt
> > > > >=20
> > > > > > ---
> > > > > >   drivers/gpu/drm/xe/xe_lrc.c | 3 +++
> > > > > >   drivers/gpu/drm/xe/xe_lrc.h | 1 +
> > > > > >   2 files changed, 4 insertions(+)
> > > > > >=20
> > > > > > diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/x=
e_lrc.c
> > > > > > index e219657535cf..afb0f4f44748 100644
> > > > > > --- a/drivers/gpu/drm/xe/xe_lrc.c
> > > > > > +++ b/drivers/gpu/drm/xe/xe_lrc.c
> > > > > > @@ -1636,6 +1636,7 @@ struct xe_lrc_snapshot *xe_lrc_snapshot_c=
apture(struct xe_lrc *lrc)
> > > > > >   		xe_vm_get(lrc->bo->vm);
> > > > > >   	snapshot->context_desc =3D xe_lrc_ggtt_addr(lrc);
> > > > > > +	snapshot->ring_desc =3D __xe_lrc_ring_ggtt_addr(lrc);
> > > > > >   	snapshot->indirect_context_desc =3D xe_lrc_indirect_ring_ggt=
t_addr(lrc);
> > > > > >   	snapshot->head =3D xe_lrc_ring_head(lrc);
> > > > > >   	snapshot->tail.internal =3D lrc->ring.tail;
> > > > > > @@ -1693,6 +1694,8 @@ void xe_lrc_snapshot_print(struct xe_lrc_=
snapshot *snapshot, struct drm_printer
> > > > > >   		return;
> > > > > >   	drm_printf(p, "\tHW Context Desc: 0x%08x\n", snapshot->conte=
xt_desc);
> > > > > > +	drm_printf(p, "\tHW Ring: 0x%08x\n",
> > > > > > +		   snapshot->ring_desc);
> > > > > >   	drm_printf(p, "\tHW Indirect Ring State: 0x%08x\n",
> > > > > >   		   snapshot->indirect_context_desc);
> > > > > >   	drm_printf(p, "\tLRC Head: (memory) %u\n", snapshot->head);
> > > > > > diff --git a/drivers/gpu/drm/xe/xe_lrc.h b/drivers/gpu/drm/xe/x=
e_lrc.h
> > > > > > index 9d64cedc4d14..a2058a501353 100644
> > > > > > --- a/drivers/gpu/drm/xe/xe_lrc.h
> > > > > > +++ b/drivers/gpu/drm/xe/xe_lrc.h
> > > > > > @@ -25,6 +25,7 @@ struct xe_lrc_snapshot {
> > > > > >   	unsigned long lrc_size, lrc_offset;
> > > > > >   	u32 context_desc;
> > > > > > +	u32 ring_desc;
> > > > > >   	u32 indirect_context_desc;
> > > > > >   	u32 head;
> > > > > >   	struct {
> > > > > > --=20
> > > > > > 2.34.1
> > > > > >=20
> > > > > >=20
> >=20
>=20
