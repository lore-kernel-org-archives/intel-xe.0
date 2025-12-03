Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AB55D12D56
	for <intel-xe@archiver.kernel.org>; Wed,  3 Dec 2025 13:29:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4008D10E123;
	Wed,  3 Dec 2025 13:29:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cQNEDzmw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1612010E123
 for <intel-xe@lists.freedesktop.org>; Wed,  3 Dec 2025 13:29:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764768596; x=1796304596;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=hPNliMoHsX3tQ7b2Jjnt2I2mCUTeXHeaS8sDKodKM1Y=;
 b=cQNEDzmwnIiQrgZLERSieNYqKB4BsawKgSV5RimmElJaZoVnAOtmtj1z
 dKzeldX7gvbO5amLsafz3zgk9PrHvPLoJWye4yCI2wIE4hi7sCWasIr9R
 X0g95TdUBnOiyyhY+YDi0hzTGNlD/UIS6xnQN4QVisfmdq1SOZL1xkAE4
 aWP/pCf/G+2xX68icDH2hoIkRiY0bXxvgqTAHeJEe98wP3kjTCn78yb/b
 NUPd6XRhppmYq77rs3NUva4HRrUiC+S/E5wwjJ7rRxIinNaNkvtNEflFM
 YdiDqqMjNu2Re//IdN4Jt3gSPljyiF/QfQ/Tq2KOZx4D7pPu1Zitqxyo9 Q==;
