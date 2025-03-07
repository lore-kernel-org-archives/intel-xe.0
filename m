Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3060C19F32
	for <intel-xe@archiver.kernel.org>; Fri,  7 Mar 2025 15:35:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97E4910E0F0;
	Fri,  7 Mar 2025 15:35:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HMmJEl15";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 078FF10E0F0
 for <intel-xe@lists.freedesktop.org>; Fri,  7 Mar 2025 15:35:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741361744; x=1772897744;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Z9wtbswczOypljxGQoQXZOw2czKomJ0hnkOk+7do2Lc=;
 b=HMmJEl152F4244Z/L21zprN9VjZ5bxo5IhWkmDhJ0/enK5F36uaJpO6W
 8NgkwOzS1LLPUPMV1bb8MclND+vkpAaqb/jjjeisSR1GLac/inqWkU1yu
 jB1xMdUTGVuf09htLPIy5FS4Fa2aXfgpm1svEwsQFp4QERbZGbkWvX3Fh
 b2IkTFqJqo5JAUtad4MxhAHzRIMy2uqT25Iq64iini8lPnXuzCHe87tQ4
 NG8QwAbD8dqHnGlfr/Ex3u81nKBgiz591dNTpcyUxY6twQHwyvi/A7IFH
 k8tOy8E/R42hEDkjuLMKisVTuGV86r4Ca8aNDArs9aoFTVbhxpzPMv4hm A==;
X-CSE-ConnectionGUID: tU8xr1UeQHmul7SACRuBPA==
X-CSE-MsgGUID: Mbqf+hTRTOaFdF1YOH85SA==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="41581018"
X-IronPort-AV: E=Sophos;i="6.14,229,1736841600"; d="scan'208";a="41581018"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2025 07:35:44 -0800
X-CSE-ConnectionGUID: CjLTqzaISJakqnn5ROETvQ==
X-CSE-MsgGUID: ln5dWlvlRLit+jo7D+514A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,229,1736841600"; d="scan'208";a="119344049"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Mar 2025 07:35:45 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 7 Mar 2025 07:35:42 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Fri, 7 Mar 2025 07:35:42 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.43) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 7 Mar 2025 07:35:41 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rqWXR3Xk72A8dTAssw48w8QYoIU8kvei15eAL1ustmjWjKxm9NrH3grrkUrVAU0I4ORLcyGMsQ/IaSWZflysqPxYUIKn9djhNIfQsVgUnVTY11RGVVuTgjMAdRNJTYQPKWPFMszp/+jNw3J42rwvO8u5KgV+UjuxWJ5hGuAq+LJj6jamo7FeX506/kSuApebIoch0N+OgjlLx3HcLZeqHGge72Bp6N7eZ6LWHc3uejeU/C+QYXVR31ui/Rq9LgRSLaDnANgSdJFnOxLTk/aJCng8dCpdQ7xj0i6TM13xQ32SLiCbhT/cX0NtEo2s1g2LieYYzGXOi+8v7wDTDWiobQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d8Bx6MbLwE4MfbgHfEfrJIveWh2clV3dVguqL1daJz8=;
 b=j5RzWFEABRBa/C4AGeQKEOoIDuvU8kGOzVn6TlNVtzIWyheWYQGsMzlUaKVcrlRcaDk3FHzq8jaw+NahxZdeBQkzBy/sH9a7FaiRv+dqVomvRzbEM4clxLrDcp01C7IwbNH87qojSVStFAOgwSuns1jxEdzP4mmC1Utk4Y9ngPEzXmJDJTTsFX6LUkEbzXMBabJrbH4Ho4eXyKvx2oTpjT6TC2WjyL9wMBblzo4ovvkuz3J6AU3q9SSn++uSDY785tweZ8vBnoxGI9xvGpG+TXEjFA3LreaIoQ8X+bTwoInwKszabZsZF5195vz/0t0NZkPDA5vOrAb0xWm5Zk+UiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by CY5PR11MB6416.namprd11.prod.outlook.com (2603:10b6:930:34::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.17; Fri, 7 Mar
 2025 15:35:39 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%3]) with mapi id 15.20.8511.020; Fri, 7 Mar 2025
 15:35:39 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
