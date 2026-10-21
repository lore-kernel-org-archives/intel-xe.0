Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA202606A319
	for <intel-xe@archiver.kernel.org>; Wed, 21 Oct 2026 09:38:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=SA4qklvl
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9102210F9B9;
	Wed, 21 Oct 2026 09:37:56 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C71210F9B9;
 Wed, 21 Oct 2026 09:37:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792575471; x=1824111471;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=cJ7dUxvem8H3SYmWYjRqKAYJpVDoO588GDFiJGCGvYs=;
 b=SA4qklvl1fI8aiSDNK3UZFuu/xzl1cXpWFPmdU+evYfuAE8WhneUGFqi
 75peTiX2B8j8xXWWnG9jl04aKMmSpZALZYC8u8I94Isqzl0c2fe1Ws5EX
 ByAvIJzJOy5owhYFboIJWwjkGmspDC3p+k5b+3ogGniFNswtxd5M3opPB
 ULer3E6PWqyXVE74R3RUe8gT9QX97Pgwhl65JQxFlRlD0UlFtBVa4JYXo
 AKHlw7HAcSCe2m1NGEwhrCAxBS9g8L342oLtCFpOmlj4HIM9eVqi1wCXc
 md6/jnVfYdLmRdbh3PuXgdkEtrN29n2vVS1Yn29SCThVKsK3Pz040aIRk w==;
X-CSE-ConnectionGUID: 6FbB3XoZTKqaoaHxLi7hsw==
X-CSE-MsgGUID: cCrhPi0dQbK8Mr5Z/scAvQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11941"; a="1197363"
X-IronPort-AV: E=Sophos;i="6.27,169,1787036400"; 
   d="scan'208";a="1197363"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2026 02:37:50 -0700
