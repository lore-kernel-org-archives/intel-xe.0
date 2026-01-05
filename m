Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE8F5C79FA7
	for <intel-xe@archiver.kernel.org>; Mon,  5 Jan 2026 17:16:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7420010E04E;
	Mon,  5 Jan 2026 17:16:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ArRHsByC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4184B10E04E
 for <intel-xe@lists.freedesktop.org>; Mon,  5 Jan 2026 17:16:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767633382; x=1799169382;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=i+ywQhHzgfn0q44PKlDRLGu8je0g6T6jiq+cl9VyInI=;
 b=ArRHsByCDrIa4FTmGQeb54D6BlCMh5VmFezRP3/zhVKFIJqknSZjTfmz
 YcOZWHSn3HYliOZ3UYdvRdGqoxxnbeooQ5NPfXX98kPQlSotRxpMGAKVT
 QRmKszVQyPHbXJXkFBQGG+1YRd177Ok5RzIymQWzuwMgGvD79Ae2Av6D2
 PYl6SauId2H2LA/u7sYu6TKXLnja7tGXuvb1t5JK+PMICQEDqsIh8hK4f
 5jNpL5oyMYWIus6eCcpQDMnIAkCmnPTGdIPRFYaNDrF70nI0W/qSkv+R8
 p5r7LryinL7QLuUceZg+1ZvjctblN1ZHQF5Y5ImvYzNlPcTCNYMiqP7bs g==;
X-CSE-ConnectionGUID: XM2bxTuCQiqwkn3NoDQDNQ==
X-CSE-MsgGUID: 4yQL8dgNRrG3tapcHpiybQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11662"; a="80450025"
X-IronPort-AV: E=Sophos;i="6.21,203,1763452800"; d="scan'208";a="80450025"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2026 09:16:21 -0800
X-CSE-ConnectionGUID: suVfdrfmSPaI/GVOREaXHQ==
X-CSE-MsgGUID: e9oZ/+5qReObP8Mnuv3G3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,203,1763452800"; d="scan'208";a="207325724"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2026 09:16:21 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 5 Jan 2026 09:16:20 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 5 Jan 2026 09:16:20 -0800
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.26) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 5 Jan 2026 09:16:20 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WGxzeRPJ/1C9UyciYOHDAtQDrH81M77gqlH4YxrsFdPcKko4rKinB86dZNY4sj9jT/W61RZerv8wNpqXW2Tq65hecVm4bIgdditt75rZA52lMsjPFF5LwA9K+bANbW2a7S6wFHrSEJT8mAIcfvOh8aezyPpVW0PlhnWM8Vu6C0L/3g8/xyML+dsY5bYAF3CB83mzQdaIA6K2Yi98cae3vTFNqIJLNta4+RYwvNExwPmOscK8ltnhVJzW1nvHv0vj39Zw0pFoANq6skNONc8gy+jBBRssm7upSijAFOXubTnLi/8uGnrcOVgUB1dTf4KFbiweSfgRMN2TEJITvS1eUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GhKz4+EeIauCPPYnp1EW16xLwPOf2fenKbnFTMdmHVQ=;
 b=wV1PkGezL1sJnN1PY0mq9GpaFUx1F5V6IVm74SX8fgmYdf3KWDuwuaR6fHHkwOoDeyi3RdxC+hO2p3aE/xfH/rDmdPaBC4BFpSY4uvK1WB4HDGZZKzTNsCQVW+Fio/UVE62zz6dy/1UAmqNjnPGMWk2sN83d2av+JDSQQ9q632OB7g0Z6m8wt27HLk+EUIP2lQhAAiqori9u0MqjHMlR/V+MfDuaKhXcB51zw0hdFXWPvPNClVQmla+99gLDzCQtoMTJGDGd+cgKRUyOD4UsNzf0w5R1IQxq90Ynzvw0O+xWGal+3hzVhU6zHVR1YOb86oNxYZIjsJRJDUq3TeQSVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA1PR11MB8839.namprd11.prod.outlook.com (2603:10b6:806:467::17)
 by SJ2PR11MB8401.namprd11.prod.outlook.com (2603:10b6:a03:539::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Mon, 5 Jan
 2026 17:16:17 +0000
Received: from SA1PR11MB8839.namprd11.prod.outlook.com
 ([fe80::ce6c:3c7f:92ef:1394]) by SA1PR11MB8839.namprd11.prod.outlook.com
 ([fe80::ce6c:3c7f:92ef:1394%5]) with mapi id 15.20.9478.004; Mon, 5 Jan 2026
 17:16:16 +0000
From: "Nguyen, Brian3" <brian3.nguyen@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH 1/2] drm/xe: Fix page reclaim entry handling for large
 pages
