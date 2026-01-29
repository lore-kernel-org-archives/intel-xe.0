Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73EE5D46BED
	for <intel-xe@archiver.kernel.org>; Thu, 29 Jan 2026 00:40:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11C6110E2F2;
	Thu, 29 Jan 2026 00:40:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="C+rE5bvy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D34A510E2F2
 for <intel-xe@lists.freedesktop.org>; Thu, 29 Jan 2026 00:40:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769647250; x=1801183250;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=cYJE9oGWti40HN9KXva/r66LyLVovjVX9bEuYHbULoA=;
 b=C+rE5bvy/ygJwrn4K8KKyu1oxzKGDvZpBqzZZXqoZqhVsHzO3Pgmhbpo
 VDUnqn1H9QjXJc8x/Zze+ODPWPuLkS4K5Fd4lOJ8Sd8+zS4qn8pjoKt18
 Wa2dQzLbBPn3GS0egVqM6tnN0sKizrbkw9Ay1jy+ogMMGtMtT06E3De2g
 C/6wYa1ff++U9KqJm20TiiqLyWp7pbjnpiJIHO0z7alRt9gef6/j3rbIF
 wANCIpbFkyfho7B0YYtGxUXr4lSXRGvGuXgq/r1cl1UijFypFjRlbCck9
 ZZWJk7Wj07z3A+LkZ5n949i7pS3ZmKUan52s8YVYvHSVcj03G6CF03mm/ g==;
X-CSE-ConnectionGUID: TuM/0JWBTcqcsIgebSfS7g==
X-CSE-MsgGUID: +n5QTGSfQESbHjRwnJeeqg==
X-IronPort-AV: E=McAfee;i="6800,10657,11685"; a="70928127"
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; d="scan'208";a="70928127"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2026 16:40:49 -0800
X-CSE-ConnectionGUID: PWAS9tbjQyqA9PskaAFkzQ==
X-CSE-MsgGUID: rhwijnwuThiL2KnSLk4ldw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; d="scan'208";a="213386910"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2026 16:40:49 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 28 Jan 2026 16:40:48 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Wed, 28 Jan 2026 16:40:48 -0800
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.60) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 28 Jan 2026 16:40:48 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SMqB3J7PvVeaPEjI+EtC1w5PnuLcU3fGwCZUZTHe9BaGDqReYfQmEQLd1g61kZUxcV75utD5Vphp7bkF6nwO4NLQNRQuYdf00tuP3J3dzCglxl06942EK9TjRGQtHIm5HzqKlPpVgIG0sMWrMOVJBty1zyxkDyc7qXJXIK2oAYXZhaHz3ZfaurgOJ/vCrza3l8JzLStsSd95JLjdb1dmkYjS8GORjhx7Ottx1PlZDBT09ek32yhq0ylNinbFQFVqwvI1Ac5Ye1UBHJ9m/I1SLs82NYqYXVrdsZRc0fnDv+R7bxCF/L1T5G6aAdJXK1R5Sv3O+WjA8AwEYTPaBRXSxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cYJE9oGWti40HN9KXva/r66LyLVovjVX9bEuYHbULoA=;
 b=Cd9K7pHO9nQADvLlgDiyP7UMJckCocyz/0BQvROfBSo1DHAJMeMM70nRPDeTUDWukIprrJIewQwfZhcwrE4esBiOtWAWgl3B92tEA/QPpdSTsEi8BZmpzH6v7LQaawCE3pU+x4bZL1C2lua5gL6C3NbIGnsBuwVb2x0cj94Or/3I8CSLEf9il6ZZO3FYdh68e0Sv9j8FTFhI/6Mer60uyPc2u+DqjClYByHGHaONuoUmjqw9JHb464C4k5czKND54NCiYldV+a7/C3Uw5O9ZTJprPgcQPECQK6VNjVSvZiVF3OLWSgWDGsNw3JLr1osvFiluBXU0L6owevp9QC+Pzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA3PR11MB9208.namprd11.prod.outlook.com (2603:10b6:208:57c::17)
 by DM3PPF1B59FAA3B.namprd11.prod.outlook.com (2603:10b6:f:fc00::f0f)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.16; Thu, 29 Jan
 2026 00:40:46 +0000
Received: from IA3PR11MB9208.namprd11.prod.outlook.com
 ([fe80::7f37:6d70:5d90:89cd]) by IA3PR11MB9208.namprd11.prod.outlook.com
 ([fe80::7f37:6d70:5d90:89cd%3]) with mapi id 15.20.9564.007; Thu, 29 Jan 2026
 00:40:46 +0000
From: "Mishra, Pallavi" <pallavi.mishra@intel.com>
To: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Vishwanathapura, Niranjana" <niranjana.vishwanathapura@intel.com>,
 "Summers, Stuart" <stuart.summers@intel.com>
Subject: RE: [PATCH v2] drm/xe/tests: Fix g2g_test_array indexing
Thread-Topic: [PATCH v2] drm/xe/tests: Fix g2g_test_array indexing
Thread-Index: AQHchn6tCwaQg8eEFkKnYUVJBWg9A7VdXNOAgAE2YpCAAEXDAIAAPMWQgAlJXYCAAAM3MA==
Date: Thu, 29 Jan 2026 00:40:46 +0000
Message-ID: <IA3PR11MB92083022AD64069DED0E68C6829EA@IA3PR11MB9208.namprd11.prod.outlook.com>
References: <20260116002529.951176-1-pallavi.mishra@intel.com>
 <84622a42-64c8-4712-bfe9-374e32cdd4b4@intel.com>
 <SJ5PPFC0624F2CA292F70351251505F39D18297A@SJ5PPFC0624F2CA.namprd11.prod.outlook.com>
 <4e39ee05-0767-441e-b193-c05fba770740@intel.com>
 <SJ5PPFC0624F2CABC96211C6507CF372CD68294A@SJ5PPFC0624F2CA.namprd11.prod.outlook.com>
 <855a551b-3275-4697-a816-2ca8ab86a284@intel.com>
