Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A0DF606A319
	for <intel-xe@archiver.kernel.org>; Tue, 20 Oct 2026 14:31:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=i1PtqehF
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D07610F5E4;
	Tue, 20 Oct 2026 14:31:22 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0074B10F5FF;
 Tue, 20 Oct 2026 14:31:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792506676; x=1824042676;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=hEiJw/CQFhFWXpYFUu4r5BvsxeaCqy2Zk5C9y637dC0=;
 b=i1PtqehFl5Q+YeAZwWoVUxN3bM0CSTtcoknu+UapnaVdwWBKb3eZtztC
 kn1IrHFsdua3/sGrdxq+706qsZMUoZVcJdz41TFKY77nQvlNtUhE/hSSy
 rtyM6q/tLAxKRkTIf2SR84deqBXPrIc6/nUgbaMmiIC4sR7uHBbA3Mpgd
 6MjKhvs2Wi9+BforVvJHVi347iuoX550Eg4D3Z6jqOlUpe5Y+SyRSMlAp
 ZVrPcjDOO3wbQgj0L5sPq9r1vn7FDSFmOgCAZVBZIC1ID7mP7OS+ftVtr
 SZdvoyxzwiGHprlehv4HjGwGUG/XFR6iwWxqGpkzmtnSO8yJ9gMah+1Bb Q==;