Thread-Topic: [PATCH 1/2] drm/xe: Fix page reclaim entry handling for large
 pages
Thread-Index: AQHcdS406LcziOFrHUiptU3npXlQTLU/7VXwgAPmzYCAAADrAIAAC+2Q
Date: Mon, 5 Jan 2026 17:16:16 +0000
Message-ID: <SA1PR11MB8839773B6F96107699CF81B2AA86A@SA1PR11MB8839.namprd11.prod.outlook.com>
References: <20251224233638.1535283-4-brian3.nguyen@intel.com>
 <20251224233638.1535283-5-brian3.nguyen@intel.com>
 <SA1PR11MB8839BBCE618C31517EFA4A47AAB8A@SA1PR11MB8839.namprd11.prod.outlook.com>
 <aVvk39vLp+j9qRR1@lstrano-desk.jf.intel.com>
 <aVvlpFfDLZC9yleV@lstrano-desk.jf.intel.com>
In-Reply-To: <aVvlpFfDLZC9yleV@lstrano-desk.jf.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR11MB8839:EE_|SJ2PR11MB8401:EE_
x-ms-office365-filtering-correlation-id: 1d4c301e-1952-4a6f-1599-08de4c7e22db
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info: =?us-ascii?Q?BbzuEjla5WMaawfi8qPgZKrYc1IjUyPBOo44vnpKJt1Z66Qz03TYKLWqli1f?=
 =?us-ascii?Q?DBlmBdnGzeuB5f3VHqzNWeRuKCVBJ+/AsHkVT2okvIOXuue/vuHbmwlYOxIB?=
 =?us-ascii?Q?vt0kwd5tIvoUAUOTtntwCdHd5jjl6NzzpqJ89qwiArtjU5AsAsj1e5nWqeTz?=
 =?us-ascii?Q?WQUOd6XwRdbFRrUOjA0XXetc3mXGRAg8WCco/KcRFvuH12pzOrE0vMgxkOoY?=
 =?us-ascii?Q?Ws4mCzImgGZBBJ/yPMdp6xQHF8xPwWs8+Q6Oms2gaYgQZnLivMuIFbHy4Iqt?=
 =?us-ascii?Q?kv0kBX9pijJdWv7BrK0kmgHgTNRLLO11RdKEHF6MjN7/cR/ZLWx37MthJ2RW?=
 =?us-ascii?Q?VNr6TsntKmiTzCsI/BFDPP9uxvBmLRaUle7iWRAC5d5mGewJ9CoYYsWvtIFR?=
 =?us-ascii?Q?RZLCXTzFIjhW5PSQ3URwg3t0+t3QgXQNnaCdZ7vNtsrPmC2SxBLWJHxoWExO?=
 =?us-ascii?Q?/mzPKguFzPFa7nF3UBjpP9JVmVMQjjj6sChj9GJLS07XY5h0PyuAAaWdosiW?=
 =?us-ascii?Q?ck1vL1QH1laqOOwDl2lP2WQ2lJCC16GgZXl8YUOt7xkoRIknEsCabkWKiouS?=
 =?us-ascii?Q?t3D4Z+3GNJU2f+5VBOTD5RuEyNejpKPvnX0kB1jy58fGlxvhCBPnDwjcUMDa?=
 =?us-ascii?Q?d3KcDPnoxPkOOf/+vPUsXsqZswLybZg38SUGGp+yoseZN8OGSTpyxKKtfXur?=
 =?us-ascii?Q?8N5QCtXNM3QJwFwYHSjdfXFOc0R7DNfAoqxKBPCwZzrYUH3DAMUJfZs/YssV?=
 =?us-ascii?Q?Szb/zwCtEGqlgzYYnI3NQebv3aXCg6Ez4HniB/2JVEMeLHBkPo54a9YnTHUD?=
 =?us-ascii?Q?ZHY2cI3/ku2eyQEkqeoTZz18Rdio611T0vqQNm13ylJYewMhtHDCcUnLu0QB?=
 =?us-ascii?Q?4iCbIJnC+zRUeEXig5v4jlnHghFOx82BA1dxFckV07AlMQPDOGgha+dpgGMZ?=
 =?us-ascii?Q?WxPR5S1JSPdwUNZJL5rfFrIWJghARgEFI8qARjcbwklBBZOhjHD7AGpalfKv?=
 =?us-ascii?Q?GZPZs/T8uw0h+PdsruGP+Ffx7EhsAwdYCVyrp6b0J5e86VZ2aiY3s7yJMxKe?=
 =?us-ascii?Q?ndvmKDWoLLwOs2ovrKT7HVumdvHH/CFPDc6F3bJAkzz+vkZvNpYeVuOHHTqZ?=
 =?us-ascii?Q?vb/SZ/lZIYDPX9IReOCicMrhe5ikLKc6kP+tPorSRhbfdlUX21JhsKbCQc/M?=
 =?us-ascii?Q?QpVbsQkHTqZXjm1ccWL/P5TxXUI/bB4nOUWHDLZoYqca4lpTK5G7fomNnm00?=
 =?us-ascii?Q?KJViVrd4F03F2ALTQnmd7gQmYQvzM0plBJ0Jm32FR8Q+M5+VF0CUqxvaIcNj?=
 =?us-ascii?Q?gIYq2VDYMurbTD4c9+PBnz0D5T7Gt2RirsrVghvPd8ZFqLsNrLdV/0dFYblc?=
 =?us-ascii?Q?QsUyZ5sffMXaDQf7369hECIlEBtdYN4HOVvom96kVh2+ciR6plPHFZvGo5pX?=
 =?us-ascii?Q?3cCWyDYbUG/b885MxNm7ays0xbg7/t1M1hqWi0TwtqKaMHSKdNXMOIsyu6yC?=
 =?us-ascii?Q?g2zMrDMhq1vj8X7EY8Tk4LuLMFkxu/J62XkZ?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB8839.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?NwSdY6wbq4u7IdMiL5xpnom5fllZdQjpuqEaljMEqHUBwSw2wPInk1/WRzAl?=
 =?us-ascii?Q?xDhmEPKZzDA0XM7VfWFqgdTrRuZIrHMiTgWl28axzozsWHheMzFxd4sOaYyU?=
 =?us-ascii?Q?yyUUsJEXuwFZoYg8HIaA0TfbkLiFfbrPbJ4Pyl+hYwVXkx7bEjvJD0piZOml?=
 =?us-ascii?Q?PzswWDofob2BQ8tk5/Lq19BUNmOy16nqeDrLSURdg+RTDdbfYEKHPRw5u4V9?=
 =?us-ascii?Q?BRoD4N35PkpaJjLcaKu3T7MQT9VR8s0pXI5NNEVLsTsKWhC9pew++ZNYkmmb?=
 =?us-ascii?Q?sRBKGtCZPGDbRpEF5qKOD88RKSBv3Eg65USWdOT4pY27pMbmLlzxLIYzravs?=
 =?us-ascii?Q?wo43po3hcyMH58FYOulbYxSVYNgVTrF2LJ592D61wOVe6ADMEt292pCW//EW?=
 =?us-ascii?Q?jTw4ZPyN5FaOHE6bVp8Kv1WIIQYbCZDBFfWnh+TByMfhO8o7tIWBsIcNvau2?=
 =?us-ascii?Q?l6Fd1zeks3vcgxgCJXVLZ8FaYOtJ9mIgdGNtpasuAO5hCPwDWUsXOljeJp3n?=
 =?us-ascii?Q?7Aw7Ul0didB429BC786O62Yp1GM80+fRbNNmn5Pq/ZL33U7YSy9vBUMugCQU?=
 =?us-ascii?Q?oPD0x2eOVEv0diQA4qhpyMQ0HCG9H/CwAcGWHlGmOZzu690S00dXao0Nzu6O?=
 =?us-ascii?Q?NepllIi9MSiwDBYp296bvyxMOessMVYpMxrm4ZPwgXjEq7thCQx6tBClky28?=
 =?us-ascii?Q?mx7uYb7cYuICFu3LBmb3oZm7GNuoWFiqjYEVmIOyBNEt7tm6/xEkktaPqxV7?=
 =?us-ascii?Q?BNrTWwIzFOLiGY41GHR5bxAE9ZSLSwZqC0Tims7ROSrKWwhCR8gSLoY9HPaH?=
 =?us-ascii?Q?pnzGCPAH9HpfsD9oK9+HjJGB2hYeEttOREXmRI6UD1DxVRWLMg/3I9OySUbX?=
 =?us-ascii?Q?mXk9XtZaka6AT+c3CSTipU8Z3NVl/Q1wG6O9JQl+Q5A55Siyc3M8xxQGKcTa?=
 =?us-ascii?Q?wZFO7imju2i0Fq3VK15DxFZXjONa515iLPorCtVlOFAs7ooe+4WWtYKL70CK?=
 =?us-ascii?Q?RlL/YcFB9UfV9N+QSmXMIl0S4Z+2z8mXjtXN4S4B4Fvo8KlAzWxmjbFlFpbh?=
 =?us-ascii?Q?rZI00jM4XeCD+A1D4z3N2XYtDHZN8q9+jy2l3dVyGQvNwHv055Ku5xzMTnOQ?=
 =?us-ascii?Q?d+gyr5Iu4pClKnsZS36t+GgXWoSo+WqDwZhVxH1w7sOgDhlXF2dklFKwCawJ?=
 =?us-ascii?Q?oJrHF/FbLjBchW8iV6543dk3b9OKmNUNALQiyCDKTkP5ugDkOOfO37WT30cx?=
 =?us-ascii?Q?rURxfDk9DAZKXx57uPAXsAbGYqfUM5ppTeOrbHwjGNuO0A5y5BVwCWRPmMyk?=
 =?us-ascii?Q?AP4qFSG2H7H+qUtkimnI3gxHDTzz/Kp+csnJps0mIqezuZfw3oUBPce7CEcE?=
 =?us-ascii?Q?Pa9Y9BR2eSlGAtVION9ZcbbZHJwmN3x5NXAqB6uq+i2URRY4QEuTPNdkUYdo?=
 =?us-ascii?Q?tR1kHza9+mdNynXcUFB1eZPxTDnJ/2PikM4dYsTbvCJWwVOjEvGfiEnRTb5W?=
 =?us-ascii?Q?RM06gHje6W9Dti2rialLFaMg/izyx1sByNPMsFWeqewWvKZZg1BDAgNSQvVw?=
 =?us-ascii?Q?1odDPb28L+ItLlGfVUHErTZyPIKjvdlk9VcmiP5jwFcw4925OZiyxRGsytTJ?=
 =?us-ascii?Q?0RFegTg0TbNA1nFfyuk7gn0y6m0BQMQRePrmYvaKsihCcZDR9MMWPnkqWUDU?=
 =?us-ascii?Q?dT+Eg8LZfv6nYltTyTckvYlT8os1w7AjfszyKYOhJIcmlIRvFP5HYwDzrDOe?=
 =?us-ascii?Q?DSWZbSUV9A=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB8839.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d4c301e-1952-4a6f-1599-08de4c7e22db
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jan 2026 17:16:16.6987 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kUkOs6EJtzw6QmOpdQhTY8JTTa0MNBFUPNXofSo4uSshxj2obLhp1xj5a+7BebKXIVWrELUA1cgcdEazbJSTUA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8401
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

