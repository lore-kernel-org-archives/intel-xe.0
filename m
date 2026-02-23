Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6E2BEC1122
	for <intel-xe@archiver.kernel.org>; Mon, 23 Feb 2026 19:14:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6934A10E42E;
	Mon, 23 Feb 2026 19:14:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="h/6oJ63I";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C25A510E427
 for <intel-xe@lists.freedesktop.org>; Mon, 23 Feb 2026 19:14:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771874071; x=1803410071;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=00jzkKYlj/Pnqu7DY+c4T3WpZmb9uE/HN2rhCpOEgmI=;
 b=h/6oJ63Iy+ru3ox3RYJA8Y7x/T4PGLE0FeKTg3tLWa/Bwl4U5NzoUnyF
 gU8E8zujiRmSCUkcZD5znWMpdk4s0YvambgDlqeGbtzk32ak9ISRJRNop
 +m/0vF4WNGf765DPjEB18nLPrCBVMv/18kMlP26bDUuY8yIX73OskHqX9
 UHZP2uD/OywkpbzNNwS8bNa0bYkvvdZlgP00XW8z9gutZp1vpC2fji7xq
 Kai91hT0EyKM4D7tCvR1q/PEhXDrjDUt/SbAfQfv2LAVNemKkm6/5Z8q9
 AF9FScRFAVwH0jLfsIWjfWvRJzK4jMVldub4E23M2Z8DkFdzXKa8mUyeD w==;
X-CSE-ConnectionGUID: EOL8der1R6ebTeEHTb3XDA==
X-CSE-MsgGUID: 22Er83eFQvaTY/VptK+Nqg==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="72980854"
X-IronPort-AV: E=Sophos;i="6.21,307,1763452800"; d="scan'208";a="72980854"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 11:14:31 -0800
X-CSE-ConnectionGUID: CKpxU+egS+aU0TqzKg3wiw==
X-CSE-MsgGUID: EDcLnjpcR9+vgDOPtlQfeg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,307,1763452800"; d="scan'208";a="238618313"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 11:14:30 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 23 Feb 2026 11:14:29 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Mon, 23 Feb 2026 11:14:29 -0800
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.55) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 23 Feb 2026 11:14:29 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qdSnv/428eCIWTQzDFXzyMiM7RGiUoPLPJU1XDdoJjPJwBy7277ljth6VifS387cNKg0jtqGkhS/2RkQbczXOvauGzCmt0lfLoQAhtuULVQs60QoszcYSl7OccOMZhMg2f2tp+ybsXPF1h6F36IJo7uhpQu4tGbY0D4M5z48OQ679slfM6D6qERVsXXtq91deTToaycBWMBQqHokPSsx0ZjA/rSGiTqzCFGktN1+UsnRbJU2HvcFPWc8SOJj4hCBsH5BEIxyMtT/J0hhxegwL03WRIsCKA/UIAMQ/IhhlOjxxMXv9ZAYXGdekSuEofliukPqO4FDNxnAmfa3C+w7kQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=00jzkKYlj/Pnqu7DY+c4T3WpZmb9uE/HN2rhCpOEgmI=;
 b=Zvie9gwCPH5x4deA+7v9QA3+LYW5s0kv2IW3BTzc1TpuAa0YajgLed7QhySJI4/2WYxtv1kRzv+kfkMwRaozPf1bRG8tMX3UnSAsfxvot46cFsyUlFlVfcRq9CLmYxvM/y2p+OrvpKALl7SBT8TMBSXH/qwOVqFjg47MHnOB2/vbJzdGqw13oWwvgn5PXGV7vY6xKcxFOUwnZSEytEy0HDPevv8+UPi0VjUr5DHMd3ajnmlsyo2ba0A3YETmt18ZzYzRPUOYYD0K0g9Ig6fkRiRQXnOba3rut9YD9RINiqSqQWzwYmkNUL2RisPegVTpftilq9Xb1AGh5pGYaPyYag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5456.namprd11.prod.outlook.com (2603:10b6:5:39c::14)
 by SJ1PR11MB6129.namprd11.prod.outlook.com (2603:10b6:a03:488::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Mon, 23 Feb
 2026 19:14:27 +0000
Received: from DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::62e5:4a7c:f965:9082]) by DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::62e5:4a7c:f965:9082%6]) with mapi id 15.20.9632.017; Mon, 23 Feb 2026
 19:14:27 +0000
