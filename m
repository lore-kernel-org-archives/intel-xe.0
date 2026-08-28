Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15E72C61DBD
	for <intel-xe@archiver.kernel.org>; Fri, 28 Aug 2026 05:32:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4D2110E472;
	Fri, 28 Aug 2026 05:32:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Qe5Ktcf5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A51C210E472
 for <intel-xe@lists.freedesktop.org>; Fri, 28 Aug 2026 05:32:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787895122; x=1819431122;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=kyXiK2kizruP0SIsnMHulyNsAAwpWsMbOqDn3MNDjCY=;
 b=Qe5Ktcf5b+dtKKGE4izLg3UZ+riIg3Cf84c0iuDcoK0ZNP/WTTXjHjP/
 GO7sziU93kUOSH+DWyPWLXkTdW2KB7Dac+JhoiPzLKyPNtHVGgQLBsTQN
 1kS5eLQDoOE8zFbUkMHwJTq+MwlKEFI9qCWHWJevKfqAyrzwOyTNvnFW4
 VcBsJ1UzTVuJuF12GDyfCL0FFTQZ4s0dBws7jXEUvD/Jhc28VsM1cxZJI
 aDL1dBejyFomaGVgGHGOuRRyQmvIWjC5Ixyafeve0+jd+see76ctkIAGD
 AjsrcQLA23cWo7BGJsmDsSSLsBA9xuwMJJ0S/99s+MKbVfeGD4rPxGwNd g==;
