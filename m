Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0035ECA1016
	for <intel-xe@archiver.kernel.org>; Thu, 11 Sep 2025 11:43:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7EB310EAD6;
	Thu, 11 Sep 2025 11:43:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VcDUj/b3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30D0310EAD6
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Sep 2025 11:43:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757591028; x=1789127028;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=JJbo+AickQbauZaO1yXenQm+Qbhq629E5yi0PeTkoUo=;
 b=VcDUj/b3l3f6uSp1RyqaUmoKha2RoyV5evOtP1CRB5d6d1bHBp+YDRXj
 5WuvtlXH13liPGm6ZjC1xUhrlhIHb6XQyVluHcivdFAzM1YQFUijmPngQ
 Xeyeb9XGZ6dkEiVN3b124fkkuGqqlO8OPrWSo+dJOh2jF0RmtNzyQm+YE
 7ZjSHlbDdyYNTzMf8i+0/bdAAJIDyZbKR1Lr4q22psFuzd/AgaAGUCqe+
 +p243cbkMWx1MZ4ViFpv24bFqTL6ueD/kxBW4rYtiDXvotIdgeOd+PCUM
 4dhGN7IilU7PC5QzbSONtrtLFon8w8hU5lOVVoKnhxe3Ko2J0aBB/gAuy g==;
X-CSE-ConnectionGUID: 5RRYF479TdKqkFrWnafY0Q==
X-CSE-MsgGUID: hJ5ikh6dQXiQgDlsW7ICmA==
X-IronPort-AV: E=McAfee;i="6800,10657,11549"; a="70537927"
X-IronPort-AV: E=Sophos;i="6.18,257,1751266800"; d="scan'208";a="70537927"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2025 04:43:48 -0700
X-CSE-ConnectionGUID: afus/Y8ZS3+DfQrww3qaAg==
X-CSE-MsgGUID: J6WMASDARn2D7Q36jqh0Vg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,257,1751266800"; d="scan'208";a="178873891"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2025 04:43:48 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 11 Sep 2025 04:43:47 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Thu, 11 Sep 2025 04:43:46 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (40.107.100.56)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 11 Sep 2025 04:43:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lr67CaotP6p8OdWw7TVDx0wtDcMk1UC5HhiuDZQQ+XTNb6dZm394g+WREC5uDhM0xsZ3CF86eMD0YpUFTwfIDAqLBSmyT1BdAHIcNAcGDqfj9NAqs3uv9DpCR10G3SKeZWc+I2DSJIpnLl94ILooJiZnA0AZ+w7gmSgXupcebtU95E5XN8D7tXxow1XyhT3cjqv3eN91b8vNirJAwuEDKsNE7zRei84sa/Vw/9Y+B8p2XZHRtFz2XMgPpyBUNuyHR7isXjbFpeJLylCtOb32sUqUUIQ2CeGRqtVhW/08Exldu0xXu/NY0p2oGVwyVUJ5sjWmqEYS9aJN43OdCGdODQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KrlhL6FAK/hIyGBlkbGp5lLFnQqoH6LEfD1hf8JVe1U=;
 b=lR+tWr6HzbWoMiwBOa+rrU1+CQfFv3iAmJPst++9rmwKMqmCHBilUldmi2soNh5NVyXCCeJ2jym9bjsCpb10Pv2i7Q/M2JsVnzzayYo7HWSXvAJvb9tAhVxn5S/2Hir6Qjao1vBfHJe8o6AYD9SpGOk4TfApkqDKpnp9t77ET5jUBxCm668qDx3xf5FemiGw1VtU7H1fkx1FUWhATZce42shkb7dYqXCbbVDeQdmsdoPdSGqaISYHiG/Y/1/r+Vya8tmvJ/nMpNaQEoeWzdhQhrOnavhqJQ89OAVPgrAkAi/Aavse0dtgUM0SIu+nTZApk5sv1Zu+J6NZjGGJWR4JA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com (2603:10b6:a03:459::19)
 by CY5PR11MB6464.namprd11.prod.outlook.com (2603:10b6:930:30::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Thu, 11 Sep
 2025 11:43:38 +0000
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762]) by SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762%3]) with mapi id 15.20.9094.021; Thu, 11 Sep 2025
 11:43:37 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Gote, Nitin R" <nitin.r.gote@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
