Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 566AC606A331
	for <intel-xe@archiver.kernel.org>; Fri, 20 Nov 2026 16:26:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=F2RaG1jh;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=Rewhz4ig
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B39110E935;
	Fri, 20 Nov 2026 16:25:53 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6622210E935
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Nov 2026 16:25:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795191942; x=1826727942;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=m9db6RxjITht0VX612L0VeZUqKz7Fg9PVCkgxNx+1Y4=;
 b=F2RaG1jhXh/P7jVbGemAykyVVKOOLII9aRVXkHseUVx24gkB1emTsXAn
 UyBpr+9kvErnviETST9qnwnHQjM+ne9yK+4HY9ZLSerwypHuSSZbreL7r
 4TpnApFlJmJlW9KqamwSCkqOaHPri8dCYztKuXBifk3RRHVZKDCaPo32F
 E/sGnbJj01F3kxPosBfTk8VpgJbo8tGSvNniVWhIvFmRK9J+BvtqVyLCH
 DFGfrxAWw73L/EtvZU8mprns5tsHv5NcL+G+4qr00DF+QZr0Ui5J3l5xg
 xx0Ng/8zZnet/buEAu0sn0ZYMObCyHJ+X6w74IkxX8nDqOp2qZfcajR+M g==;
X-CSE-ConnectionGUID: qRX3tpyUShySCcvVw6IySQ==
X-CSE-MsgGUID: aSsqrDJWQH+y9ddpSz0QNw==
X-IronPort-AV: E=McAfee;i="6800,10657,11972"; a="3955510"
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; 
   d="scan'208";a="3955510"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2026 08:25:41 -0800
X-CSE-ConnectionGUID: ztrHQFadQfyHN9J7HRzJHQ==
X-CSE-MsgGUID: SRKkQtvzTG6TrH/yCiTgKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; d="scan'208";a="12731362"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa013.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2026 08:25:40 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Fri, 20 Nov 2026 08:25:38 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Fri, 20 Nov 2026 08:25:38 -0800
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.24) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Fri, 20 Nov 2026 08:25:38 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RnfG9sbvkYeSq3m+OP1fse6X9V3PEA+UPcai+/+b31mHi/9qCtdrnp0st9jB2wuyS+XP/P8/46/Qgiqkw1RRCM4/mC5bpn2837sI27lf8Ws3d2FS3LnR/1a/thRXOqAv2cfLObgNBE+KLN/Y7oHwt2pfBuiXqce8eNxIfud+aZpO3kSSCcoiWKxrEqIyXNxvkva/0LUh7/cVeDVVAetgXY6B+Uc0BkpLsqBrDm8UMPPzNRpUu4EIWxXm8y8KR+5Zn4+yki+BK1n4BTTdxTp7H48+pI3U+zrz9KQUcNUMslDNu2MaCNj1drNzLT7tVYRwtN9RIpXfq3vlasro/X8ELg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ajVLfSMRpXllVjcA5nsHClN8yXfWKCeSmdvF2rSzYCo=;
 b=n8+tPed3/tta4sl2qPMo+Xtiwv80qJ1sod3KhL5iQAE8rKHR+JLRg3iQM5eZ17+lnspqmBcGLizhVTJKiA6AFflnRrzh0qhtukHuaiS9hUkw+ccW7F3HXWw1i0QmhVMLi/G8DIkneSxfxJCSzNNJKZdnsl7u+0Kg/5cmDiredU23fHZRN7uUwh8CY33a+c/mfGi2VvjwDKVRKxVQPT9JiPgIeAwrjtk3q5Phy5nm1NjOuox5KW6Z7biPkfx2rsNh9W3gBtEOsUa3se4gVGM4oLOrV9gG6tsG7i7GkeU56xzQj84BQhrfyh8X/gfiM6HSBFCMr7rBTktIvwupgK6QbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ajVLfSMRpXllVjcA5nsHClN8yXfWKCeSmdvF2rSzYCo=;
 b=Rewhz4ig7ApWoDhHrPkdk25YNDKAt9iSsKLNNYAnYqofN8MW7bv0fkRFzADe9bPU1ubbUbgIddHeqF920GVZQ7ofY2WTJ8jqGakmrjQ8wy7f7bzusFAAhtuAvldyjIllFBH9xBOge62vWAatxV7v94qK7WTNKAQqTDJZpvytUdc=