X-CSE-ConnectionGUID: bFe1LGG8SMOYYvJNmF/E2g==
X-CSE-MsgGUID: qIJ/w8ByR3aCsgOL8fRm4Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11888"; a="105923491"
X-IronPort-AV: E=Sophos;i="6.25,248,1779174000"; d="scan'208";a="105923491"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2026 22:32:02 -0700
X-CSE-ConnectionGUID: iuZ/hUwXSTOaLiWjtH5KBA==
X-CSE-MsgGUID: oh0Few4cQ1OgaPkHyFr9Gw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,248,1779174000"; d="scan'208";a="272281113"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2026 22:31:59 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 27 Aug 2026 22:31:57 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Thu, 27 Aug 2026 22:31:57 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.59)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 27 Aug 2026 22:31:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GH6uG5migxo99wWt8BzouVUx+lUHObAvNXY0E+8DuCPS2CldEo9k68ibxrN88Ve0/atutB7biZ0x5a+erDFsm9mlj0YrhUWt8DPeOeBAJh2ZvtAVUzCio+xdHMlZXoT2wnB5+scJ5po0hUj+WXe54sGy0cZyozLLP7xFhrVhi7g3aF3k4J4nk5HRu0fAoJ4x9bc2it4lZIdosLuJ9KdTGUZaYn5Q248rYx3jbQVV+RwCMlkmQRkKWPI0IQ/tTKn5/omsLVl/aIZMTzHR76Md/Tx4p25gANO0Uo068iqU8Ds9tyNlKa3XfXbN1MlgRI5NRO9g/HyA9UZvo/P1j45CGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CbKB+ioOowM73ArfG3ECLbYB4pmSxAeKKnfHrYbe7/U=;
 b=PgLIAmGw2FdPUcl6O+bVfGifGF5ahL9aHdsySRsJz73e6HuIC0Nky1T73VJh6mvu1ly0NlvTwsE/kPFbFXwCFtz7ZKpPyPQQ3aWF+bRwam/h0hzUhkskLRhv9eFwrwhy1n+9w1lNa3pOU6kTQs9J3H2JXh+7NzvjvC8zXYIoWS119eEQtBJqjQ2Z1+7OqK3k1jiBtFkJ0QmLn9CpE015zl0RPZzx6rQA15rq/h+ylOHll/oKgUvoPCj880pFyIvUmRrq/1bBUMKm81LFK3w/cjJrx6DXvQhUmX0ZV7zt4h+eUNo81/a9TPtsqW4WfUn8SEUyzG+PXweMkK6PmHf9gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB8718.namprd11.prod.outlook.com (2603:10b6:8:1b9::20)
 by CO1PR11MB5185.namprd11.prod.outlook.com (2603:10b6:303:6e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.10; Fri, 28 Aug
 2026 05:31:50 +0000
Received: from DS0PR11MB8718.namprd11.prod.outlook.com
 ([fe80::6aa:411d:4bfa:619c]) by DS0PR11MB8718.namprd11.prod.outlook.com
 ([fe80::6aa:411d:4bfa:619c%4]) with mapi id 15.21.0360.008; Fri, 28 Aug 2026
 05:31:50 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: Andi Shyti <andi.shyti@kernel.org>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>, "Vivi, Rodrigo"
 <rodrigo.vivi@intel.com>, "Wajdeczko, Michal" <michal.wajdeczko@intel.com>,
 "Souza, Jose" <jose.souza@intel.com>, "Mrozek, Michal"
 <michal.mrozek@intel.com>
Subject: RE: [PATCH V18 13/14] drm/xe/uapi: Expose ban reason in
 EXEC_QUEUE_GET_PROPERTY_BAN
Thread-Topic: [PATCH V18 13/14] drm/xe/uapi: Expose ban reason in
 EXEC_QUEUE_GET_PROPERTY_BAN
Thread-Index: AQHdNWIjHlgSD9InZkGQTp/2IP44LrayOH2AgAC5oBA=
Date: Fri, 28 Aug 2026 05:31:50 +0000
Message-ID: <DS0PR11MB87189B9F100D0C127724DA6081AC2@DS0PR11MB8718.namprd11.prod.outlook.com>
References: <20260826135136.204044-16-tejas.upadhyay@intel.com>
 <20260826135136.204044-29-tejas.upadhyay@intel.com>
 <apCBONh8uZNA4ja5@zenone.zhora.eu>
In-Reply-To: <apCBONh8uZNA4ja5@zenone.zhora.eu>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB8718:EE_|CO1PR11MB5185:EE_
x-ms-office365-filtering-correlation-id: 6f07efff-da7e-4e46-5e84-08df04c5a929
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|23010399003|366016|1800799024|376014|10067099003|6133799003|18002099003|22082099003|11063799006|4143699003|56012099006|38070700021;
x-microsoft-antispam-message-info: FGB43PutNub2N3cFubwEo97qHt0SZY8KkU9feI+xOpXOGVPhDqNnx4tDluFRZEKgQdifcTle740e7N+wZqT/d40uTbKR3xG/f3iyfygVG//fLeQJ0RAc/83MWHVfREZK6LqRz/aQKb9r6zBrdTqMpC4Eyv2Q9ANEzg8OZmDlXgVjyt5YOdMPq/Q+UIjfRIfpNptEdOpg/6QQJRUHZpl9TTvCgdc/S6ku/azXFgUqBofn4rrk7QgNhy8cTQM6VoMEALW5j09j4Bq8YpMA82qmEKPFO7KXfk9cGNQUWQDweDgijzZtfjeaAw/xqe7bLgw8yCHNsJpj8eNlylTj6MGnTkYGNkrnA+KizQ6L70FgmH4u7DNi6gKTIi3SGmUogipabTgtRqY9RhUsr6NvA7aIUbpxDoRf2/Y70K3lw159VoKql3Y5+mbU4fi+fVru1ybUaua1jSRqWRchGpEzZEPTXvun14lB1D41YI7avBO4bKiWi3LaArTpHNPHWCAf0fw1CS2GaTuRUd+9wRQWPPbQeJmuwqORlJA01kYKblkQzjNSqa0xj9tgKRn3hmIdqPp1xK+dJQlRW0Raw1JLwUC8TNL+frt4GF7TpS8AbR2CzXNBK44CbWZSwN4qrr2AfLTx9aLS/NhWQr3IjISMPLDOwab4+7hbpeDTZEyVQXoyKRHhPEeE3RWUjT6qY0B3jdWqmZUGxzFhJUQzHGjDUP2sKjO+VOUe4/3YxJtxW+ZYOOA=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8718.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(10067099003)(6133799003)(18002099003)(22082099003)(11063799006)(4143699003)(56012099006)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?bTzM2gXwunbbXNCHlIKY5QPFTugAt8OVJgd24On54kUpIlrZ2pLy96ihiAHI?=
 =?us-ascii?Q?HyuL6h8M+GwZQQFyQnjSEWRsTpBnqiSXFz0RXcirrsFns0Ee49dxDehqwBvt?=
 =?us-ascii?Q?w73wSDZ6P9Z9sU6W4D4ykrEOztTwj/7DZJkd7orewgNEznbESway2uL7kzDu?=
 =?us-ascii?Q?ZxYnrEOipHbTDmhZs/qkBRLKqGzdsf0TqrzzuPwylr/7sdv5YChIGRHCy20b?=
 =?us-ascii?Q?S1GmbgMuABqnp4IMYmnMZJzJ7CUpnXfnW+gjMncGNxtvUOLcDZyKdXJWettZ?=
 =?us-ascii?Q?2OhUyDSqwKQK6UzKYUIsNWWUvADaItaV5GGZdTmYURj77qQzYeijjNmSfXpK?=
 =?us-ascii?Q?Pf6YzsAqo2SOqkrYhxbXklp8t91Kvrkwf2+DctXoxt1cXYbx37mI++FADvtK?=
 =?us-ascii?Q?syEI8fNGTMOKHsFYJp/Ru1K/sBh9ybrztTFebGFBfTISNn4ct53459PuQzGj?=
 =?us-ascii?Q?FjWYCHfrG7HMEUc+IZ3Qc6Qe780VCUrqfnKVRkyN1gKDyxkAAQxt8IYREqGr?=
 =?us-ascii?Q?eOEc05VIxlczsO/vuETej9oukl3K6NjL3MrzbvUybdssjHNi0PITMvFbX4BL?=
 =?us-ascii?Q?sNGuLukteMMRMX3/6ipq+vDasdYWtwa9LJj0WzJ9GI7VAhW8mqgF69caNvi4?=
 =?us-ascii?Q?YG7gWA8sgiO4hjdUY454+l0109s/fCHFFZuO8/FELo4TOQ5d2Kc9wY0C/YGk?=
 =?us-ascii?Q?CwoJHR3ugKemoFoBort3MJ5RgTPmtj9YQS3LbemZmx+8+rTpBWEvMbP1kNPt?=
 =?us-ascii?Q?XZySGV/jUoDT6xuvhrHVlXryPjcETtg5vrdJ6HVnO8itpnWi919srWv1PiTT?=
 =?us-ascii?Q?dIOJFq4TAtNy0pZTag31tUVX+gvmbtBqWe97fNiOCyKxhenO1+WSgW97v5qI?=
 =?us-ascii?Q?6I6C4f7Qn3ef69VgvHdoEluwuspT963xC6clB2xp9meSJ3dM4KGjIw5KuUiS?=
 =?us-ascii?Q?CkCh25mEYn/6TS6M5Nsmi++25l1X/tnRTH8hRJYsW5XrUQOoA+FMit/PIG6j?=
 =?us-ascii?Q?/6dgjiEfy4v7d4tYEhJsAJvSpXM090BXuaMkc0fdoHUiPDeIMGaNqOUVhHiL?=
 =?us-ascii?Q?4L1YlS9clDMgkjbs/XaSUAx18UhI7BD8bSI2sYTrmFoSXBXMWugYjWb6BEji?=
 =?us-ascii?Q?9m9SBwTi36jTW1Rc5gsTMyipzfS4GkZx7VIO1oXC4jh29jOHo1ahiMCcruaR?=
 =?us-ascii?Q?tXeJ+NqPf7GNoj3Aoydu4L44V5vv888eXnC4f81O8cSw4Sux599EGxkUqrXg?=
 =?us-ascii?Q?fx014edV3fHviDHlEWq7x7peCXC5zUYp/8RmzI00D2HyZ3kVV2rAT5RmQZ0a?=
 =?us-ascii?Q?lvzH54MwiFkWgZK24vLrKCr0J7RQId/8iVW8lenk5Rg7k4/kDFwVDZXO3Pkr?=
 =?us-ascii?Q?/g6bU8x2Liy25UJKFHAAF4PhnN66kIeO4EAuPtoHBBv6jHdHX/sc4gy8SteO?=
 =?us-ascii?Q?7M5MK6bLPyOVctB8jLiiNoYQPQl4jeXYM+naKzX8atemsAudsoFSQr8/lZW3?=
 =?us-ascii?Q?Fjfc4qrINb002MmYER76/sx/nhyeMu8hEPMR8pO+wTmOITS8iE2SX9nE6t2P?=
 =?us-ascii?Q?DQyx7EIerYs+RSlQOBWIUllrk7P8RN9syLvwqMRBa011pv7KDI+B5fGkFTqY?=
 =?us-ascii?Q?jkGAQrGzl/grMaZsTUlgaC6hoXeev5dRNbEBCYFYJAMJTbhSQPCkexIIwCFL?=
 =?us-ascii?Q?bJ2ruGOY9RNhWmwQJCgmpgImcEfayFwLHsaqYhdIiQSOVpGAc+41Q/Izqt9u?=
 =?us-ascii?Q?MWHg4Z4QPQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: nHmpqunRbCpdk2TOWXhjWPHXpyatdXPPut9vZ959j5KN6qd6zHAtcXfDkXA0wKc1OMgR5ld3lfNdYU0ENQPfRh1nTv+n0HxdLQxyIwGhtKp46GKivK/hyS8yKeneSwl7ao48Rznhh93x0402pzHS2NJV34MGR9xTy9lyv0KEJ95SjnKo+OrpaL8/9TjZwwsv0KV0WdU769UktTyBPTphDLhjZVzYKpbtQF+24gtLe034cvRThMwq+1xHUshiG3bB32FzdGR0PgO3txH7PB5dLu25+6b8p66GEdBtygbw4y1JpnMa5u5zphetBenB95j19Xx74yxS7w/uqSV6H9sB4Q==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8718.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f07efff-da7e-4e46-5e84-08df04c5a929
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Aug 2026 05:31:50.2730 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rpbzDR+6zFaBPDG3biNlTVoOAfvtqtu2ybVhVGAL9kGXPyg2fMO0L1e2rpiQ8hRM1R51OSfckgD5liOiKrKKRFO5BtHylPAB6jSHnmyXvcA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5185
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
> From: Andi Shyti <andi.shyti@kernel.org>
> Sent: 27 August 2026 23:57
> To: Upadhyay, Tejas <tejas.upadhyay@intel.com>
> Cc: intel-xe@lists.freedesktop.org; Ghimiray, Himal Prasad
> <himal.prasad.ghimiray@intel.com>; Vivi, Rodrigo <rodrigo.vivi@intel.com>=
;
> Wajdeczko, Michal <michal.wajdeczko@intel.com>; Souza, Jose
> <jose.souza@intel.com>; Mrozek, Michal <michal.mrozek@intel.com>
> Subject: Re: [PATCH V18 13/14] drm/xe/uapi: Expose ban reason in
> EXEC_QUEUE_GET_PROPERTY_BAN
>=20
> > @@ -582,6 +583,7 @@ u64 xe_ttm_vram_get_avail(struct
> > ttm_resource_manager *man)
> >
> >  static int xe_ttm_vram_purge_page(struct xe_device *xe, struct xe_bo
> > *bo)  {
> > +	u32	q_flag =3D
> DRM_XE_EXEC_QUEUE_BAN_REASON_PAGE_OFFLINE;
>=20
> you have a spurious tab here.

Okay, don't know checkpatch --strict did not complain. I will remove it any=
way in next version.

Tejas
>=20
> >  	struct ttm_operation_ctx ctx =3D {};
> >  	struct xe_exec_queue *q_to_put =3D NULL;
> >  	struct xe_exec_queue *q =3D NULL;