CC: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>, "De Marchi,
 Lucas" <lucas.demarchi@intel.com>
Subject: RE: [PATCH] drm/xe: defer free of NVM auxiliary container to device
 release callback
Thread-Topic: [PATCH] drm/xe: defer free of NVM auxiliary container to device
 release callback
Thread-Index: AQHcItjjv5dkUuvqa0ie4Nm0LtQBYLSNp1YAgAAP9ICAACB8EA==
Date: Thu, 11 Sep 2025 11:43:37 +0000
Message-ID: <SJ1PR11MB620484658717D08262C991838109A@SJ1PR11MB6204.namprd11.prod.outlook.com>
References: <20250911052823.226696-1-nitin.r.gote@intel.com>
 <SJ1PR11MB62043168C5C2CAC20EF19D958109A@SJ1PR11MB6204.namprd11.prod.outlook.com>
 <IA3PR11MB89875A837D512DDAB0CDAC13D009A@IA3PR11MB8987.namprd11.prod.outlook.com>
In-Reply-To: <IA3PR11MB89875A837D512DDAB0CDAC13D009A@IA3PR11MB8987.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6204:EE_|CY5PR11MB6464:EE_
x-ms-office365-filtering-correlation-id: 5763ca1b-0676-4b87-b872-08ddf128720a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|10070799003|38070700021|7053199007; 
x-microsoft-antispam-message-info: =?iso-8859-1?Q?iG0gdM7gtom0bLV0O1m123xscm/94h6Wzqga22ts8morZeqjdEXs2HylmX?=
 =?iso-8859-1?Q?LtcH5HjhsWMocxabcELDXjJ4uOXLbM+NebRTM1zOzIJGJfkommIHDdeo7S?=
 =?iso-8859-1?Q?MaSnZL/kY/iwdEYMsIlQWrDapEOMlMK6oQxudz0gydkFJLzYLKEo0PwyMI?=
 =?iso-8859-1?Q?HBNDAIAejRdzODWg1Df7uOFmToBpOyXA+I8gCvcCrU0OEv/1g6F2ePsmrx?=
 =?iso-8859-1?Q?lzCKV+ePE24VRX2Tr2QtVlkvkJzpe4GL/yicRj0kyujd3GZVFIWkAVUK0g?=
 =?iso-8859-1?Q?qPhrOHh/TtHwK3XdOp7WrF8wwKgRdx3ZtxxaL/DuvXjPF/jlf0aWiyS5Rb?=
 =?iso-8859-1?Q?JaNtQZK7oY7JxvlnEZ38K7JMoHDGKIQ39OwSDeF5YjKx3hWvU9NyjjL3gJ?=
 =?iso-8859-1?Q?g29arABd/JGm9DHJz36e6WdCOfEjcZUJGtMyayNI13CE8WoYhILtUW32B0?=
 =?iso-8859-1?Q?j01Y4JHfiGE7TVW8YNs3alt16W91H0rAAtvedaocsgx1kPbO2vOkkfjgGb?=
 =?iso-8859-1?Q?8+5YI/N8psJ/QpVfMFbhMzhEpzxVcy3K3jNw/2kS/VGM2O9CNlR7xMxCfR?=
 =?iso-8859-1?Q?7/Sd3CyEU7344WmF3MBQ3xEGbTa6otAeTrqN0kXXWNju79dSApvXUXWknF?=
 =?iso-8859-1?Q?blRiWsYnrVtR2GdcoAYV0sLZ3WdzoKdrv3F1pff/tCK9EibjSf3woEMFop?=
 =?iso-8859-1?Q?jVWzCH6FSh6KtlWDJ7jZVN/0hRGqHWNZvJonkoahIztQlHhIFJdSumtzzI?=
 =?iso-8859-1?Q?FSL1cLLk6veS5NhXdt8yjzwK0cnuA7y+SAW5F0bGqXBxe7FNqm869vqkNw?=
 =?iso-8859-1?Q?SHE8143BCHRBXlFME2weS37pUdKjz78vXldiDkJm3Xapxek9XxmUNm6H6Y?=
 =?iso-8859-1?Q?qN/4W6yvTnZ2pi7BRurLDKFzPCrpkBBRrtkD3q1m35t0Wm59L53JOXMsyK?=
 =?iso-8859-1?Q?5Ej4dR78YY0RQX/8K+PvhRfQOFQoAdyKx4NnDS3nO/FH2MOYap+iNfPq45?=
 =?iso-8859-1?Q?mFspTkpCzdr1RlmWpqILnwGK8iKOdmEF51KoMuyaqzPJvmlZiw1qNHdOOY?=
 =?iso-8859-1?Q?VIdWpp/+n16pukKtkhIOODK5YR4x2iiHewx1L8ASo/M9GwpuNxKfw4GG7S?=
 =?iso-8859-1?Q?eVScgAYD9GixP/ZsHqCNHM/0P2/PnkqPZiemXAywqj4IFZzQ0Hze2TJXvb?=
 =?iso-8859-1?Q?hFdJwoK0vNJhS6kPOZUYM4h3pYzZoo6hT/sFwa3X/3g5o1vY4NBh/rUe8u?=
 =?iso-8859-1?Q?37hDiEN88JQ3XwbI/pr0yscfIZA4VrJtFw7jTCTeYIIVCa8l+B3TrONSKt?=
 =?iso-8859-1?Q?gOkHqnstk9x36YHwBrDBXOo3Mt+4B/QJOlGkORiT2KUEMtGW5rDmt9cOYX?=
 =?iso-8859-1?Q?779d7Lrw0cBeRJfXxDO8UtPbvOkR41j5k+G+YeD4WkIo97sEoEcM9SZqts?=
 =?iso-8859-1?Q?uABtG/U5uOuf3teuqjlZh3vAfw73Gy9cYMrUsgPRGsv5D8emNMHoFesWie?=
 =?iso-8859-1?Q?KmkTEnwRxQ10VRaHQlL/YIjun5fdTaGjX05yrnomt/Xisx3a17ZVGAg5I7?=
 =?iso-8859-1?Q?ETmZAmA=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6204.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(10070799003)(38070700021)(7053199007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?B55/SvE2RJOMxrp9Mo6Fx+jsrLIpIYkcRIVZdscEfoh1qt79kBkVqFmTI1?=
 =?iso-8859-1?Q?0PogR2xHRgiHGprVRpAlTDoMwLvEoPEc9sdVv9JPwZ4/C9labo6ZiHxuLY?=
 =?iso-8859-1?Q?KWrFul9SZCvVxfIv+MpGR9K6Zr9c2z6RW0/tC55lxTugTgg+RmPeG9MAkK?=
 =?iso-8859-1?Q?XuHH1xht8ewCbNuZf5/vGvF/Pgeo7EdBi2pMZPD3VoLHVlt7WjibOy84Dj?=
 =?iso-8859-1?Q?CKeF7Ul6vXhV6xABcrJUQuwCAYfpqox6KouSEcL0IOD2dS1X4nxJI5sCSR?=
 =?iso-8859-1?Q?MIvzdilYTIaBuTwhIu70PHiADcMfIphy46Om3hzZADIY6M9dRnYeZtwa+E?=
 =?iso-8859-1?Q?MRjzvOaXd506lXzkV2nztVXyFEQrWK7gN003xCAbW2eczGrM7PPk8Yt+M1?=
 =?iso-8859-1?Q?bUY9BEkMZ8n1gLU5jTdvq1JmuYC4ENYmQ9E1ppqB51XUYlkOeeVlG9T2h8?=
 =?iso-8859-1?Q?gyvTu3wC97yg6V94fYyYewBxEcA9cNs6JGpzIJqRn6jMEC9K+hkT9gbkSj?=
 =?iso-8859-1?Q?HLIU60FJkxC3VH3+56QZ8wQsMFy9a4mkrpKokterBcELDa7lSV704z7Kpd?=
 =?iso-8859-1?Q?MkYvFFfKTZH8D4UJX81hgnSQV0W3RTXIUorUJSYLIqVBIxdOa3rdXRRSk1?=
 =?iso-8859-1?Q?XvXpvAHr3keNrWbwzlhqGtadmWzpLKUN/rIX4SPghhlo2c39hYI07qGPjB?=
 =?iso-8859-1?Q?8a1fT55STAlpXNshJqB++EkBXh5nyVW/KD0z6jisl1VLU/KQ7/vu8fn/Cp?=
 =?iso-8859-1?Q?fErJRWjd3nwBefOgNN7CtGelDsiJk5um5QzC6NV59kjsL5hWVZ1c0kpdUi?=
 =?iso-8859-1?Q?rd0LOvKDqwkEY76N2rzReuTV8ydUS0+DBgF8DZbpoVjX3MdVpa8QvpFHmA?=
 =?iso-8859-1?Q?O8+XZo36OxdajjSZvkeTq0RwQNBJURePIy248f4idCTBvWzATOu6yv5NCN?=
 =?iso-8859-1?Q?QcXu0uKNaZMqe8B2hoEI4Ouz26lRI9KaeoXpO2ncXIhe5Hyxtbr9fRPmUL?=
 =?iso-8859-1?Q?PbJxZTMV/oUNENJVtdlRUj7y85KO25WW1L8IzGwPEs+pD6Yzu0mMcprBG4?=
 =?iso-8859-1?Q?cyxc8OnlQLtDkVquoDNpGYOSAe4cBV6BDoXYJjr5puGXCwrsdBgbC/8yHV?=
 =?iso-8859-1?Q?TYwXBvF4L+w4w/DiRz+69fhCvdtFFV96q7SHRHqH9BHcL4UIrTbErk0ldI?=
 =?iso-8859-1?Q?A7KBBF4sF+AkDnSYr3d5ZbcgKcqxsDXjU3uYfYE0rg7TCm9PKeevhtqvI4?=
 =?iso-8859-1?Q?3GooZsgvCNEFFZMLxCun1GNCTJsVvnXfVXuWMTVeJrXaBlTieFvLQPu7vp?=
 =?iso-8859-1?Q?+CzndXvRfGsEat4KKVTiH84W+zh2tDSsqo7f1QiRhkIvNwoEl6mER8+ONH?=
 =?iso-8859-1?Q?CBVaQH8ESl6IQaWqtyOUBImsrmYS3D2YrQbTsBAqb1psecb0lkrt1zias2?=
 =?iso-8859-1?Q?yWibqCkG71bg+bbc0ntHE0qfrTa3y18xQcq5ZAChD7+v8c70KH8HZWjFB6?=
 =?iso-8859-1?Q?ff8b8HWXiL0OPJctAVjD3nJShtYr99q+v0jK2V8Dv9I7T6TZhnOpA++pFf?=
 =?iso-8859-1?Q?j2MlW9qIyO2AFF6PbTRugqV9OU+JkHny0KZbz+mGEa75jNy72uIfp+ZxpS?=
 =?iso-8859-1?Q?PT1VIh3m5m9d2Ax/stbJB2wx7OjGzS8eTcMSmU17AuOgP+Oob6B5OoKFAN?=
 =?iso-8859-1?Q?8qe/HcwfRizRHWLbuGsElaaDAf49rPPQefWfQjKZ?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6204.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5763ca1b-0676-4b87-b872-08ddf128720a
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Sep 2025 11:43:37.0530 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WFF4xgnKtqIzCv7Rhh2tmBiyCr0BvcUDtLuv3oXMasLAqnWsjgpZ+NbSKTOkYI0wZDKMbiWcEKD6Wj+I8fm0U2vhj5utGhMXC2wZKavsBWo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6464
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
> From: Gote, Nitin R <nitin.r.gote@intel.com>
> Sent: 11 September 2025 14:59
> To: Upadhyay, Tejas <tejas.upadhyay@intel.com>; intel-
> xe@lists.freedesktop.org
> Cc: Ghimiray, Himal Prasad <himal.prasad.ghimiray@intel.com>; De Marchi,
> Lucas <lucas.demarchi@intel.com>
> Subject: RE: [PATCH] drm/xe: defer free of NVM auxiliary container to dev=
ice
> release callback
>=20
> Hi Tejas,
>=20
> > > -----Original Message-----
> > > From: Gote, Nitin R <nitin.r.gote@intel.com>
> > > Sent: 11 September 2025 10:58
> > > To: intel-xe@lists.freedesktop.org
> > > Cc: Upadhyay, Tejas <tejas.upadhyay@intel.com>; Ghimiray, Himal
> > > Prasad <himal.prasad.ghimiray@intel.com>; De Marchi, Lucas
> > > <lucas.demarchi@intel.com>; Gote, Nitin R <nitin.r.gote@intel.com>
> > > Subject: [PATCH] drm/xe: defer free of NVM auxiliary container to
> > > device release callback
> > >
> > > Do not kfree the intel_dg_nvm_dev in xe_nvm_fini() right after
> > > auxiliary_device_delete/uninit. The auxiliary_device embeds the
> > > device/kobject (and its name); freeing it too early can race with
> > > asynchronous device_del/udev processing and cause a use-after-free.
> > >
> > > Set aux_dev->dev.release =3D xe_nvm_release_dev and free the nvm
> > > container in that release callback. xe_nvm_fini() should only
> > > unregister the auxiliary device and clear xe->nvm.
> > >
> > > Signed-off-by: Nitin Gote <nitin.r.gote@intel.com>
> > > ---
> > >  drivers/gpu/drm/xe/xe_nvm.c | 6 +++++-
> > >  1 file changed, 5 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/gpu/drm/xe/xe_nvm.c
> > > b/drivers/gpu/drm/xe/xe_nvm.c index 9ca4a5ae1693..cc8d7c6cf69a
> > > 100644
> > > --- a/drivers/gpu/drm/xe/xe_nvm.c
> > > +++ b/drivers/gpu/drm/xe/xe_nvm.c
> > > @@ -35,6 +35,11 @@ static const struct intel_dg_nvm_region
> > > regions[INTEL_DG_NVM_REGIONS] =3D {
> > >
> > >  static void xe_nvm_release_dev(struct device *dev)  {
> > > +	struct auxiliary_device *aux =3D container_of(dev, struct
> > > +auxiliary_device,
> > > dev);
> > > +	struct intel_dg_nvm_dev *nvm =3D container_of(aux, struct
> > > +intel_dg_nvm_dev, aux_dev);
> > > +
> > > +	/* safe to free the whole container here; aux is embedded */
> > > +	kfree(nvm);
> > >  }
> > >
> > >  static bool xe_nvm_non_posted_erase(struct xe_device *xe) @@ -162,6
> > > +167,5 @@ void xe_nvm_fini(struct xe_device *xe)
> > >
> > >  	auxiliary_device_delete(&nvm->aux_dev);
> > >  	auxiliary_device_uninit(&nvm->aux_dev);
> > > -	kfree(nvm);
> > >  	xe->nvm =3D NULL;
> >
> > Why are we clearing from xe->nvm here? Its still alive! By the way I
> > feel fini and release are almost similar functionality defining
> > destruction, its just that before calling this we should drop all refer=
ences to
> nvm?
> >
> Here, auxiliary_device_delete() calls device_del(), which removes the dev=
ice
> from the=A0driver but does not drop the init reference that was taken in
> auxiliary_device_init().
> auxiliary_device_uninit() calls put_device(), which drops the init refere=
nce
> taken at init, and when the device reference count reaches 0 then device =
core
> calls dev->release (xe_nvm_release_dev).
>=20
> And if we set xe->nvm =3D NULL in xe_nvm_release_dev, which means we are
> delaying the=A0clearing of xe-nvm until release, then there is a possibil=
ity of
> a=A0window that, after xe_nvm_fini() returns, where xe->nvm still points =
to
> a=A0freed location, which leads to use-after-free if other drivers' paths=
 could still
> read the xe->nvm.
> So, here, clearing xe->nvm in xe_nvm_fini() removes the dangling pointer
> immediately.

Okay what I understand is, you hold reference --> device deleted, no new re=
ference will be held -> make nvm NULL while someone holding ref (is that va=
lid ?). Instead we should call nvm NULL when reference goes zero in nvm_rel=
ease and it looks like good clean up. Can you check that?

Tejas
>=20
> - Nitin
>=20
> > Tejas
> > >  }
> > > --
> > > 2.25.1

