Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CB6EC4345F
	for <intel-xe@archiver.kernel.org>; Thu, 25 Apr 2024 07:01:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AB1D11A1F1;
	Thu, 25 Apr 2024 07:01:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MLIUB2Iw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B497B11A1F1
 for <intel-xe@lists.freedesktop.org>; Thu, 25 Apr 2024 07:01:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714028477; x=1745564477;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=osS7dn4vuYN53LMJyO14kQM8G/KSuNXNjXqBsB1PVds=;
 b=MLIUB2IwdzoOg0o3GcNFmVAf0bHjSCwcK7sBNMomg+mzUSU8XoS/ppUN
 GIwEYeSAcxfnXVW1iO/KR4dkNMcrIfLd1bEi3KwRYzjzoiyWZAsA2siQO
 EijJMIYywdADhicViRNp9qrS2sBDTVuoFH75O6MP0PRJ4kg7gYbHLyHS3
 J7LT9OnAycehlc6EWfaE0aYx16TeplK3EHITcflhKimjHE8Uv4eLNmGjD
 7RAVVHYPkdAKVmUmfMGdoiJJeKd9k3i+24mhImXAbom2NA8//OgYf4KG1
 t90uRAIJoSOjuZO/bOsiNzrX2Zu2DcDu6mWYggkuAePCMXAtNgvSIx0UK A==;
X-CSE-ConnectionGUID: uQNNlc4nSU2P8BjRXnYxhQ==
X-CSE-MsgGUID: A195EObeQEibAmJE4PYr3g==
X-IronPort-AV: E=McAfee;i="6600,9927,11054"; a="32186649"
X-IronPort-AV: E=Sophos;i="6.07,228,1708416000"; d="scan'208";a="32186649"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2024 00:01:16 -0700
X-CSE-ConnectionGUID: v4HuYjQXTUWPw8wjdMlhTw==
X-CSE-MsgGUID: pp+GM1ktTUivXz8vllnGow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,228,1708416000"; d="scan'208";a="25030494"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Apr 2024 00:01:16 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 25 Apr 2024 00:01:15 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 25 Apr 2024 00:01:15 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 25 Apr 2024 00:01:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Yi3ELSPT0Akj9p/oSa8zE+Iq3zNOLugLk2uxGEfeSWSHl/mS6HZZYXFlwafKO/CjHrudY9Hm7t/SNl/mjIdXYfXanyor2ybGlug9PjQJ9wYDiwG7MHMg44fdMr0bbsiJJLT7fSVnMzC4UU/cczwzJGu4uB8Z/vuc+vbqsAlZl0nUU8amjFjJY4n5kj1wZSUTr2qyLXcpMf0jh+YbOigmN13IbAGAyepoJIwUdzA7TAFo3C8duqmGhfNjK1qyk3hr9Qqr1Q7ejVxc6+n+jo/qMM6jf2J5GZ7bSlVpKxpBMzIzRhpQxMhl8olokXB/Oy75vDMOPM6PQTcTr1uwIIRuPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k/6Y1YwnbXVTKVQnmT0/TnxQ4UAuFfK0eGgvs/mPqRI=;
 b=MQaxIKzfTkRq885PVe6QH1pOne2wx+Xa4bFDaHPA7Kq05L9OiHV9yBinEtR2886ZOcc6QbQxmDy82ZgCb7DwLVkUczRgSHE4ClldUOOIBkqygiTLd6ezN2fdojYN97gBUaF4lwkqrkUerDqzzFrGyLGz1k+ozp77v/3ZB6Rm1zk+ZN1rgCmpKsgobS2kvoXW0xmsk4ph99dEJkFl+wJdk/HmMAWaWcrdf1lSkD74vOLxLGa/rB++szOLm970gpzBHdu1113CeGMK0cE6Ehwbs5BHoI5zZccTdVa/qgWqWsqpMs7iHhAK3rKm2xvy+peeu9MxIuhgIrNFxBwVsZzuXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by DM4PR11MB6096.namprd11.prod.outlook.com (2603:10b6:8:af::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.21; Thu, 25 Apr
 2024 07:01:13 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::ff2a:1235:d1ba:4f93]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::ff2a:1235:d1ba:4f93%3]) with mapi id 15.20.7519.021; Thu, 25 Apr 2024
 07:01:13 +0000
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Brost, Matthew" <matthew.brost@intel.com>
Subject: RE: [PATCH v2 3/5] drm/xe:
 s/ENGINE_STATE_KILLED/EXEC_QUEUE_STATE_KILLED