On Monday, January 5, 2026 8:24 AM, Matthew Brost wrote:
> On Mon, Jan 05, 2026 at 08:20:47AM -0800, Matthew Brost wrote:
> > On Fri, Jan 02, 2026 at 11:21:08PM -0700, Nguyen, Brian3 wrote:
> > > On Wednesday, December 24, 2025 3:37 PM, Brian Nguyen wrote:
> > > > For 64KB pages, XE_PTE_PS64 is defined for all consecutive 4KB
> > > > pages and are all considered leaf nodes, so existing check was fals=
ely adding multiple 64KB pages to PRL.
> > > >
> > > > For larger entries such as 2MB PDE, the check for
> > > > pte->base.children is insufficient since this array is always  defi=
ned for page directory, level 1 and above, so perform a check on the
> entry itself pointing to the correct page.
> > > >
> > > > For unmaps, if the range is properly covered by the page full direc=
tory, page walker may finish without walking to the leaf nodes.
> > > >
> > > > For example, a 1G range can be fully covered by 512 2MB pages if
> > > > alignment allows. In this case, the page walker will walk until it
> > > > reaches this corresponding directory which can correlate to the 1GB=
 range. Page walker will simply complete its walk and the
> individual 2MB PDE leaves won't get accessed.
> > > >
> > > > In this case, PRL invalidation is also required, so add a check to
> > > > see if pt entry cover the entire range since the walker will comple=
te the walk.
> > > >
> > > > One small case is some seemingly racy condition where multiple
> > > > invalidation on the same PTE will caused the value read to be zeroe=
d out. In that case, we could just skip the entry since it only
> occurs if a previous page walks invalidates it.
> > > >
> > > > Fixes: b912138df299 ("drm/xe: Create page reclaim list on unbind")
> > > > Signed-off-by: Brian Nguyen <brian3.nguyen@intel.com>
> > > > Cc: Matthew Brost <matthew.brost@intel.com>
> > > > ---
> > > >  drivers/gpu/drm/xe/xe_pt.c | 44
> > > > ++++++++++++++++++++++++++------------
> > > >  1 file changed, 30 insertions(+), 14 deletions(-)
> > > >
> > > > diff --git a/drivers/gpu/drm/xe/xe_pt.c
> > > > b/drivers/gpu/drm/xe/xe_pt.c index 6cd78bb2b652..a79734079ef3
> > > > 100644
> > > > --- a/drivers/gpu/drm/xe/xe_pt.c
> > > > +++ b/drivers/gpu/drm/xe/xe_pt.c
> > > > @@ -1576,12 +1576,6 @@ static bool xe_pt_check_kill(u64 addr, u64 n=
ext, unsigned int level,
> > > >  	return false;
> > > >  }
> > > >
> > > > -/* Huge 2MB leaf lives directly in a level-1 table and has no chil=
dren */ -static bool is_2m_pte(struct xe_pt *pte) -{
> > > > -	return pte->level =3D=3D 1 && !pte->base.children;
> > > > -}
> > > > -
> > > >  /* page_size =3D 2^(reclamation_size + XE_PTE_SHIFT) */
> > > >  #define COMPUTE_RECLAIM_ADDRESS_MASK(page_size)				\
> > > >  ({									\
> > > > @@ -1594,7 +1588,8 @@ static int generate_reclaim_entry(struct xe_t=
ile *tile,
> > > >  				  u64 pte, struct xe_pt *xe_child)  {
> > > >  	struct xe_guc_page_reclaim_entry *reclaim_entries =3D prl->entrie=
s;
> > > > -	u64 phys_page =3D (pte & XE_PTE_ADDR_MASK) >> XE_PTE_SHIFT;
> > > > +	u64 phys_addr =3D pte & XE_PTE_ADDR_MASK;
> > > > +	u64 phys_page =3D phys_addr >> XE_PTE_SHIFT;
> > > >  	int num_entries =3D prl->num_entries;
> > > >  	u32 reclamation_size;
> > > >
> > > > @@ -1613,10 +1608,13 @@ static int generate_reclaim_entry(struct xe=
_tile *tile,
> > > >  	 */
> > > >  	if (xe_child->level =3D=3D 0 && !(pte & XE_PTE_PS64)) {
> > > >  		reclamation_size =3D COMPUTE_RECLAIM_ADDRESS_MASK(SZ_4K);  /*
> > > > reclamation_size =3D 0 */
> > > > +		xe_tile_assert(tile, phys_addr % SZ_4K =3D=3D 0);
> > > >  	} else if (xe_child->level =3D=3D 0) {
> > > >  		reclamation_size =3D COMPUTE_RECLAIM_ADDRESS_MASK(SZ_64K); /* re=
clamation_size =3D 4 */
> > > > -	} else if (is_2m_pte(xe_child)) {
> > > > +		xe_tile_assert(tile, phys_addr % SZ_64K =3D=3D 0);
> > > > +	} else if (xe_child->level =3D=3D 1 && pte & XE_PDE_PS_2M) {
> > > >  		reclamation_size =3D COMPUTE_RECLAIM_ADDRESS_MASK(SZ_2M);  /*
> > > > reclamation_size =3D 9 */
> > > > +		xe_tile_assert(tile, phys_addr % SZ_2M =3D=3D 0);
> > > >  	} else {
> > > >  		xe_page_reclaim_list_invalidate(prl);
> > > >  		vm_dbg(&tile_to_xe(tile)->drm,
> > > > @@ -1648,20 +1646,33 @@ static int xe_pt_stage_unbind_entry(struct =
xe_ptw *parent, pgoff_t offset,
> > > >  	struct xe_pt_stage_unbind_walk *xe_walk =3D
> > > >  		container_of(walk, typeof(*xe_walk), base);
> > > >  	struct xe_device *xe =3D tile_to_xe(xe_walk->tile);
> > > > +	pgoff_t first =3D xe_pt_offset(addr, xe_child->level, walk);
> > > >
> > > >  	XE_WARN_ON(!*child);
> > > >  	XE_WARN_ON(!level);
> > > >  	/* Check for leaf node */
> > > >  	if (xe_walk->prl && xe_page_reclaim_list_valid(xe_walk->prl) &&
> > > > -	    !xe_child->base.children) {
> > > > +	    (!xe_child->base.children ||
> > > > +!xe_child->base.children[first])) {
> > > >  		struct iosys_map *leaf_map =3D &xe_child->bo->vmap;
> > > > -		pgoff_t first =3D xe_pt_offset(addr, 0, walk);
> > > > -		pgoff_t count =3D xe_pt_num_entries(addr, next, 0, walk);
> > > > +		pgoff_t count =3D xe_pt_num_entries(addr, next, xe_child->level,
> > > > +walk);
> > > >
> > > >  		for (pgoff_t i =3D 0; i < count; i++) {
> > > >  			u64 pte =3D xe_map_rd(xe, leaf_map, (first + i) * sizeof(u64), =
u64);
> > > >  			int ret;
> > > >
> > > > +			/* Skip already cleared PTE from past unbinds */
> > > > +			if (!pte)
> > > > +				continue;
> > >
> > > Jumped to a conclusion a bit quick on this.
> > > On a second review of this specific case, this pte read of 0x0 is not=
 a cleared PTE but an unwritten value to pte.
> > > It looks like there is a race condition here when
> > > xe_migrate_update_pgtables() does the gpu job instead of the cpu writ=
e, So, the pte value read here is an unwritten pte value still
> awaiting the write from bind time issued job.
> > >
> >
> > Yes, I think there are 2 possible race conditions:
> >
> >  - Another thread is issues a TLB invalidation, I believe this would be
> >    possible if unbinding a userptr and MMU notifier races.
> >  - The original bind has dependecies which are unmet so the GPU job for
> >    the bind has yet to be executed and an unbind is pipelined behind
> >    that job.
> >
> > IMO both are really academic cases (i.e., very unlikely to occur in
> > real workloads, IGTs likely can hit these cases though). So maybe if a
> > empty PTE is found, we abort the PRL walk and fall back to a full
> > cache invalidation?
> >
> > > I'm working on a better handling here that will most likely have to
> > > wait on the fence of the gpu job to be signalled rather than just
> > > skipping the value (?)
> >
> > See above, I think since this likely race, we don't over engineer this
> > and just fall back to a full cache invalidation.
> >
>=20
> Typo - s/race/rare
>=20

Sounds good, will add that fallback to this check then since it is consider=
ed rare. Thanks!

Brian

> Matt
>=20
> > Matt
> >
> > >
> > > Brian
> > >
> > > > +
> > > > +			/* Ensure it is a defined page */
> > > > +			xe_tile_assert(xe_walk->tile,
> > > > +				       xe_child->level =3D=3D 0 ||
> > > > +				       (pte & (XE_PTE_PS64 | XE_PDE_PS_2M | XE_PDPE_PS_1G)));
> > > > +
> > > > +			/* An entry should be added for 64KB but contigious 4K have XE_=
PTE_PS64 */
> > > > +			if (pte & XE_PTE_PS64)
> > > > +				i +=3D 15; /* Skip other 15 consecutive 4K pages in the 64K
> > > > +page */
> > > > +
> > > >  			/* Account for NULL terminated entry on end (-1) */
> > > >  			if (xe_walk->prl->num_entries < XE_PAGE_RECLAIM_MAX_ENTRIES - 1=
) {
> > > >  				ret =3D generate_reclaim_entry(xe_walk->tile, xe_walk->prl, @@
> > > > -1679,9 +1690,14 @@ static int xe_pt_stage_unbind_entry(struct xe_p=
tw *parent, pgoff_t offset,
> > > >  		}
> > > >  	}
> > > >
> > > > -	/* If aborting page walk early, invalidate PRL since PTE may be d=
ropped from this abort */
> > > > -	if (xe_pt_check_kill(addr, next, level - 1, xe_child, action, wal=
k) &&
> > > > -	    xe_walk->prl && level > 1 && xe_child->base.children && xe_ch=
ild->num_live !=3D 0) {
> > > > +	/*
> > > > +	 * If aborting page walk early or page walk finishes,
> > > > +	 * invalidate PRL since PTE may be dropped from this abort
> > > > +	 */
> > > > +	if ((xe_pt_check_kill(addr, next, level - 1, xe_child, action, wa=
lk) ||
> > > > +	     xe_pt_covers(addr, next, xe_child->level, &xe_walk->base)) &=
&
> > > > +	    xe_walk->prl && level > 1 && (xe_child->base.children &&
> > > > +	    xe_child->base.children[first]) && xe_child->num_live !=3D 0)
> > > > +{
> > > >  		xe_page_reclaim_list_invalidate(xe_walk->prl);
> > > >  		vm_dbg(&xe->drm,
> > > >  		       "PRL invalidate: kill at level=3D%u addr=3D%#llx next=3D%=
#llx
> > > > num_live=3D%u\n",
> > > > --
> > > > 2.52.0
> > >
