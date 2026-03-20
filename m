Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16238109316C
	for <intel-xe@archiver.kernel.org>; Fri, 20 Mar 2026 08:18:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC02610EA90;
	Fri, 20 Mar 2026 08:18:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="I8XaGEox";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD48910E204
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Mar 2026 08:18:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773994726; x=1805530726;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Acb2J5pYERtvGI+DGvCl+eWJbH6mZ1SPGb5lNnjfHuw=;
 b=I8XaGEoxo9c7YTpWJgfds1Yah9FvZM0rrnec58YKGfPj7kmSv5nHUNnK
 JwyU6NrcC8VMuXgel8AAlChr1Qku6ejqfyZOwXDGYrkh7e8sDSIT26fVZ
 TVkSbUj2TqVS6067YmepjGiTcsdtZLYomAJLAGpybfTI1tIBNZMJRgkGg
 QkRn8w8dPlPXhvKZpW7cPPMP4homjLdTjdqfvuacT7XA1dih4OSAiDafv
 iNB6jR0ZLoEuRgn6xnSmxtSPccdyiNSmpzyicWmB8CZg7a09LVrR6Wt1z
 7Hy3qBdMs2cFssW0I4BmB2OZQQnntOkGkJut8vB622SfpU46QHrbY8mu7 A==;