CC: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>, "Harrison, John C"
 <john.c.harrison@intel.com>, "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
Subject: RE: [PATCH] drm/xe/guc_pc: Retry and wait longer for GuC PC start
Thread-Topic: [PATCH] drm/xe/guc_pc: Retry and wait longer for GuC PC start
Thread-Index: AQHbjvD3DfKZwP9cykysgXm/A9xJqbNnyK3g
Date: Fri, 7 Mar 2025 15:35:39 +0000
Message-ID: <CH0PR11MB54444896702CEF7CDBAD08C8E5D52@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20250306233906.1043286-1-rodrigo.vivi@intel.com>
In-Reply-To: <20250306233906.1043286-1-rodrigo.vivi@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|CY5PR11MB6416:EE_
x-ms-office365-filtering-correlation-id: 8186da4b-9176-4fc5-8283-08dd5d8db6fb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?2gnaYVO5J1ygyFM+fQb51i7pmj0D5kW/SVgLdotPwgg/F4d9dkXhYuPed29G?=
 =?us-ascii?Q?r/U2mPjfV6CEDYK8B8KUiYTxWyverO0M1j25JWcAnNPp2FvRpUlTRgYDSZ5h?=
 =?us-ascii?Q?cq2qgT4p57NXEtEpFRWo6XSd3/ubro9PPICKqo2ylOaFd3QOos2t4/C0qrRr?=
 =?us-ascii?Q?dD/NXsnKz3Il7KP8yXx7t4yFgC9WIWHOF7r8SSoWnL8DH09QuKYarnvPIuDb?=
 =?us-ascii?Q?LA4NKwhQKtSB5hjXa0P6GP+1cDjW+kh2KQVwcgb88SjrHeDnuvUx150pTOqL?=
 =?us-ascii?Q?514gMpL/PGtNMpOUuN/0DxIaCe2g55g/wkP1nkiYLqzCuJ4PP8xfVwvExDNf?=
 =?us-ascii?Q?hFga6hqTNd3V8sv1y2McPYTPg7KLuEBbyMSi/MLpieVZGIfahgSRCwyKLw1+?=
 =?us-ascii?Q?+CS1mIEbmKepQ36CQnvSuJTLOccDgVSPZEvYlefmXbKN4A6k/CgNFfHVODwB?=
 =?us-ascii?Q?QBUu8/g7pWO+AREqPEFXexkIPTWYPbiNXA6xYgVZZTH2NXQvvZxMSEhtbj+h?=
 =?us-ascii?Q?E7WplmLPDYeaCCc54oGam+LQPPqU1nEDzU1h34re6D1jo22YYP6dFZEVdFA5?=
 =?us-ascii?Q?s4DGTu/4HCUd21k8e0G9K09A/tOhS46CyQteWMbAunU+99LxHCammgqHfeFW?=
 =?us-ascii?Q?oRPTdPwUKJQQXPLUZoyn+JbJ9Ho59XG2q4o/38JHYDkshnZ5oqiqlZDIPR5b?=
 =?us-ascii?Q?bf/8MrM+O2VJ6gpsCWUEE0X7cheZwkxDSEFHn30ymfOjfMSW+RxY4oBZtQ8N?=
 =?us-ascii?Q?ZfykFEKjGwXEIKqotg2kicIRXNUQ2Q16bgNCvFBAWULbegg3HHoKIimQBIn0?=
 =?us-ascii?Q?EbS7qoXcyFjSonwsUiM+51scqq/2tmN1mYYbxa6KdpHFsLGS7tBctkTVBjK6?=
 =?us-ascii?Q?kAR/MHHgj31CzFW7sgC6TjbDreScM4Ydg61hpSvtb8U1gPGixJ7fV1IClCl+?=
 =?us-ascii?Q?pWTDWmADM/utvkFCZ9F24MFrdYh0tTPMZ2MbX/O1PFxU3a6Pifr/LeHyI/JL?=
 =?us-ascii?Q?kD/DdRJPjJUNX6ne+ZB6K19nx38LCy5SAKsGpqELxStEJa3lplnxlKxm0n99?=
 =?us-ascii?Q?5B2uYTE2XleJlseZqihllpvFp7GuPE5A24hSY74QHNX4co1pp5dBG2nrZGNx?=
 =?us-ascii?Q?/aFZJGSaX98Dsz54TbfCo9pbkaK7+WrqakM1cQRjJXccuVEfFSgtd/vW51Mf?=
 =?us-ascii?Q?rceLZyjwK+7+xPFSoyc+6hcSVs7pfmN9+0PaOZneop/XP1cLgwr7ZcITirHy?=
 =?us-ascii?Q?GqHkkFT413YRG2o4MwkmLsudKHuYPsIl2u7Tsr/ibvL9Bv+5p8s6VI0TfSFu?=
 =?us-ascii?Q?JbhgP0rzH8C2fPgKdgSUKeDL/9pELI4M18koGhGwIN/e8FMv8fkYSJcU4pxc?=
 =?us-ascii?Q?gzw06dymku5WToUtLn1IkEDKYb/f7lOIMHptueUS/BjGO3hDIrHTWjX+U9Y2?=
 =?us-ascii?Q?SmE5nFUQZ9BaOaVJnevZxRpgWwAPf0bm?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?VOqx6j9rPHuj8GA10vpN1pmW7w5Auek7vDn3PKGu0x+ks+xWioTzEXt4l3e+?=
 =?us-ascii?Q?sgVWx/VpOtSNEPTa8hCin0Juz4v1gMKYqMvKhch/fiNMUWF+U34F3p0bFD7R?=
 =?us-ascii?Q?D9pYqSQCFf7yvGelhGA0XtSmdP484sIF7X2KmbOZ1754C6SwXp9t837vKM4S?=
 =?us-ascii?Q?7BftQFcNq9RTVGwrEamrTsWmScaqTN0s9ZHIp4P4wHrr1Dt3epTl8eJPRMv9?=
 =?us-ascii?Q?lphYcQMFYai14Rq/52LT0/ybbxkN8sTmAMeXkXg7/FeMmmoFlM59MDceLDsc?=
 =?us-ascii?Q?UO1jK1rewziWPwajEirfhJL4neajnLRc7jnNepIaaoJXzd9bKn9gjlqIsF+v?=
 =?us-ascii?Q?Q50wGuEoTkkgzMmWwtzdQR1boFoeS3eAAWVPUZK19ePRoYWd9/XflZo0h6iz?=
 =?us-ascii?Q?1klRhAUmzVM9VA3QSMDigwjfICzabKQ20cHiWnsT4nwBgsNP+lq8IKsMDa3N?=
 =?us-ascii?Q?A3Hy57UDNr1Ng8u6Jf5v6bToPA8XRGzXd8YJWICMmxX65U7VJFJ7CFW3WBme?=
 =?us-ascii?Q?UUqs2vxRKDg1le8dIP99sZM+qruEwwdXi+DxZR0kCZHHkJdsR+HB0IsP3AFb?=
 =?us-ascii?Q?ML2CS227RBjb1KzASzEv9kXFuNPfvzssD/I2aIiExsnExA6QoB8a6TtFOhyQ?=
 =?us-ascii?Q?hniiwwn45F3U9931jtBNs596+fG2VkMvVebTPR91b4/5PKmdENAuO1Wynosd?=
 =?us-ascii?Q?RdhYhyUpz8/oIwcZI7XisejMUBixEGytl2geAxx6tT4r82iifhy3SuVLrdGA?=
 =?us-ascii?Q?D8DPKIWMV+hrPLCgSLwD8mReSFJgjinF+piWbK75wSZEtYlC6h07J+QL3YKx?=
 =?us-ascii?Q?CURto8k9zYsKINgVCTQQCWHHBjCwn/vSGVKBMrmBALZtt9AzeGFJKzC43hyC?=
 =?us-ascii?Q?f2Db9BGrvzN8gI8V5kTIp6ZULSvj5YD9ARBqF4f3z9tGzPMIvgpogaI3cOd7?=
 =?us-ascii?Q?GV3Jax4mIJGoHFJvjH0ysiMCyeVEeT405lVBP4wsR5DQ7MOyQUqStieGN3hl?=
 =?us-ascii?Q?eu/SUhjG2T+L+leZkwKiblJiFYBanSbXe9clLoAeWfTExE3Dj1a9MnwP9xeQ?=
 =?us-ascii?Q?ObjyGvQOvoN/oES0fT+kTyX7Vh+8+/gtIQmqddx/W/a64SS3+Fu6c6NTNev1?=
 =?us-ascii?Q?4HtbsJkzRCD8fFmrQQtL5zPHC4WtW+oKohMWOy2iv6bTlQn7PCYNJbFPT0Ec?=
 =?us-ascii?Q?NL9tHI/uGYUhTxJaS3tunzLdbVKN/gPYox7GlPemiOqngnz7JhlH0K4aJXPU?=
 =?us-ascii?Q?I3pLHDkDt9icj31IPDGhpP4A4A+ELzjBQVh9lFAGduGRw+3OMVL0EhZJvaBj?=
 =?us-ascii?Q?i9rB0MaJ0jYdn3C2nNjZfXsa5yRthuMdGxAOBs/k4QJr0mrWpdDi79YX1N7b?=
 =?us-ascii?Q?S1XamcZusGOE/t5i76Yqo3dzsl7+w4AV8N1+UV/s84OsVB1Xw9PTUISvP63q?=
 =?us-ascii?Q?XsK10legbF4C+t+nnHHCwJmj0kf9g6OcJ/oHpPaNX7GVtcFrWY5R3BuuQk9z?=
 =?us-ascii?Q?o9HsQfzFoEOznoVtXaM6dtSoWD81E9T7j0UOTsejhR+fBA609trm7F+XCWQ7?=
 =?us-ascii?Q?CcMYnepFLt4BoTZOWtX8NW4+STOuFKMWWSH1WDXW?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8186da4b-9176-4fc5-8283-08dd5d8db6fb
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Mar 2025 15:35:39.8038 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0gfG+wZz0UfEjkNS/KqMvpH7B34PqBVnvrIRB2+L+nVIQHk9m8S2UZt2hNp0TntnEJXgIiuypEQ3BI/MAYekfL1MWavxLotM6T7qtov0N+s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6416
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
From: Vivi, Rodrigo <rodrigo.vivi@intel.com>=20
Sent: Thursday, March 6, 2025 3:39 PM
To: intel-xe@lists.freedesktop.org
Cc: Vivi, Rodrigo <rodrigo.vivi@intel.com>; Belgaumkar, Vinay <vinay.belgau=
mkar@intel.com>; Cavitt, Jonathan <jonathan.cavitt@intel.com>; Harrison, Jo=
hn C <john.c.harrison@intel.com>
Subject: [PATCH] drm/xe/guc_pc: Retry and wait longer for GuC PC start
>=20
> In a rare situation of thermal limit during resume, GuC can
> be slow and run into delays like this:
>=20
> xe 0000:00:02.0: [drm] GT1: excessive init time: 667ms! \
>    		 [status =3D 0x8002F034, timeouts =3D 0]
> xe 0000:00:02.0: [drm] GT1: excessive init time: \
>    		 [freq =3D 100MHz (req =3D 800MHz), before =3D 100MHz, \
>    		 perf_limit_reasons =3D 0x1C001000]
> xe 0000:00:02.0: [drm] *ERROR* GT1: GuC PC Start failed
> ------------[ cut here ]------------
> xe 0000:00:02.0: [drm] GT1: Failed to start GuC PC: -EIO
>=20
> When this happens, it will block entirely the GPU to be used.
> So, let's try and with a huge timeout in the hope it comes back.
>=20
> Also, let's collect some information on how long it is usually
> taking on situations like this, so perhaps the time can be tuned
> later.
>=20
> Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>
> Cc: John Harrison <John.C.Harrison@Intel.com>
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