Received: from CH3PR11MB046149.namprd11.prod.outlook.com
 (2603:10b6:610:367::19) by FT1PR11MB420853.namprd11.prod.outlook.com
 (2603:10b6:170:b::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Fri, 20 Nov
 2026 16:25:36 +0000
Received: from CH3PR11MB046149.namprd11.prod.outlook.com
 ([fe80::7c3f:5300:19c4:b823]) by CH3PR11MB046149.namprd11.prod.outlook.com
 ([fe80::7c3f:5300:19c4:b823%5]) with mapi id 15.21.0639.010; Fri, 20 Nov 2026
 16:25:36 +0000
From: "Ruhl, Michael J" <michael.j.ruhl@intel.com>
To: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
CC: "Poosa, Karthik" <karthik.poosa@intel.com>
Subject: RE: [PATCH] drm/xe/hwmon: Unregister hwmon before the device is
 unplugged
Thread-Topic: [PATCH] drm/xe/hwmon: Unregister hwmon before the device is
 unplugged
Thread-Index: AQHdeQPANkZCWcHwG0Wi6ua92AEJobc3Iz6g
Date: Fri, 20 Nov 2026 16:25:36 +0000
Message-ID: <CH3PR11MB0461498B6EF732A3851C0C45FDC1782@CH3PR11MB046149.namprd11.prod.outlook.com>
References: <20261120152753.1346010-2-rodrigo.vivi@intel.com>
In-Reply-To: <20261120152753.1346010-2-rodrigo.vivi@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB046149:EE_|FT1PR11MB420853:EE_
x-ms-office365-filtering-correlation-id: 92aac5d8-5b3e-4190-3222-08df4722e88b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|23010399003|366016|22082099003|18002099003|261009223027099003|56012099006|11063799006|10067099003|261102123227099003|261022075727099003|261028144727099003|261026140227099003|261026121527099003|261022105027099003|261021121427099003|261021135927099003|261021123027099003|38070700021;
x-microsoft-antispam-message-info: uf/AvbH8zn5NnwXSsqFNEiAhOZp1p1MhdrcsFELr1fw5EuJZ0sdnKVDcR5boIp9S/PKVBfYRu3iQHQ0iUiDDYUGnVJu5QV5YNSfojMUo0DDq2IS+usqxkTXnXEHTVYO3kVxhmYL1JBMEHUPId+sFojQLnnMEFzEW+7imp6EAswNjT6E0DIatzJi6lF1FWxrxS9pMzCRZMUbu6gZcmHGv4j+dpR4NsDvKSHWiQXgdh8hYJ81gQS2LwDvnOYWGxoUj39Iwlt+Tg4t2SEp+uHDVcI6OLKk+Z1WoTRisnqd0dAdtdmXBHUrAEXjNOfYUYVtLLKfugoqpQImufURovnYdHiK61kSXQYO9bCwYJpueL7Y4SO4U6un1iM63EKzro/uSZGLnjDhOHh9qlFG6+lUOEf2aMWKnq4anf0NjdZLbr7oH2+/U++hB+mM/J1xCvilLfobui9oNYf1nBgX0uzvWNrnrfK2K9P5wqgqGM0oG2jU+EEbGXMmWE+fIh79UZ+NcH1+cQZAJj2Ug72/FQGKRc9el91Pk3VgIdgkoNMKgGp2PySx9zcq9ll0tT5h3/hLXGQRj8uPKSl+Hwp6Cj8N46PTsIF6QHTqLepQWfYnYtm5YhJrV9kZ93jrEi0C+j2hihX4LOtpUPXBhULmb8ikGze3yKr8IoX1i0sKWG/4wi+pzltgzs9lTxkQkvVDiUNTNp0cGGvR9ckTttMDvocjLzvrHzgTNNkPg4d85gWlNerM=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB046149.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(22082099003)(18002099003)(261009223027099003)(56012099006)(11063799006)(10067099003)(261102123227099003)(261022075727099003)(261028144727099003)(261026140227099003)(261026121527099003)(261022105027099003)(261021121427099003)(261021135927099003)(261021123027099003)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?rkTSQuwYbOYFOldcW4DSCIG5YyRN7Fxclco1/hCQnGtGsdjGLUwOx33qCMj5?=
 =?us-ascii?Q?CtU1PeotThFXoe2A0mdZBC2b7ZrKZYsLB1h+aC33Khi84HAk/Dcs54kjunCj?=
 =?us-ascii?Q?6ddisyRy1b/p6lNrHNqt3LdF8gmdKSQ9BX3qLqmTTE8CehdLz6mBCWhNmBWt?=
 =?us-ascii?Q?2VYrDAXsruWyVE5+NufgzZx39ATDtYuGXmyVzyZlQXwWldQbZYdz17ihYoEv?=
 =?us-ascii?Q?CmgiJv7BdBZVNbEtNFCQhyifPJtXmwQ/LAmh4cLPLpwpgLJPV8oJlaOdoLvA?=
 =?us-ascii?Q?AZbdxOEquA8AWVP3mqhNXlrRJ7+XnbQV3WI0LRqR3Xb3wDYoukaT3Zs1/owx?=
 =?us-ascii?Q?nK9ccJtBilyo6ZVN/6xdvbRVNp0HMdHWmKqOJIPguIgvvMsbAfjUi3HCj9Wa?=
 =?us-ascii?Q?hmpbri6GkZWZ1dT3tZAjYgdRZyHnsHyrOmEosZWoIJ8aopg8o9PEwWjSZQtr?=
 =?us-ascii?Q?NSnZnCwBLQAbYsZ5aXpcILqR+juCuha4u16vxEP5Drs8UxyeFqINNIHoGwLd?=
 =?us-ascii?Q?jzQWAkcNOQ1/W+5otSQIuFVF6PgsvNbZngg0BfqDJPw4Er4JUxd1HBuq/gaJ?=
 =?us-ascii?Q?GMXktJasVJiHaPXv98m2jgeIY24Jghi17ZsbMFGSURabcsc+Q8vH5DAHHx6z?=
 =?us-ascii?Q?k8yc+bEOXH3iDXuObrS1/vztwLHoTmOpCMNYQZmryB4fKvJC6Czz/QCHFeXa?=
 =?us-ascii?Q?T5LHTiYK8SzzLzRM8t4ze9RZDrdrg5+ED7l8RVPQCNVfy0Z3N9TW+3sSJlaC?=
 =?us-ascii?Q?cskZ+ZctSp1hKM1BuL4712HUoKgpHlOThfkTkqf/Npf7/9Qd3R3ALDCXzWks?=
 =?us-ascii?Q?xa3qIAywLMWetQK9V2m7CsGMaM9wTBxx6WuUeDypJuQNxADePF3bsTwUlfTS?=
 =?us-ascii?Q?xadZ5wgxbdr2T6KxxzKHmjGEHAMsdKgsDbCjef1/PYJGUS71S6XjKA5KHbnq?=
 =?us-ascii?Q?q26r/V5RGyB3Ob05qK1I5y4jm1dj+OqmpyJQLpWXpU5TqlBp+pMxuYwAlV+H?=
 =?us-ascii?Q?ODVrTcABBu1QttyHuO0r3yzfTrGaYmVWBs9/vvXriaFvz2rWjZFCc4NawHJm?=
 =?us-ascii?Q?Jj0r5FPmNw8OuWI/LSu+TY6aa3MTqR16/eCivV+rNzVbyUQ4rHS2l38PjzUs?=
 =?us-ascii?Q?ynqrfgRQcNezakFUbiap867zZd8rimOTwYtSI9k0YEDzN8mYeBXmGD+yNHLe?=
 =?us-ascii?Q?nSWk+vYa6wGvRnoO/w0V8ps+pVOva1Bw1qCOjgcBdPI07HpGeOiWvg89nWLd?=
 =?us-ascii?Q?5glfJ/P8WA6WcM9W30cQXxO5eEmzVwh3M5uD3YpHoFTpbrtKm7z+azjl4ML4?=
 =?us-ascii?Q?45D29MVyCr9rtrk3ERVj3OsV7NxOui7UA6HtykB4CfDxmQSwOfQdtOvbP38U?=
 =?us-ascii?Q?+fpbVWgDQ9K7BUZGq+9W0sdd2Ah8RcapskTIc6RxNtuzlOk8TYhfchQcbAxL?=
 =?us-ascii?Q?wXdpztsmNYeG9Bs7JRH7VySgZ73YZ1iBwbgnyPsQzI5E3+WFTg5wvkth+CMy?=
 =?us-ascii?Q?OGNk46OisqUN8PrNgJP8V5bFke+phkjy+RtzNDxRVT7gov5zyJQR8mklIEXx?=
 =?us-ascii?Q?KxJHfTeFHB7Wgqfcxlqz8TXdYf1ZQ6soFQKngA6HbKABAE6OMKmpR4BrhuhM?=
 =?us-ascii?Q?g2OgkWrSIAvhOTqN6/5wveqXzKxH7em3Ou+Z6jstthBIyOpyaFU22pLoYTQw?=
 =?us-ascii?Q?zyy8/xgjduYs+xYNtuG8QG9AiOla3ae9QyIZ8gNnVNthdmyFTK+1IDwbmxfZ?=
 =?us-ascii?Q?SJCzhBzv+w=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: QJgMTeQH5m/iVlKjTXCJr7HpJRyAtBALdViNIu49fJOqN2fTYUyT+9FaQwAH4tOJNsfxRQa/KUBLl5Q017cIANUwFfQB8J/ydhm9kjALSH2ov6iQbhiCxJ74vH4RAV8tP7jQ9b1kmqSeaN3z1vAAfAGg6yQUx5zNvwfOzevzdJOdxQlowyngUHQWr65/FT/txXlkJZd6CXKBRxF5aLs3ff1XG1hS7uVYLX0O4gegIaM7Y9y8VooJeSDZjWiQSOFHV6ttPyvuV6BGIAPvmxQcpDueWOZfQc5Ui5jWiH1bfnzmyvEr/EynoIhshV3KDgULY99IaeI8dsNDoxcvafRpoQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB046149.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 92aac5d8-5b3e-4190-3222-08df4722e88b
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Nov 2026 16:25:36.5706 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lUM3dcdXzORdU8EmIMjCsh7jUgOo21Q7Zw/Q9BXw3q6kmScZfQnlwKzq40qjw6JuSC2nQivar6FEDvOHooxhsNXGOqOiUuGcEwfvJkaD+UI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FT1PR11MB420853
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

>-----Original Message-----
>From: Vivi, Rodrigo <rodrigo.vivi@intel.com>
>Sent: Friday, November 20, 2026 10:28 AM
>To: intel-xe@lists.freedesktop.org
>Cc: Vivi, Rodrigo <rodrigo.vivi@intel.com>; Poosa, Karthik
><karthik.poosa@intel.com>; Ruhl, Michael J <michael.j.ruhl@intel.com>
>Subject: [PATCH] drm/xe/hwmon: Unregister hwmon before the device is
>unplugged
>
>hwmon was registered with devm, so its sysfs attributes stayed
>reachable after drm_dev_unplug() until devres teardown. A reader in
>that window accesses an unplugged device, e.g. the PMT energy read
>on BMG.

Ah hah!

Ok, I will return my error code to ENODEV in the PMT code path

Nice catch.

>Unregister it explicitly in xe_device_remove() and in the probe error
>path, before the device is unplugged. Removing the attributes waits
>for in-flight reads, so none can run afterwards.

Reviewed-by: Michael J. Ruhl <michael.j.ruhl@intel.com>

M

>Cc: Karthik Poosa <karthik.poosa@intel.com>
>Cc: Michael J. Ruhl <michael.j.ruhl@intel.com>
>Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
>---
> drivers/gpu/drm/xe/xe_device.c |  9 ++++++---
> drivers/gpu/drm/xe/xe_hwmon.c  | 22 +++++++++++++++++++---
> drivers/gpu/drm/xe/xe_hwmon.h  |  2 ++
> 3 files changed, 27 insertions(+), 6 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device=
.c
>index f5a581d39c96..30863c988cca 100644
>--- a/drivers/gpu/drm/xe/xe_device.c
>+++ b/drivers/gpu/drm/xe/xe_device.c
>@@ -1096,22 +1096,24 @@ int xe_device_probe(struct xe_device *xe)
>
> 	err =3D xe_i2c_probe(xe);
> 	if (err)
>-		goto err_unregister_display;
>+		goto err_unregister_hwmon;
>
> 	xe_vsec_init(xe);
>
> 	err =3D xe_sriov_init_late(xe);
> 	if (err)
>-		goto err_unregister_display;
>+		goto err_unregister_hwmon;
>
> 	detect_preproduction_hw(xe);
>
> 	err =3D devm_add_action_or_reset(xe->drm.dev, xe_device_sanitize, xe);
> 	if (err)
>-		goto err_unregister_display;
>+		goto err_unregister_hwmon;
>
> 	return 0;
>
>+err_unregister_hwmon:
>+	xe_hwmon_unregister(xe);
> err_unregister_display:
> 	xe_display_unregister(xe);
> 	drm_dev_unregister(&xe->drm);
>@@ -1121,6 +1123,7 @@ int xe_device_probe(struct xe_device *xe)
>
> void xe_device_remove(struct xe_device *xe)
> {
>+	xe_hwmon_unregister(xe);
> 	xe_display_unregister(xe);
>
> 	drm_dev_unplug(&xe->drm);
>diff --git a/drivers/gpu/drm/xe/xe_hwmon.c
>b/drivers/gpu/drm/xe/xe_hwmon.c
>index defe8aaca7c1..9cbb65891aa4 100644
>--- a/drivers/gpu/drm/xe/xe_hwmon.c
>+++ b/drivers/gpu/drm/xe/xe_hwmon.c
>@@ -1900,9 +1900,9 @@ int xe_hwmon_register(struct xe_device *xe)
> 	drm_dbg(&xe->drm, "Register xe hwmon interface\n");
>
> 	/*  hwmon_dev points to device hwmon<i> */
>-	hwmon->hwmon_dev =3D devm_hwmon_device_register_with_info(dev,
>"xe", hwmon,
>-
>	&hwmon_chip_info,
>-
>	hwmon_groups);
>+	hwmon->hwmon_dev =3D hwmon_device_register_with_info(dev, "xe",
>hwmon,
>+							   &hwmon_chip_info,
>+							   hwmon_groups);
> 	if (IS_ERR(hwmon->hwmon_dev)) {
> 		ret =3D PTR_ERR(hwmon->hwmon_dev);
> 		xe_log_err(xe, HWMON, ret, "Failed to register xe hwmon\n");
>@@ -1915,4 +1915,20 @@ int xe_hwmon_register(struct xe_device *xe)
> 	xe->hwmon =3D NULL;
> 	return ret;
> }
>+
>+/**
>+ * xe_hwmon_unregister - Remove the hwmon interface
>+ * @xe: xe device
>+ *
>+ * Called before the device is unplugged, so that no hwmon attribute can
>+ * be accessed afterwards.
>+ */
>+void xe_hwmon_unregister(struct xe_device *xe)
>+{
>+	if (!xe->hwmon)
>+		return;
>+
>+	hwmon_device_unregister(xe->hwmon->hwmon_dev);
>+	xe->hwmon =3D NULL;
>+}
> MODULE_IMPORT_NS("INTEL_PMT_TELEMETRY");
>diff --git a/drivers/gpu/drm/xe/xe_hwmon.h
>b/drivers/gpu/drm/xe/xe_hwmon.h
>index d02c1bfe8c0a..e67e0134f02a 100644
>--- a/drivers/gpu/drm/xe/xe_hwmon.h
>+++ b/drivers/gpu/drm/xe/xe_hwmon.h
>@@ -12,8 +12,10 @@ struct xe_device;
>
> #if IS_REACHABLE(CONFIG_HWMON)
> int xe_hwmon_register(struct xe_device *xe);
>+void xe_hwmon_unregister(struct xe_device *xe);
> #else
> static inline int xe_hwmon_register(struct xe_device *xe) { return 0; };
>+static inline void xe_hwmon_unregister(struct xe_device *xe) { }
> #endif
>
> #endif /* _XE_HWMON_H_ */
>--
>2.56.0