X-CSE-ConnectionGUID: 4Ken50oTQ8yprWTCbUF9UQ==
X-CSE-MsgGUID: MdTPt85KTHmrTpM8IPathw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,169,1787036400"; 
   d="scan'208";a="3395031"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2026 02:37:50 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 21 Oct 2026 02:37:49 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Wed, 21 Oct 2026 02:37:49 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.22) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 21 Oct 2026 02:37:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dU99OroM0kvkCKcJIiSCPy4kIJKw6/uDa4Jz/fXjpqR2Hr8ZBB2bOH6QkKueDfknaano+oPrtTTTFklSG1hpqP2wILyHZBYLtLy8bvX4UM1G8desGWrm52CdvKKnd3GrR+9B2lEdOX8nUUiaPlFcZW4lPJrqaLwng0zuVz5qcPW3ShEokv8U73FHTJjy9FhAtRsX11T24MlR90lpjoHSAdugoUY3emY3fr9zldspBRSyQR9DMnns1DeIDFi20VcAeeaGPPer7M3mlWx5x8fOrwnIVGAWjK+m0ugC2YlY10NloV77oKqw41gb9u59XVBMRt4jum41HEOl7NDoW4r51w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cJ7dUxvem8H3SYmWYjRqKAYJpVDoO588GDFiJGCGvYs=;
 b=XmQh3tTDulYeWH5787aDFo6yPxQzl24bU0Qa0AypmzmqMc1tqiUM3IDeybjHEkWUXzSWh4Dp3I5HEhj5sZ6mLKChGRL4s26OWinbnsgzZxw6Lu48Sae66O+XMHgOHYPD5Ufw83LkOTg6qyhRNr9GcD4ZRemkrAiSFji6ntq2B36JMFQs5UxDbBMiaZYs4B+dTtWPVUkX+pZgpeNjM5xhQch8VC46IXiNxMeOv5ggI4UrqH9D3zaxg3mOaVO/VPwRAoXAzxmkEi3IMztyHLnZrdvauOSw798lPmyvZqcBmCgjCeaUKcVG2T/+uRcZdJbofQUuiNDQHJfyAZg1F2v5EA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS4PPF69154114F.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::28) by CHXPR11MB9649.namprd11.prod.outlook.com
 (2603:10b6:610:2fb::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.18; Wed, 21 Oct
 2026 09:37:42 +0000
Received: from DS4PPF69154114F.namprd11.prod.outlook.com
 ([fe80::79ab:f4ae:b1c2:61d9]) by DS4PPF69154114F.namprd11.prod.outlook.com
 ([fe80::79ab:f4ae:b1c2:61d9%5]) with mapi id 15.21.0546.012; Wed, 21 Oct 2026
 09:37:42 +0000
From: "Kahola, Mika" <mika.kahola@intel.com>
To: "Hogander, Jouni" <jouni.hogander@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Hogander, Jouni" <jouni.hogander@intel.com>
Subject: RE: [PATCH 6/8] drm/i915/psr: Don't write 0 size area into plane sel
 fetch area registers
Thread-Topic: [PATCH 6/8] drm/i915/psr: Don't write 0 size area into plane sel
 fetch area registers
Thread-Index: AQHdT/dJUPBGF+9g+UaJpY9ZZDESWrcH36Dw
Date: Wed, 21 Oct 2026 09:37:42 +0000
Message-ID: <DS4PPF69154114FD70FD4F80236159078D1EF662@DS4PPF69154114F.namprd11.prod.outlook.com>
References: <20260929094434.77129-1-jouni.hogander@intel.com>
 <20260929094434.77129-7-jouni.hogander@intel.com>
In-Reply-To: <20260929094434.77129-7-jouni.hogander@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS4PPF69154114F:EE_|CHXPR11MB9649:EE_
x-ms-office365-filtering-correlation-id: df01a350-7469-4b08-2660-08df2f56f452
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|10070799003|23010399003|376014|1800799024|366016|38070700021|56012099006|4143699003|11063799006|261009223027099003|22082099003|18002099003|10067099003|6133799003;
x-microsoft-antispam-message-info: NLBHyb4JKTB7lDm8HvcZEbhowiKjJRICzAQiP6FYrc39RVF8a+TejH7e+nmNqItT6KRiGgZ9WNT9cSsoOLskd0PCkdoDggtkUCbL7ClR1aVPxcU1OAX0PtFpFGGV2ob8GN6B4H5flIAMrUIYrh3X0q1P7znuRHhFxqDwHgZmE6xJbgqFNMsNcI+Pqc6zHDPXeXIG/lBBdlKTucO5VOyUm8MXMBbr0HBiI754FCawY0nhnzPJZ3PZ1DDknJ72N7OOicMly7MXNb3z4PLcg4Sa6QojFuuYerWx+y9Zqc52Z2Cu/Y6LWhEYL3nTUSwkfYuZv8vS1dqDoviwm6p4f8lBp4epY6bdTElC1KIQEmYMeVEiU/4uNVv6bMsHK4ZGHXWgMkVIakefzxx0VDQ4ZydH0jIcCUrenXV3yTAY+yY7iPRqhEhPdqrnS98Ldq4WJk2P2lQyW7ZFu4v/odzPYWegPLJChP9/Za2YqG8BBMnvnWme7Uk5+hQ2ebFBqktwLYb+lVbT01ZQC1YTxXL1LmrV/Z1nIFI/+frSnSE2D+APTt/tAdPUhQlCJxFTF8mqJJ3BUfePVP1GXWkHsVFcDElDuVvTmVUwVlFWpBiMw0k1AHryBNT6a5YYCwhOGU+Gso0qjTowoAwsh5/fMovoUKO3iIVrIJIDvuCZS+gEPsGB+rRoUI5tIRFTore3eOdoqEpNSIBHAf0flQ8E3QYVhg7huoHntcoYiJ+UzC+OOCIJUqg=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPF69154114F.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(23010399003)(376014)(1800799024)(366016)(38070700021)(56012099006)(4143699003)(11063799006)(261009223027099003)(22082099003)(18002099003)(10067099003)(6133799003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?U2lycDVGQ2gxTS96R3RuV3JqQlFDdU5KZ2FkODdDT2YvTDdYa0lpckIrVFpn?=
 =?utf-8?B?TDlDbDJ3bWpXb0JOWitOcDYvMGhBKzJ4cmFncjkvQW5BeE50cTBwdHFmTmlv?=
 =?utf-8?B?SWpwN0thREVKWmowUmJpTWEvN1lxTmFTZnI0VGpHNWM4MmhHTjUxS1lTOTQy?=
 =?utf-8?B?dS85aFRra3BQS3lKaDhBaGR1YjJoaktDRWFISDFJUUt4R0thU2orZlpaSDNv?=
 =?utf-8?B?MmJLNHYrakF4aFVxakNYZThKb3RYMlgvbFNvVE9UM1hDaWtJNHA2RDZkWGVy?=
 =?utf-8?B?Q3NEcXhuVC9WZmlCWnFTcHVJTy9sVjdZNkZXZEdzMkxKR3R3Y3FNNENTTSsx?=
 =?utf-8?B?cVMxYTBLL1UyeEFKNmtHTnVOd2ljUjgxWHBCZng4RzNDUGlUWm5aUjJsYzMx?=
 =?utf-8?B?SWZzU3BlRUljUGQ3RFdJMkpkTTJPUGo3dzVJTk9aOE5TL3lKZG5EMXg2WFpm?=
 =?utf-8?B?blNQcndaRDl1elZ5Sko1NmtkOG5sMXQ1RTBNUE1YaE1qdVJpUmZFMm1uNEho?=
 =?utf-8?B?Q281QVdjdDNVWXVjUW5YQ2tkQThCY0hBTUN0dlpsblRaUXBpenRFMytOQklq?=
 =?utf-8?B?MFVzQzVseW43NUI1d2xvS05iaHdocmpYM2ZqZm9uSk5WSDF1NGl1Ykp2V3ov?=
 =?utf-8?B?Z2s5SDNCdVVGdzAvdC9YMk9iMWdkQmE2ZjluRE1JQm9CZjJNaENrbUc2TUVL?=
 =?utf-8?B?MDd4dWVLWWptV1BTcHhxQTBrUFJMcURnRVZ0U0o2NUtoeFBHT2VWWEkva1NR?=
 =?utf-8?B?VGVDazFKVk42K0ZkZzl5VG96M0h4VytEVGQrQUo1TG1zaTUwOHFRMWR6Vk9j?=
 =?utf-8?B?UGhmMVEvYXNWVE9pbWVidnd0bVBLU2gwL0dBRjlwQXBpUVBYb0dZU2lyRTdr?=
 =?utf-8?B?NCs1Uk1lYjZNM1JCU0RaeWZEcUtIMHd4M0hscVAxbTA1OUtmZXFvRE0vTGxr?=
 =?utf-8?B?d0EybklMdTJIY09waUxZMGcvNVczTVV3Y1hTMzc4UStEQmFqSzRsUGU4ZWY4?=
 =?utf-8?B?ZldHSDhLS25QSU1oRTcwYzhGN1R6VmRDL2NKaGl6WFlUYTNOU08zSWFRYkty?=
 =?utf-8?B?dnRNR2F5RkFBSkpPRFMvWFVUOG9ZcG9sbUhLYjljd2lQOC9TM3JwUENYd09I?=
 =?utf-8?B?RDN1cFljUHFpcSt0akVWQlUyOU01akNPb21aRm1xR3dOQmpQb0IrcUhxb2RM?=
 =?utf-8?B?TTNXZDRnL1FRczBpS2tDWklteHNJL0swZlJIUVc3OUtWcC9PUlRrN3JoR0dn?=
 =?utf-8?B?cG55aUJnMVhxRE9jblh1Z3RndXdsbDFRS1VrVjNPdENMVEt6cjBBTzdFVUpL?=
 =?utf-8?B?N2ZNaHEwL09qdEhwTEZPaFJPV1ExaGx0YUljRFovZ1NWRk50RFQ1ZG0xRGxt?=
 =?utf-8?B?dmpKM2JDWGVsSXdscWNCUGJOUjl5UmNGTUxwSlgvdUdQZ0tBUWJ5cmlxVm4y?=
 =?utf-8?B?amVVeTYwN0ZZc2hlSUx5ejZkbzRLMXJFNXJHSXBaNnJQWVhVeng3NjE2UjJh?=
 =?utf-8?B?bTJPdmU4RC9uTXI0aEgwbWdTT2VVR0xLbVB1QjJaVTNMZUpzeWtDSzJObWNi?=
 =?utf-8?B?Mm42NmR0c0w3SGdFR0Q5ZncxRGlOYi81N2M1Q3Jqelora0oyYUR4K1g3THFQ?=
 =?utf-8?B?d2V1MnJpQ0pSMWVJN2N4SkRka2lhK2xUbG1KM254VG00czlYNWpEZXJjV0tB?=
 =?utf-8?B?Q2UrT2VOdURaN0xsRml4eVQvcm0vcThweFJtaGZZcVM3N2kwbGE4bU9uMU5u?=
 =?utf-8?B?VTFoUE51eDYvQ2VPQ08zVjFwZU1oekJ3dUFhNzVmSyttQXdpYzlHbnN0NVB0?=
 =?utf-8?B?T2Qwd3hsRzRjakd3Y2NCOGF4Q3BTSXlnM1k0SjN0enVhc2NZcGE2WlJjM1Uy?=
 =?utf-8?B?WVZ0bnhkYkh2cVBNRE9Ua0laaDd0dEVkVFluZ1F1UThUN2puK2RHV3luUi9W?=
 =?utf-8?B?VWZhWHI5MDBTTyttVURudEFtanZjeFZVbHVoaHI5WG8vK2hCVTIzbUZJRTIz?=
 =?utf-8?B?WS9HVGQwTWdLdXBtL1lYVE1YeXpwSGUyYkwxclZncXByYmViN1N3b0l2MFha?=
 =?utf-8?B?SXorYzF1Q29HRjZZVWpkNFVIajNidm9BR0h0VXVac1pzclk4OTIxL09CYURO?=
 =?utf-8?B?SmtBT0pTWjJJbVBWYnovRUF2ZDdqS1ZJNTFWa08wWXdxRGFMaG5jRWRNbU9P?=
 =?utf-8?B?QjJpV09CcXBYb2tyMVAzWC96SVJKelg5V2ZIQUlLZEpOWFc4eC9vTVpyMXYv?=
 =?utf-8?B?eWMwTlp2MjYwNVRnamNtR2szTHN4NWN0eUt5QnpiUzk5cWRaT0Mrb3puVitS?=
 =?utf-8?B?eVZCMUhsemd3VTVRREVTQnBDbXhDb3l4a3BuU21KY0hhTHhpVWEwVlIrUHlR?=
 =?utf-8?Q?XtlfWBe7MTDJYJeLeSj0REBrlcUwIYI35xNsC?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: Jb0oVn2RP37lnwEGJ0u1Fo0iOjy1uJM8JmrJ2LmVYh9rg7AvMi9fbGER+bOQ3YPku+q8F7cBkfUgyRWrVdCmKmPeg/Y+G0kl4nk9Cl8IbmKIT4/+0SJwFUC/uqJiOUHmqVHZ0TqhGggoMCWw7s0oluOC05NUwxVX8Uw6GGBtT8p67nGUma8VByYzYrd/oyo8Ljsu+EhLWMG1yXre9sm+35Z1c+yQlQJG90mIdh18m45cRsKVrkTPBEpvH8fVomzZCMnnyFuny9mxR1wYW7cx7o4NJknPLv7gbk+xukcvf3da0zbzzAzyXlQsdJTq5tOAf3J0aVFhF/zAdehAbENA3w==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF69154114F.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: df01a350-7469-4b08-2660-08df2f56f452
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Oct 2026 09:37:42.2359 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7H3mKjcyQMWpE84vOQUfTcyJ8Q7a4YLVQSV81At1loBuhRWDDPQuF7bMGqIYJ1FAEAmgncqGBXry1SPMeHYDVg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CHXPR11MB9649
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBJbnRlbC1nZnggPGludGVsLWdm
eC1ib3VuY2VzQGxpc3RzLmZyZWVkZXNrdG9wLm9yZz4gT24gQmVoYWxmIE9mIEpvdW5pIEjDtmdh
bmRlcg0KPiBTZW50OiBUdWVzZGF5LCAyOSBTZXB0ZW1iZXIgMjAyNiAxMi40NQ0KPiBUbzogaW50
ZWwtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgaW50ZWwteGVAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnDQo+IENjOiBIb2dhbmRlciwgSm91bmkgPGpvdW5pLmhvZ2FuZGVyQGludGVsLmNvbT4NCj4g
U3ViamVjdDogW1BBVENIIDYvOF0gZHJtL2k5MTUvcHNyOiBEb24ndCB3cml0ZSAwIHNpemUgYXJl
YSBpbnRvIHBsYW5lIHNlbCBmZXRjaCBhcmVhIHJlZ2lzdGVycw0KPiANCj4gQ3VycmVudGx5IHdl
IGFyZSB3cml0aW5nIGludmFsaWQgY29uZmlndXJhdGlvbiBpbnRvIHBsYW5lIHNlbGVjdGl2ZSBm
ZXRjaA0KPiBhcmVhIHJlZ2lzdGVycy4gQ2hlY2sgaGVpZ2h0IG9mIHBsYW5lIHNlbGVjdGl2ZSBm
ZXRjaCBhcmVhIGFuZCByZXR1cm4NCj4gZWFybHkgaWYgaXQncyAwIG9yIGxlc3MuDQo+IA0KPiBT
aWduZWQtb2ZmLWJ5OiBKb3VuaSBIw7ZnYW5kZXIgPGpvdW5pLmhvZ2FuZGVyQGludGVsLmNvbT4N
Cg0KUmV2aWV3ZWQtYnk6IE1pa2EgS2Fob2xhIDxtaWthLmthaG9sYUBpbnRlbC5jb20+DQoNCj4g
LS0tDQo+ICBkcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L3NrbF91bml2ZXJzYWxfcGxhbmUu
YyB8IDMgKystDQo+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9u
KC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9za2xf
dW5pdmVyc2FsX3BsYW5lLmMgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L3NrbF91bml2
ZXJzYWxfcGxhbmUuYw0KPiBpbmRleCA4YmRmMWI4YTAyMjk5Li5kZWY0Nzk4Zjg1MDIyIDEwMDY0
NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L3NrbF91bml2ZXJzYWxfcGxh
bmUuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L3NrbF91bml2ZXJzYWxf
cGxhbmUuYw0KPiBAQCAtMTUyMiw3ICsxNTIyLDggQEAgc3RhdGljIHZvaWQgaWNsX3BsYW5lX3Vw
ZGF0ZV9zZWxfZmV0Y2hfbm9hcm0oc3RydWN0IGludGVsX2RzYiAqZHNiLA0KPiAgCXUzMiB2YWw7
DQo+ICAJaW50IHgsIHk7DQo+IA0KPiAtCWlmICghY3J0Y19zdGF0ZS0+ZW5hYmxlX3BzcjJfc2Vs
X2ZldGNoKQ0KPiArCWlmICghY3J0Y19zdGF0ZS0+ZW5hYmxlX3BzcjJfc2VsX2ZldGNoIHx8DQo+
ICsJICAgIGRybV9yZWN0X2hlaWdodCgmcGxhbmVfc3RhdGUtPnBzcjJfc2VsX2ZldGNoX2FyZWEp
IDw9IDApDQo+ICAJCXJldHVybjsNCj4gDQo+ICAJY2xpcCA9ICZwbGFuZV9zdGF0ZS0+cHNyMl9z
ZWxfZmV0Y2hfYXJlYTsNCj4gLS0NCj4gMi40My4wDQoNCg==