s/rought/roughly for the comment next to SLPC_RESET_TIMEOUT_MS.
There are also two nits below, but nothing blocking.
Otherwise:
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_guc_pc.c | 53 +++++++++++++++++++++++++---------
>  1 file changed, 40 insertions(+), 13 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_p=
c.c
> index 25040efa043f..ec39a8f2781f 100644
> --- a/drivers/gpu/drm/xe/xe_guc_pc.c
> +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
> @@ -6,6 +6,7 @@
>  #include "xe_guc_pc.h"
> =20
>  #include <linux/delay.h>
> +#include <linux/ktime.h>
> =20
>  #include <drm/drm_managed.h>
>  #include <drm/drm_print.h>
> @@ -20,6 +21,7 @@
>  #include "xe_gt.h"
>  #include "xe_gt_idle.h"
>  #include "xe_gt_printk.h"
> +#include "xe_gt_throttle.h"
>  #include "xe_gt_types.h"
>  #include "xe_guc.h"
>  #include "xe_guc_ct.h"
> @@ -50,6 +52,9 @@
>  #define LNL_MERT_FREQ_CAP	800
>  #define BMG_MERT_FREQ_CAP	2133
> =20
> +#define SLPC_RESET_TIMEOUT_MS 5 /* rought 5ms, but no need for precision=
 */