From: "Lin, Shuicheng" <shuicheng.lin@intel.com>
To: "Roper, Matthew D" <matthew.d.roper@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Roper, Matthew D" <matthew.d.roper@intel.com>
Subject: RE: [PATCH v2 19/23] drm/xe: Consolidate workaround entries for
 Wa_18033852989
Thread-Topic: [PATCH v2 19/23] drm/xe: Consolidate workaround entries for
 Wa_18033852989
Thread-Index: AQHcoo8wVQYnRR0o/kO/E8NRvF/mfrWQq9GQ
Date: Mon, 23 Feb 2026 19:14:26 +0000
Message-ID: <DM4PR11MB54566E928234309067CAA330EA77A@DM4PR11MB5456.namprd11.prod.outlook.com>
References: <20260220-forupstream-wa_cleanup-v2-0-b12005a05af6@intel.com>
 <20260220-forupstream-wa_cleanup-v2-19-b12005a05af6@intel.com>
In-Reply-To: <20260220-forupstream-wa_cleanup-v2-19-b12005a05af6@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB5456:EE_|SJ1PR11MB6129:EE_
x-ms-office365-filtering-correlation-id: 950fa6b5-dc99-4399-bd3d-08de730fc338
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?T0NldFVmMUl2MGMyY01kSnpPTFRscXo4R281Wk9rak5zbElzbVZ5eThaK2hr?=
 =?utf-8?B?YTUrdGtMZ0E3Rkc0Snp2N3E0RTlsL1FRUzF4dmQ1SmVmL1Fnd1pYRDIzTWFZ?=
 =?utf-8?B?WEk0SGRZTDJpZjBBckxFT2czcTFZay9YUU12czNJd2xKejNCTTVvUEs3S1Bn?=
 =?utf-8?B?WjFIUFZKWThBUG84UHZqZC9BcU1hYnhRYmM3QTlHMm5jYWI5QmcycDZFc3My?=
 =?utf-8?B?LzlvcGlHaVkrVWlpaUJUTUR2YURxanZ6YXV0bmdTcUNoUkxKOU10OXUvaUt0?=
 =?utf-8?B?WlFadXRmZUZETG1zMEFSUkFrcGJ0R1grTmZpZHgzTkdjSkN6eVphK25wRVVB?=
 =?utf-8?B?V0lVVEF1SnhEQk10MGFBVEdkYzd0eTFqU1daOVNnUkc0TTBHMVpzMTJPUmts?=
 =?utf-8?B?R2c0MU5PMnpEOGdRS2ROb2lYcER5cEVIeGFQbHVqNmQzR0lXU3NEbkhHTkRI?=
 =?utf-8?B?V0plR2dXbDRMR0J3cldWUDgrK1pRTXpGTDVRR242bHZ0bVFZQ0dYVWtucEpL?=
 =?utf-8?B?eTRRc2tENVZaV2lrejI2Wm9qM3dJQncvQkZIZ0ZLUExsQlc0dEIyRlp0d1l1?=
 =?utf-8?B?RGxERm1NSHNjb0JMT1A2KzN1Q0xHbnZHVHZYV01qNm1jSlRyK0Y4dGc5L1FD?=
 =?utf-8?B?VzJpYTlUeUdDU1NKRGJKM3U2NFpMakRwSG9USkhpTG4xdGJCRW5TU3kwSjBx?=
 =?utf-8?B?dHRBNDVQamFVYUNLRzRhVmkwdXJiWTJxenpLN3FyT3o4MVN3WlQ0UUxCQkFv?=
 =?utf-8?B?Q2lQekRoSUtBYzVpeWxwR3B1VkNIbzMwd0M1QkZmb1VSNEJNRkxQZVQ0ZXNa?=
 =?utf-8?B?RUtMbjFSWk5TOWdXTS90OUxTVHpJbE8vSXA2ejRIaEwyMXpmYTBiSndwVGNh?=
 =?utf-8?B?R1BkMlBBMUNZYVFkODVXV0lSVVlCbnlIeHlUalhBUm5mZWk3UnhkRmpZTXhl?=
 =?utf-8?B?Nk1zNHVSUi9xb0t4UkE5S3ZIV245dmEvTE1FMWhJay9BUEc4czF3RG4yR2Iv?=
 =?utf-8?B?anRDa0VqTDJNcDRuNnNBSG9qblRqVmJKT3laN2xTWjlhZjQ5VC82WHAzTzRC?=
 =?utf-8?B?a2Q3dHBOb1BMR2NGOHZhd2JuNVU4ZW5oVlJwYUFoREdvMERlaW81eVlrblg4?=
 =?utf-8?B?U2dHU2I4dTFxd0tEanl6dS9zQWIwN2xkM003Snk5WktBSFQrUGZCc00rdWEw?=
 =?utf-8?B?Um1IZUcxeFBkNUZCTnJXVy9IQS84dmhhdFFuSlNvVWEvcEl4aXdnV1RhOVpk?=
 =?utf-8?B?c3FGUEtINllZaWc1ZUZlbk1TdlNYMG5KOWxJZVFkc3F2dDgyUUhWQy9PNHl1?=
 =?utf-8?B?NGRnRTVVVFlXSi9xQmxrMkdwZTFQTldtZ1k3WU1SMjZrM1ZIbEk3SlRMSjlk?=
 =?utf-8?B?TUZaOHp5dTJ2eFlWcXRMZm9IYmg3ZThjR1JKY0piZ0tVNHRjWTVLRXREN0lG?=
 =?utf-8?B?YXhseFdEdGVwTTYwTk5GU0QrV2hMTTFEZDQzbWVCSVNHSjhXd0N4N1loUWtj?=
 =?utf-8?B?elErYVZJY1ZTK0NKZjRLaER2STF2NWh6bjh2VStpMGtxeEQ5bXZZTTI2dTdt?=
 =?utf-8?B?R3RPbENsN05iKzRHWkU3Vkc3RjB4eFVqbmpRUmRIZWFHVitmcUpadnZXV2FF?=
 =?utf-8?B?dTJQaFdncFU3V2p0MEcydGNQTUs1QmMzRGx1c3hUTDFNNGtnZGZVL0Uwa3o5?=
 =?utf-8?B?QlhTOXhnQ21LV1BYc3ZNWi95bUtNSUt0Y2I3RndjWVhoV25kc3NuRU5QMlVw?=
 =?utf-8?B?MlZLNDBIdFg1U0cwdDhsZnZvNzlTL2hDMzNqMUlDbXYxLytBMVNVSFZzZ05R?=
 =?utf-8?B?TldxZWtzeGxFY0pTMTNoajhJd3FsV0NtQ1VINHlieU5pa2ljNUNSbnp5VURx?=
 =?utf-8?B?c05nSHdDbUJtT2pTcXV3SmlGY3BlMUZDZG9MYjB2RHhQQUtPUmN6eXN6czZE?=
 =?utf-8?B?eHdZY0NkT0JrSE9xVVJUMG9XUUxmVjhzZGdEN3RKU0IxZm0xckJBNGxXSGRZ?=
 =?utf-8?B?aGlsa3dZbHNISkVTK1BuUnRPaTN3c002Rkw3RkgwS3ZGem1oRHdML2JPc3F5?=
 =?utf-8?B?ckFDdEVSeWpGajg3eU5qanNmNDh6R05RY3BYQVlCTDhxT0RBdkNCL2FRUXZa?=
 =?utf-8?B?Z1MzSmVrUUVjS2hoZ2V2Ui9LQ1R1Sm9SK3N1YUhMT25Rb1NhWjI5M1k4dE9h?=
 =?utf-8?Q?QTi5WZC3wcsAxIwlZ0m7B+Q=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5456.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WGxDcG1iUk0vZFF3WkNYY09LbTE4c0lpR1dXT1VtWmZZTXByQWFWWXh0U2x5?=
 =?utf-8?B?OTFkTjl6RDdHR3E5UFVsZW5vanUyZnlBYW9XSzNIY2dOM05MNzlOL25qSkF5?=
 =?utf-8?B?V2Y1VHlPMFpreGZnWTBQR3J0TEZMNUtRTllrL3Z2SFRENlZlS1h2MDFCbGhC?=
 =?utf-8?B?c3VtVWVob2xRMzNRdy91M0pScTB0eUlMUW5GMkw1MDFxa214V2QyTEdnbDln?=
 =?utf-8?B?TmtUenpyQjljZkJ0bUhxTWxsbG81ZlliczZOejIzWERoVldOMmlYUTFJYzht?=
 =?utf-8?B?eTZGVWVrRStPakN2ZUdxRXptTDRnbXBIN0JZRWozblZMYjZtd2F1OUJWSWky?=
 =?utf-8?B?TTlXZ2JvWHBFMzRLbjBnM0hMMzlqaUxIV3c2WTdyeDBwMGVRSW1pSnhhT2to?=
 =?utf-8?B?cGphRVpBaTNWa2xBcmtORDlhVFZVVThrMVR2M2M3VGFqNWg1NGYwTDEzMi9X?=
 =?utf-8?B?QllSVFU0SnBnM3dQT0w4Wlorc0tocjIycWgyMDVPb0tNNG9jUzl4NUd5ZFRB?=
 =?utf-8?B?aGNvYmhKb2Zua09UMU9zSnpNcHE2MlRmMW00ckt6TThZYU5KeDdiN0paY3NJ?=
 =?utf-8?B?cWNXNStMdHpmS0RCRGo0VS82NWtyZUJVYkhneE1RRDlnVUZpczd6bEI5NWIy?=
 =?utf-8?B?M1lEOE92Wml4NFh3d1h6QTNhakdJYVBFMGN1blZHb2lKTjJxKy9mOEVnbHRx?=
 =?utf-8?B?NFFqNEcwL1VTMWtkTXpWaHBFZ0c3VWFsRDZmdEx3Q2RoUW9INEcyMUkweU01?=
 =?utf-8?B?WVJ1U1o4am9kZjk5TGdBYVhIaElRRUwwbWhpLzhIWkJjVVFQQk9sZWdZVW15?=
 =?utf-8?B?QXlDT3ZodWFseDZuY05qK0FpTk5LL3o3T1hsWlJaU1lnZCsxTHFmclVMNWF1?=
 =?utf-8?B?aDZXdWF5SEtzUGtFN2pVZ21uN1ZlQUVUMGtFQkN1Zk9QWmVEWkNWcFpJc3RT?=
 =?utf-8?B?UTNuNzJWT1VyWCttUWVKQW1lcUxNZkZhTVJQYmxmWDQ1eTZMV0xtSkN2bXdR?=
 =?utf-8?B?cldYZHkzUVJsaUZvbFY4VHBaY0VvSlRDZVRvUVViekt3MWxxUXBVdmxlREpB?=
 =?utf-8?B?VTNPdUE0cWRhVEZmajZydmpMK0c2Vi9FdUUxSEoyZnJoVVRlbDB4MU9hdFRs?=
 =?utf-8?B?Vzl5Y1BsQ2tDeTRuOGxOMEZ4R0YvY0xoOFVLTzBEanhSb0xoMitla2ZLNEl2?=
 =?utf-8?B?N2o4b0luOTRZTUIyRU9QdXAwME1XM0M5MU0yMGNad1Q5UEhxa2FoQVdGUGVD?=
 =?utf-8?B?NzB3RDFCNGZ5U2lTdWlyTGFyQmdzWFB2Misrb00xcGlwdjdMaHdvZUJHYlVs?=
 =?utf-8?B?NkluVWUzNkxpNEU3aEY4U1RGR1o0QlFmTUhmVmxqMTREaU1VMjVPT2VNam1Z?=
 =?utf-8?B?THpsRGUxb3UxWUVWZHdJNG1ZZDBTakduRmxrdHpVNnYzVzlOQUV1aU9DZ3lQ?=
 =?utf-8?B?bXpGTnhaUWtPWlBPR0VhcTFqT09pRitEQXJDUUM2VCtMbEJzYjVleW5rSk9K?=
 =?utf-8?B?eDF3SGs0dGRrYXVocEsyazRLdUVBNUJXY2d3TVJVamJ1OVhHem5WMHcyME1K?=
 =?utf-8?B?ZlBWd2QvUkpqdEdWRkNRZ0ZVS0QxTDlRR1RQVGk5UWJOcjNvR0dYWmlEeU5m?=
 =?utf-8?B?RUROZjJKTXhMcWtwZ1NTSUt2NzJYWE95NjNacXp4bVlZWFFWWktsUDlpdURH?=
 =?utf-8?B?am9RMzZkcFJOaWd2YU8xSmFTOE5CQ3NHZTd3L05PNDZ3ZTR4SXRueW5NaEJo?=
 =?utf-8?B?OStEUEJ1QTVPQXMzckJhdG9IcEltK3VsajZJM0JrNEtPdHNnNVAvS1ZLMStJ?=
 =?utf-8?B?WWVZS01Jd2d3S0V5UUhPWTRqbWRSZVAvRlNIM3VKTE5ISEZwRVN4RHBTbm1S?=
 =?utf-8?B?aitZSUhjV3VEM0dGWGo0a2lqSzhtK2RTYXNBTHpoOUNWRTlFWmkvZ3c3aDJ0?=
 =?utf-8?B?bktVRkw5NTlLeHM3RGtGN0JvRVl4L3Z5Nk5OSHVUcE5sYTNmUTFUNGdoZVM3?=
 =?utf-8?B?aEIycFl0K1RmR09qbWpkc1luOEhJVjVWY1cranAwZmx5Rnd3U3hNSFp3d24x?=
 =?utf-8?B?NlBDUWRJcWpiOU81by9QTEhzdnJLcm1mNVlwNC96T2hFS0w1REdNcmc3Q1Qr?=
 =?utf-8?B?aDFQNlpzM1JFbkN6bmpPRFdXQTJaMDJiaVhCZ1d2TWl3OHd4M05Dc0txSGcv?=
 =?utf-8?B?L3BBcjg4azN0OVdkVzFXa2JDQTlyRHREb09hN3hhZFE3QjZ1bzZpcWN3b2Yz?=
 =?utf-8?B?bi9kWDhnL2RDZHJDT3dlaklBM2I4MUxlaForcU9vK2xFL0g1MkVjTHJaZDJh?=
 =?utf-8?B?UWsyYVArZzRCZm9CMlNtVmw3bUZhZGl3eHZBNnlyVjlSMFRuV00zZz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5456.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 950fa6b5-dc99-4399-bd3d-08de730fc338
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Feb 2026 19:14:26.9742 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VB1C3ytwI53qi1BrAfTW/aByL7GzoSmJ+xMyE2jGBrjcBVSrPyTaqsi8u2zZPOeC125B2UwBGjGQiSBQs5Tz8A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6129
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

