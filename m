Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3927FC87FC9
	for <intel-xe@archiver.kernel.org>; Wed, 30 Jul 2025 12:40:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EACB910E6A6;
	Wed, 30 Jul 2025 12:40:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SQ3D4Qnx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DD9210E206
 for <intel-xe@lists.freedesktop.org>; Wed, 30 Jul 2025 12:40:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753879212; x=1785415212;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=p5MhB8gTqIsixPfrVo2q6V4Xna/9hD6Me6eVovdtLcA=;
 b=SQ3D4Qnx70KV0YLvqy20xXdswvfbhz0xAtCeqCXF1NJ095lm0/RjieqU
 QgJUMyUHPwIJuPsWDbgZzFqMwXQCm8fVLNzwrj3ANSYuMhaBoRs5NJV8b
 8PKwbQCajmavEORTE6A9hp2AiJBn8OscgaS0NbqtlJP2IevJRdBNeVJoD
 5XnIoHRK/WfgRpOz/nYKPHNlN+Uzp215vY7O4jZhE42SyO6IBLx/U0LpA
 PK4bjPwLqQLD5zYlnaKSLiMOzd97ubofe0JV606hpGRDv5fWS6DoGmkkQ
 yFwfv0ZlYL0zId3Ru0IdOFO9mOJa36YMZpZfh7liVNrueQOmJR/B5hJK4 w==;