In-Reply-To: <855a551b-3275-4697-a816-2ca8ab86a284@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA3PR11MB9208:EE_|DM3PPF1B59FAA3B:EE_
x-ms-office365-filtering-correlation-id: 1936b506-8dc9-4b8f-0b94-08de5ecf0a9e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|38070700021|7053199007; 
x-microsoft-antispam-message-info: =?utf-8?B?RVdOcDYvNlZQdjJOaDc2dm10RlhlTTZsNkpKS0ZHODJGQWdDK2xkT3Z0RCtB?=
 =?utf-8?B?VTlIMkV0Kzlib0pxYnpKUVBDTGlCQzI4Sk5LTHJuSFo4QnBrMzNOWnAvL2Ix?=
 =?utf-8?B?QkUvUkg2RWhCQlpUQlVrbyttVXQyK2x6WWFnZjZOSzNveGF5TkFVZkJQUkpz?=
 =?utf-8?B?SXlXVGJzVXQyMHQxTDNPb28rV3BFcnVNWTM2d1J1a01EMzlKaUVNQUdrckJn?=
 =?utf-8?B?YUpYV3dNb29tSUU1T09qcDNsUXA0YVlqRThKaTY4THpyVlFJTE5NQ0NZSWxZ?=
 =?utf-8?B?RWNCWDY4Ykd4ZnlIdkx3T29wZUlhWSsrdDdOandkbUVDMjJBVXNDam1lQ2V6?=
 =?utf-8?B?ZDhGWGVjYTBrRWpjOFhsLzdZMUxHSWFIb3oyRU84S1Q1WFdnRHl0akhuRklB?=
 =?utf-8?B?UkpLdEhEdWU0KzFDWTUxb3BDcTJ5SFNubW1LbUx6aUFrT2wwUDJ4VWQyVHpR?=
 =?utf-8?B?YjNoVlk5ZXVmcS9DSnJ0UkY2QWtzT1ZpdUdkTTEzbW9jUG1GdVgxRDVyN3Qx?=
 =?utf-8?B?ZUQwSFdsa3VIbUh0Q1BXU2VVK3VRUFlkNWlta0tPWC9DdjBvK1QwQkkxL3RZ?=
 =?utf-8?B?bnowdytKNFdwSUhUSlRBSnJvWmZnYzFmR0dKeFd2RERqTHBWWS9Xb3Y4S3dF?=
 =?utf-8?B?NG0xcnl4TTl2YnNia2FsZ2tHLzRTcU1TY2NGTHg5Y2w1TTJodTZkSUE2S2Np?=
 =?utf-8?B?WGpkTFFXQVgrVUgyTVp5RjFJa0t2RG01WkRScTlXUU9RUXFpN0NnMWlPV3Fm?=
 =?utf-8?B?ek56R2N0S3RMQ3BvVVczTnltZGhFck1wUXhPLzM2UWw2VTlxUUlXb1hZZWkw?=
 =?utf-8?B?VHh0QlhTUkVGM1NlMUJsYnA3NkwwUkVaYjVOSFV2S0x0MjFQVUQ3MFBzYWlp?=
 =?utf-8?B?RTJ5NDdOaTdFaVZ4UFlNMUU0UVZnM0RZZVozUVhUWmxMVUNJNFlLak5GaGdV?=
 =?utf-8?B?SG5sUFQzUUJRemtYVmMzZnVFZlVPR1hMZEcwR25EKzI0d0lVcnY0OGtLSFpF?=
 =?utf-8?B?bDFoMWI5VXN4Ty9Oak0rZE9oR2F5N0FMK0JsSTZacTdNSG1LUXJ0YnF0aUFS?=
 =?utf-8?B?WnkxRDZ2VTh0NlVWL3RiZElSaXJESTR6V0lWYzBnRkQrY3NVZlpxWk5ZL2k2?=
 =?utf-8?B?bE9JTUdLaDNxYWR6Q1dMQk9DWUswRVZsNkFPc3I1R0JQSy9xa1pic1laK0lU?=
 =?utf-8?B?QXkwbmIzdW1DSlpOVXhEZUhVdElJU0xTWE90UkVkVTdMV3lXNS82WEQxYS9Q?=
 =?utf-8?B?b041YzgwSEI2OVhKcU94dXYxcWQzNHlsNm9xcVBPZkdpQytVT3c1dUV4dlgw?=
 =?utf-8?B?K1k2QXVUZTVYMTNOcmV0RXpFcGw5a3N0Mjg0VGtGOHpVMG82K3R2WFlraFEr?=
 =?utf-8?B?YnBoTHFLOWdnc2tGanhaYTJBZWsrNUg0dzQxd3hPdkNKbzFoKzRscm9kNTda?=
 =?utf-8?B?cFh4R3RYVnNkODVqdnJIWE44dzJuWjg0NE9JdDBLNnp4dS9GUVhpdWNiL1ly?=
 =?utf-8?B?RTAzWHJYbGp3TllQSlBVcUtIVmdxR2ppcmFpRjBGT0hObG9CWCtaS05tbjE1?=
 =?utf-8?B?NU9mY0t4aURrR0RwSHBWOFNEYitINFYrYmREMUxmL09VekE1TjI5cG9VVE95?=
 =?utf-8?B?WENpUlRPSXV1U0hlb2hqbE9FS2k1bXBQajlqeWtOUmRxZnZMUU94N0lTY0RP?=
 =?utf-8?B?M3hRc042WWd1dTlWd1NWc2NrMDl0UnR2eTJMdnduYlhMOElsTldab0pmQUFI?=
 =?utf-8?B?dzlzSEt4cnJtbGdsSEpoUDluNmIrRlZZSkRaN3BsbVEyZXdId3Z0VkJTQi9B?=
 =?utf-8?B?U3pVQ2xzWkxhamNuS3JPZVRsdGU0a0ROS1I1WnZXd1dVY2FKSXAxVEY5eDJO?=
 =?utf-8?B?ZEtKeU5PZVlGV01nUGsxNUdqRVFYeUQrWmQ0a0NYM0YrbTQzcjluMVpiT3NY?=
 =?utf-8?B?TG5WcnlxckY4SEN6cmRlQnlHdnovWWRLbTBHeHowOWp6TUQvTUU5dytXeGRh?=
 =?utf-8?B?bzNnVG02YUVvVVVyWWh6aHc4YjNVZ0l4bmNNRmZDRUV5RHNJM0ZHbWE4ajEz?=
 =?utf-8?B?OVgvYjFRTWdNVlBpUnRhRlpvSHRVSDRXT0o0bHBieWphQnJ2RUllbmYzcWZp?=
 =?utf-8?B?aVBSdXgxK2VuQ1p1R2tEcXJBcFhEd0FVYVBUQXdoOXUwT0IzZTYwZkhici80?=
 =?utf-8?Q?fhOjSxJhkQeJczzn8xiZJAU=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA3PR11MB9208.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700021)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aDZ6RW9RaXpDRGJwdW5hZVI2T3Z4U2xwU2ZmeHEyVnFodUdqM3NyZVBLK0ZE?=
 =?utf-8?B?blFyWGRiN3E3UlhTcitIUHlKb2VwTUllY2p2RmlYQ1NDNFVsT0w2T08xMmlu?=
 =?utf-8?B?Tjhad2VRQkVmTzhzRHNZb1JjYUFzcE1uY3lwYVVxSk9GTFFONDd4ZklRcE1q?=
 =?utf-8?B?bzVORmdMK0huNnV6eVNDMEVPVUw4TVV1NWF1aWUrbmgydGhRMVQzbVlaT29P?=
 =?utf-8?B?RnJoM2dHRVdWV3VYZlpORStuRm1LbXlOMUt0THZ6WG1HK2NXZDJUZ1g3dEE5?=
 =?utf-8?B?ZFFRZWFqL3BnQnNmZFZWUG5iRWppM2RnWEhBUGE5aEt1R3NXR1dvNjhCYndT?=
 =?utf-8?B?VzNyVm91eGVBOWlNbEwyRVorTm04VXJjTExmcU9nNklyT0llVUtUckk5TFNX?=
 =?utf-8?B?MDVpbmpSVkpTaDZjWWI3Sk56cGZjQlU3K0NHdVBSYmVrQm1KNHUvV24rSEkr?=
 =?utf-8?B?NlZVWVFWUW1OZXhMZG84OXFNZ1BNSmEvMVY5a0FxOE9sTmowVHNzMHMwZCtC?=
 =?utf-8?B?dWQvOThSWUxGd0crekhjQ2VvZmZuNjA3YW1zT1ZjYjdwYkZJZ2YwaHJFUnYx?=
 =?utf-8?B?azVpY3A5ZENDSS8ycThwRFFCSXkwUmFadEthODArR1lsNGsxZW9YK0NtZE85?=
 =?utf-8?B?REFaTjZhclBldzY4SFpMYy9LVHoybkJoSkMyR1JwVFFpYWxwVm9uNnhHWkNT?=
 =?utf-8?B?RW9LdkFnVTdsUWh5Nm84VllhdmZjeFc4TGpGaVJ2bXpJSWdXSFZoZll3RmJZ?=
 =?utf-8?B?ZVQ3ZHJTNkdQMzJYSEN2aG5MUUZ1NTIvSDlnSmxkM2RiSFlONFlvVzlYZ1Bo?=
 =?utf-8?B?RGZVMmIwcXpQNHJMWTZuWFFIaHJLaGdacHA2MDZET1ZCbWMvN0NNaDNNbTlE?=
 =?utf-8?B?b3VVWnpUc1JQZjNTQTVteXZ6aEIvaVRCTHdnMUFGb3pKZjVCbEpUZ3Q4UEpU?=
 =?utf-8?B?VDNXeENJTmRkUWlyd3lEUmFaMmlmZnVpNXhXcTlENmlDYU5lTkhLTHZMV09o?=
 =?utf-8?B?SWZVNXA4Nyt5dk9mTkZ1YlU2SmRQUXN3VGVoL0tNMHBSRFo2bGlBTmdsWldk?=
 =?utf-8?B?UDQ2dTR2RlAvOFJUZ0tlMGk3ZjFtb2pHWjE4U0NWbUJ1Y3RxVXZWVFZOS2gx?=
 =?utf-8?B?Tk1mY2ZDU2ZmcU1yTFo1TkZUc1hVTFJpaUpvdFZ5TmptWlRxTkg3OWtZWEJY?=
 =?utf-8?B?QndMRjJQSUtTTFNpU0k2VGhBcDBwUC9mc1daZGFySjVzNkx2bzNPQU52QXhW?=
 =?utf-8?B?VGJWRk9WZ2dBV1E3WlMzaHFiTS9lb1l2YUgyVVFqNUh3ZkJ0T2Z2NE1ldjRN?=
 =?utf-8?B?Q05CRStRdVhXR3hZR21jendXaWFQclB1VTMycFE2ZGdWMFFFd001ZGhuSHQ0?=
 =?utf-8?B?RkF2V3gyYjBLc2FLMmlFRlFXVDd4a3VzbVAvK2o4RVBqRTNubG5pRFdaYVRO?=
 =?utf-8?B?UVRTQ1JLWWlqaXBCM2RUNGhVa0krZ2MrNEhPQUQwc3VuaGJoWmNlaGJnSGpm?=
 =?utf-8?B?bWhKbmdVSnZXTk1HbUg2c2ZxZEE3R0JyTkJsSzFuK3JEeUFaTU5GMDlhcmFO?=
 =?utf-8?B?RzZTTmlzSUpybEpMTXRqemJXcVFyN0pqSHBZMk9acEQrdjltdFNDalR1dmxU?=
 =?utf-8?B?K3VycEpjVHlpVjErWE9ST2o4dkcwdDBPMmZ2TFlubFVuMWtEb0pOWGIvaEh3?=
 =?utf-8?B?NmlaSU5NeVhMQ0JhTDd3SHltUEk0ZytkcGc2dDZaN3l4VkgxcXJtWXRUV1Nk?=
 =?utf-8?B?QWl6eTNDaUwxaXJJeGVMaDZuc3l0SjBWVGd2QW9jUXNNUGN4QTNCdTg5aU1B?=
 =?utf-8?B?Q2w3bTJKcFQydGdXMlBxS0YrV0lBdWFScUtIZHBOejBGQi9CRDZ0TWJZYytm?=
 =?utf-8?B?WVMxdnh0d2pWRldEL3lXYUZXOXJOdzVseG95NlUxYUpidmFRK1B4RHRrUUNW?=
 =?utf-8?B?cjkxSXVWQjJYSzdJVUJ0Lzl0Um9uRnZJajU5WGxnRjMzUHliNTMyUlpObnhk?=
 =?utf-8?B?endYeU9QNmtOeE95UDRLQWVMbjlNZ21SUVRMbWZyblVpalhlMGdXdHpvQnJM?=
 =?utf-8?B?Vkk2K0RVUDk0emJ1WHlrZHh3Z2FvMFdudnlpTzA3SEQ5MFhYTkQralBLa2g2?=
 =?utf-8?B?NG5UTFlVQnNOZDdBVk9lRmhJZy82VkI3blk1RXFLQytkc0hUQ00valNrc0NG?=
 =?utf-8?B?RjlzZHlqQ050M0Y1cmIveFhyNE5SbHdRTUxvTCtWMnlZc21RTURIei8rbm9Q?=
 =?utf-8?B?TWd3VFRBamRYSzRCbUpLQVhiSjB1OUlRUmI2OHg2c2c5aGUydE5PZDJ6TC9Z?=
 =?utf-8?B?S0daOTRYb3pRekhoTFoxVnZjRjBJcWd2dDgvVVBtT1J2WUIwRzcyZz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9208.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1936b506-8dc9-4b8f-0b94-08de5ecf0a9e
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jan 2026 00:40:46.2181 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PsjCuUCm1EcVdLTio0414J5EZfs5oVExor55qTMH3ocwFnRkhql2eHUDnO+3rEX8GomJHAzpdXHoI4opXeh3ElwvtIw0loyM6BBVQVBx1FM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF1B59FAA3B
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQ2VyYW9sbyBTcHVyaW8s
IERhbmllbGUgPGRhbmllbGUuY2VyYW9sb3NwdXJpb0BpbnRlbC5jb20+DQo+IFNlbnQ6IFdlZG5l
c2RheSwgSmFudWFyeSAyOCwgMjAyNiA0OjI3IFBNDQo+IFRvOiBNaXNocmEsIFBhbGxhdmkgPHBh
bGxhdmkubWlzaHJhQGludGVsLmNvbT47IGludGVsLXhlQGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0K
PiBDYzogVmlzaHdhbmF0aGFwdXJhLCBOaXJhbmphbmEgPG5pcmFuamFuYS52aXNod2FuYXRoYXB1
cmFAaW50ZWwuY29tPjsNCj4gU3VtbWVycywgU3R1YXJ0IDxzdHVhcnQuc3VtbWVyc0BpbnRlbC5j
b20+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjJdIGRybS94ZS90ZXN0czogRml4IGcyZ190ZXN0
X2FycmF5IGluZGV4aW5nDQo+IA0KPiANCj4gDQo+IE9uIDEvMjIvMjAyNiA2OjQxIFBNLCBNaXNo
cmEsIFBhbGxhdmkgd3JvdGU6DQo+ID4NCj4gPj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0N
Cj4gPj4gRnJvbTogQ2VyYW9sbyBTcHVyaW8sIERhbmllbGUgPGRhbmllbGUuY2VyYW9sb3NwdXJp
b0BpbnRlbC5jb20+DQo+ID4+IFNlbnQ6IFRodXJzZGF5LCBKYW51YXJ5IDIyLCAyMDI2IDM6MDEg
UE0NCj4gPj4gVG86IE1pc2hyYSwgUGFsbGF2aSA8cGFsbGF2aS5taXNocmFAaW50ZWwuY29tPjsN
Cj4gPj4gaW50ZWwteGVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+ID4+IENjOiBWaXNod2FuYXRo
YXB1cmEsIE5pcmFuamFuYSA8bmlyYW5qYW5hLnZpc2h3YW5hdGhhcHVyYUBpbnRlbC5jb20+Ow0K
PiA+PiBTdW1tZXJzLCBTdHVhcnQgPHN0dWFydC5zdW1tZXJzQGludGVsLmNvbT4NCj4gPj4gU3Vi
amVjdDogUmU6IFtQQVRDSCB2Ml0gZHJtL3hlL3Rlc3RzOiBGaXggZzJnX3Rlc3RfYXJyYXkgaW5k
ZXhpbmcNCj4gPj4NCj4gPj4NCj4gPj4NCj4gPj4gT24gMS8yMi8yMDI2IDExOjMzIEFNLCBNaXNo
cmEsIFBhbGxhdmkgd3JvdGU6DQo+ID4+Pj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4g
Pj4+PiBGcm9tOiBDZXJhb2xvIFNwdXJpbywgRGFuaWVsZSA8ZGFuaWVsZS5jZXJhb2xvc3B1cmlv
QGludGVsLmNvbT4NCj4gPj4+PiBTZW50OiBXZWRuZXNkYXksIEphbnVhcnkgMjEsIDIwMjYgNDoy
MCBQTQ0KPiA+Pj4+IFRvOiBNaXNocmEsIFBhbGxhdmkgPHBhbGxhdmkubWlzaHJhQGludGVsLmNv
bT47DQo+ID4+Pj4gaW50ZWwteGVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+ID4+Pj4gQ2M6IFZp
c2h3YW5hdGhhcHVyYSwgTmlyYW5qYW5hDQo+ID4+Pj4gPG5pcmFuamFuYS52aXNod2FuYXRoYXB1
cmFAaW50ZWwuY29tPjsNCj4gPj4+PiBTdW1tZXJzLCBTdHVhcnQgPHN0dWFydC5zdW1tZXJzQGlu
dGVsLmNvbT4NCj4gPj4+PiBTdWJqZWN0OiBSZTogW1BBVENIIHYyXSBkcm0veGUvdGVzdHM6IEZp
eCBnMmdfdGVzdF9hcnJheSBpbmRleGluZw0KPiA+Pj4+DQo+ID4+Pj4NCj4gPj4+Pg0KPiA+Pj4+
IE9uIDEvMTUvMjAyNiA0OjI1IFBNLCBQYWxsYXZpIE1pc2hyYSB3cm90ZToNCj4gPj4+Pj4gVGhl
IEcyRyBLVW5pdCB0ZXN0IGFsbG9jYXRlcyBhIGNvbXBhY3QgTsOXTiBtYXRyaXggc2l6ZWQgYnkN
Cj4gPj4+Pj4gZ3RfY291bnQgYW5kIHZlcmlmaWVzIGVudHJpZXMgdXNpbmcgZGVuc2UgaW5kaWNl
czogaWR4ID0gKGogKg0KPiA+Pj4+PiBndF9jb3VudCkgKyBpDQo+ID4+Pj4+DQo+ID4+Pj4+IFRo
ZSBwcm9kdWNlciBwYXRoIGN1cnJlbnRseSBjb21wdXRlcyBpZHggdXNpbmcNCj4gPj4+Pj4gZ3Qt
PmluZm8uaWQuIEhvd2V2ZXIsIGd0LT5pbmZvLmlkIHZhbHVlcw0KPiA+Pj4+PiBhcmUgbm90IGd1
YXJhbnRlZWQgdG8gYmUgY29udGlndW91cy4NCj4gPj4+Pj4gRm9yIGV4YW1wbGUsIHdpdGggZ3Rf
Y291bnQ9MiBhbmQgSURzIHswLDN9LCB0aGlzIGZvcm11bGEgcHJvZHVjZXMNCj4gPj4+Pj4gaW5k
aWNlcyBiZXlvbmQgdGhlIGFsbG9jYXRlZCByYW5nZSwgY2F1c2luZyBtaXNtYXRjaGVzIGFuZA0K
PiA+Pj4+PiBwb3RlbnRpYWwgb3V0LW9mLWJvdW5kcyBhY2Nlc3MuDQo+ID4+Pj4+DQo+ID4+Pj4+
IFVwZGF0ZSB0aGUgcHJvZHVjZXIgdG8gbWFwIGVhY2ggR1QgdG8gYSBkZW5zZSBpbmRleCBpbg0K
PiA+Pj4+PiBbMC4uZ3RfY291bnQtMV0gYW5kIGNvbXB1dGU6DQo+ID4+Pj4+ICAgICAgICBpZHgg
PSAodHhfZGVuc2UgKiBndF9jb3VudCkgKyByeF9kZW5zZQ0KPiA+Pj4+Pg0KPiA+Pj4+PiBBZGRp
dGlvbmFsbHksIGludHJvZHVjZSBhbiBldmVudC1iYXNlZCBkZWxheSBpbg0KPiA+Pj4+PiBnMmdf
dGVzdF9pbl9vcmRlcigpIHRvIGVuc3VyZSBvcmRlcmluZyBiZXR3ZWVuIHNlbmRzLg0KPiA+Pj4+
Pg0KPiA+Pj4+PiB2MjogQWRkIHNpbmdsZSBoZWxwZXIgZnVuY3Rpb24gKERhbmllbGUpDQo+ID4+
Pj4+DQo+ID4+Pj4+IFNpZ25lZC1vZmYtYnk6IFBhbGxhdmkgTWlzaHJhIDxwYWxsYXZpLm1pc2hy
YUBpbnRlbC5jb20+DQo+ID4+Pj4+IC0tLQ0KPiA+Pj4+PiAgICAgZHJpdmVycy9ncHUvZHJtL3hl
L3Rlc3RzL3hlX2d1Y19nMmdfdGVzdC5jIHwgNTYNCj4gPj4+PiArKysrKysrKysrKysrKysrKysr
KystDQo+ID4+Pj4+ICAgICAxIGZpbGUgY2hhbmdlZCwgNTQgaW5zZXJ0aW9ucygrKSwgMiBkZWxl
dGlvbnMoLSkNCj4gPj4+Pj4NCj4gPj4+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94
ZS90ZXN0cy94ZV9ndWNfZzJnX3Rlc3QuYw0KPiA+Pj4+PiBiL2RyaXZlcnMvZ3B1L2RybS94ZS90
ZXN0cy94ZV9ndWNfZzJnX3Rlc3QuYw0KPiA+Pj4+PiBpbmRleCAzYjIxM2ZjYWU5MTYuLmVjMTgw
ODZiOThkOCAxMDA2NDQNCj4gPj4+Pj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3Rlc3RzL3hl
X2d1Y19nMmdfdGVzdC5jDQo+ID4+Pj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS90ZXN0cy94
ZV9ndWNfZzJnX3Rlc3QuYw0KPiA+Pj4+PiBAQCAtNDgsNiArNDgsMzggQEAgc3RydWN0IGcyZ190
ZXN0X3BheWxvYWQgIHsNCj4gPj4+Pj4gICAgIAl1MzIgc2Vxbm87DQo+ID4+Pj4+ICAgICB9Ow0K
PiA+Pj4+Pg0KPiA+Pj4+PiArc3RhdGljIGludCBzbG90X2luZGV4X2Zyb21fZ3RzKHN0cnVjdCB4
ZV9ndCAqdHhfZ3QsIHN0cnVjdCB4ZV9ndA0KPiA+Pj4+PiArKnJ4X2d0KSB7DQo+ID4+Pj4+ICsJ
c3RydWN0IHhlX2RldmljZSAqeGUgPSBndF90b194ZSh0eF9ndCk7DQo+ID4+Pj4+ICsJaW50IGlk
eCA9IDAsIGZvdW5kID0gMCwgaWQsIHR4X2lkeCwgcnhfaWR4Ow0KPiA+Pj4+PiArCXN0cnVjdCB4
ZV9ndCAqZ3Q7DQo+ID4+Pj4+ICsJc3RydWN0IGt1bml0ICp0ZXN0ID0ga3VuaXRfZ2V0X2N1cnJl
bnRfdGVzdCgpOw0KPiA+Pj4+PiArDQo+ID4+Pj4+ICsJZm9yIChpZCA9IDA7IGlkIDwgeGUtPmlu
Zm8udGlsZV9jb3VudCAqIHhlLT5pbmZvLm1heF9ndF9wZXJfdGlsZTsNCj4gaWQrKykgew0KPiA+
Pj4+PiArCQlndCA9IHhlX2RldmljZV9nZXRfZ3QoeGUsIGlkKTsNCj4gPj4+Pj4gKwkJaWYgKCFn
dCkNCj4gPj4+Pj4gKwkJCWNvbnRpbnVlOw0KPiA+Pj4+PiArCQlpZiAoZ3QgPT0gdHhfZ3QpIHsN
Cj4gPj4+Pj4gKwkJCXR4X2lkeCA9IGlkeDsNCj4gPj4+Pj4gKwkJCWZvdW5kKys7DQo+ID4+Pj4+
ICsJCX0NCj4gPj4+Pj4gKwkJaWYgKGd0ID09IHJ4X2d0KSB7DQo+ID4+Pj4+ICsJCQlyeF9pZHgg
PSBpZHg7DQo+ID4+Pj4+ICsJCQlmb3VuZCsrOw0KPiA+Pj4+PiArCQl9DQo+ID4+Pj4+ICsNCj4g
Pj4+Pj4gKwkJaWYgKGZvdW5kID09IDIpDQo+ID4+Pj4+ICsJCQlicmVhazsNCj4gPj4+Pj4gKw0K
PiA+Pj4+PiArCQlpZHgrKzsNCj4gPj4+Pj4gKwl9DQo+ID4+Pj4+ICsNCj4gPj4+Pj4gKwlpZiAo
Zm91bmQgIT0gMikNCj4gPj4+Pj4gKwkJS1VOSVRfRkFJTCh0ZXN0LCAiR1QgaW5kZXggbm90IGZv
dW5kIik7DQo+ID4+Pj4+ICsNCj4gPj4+Pj4gKwlyZXR1cm4gKHR4X2lkeCAqIHhlLT5pbmZvLmd0
X2NvdW50KSArIHJ4X2lkeDsgfQ0KPiA+Pj4+PiArDQo+ID4+Pj4+ICAgICBzdGF0aWMgdm9pZCBn
MmdfdGVzdF9zZW5kKHN0cnVjdCBrdW5pdCAqdGVzdCwgc3RydWN0IHhlX2d1YyAqZ3VjLA0KPiA+
Pj4+PiAgICAgCQkJICB1MzIgZmFyX3RpbGUsIHUzMiBmYXJfZGV2LA0KPiA+Pj4+PiAgICAgCQkJ
ICBzdHJ1Y3QgZzJnX3Rlc3RfcGF5bG9hZCAqcGF5bG9hZCkgQEAgLQ0KPiAxNjMsNw0KPiA+Pj4+
ICsxOTUsNyBAQCBpbnQNCj4gPj4+Pj4geGVfZ3VjX2cyZ190ZXN0X25vdGlmaWNhdGlvbihzdHJ1
Y3QgeGVfZ3VjICpndWMsIHUzMiAqbXNnLCB1MzIgbGVuKQ0KPiA+Pj4+PiAgICAgCQlnb3RvIGRv
bmU7DQo+ID4+Pj4+ICAgICAJfQ0KPiA+Pj4+Pg0KPiA+Pj4+PiAtCWlkeCA9ICh0eF9ndC0+aW5m
by5pZCAqIHhlLT5pbmZvLmd0X2NvdW50KSArIHJ4X2d0LT5pbmZvLmlkOw0KPiA+Pj4+PiArCWlk
eCA9IHNsb3RfaW5kZXhfZnJvbV9ndHModHhfZ3QsIHJ4X2d0KTsNCj4gPj4+Pj4NCj4gPj4+Pj4g
ICAgIAlpZiAoeGUtPmcyZ190ZXN0X2FycmF5W2lkeF0gIT0gcGF5bG9hZC0+c2Vxbm8gLSAxKSB7
DQo+ID4+Pj4+ICAgICAJCXhlX2d0X2VycihyeF9ndCwgIkcyRzogU2Vxbm8gbWlzbWF0Y2ggJWQg
dnMgJWQgZm9yDQo+ICVkOiVkIC0NCj4gPj4+Pj4NCj4gPj4+Pj4gJWQ6JWQhXG4iLCBAQCAtMTgw
LDEzICsyMTIsMTcgQEAgaW50DQo+ID4+Pj4geGVfZ3VjX2cyZ190ZXN0X25vdGlmaWNhdGlvbihz
dHJ1Y3QgeGVfZ3VjICpndWMsIHUzMiAqbXNnLCB1MzIgbGVuKQ0KPiA+Pj4+PiAgICAgCXJldHVy
biByZXQ7DQo+ID4+Pj4+ICAgICB9DQo+ID4+Pj4+DQo+ID4+Pj4+ICsjZGVmaW5lIEcyR19XQUlU
X1RJTUVPVVRfTVMgMTAwDQo+ID4+Pj4+ICsjZGVmaW5lIEcyR19XQUlUX1BPTExfTVMgMQ0KPiA+
Pj4+PiArDQo+ID4+Pj4+ICAgICAvKg0KPiA+Pj4+PiAgICAgICogU2VuZCB0aGUgZ2l2ZW4gc2Vx
bm8gZnJvbSBhbGwgR3VDcyB0byBhbGwgb3RoZXIgR3VDcyBpbiB0aWxlL0dUDQo+IG9yZGVyDQo+
ID4+Pj4+ICAgICAgKi8NCj4gPj4+Pj4gICAgIHN0YXRpYyB2b2lkIGcyZ190ZXN0X2luX29yZGVy
KHN0cnVjdCBrdW5pdCAqdGVzdCwgc3RydWN0DQo+ID4+Pj4+IHhlX2RldmljZSAqeGUsIHUzMg0K
PiA+Pj4+IHNlcW5vKQ0KPiA+Pj4+PiAgICAgew0KPiA+Pj4+PiAgICAgCXN0cnVjdCB4ZV9ndCAq
bmVhcl9ndCwgKmZhcl9ndDsNCj4gPj4+Pj4gLQlpbnQgaSwgajsNCj4gPj4+Pj4gKwlpbnQgaSwg
aiwgd2FpdGVkOw0KPiA+Pj4+PiArCXUzMiBpZHg7DQo+ID4+Pj4+DQo+ID4+Pj4+ICAgICAJZm9y
X2VhY2hfZ3QobmVhcl9ndCwgeGUsIGkpIHsNCj4gPj4+Pj4gICAgIAkJdTMyIG5lYXJfdGlsZSA9
IGd0X3RvX3RpbGUobmVhcl9ndCktPmlkOyBAQCAtMjA1LDYNCj4gKzI0MSwyMg0KPiA+Pj4+IEBA
DQo+ID4+Pj4+IHN0YXRpYyB2b2lkIGcyZ190ZXN0X2luX29yZGVyKHN0cnVjdCBrdW5pdCAqdGVz
dCwgc3RydWN0IHhlX2RldmljZQ0KPiA+Pj4+PiAqeGUsIHUzMg0KPiA+Pj4+IHNlcW4NCj4gPj4+
Pj4gICAgIAkJCXBheWxvYWQucnhfZGV2ID0gZmFyX2RldjsNCj4gPj4+Pj4gICAgIAkJCXBheWxv
YWQucnhfdGlsZSA9IGZhcl90aWxlOw0KPiA+Pj4+PiAgICAgCQkJcGF5bG9hZC5zZXFubyA9IHNl
cW5vOw0KPiA+Pj4+PiArDQo+ID4+Pj4+ICsJCQkvKiBDYWxjdWxhdGUgaWR4IGZvciBldmVudC1i
YXNlZCB3YWl0ICovDQo+ID4+Pj4+ICsJCQlpZHggPSBzbG90X2luZGV4X2Zyb21fZ3RzKG5lYXJf
Z3QsIGZhcl9ndCk7DQo+ID4+Pj4+ICsJCQl3YWl0ZWQgPSAwOw0KPiA+Pj4+PiArDQo+ID4+Pj4+
ICsJCQkvKiBXYWl0IGZvciBwcmV2aW91cyBzZXFubyB0byBiZQ0KPiBhY2tub3dsZWRnZWQNCj4g
Pj4+PiBiZWZvcmUgc2VuZGluZyAqLw0KPiA+Pj4+PiArCQkJd2hpbGUgKHhlLT5nMmdfdGVzdF9h
cnJheVtpZHhdICE9IChzZXFubyAtIDEpKSB7DQo+ID4+Pj4+ICsJCQkJbXNsZWVwKEcyR19XQUlU
X1BPTExfTVMpOw0KPiA+Pj4+PiArCQkJCXdhaXRlZCArPSBHMkdfV0FJVF9QT0xMX01TOw0KPiA+
Pj4+PiArCQkJCWlmICh3YWl0ZWQgPj0NCj4gRzJHX1dBSVRfVElNRU9VVF9NUykgew0KPiA+Pj4+
PiArCQkJCQlrdW5pdF9pbmZvKHRlc3QsICJUaW1lb3V0DQo+IHdhaXRpbmchIHR4DQo+ID4+Pj4g
Z3Q6ICVkLCByeCBndDogJWRcbiIsDQo+ID4+Pj4+ICsJCQkJCQkgICBuZWFyX2d0LT5pbmZvLmlk
LA0KPiBmYXJfZ3QtDQo+ID4+Pj4+IGluZm8uaWQpOw0KPiA+Pj4+IFNvcnJ5IEkgbWlzc2VkIHRo
aXMgb24gdGhlIHByZXZpb3VzIHJldiwgYnV0IHNob3VsZG4ndCB0aGlzIGJlIGENCj4gPj4+PiBm
YWlsdXJlPyBJZiB3ZSBkb24ndCBnZXQgb25lIG9mIHRoZSBwcmV2aW91cyBtZXNzYWdlcyB0aGVu
DQo+ID4+Pj4gc29tZXRoaW5nIGhhcw0KPiA+PiBnb25lIHdyb25nLg0KPiA+Pj4+IFRoZSBwYXRj
aCBsb29rcyBnb29kIHRvIG1lIGFwYXJ0IGZyb20gdGhpcy4NCj4gPj4+Pg0KPiA+Pj4+IERhbmll
bGUNCj4gPj4+IEkgdGhpbmsgbWFya2luZyBhIGZhaWx1cmUgYXQgdGhpcyBwb2ludCBtYXkgYmUg
dG9vIGVhcmx5LiBTZXFubw0KPiA+Pj4gY2hlY2sgdmFsaWRhdGlvbiBoYXBwZW5zIGxhdGVyIG9u
IGluIGcyZ19ydW5fdGVzdCgpIGFuZCBhbHNvIGluDQo+ID4+PiB4ZV9ndWNfZzJnX3Rlc3Rfbm90
aWZpY2F0aW9uKCkuIElmIGFueSBub3RpZmljYXRpb24gaXMgbWlzc2VkIG9yIG91dA0KPiA+Pj4g
b2Ygb3JkZXIsDQo+ID4+IHRoZSB0ZXN0IHdpbGwgZmFpbCBhdCB0aGF0IHN0YWdlLg0KPiA+Pg0K
PiA+PiBUaGVuIHdoeSB3YWl0IGZvciBpdCBhdCBhbGw/IGVpdGhlciB3YWl0aW5nIGZvciBpdCBp
cyBzaWduaWZpY2FudA0KPiA+PiAoYW5kIHRoZXJlZm9yZSB3ZSBmYWlsIHRoZSB0ZXN0IGlmIHRo
ZSB3YWl0IHRpbWVzIG91dCkgb3IgaXQgZG9lc24ndA0KPiA+PiBtYXR0ZXIgYmVjYXVzZSB3ZSBo
YXZlIG90aGVyIGNoZWNrcyBsYXRlciAoaW4gd2hpY2ggY2FzZSB3ZSBjYW4ganVzdA0KPiBhdm9p
ZCB3YWl0aW5nKS4NCj4gPj4NCj4gPj4gRGFuaWVsZQ0KPiA+IFRvIHByb3ZpZGUgc29tZSBiYWNr
Z3JvdW5kIGhlcmUsIHRoZSB3aGlsZSBsb29wIGFuZCB3YWl0IGFyZSBwcmltYXJpbHkNCj4gYWRk
ZWQgdG8gcGFjZSB0aGUgdGVzdCBhbmQgYXZvaWQgc2VuZGluZyBiYWNrLXRvLWJhY2sgbWVzc2Fn
ZXMsIHdoaWNoDQo+IHByZXZpb3VzbHkgY2F1c2VkIHRoZSB0ZXN0IHRvIGFsd2F5cyB0aW1lIG91
dCB3YWl0aW5nIGZvciBub3RpZmljYXRpb25zLg0KPiBJbnRyb2R1Y2luZyBhIGRlbGF5L3NsZWVw
IGJlZm9yZSB0aGUgZzJnX3Rlc3Rfc2VuZCgpIHJlc29sdmVkIHRoaXMuIER1cmluZw0KPiBpbnRl
cm5hbCByZXZpZXcgaXQgd2FzIHN1Z2dlc3RlZCB0aGF0IGEgZml4ZWQgZGVsYXkgaGVyZSBtYXkg
bm90IHdvcmsgYWNyb3NzDQo+IHBsYXRmb3Jtcywgc28gSSBtb2RpZmllZCB0aGUgc2FtZSB0byBh
biBldmVudCBiYXNlZCBkZWxheS4gU28gdGhlIHdhaXQgaGVyZQ0KPiBpc24ndCBtZWFudCB0byB2
YWxpZGF0ZSBjb3JyZWN0bmVzcyBhdCB0aGlzIHN0YWdlLCBidXQgc2ltcGx5IHBhY2UgdGhlIHRl
c3QuIFRoZQ0KPiB0aW1lb3V0IG1lc3NhZ2UgaGVyZSBtaWdodCBiZSBjb25mdXNpbmcsIHNvIEkg
Y2FuIHJlbW92ZSBpdCBpZiBwcmVmZXJyZWQuDQo+IFBsZWFzZSBsZXQgbWUga25vdyB5b3VyIHRo
b3VnaHRzLg0KPiANCj4gT2ssIHRoZW4gcGxlYXNlIGV4cGFuZCB0aGUgY29tbWVudCB0byByZWZs
ZWN0IHRoaXMuIE1heWJlIHNvbWV0aGluZyBsaWtlDQo+ICJXYWl0IGZvciBwcmV2aW91cyBzZXFu
byB0byBiZSBhY2tub3dsZWRnZWQgYmVmb3JlIHNlbmRpbmcsIHRvIGF2b2lkDQo+IHF1ZXVpbmcg
dG9vIG1hbnkgbWVzc2FnZXMgYmFjay10by1iYWNrIGFuZCBjYXVzaW5nIGEgdGVzdCB0aW1lb3V0
Lg0KPiBBY3R1YWwgbWVzc2FnZSBjb3JyZWN0bmVzcyB3aWxsIGJlIGNoZWNrZWQgaW4NCj4geGVf
Z3VjX2cyZ190ZXN0X25vdGlmaWNhdGlvbigpIi4NCj4gDQo+IERhbmllbGUNCg0KU3VyZS4gSSB3
aWxsIG1vZGlmeSB0aGUgY29tbWVudC4NCg0KUGFsbGF2aQ0KPiANCj4gPg0KPiA+Pj4gUGFsbGF2
aQ0KPiA+Pj4+PiArCQkJCQlicmVhazsNCj4gPj4+Pj4gKwkJCQl9DQo+ID4+Pj4+ICsJCQl9DQo+
ID4+Pj4+ICsNCj4gPj4+Pj4gICAgIAkJCWcyZ190ZXN0X3NlbmQodGVzdCwgJm5lYXJfZ3QtPnVj
Lmd1YywNCj4gZmFyX3RpbGUsDQo+ID4+Pj4gZmFyX2RldiwgJnBheWxvYWQpOw0KPiA+Pj4+PiAg
ICAgCQl9DQo+ID4+Pj4+ICAgICAJfQ0KDQo=