X-CSE-ConnectionGUID: T53VxjFIQY+D5nYc9jUjCg==
X-CSE-MsgGUID: aZSGidVqSD+Wc4K7GBHoJA==
X-IronPort-AV: E=McAfee;i="6800,10657,11941"; a="1209363"
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="1209363"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2026 07:31:04 -0700
X-CSE-ConnectionGUID: 8IAMGflmQhibt369MXLeSA==
X-CSE-MsgGUID: ofCBSsq7S6SRBZUn8U3hPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="2938434"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2026 07:31:05 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 20 Oct 2026 07:31:04 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Tue, 20 Oct 2026 07:31:04 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.70) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 20 Oct 2026 07:31:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=brEdRLhanjugA81C24YEU2GAB3mhNd+djBBfKXPKgS36lCWCxfUxdTe4/WhRPyo/28AmiATsVYLr/FE7EJhAogy5hb7lhFqo5r+IijNyqAkbqKAtLt9LJfLdrdh+PEgsBRBdrizCL/HWb4Kjdtol3NMLj+oM+/Tb/6JiXTh9IuMFfIZSu78G/HYQohor3jBLCTxZhLY0q12Yiel89WgblRvrHYaWuUvph5SLhrVjpItpcRO10XQANhVR/o7DqHj24e6axAFiPOD3+aBTjQ7ixCNL4jqzrrVKnCx5J4MSwq4SySFY9g/qiPDdNUTr6Pt02dEAyvwgYuhnkyW0dLDKnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hEiJw/CQFhFWXpYFUu4r5BvsxeaCqy2Zk5C9y637dC0=;
 b=PL9+mkNdvYkHCy6AYe9XHoZAC1fYpRSJEmBwubB1u0sy9Q0ful3y1PrzzzD2foLmJhjbGenIoUQXucPdSbpCPMuCBj7y4464Tkjz8CyrKEVFkgwpmfTK10th9NwCdB5pFFXd9IZSvHSZQbyFKKpe0urW6nvIHZTIEcXjFm9F7UmqjO5vK/p5LS5t+lkmp6MI4I991Fyd72WlzXBiyCG+dQFRf61p5LuGWoEDYD0Kt45ZR4cikt4C1I1L3tvhhsITdtm0dvAH8/+RVRpxtl+cJsW+YPk/59OEV/Q2aEk1dT1bwJnRag1jQ+CfpdGHX62PRun+ftpTXm4QMy8qk+jcSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS4PPF69154114F.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::28) by MW4PR11MB6936.namprd11.prod.outlook.com
 (2603:10b6:303:226::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Tue, 20 Oct
 2026 14:30:54 +0000
Received: from DS4PPF69154114F.namprd11.prod.outlook.com
 ([fe80::79ab:f4ae:b1c2:61d9]) by DS4PPF69154114F.namprd11.prod.outlook.com
 ([fe80::79ab:f4ae:b1c2:61d9%5]) with mapi id 15.21.0546.012; Tue, 20 Oct 2026
 14:30:54 +0000
From: "Kahola, Mika" <mika.kahola@intel.com>
To: "Hogander, Jouni" <jouni.hogander@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Hogander, Jouni" <jouni.hogander@intel.com>
Subject: RE: [PATCH 5/8] drm/i915/psr: Skip sel fetch support check for
 invisible planes
Thread-Topic: [PATCH 5/8] drm/i915/psr: Skip sel fetch support check for
 invisible planes
Thread-Index: AQHdT/ghpn0x8z4AVUKrkov2ym4MELcGnzKQ
Date: Tue, 20 Oct 2026 14:30:54 +0000
Message-ID: <DS4PPF69154114F3BEC0B39CA99ACD5CCD1EF672@DS4PPF69154114F.namprd11.prod.outlook.com>
References: <20260929094434.77129-1-jouni.hogander@intel.com>
 <20260929094434.77129-6-jouni.hogander@intel.com>
In-Reply-To: <20260929094434.77129-6-jouni.hogander@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS4PPF69154114F:EE_|MW4PR11MB6936:EE_
x-ms-office365-filtering-correlation-id: bac6209f-ee18-4538-7b7a-08df2eb6bfa8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|23010399003|1800799024|366016|56012099006|38070700021|4143699003|11063799006|261009223027099003|10067099003|22082099003|18002099003|6133799003;
x-microsoft-antispam-message-info: 6tU06T9mX/eRaaHzTAO+0TXGmr2Rgw/g0xPw+/oXSnOy9YZULPgSanN1yNykWgXkYoR/BeXYhCjHp2ACMcAHq/7IT/2QR9sd+tYhR5Bq9Im62VOEWh+T/RcSwf/N0N3CrssiA5jwa44CSf3kfid5lVm7LPWS1PBE0N9SWvtxo1JIpd0lKvdzFz4G5NcaMRfBeTdXbb6t149qqvxI+38VQVn1BPjNc3HTcwTPS+nBPllMPf2TGnqjaat+eh4i8Jp1jjkiz3SrYB6NsekFA+j80GXobnZIBffQ2bcciLHfSX+GHIv76gPraz7tNIrBXuzjoEs23PO9sbbJ+hnrwBdesaFOLoi/rpkKgudCd9lGFl/HEJKzXeRp873PLlVC8qgsZcMraZZ30j/6n/oiBfSoa2F3067PGZKXGxgOlD9Q3Nbg+7/G8HJaBuDhI4N1fD6pkVysQiqEiqYb62Ed/m2085/gUgIWVcd2/j5R/BhAaAI0zMEdt7YWsHp2Z3DCYh9iQgyzRXn1ZSzWrSUdi177CiIphfULopkbFYlPX+1HepfCYnmGrmnYhiHsV20lkKeu2sc4DIDT5aW5dH+kqGQHKC7p53YiHgQpuwjDHtQI4ezdOf7ys0MdHO87iQBGHoE+J3ImHHvH9Cs7TltbUke5BV74GJZf6eVELQ220kVWuW8nHwD20jY9QyrCCakyrYaI+iAt0whab8V9Lba+KpMArTEriojWzSCjR177N3kAcJo=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPF69154114F.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(56012099006)(38070700021)(4143699003)(11063799006)(261009223027099003)(10067099003)(22082099003)(18002099003)(6133799003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?M0RDWFJyZDY0cUkrL25NSG5hWTJtdmE3SlY2WHJxejZqcUVaMDBZSndPekIz?=
 =?utf-8?B?TjRxMyt6UFdwcDFFeGhHZCtlMEJyakZGbGZlcnVsSzlzbHhQNGxJbVZhajdP?=
 =?utf-8?B?cVpGMzkyU3I4cnN5UG4yZWFrZWV3VTlGWk1uQVBJUTNSdk51c1BaekwrZFFs?=
 =?utf-8?B?ckRXY3ZPZ3NCSS80MFRnbEg2bWJjZEJTb1N3c2JSdHlwbVJKMlZuMzVWNWJs?=
 =?utf-8?B?Nzd6NDZubit4TFBpdVNjRlFKMzQ1VWJYNSs3RS8yU0lyN0FhdGxqNElhbGYw?=
 =?utf-8?B?WnNETDhGRjYxV0Z2OUtiTUZvc3BTQ0tpTFFVZU5qY3ZTMkVqbldmaERxU2NS?=
 =?utf-8?B?ZDl3RE9vOUQzYit2OGNTS2dDMW5ZRGt3alhPWEtab2phMnB4a1BUbnJjTktM?=
 =?utf-8?B?Y0xYK3lPRVZRNkV5L3k4b2VQU1Q5NklybWc5ZmRFbndWeEpIVE95Qk5pNjBP?=
 =?utf-8?B?S3ZadmhzZVhpY20rYS9vYlFMaVVubFkvZTArQ3RrNEF2TFFCMXZrSzBPakN6?=
 =?utf-8?B?TkJMRWhzWWdKUHNYWVA2ODFRWUFiaGRSbVFYSi9sZG5tQmRYRDZxWitJa1BN?=
 =?utf-8?B?UDh6U2FVVzhXWUVrM0dRZnl3UGVFRzR5WVZXZjdXSUtwclB3amJvZUNmcVpa?=
 =?utf-8?B?azNVZ0JFc2ttVEhzc1JvaUc5WFBMaGNpaU9wNU5NaUx3ejZaS2VvTmM1eWZG?=
 =?utf-8?B?Wk9kYlpGWlNUMVZ6MEdyZG1iS0hvSEZxb1RoZ1ZpeXJGVDJMMGk1YTAwbG1l?=
 =?utf-8?B?WFpsU2pvbUt4cjE0OEw4Vm14enZLWXVwZk8yUU1JRm1iby8vdEFocGx4QUZz?=
 =?utf-8?B?ZWZtL0FLN2FmWUViQnUzUDErNm1VSG5YODkyM2hWb1k5cFk5bGxvdHhMMTlj?=
 =?utf-8?B?Rmg1NHAwdEcrZXd2VWF5enArOTlYdlp3UVJHSFBYQ0NVYXhQSjVmSG5jOTdE?=
 =?utf-8?B?cUNTa1h1OVpmS1VFejd5NkI5N0oyellsOWVVall6Wkl4ZHUvZDdHUmJzaW9F?=
 =?utf-8?B?TVM1Zk56b1I4TVJ2a0ZyME9hSnkzenF3dGlOWXFVdk1MKzgyM1BDV2xuV0hO?=
 =?utf-8?B?VDltOXZXYXdLSTdrbUMycU9vME5xd0dCUXZJS1oybGpMVC9oT3gwZ3dwRTVS?=
 =?utf-8?B?SlZodGRVVFdVVFQ2aEtXM1N4bjkrd0U0VldKK005dVV4QXdkVTFVbjlFVnJV?=
 =?utf-8?B?R01GUUgrbnFCaW1uN3RMUmt2L2JCc0d0TFZPQU44cW0vRWZzWVYzVkt6N2xB?=
 =?utf-8?B?dmlFT1luQXNqV0ZrNlpXT0M4OGVTMHRENDl3ZzZNUGtlakhnMzNKMjQrZTRW?=
 =?utf-8?B?dTNTaUhWaERINDJXclVvbEZjTmIyRHhaQkxLZW5xUzJiNHNlSjZqcGlUN3BF?=
 =?utf-8?B?eHNHei9jRitOTC8wQVg1Y2xBN1pzbFBVVEdvRU95ZUpHNWMxaUl4eTYvYWFB?=
 =?utf-8?B?U1lVc1pjR0VMQS9kU3FQUTMwNVc0VWl5bjFxMDJHN3ZEVXhaeHVLQjNoQnZT?=
 =?utf-8?B?akVPVkFZUEZzR2I4Q3dhOEpLUVBxRzFGSFlVSkpLNFhxWkVkeEVrbitUTE8x?=
 =?utf-8?B?UEk0NTRYYU12Ty9sM2ZYME1xRDhYdlBzcXVGMmNWWVpiUEwyTy9UWU1Ub3Yr?=
 =?utf-8?B?cVNnNlRJcDBCeE96ekhiNmtHd0tsVkNwZU5WbEVWc0l1VFFsSUZIZFR6RzU2?=
 =?utf-8?B?VGhNZmxtbGtqUUlSNU82TWh2WFg4Qm0rK2dtRDFJeWJLM0h0L3NHSThZWjZ1?=
 =?utf-8?B?SVpUYWYyZHFIL09IQVIxUGloZHBUbGRzOWtHbFRsbVVTSmpKdU9BakhqWDIw?=
 =?utf-8?B?ckdlN2hlOFh5RStmUVZoSkYrM3ZCRzdPRk8vWVJGOTRxL0N5QlFHVVpNWHd2?=
 =?utf-8?B?OUJXTEp5Z1NyaWZPUzQ5Kzk0Y1ZBYllSMGsxSDREVjJzUmVMUVpqdHhoeWNC?=
 =?utf-8?B?ZHN3NmtraFROZldUakc0bmt4RXNJTHRRMHBqdk1sVytYMnhiblY2UXJZUUJE?=
 =?utf-8?B?OVJ2eUJ5RWZWL1I2YlpBcDNtVFN4OTR3R1QybzMzUkgzTXRBa1FxUGZ4RVd2?=
 =?utf-8?B?THpuWVZyUkhTUzlCOXZldXdDdWRXdnU5VHlhU1RWYkNSdHBzODhlQWhJOEpI?=
 =?utf-8?B?OUR6RlFaTEdFM2lHL0NqQnFDRFQ5U1ZRQzlJVjk5L0dQc1gvakpsZ1E4eWhT?=
 =?utf-8?B?Q3VadXoraEE0TTJFR1BLWDNXNGVwbU55MVRDYklzOHJ4djQ4RERhSkhxTjV5?=
 =?utf-8?B?blZ5R1dSbS9ZNkpKQk9qVTNJV3BQV3dZZ1R2MUJMcmt2VldrSG9HUEN0NHE5?=
 =?utf-8?B?ZHVxQ2pFcFk4Z0xqWERqR2NneHg3dzZuUWNrUENmNXNsM3drckQ4QT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: GFX1eVeCqhKTrACqK6csUbXzOx01CZJai06GNeK02m8R7IYEovYlJHBQcUyMlSGVqwtDygje1Mqa2tY+dB7Zkj3GnK+nIEdDzB3k9JSGNfi0CGiz9rFoRzZ19iMOV+KgjCLoEQMvGN5o8LR+GOrIPn9r6k58zcj3VpaMYCMS9BsVAwbAyFVUAeP/yO1DZ6djJZ69P6/SNm1jcIl5Bi3FTfCz//HZ9H1in5lnT/bTl8ukIEYLT4lXTSIO/KHesi6v14L5fVaCphitFDoFfc5uKDyLU/Cr3Bam8Ktz2ulA5zFKeIzsI2s1DztH0H+RIXnB8mNbK2wBOq11EVGHurkpcw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF69154114F.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bac6209f-ee18-4538-7b7a-08df2eb6bfa8
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Oct 2026 14:30:54.4169 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: O2Jj1608a4zhl1w1RjW9Y7UYd1Y0y6uZZLFKxgKovtAoNXVTWEd/PGJ8Sbe/snUXXDHFQlipYBGJ071hmevUFw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6936
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
	SPF_PASS autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBJbnRlbC1nZnggPGludGVsLWdm
eC1ib3VuY2VzQGxpc3RzLmZyZWVkZXNrdG9wLm9yZz4gT24gQmVoYWxmIE9mIEpvdW5pIEjDtmdh
bmRlcg0KPiBTZW50OiBUdWVzZGF5LCAyOSBTZXB0ZW1iZXIgMjAyNiAxMi40NQ0KPiBUbzogaW50
ZWwtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgaW50ZWwteGVAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnDQo+IENjOiBIb2dhbmRlciwgSm91bmkgPGpvdW5pLmhvZ2FuZGVyQGludGVsLmNvbT4NCj4g
U3ViamVjdDogW1BBVENIIDUvOF0gZHJtL2k5MTUvcHNyOiBTa2lwIHNlbCBmZXRjaCBzdXBwb3J0
IGNoZWNrIGZvciBpbnZpc2libGUgcGxhbmVzDQo+IA0KPiBDYWxsaW5nIHBzcjJfc2VsX2ZldGNo
X3BsYW5lX3N0YXRlX3N1cHBvcnRlZCBvbiBhbiBpbnZpc2libGUNCj4gbmV3X3BsYW5lX3N0YXRl
IGNhbiB0cmlnZ2VyIHVubmVjZXNzYXJ5IGZ1bGwgdXBkYXRlLiBBdm9pZCB0aGlzIGJ5IHNraXBw
aW5nDQo+IHRoZSBjaGVjayBmb3IgaW52aXNpYmxlIHBsYW5lLg0KPiANCj4gQXNzaXN0ZWQtYnk6
IEdpdEh1Yi1Db3BpbG90OmNsYXVkZS1zb25uZXQtNC42DQo+IFNpZ25lZC1vZmYtYnk6IEpvdW5p
IEjDtmdhbmRlciA8am91bmkuaG9nYW5kZXJAaW50ZWwuY29tPg0KDQpSZXZpZXdlZC1ieTogTWlr
YSBLYWhvbGEgPG1pa2Eua2Fob2xhQGludGVsLmNvbT4NCg0KPiAtLS0NCj4gIGRyaXZlcnMvZ3B1
L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfcHNyLmMgfCAzICsrLQ0KPiAgMSBmaWxlIGNoYW5nZWQs
IDIgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfcHNyLmMgYi9kcml2ZXJzL2dwdS9kcm0vaTkx
NS9kaXNwbGF5L2ludGVsX3Bzci5jDQo+IGluZGV4IGYyZWM3YjBlMDY2OGMuLmUyYjM1YjlmZWU1
YjIgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfcHNy
LmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9wc3IuYw0KPiBA
QCAtMjk0OCw3ICsyOTQ4LDggQEAgaW50IGludGVsX3BzcjJfc2VsX2ZldGNoX3VwZGF0ZShzdHJ1
Y3QgaW50ZWxfYXRvbWljX3N0YXRlICpzdGF0ZSwNCj4gIAkJICAgICFvbGRfcGxhbmVfc3RhdGUt
PnVhcGkudmlzaWJsZSkNCj4gIAkJCWNvbnRpbnVlOw0KPiANCj4gLQkJaWYgKCFwc3IyX3NlbF9m
ZXRjaF9wbGFuZV9zdGF0ZV9zdXBwb3J0ZWQobmV3X3BsYW5lX3N0YXRlKSkgew0KPiArCQlpZiAo
bmV3X3BsYW5lX3N0YXRlLT51YXBpLnZpc2libGUgJiYNCj4gKwkJICAgICFwc3IyX3NlbF9mZXRj
aF9wbGFuZV9zdGF0ZV9zdXBwb3J0ZWQobmV3X3BsYW5lX3N0YXRlKSkgew0KPiAgCQkJZnVsbF91
cGRhdGUgPSB0cnVlOw0KPiAgCQkJYnJlYWs7DQo+ICAJCX0NCj4gLS0NCj4gMi40My4wDQoNCg==
