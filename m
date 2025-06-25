Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4256AC7EE30
	for <intel-xe@archiver.kernel.org>; Wed, 25 Jun 2025 09:23:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24D8B10E00F;
	Wed, 25 Jun 2025 09:23:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bi2guYwk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06D2510E00F
 for <intel-xe@lists.freedesktop.org>; Wed, 25 Jun 2025 09:23:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750843413; x=1782379413;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=jYt5P/R/Y6/7MfKjBDz8s/ymyvzIHjR+gmPqqAWlD4E=;
 b=bi2guYwkIU9C/8ORMhh1HI/NUKXZuF4UeZMfzLfpHTVcRd+GFMeHAc8I
 uvvdF4xl152QjkZtuX2sznjWq1oEdaN/Ov9sXmZdkGx8lC2vo3EASqCC/
 I4o45zDVh2KGi6Y9q564NOZhsQywscPrsSIMj7xh0aviSgICv595TN3xG
 QA0aQo2J8lIDtetY3/3VI7yoQwz/05TBIcx/cdKNUbe9JSKjsEfhbnt16
 D7otglJXkp3OfCJ5q0gb2yrjDE4d3y1YEsxylGbAKFUBljf80LhCWUiX0
 1tpHq39ajK4OHZisdLSZUVxx1Q3NpwjkDwid7+CQJ6Aw8JiJkTXZcup6z g==;