X-CSE-ConnectionGUID: oclQrWWqSPa38aXW6T0rtg==
X-CSE-MsgGUID: Gb8Oc2UnT6irwYntP0j/qg==
X-IronPort-AV: E=McAfee;i="6800,10657,11507"; a="67619997"
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; d="scan'208";a="67619997"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2025 05:40:12 -0700
X-CSE-ConnectionGUID: /eyAIiM3Rw+CW10yx/x7DA==
X-CSE-MsgGUID: nYbBLl+ESnK9pj+g9E6bxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; d="scan'208";a="200152682"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2025 05:40:12 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Wed, 30 Jul 2025 05:40:11 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Wed, 30 Jul 2025 05:40:11 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (40.107.243.72)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Wed, 30 Jul 2025 05:40:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=If2CXNrQYDJ9teDtW/01Uhyd3WIraJLAKn3dwAlg3jBtJ9LGpftfjMFEkxZ9OCQDmzQJUhCvUfsHqfppRuBbIbNPFy1unwG5pxAZxEskJwYQ2gstP/Ok39ZUdaRpAWji+mPUW67jtyG+ictfBu4ODuCDWAxirXiWbWzbMi2gQ43u7Nb5yjE2XEUZr9Yx4ycvCegld2tpVgWl3lfwJnWDPRA5H2XvEv1Tl8ZuRgS/3yz1Z/U25oDqGY90yEAeYg/8QLq7jvOXun2ayBk24oaSr+s64tqd7aYa8nBGPxu/7dKlzl0UUOOWQ2tyXW4UdaGkI2oqBmzl0c3USTDk5EgG5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p5MhB8gTqIsixPfrVo2q6V4Xna/9hD6Me6eVovdtLcA=;
 b=HWphFq2nejX79+91Kx/bq1uhuNkIsYRh6h+jgQJJ8Eb66SQav4BP36HHOey07b0KYW1UrZZlZQavlMWqaZY/GjleZv427gOylKUFdrBPvomRzgfil8TYShEw4ZY7+aAtSQdgdBSjPqVjwcaqUplvaHATnmjFg6Zvuxypl/K1lzIv64rE6ukOqR31UNh0HNf18/UJqto7UkNvWRELtSxH8oqQn74Np70sCosNP5TDW5fYJuHDnhuuKpodWCzK9vnbxI9Wc7vpgM7aqUhk8nwlfsThqBhoIxx2tdNIJat4BBp36nYm/hseT51IrQ46PjnzWZCQxM6pXfllaT+uUTXhYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6211.namprd11.prod.outlook.com (2603:10b6:930:25::6)
 by PH0PR11MB4933.namprd11.prod.outlook.com (2603:10b6:510:33::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.27; Wed, 30 Jul
 2025 12:39:42 +0000
Received: from CY5PR11MB6211.namprd11.prod.outlook.com
 ([fe80::df5a:a32c:8904:15f1]) by CY5PR11MB6211.namprd11.prod.outlook.com
 ([fe80::df5a:a32c:8904:15f1%7]) with mapi id 15.20.8989.010; Wed, 30 Jul 2025
 12:39:42 +0000
From: "Gupta, Anshuman" <anshuman.gupta@intel.com>
To: "K V P, Satyanarayana" <satyanarayana.k.v.p@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>
CC: "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>, "Brost, Matthew"
 <matthew.brost@intel.com>, "Winiarski, Michal" <michal.winiarski@intel.com>
Subject: RE: [PATCH] drm/xe/pm: Enable RPM via PCIe PM capability
Thread-Topic: [PATCH] drm/xe/pm: Enable RPM via PCIe PM capability
Thread-Index: AQHcAUvA7w0J8i1zUkSJPD1QHasH/bRKmi/g
Date: Wed, 30 Jul 2025 12:39:42 +0000
Message-ID: <CY5PR11MB621179438DADC9C621456E3C9524A@CY5PR11MB6211.namprd11.prod.outlook.com>
References: <20250730123254.11088-1-satyanarayana.k.v.p@intel.com>
In-Reply-To: <20250730123254.11088-1-satyanarayana.k.v.p@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-Mentions: rodrigo.vivi@intel.com
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6211:EE_|PH0PR11MB4933:EE_
x-ms-office365-filtering-correlation-id: 1fd91cf4-45db-4c70-3ff4-08ddcf6627fe
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?eG1MeHc3bWtJRXdaWmFBWHFKWEQxcGhTVkMyay9LUlUzbmRycnErNU5xWjNR?=
 =?utf-8?B?Nm5tMkp3RmhtZUtVRDNrak5jYWlCK0dSdFYyM3kzOEJsNWszYjBYOWJjQUMx?=
 =?utf-8?B?eWFRbzJSZ1M5YjkrM3BjZm1OSU5Sak80TzBLblRWclJpSVQ4WUFRcVJ6NVRL?=
 =?utf-8?B?RnRiTGM4YUsvb25qM1ZIYWV3T2hsQm1mWjFtRVV5ZkVYZXZUZ2hQV2NPbHh6?=
 =?utf-8?B?cE1UQURCZTZuRUF2cTMxcmNNbWVtYzd2MVllaGVuWll0UEIzVFMxdmo4Qjg3?=
 =?utf-8?B?a0FhTVF5L2hnZ0JIRjU1cXJIUHNibThVWUlpa25yU0RrcjJKTFBCSjNDU0di?=
 =?utf-8?B?SnF4cDhscmhkR3hxckRndExwdHBhZzkyd0Zic3djekdwWDZOY1NpUGZpTE4z?=
 =?utf-8?B?SnRraHE3UWVBNzhCWG9YdmFoWnZsUWRvMy92bld1enMvVG5NdS81aWU0ZXdh?=
 =?utf-8?B?UUttZFVqa05ONzc3cHFZOWJBZXRjNVRQMWZuTGhGQTJ0RkVtTE5WZ28ySlV2?=
 =?utf-8?B?ZXR0N1RNNnpkTXhRMVZobndYZk9RKzNjWG1RRGR3aWR0MnRIRFJtK3ZDdU8z?=
 =?utf-8?B?NklGLzErcnRVaS9DVkxXR2dFZjM0SjFSZzY0czdLU1N6UzhUQURGOXdNVzNn?=
 =?utf-8?B?bnByUlZmY3N5VitzZ3d2aTRjT1k3SVpPV3cyRUMzYXF2M25BR1NoWjhIZ3lo?=
 =?utf-8?B?dWx6UjBod1BaNDBPbkhsMmk0dE5oTlJkOTlmazRwVlBBWldJV3NPOXIyUWs0?=
 =?utf-8?B?V2RwN0N3SVdsSWpmUEpNQXJuWlpJMGFTcW91ZnZjTy8wdzJvTHBxVE9QZHJL?=
 =?utf-8?B?dm5OTU83Qms3Q1hweFVadHd6ZGRqZ1RhMUhnbVd6anc1TW1DM3RzV3lORUxT?=
 =?utf-8?B?QmhjREFMVzdBWUFrT2NuRnIwRHh5cllMbE1pbW9yUmVKcyt5R2hWN2VKMnZa?=
 =?utf-8?B?ajh6SldCZ05OOE1UZzA0bDAzTUpqYVBtNDVhbFM2TE5xUmFodFhDN1Blb3FF?=
 =?utf-8?B?TTF3N1k5WDh3bmVqS3RKNUFKZWdudmZxVFZZZ1lxZDd0UUI1ZThEekwvMmNj?=
 =?utf-8?B?YnhRVUZGZmUxcHl3a0lnUjF3TFUyWjFkQ1U0S1hXN2xZU3FJcEtKRWVvL20w?=
 =?utf-8?B?SFpNVVlLeUhHd0dHRkVwNnRuKy95OHpKVGxmSG80b3FUZEd4a3prRmRvRnMx?=
 =?utf-8?B?alloZTJmb1Bhc3c5b3hSbm56UVR5NnJDVmtvMzB5ZjVIY1YrRXBRY1NYeTM4?=
 =?utf-8?B?bE5Lbkt3R0VmTGVpT0UzUStuK3R0cUwzZ1NGeDZiK2VPa0hLZW1aYmJQbVFC?=
 =?utf-8?B?S0o0ajF5TkhWa3YrSjY0SlVnbERxUmhKOS9aSjBUVDl6cWhQWk9oaWJUVWlC?=
 =?utf-8?B?cmZRQU9WajVaUG5XM0hmVDU5eUJPcGdqMEE4OG1VblhaNmJ3eFpTY2R1b0N5?=
 =?utf-8?B?NXllNUJnYWxJWVY2OEZqT0xkMTVHc3V4UXVrZm03UDFsaDFyODdIVnBHeW1V?=
 =?utf-8?B?TVBDZUJzNjY3OXZZQkxEc0YwY1psc1QxZ3A3WEN1b2tpNXNabTlKbjVBMXBq?=
 =?utf-8?B?d05VM0QwSGc5MEttTUJYdnB4WmhwMForNkt4YkZTSml2ZHg2RTFsc3pRMExv?=
 =?utf-8?B?OW5yclM2KzZCT2J4SDU1R2ZCMExWMjZPY2MvUVo5b3ZtWnZvTkVxSnE1bkdi?=
 =?utf-8?B?eWRCcmMzUEsvNk5RQzJqb3JvVitiZnJwZFMwbHVYY2gzUnBYN1VUcGxIRVRF?=
 =?utf-8?B?S1ZsUVJRblB5QkNPclVXTHgza3FqQllaTU11cm1lTE84OG0zZ1AvYk5reHlV?=
 =?utf-8?B?SkhrNFhhYzBxTFFmZyszZThGMVprRjRUZ21QMmdEY0NySDBodi9MZzI2VjhX?=
 =?utf-8?B?SDRvcDBsOUplbzZWc2VKLzkvRG9aeFZxUFo0eU5ORGIyUlF3QTRyZWJZeUY1?=
 =?utf-8?B?QWhSZzgvNStxejBrbmVudVpTTnNITjYxcFVZMlFldG1aZXZBSm1XY1VSalNo?=
 =?utf-8?B?ZHJXV1ZNTjBBPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6211.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MjRhbFB4cVFFQkw1V1o1YmtoVTUxNkt3MlZFY1o4aEtnWlRRc1VoY25EMndK?=
 =?utf-8?B?bkhMSHc1cXZubU91enltQVVQNXNpclhxOENWSW9ZcXFnUTFhMHJROU5wOWp2?=
 =?utf-8?B?WWQzMzdRanR4SDQrb01HQkp2RmR3cWZlNUsrNUpFdkgvMDdmUVFxMEpYTVhX?=
 =?utf-8?B?OXhPdWpxWVBvY0dWUm0wbm0rbG55MXVKYngvdU9EVHpUemtFa1V1U0JOcE1P?=
 =?utf-8?B?Y0pJN2JoZ0ErZVBNcFBmOHBySk96eXJCWUdPSkh6RkVMWnZmVlBlb1A4akNP?=
 =?utf-8?B?c2J3Wkk4eWQ3N1BwN29QcTlLL1lDMHpOaUk4NlpJYWNNeldsNWFnZHorOVdX?=
 =?utf-8?B?TjJEMjNwZEZBd1o1TkhtbHNGMWlpaTQ3cDJrOUxCcnBWR2FYenJBeUR1NnRw?=
 =?utf-8?B?eEo4OVRnZlVJZzhURTVIcHNmc2NqOVpKbTQ3VnZUdkRQNmZlQ0hVcEtXVEFq?=
 =?utf-8?B?RkE4blVVTUZFdkQ0WWk3QmZiTDFMMFVkeTBxbGl2M3g2ZllqaDhaVEozNi85?=
 =?utf-8?B?eFJWMTVWRjZuUEQ4WEhZcFZwUTNjcStkTWM3aWxERFhhMkRvMWJzbDJjK0pB?=
 =?utf-8?B?MW9qU1JLSkdnaUlOZ25OVzNQOUhaUkxmTWFBdGtTZUV3aU9kSmJvSXV0RmRV?=
 =?utf-8?B?dW5NU2JHaS9WNnRycXgvejVUOVdjZHhRQkk2RUVISkdYS3Z4d3BMS1NMeG4r?=
 =?utf-8?B?UU9CRmp3NVpSdmNkc1QxcWpXMHhKUGh0anJiYnNjN05Jd0ovZytlcXpPSVN2?=
 =?utf-8?B?c296Z2xZMWxPK0dJTnFNbGJwVWFENzVsZjNtTTZ2Rm1ubGJkNXpneHoxamJO?=
 =?utf-8?B?cXBOcENJSFdWVmNpcWRNMStjcURZeDd5WkhhYUpRdHFtb1ZFYnJDYytEQTBQ?=
 =?utf-8?B?N0xTL1h3M1JJTFFHcExzemRXOVdhM1dxZkVTL3puT3p3RzJyN3o1SE1pblox?=
 =?utf-8?B?M0M4NEJ0bm5hWHgwejVUYUlIRU9FS0hBMWdpNTgwbGt1NGxtcUVHQnBKNDA2?=
 =?utf-8?B?VTNoSEtwMWhmTXBQMWc0U2laZFVXMnFybkErQnVhSVBSQ2J0R1BNSTI2RXFh?=
 =?utf-8?B?ZmJ1QjhCNi9VQVZQM1FFUXVxamR4T1p3Vk1tbnZvSDdram54SFkrQVZwZTNJ?=
 =?utf-8?B?T3FnQVZDZTFxZVI4QVNyOGtramhUNHhrTVQvaldVQ1ZTTWxPWjNYeERLZmlN?=
 =?utf-8?B?eWZ2WGUra3JUVnp5R0QxWmZ5UkdYWHZyVXZiRDJYNkNVQXd5bEprQWo3czR2?=
 =?utf-8?B?Mlp0ZFNVbFo3UlQ3d01uN0M1L0hxdkY3dyttcDZLN3g5U0NxcmZoNkdLZ1Vy?=
 =?utf-8?B?amJsaEtXNXlPS3lzK2tMT3lqMnJtZ0xIMlhFSDQ2T0JVNEMvTmR1dkxTRnpZ?=
 =?utf-8?B?N2s1VGdHOVg5VElCOEtjdFdnbVU2WmRLNW1wZDliUWFzc0Ewekd4NnNlS3lC?=
 =?utf-8?B?M1VhbHZ6c2UzZEpuSXM3eGRNQ0RsbFdzbENuVk1YdXlxODRNckRzSkpmTzFN?=
 =?utf-8?B?WFZTTmdHUGFOOGRhbFN5amtyRndwK1lEMS9Gd1hKUDgxSWIzZ2xwR2Y5SHg4?=
 =?utf-8?B?UUFmYWNNUmgzakhzSXBLL216c2t5RnNEdSs1N0tmSEJuWlhFZTZBTmFSTzRr?=
 =?utf-8?B?TTBIK1JxQkp5T0JZV1Irazg4YzlKeEpwcnhCcGtpYmlIVEhsM2VnSUkyejdY?=
 =?utf-8?B?TmExWWtadDJYY1lLWTNsRUx4UDhzQWJtS1ZlVDg2ZENISkhOS25XclJOanVF?=
 =?utf-8?B?WmxXZER1YUJCbUJGL0tXZkM5YldDYlVCOU1YNSswb3c1WGQ2UGx1V3hqR2U3?=
 =?utf-8?B?cnI1MFgrRkdvb2hEcDdjUUFKNTlUVkZTbEJ4dCtpbEVBbmU5OWNqMkJ5NUNC?=
 =?utf-8?B?d0VSTFFPTDVTYUFOajVmRHluZSszQ1JKazZnWW14SjdvUkl5MkFEQ0s3VExt?=
 =?utf-8?B?NzdnOXNGdGNCWlcyQWJFVU9zejZ2KzFSVDVEYWVOeWRmWkVwa0c2UjFYZnU4?=
 =?utf-8?B?Y1YxN041a2F2VnpXVlkvT2dPNStSWjJtZ0diRm01NXZ0TGdDNk1nQXkxZEds?=
 =?utf-8?B?alhNNWVKMG1zWXc3cEhzNVBCRnVteXR4Rmk1THhhTS9lRkRvd3I5b00zaWNK?=
 =?utf-8?Q?ingWO0c6A8FklnIvL52g92Kdu?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6211.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1fd91cf4-45db-4c70-3ff4-08ddcf6627fe
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jul 2025 12:39:42.0652 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ks6uj8rfPSnKV8e6QEjTvsikAkDzJf1ZskgQDY5AOTZ3SfsMzUNPLmm+ft5AKE04yNusxHKTZOByAYve6RGgb+8pQWGs03WQY8WpKRwC1Bs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4933
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSyBWIFAsIFNhdHlhbmFy
YXlhbmEgPHNhdHlhbmFyYXlhbmEuay52LnBAaW50ZWwuY29tPg0KPiBTZW50OiBXZWRuZXNkYXks
IEp1bHkgMzAsIDIwMjUgNjowMyBQTQ0KPiBUbzogaW50ZWwteGVAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnDQo+IENjOiBLIFYgUCwgU2F0eWFuYXJheWFuYSA8c2F0eWFuYXJheWFuYS5rLnYucEBpbnRl
bC5jb20+OyBXYWpkZWN6a28sIE1pY2hhbA0KPiA8TWljaGFsLldhamRlY3prb0BpbnRlbC5jb20+
OyBCcm9zdCwgTWF0dGhldyA8bWF0dGhldy5icm9zdEBpbnRlbC5jb20+Ow0KPiBXaW5pYXJza2ks
IE1pY2hhbCA8bWljaGFsLndpbmlhcnNraUBpbnRlbC5jb20+OyBHdXB0YSwgQW5zaHVtYW4NCj4g
PGFuc2h1bWFuLmd1cHRhQGludGVsLmNvbT4NCj4gU3ViamVjdDogW1BBVENIXSBkcm0veGUvcG06
IEVuYWJsZSBSUE0gdmlhIFBDSWUgUE0gY2FwYWJpbGl0eQ0KPiANCj4gRW5hYmxlIFJ1bnRpbWUg
UG93ZXIgTWFuYWdlbWVudCAoUlBNKSBmb3IgUENJIEV4cHJlc3MgZGV2aWNlcyBieSB1dGlsaXpp
bmcNCj4gdGhlaXIgbmF0aXZlIFBvd2VyIE1hbmFnZW1lbnQgKFBNKSBjYXBhYmlsaXRpZXMuDQo+
IA0KPiBTaWduZWQtb2ZmLWJ5OiBTYXR5YW5hcmF5YW5hIEsgViBQIDxzYXR5YW5hcmF5YW5hLmsu
di5wQGludGVsLmNvbT4NCj4gQ2M6IE1pY2hhbCBXYWpkZWN6a28gPG1pY2hhbC53YWpkZWN6a29A
aW50ZWwuY29tPg0KPiBDYzogTWF0dGhldyBCcm9zdCA8bWF0dGhldy5icm9zdEBpbnRlbC5jb20+
DQo+IENjOiBNaWNoYcWCIFdpbmlhcnNraSA8bWljaGFsLndpbmlhcnNraUBpbnRlbC5jb20+DQo+
IENjOiBBbnNodW1hbiBHdXB0YSA8YW5zaHVtYW4uZ3VwdGFAaW50ZWwuY29tPg0KPiAtLS0NCj4g
IGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9kZXZpY2VfdHlwZXMuaCB8IDIgKysNCj4gIGRyaXZlcnMv
Z3B1L2RybS94ZS94ZV9wbS5jICAgICAgICAgICB8IDkgKysrKysrKysrDQo+ICBkcml2ZXJzL2dw
dS9kcm0veGUveGVfcG0uaCAgICAgICAgICAgfCA0ICsrKysNCj4gIDMgZmlsZXMgY2hhbmdlZCwg
MTUgaW5zZXJ0aW9ucygrKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94
ZV9kZXZpY2VfdHlwZXMuaA0KPiBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9kZXZpY2VfdHlwZXMu
aA0KPiBpbmRleCAzOGM4MzI5YjRkMmMuLjNiYmZjNDYwNDRhMCAxMDA2NDQNCj4gLS0tIGEvZHJp
dmVycy9ncHUvZHJtL3hlL3hlX2RldmljZV90eXBlcy5oDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS94ZS94ZV9kZXZpY2VfdHlwZXMuaA0KPiBAQCAtMjg1LDYgKzI4NSw4IEBAIHN0cnVjdCB4ZV9k
ZXZpY2Ugew0KPiAgCQkgKiBwY29kZSBtYWlsYm94IGNvbW1hbmRzLg0KPiAgCQkgKi8NCj4gIAkJ
dTggaGFzX21ieF9wb3dlcl9saW1pdHM6MTsNCj4gKwkJLyoqIEBpbmZvLmhhc19wbV9jYXBhYmls
aXR5OiBEZXZpY2UgaGFzIFBDSSBwbSBjYXBhYmlsaXR5ICovDQo+ICsJCXU4IGhhc19wbV9jYXBh
YmlsaXR5OjE7DQo+ICAJCS8qKiBAaW5mby5oYXNfcHhwOiBEZXZpY2UgaGFzIFBYUCBzdXBwb3J0
ICovDQo+ICAJCXU4IGhhc19weHA6MTsNCj4gIAkJLyoqIEBpbmZvLmhhc19yYW5nZV90bGJfaW52
YWxpZGF0aW9uOiBIYXMgcmFuZ2UgYmFzZWQgVExCDQo+IGludmFsaWRhdGlvbnMgKi8gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9wbS5jDQo+IGIvZHJpdmVycy9ncHUvZHJtL3hl
L3hlX3BtLmMgaW5kZXggNDRhYWYxNTRkZGY3Li41ZTYzMTE5NjQ2ODUgMTAwNjQ0DQo+IC0tLSBh
L2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9wbS5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94
ZV9wbS5jDQo+IEBAIC0yNDQsNiArMjQ0LDkgQEAgc3RhdGljIHZvaWQgeGVfcG1fcnVudGltZV9p
bml0KHN0cnVjdCB4ZV9kZXZpY2UgKnhlKSAgew0KPiAgCXN0cnVjdCBkZXZpY2UgKmRldiA9IHhl
LT5kcm0uZGV2Ow0KPiANCj4gKwlpZiAoIUlTX1JQTV9TVVBQT1JURUQoeGUpKQ0KPiArCQlyZXR1
cm47DQo+ICsNCj4gIAkvKg0KPiAgCSAqIERpc2FibGUgdGhlIHN5c3RlbSBzdXNwZW5kIGRpcmVj
dCBjb21wbGV0ZSBvcHRpbWl6YXRpb24uDQo+ICAJICogV2UgbmVlZCB0byBlbnN1cmUgdGhhdCB0
aGUgcmVndWxhciBkZXZpY2Ugc3VzcGVuZC9yZXN1bWUNCj4gZnVuY3Rpb25zIEBAIC0yNjUsNiAr
MjY4LDcgQEAgc3RhdGljIHZvaWQgeGVfcG1fcnVudGltZV9pbml0KHN0cnVjdA0KPiB4ZV9kZXZp
Y2UgKnhlKQ0KPiANCj4gIGludCB4ZV9wbV9pbml0X2Vhcmx5KHN0cnVjdCB4ZV9kZXZpY2UgKnhl
KSAgew0KPiArCXN0cnVjdCBwY2lfZGV2ICpwZGV2ID0gdG9fcGNpX2Rldih4ZS0+ZHJtLmRldik7
DQo+ICAJaW50IGVycjsNCj4gDQo+ICAJSU5JVF9MSVNUX0hFQUQoJnhlLT5tZW1fYWNjZXNzLnZy
YW1fdXNlcmZhdWx0Lmxpc3QpOw0KPiBAQCAtMjc4LDYgKzI4Miw4IEBAIGludCB4ZV9wbV9pbml0
X2Vhcmx5KHN0cnVjdCB4ZV9kZXZpY2UgKnhlKQ0KPiAgCQlyZXR1cm4gZXJyOw0KPiANCj4gIAl4
ZS0+ZDNjb2xkLmNhcGFibGUgPSB4ZV9wbV9wY2lfZDNjb2xkX2NhcGFibGUoeGUpOw0KPiArCXhl
LT5pbmZvLmhhc19wbV9jYXBhYmlsaXR5ID0gISFwZGV2LT5wbV9jYXA7DQo+ICsNCj4gIAlyZXR1
cm4gMDsNCj4gIH0NCj4gIEFMTE9XX0VSUk9SX0lOSkVDVElPTih4ZV9wbV9pbml0X2Vhcmx5LCBF
UlJOTyk7IC8qIFNlZSB4ZV9wY2lfcHJvYmUoKQ0KPiAqLyBAQCAtMzY0LDYgKzM3MCw5IEBAIHN0
YXRpYyB2b2lkIHhlX3BtX3J1bnRpbWVfZmluaShzdHJ1Y3QgeGVfZGV2aWNlICp4ZSkNCj4gew0K
PiAgCXN0cnVjdCBkZXZpY2UgKmRldiA9IHhlLT5kcm0uZGV2Ow0KPiANCj4gKwlpZiAoIUlTX1JQ
TV9TVVBQT1JURUQoeGUpKQ0KPiArCQlyZXR1cm47DQo+ICsNCj4gIAlwbV9ydW50aW1lX2dldF9z
eW5jKGRldik7DQo+ICAJcG1fcnVudGltZV9mb3JiaWQoZGV2KTsNCj4gIH0NCj4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9wbS5oIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3Bt
LmggaW5kZXgNCj4gNTk2NzhiMzEwZTU1Li41NWI2NTcyOGY1MjIgMTAwNjQ0DQo+IC0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS94ZS94ZV9wbS5oDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9w
bS5oDQo+IEBAIC05LDYgKzksMTAgQEANCj4gICNpbmNsdWRlIDxsaW51eC9wbV9ydW50aW1lLmg+
DQo+IA0KPiAgI2RlZmluZSBERUZBVUxUX1ZSQU1fVEhSRVNIT0xEIDMwMCAvKiBpbiBNQiAqLw0K
PiArI2RlZmluZSBJU19SUE1fU1VQUE9SVEVEKHhlKSAoeyBcDQo+ICsJCXN0cnVjdCB4ZV9kZXZp
Y2UgKl9fX3hlID0gKHhlKTsgXA0KPiArCQlfX194ZS0+aW5mby5oYXNfcG1fY2FwYWJpbGl0eTsg
XA0KPiArCQl9KQ0KSU1ITyB0aGUgY29ycmVjdCBtZXRob2QgdG8gbGV0IFBDSWUgY29yZSBnZXQg
dGhlIHBlcm1hbmVudCByZWYgY291bnQgaWYgcGRldi0+cG1fY2FwIGlzIGZhbHNlLg0KQFZpdmks
IFJvZHJpZ28gd2hhdCB5b3VyIHRob3VnaHQsIEkgdGhpbmsgWGVLTUQgc2hvdWxkIG5vdCB0YWtl
IGFueSBkZWNpc2lvbiBiYXNlZCB1cG9uIHBkZXYtPnBtX2NhcC4NClRoYW5rcywNCkFuc2h1bWFu
IA0KPiANCj4gIHN0cnVjdCB4ZV9kZXZpY2U7DQo+IA0KPiAtLQ0KPiAyLjQzLjANCg0K