> +#define SLPC_RESET_EXTENDED_TIMEOUT_MS 1000 /* To be used only at pc_sta=
rt */
> +
>  /**
>   * DOC: GuC Power Conservation (PC)
>   *
> @@ -114,9 +119,10 @@ static struct iosys_map *pc_to_maps(struct xe_guc_pc=
 *pc)
>  	 FIELD_PREP(HOST2GUC_PC_SLPC_REQUEST_MSG_1_EVENT_ARGC, count))
> =20
>  static int wait_for_pc_state(struct xe_guc_pc *pc,
> -			     enum slpc_global_state state)
> +			     enum slpc_global_state state,
> +			     int timeout_ms)
>  {

NIT:
If we're only planning on having two timeout times, and one of them is only
used once, maybe we should instead provide information about which case
to use, rather than providing the full timeout to the wait_for_pc_state
function?  I suspect that there isn't enough information in the xe_guc_pc
at the time to determine which case to use, so maybe we can just provide
a flag here to select the timeout instead.  Something like:

"""
#define SLPC_EXTENDED_TIMEOUT	BIT(1)
...
static int wait_for_pc_state(struct xe_guc_pc *pc,
			     enum slpc_global_state state,
			     int flags)
{
	/**
	 * Wait 5 ms in the base case, or 1 second on extended timeout.
	 * No need to be precise here, though.
	 */
	int timeout_us =3D 1000;
	timeout_us *=3D flag & SLPC_EXTENDED_TIMEOUT ?
			5 : 1000;