X-CSE-ConnectionGUID: OjRO4wKtTGm9uQnPubXFIA==
X-CSE-MsgGUID: B03bf7zFSE2vfIOoJt/P8w==
X-IronPort-AV: E=McAfee;i="6800,10657,11474"; a="53245784"
X-IronPort-AV: E=Sophos;i="6.16,264,1744095600"; d="scan'208";a="53245784"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2025 02:23:33 -0700
X-CSE-ConnectionGUID: vxILmKfWSsO3KV1U3oTOYQ==
X-CSE-MsgGUID: UU3SNFWESeu40EzZQs89sw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,264,1744095600"; d="scan'208";a="152304201"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2025 02:23:32 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 25 Jun 2025 02:23:32 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 25 Jun 2025 02:23:32 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (40.107.243.79)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 25 Jun 2025 02:23:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hkdmNevJGC2oCR/Pu9bhVbzvw+ErAClrtiyuWXv0ZZJR3xEMwBwfV2tSC8BnvXRg0j+QpRnNxFVK40NbdohFJDA7nVPKhYKGxroav3KrS49A/MNN0+EJWn4Wb8OJt5raH97z0C8RDGqSHK5umnig/yC8y81PisYRvVj/eq1iga4k8B8YYQncuiyS8cmgqGjEiXMKJSH9uiZ3tJlPIoo+VriwKPhz9qeH3M06rXKBT09zIIVbjlBxgaqmWYp/6r68b7GT+tInpxtn6dWHiS1/marqp226FK52lcjgdcfX5r6X3TRDZDcZqUUmILGPm4ZAL9jkNJUEsglcp1+hESV6KQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jYt5P/R/Y6/7MfKjBDz8s/ymyvzIHjR+gmPqqAWlD4E=;
 b=PGJVhczTvQdSc11t3mLvpe0772C5/+ocgSW81r6uOi/XGZwz0/QCtod0Qrau6YfnxKgBTdd8RvP8QCaiNWBKwaerf7ta0rx0plTc5JU2PEeMTS6z0qo34pyBo+HsiFdkH16Md2H3/qjPygcyWX+UMm0Zr+vvQqxfQvKtC6uEpvupB4QyMBnS5f/C+2WgvCGjR/vYj6gvt7Gobfar4D0wck+/Is6M9hckYZKdaK0t6CAr3EN0Gh8E8TMBrv3N5kv4MB/qiv5yxG6Oa3BFWqWdB0htuft6tfwZPhKgK2cmQdAtEjjee98lRLTknn/oo2Y8ga/1S8F2edH8oERQsc016A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA3PR11MB8987.namprd11.prod.outlook.com (2603:10b6:208:574::18)
 by SN7PR11MB7566.namprd11.prod.outlook.com (2603:10b6:806:34d::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Wed, 25 Jun
 2025 09:23:29 +0000
Received: from IA3PR11MB8987.namprd11.prod.outlook.com
 ([fe80::c011:ff94:944e:f96e]) by IA3PR11MB8987.namprd11.prod.outlook.com
 ([fe80::c011:ff94:944e:f96e%3]) with mapi id 15.20.8769.022; Wed, 25 Jun 2025
 09:23:29 +0000
From: "Gote, Nitin R" <nitin.r.gote@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>, "Upadhyay, Tejas"
 <tejas.upadhyay@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "joonas.lahtinen@linux.intel.com" <joonas.lahtinen@linux.intel.com>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>, "Ghimiray, Himal Prasad"
 <himal.prasad.ghimiray@intel.com>
Subject: RE: [PATCH] drm/xe/uapi: Add
 DRM_XE_QUERY_CONFIG_FLAG_HAS_DIS_NULL_QUERY
Thread-Topic: [PATCH] drm/xe/uapi: Add
 DRM_XE_QUERY_CONFIG_FLAG_HAS_DIS_NULL_QUERY
Thread-Index: AQHb5AZdH+hg2/EL2UOyHedKXyhudLQRco+AgABaWMA=
Date: Wed, 25 Jun 2025 09:23:29 +0000
Message-ID: <IA3PR11MB8987A6919D85D9073B3A0698D07BA@IA3PR11MB8987.namprd11.prod.outlook.com>
References: <20250623064036.785908-1-nitin.r.gote@intel.com>
 <aFnufaHVIGrdyLFr@lstrano-desk.jf.intel.com>
In-Reply-To: <aFnufaHVIGrdyLFr@lstrano-desk.jf.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA3PR11MB8987:EE_|SN7PR11MB7566:EE_
x-ms-office365-filtering-correlation-id: 12eeec04-2724-4b38-9841-08ddb3c9f28a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?L1l6aTF2ZFZJRDA4clV5QklmNlBFeE9DaGFVWDA3eUxqbDlTUk1WRTE5eWU3?=
 =?utf-8?B?dmh1c1k3VGJtMTBTYXJxemx5WkZURnpuM1NiQ3RqWUg5eHRnZW1ubXdPZFZO?=
 =?utf-8?B?di9OdmdNY0pQV2RSUzhpeUxFaDcrTXR1bGlrYkloVFRXWk1oSHN6TFpHeHkx?=
 =?utf-8?B?bjdWVXNNWGJSNHpWK2lmMm9lMURPSGNBYlplVFFzT3VVbmZZU2UxamlqMCth?=
 =?utf-8?B?U0Z1R1JFcHBZTTg3bVd3czc3Y3ZIWFNJMko4eTFGa2JRQWlPbGdQS0tvcmRQ?=
 =?utf-8?B?Q0hOZ2lsSFI2OHhDNkZJZW55SC96QkhrZzhZdktlaDBnZ1ZsWkFjdFlWb283?=
 =?utf-8?B?ckNjUGlmaDdGWjIwYm41SnFMRkRIM2dEVmFzempuR2hxR0N5QUZDWHMxSTBH?=
 =?utf-8?B?cVVRcFkwS1I3dC9xQW00Qnh6azgzTVpkSzdsNUNndUV4V0kwdkszd0Z0MFRP?=
 =?utf-8?B?OHc1WkIrWldNZmo4czl0bzFzRXFLQ1ZSaFNBOS80eVRNTGFISm9KRTloSURS?=
 =?utf-8?B?MmJrbWFreXpGM2pzSlpKNDBjaVdvcXpuMDgxOUR1Qm92TmszK3VMVzAwUzFI?=
 =?utf-8?B?NVRKWnM2Ty9tazNRNkJwb1psRlNxSlNEZmhFdHpnQUNJSlowTm1EbVlIZ2dT?=
 =?utf-8?B?NWRkMVVlUGZRWjF3SERzWkRQaHdmMEhzN2tLQ3hGQ29pekhWZGJCUHp6NjFO?=
 =?utf-8?B?SmZHZnpuOXhDNlJmeXdiZXprdExDYTZvekREWkg1azA3RnFuT2ppZnpwSE1p?=
 =?utf-8?B?akhsL3JwMDQ5eWYyRFltZHUxSXJWZ2lPakZ3THd3bytxWHJVYk1EdzVKTU1v?=
 =?utf-8?B?ekpLMldzelhnbk9ma3Ara3NCYmo4OU4yazJGTGcyQy9aTEJ4RExqR1VZWFlG?=
 =?utf-8?B?ZXF5Rk1VZm9MNjYrVlFvQnp3VVVkMHFCcXZ5SnR2QkxWNE5sMmpMYmhzRzE3?=
 =?utf-8?B?QjFHTGxBSEhwMXdxd0lkYUVEeUNXeXBiVFg1Sk9sMFpFK2lFVGZtNmtreVhD?=
 =?utf-8?B?M2FFVStxYTBpUGFJbk81bHl3eU1QaDFmRXpxamxjSzhKMjNubDZxVlEzKzlL?=
 =?utf-8?B?b09Yc2xkN0ZRMkFtWE5ra1BaWGtSTHlQTWtpcWovcnduZ2NYUFFKN2FnQzJF?=
 =?utf-8?B?a0dDVkhxc0syWmt3bDFseFcxMWVRS1hpYW1MTG5BbjNwWmp0ZW9UMHhvU0JW?=
 =?utf-8?B?NmxOcVpuZ1Fya0lEWm1ydjJJK1RzbFJtME1tMnJYVGkyS3Zia2hYVGUzK2h1?=
 =?utf-8?B?RlpwbmErWTZublJUMzJPQURlcW9OWmFOWCtQRkE5UFF5M1lvQkdKc05JUFdr?=
 =?utf-8?B?dUFRRCsyb2ZyQmF4NWRLSU9iZVQvOGEwYllXd09KMWtlUi95bUx1NGNtZjhu?=
 =?utf-8?B?R3FFN0d4YlhBVXQwemNwYW1iclJwMWd3VjdyZVArV1E1SGdmWExxV1E4dnp2?=
 =?utf-8?B?alVxWTVRWndTV2V4NmZnSVo3eit0eEVSc0Zyckozdm54RGVjYTIxejJZdnBV?=
 =?utf-8?B?cXlWSUpacS90S09FZVZadGpWYlJsVlN4b1JlSUNObENwMVpOVFRlcDlCUEZp?=
 =?utf-8?B?WWVFZ0FJWUZNTVZBK0h1TXRRWjhubERiQ05IZ1UraFNBSVZqMjNvcnRWcTVM?=
 =?utf-8?B?aUFFNlNmTXZGZTJIeGFVM0d4NHNCRnl1Rlp6UzF2SWd0alRYSThjVm5zaVBZ?=
 =?utf-8?B?WUNyZHljSDBjMzVMSmJEbnIrajgyUmNyaXdRbFRrcWg5SjJscTdoN3IrZ3di?=
 =?utf-8?B?VGNMUFJyc2c2ZVF5Z3MrOG5BTU9QUkNkaW9IcDhla0VMY2hVL1A5eDM0MlFS?=
 =?utf-8?B?SGFQczBDbzVQYm51UnJWNmNVS0cxQWFEZHYybHVDV0Z3RGNrR1BTZUVWZGg1?=
 =?utf-8?B?TjU4V0txNmRJK0p4bGlxa2lSd3EzaEw1VkN0Z2hEaXE1dXRYUURjNUFuNkt6?=
 =?utf-8?B?eElaekZFMGFNMmp2VFRBVnBVY05aMVlUR2xMZTJmcVlieHYrNzJ0dnNraTFQ?=
 =?utf-8?Q?9LdX7Bzh0QKaxfuVRz+hgv0rYdzo0s=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA3PR11MB8987.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Ymdtck5oRUJVSEpmWjBtZFJTVUsweTlvN3EyenNvcHExL3d3cDRMOTQxL1F3?=
 =?utf-8?B?VHcySDU2Zk9Md3NlcXk0Y0hVWFVpeXB0TnRmUTc4djh3dnNWZWhqWjZJVTh5?=
 =?utf-8?B?WVhuVEVkYVZjcHhxZHFMTXY1c2M0VnZCRVRQeGpXVEJuenk2Q3hsbG82VXZl?=
 =?utf-8?B?UjBCdWkyZnZzc1AvS09hdCt4dzNlcmI0N1pBTzNGTmFNRmxDME85NXZpRFVU?=
 =?utf-8?B?UXBUR2dnYVhzRExnNEFBeTBDRFl6Wmd0TzBmeStjU3FyTjRTNjJpWi96SG1k?=
 =?utf-8?B?UHIvVWUxellndlFrVzd0Mjk2bk5YVHZSMHZEamRrTDlyWHJORFdvZGhvdHE1?=
 =?utf-8?B?TTZmdnlvZWc4N3FSZGZNbE5aMHhZaVd6Q0RFTVhuS2NJSkZDUzRNYVMzaU5Q?=
 =?utf-8?B?YlU5amdadEF1Z3hNVjNkOUVUZjBTZmlxQmRWbWp0bmIrWXgzVDM2RWNuQ1VQ?=
 =?utf-8?B?UGtnbTBPVWUzak90MEZwc2Z1ejNMK3ZzS1J1TG15UEpyb2pleURNUFlCOHIr?=
 =?utf-8?B?eGJFUllZT2lKb3dISlJJYkk5bysxY3ViV2tGOUVqT3FFejJYMjFNMTltcmFs?=
 =?utf-8?B?N1lja3JYS1haY2EzKzk5NFV6S2JpRTRNN2Q1MmZKc2o4L0tLVjdWdWhlVkM4?=
 =?utf-8?B?ZGZQZjdHVjNQUnVGMVEzRkJWdmx4NEI4T3ZzbVBDK0RCU3FYTHV2Y0VuVFAx?=
 =?utf-8?B?NXRqR1dHdlE5Y0cxRGJ6L1ZjZjAwMHRRMkNuRFgwbDRmb3VITklsZitOUmZE?=
 =?utf-8?B?K1AyaS9jakRUSHh2TDcwYyt4OHVxSjVCYTUwc2RHRFJEaVZMWWlHcFFDM1hZ?=
 =?utf-8?B?aVp5VHVtNDVYdGpRSFVERVl5M1NWanBabk1TMTc5OFQrTmk4NnZpVmNWQkxx?=
 =?utf-8?B?ZUozSUVCNHh4RkY2cnVFUVlDTy9Ec2dHUTRSdFNJNzlxTXcrU2hIK3hGclFv?=
 =?utf-8?B?U3VyekEyNjQzK0x3RDdUMFhPcjFQQmlEd2N0R3k0blMxODlqaWtFYUNLSytn?=
 =?utf-8?B?cmUxdkd6VjU4VldYTFFPNERBZVBrRVFWYmduMXlERmZkbjNJejNLTG1qNU9x?=
 =?utf-8?B?ZEZJalY4Zjh6MTJDQXdRdTRhQWdva04wa1phNkF6L2pCVGJ3R0lObmNRRW9H?=
 =?utf-8?B?bHIvREdPWTRPemRvb2xUNG5vUkhteExzUUxhNFU4YUh2bWJ4bndPZDdXeHRa?=
 =?utf-8?B?ZUFGdXliN2xSZUdFczN2UXMyMTdpU2wzeXFha1ByWi9XMjgyT2VrRFBncW9v?=
 =?utf-8?B?QTBPdUhEdmNiQ1RPTUhSaVZ1T3hmdVlEdHRuV3JLOFU5MHVQZndzZ1NiVFI3?=
 =?utf-8?B?QlVDZEVJZXdBeHRPRmw0ZWJaSFhCVHFkdldJSFhCKzk5U2M2OUJKcDViQ3Y4?=
 =?utf-8?B?SHVhSkQwbWtlY2N6dWN6UmRmTWRSRjZkRzZsT2JRMjhndUpTT0FzWitFdVFQ?=
 =?utf-8?B?RXA0bFdscWJrNmUrcTA0bFl0K2dpQlMxaU9qVHpjNXE0TlVGUjdKQ3lSbitn?=
 =?utf-8?B?aFpBQ09vMmtjYkpIeklGTlhoVE1UenVIb0UrU2JZUlV2dUhkVTU5d2FQUkM1?=
 =?utf-8?B?ZFY5OWpOTjZFTGFmSVU2Qm1RSlJTcGVCQ0tkdjJwKzBMSlF2ZW1XWlllVmph?=
 =?utf-8?B?MFNPZUF1bnhkV3FDTzNTRGZnSnpHZFRaT1BLNFcxbWVJUll4bFphUXQxNlBN?=
 =?utf-8?B?dHRveHUyUElvbFA2UjZpcElMTkxuUVBLZ1h0KzZGWjRHYjJtaGZkSlJ0RFh2?=
 =?utf-8?B?amFFUkRLY2o1dnpScHRaTjBOTjVpZnZMZ2lNZS8raE5vcWJ5alYxWE1VRFhB?=
 =?utf-8?B?MDM1RVJoeklTSUZ2bU1GVHRuaEwvVjZFYVdoOGxZb3Y2aTVxK0N5NHorL2dz?=
 =?utf-8?B?eU4xeFdQbnk4bFNhQ2lVYnozZEx1T3VGWG5mYUdvK3FWWTh6NnhPYkxUVjA4?=
 =?utf-8?B?M1dQU3BLbFlkemlwRVFSZ0RnS0t0RFNnc1NKcENYQVgyQ0M4OG10ZHBIZUZ6?=
 =?utf-8?B?MGV3VFNCZ2hhZDdvVFdzWWp1akZCWkgzVWp2Z1ZHb3hmbGowYzBrU0U1N2NU?=
 =?utf-8?B?eFJ2YUhGWmtVODJBYU1sbEsyRkxBY0pIOThUNmNIemdCSUZkNlExMUMyc0Zr?=
 =?utf-8?Q?fBWVHS7RQbOzecZjue0kQU1BA?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB8987.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 12eeec04-2724-4b38-9841-08ddb3c9f28a
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jun 2025 09:23:29.5084 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oRE98QdSzko72ZdyWNUsng9Qkn4wsDfR2Lcc64+i+yUVnrUUgecQd9paFIVIYhXMWOXnomeWvIjF9v6T06fd2A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7566
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

SGkgTWF0dGhldywNCj4gDQo+IE9uIE1vbiwgSnVuIDIzLCAyMDI1IGF0IDEyOjEwOjM2UE0gKzA1
MzAsIE5pdGluIEdvdGUgd3JvdGU6DQo+ID4gQWRkIHRoZSBEUk1fWEVfUVVFUllfQ09ORklHX0ZM
QUdfSEFTX0RJU19OVUxMX1FVRVJZIGRldmljZSBxdWVyeQ0KPiBmbGFnDQo+ID4gd2hpY2ggaW5k
aWNhdGVzIHdoZXRoZXIgYSBkZXZpY2Ugc3VwcG9ydHMgRElTX05VTExfUVVFUlkgKERpc2FibGUg
bnVsbA0KPiANCj4gcy9ESVNfTlVMTF9RVUVSWS9ESVNBQkxFX05VTExfUVVFUlkNCg0KVGhlIERJ
U19OVUxMX1FVRVJZIG5hbWluZyBjb252ZW50aW9uIGlzIGZvbGxvd2VkIGFzIHBlcsKgQnNwZWMg
NTc0OTYuDQoNCj4gDQo+ID4gYW55aGl0IHNoYWRlciBxdWVyeSBtZWNoYW5pc20pLiBUaGUgaW50
ZW50IGlzIGZvciBVTURzIHRvIHVzZSB0aGlzDQo+ID4gcXVlcnkgYW5kIG9wdC1pbiBEUk1fWEVf
RVhFQ19RVUVVRV9ESVNfTlVMTF9RVUVSWSBmbGFnIHRvIGRpc2FibGUgbnVsbA0KPiA+IHF1ZXJ5
IG1lY2hhbmlzbSBmb3IgYW55aGl0IHNoYWRlciBieSBzZXR0aW5nIERJU19OVUxMX1FVRVJZIGJp
dCBvZg0KPiA+IFJUX0NUUkwgcmVnaXN0ZXIgZm9yIFhlMiBJUC4NCj4gPg0KPiA+IFNpZ25lZC1v
ZmYtYnk6IE5pdGluIEdvdGUgPG5pdGluLnIuZ290ZUBpbnRlbC5jb20+DQo+ID4gLS0tDQo+ID4g
IGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9leGVjX3F1ZXVlLmMgfCA5ICsrKysrKysrKw0KPiA+ICBk
cml2ZXJzL2dwdS9kcm0veGUveGVfcXVlcnkuYyAgICAgIHwgMyArKy0NCj4gPiAgaW5jbHVkZS91
YXBpL2RybS94ZV9kcm0uaCAgICAgICAgICB8IDggKysrKysrKysNCj4gPiAgMyBmaWxlcyBjaGFu
Z2VkLCAxOSBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQo+ID4NCj4gPiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2V4ZWNfcXVldWUuYw0KPiA+IGIvZHJpdmVycy9ncHUv
ZHJtL3hlL3hlX2V4ZWNfcXVldWUuYw0KPiA+IGluZGV4IGZlZTIyMzU4Y2MwOS4uNTE5ZjM2ZGI3
Y2QwIDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9leGVjX3F1ZXVlLmMN
Cj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfZXhlY19xdWV1ZS5jDQo+ID4gQEAgLTI2
LDYgKzI2LDggQEANCj4gPiAgI2luY2x1ZGUgInhlX3RyYWNlLmgiDQo+ID4gICNpbmNsdWRlICJ4
ZV92bS5oIg0KPiA+ICAjaW5jbHVkZSAieGVfcHhwLmgiDQo+ID4gKyNpbmNsdWRlICJ4ZV9ndF9t
Y3IuaCINCj4gPiArI2luY2x1ZGUgInJlZ3MveGVfZ3RfcmVncy5oIg0KPiA+DQo+ID4gIGVudW0g
eGVfZXhlY19xdWV1ZV9zY2hlZF9wcm9wIHsNCj4gPiAgCVhFX0VYRUNfUVVFVUVfSk9CX1RJTUVP
VVQgPSAwLA0KPiA+IEBAIC02OTMsNiArNjk1LDEzIEBAIGludCB4ZV9leGVjX3F1ZXVlX2NyZWF0
ZV9pb2N0bChzdHJ1Y3QgZHJtX2RldmljZQ0KPiAqZGV2LCB2b2lkICpkYXRhLA0KPiA+ICAJCX0N
Cj4gPiAgCX0NCj4gPg0KPiA+ICsJaWYgKCgoR1JBUEhJQ1NfVkVSKHhlKSA+PSAyMCkgJiYgKEdS
QVBISUNTX1ZFUih4ZSkgPCAzMCkpICYmDQo+ID4gKwkgICAgKGFyZ3MtPmZsYWdzICYgRFJNX1hF
X0VYRUNfUVVFVUVfRElTX05VTExfUVVFUlkpICYmDQo+ID4gKwkgICAgKGVjaVswXS5lbmdpbmVf
Y2xhc3MgPT0gRFJNX1hFX0VOR0lORV9DTEFTU19SRU5ERVIgfHwNCj4gPiArCSAgICBlY2lbMF0u
ZW5naW5lX2NsYXNzID09IERSTV9YRV9FTkdJTkVfQ0xBU1NfQ09NUFVURSkpIHsNCj4gPiArCQl4
ZV9ndF9tY3JfbXVsdGljYXN0X3dyaXRlKHEtPmd0LCBSVF9DVFJMLCBESVNfTlVMTF9RVUVSWSk7
DQo+ID4gKwl9DQo+IA0KPiBZb3Ugd2lsbCBoaXQgYW4gZXJyb3IgYmVmb3JlIHlvdSBnZXQgaGVy
ZSBiZWNhdXNlIG9mIHRoZSBpZiBzdGF0ZW1lbnQgYWJvdmUgKG5vdA0KPiBzaG93biBpbiB0aGUg
ZGlmZikgdGhhdCBzYW5pdGl6ZXMgYXJncy0+ZmxhZ3MuDQo+IA0KDQpZZXMuIEFncmVlIHdpdGgg
eW91LiBJIHdpbGwgYWRkIGl0Lg0KDQo+IFlvdSBkb27igJl0IG5lZWQge30gaGVyZS4NCj4gDQpU
aGFua3MsIEkgd2lsbCByZW1vdmUgaXQuDQoNCj4gQWxzbywgYSByZWdpc3RlciB3cml0ZSBpbXBs
aWVzIHRoaXMgd291bGQgYWZmZWN0IHRoZSBlbnRpcmUgR1QsIG5vdCBqdXN0IHRoZSBleGVjDQo+
IHF1ZXVlIGZsYWdnZWQgd2l0aCDigJxkaXNhYmxlIE5VTEwgcXVlcnku4oCdIElzIHRoYXQgcmVh
bGx5IHRoZSBpbnRlbnQ/IEl0IGRvZXNu4oCZdA0KPiBzZWVtIGNvcnJlY3QgdG8gbWUsIGJ1dCBo
b25lc3RseSwgSeKAmW0gbm90IGVudGlyZWx5IHN1cmUgd2hhdCB0aGlzIHBhdGNoIGlzIHRyeWlu
ZyB0bw0KPiBkby4gSWYgdGhlIGludGVudCBpcyBmb3IgdGhpcyB0byBiZSBwZXItZXhlYyBxdWV1
ZSwgdGhlbiBJIHRoaW5rIHRoaXMgbmVlZHMgdG8gYmUNCj4gaW1wbGVtZW50ZWQgYXMgc29tZSBy
aW5nIGluc3RydWN0aW9ucyBpbiB0aGUgTFJDIFdBIEJCLg0KPiANCg0KSGVyZSwgdGhlwqBpbnRl
bnRpb24gaXMgdGhhdCBmb3IgdGhlIGFscmVhZHkgcmVsZWFzZWQgcGxhdGZvcm1zIFhlMiwgDQp3
ZSBuZWVkIHRvIGFkZCBhbsKgb3B0LWluIGZsYWcgdmlhIHVhcGkgdG8gZGlzYWJsZSBudWxsIHF1
ZXJ5IGZvciBhbnloaXQgc2hhZGVyLg0KU28gdGhhdCB1c2Vyc3BhY2UgY2FuIHVzZSB0aGlzIGZs
YWcgdG8gZGlzYWJsZSBhbnloaXQgc2hhZGVyIHF1ZXJ5IG1lY2hhbmlzbSwgYW5kIEkgdGhpbmsN
CnRoYXQgaXQgaXMgbm90IHBvc3NpYmxlIGluIHRoZSBMUkMgV0EgQkIuIEFuZCB0byBtZSwgdGhp
cyBwbGFjZW1lbnQgbG9va3Mgb2sgYXMgdGhpcyBzZXR0aW5nIGlzIA0KZWZmZWN0aXZlIHBvc3Qg
eGVfZXhlYyBjYWxsLg0KDQo+ID4gKw0KPiA+ICAJcS0+eGVmID0geGVfZmlsZV9nZXQoeGVmKTsN
Cj4gPg0KPiA+ICAJLyogdXNlciBpZCBhbGxvYyBtdXN0IGFsd2F5cyBiZSBsYXN0IGluIGlvY3Rs
IHRvIHByZXZlbnQgVUFGICovIGRpZmYNCj4gPiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94
ZV9xdWVyeS5jIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3F1ZXJ5LmMNCj4gPiBpbmRleCBlOGUx
NzQzZGNiMWUuLmM1MDAyYjhjOWFjMCAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0v
eGUveGVfcXVlcnkuYw0KPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9xdWVyeS5jDQo+
ID4gQEAgLTM0NCw3ICszNDQsOCBAQCBzdGF0aWMgaW50IHF1ZXJ5X2NvbmZpZyhzdHJ1Y3QgeGVf
ZGV2aWNlICp4ZSwgc3RydWN0DQo+IGRybV94ZV9kZXZpY2VfcXVlcnkgKnF1ZXJ5KQ0KPiA+ICAJ
CWNvbmZpZy0+aW5mb1tEUk1fWEVfUVVFUllfQ09ORklHX0ZMQUdTXSB8PQ0KPiA+DQo+IAlEUk1f
WEVfUVVFUllfQ09ORklHX0ZMQUdfSEFTX0NQVV9BRERSX01JUlJPUjsNCj4gPiAgCWNvbmZpZy0+
aW5mb1tEUk1fWEVfUVVFUllfQ09ORklHX0ZMQUdTXSB8PQ0KPiA+IC0JCQlEUk1fWEVfUVVFUllf
Q09ORklHX0ZMQUdfSEFTX0xPV19MQVRFTkNZOw0KPiA+ICsJCQkoRFJNX1hFX1FVRVJZX0NPTkZJ
R19GTEFHX0hBU19MT1dfTEFURU5DWQ0KPiB8DQo+ID4gKw0KPiAJRFJNX1hFX1FVRVJZX0NPTkZJ
R19GTEFHX0hBU19ESVNfTlVMTF9RVUVSWSk7DQo+ID4gIAljb25maWctPmluZm9bRFJNX1hFX1FV
RVJZX0NPTkZJR19NSU5fQUxJR05NRU5UXSA9DQo+ID4gIAkJeGUtPmluZm8udnJhbV9mbGFncyAm
IFhFX1ZSQU1fRkxBR1NfTkVFRDY0SyA/IFNaXzY0SyA6DQo+IFNaXzRLOw0KPiA+ICAJY29uZmln
LT5pbmZvW0RSTV9YRV9RVUVSWV9DT05GSUdfVkFfQklUU10gPSB4ZS0+aW5mby52YV9iaXRzOyBk
aWZmDQo+ID4gLS1naXQgYS9pbmNsdWRlL3VhcGkvZHJtL3hlX2RybS5oIGIvaW5jbHVkZS91YXBp
L2RybS94ZV9kcm0uaCBpbmRleA0KPiA+IDhlOGJiZGVjOGM1Yy4uYTViZmJhMTIxMzYwIDEwMDY0
NA0KPiA+IC0tLSBhL2luY2x1ZGUvdWFwaS9kcm0veGVfZHJtLmgNCj4gPiArKysgYi9pbmNsdWRl
L3VhcGkvZHJtL3hlX2RybS5oDQo+ID4gQEAgLTM5Nyw2ICszOTcsOCBAQCBzdHJ1Y3QgZHJtX3hl
X3F1ZXJ5X21lbV9yZWdpb25zIHsNCj4gPiAgICogICAgICBoYXMgbG93IGxhdGVuY3kgaGludCBz
dXBwb3J0DQo+ID4gICAqICAgIC0gJURSTV9YRV9RVUVSWV9DT05GSUdfRkxBR19IQVNfQ1BVX0FE
RFJfTUlSUk9SIC0gRmxhZyBpcw0KPiBzZXQgaWYgdGhlDQo+ID4gICAqICAgICAgZGV2aWNlIGhh
cyBDUFUgYWRkcmVzcyBtaXJyb3Jpbmcgc3VwcG9ydA0KPiA+ICsgKiAgICAtICVEUk1fWEVfUVVF
UllfQ09ORklHX0ZMQUdfSEFTX0RJU19OVUxMX1FVRVJZIC0gRmxhZyBpcyBzZXQgaWYNCj4gdGhl
DQo+ID4gKyAqICAgICAgZGV2aWNlIGhhcyBudWxsIHF1ZXJ5IHN1cHBvcnQgZm9yIGFueWhpdCBz
aGFkZXIuDQo+ID4gICAqICAtICVEUk1fWEVfUVVFUllfQ09ORklHX01JTl9BTElHTk1FTlQgLSBN
aW5pbWFsIG1lbW9yeQ0KPiBhbGlnbm1lbnQNCj4gPiAgICogICAgcmVxdWlyZWQgYnkgdGhpcyBk
ZXZpY2UsIHR5cGljYWxseSBTWl80SyBvciBTWl82NEsNCj4gPiAgICogIC0gJURSTV9YRV9RVUVS
WV9DT05GSUdfVkFfQklUUyAtIE1heGltdW0gYml0cyBvZiBhIHZpcnR1YWwNCj4gPiBhZGRyZXNz
IEBAIC00MTUsNiArNDE3LDcgQEAgc3RydWN0IGRybV94ZV9xdWVyeV9jb25maWcgew0KPiA+ICAJ
I2RlZmluZSBEUk1fWEVfUVVFUllfQ09ORklHX0ZMQUdfSEFTX1ZSQU0JKDEgPDwgMCkNCj4gPiAg
CSNkZWZpbmUgRFJNX1hFX1FVRVJZX0NPTkZJR19GTEFHX0hBU19MT1dfTEFURU5DWQkoMSA8PA0K
PiAxKQ0KPiA+ICAJI2RlZmluZSBEUk1fWEVfUVVFUllfQ09ORklHX0ZMQUdfSEFTX0NQVV9BRERS
X01JUlJPUg0KPiAJKDEgPDwgMikNCj4gPiArCSNkZWZpbmUgRFJNX1hFX1FVRVJZX0NPTkZJR19G
TEFHX0hBU19ESVNfTlVMTF9RVUVSWQkoMSA8PA0KPiAzKQ0KPiA+ICAjZGVmaW5lIERSTV9YRV9R
VUVSWV9DT05GSUdfTUlOX0FMSUdOTUVOVAkJMg0KPiA+ICAjZGVmaW5lIERSTV9YRV9RVUVSWV9D
T05GSUdfVkFfQklUUwkJCTMNCj4gPiAgI2RlZmluZSBEUk1fWEVfUVVFUllfQ09ORklHX01BWF9F
WEVDX1FVRVVFX1BSSU9SSVRZCTQNCj4gPiBAQCAtMTI3MSw2ICsxMjc0LDExIEBAIHN0cnVjdCBk
cm1feGVfZXhlY19xdWV1ZV9jcmVhdGUgew0KPiA+ICAJX191MzIgdm1faWQ7DQo+ID4NCj4gPiAg
I2RlZmluZSBEUk1fWEVfRVhFQ19RVUVVRV9MT1dfTEFURU5DWV9ISU5UCSgxIDw8IDApDQo+ID4g
KwkvKg0KPiA+ICsJICogRFJNX1hFX0VYRUNfUVVFVUVfRElTX05VTExfUVVFUlkgZmxhZyBpcw0K
PiA+ICsJICogdXNlIHRvIGRpc2FibGUgbnVsbCBxdWVyeSBjaGVjayBmb3IgQW55aGl0IHNoYWRl
cg0KPiA+ICsJICovDQo+ID4gKyNkZWZpbmUgRFJNX1hFX0VYRUNfUVVFVUVfRElTX05VTExfUVVF
UlkJKDEgPDwgMSkNCj4gDQo+IFdlIHNob3VsZCBhZGQgcHJvcGVyIGtlcm5lbC1kb2MgZm9yIHRo
aXMgZmxhZy4NCj4gDQo+IEl0IGxvb2tzIGxpa2Ugd2XigJlyZSBhbHNvIG1pc3NpbmcgcHJvcGVy
IGtlcm5lbC1kb2MgZm9yDQo+IERSTV9YRV9FWEVDX1FVRVVFX0xPV19MQVRFTkNZX0hJTlQuIFdo
aWxlIHlvdeKAmXJlIGF0IGl0LCBjb3VsZCB5b3UgYWRkDQo+IHRoYXQgYXMgd2VsbD8NCj4gDQpT
dXJlLiBJIHdpbGwgYWRkIGtlcm5lbC1kb2MgZm9yIGJvdGggbWFjcm9zLg0KDQo+IE1hdHQNCj4g
DQo+ID4gIAkvKiogQGZsYWdzOiBmbGFncyB0byB1c2UgZm9yIHRoaXMgZXhlYyBxdWV1ZSAqLw0K
PiA+ICAJX191MzIgZmxhZ3M7DQo+ID4NCj4gPiAtLQ0KPiA+IDIuMjUuMQ0KPiA+DQo=