T24gRnJpLCBGZWIgMjAsIDIwMjYgOToyOCBBTSBNYXR0IFJvcGVyIHdyb3RlOg0KPiBXYV8xODAz
Mzg1Mjk4OSBhcHBsaWVzIHRvIGFsbCBncmFwaGljcyB2ZXJzaW9ucyBmcm9tIDIwLjAxIHRocm91
Z2ggMjAuMDQNCj4gKGluY2x1c2l2ZSkuICBDb25zb2xpZGF0ZSB0aGUgUlRQIGVudHJpZXMgaW50
byBhIHNpbmdsZSByYW5nZS1iYXNlZCBlbnRyeS4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IE1hdHQg
Um9wZXIgPG1hdHRoZXcuZC5yb3BlckBpbnRlbC5jb20+DQoNCkxHVE0uDQpSZXZpZXdlZC1ieTog
U2h1aWNoZW5nIExpbiA8c2h1aWNoZW5nLmxpbkBpbnRlbC5jb20+DQoNCj4gLS0tDQo+ICBkcml2
ZXJzL2dwdS9kcm0veGUveGVfd2EuYyB8IDEyICsrKystLS0tLS0tLQ0KPiAgMSBmaWxlIGNoYW5n
ZWQsIDQgaW5zZXJ0aW9ucygrKSwgOCBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0veGUveGVfd2EuYyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV93YS5jIGlu
ZGV4DQo+IDBhMGY5NGVmNWM2OGMyZTU4M2YyOGFiNDhlYjRmOTZiMjg5NmI2NjUuLjVhYTQwNGMw
Y2JmYmM4ZDExYzkzZDgNCj4gMjBiMWExOTJhYjQ3NzZkZWY4IDEwMDY0NA0KPiAtLS0gYS9kcml2
ZXJzL2dwdS9kcm0veGUveGVfd2EuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfd2Eu
Yw0KPiBAQCAtNjQ5LDYgKzY0OSwxMCBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IHhlX3J0cF9lbnRy
eV9zciBscmNfd2FzW10gPSB7DQo+ICAJICBYRV9SVFBfUlVMRVMoR1JBUEhJQ1NfVkVSU0lPTl9S
QU5HRSgyMDAxLCAyMDA0KSwNCj4gRU5HSU5FX0NMQVNTKFJFTkRFUikpLA0KPiAgCSAgWEVfUlRQ
X0FDVElPTlMoU0VUKFhFSFBfUFNTX0NISUNLRU4sIEZMU0hfSUdOT1JFU19QU0QpKQ0KPiAgCX0s
DQo+ICsJeyBYRV9SVFBfTkFNRSgiMTgwMzM4NTI5ODkiKSwNCj4gKwkgIFhFX1JUUF9SVUxFUyhH
UkFQSElDU19WRVJTSU9OX1JBTkdFKDIwMDEsIDIwMDQpLA0KPiBFTkdJTkVfQ0xBU1MoUkVOREVS
KSksDQo+ICsJICBYRV9SVFBfQUNUSU9OUyhTRVQoQ09NTU9OX1NMSUNFX0NISUNLRU4xLA0KPiBE
SVNBQkxFX0JPVFRPTV9DTElQX1JFQ1RBTkdMRV9URVNUKSkNCj4gKwl9LA0KPiANCj4gIAkvKiBE
RzEgKi8NCj4gDQo+IEBAIC03MDUsMTAgKzcwOSw2IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgeGVf
cnRwX2VudHJ5X3NyIGxyY193YXNbXSA9IHsNCj4gDQo+ICAJLyogWGUyX0xQRyAqLw0KPiANCj4g
LQl7IFhFX1JUUF9OQU1FKCIxODAzMzg1Mjk4OSIpLA0KPiAtCSAgWEVfUlRQX1JVTEVTKEdSQVBI
SUNTX1ZFUlNJT04oMjAwNCksDQo+IEVOR0lORV9DTEFTUyhSRU5ERVIpKSwNCj4gLQkgIFhFX1JU
UF9BQ1RJT05TKFNFVChDT01NT05fU0xJQ0VfQ0hJQ0tFTjEsDQo+IERJU0FCTEVfQk9UVE9NX0NM
SVBfUkVDVEFOR0xFX1RFU1QpKQ0KPiAtCX0sDQo+ICAJeyBYRV9SVFBfTkFNRSgiMTQwMjE1Njc5
NzgiKSwNCj4gIAkgIFhFX1JUUF9SVUxFUyhHUkFQSElDU19WRVJTSU9OX1JBTkdFKDIwMDEsDQo+
IFhFX1JUUF9FTkRfVkVSU0lPTl9VTkRFRklORUQpLA0KPiAgCQkgICAgICAgRU5HSU5FX0NMQVNT
KFJFTkRFUikpLA0KPiBAQCAtNzU5LDEwICs3NTksNiBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IHhl
X3J0cF9lbnRyeV9zciBscmNfd2FzW10gPSB7DQo+ICAJICBYRV9SVFBfUlVMRVMoR1JBUEhJQ1Nf
VkVSU0lPTl9SQU5HRSgyMDAxLCAyMDAyKSwNCj4gRU5HSU5FX0NMQVNTKFJFTkRFUikpLA0KPiAg
CSAgWEVfUlRQX0FDVElPTlMoU0VUKENPTU1PTl9TTElDRV9DSElDS0VONCwNCj4gU0JFX1BVU0hf
Q09OU1RBTlRfQkVISU5EX0ZJWF9FTkFCTEUpKQ0KPiAgCX0sDQo+IC0JeyBYRV9SVFBfTkFNRSgi
MTgwMzM4NTI5ODkiKSwNCj4gLQkgIFhFX1JUUF9SVUxFUyhHUkFQSElDU19WRVJTSU9OKDIwMDEp
LA0KPiBFTkdJTkVfQ0xBU1MoUkVOREVSKSksDQo+IC0JICBYRV9SVFBfQUNUSU9OUyhTRVQoQ09N
TU9OX1NMSUNFX0NISUNLRU4xLA0KPiBESVNBQkxFX0JPVFRPTV9DTElQX1JFQ1RBTkdMRV9URVNU
KSkNCj4gLQl9LA0KPiANCj4gIAkvKiBYZTNfTFBHICovDQo+ICAJeyBYRV9SVFBfTkFNRSgiMTQw
MjE0OTAwNTIiKSwNCj4gDQo+IC0tDQo+IDIuNTMuMA0KDQo=