...
	if (wait_for_pc_state(pc, SLPC_GLOBAL_STATE_RUNNING, 0))
...
		if (wait_for_pc_state(pc, SLPC_GLOBAL_STATE_RUNNING,
				SLPC_EXTENDED_TIMEOUT)) {
"""
Either way works, though using flags instead might be more extensible.  On =
the
other hand, it's rather unlikely that we'll need to pass more options to th=
is
function in the near to distant future, so keeping it as is would also be f=
ine.

> -	int timeout_us =3D 5000; /* rought 5ms, but no need for precision */
> +	int timeout_us =3D 1000 * timeout_ms;
>  	int slept, wait =3D 10;
> =20
>  	xe_device_assert_mem_access(pc_to_xe(pc));
> @@ -165,7 +171,8 @@ static int pc_action_query_task_state(struct xe_guc_p=
c *pc)
>  	};
>  	int ret;
> =20
> -	if (wait_for_pc_state(pc, SLPC_GLOBAL_STATE_RUNNING))
> +	if (wait_for_pc_state(pc, SLPC_GLOBAL_STATE_RUNNING,
> +			      SLPC_RESET_TIMEOUT_MS))
>  		return -EAGAIN;
> =20
>  	/* Blocking here to ensure the results are ready before reading them */
> @@ -188,7 +195,8 @@ static int pc_action_set_param(struct xe_guc_pc *pc, =
u8 id, u32 value)
>  	};
>  	int ret;
> =20
> -	if (wait_for_pc_state(pc, SLPC_GLOBAL_STATE_RUNNING))
> +	if (wait_for_pc_state(pc, SLPC_GLOBAL_STATE_RUNNING,
> +			      SLPC_RESET_TIMEOUT_MS))
>  		return -EAGAIN;
> =20
>  	ret =3D xe_guc_ct_send(ct, action, ARRAY_SIZE(action), 0, 0);
> @@ -209,7 +217,8 @@ static int pc_action_unset_param(struct xe_guc_pc *pc=
, u8 id)
>  	struct xe_guc_ct *ct =3D &pc_to_guc(pc)->ct;
>  	int ret;
> =20
> -	if (wait_for_pc_state(pc, SLPC_GLOBAL_STATE_RUNNING))
> +	if (wait_for_pc_state(pc, SLPC_GLOBAL_STATE_RUNNING,
> +			      SLPC_RESET_TIMEOUT_MS))
>  		return -EAGAIN;
> =20
>  	ret =3D xe_guc_ct_send(ct, action, ARRAY_SIZE(action), 0, 0);
> @@ -443,6 +452,15 @@ u32 xe_guc_pc_get_act_freq(struct xe_guc_pc *pc)
>  	return freq;
>  }
> =20
> +static u32 get_cur_freq(struct xe_gt *gt)
> +{
> +	u32 freq;
> +
> +	freq =3D xe_mmio_read32(&gt->mmio, RPNSWREQ);
> +	freq =3D REG_FIELD_GET(REQ_RATIO_MASK, freq);
> +	return decode_freq(freq);
> +}

NIT:
Creating this helper function seems unrelated to this patch
and should probably be split into a separate one.  If you
decide to split this into a separate patch without any
additional changes, you can preemptively add my
Reviewed-by to that patch as well.
-Jonathan Cavitt

> +
>  /**
>   * xe_guc_pc_get_cur_freq - Get Current requested frequency
>   * @pc: The GuC PC
> @@ -466,10 +484,7 @@ int xe_guc_pc_get_cur_freq(struct xe_guc_pc *pc, u32=
 *freq)
>  		return -ETIMEDOUT;
>  	}
> =20
> -	*freq =3D xe_mmio_read32(&gt->mmio, RPNSWREQ);
> -
> -	*freq =3D REG_FIELD_GET(REQ_RATIO_MASK, *freq);
> -	*freq =3D decode_freq(*freq);
> +	*freq =3D get_cur_freq(gt);
> =20
>  	xe_force_wake_put(gt_to_fw(gt), fw_ref);
>  	return 0;
> @@ -1016,6 +1031,7 @@ int xe_guc_pc_start(struct xe_guc_pc *pc)
>  	struct xe_gt *gt =3D pc_to_gt(pc);
>  	u32 size =3D PAGE_ALIGN(sizeof(struct slpc_shared_data));
>  	unsigned int fw_ref;
> +	ktime_t earlier;
>  	int ret;
> =20
>  	xe_gt_assert(gt, xe_device_uc_enabled(xe));
> @@ -1040,14 +1056,25 @@ int xe_guc_pc_start(struct xe_guc_pc *pc)
>  	memset(pc->bo->vmap.vaddr, 0, size);
>  	slpc_shared_data_write(pc, header.size, size);
> =20
> +	earlier =3D ktime_get();
>  	ret =3D pc_action_reset(pc);
>  	if (ret)
>  		goto out;
> =20
> -	if (wait_for_pc_state(pc, SLPC_GLOBAL_STATE_RUNNING)) {
> -		xe_gt_err(gt, "GuC PC Start failed\n");
> -		ret =3D -EIO;
> -		goto out;
> +	if (wait_for_pc_state(pc, SLPC_GLOBAL_STATE_RUNNING,
> +			      SLPC_RESET_TIMEOUT_MS)) {
> +		xe_gt_warn(gt, "GuC PC start taking longer than normal [freq =3D %dMHz=
 (req =3D %dMHz), perf_limit_reasons =3D 0x%08X]\n",
> +			   xe_guc_pc_get_act_freq(pc), get_cur_freq(gt),
> +			   xe_gt_throttle_get_limit_reasons(gt));
> +
> +		if (wait_for_pc_state(pc, SLPC_GLOBAL_STATE_RUNNING,
> +				      SLPC_RESET_EXTENDED_TIMEOUT_MS)) {
> +			xe_gt_err(gt, "GuC PC Start failed: Dynamic GT frequency control and =
GT sleep states are now disabled.\n");
> +			goto out;
> +		}
> +
> +		xe_gt_warn(gt, "GuC PC excessive start time: %lldms",
> +			   ktime_ms_delta(ktime_get(), earlier));
>  	}
> =20
>  	ret =3D pc_init_freqs(pc);
> --=20
> 2.48.1
>=20
>=20