X-CSE-ConnectionGUID: 4k/mPLkDTv+0wvg6/6aZOg==
X-CSE-MsgGUID: UgfKRQHNTrKWqPadxosmGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="89411223"
X-IronPort-AV: E=Sophos;i="6.20,246,1758610800"; d="scan'208";a="89411223"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2025 05:29:55 -0800
X-CSE-ConnectionGUID: UzdBK2BYT/2TrMt8vqoAIQ==
X-CSE-MsgGUID: sYiFgNZFR0ikxAz6UXmjow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,246,1758610800"; d="scan'208";a="198844307"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2025 05:29:54 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 3 Dec 2025 05:29:43 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Wed, 3 Dec 2025 05:29:43 -0800
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.2) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 3 Dec 2025 05:29:43 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ra9rzAUh3NLnSR3MUuDe/4BNxIViweZ0lk9cWAwZvkuaqdbrsmOkitYpQOWbHLPOAHuZO5Wz4Gj5UCGUfbuAgYjt5OsF3w0IatJcYjTbGXwEhIt1HOI/Yyzh7zO9goD45gO07WLNE2GP+sbYcWn1sqR8do8lp1mMfcTSDtW9Xu0sCHWmaFHQVedA8mmkfrJWtU74F6lY1EgzTz8hLzXZM7qUGDvQhC9+MUbBbLJbrgu/YfGZf9apbTGpZlsbiquzECPMQeajUefKMC3lskS0EtNCuoyKW0bl4reTZpAnOiyNOC88FE/DZd0fdDldUhLpMPZNE4uxzhCbQFtn+6jnPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fja1sQ884uucGTLLtGBHhfgtBLFzvkFf0ck5lJ7qnSY=;
 b=v02RLt+P/PJ5xvE+ZG/bx1Nye1rYqbr0Iiao+v88jijb37qW5eere987V0x+08sX/vORzlvE1vuMycPL9i/KJYdWYWoAyDKKFWXLMLkFTzYDqsHz7aAikychumDRqMPFo1DITOl6/TyIYoPQr2jyDkr3eayPg79E/N2kCbki0MRYGUPx/HTFEaEMwQud+PME4kifW7GkPS/SKVS3s6Iu//1sBawo3k+edmDJvMrbKwjoXTsdytbuhAVa8CH9GADU2oxtiQzMmQKwKGsWpjjIkeY35sUkgO5Yp2gYPXbl2nHgS5Wppzn7WaiLuHy6yJ243TtQDrJDygzwptME5gKfeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6266.namprd11.prod.outlook.com (2603:10b6:208:3e6::12)
 by SA1PR11MB6758.namprd11.prod.outlook.com (2603:10b6:806:25d::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Wed, 3 Dec
 2025 13:29:36 +0000
Received: from IA1PR11MB6266.namprd11.prod.outlook.com
 ([fe80::eda2:e570:4314:8720]) by IA1PR11MB6266.namprd11.prod.outlook.com
 ([fe80::eda2:e570:4314:8720%4]) with mapi id 15.20.9366.012; Wed, 3 Dec 2025
 13:29:36 +0000
From: "Bhadane, Dnyaneshwar" <dnyaneshwar.bhadane@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH] drm/xe: Do not reference loop variable directly
Thread-Topic: [PATCH] drm/xe: Do not reference loop variable directly
Thread-Index: AQHcY/K/fJi2lk8blEq9HL5NEMy0+bUP6OAw
Date: Wed, 3 Dec 2025 13:29:35 +0000
Message-ID: <IA1PR11MB6266CDA4F888AF9BAF2047DCE2D9A@IA1PR11MB6266.namprd11.prod.outlook.com>
References: <20251203011809.968893-1-matthew.brost@intel.com>
In-Reply-To: <20251203011809.968893-1-matthew.brost@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6266:EE_|SA1PR11MB6758:EE_
x-ms-office365-filtering-correlation-id: b4613ffa-f76b-4337-6772-08de32700085
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|7053199007|38070700021; 
x-microsoft-antispam-message-info: =?us-ascii?Q?MD876mz5SBJ5barN9S0ze9uY0aOyDr7oB2sgv0TOdqdzM3I91cwHBQAlWU6y?=
 =?us-ascii?Q?zVoce0hdcaNt7TvcVTb1YwMgbyM5wCHqHxR/igeH0pZl/EoCXrNRJ0V2pWkw?=
 =?us-ascii?Q?jFpeXHHtAho6abYPfUrPMPyWtiLwxTRW+K4P8fIsg3g88uJqRHklF0P/Ox+L?=
 =?us-ascii?Q?tEcI5r5TUuBsT4EXujAjwMnc5rw1nIrhf+EKIJML9Y69KWLphlb9p6Gq3F5B?=
 =?us-ascii?Q?hZewdhERf7ko096ncseT9pUEuKcvjphOU9ehvf7YmJYxljCFvYNDzcKjquqV?=
 =?us-ascii?Q?6HDAcwy7C3RiHcp2mXFVU8wQ/Y2ViHqzfHqOWOj+P3UzCzsn4VxIlkvH+FPy?=
 =?us-ascii?Q?u5tFeWlXdkX7XgGLz1KnmBatKSsGDE1BqNah+bKb6b2+b/evtgHaNWnjdjy+?=
 =?us-ascii?Q?AbJMbZHfYlT4y5ZrhxubN6NxZWaWO7mxe65tQsl2XIJiTzChReAzZgvpHsX6?=
 =?us-ascii?Q?k1tpSotUO3SN+4DhIPwHD1rZzoTrJ/e88S5dpGt4lK/XbB8Kov6/1I6G6QMi?=
 =?us-ascii?Q?3V2RiU+Uq6jeBkt1ALHs7bHov+uHejO0zayRyRaoZ1ie7gj4NTq9Lk8LnQ8t?=
 =?us-ascii?Q?xq4kMgI5qChoDnN3NYasirOyZvr3lqDZ8udXb310DEQi+6tSjRHBpcQvN6fb?=
 =?us-ascii?Q?OIDqh+BYM/wLJsgHE3kef9qen/2mOOZilH+tvtC1Gn5XvrYCyrAEuVGotFr4?=
 =?us-ascii?Q?opA8dkvVjSQrV26fV/zN/ZvH+pyyluJYb6YPSaBUEiSYv4p9vg8xFoFYmni+?=
 =?us-ascii?Q?cH5V9uc9bObDyvXwtCqRsgiHjT4g5XAMSCW4ukkiXFTYoSgKkQBIFkfIb8F2?=
 =?us-ascii?Q?RBzELa78xeVvsis7sbrIA7NZ7tn+GiXHb9SM7VMQKBCOCjI2ii/ux6P2EOcr?=
 =?us-ascii?Q?V0/jWfsdyIF3YVvrmAwS8hR9/j9CFbYXnXY6+ov2OaAUi6TPHQZC+1cVj/ni?=
 =?us-ascii?Q?UTBHfLDzFQJF9Z2LQ2D91C4gyWcrCxcbx2OHBfUu2a3wBVR9ZV2Mu8nUXcW4?=
 =?us-ascii?Q?+dcQuon93/tDUQgFpVe8S01Jm/+LWyzwtz1fdnkcDKyUDQKxLcZ0IvmU/LjT?=
 =?us-ascii?Q?NeRuruiRTUIg//di50rp9+tX9hKjE3j5so/DqLjoMh2EghRGcZMljmGbrnGK?=
 =?us-ascii?Q?PXvYFrxpsG1Axt6dT3siEuuxBN5IpQAWcZxqHpA8wLDqVWCAnq52DLMSfDjB?=
 =?us-ascii?Q?qMuukGVMTUOk4h2eWyGduxL080XBDl8Aa1IamUTbI7ALqHt1EuT1Ip/YNxBt?=
 =?us-ascii?Q?F3BlevZkwnHI3bBctuIsn2fYTnC0xjEskjWILydpWVYpdGSFY7k+AbbdcOd7?=
 =?us-ascii?Q?99y0+p6lirHFqxPl5cQ95rdJUMJriXCdMsa7ls0qb5VMk/FSZFjl4fgmwiS0?=
 =?us-ascii?Q?beuFHFYW6MZzbpvpdUdInXFw4oaBf+Y7f6Ig2Q9aFbnkz1xhmlOSGyIgnDLm?=
 =?us-ascii?Q?0qXJHNpmFQsoowX/gdIaPfyOYMxinxY/Ii18Zjm5XS2JEdsawoauw8PNU6/x?=
 =?us-ascii?Q?gR94ZUg7Rviii1Pa+MhIy5gVeJt/O+zCxFZQ?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB6266.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7053199007)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?RT1a6VkG8MnTQmi3wnev9mh8qX4TRRy/AHfzWyqIBTjQ23Ef4c/zIZYwXFU4?=
 =?us-ascii?Q?BqIXPoKskRTKh9GCNDAPJ6+zWfZtUcpBozRSrhVRpAqeynbEY499ivd73wMK?=
 =?us-ascii?Q?RwlPMe4UxnhGxOEbzs5Ij5lKSHZfELjYOPnwP8sWe+9E1epmx/TBaWVlX9Ku?=
 =?us-ascii?Q?aRLDC78Aab4DadU9eA+XgLpQYW1+LFOjrqQXn60ViUfjijRArR5brM0h+/b2?=
 =?us-ascii?Q?I+bSDqZ/5R5tdp/wkDueMeIo/eiV31grJhU8No2NYsvrW3C+qUdsOv9e8yXE?=
 =?us-ascii?Q?uk0A1JUlF71FALBBqJ9P4H9HdQgWr1qxEdHEkHj10Cf3MlNg1kgVg37ZJKKp?=
 =?us-ascii?Q?46fl+wqMNNq+v+bcZBX22aT2AS5KQewq5lp4KC/BHI1WHfrtol+B3dU6SkLy?=
 =?us-ascii?Q?fWIU4Aun8S8+B5EaLpiUdCIEovO6qn7/fCN4Bi4V5zFrUv48SRKIW/YifXV3?=
 =?us-ascii?Q?9rZPEGLywHpb+w9BdSGbHv07YheOONzB8TupjaB+xIsmJxVMNN3mRTdSpmJF?=
 =?us-ascii?Q?/d5lyNcoCNq1AH5wE2GTELQ3rGpEtekZOfToUyZltqIenrUrnrl7Rxy2h09+?=
 =?us-ascii?Q?+k48Z5ZNCmTsuhBDYdFyNlUN10Wk51c++ETGUdr+FCECaGz+Ow6bX6rescpC?=
 =?us-ascii?Q?MBz7/FzDvBaMw0h9SoObbBf50ylEwP09g+G21TDKKFziVtJZkYSfRuQfHsIQ?=
 =?us-ascii?Q?kQmHXRNNnQjEyn89DUUQn3Zpp+I26+Zz6hzac+TTDhUk/ihMZkIEVBuNlAvV?=
 =?us-ascii?Q?TaKpxv/SIGbV6raz3seNqT9OW9hnHfdrGaGawDQWAKmUSuAqf4thHv6qLeSV?=
 =?us-ascii?Q?lUV3ckdNac3TDKh6vLX5pMt/wyAcbZskuxy7WZVianpdOTeGh6j1KORs0ZaV?=
 =?us-ascii?Q?eaErgE1kh3l6mOVzIM/43S4hizsu+VVTD4phbxvgJWjM+EZXUpqA25YWZ+IU?=
 =?us-ascii?Q?nKQYV8yP58WfqTTk+mvHXbubQICc3FmfySGU5HfECT+jg/5ZgCCjCWqt8HVi?=
 =?us-ascii?Q?cfWNBGA1jRHNfTt0xFN5UtHI3AvztY6tLM0oidg1iZbZ9p5bMgHBug/RUoOu?=
 =?us-ascii?Q?iDgmzfCTtkuaPfr1AYWaXfvDy4kRzZ3+hLd11H0K3sLpDRnIgl0qaVwpLAQE?=
 =?us-ascii?Q?DCGORzQqo7UWIMySc2/FDDAnEknP5Mbr7at8PU3dYlAQhAzMP8HNi5eQ/jBR?=
 =?us-ascii?Q?7dLdR0aUbletgDRrvKAvahZjkPjPT2lan0mcAT80yOhvZ3am7EPAiDG/Vyjy?=
 =?us-ascii?Q?vn3+QaUZ1iVhcPmOeN5W9ku94U8Qm2cJzxOoH5qBsF9wqL5VC2uNkvu9EfYk?=
 =?us-ascii?Q?3jkI0Yot8nXjtwUy7n/+T4kVZVWj68tkQ+ahgSqp1+FhU2iSZVNtl6D5HdYd?=
 =?us-ascii?Q?K2zHLAjzrBpmDCPElbHgwtngKim5VYbBFKl/MQRt7SCHRiycfLSIUTz8TDxq?=
 =?us-ascii?Q?JiY5OSsiNh5YjFKOLmql4FcfrdUieKKCVHs2JVluOs5rC9vgXcOdVmIxRY8q?=
 =?us-ascii?Q?VnSz9vkRSofCaDbIcmkU93yYtjQJ0khSQqJ22yr2iQGKCppBpbUF/ePkh8Sx?=
 =?us-ascii?Q?vBYvls29p44DDLrhzAdamqav0MlLu1xlQgpkw3O8RcMKv+QG4ALrshwtgI8n?=
 =?us-ascii?Q?Ag=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6266.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b4613ffa-f76b-4337-6772-08de32700085
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Dec 2025 13:29:35.8860 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4760el5lpZH48Ck1fp2T/DZZa8Yil2GmvSt5u3gFQn0sQgrkH8nyzZIquCiiZrj5ec+qY1XGnv11qktdcrBHz1JWAt0LQLuPpVl2vOACGPA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6758
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
> Sent: Wednesday, December 3, 2025 6:48 AM
> To: intel-xe@lists.freedesktop.org
> Subject: [PATCH] drm/xe: Do not reference loop variable directly
>=20
> Do not reference the loop variable job after the loop has exited.
> Instead, save the job from the last iteration of the loop.
>=20
> Fixes: 3d98a7164da6 ("drm/xe/vf: Start re-emission from first unsignaled =
job
> during VF migration")
> Reported-by: kernel test robot <lkp@intel.com>
> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>

LGTM,=09
Reviewed-by: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_guc_submit.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c
> b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 3ca2558c8c96..f3f2c8556a66 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -2264,10 +2264,11 @@ static void
> guc_exec_queue_unpause_prepare(struct xe_guc *guc,
>  					   struct xe_exec_queue *q)
>  {
>  	struct xe_gpu_scheduler *sched =3D &q->guc->sched;
> -	struct xe_sched_job *job =3D NULL;
> +	struct xe_sched_job *job =3D NULL, *__job;
>  	bool restore_replay =3D false;
>=20
> -	list_for_each_entry(job, &sched->base.pending_list, drm.list) {
> +	list_for_each_entry(__job, &sched->base.pending_list, drm.list) {
> +		job =3D __job;
>  		restore_replay |=3D job->restore_replay;
>  		if (restore_replay) {
>  			xe_gt_dbg(guc_to_gt(guc), "Replay JOB - guc_id=3D%d,
> seqno=3D%d",
> --
> 2.34.1