X-CSE-ConnectionGUID: DKKRNAXfTWqmBFJMGYeZ0Q==
X-CSE-MsgGUID: rAWV1aXlTVOy/dP1fVedAg==
X-IronPort-AV: E=McAfee;i="6800,10657,11734"; a="77684537"
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; d="scan'208";a="77684537"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2026 01:18:45 -0700
X-CSE-ConnectionGUID: LzU7xhPYQgCj2f8gY+FsyQ==
X-CSE-MsgGUID: bOoL9dLoRoqI/vN3Xv/ung==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; d="scan'208";a="246245491"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2026 01:18:45 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 20 Mar 2026 01:18:45 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 20 Mar 2026 01:18:45 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.5) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 20 Mar 2026 01:18:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nBKg+VePZLUwlOeUWT49cYcuZI3e8Jvdd03cJ6/Dmi17jOoPAWJMhi0bKAuBeReishPAxSh0wv4GXEyJxpCrAq8FlGV80XSqwoBoXe9M5okwwQRpGtakPZDE1AL46w/XdeGdbriNLJHMOYF95frkeyLLDMFS49TfYQvYXe4xpqwdo09KvAGWxMWy3h297WJz8DMXNT56e3VN2/tTuJVda+gNgqcBkEEb5VMDMQqhyykHRFBvYaRvNeAQ1WAX/xwd5UcM4P7wXii2E9cMuncSnbtj7hi/qbHuqQIPnK8iNErsI6HAErM+In8AkDg7JEcAG99YrOuFkcCNe0g0YdreCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Acb2J5pYERtvGI+DGvCl+eWJbH6mZ1SPGb5lNnjfHuw=;
 b=bxs9y9R4UDRVzxaZkq+U23Bil1+gHWoJrHuFfK3NzHu6iwqCIzOWjPkG3YDIx4NxR0Y1q4gW5OFl7cgO99wGxcI7YwvaTJWBlW/ERxL8dRi8eTnwy+7aVuHpoXwbt+cH8cTmsyHikJXq+SL9Y3cfCFpfq5Sg6VNPP1nLlLAkYVOLM5CxvHNEf706YQiPZ2szGoViZ+RfbDgO9RK99XL0M6wJpwR1Sugp9fmE4tS3xqVLSKeVWL/2ILpEj8MmlEVfa5xSKSzTUHs0n3dZ8dLVVrz0yB6MvBQH5PjjlMi2XiKD0fpTt5CkwudpQxEDMPvAqjQl9PhKxKKpE81J/yNNKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6344.namprd11.prod.outlook.com (2603:10b6:930:3b::6)
 by IA1PR11MB6372.namprd11.prod.outlook.com (2603:10b6:208:3ac::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.17; Fri, 20 Mar
 2026 08:18:42 +0000
Received: from CY5PR11MB6344.namprd11.prod.outlook.com
 ([fe80::f6ad:9f7c:3812:8efd]) by CY5PR11MB6344.namprd11.prod.outlook.com
 ([fe80::f6ad:9f7c:3812:8efd%3]) with mapi id 15.20.9745.007; Fri, 20 Mar 2026
 08:18:13 +0000
From: "Shankar, Uma" <uma.shankar@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "kernel-dev@igalia.com" <kernel-dev@igalia.com>, "Vivi, Rodrigo"
 <rodrigo.vivi@intel.com>
Subject: RE: [PATCH v22 00/12] AuxCCS handling and render compression modifiers
Thread-Topic: [PATCH v22 00/12] AuxCCS handling and render compression
 modifiers
Thread-Index: AQHctVm94o5Bsotpmk+RTdX8tXYKBLW0rESQgAD4noCAAXQpIA==
Date: Fri, 20 Mar 2026 08:18:13 +0000
Message-ID: <CY5PR11MB6344A99A7118D39FB6BEA99CF44CA@CY5PR11MB6344.namprd11.prod.outlook.com>
References: <20260316152929.1247-1-tvrtko.ursulin@igalia.com>
 <DM4PR11MB63608C7C7FA2AF73DBF05F3BF44EA@DM4PR11MB6360.namprd11.prod.outlook.com>
 <14f0c314-5f59-4c1a-9d9e-27dfa0ec8af3@igalia.com>
In-Reply-To: <14f0c314-5f59-4c1a-9d9e-27dfa0ec8af3@igalia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6344:EE_|IA1PR11MB6372:EE_
x-ms-office365-filtering-correlation-id: c67f00be-d0bd-47cd-d37a-08de86593afb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|38070700021|22082099003|56012099003|18002099003;
x-microsoft-antispam-message-info: KwkVBhdVv3SHxyXnUArk4QNKYGjD+GOf+TBh4oG/BtemyVQEPDXoqSkxak1ECmlNC6cqUiBT0gzMpdQINW/cEoobfx84Rwfgy7vFGnfYX/3naf/YgcdcaoCH28cpfbetFdp2RBd9QB3FqU+feXOMCJ4VPEA9dY7sFEChKH2/qmjhlS+JY9vXsSDfUdCHPfay4702bnMQjhyAlIrhQqAJagAXp/mOvrSUNXI3mnVenONEgXAhRnP8w9rdngsXbMHvjZI0u4v49lXM6isjWHrjwZkdF3RTSxZxWh7Q3CIrA4I/VliqN89lbmJeelEWu2lD3XEdaj1MBdVV6hbDWfS0S/ouevmFfFCmmRAZSLSbVdlUT7fVkvqV9zBGvMqTPwAM871mJWKqdeyUo/sBgVZSbozrQ9pwn6qqd67VwiVFfB5n6xd0CV7vcfTYQM5W60Fy7Y8IkC0sD3SukaKSxPiBHnC3jTRxxW3J5o/W98nkm+tFCUTMKnyUYnS+CKZMJenX06ZUpTS845NTAvZ9d+PxzpD/rsgAVsmc7usLMIcG0bvawaHzkyVq9XqPWCMGwkx7OtEaOEQztKjXSMGYzLmb05Z42f/pYpXG09dMyJXJXSyIKaNGynIHC6TLOLq7FnMh6SDXwNlZxvPkZaiins/mVPUUtumKe9gukoHMQlXFmKtPLDIjTK++KhM23VK82eRMtj3lplkMRHeXsDpqEidktyDGbMiwKzL5y8HwvN/OWisSremUN6y/VQ/NWzG993VHmugY5gm1Gfa0yy+Y5yDxaqENjKiY5Db6eHSzsujyJYg=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6344.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700021)(22082099003)(56012099003)(18002099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aTQ3ZUU1UElsRTQ1Y3FxcjVSYW5LVUlDdWFRNEJuTmMxSFNVbklZeG5QTms5?=
 =?utf-8?B?c0phVzQvT2xUNFJpUlhUVE9uekM4SStQVEQvNzlvTTRXcXRZUnBnYkJxOVJJ?=
 =?utf-8?B?ZEhNVmY0Y1NEVWkvSjIvU210UU9TUFA2S2NRcjhjMExwaHRMQmk2N2xya2Jp?=
 =?utf-8?B?NC9WUnE0RE1NTGx5bUZBOXdmQ3VHQkllSndoT1dzb0cray9XWXNpbVpmZVh6?=
 =?utf-8?B?dm1wKzE5VzFCdTh4bHQ2R0pHQ25WMjFVOVBDYTI2ZmVmc0U0d0JIOHByeXZn?=
 =?utf-8?B?eEVoTUFuZmNsOWFMREJSNExKNEdSUXJBK1Yza21ONXNESC8yTy92ak04LzBB?=
 =?utf-8?B?R0JnNmdXeW56N1RranpsRWRNTWlxMVRHdHEvTWJOZ0VkaWo0VXhZL0gxbmVD?=
 =?utf-8?B?NjdlbkNsclFPQUlGSlgxY2N1eldGS1ROSU9GcjdHeXNaZDEwSFdpeEkvc2g4?=
 =?utf-8?B?QUlWSkpoSlJWVDZYZzFjZEQrWFNud1pQaHFGVi9LSXdnRVFEUmFMMVVjQnpw?=
 =?utf-8?B?WHlSMEtJand3dHllc1ZqMHF4MkRFMWtyMVp5NGpJT3N5V2NTNEFlcXNqS25l?=
 =?utf-8?B?MW1uR2ZrSnoyMXJrYUIzblVQVzZJNG10K0V1K2ZpenVsUXlJTFZkQVA1NkMv?=
 =?utf-8?B?RVpJendNc0REeGt3MnBIL1JDY3BqSmdvS28zcVFqMEVwVTNWazJzUEJ3c05S?=
 =?utf-8?B?WW43a21ocHoxakRkY3hLZUo0c0FwNWZvSVZjaHBjeUV6eDRQU3h0V2ZUcGtp?=
 =?utf-8?B?Q1FTU2NkWDZpRHpxK3NPb1dqdStQOVpxaUw5a0Q5UEw1ME9FQ3RJUXFvdFlm?=
 =?utf-8?B?dGZvZVJhM3c0QnVYRkZKU1JqcnlvOVd0SVBlWC9aVFltUzBzamN6bGdnUUMw?=
 =?utf-8?B?UUZ0Ym8yMTNZY1ppYk4wRGd4SDdqZnpUaklmTkVzMmRuaFlzVSs3OW5URWk2?=
 =?utf-8?B?Tkc2RFVRSWN3SUpJQTBhc0ZtOUlLU0hRd2c2VTRUZHp1MCtnK3o0ajkvb290?=
 =?utf-8?B?VkVydkJ0VzB3eUZJUWFXNTE0dmNjYUtzdHhQQm1wTDB0aFh1eEZ3bEN3K2c1?=
 =?utf-8?B?U003NUVxTzFIdzJIbS9Sbm1tdXJjcE9ucHdHMHl4VGtCRW1nMUVsRFRWa2w3?=
 =?utf-8?B?clFxbDVHOE0ya2p6aEpIL0hGaU81NnlUbnlLQ1N0ZzR2YmZabmowV3FKRTdS?=
 =?utf-8?B?SXUrZDYzUDBQeG9kK1ZMUDRoSEY2ZlhVbVA4cmVSZW9UVGl2VEE1Uks1UUY0?=
 =?utf-8?B?akFraFM0ZTQ5UWhyRTErWE5wd2RXNGhyUlJDTWMwQ01oRjR5a0oxUG11K0JP?=
 =?utf-8?B?T3k0UHhGTkRLZFFhNlN0ZHNUeHBCN2ZDN1BONzVTYVNPMVgwaFNCSlZGYVZs?=
 =?utf-8?B?emFxNzJwZVI2VVhRN09ERGI3U2U3OWJPYW42VVhFQVhqRU9LcU5yVEY2SkJn?=
 =?utf-8?B?L2FaZDJhYjVGUVozU2NZeldUdEl4S1FrUGdCRjVnYW9sV0VYZzJpT1REd2Rm?=
 =?utf-8?B?OWJsaUl3ZW45MnM1RTh3TXNmZU0xNTFSdzdOUlpVajF6OG5JVGc1YllIeGNN?=
 =?utf-8?B?YzBWWWtoc0ozL2twNHJBVnBkbEphNVFsdW0xSFYzb3pOMnljVUNvdzBwbkFH?=
 =?utf-8?B?UE1EVEhwTk1qSWtpTGZ2eTl0NUJaVktSQ0pTdHZrU2h3V2ZZSzVXc2NTQWZS?=
 =?utf-8?B?NS9uZFBsMkc2VHBicUFYN3dFcHhpb2lqdGhxQnBNeGN1eEMvU0hrTzRrMDBh?=
 =?utf-8?B?cm5vdXRwcTBQdDJyV0ZyT2FDdVpBQUl2K3NOK0NNVVpFK21Hc2piQm05eDdi?=
 =?utf-8?B?dk5aYTl4T1lzcWI5V3FvTlg5N2tVUVpsTlJJeDNIRzVTbUtEejVvVXhKUXVs?=
 =?utf-8?B?OFdGOFd0aDlIMWloWGtrcXl5cFZEUnNpVWlKV2RJR3UzWUo3RGxhZnlCeGdw?=
 =?utf-8?B?b0c2WTN4WEFYSnc1RWRLUytKL0xRZ2IyUDFrWFFzbWJkOFRDOEdtTGUxQnV4?=
 =?utf-8?B?N29BeFUxeEFuRlpocHIxYklLWjc4R3hEQmh6dHFxeWN4YTB6M0ZtWGd4TDE1?=
 =?utf-8?B?RFZkZVVTcVp1SUE4amZ0UTNsMm1za1BiVEtMa1QvZ3lld21yd0orQnRkK2Fo?=
 =?utf-8?B?RjlHcGFyTTBuT3ovaUhMQ2xnK210d1U3THhpL0VSUzNhNGZBNE9DU2FCY0dP?=
 =?utf-8?B?eDBORjFJNzJCTlBOc0dPaytUOG1LN0VzeHdRN29RTTh5eVVacThEY1dSdGVW?=
 =?utf-8?B?Q2NPUzU1dk9zNHVTNEtSVU5mbkZOandWVGhaajBUaEhuaVRwUG5MTWxlVS8w?=
 =?utf-8?B?NEN6bVFiZWVPRThjQjVZVjllWTZzeGZUK1cxN0NFVkFCVkFvUkVvdz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: WKJmmtFvEQWfOso2qLgmZ9+TWwTDateZ4qWPf+PqBOciH9N2oqfkPa9h3enltLjXZZ8tQSr+lA9RVLzZYq/uBaw839eFEU1+05+PfpNqrVV+QIqQmkkg512K+LExY/8sEWfdXeeYSCATZeFOL50Dcfrb0k/rzOpVxtz7/r1Pnv2A8GPsE7q9F9+BMFqklSE7ELokT9Ilh0f3Tz7cwz3bLdkGS9NM6hbutLrPmB8E0xSGQoVNtJ5NOE8HRwdR5ODS6ymmmXOnrvPlOppu8IsimxaTLeeFnVn4Caa8brK/Tuy5aCQ/q1L7Scp1RfvBZnaXsGRwXTvwBnL7r5OcmD9dLw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6344.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c67f00be-d0bd-47cd-d37a-08de86593afb
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Mar 2026 08:18:13.2720 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VgF7Fp3ujbEX5AkPBadB0+n78jFeYgszlLU5RXHzZiLdplN04xD8hwguv1QA5XmIEW4OMJfF/G4aerichHQfzw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6372
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogVHZydGtvIFVyc3VsaW4g
PHR2cnRrby51cnN1bGluQGlnYWxpYS5jb20+DQo+IFNlbnQ6IFRodXJzZGF5LCBNYXJjaCAxOSwg
MjAyNiAzOjM1IFBNDQo+IFRvOiBTaGFua2FyLCBVbWEgPHVtYS5zaGFua2FyQGludGVsLmNvbT47
IGludGVsLXhlQGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiBDYzoga2VybmVsLWRldkBpZ2FsaWEu
Y29tOyBWaXZpLCBSb2RyaWdvIDxyb2RyaWdvLnZpdmlAaW50ZWwuY29tPg0KPiBTdWJqZWN0OiBS
ZTogW1BBVENIIHYyMiAwMC8xMl0gQXV4Q0NTIGhhbmRsaW5nIGFuZCByZW5kZXIgY29tcHJlc3Np
b24NCj4gbW9kaWZpZXJzDQo+IA0KPiANCj4gT24gMTgvMDMvMjAyNiAxOToxNywgU2hhbmthciwg
VW1hIHdyb3RlOg0KPiA+PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+PiBGcm9tOiBU
dnJ0a28gVXJzdWxpbiA8dHZydGtvLnVyc3VsaW5AaWdhbGlhLmNvbT4NCj4gPj4gU2VudDogTW9u
ZGF5LCBNYXJjaCAxNiwgMjAyNiA4OjU5IFBNDQo+ID4+IFRvOiBpbnRlbC14ZUBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcNCj4gPj4gQ2M6IGtlcm5lbC1kZXZAaWdhbGlhLmNvbTsgU2hhbmthciwgVW1h
IDx1bWEuc2hhbmthckBpbnRlbC5jb20+Ow0KPiA+PiBUdnJ0a28gVXJzdWxpbiA8dHZydGtvLnVy
c3VsaW5AaWdhbGlhLmNvbT47IFZpdmksIFJvZHJpZ28NCj4gPj4gPHJvZHJpZ28udml2aUBpbnRl
bC5jb20+DQo+ID4+IFN1YmplY3Q6IFtQQVRDSCB2MjIgMDAvMTJdIEF1eENDUyBoYW5kbGluZyBh
bmQgcmVuZGVyIGNvbXByZXNzaW9uDQo+ID4+IG1vZGlmaWVycw0KPiA+Pg0KPiA+PiBBIHNlcmll
cyB0byBhZGQgc3VwcG9ydCBmb3IgY29tcHJlc3NlZCBzdXJmYWNlIHNjYW5vdXQgdW5kZXIgeGUg
d2l0aA0KPiA+PiBBbGRlcmxha2UtIFAuDQo+ID4+DQo+ID4+IEN1cnJlbnRseSB0aGUgYXV4aWxp
YXJ5IGJ1ZmZlciBkYXRhIGlzbid0IG1hcHBlZCBpbnRvIHRoZSBwYWdlIHRhYmxlcw0KPiA+PiBh
dCBhbGwgc28gY2Y0OGJkZGQzMWRlICgiZHJtL2k5MTUvZGlzcGxheTogRGlzYWJsZSBBdXhDQ1MN
Cj4gPj4gZnJhbWVidWZmZXJzIGlmIGJ1aWx0IGZvciBYZSIpIGhhZCB0byBkaXNhYmxlIHRoZSBz
dXBwb3J0Lg0KPiA+Pg0KPiA+PiBPbiB0b3Agb2YgdGhhdCB0aGVyZSBhcmUgbWlzc2luZyBmbHVz
aGVzLCBpbnZhbGlkYXRpb25zIGFuZCBzaW1pbGFyLg0KPiA+Pg0KPiA+PiBUZXN0ZWQgd2l0aCBL
REUgV2F5bGFuZCwgb24gTGVub3ZvIENhcmJvbiBYMSBBREwtUDoNCj4gPj4NCj4gPj4gICAgW1BM
QU5FOjMyOnBsYW5lIDFBXTogdHlwZT1QUkkNCj4gPj4gICAgICAgICAgICB1YXBpOiBbRkI6MjQy
XSBBUjMwIGxpdHRsZS1lbmRpYW4NCj4gPj4gKDB4MzAzMzUyNDEpLDB4MTAwMDAwMDAwMDAwMDA4
LDI4ODB4MTgwMCwgdmlzaWJsZT12aXNpYmxlLA0KPiA+PiBzcmM9Mjg4MC4wMDAwMDB4MTgwMC4w
MDAwMDArMC4wMDAwMDArMC4wMDAwMDAsIGRzdD0yODgweDE4MDArMCswLA0KPiA+PiByb3RhdGlv
bj0wICgweDAwMDAwMDAxKQ0KPiA+PiAgICAgICAgICAgIGh3OiBbRkI6MjQyXSBBUjMwIGxpdHRs
ZS1lbmRpYW4NCj4gPj4gKDB4MzAzMzUyNDEpLDB4MTAwMDAwMDAwMDAwMDA4LDI4ODB4MTgwMCwg
dmlzaWJsZT15ZXMsDQo+ID4+IHNyYz0yODgwLjAwMDAwMHgxODAwLjAwMDAwMCswLjAwMDAwMCsw
LjAwMDAwMCwgZHN0PTI4ODB4MTgwMCswKzAsDQo+ID4+IHJvdGF0aW9uPTAgKDB4MDAwMDAwMDEp
DQo+ID4+DQo+ID4+IERpc3BsYXkgd29ya2luZyBmaW5lIC0gbm8gYXJ0ZWZhY3RzLCBubyBETUFS
L1BJUEUgZmF1bHRzLg0KPiA+Pg0KPiA+PiBBbGwgSUdUcyBwYXNzIGZvciBtZSBsb2NhbGx5Lg0K
PiA+Pg0KPiA+PiB2MjoNCj4gPj4gICAqIE1vcmUgcGF0Y2hlcyBhZGRlZCB0byBmaXgga21zX2Zs
aXBfdGlsaW5nLg0KPiA+Pg0KPiA+PiB2MzoNCj4gPj4gICAqIFJlYmFzZWQgYWZ0ZXIgc29tZSBj
bGVhbnVwIHBhdGNoZXMgZnJvbSB2MiB3ZXJlIG1lcmdlZC4NCj4gPj4gICAqIEFkZGVkIHBlb3Bs
ZSB0byBDYyBhcyBzdWdnZXN0ZWQgYnkgUm9kcmlnby4NCj4gPj4gICAqIEFkanVzdGVkIGxhc3Qg
cGF0Y2ggdGl0bGUuIChSb2RyaWdvKQ0KPiA+PiAgICogQXBwbHkgR0dUVCBmbHVzaGluZyBvbmx5
IHRvIGlvbWFwcGVkIHN5c3RlbSBtZW1vcnkgYnVmZmVycy4NCj4gPj4NCj4gPj4gdjQ6DQo+ID4+
ICAgKiBBZGRlZCBwYXRjaCBmb3IgcG90ZW50aWFsbHkgbWlzcGxhY2VkIFdhXzE0MDE2NzEyMTk2
Lg0KPiA+PiAgICogRml4ZWQgKGhvcGVmdWxseSkgTUFYX0pPQl9TSVpFX0RXIG9uIE1ldGVvcmxh
a2UuDQo+ID4+DQo+ID4+IHY1Og0KPiA+PiAgICogU3BsaXQgb3V0IHJpbmcgZW1pc3Npb24gY2hh
bmdlcyB0byBzbWFsbGVyIHBhdGNoZXMuDQo+ID4+ICAgKiBGaXhlZCBNQVhfSk9CX1NJWkVfRFcg
ZXZlbiBtb3JlLg0KPiA+PiAgICogRG9uJ3QgZW1pdCBNSV9GTFVTSF9EV19DQ1Mgb24gIUJDUy4g
VGhpcyBzaG91bGQgZml4IE1ldGVvcmxha2UuDQo+ID4+DQo+ID4+ICAgdjY6DQo+ID4+ICAgKiBB
ZGRlZCBBdXhDQ1MgaW52YWxpZGF0aW9uIHRvIGluZGlyZWN0IGNvbnRleHQgd29ya2Fyb3VuZHMu
DQo+ID4+ICAgKiBBbHNvIGFkZGVkIHRoZSBpbmRpcmVjdCBjb250ZXh0IGhhbmRsaW5nIGFuZCBz
b21lIG90aGVyIHdvcmthcm91bmRzLiBUaGV5DQo+IGFyZQ0KPiA+PiAgICAgdW5yZWxhdGVkIGJ1
dCB0aGUgc2VyaWVzIGRlcGVuZHMgb24gaXQuDQo+ID4+ICAgKiBEcm9wcGVkIERQVCBwaW4gYWxp
Z25tZW50IHJlZHVjdGlvbiBzaW5jZSBCTUcgYXBwZWFycyBub3QgdG8gYmUgbGlraW5nIGl0DQo+
IGZvcg0KPiA+PiAgICAgc29tZSByZWFzb24uDQo+ID4+DQo+ID4+IHY3Og0KPiA+PiAgICogUmVi
YXNlZCBvbiB0b3Agb2YgcmVjZW50IHhlX2ZiX3Bpbi5jIHJlZmFjdG9yaW5nIGFuZCBhbHNvIHRo
ZSBpbmRpcmVjdA0KPiA+PiAgICAgY29udGV4dCB3b3JrYXJvdW5kcyBzZXJpZXMuDQo+ID4+DQo+
ID4+IHY4Og0KPiA+PiAgICogUmViYXNlZCBmb3IgYm8tPnNpemUgcmVtb3ZhbC4NCj4gPj4gICAq
IENvcnJlY3RlZCBQSVBFX0NPTlRST0xfRkxVU0hfTDMgdG8gYml0IDMwLiAoSm9zZSkNCj4gPj4N
Cj4gPj4gdjk6DQo+ID4+ICAgKiBGaXhlZCBmYiByZW1hcHBpbmcgY2hhbmdlcy4NCj4gPj4gICAq
IERyb3BwZWQgdHdvIG5vdCByZXF1aXJlZCBwYXRjaGVzIGZyb20gdGhlIHNlcmllcy4NCj4gPj4g
ICAqIEZpeGVkIGNyaXRlcmlhIGZvciBHR1RUIGZsdXNoaW5nLg0KPiA+PiAgICogTGltaXQgY2xm
bHVzaCB0byB0aGUgY29tcHJlc3Npb24gbWV0YWRhdGEgYXJlYS4NCj4gPj4gICAqIFJlYmFzZWQg
Zm9yIGluZGlyZWN0IGNvbnRleHQgd29ya2Fyb3VuZHMgbGFuZGluZyB1cHN0cmVhbS4NCj4gPj4N
Cj4gPj4gdjEwOg0KPiA+PiAgICogUmViYXNlIGZvciBYRV9HVF9XQSgpLg0KPiA+Pg0KPiA+PiB2
MTE6DQo+ID4+ICAgKiBEbyBub3QgdXNlIHN0b2xlbiBmb3IgRFBUIG9uIElHRlggKyBBdXhDQ1Mu
DQo+ID4+DQo+ID4+IHYxMjoNCj4gPj4gICAqIFJlYmFzZWQgZm9yIHNvbWUgcmluZ2J1ZiBhbmQg
TFJDIGNvZGUgY2hhbmdlcy4NCj4gPj4NCj4gPj4gdjEzOg0KPiA+PiAgICogUmViYXNlZCBmb3Ig
dmFyaW91cyB1cHN0cmVhbSBjaGFuZ2VzLg0KPiA+PiAgICogRHJvcHBlZCBjbGZsdXNoIGFuZCBz
dG9sZW4gYXZvaWRhbmNlIHBhdGNoZXMgYWZ0ZXIgbWVyZ2luZyBJR1QNCj4gPj4gTU9DUyA2MSB1
c2FnZS4NCj4gPj4NCj4gPj4gICB2MTQ6DQo+ID4+ICAgKiBNTUlPIDB4NDI0OCBhbmQgTUlfRkxV
U0hfRFdfQ0NTIGFyZSBNVEwrLiAoTWF0dCkNCj4gPj4gICAqIENvbnNvbGlkYXRlIGVuZ2luZSBm
ZWF0dXJlIGNoZWNrcy4gKFZpbGxlKQ0KPiA+PiAgICogQnJvdWdodCBiYWNrIHRoZSBwYXRjaCB0
byBwdXQgRFBUIHRhYmxlcyBpbiBzeXN0ZW0gbWVtb3J5IGZvciAxMDAlIENJDQo+IHBhc3MNCj4g
Pj4gICAgIHJhdGUuIEl0IGxvb2tzIGxpa2UgTU9DUyA2MSBpcyBub3QgZW5vdWdoIHRvIGF2b2lk
IHNwb3JhZGljIHBpcGVjcmMNCj4gPj4gICAgIG1pc21hdGNoZXMuDQo+ID4+DQo+ID4+IHYxNToN
Cj4gPj4gICAqIExpbWl0ZWQgdG8gZW5hYmxpbmcgb24gQWxkZXJsYWtlLVAgb25seS4gKERyb3Bw
ZWQgYWxsIE1ldGVvcmxha2UgcGF0Y2hlcy4pDQo+ID4+ICAgKiBEcm9wcGVkIHVucmVsYXRlZCBH
R1RUIGFsaWdubWVudCBmaXguIChTZW50IHN0YW5kYWxvbmUuKQ0KPiA+PiAgICogVXNlIGRpc3Bs
YXkgcGFyZW50IGludGVyZmFjZSBmb3IgcHJvYmluZyBBdXhDQ1MgZHJpdmVyIHN1cHBvcnQuDQo+
ID4+DQo+ID4+IHYxNjoNCj4gPj4gICAqIFVzZSB3cml0ZS1jb21iaW5lIGZvciBEUFQgaW4gc3Rv
bGVuIG1lbW9yeS4gKFZpbGxlKQ0KPiA+PiAgICogRHJvcHBlZCBjbGZsdXNoIHBhdGNoZXMgdW5k
ZXIgYXNzdW1wdGlvbiBwcmUtcHJvZHVjdGlvbiBBREwNCj4gPj4gbWFjaGluZSB3ZXJlIHRoZQ0K
PiA+PiAgICAgcmVhc29uIGZvciBzcG9yYWRpYyBwaXBlY3JjIGZhaWx1cmVzLg0KPiA+Pg0KPiA+
PiB2MTc6DQo+ID4+ICAgKiBNZWNoYW5pY2FsIHJlYmFzZSBmb3IgdXBzdHJlYW0gY29uZmxpY3Rz
Lg0KPiA+Pg0KPiA+PiB2MTg6DQo+ID4+ICAgKiBBZGRlZCBhIHBhdGNoIHRvIHJlbmFtZSBYRV9C
T19GTEFHX1NDQU5PVVQgdG8NCj4gPj4gWEVfQk9fRkxBR19GT1JDRV9XQy4gKFJvZHJpZ28pDQo+
ID4+ICAgKiBJbnN0ZWFkIG9mIGV4cG9ydGluZyBhIGhlbHBlciBmdW5jdGlvbiBmb3IgZW1pdHRp
bmcgdGhlIGF1eCBpbnZhbGlkYXRpb24NCj4gPj4gICAgIGludG8gdGhlIHJpbmcsIGFkZCBpdCB0
byB0aGUgcmluZyBvcHMgdmZ1bmMgdGFibGUuIChNYXR0aGV3KQ0KPiA+Pg0KPiA+PiB2MTk6DQo+
ID4+ICAgKiBUd2Vha2VkIGNvbW1lbnRzIGFuZCByZW1vdmVkIHNvbWUgc3RyYXkgaHVua3MgZnJv
bSB2MTcuDQo+ID4+DQo+ID4+IHYyMDoNCj4gPj4gICAqIEluY2x1ZGUgPGxpbnV4L3R5cGVzLmg+
IGZvciB1MzIuDQo+ID4+DQo+ID4+IHYyMToNCj4gPj4gICAqIEZvcndhcmQgZGVjbGFyZSBzdHJ1
Y3QgeGVfZ3QgdG8gZml4IHN0YW5kYWxvbmUgaGVhZGVycyB0ZXN0Lg0KPiA+Pg0KPiA+PiB2MjI6
DQo+ID4+ICAgKiBTcGxpdCB1cCAiZHJtL3hlL2Rpc3BsYXk6IEFkZCBzdXBwb3J0IGZvciBBdXhD
Q1MiIGludG8gZm91ciBwYXRjaGVzIGZvcg0KPiA+PiAgICAgZWFzaWVyIHJldmlldy4NCj4gPj4N
Cj4gPj4gQ2M6IFJvZHJpZ28gVml2aSA8cm9kcmlnby52aXZpQGludGVsLmNvbT4NCj4gPj4NCj4g
Pj4gVHZydGtvIFVyc3VsaW4gKDEyKToNCj4gPj4gICAgZHJtL3hlOiBSZW5hbWUgWEVfQk9fRkxB
R19TQ0FOT1VUIHRvIFhFX0JPX0ZMQUdfRk9SQ0VfV0MNCj4gPj4gICAgZHJtL3hlOiBVc2Ugd3Jp
dGUtY29tYmluZSBtYXBwaW5nIHdoZW4gcG9wdWxhdGluZyBEUFQNCj4gPj4gICAgZHJtL3hlL3hl
bHBnOiBMaW1pdCBBdXhDQ1MgcmluZyBidWZmZXIgcHJvZ3JhbW1pbmcgdG8gQWxkZXJsYWtlDQo+
ID4+ICAgIGRybS94ZS94ZWxwOiBRdWllc2NlIG1lbW9yeSB0cmFmZmljIGJlZm9yZSBpbnZhbGlk
YXRpbmcgQXV4Q0NTDQo+ID4+ICAgIGRybS94ZS94ZWxwOiBXYWl0IGZvciBBdXhDQ1MgaW52YWxp
ZGF0aW9uIHRvIGNvbXBsZXRlDQo+ID4+ICAgIGRybS94ZTogTW92ZSBhdXggdGFibGUgaW52YWxp
ZGF0aW9uIHRvIHJpbmcgb3BzDQo+ID4+ICAgIGRybS94ZS94ZWxwOiBBZGQgQXV4Q0NTIGludmFs
aWRhdGlvbiB0byB0aGUgaW5kaXJlY3QgY29udGV4dA0KPiA+PiAgICAgIHdvcmthcm91bmRzDQo+
ID4+ICAgIGRybS94ZS9kaXNwbGF5OiBNb3ZlIHJlbWFwcGVkIHBsYW5lIGxvb3Agb3V0IG9mIF9f
eGVfcGluX2ZiX3ZtYV9kcHQNCj4gPj4gICAgZHJtL3hlL2Rpc3BsYXk6IENoYW5nZSB3cml0ZV9k
cHRfcmVtYXBwZWRfdGlsZWQgZnVuY3Rpb24gc2lnbmF0dXJlDQo+ID4+ICAgIGRybS94ZS9kaXNw
bGF5OiBSZXNwZWN0IHJlbWFwcGVkIHBsYW5lIGFsaWdubWVudA0KPiA+PiAgICBkcm0veGUvZGlz
cGxheTogQWRkIHN1cHBvcnQgZm9yIEF1eENDUw0KPiA+DQo+ID4gSGkgVHZydGtvLA0KPiA+IEl0
IHNlZW1zIEkgYW0gbm90IGdldHRpbmcgYWJvdmUgMiBwYXRjaGVzIGluIG15IG1haWxib3gsIGFs
c28gZm9yIHNvbWUNCj4gPiByZWFzb24gdGhpcyBzZXJpZXMgaXMgbm90IHJlZmxlY3RpbmcgaW4g
cGF0Y2h3b3JrLg0KPiA+DQo+ID4gQ2FuIHlvdSBhbHNvIGNoZWNrIG9uY2UgYW5kIHJlc2VuZCBp
bmNhc2UgYW55IHNlcnZlciBnbGl0Y2guIFdvdWxkIGJlDQo+ID4gZ29vZCB0byBoYXZlIG9uZSBm
dWxsIENJIHJ1biBhcyB3ZWxsLg0KPiANCj4gT2RkLCBsZXRzIGhvcGUgaXQgd2FzIGEgdGVtcG9y
YXJ5IHBhdGNod29yayBnbGl0Y2ggYmVjYXVzZSBzZXJpZXMgZGlkIGhpdCB0aGUNCj4gbWFpbGlu
ZyBsaXN0LiBMZXRzIHNlZSB3aGF0IGhhcHBlbnMgd2l0aCB2MjMuDQoNCkl0IHNob3dzIHVwIG5v
dyB3aXRoIHRoZSBuZXh0IHZlcnNpb24sIEJBVCBpcyBjbGVhcmVkIGFzIHdlbGwuDQoNClJlZ2Fy
ZHMsDQpVbWEgU2hhbmthcg0KDQo+IFJlZ2FyZHMsDQo+IA0KPiBUdnJ0a28NCj4gDQo+IA0KPiA+
PiAgICBkcm0veGUveGVscDogRXhwb3NlIEF1eENDUyBmcmFtZSBidWZmZXIgbW9kaWZpZXJzIG9u
IEFsZGVybGFrZS1QDQo+ID4+DQo+ID4+ICAgZHJpdmVycy9ncHUvZHJtL3hlL2Rpc3BsYXkvaW50
ZWxfZmJfYm8uYyAgICAgIHwgICA2ICstDQo+ID4+ICAgZHJpdmVycy9ncHUvZHJtL3hlL2Rpc3Bs
YXkvaW50ZWxfZmJkZXZfZmIuYyAgIHwgIDEyICstDQo+ID4+ICAgZHJpdmVycy9ncHUvZHJtL3hl
L2Rpc3BsYXkveGVfZGlzcGxheS5jICAgICAgIHwgICA4ICsrDQo+ID4+ICAgZHJpdmVycy9ncHUv
ZHJtL3hlL2Rpc3BsYXkveGVfZHNiX2J1ZmZlci5jICAgIHwgICA0ICstDQo+ID4+ICAgZHJpdmVy
cy9ncHUvZHJtL3hlL2Rpc3BsYXkveGVfZmJfcGluLmMgICAgICAgIHwgMTE2ICsrKysrKysrKysr
KystLS0tLQ0KPiA+PiAgIGRyaXZlcnMvZ3B1L2RybS94ZS9kaXNwbGF5L3hlX2luaXRpYWxfcGxh
bmUuYyB8ICAgMiArLQ0KPiA+PiAgIC4uLi9ncHUvZHJtL3hlL2luc3RydWN0aW9ucy94ZV9taV9j
b21tYW5kcy5oICB8ICAgNiArDQo+ID4+ICAgZHJpdmVycy9ncHUvZHJtL3hlL3hlX2JvLmMgICAg
ICAgICAgICAgICAgICAgIHwgIDE1ICstLQ0KPiA+PiAgIGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9i
by5oICAgICAgICAgICAgICAgICAgICB8ICAgMiArLQ0KPiA+PiAgIGRyaXZlcnMvZ3B1L2RybS94
ZS94ZV9scmMuYyAgICAgICAgICAgICAgICAgICB8ICAyMyArKysrDQo+ID4+ICAgZHJpdmVycy9n
cHUvZHJtL3hlL3hlX3Jpbmdfb3BzLmMgICAgICAgICAgICAgIHwgMTA2ICsrKysrKysrKysrKy0t
LS0NCj4gPj4gICBkcml2ZXJzL2dwdS9kcm0veGUveGVfcmluZ19vcHNfdHlwZXMuaCAgICAgICAg
fCAgIDggKy0NCj4gPj4gICAxMiBmaWxlcyBjaGFuZ2VkLCAyMzcgaW5zZXJ0aW9ucygrKSwgNzEg
ZGVsZXRpb25zKC0pDQo+ID4+DQo+ID4+IC0tDQo+ID4+IDIuNTIuMA0KPiA+DQoNCg==