Thread-Topic: [PATCH v2 3/5] drm/xe:
 s/ENGINE_STATE_KILLED/EXEC_QUEUE_STATE_KILLED
Thread-Index: AQHaltUgn0GfsGn6tk2IzhDPslN7e7F4jthA
Date: Thu, 25 Apr 2024 07:01:13 +0000
Message-ID: <MW4PR11MB70564D42CC57622A867C4389B3172@MW4PR11MB7056.namprd11.prod.outlook.com>
References: <20240425055522.1919005-1-matthew.brost@intel.com>
 <20240425055522.1919005-4-matthew.brost@intel.com>
In-Reply-To: <20240425055522.1919005-4-matthew.brost@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW4PR11MB7056:EE_|DM4PR11MB6096:EE_
x-ms-office365-filtering-correlation-id: 472b2694-30f1-443e-dd14-08dc64f57ebc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230031|1800799015|376005|366007|38070700009;
x-microsoft-antispam-message-info: =?us-ascii?Q?k3Cgn0vlNX9hhtY4YpVIrJGFFfsI2qSZvVB1dCF3/O93N4QNZO72Y27DxoRm?=
 =?us-ascii?Q?4PktC8R3yHTJT1xkao4USxWs2U0HTJrCVWsx0GKdWl2ciofn7cnFUU3zVWpw?=
 =?us-ascii?Q?r3mBp7sImjuz1BTPcQH5sYDSxsHi4Dvw0SVoKep1+pAchj0OQ7lT2EvZkXGn?=
 =?us-ascii?Q?/Xv0HstDMT2De3GzX112Mr6+AUOy2iYgeqCiodDFodvkPa4ojbTrbXqlwLCF?=
 =?us-ascii?Q?u1iRLvtu6xKa0b27sm0N8VBM0hGxFOq+Uzmw4WWMsqcPbj32STXUpQ8skLYF?=
 =?us-ascii?Q?Po5yIhUFxPac25PnWlSJx1F3nEeifLLycUZ7aP61O6JGgebIOe4mqXV+NaTa?=
 =?us-ascii?Q?5AUStZji0hS10w3IaB+vBcxYZb1jCxbrlwwAlsNPSFBvzP5ViL+JJRFl53Ge?=
 =?us-ascii?Q?G3CzqlKuPdk04Dlk1YyJzvH76I9hl6fjovSo1SOHYI9wmwTT9LnaLO78uZqU?=
 =?us-ascii?Q?TJKThmLwPcq5ZDmxGY+PK85xU3fW9H5lHc0supwW/6EE2VAtojytDW2S5J0F?=
 =?us-ascii?Q?MHc0e0j9PDSM3f/3EHXFRFxN9W9AqnG77dWJkcRw7+NTuXjjyZ1U+bD724aY?=
 =?us-ascii?Q?GH/wnYG7O4JkWuq/5o1a1IaRumq7ZzYsJdNb93EL+PkHnoENIgHvMFeZQSEb?=
 =?us-ascii?Q?NrpBKjUu01uTBvosnFjIeVWJL6bLhbLjunJqsqJvPGc2naj2+DMhMggGdI1v?=
 =?us-ascii?Q?hLreqLINajIphQLFCYzwDd+5Sucu1Vf0MrCzWO7uP6OymUzkR8xL3Y7WoApY?=
 =?us-ascii?Q?gxK7so8bOzQKs0Zbdn95/VvKytg14PlRNFd7hxVdaz2gXENRQij/7+JzCArQ?=
 =?us-ascii?Q?A7Pyn+uKUTZPXpmJ96Rw7R4v1IX+3shNk3/3y6aYdbw5WjDZ/1vCJXzDG522?=
 =?us-ascii?Q?2AgaW+oYcElqStw3rZcUw1J/Z0jiolXGlL2F4M2DLETmR/sFY+6JMUCTOx0b?=
 =?us-ascii?Q?v9ggu2ZCaVcB+xoJZXn9n+wZCGi2VTGNbhMTr9yD65bCzfeMUGToL7OMce2S?=
 =?us-ascii?Q?hTlatKx8vVjic4VOJeBn/EhXYfZjmO2FypqI1rsAUYffhUTBlJZeJWYrmgeM?=
 =?us-ascii?Q?0hk+T5zx/2lGTip0hp32dDKC9J8iLpMizVUKry4Ynq8cOQih1kfXowm2FINS?=
 =?us-ascii?Q?SLtIH335WoTvVyaeXtFW783eHdJnyOXFMd1rSNJZhyU4k8CEnUidwyMUnXwR?=
 =?us-ascii?Q?DsGnoitaankfF7Wwc4BUBq9vDdq8gUZjnjN4lQ4zKeSiOo3eRVYOTXW9PQgK?=
 =?us-ascii?Q?MN+SK9QYoWr5l3mdOhU9Tgc3DjkA7u30+N4vdEs0IqYFdoFWsHaSnS3Qi/gw?=
 =?us-ascii?Q?aiccxKde6UoGvN2/xhuAK/fd+YUciFs+BmoQjdbf+P/Peg=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?hLnFuSxJ5O860quVwG11456PBbBAvj2n0DklEOa5mvNpHKlDFbCEH4LVHIJe?=
 =?us-ascii?Q?9RhSZrTnjowFYCNoyxNIaNv0zDKig7ClRy7mbY3V91nT4HVP/CKcldvDrh/h?=
 =?us-ascii?Q?Y/3Va2YjlFqBq71Gxu/dlyunS2p4h6P4HB7vN74NWZc6ugGOhI43b58P4lyu?=
 =?us-ascii?Q?fPNJH8WRIsDcclcuLVpl3KpdNU8zvOSMiw4WmdU6woD7ubrm1fz11zcXHXjw?=
 =?us-ascii?Q?47CzqcUyc1uUhFggt/Ef7y/nIsarpZDckF3dfDy7fSYSdZXHUOymZE0+SoqG?=
 =?us-ascii?Q?py+Xgtzy7w5eAqYNXuK3G4geeNWHsbIZN8atRjeSyZt5WHY8sxJ531EMpghh?=
 =?us-ascii?Q?f3HFRSPBQ9/4atdKzP9D4fG97qHP4t8ub8vBIYxKv1XKLt4vRKCJY5qGCz66?=
 =?us-ascii?Q?CInJHTlVwznnhHWaTJrSIQG1Ka5fSENC6AUDQNQldT2Y+F9cn7Gd6rDb0ldA?=
 =?us-ascii?Q?mcADjUOq9mKttgbz5G915mrqh2S0SI4vHFqT/lCQyZB7gu5ZjtNO57QwjNP4?=
 =?us-ascii?Q?/zb+0wnh9quCHOIqACrMzgXYdAQu7FXzoLb6KU2vyN0EexMkAaJdeTifPy4r?=
 =?us-ascii?Q?yobo4uLJGHyhN5MKXSPBNwuKU7EqZOFl257hoydIV0SkNY+53YhEg7jVzFXq?=
 =?us-ascii?Q?j1Z+oSZ9Vc1nxxWbQtnkWU7hAjGWYpiy4mIciWO2B+wyomQlpD19FcwAkWnp?=
 =?us-ascii?Q?fqTSrVy0FVQrzUzOk3H2Xt1cBZqbzxBEaerHYZa1t/RtVlW8UDeJmuBrJqvQ?=
 =?us-ascii?Q?mT5KZn9/RtifVbwdNYowWpaGW6UH6uQ+dJ5TJQuQ/KscYNzIBnh9GHSfgIK9?=
 =?us-ascii?Q?dZ/ClJITfnbh6yXUYlVZHGTJacuonQ46XX1wydSzxdGFP1swDT2Py9MFjUTK?=
 =?us-ascii?Q?8YzEqklhyBR1ub4YLTz/gSZ5r6tFv/wOfI7gL7GTBV7joxxsqdnBIy3+zJq1?=
 =?us-ascii?Q?H8cDhDT8B9rMvralAOIlTpSDakkvlSm3j3JoRymsaz9tlW+ZXg3QVrp5HrxO?=
 =?us-ascii?Q?wv1jCF81mTgCpVozG844tJrWjLGXtJSJmfi6npNdJ5opAfcY1HybIB4QTsRD?=
 =?us-ascii?Q?2lEaGYx/zos0673z28zitzi7+Uk6uc1Jku5l68tdSgFEPkqN0jG+50lTjumk?=
 =?us-ascii?Q?z8veSwXRS9FQlT4qUPxbTNr6gqbUdJPPRx0jh76UcJ9yd7VlxsYu2wdnlXVv?=
 =?us-ascii?Q?OuOUhwYIB2E2xSRt3uvFt701azlYvQcTIeG+CPdUle4f5inzmvV8Z6tUAU6y?=
 =?us-ascii?Q?DDfRR07SCrH7wgnQDlSmd82ZC8gkEAqCzDAgK2HY5MI98fGJZi76Q2aVI8g3?=
 =?us-ascii?Q?n+M9KGT8d1M4PBAYvon7Iw/h+P7/lRMVl1GTLARKj92Yjl4exlPxwtdLE4Nl?=
 =?us-ascii?Q?n30rPz4hdP/B9fSxLrHtfcIKg53ORx7J0CyDNwrWmyQC/V/Ja6ZSkBBus0PQ?=
 =?us-ascii?Q?eakm85O9ZOwKsbrPzWmp/xgNhqcFkRl4F2sleQweNAz0xUo2UczLhcjs7XuX?=
 =?us-ascii?Q?obmIsOomlU/xPJbECyBxyYEqICHuEJZ2XUzBoQaG7K8dwSlGsQZxGRMCzxwS?=
 =?us-ascii?Q?V5lIiqqeIm+Qg+gWDWGzIhFhHptaE1GGqdwYeHbq3LdDPtK668YtaN03sPgR?=
 =?us-ascii?Q?Ag=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 472b2694-30f1-443e-dd14-08dc64f57ebc
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Apr 2024 07:01:13.5643 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: THOx3rxwb4ZQHnVtLZIcMLlsESH/UUXFPCQMEN59Uag1FDJcApGbir1KEcGzKsDetUVKYaIOnkzYyNCKgVJBnfs2q03YcQ9YFM3461wHKbc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6096
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
> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of
> Matthew Brost
> Sent: 25 April 2024 11:25
> To: intel-xe@lists.freedesktop.org
> Cc: Brost, Matthew <matthew.brost@intel.com>
> Subject: [PATCH v2 3/5] drm/xe:
> s/ENGINE_STATE_KILLED/EXEC_QUEUE_STATE_KILLED
>=20
> Exec queue has replaced engine nomenclature.
>=20
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc_submit.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c
> b/drivers/gpu/drm/xe/xe_guc_submit.c
> index b26f374ca20b..19f92a107342 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -58,7 +58,7 @@ exec_queue_to_guc(struct xe_exec_queue *q)
>  #define EXEC_QUEUE_STATE_DESTROYED		(1 << 4)
>  #define EXEC_QUEUE_STATE_SUSPENDED		(1 << 5)
>  #define EXEC_QUEUE_STATE_RESET		(1 << 6)
> -#define ENGINE_STATE_KILLED		(1 << 7)
> +#define EXEC_QUEUE_STATE_KILLED			(1 << 7)
>=20
>  static bool exec_queue_registered(struct xe_exec_queue *q)  { @@ -167,12
> +167,12 @@ static void set_exec_queue_reset(struct xe_exec_queue *q)
>=20
>  static bool exec_queue_killed(struct xe_exec_queue *q)  {
> -	return atomic_read(&q->guc->state) & ENGINE_STATE_KILLED;
> +	return atomic_read(&q->guc->state) & EXEC_QUEUE_STATE_KILLED;
>  }
>=20
>  static void set_exec_queue_killed(struct xe_exec_queue *q)  {
> -	atomic_or(ENGINE_STATE_KILLED, &q->guc->state);
> +	atomic_or(EXEC_QUEUE_STATE_KILLED, &q->guc->state);

LGTM
Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

>  }
>=20
>  static bool exec_queue_killed_or_banned(struct xe_exec_queue *q)
> --
> 2.34.1

