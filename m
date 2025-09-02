Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28B7DCA1005
	for <intel-xe@archiver.kernel.org>; Tue,  2 Sep 2025 17:25:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD21410E7FC;
	Tue,  2 Sep 2025 17:25:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="awFs7psD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3361B10E7FB
 for <intel-xe@lists.freedesktop.org>; Tue,  2 Sep 2025 17:25:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756833929; x=1788369929;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=Dr1x6z/blxBNf8h5bNbviM8o4fHFgM5XTrQId8G/crk=;
 b=awFs7psDokFY3v11g8v+keIlJ9xgRvQE7nKCWqOSGeBgerh4Ttta3481
 S1shbjiw1abtH9nEsi6peMPq2LiP6tBjrdAYoctCYLecx3GjvVJ79dYGl
 saOXUWITIA/JIkPWQZCaE+beqPIGaEaxiXrO74m6xJ9jZQSB0HiByjDZa
 Vh7rx70duVoQdsrvHNBeF9DBCpQId4BhwLMlkvxno9gGsWhg6FRdkGNRm
 kA5FkFNIz9TQXhIxC4Bb90EgCePZJMcheAdvlIr+CvHBT6eXK+5aXxYHB
 TMCEU02NVuotd/44rJj4jweKKDUvUSK/y+6m9SV/xuqhq2giTUiR2alqd Q==;
X-CSE-ConnectionGUID: q8cMEIaLTuewS19By0R3Qw==
X-CSE-MsgGUID: kIZYFWrMT/mvr6TxelVm+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11541"; a="59189055"
X-IronPort-AV: E=Sophos;i="6.18,233,1751266800"; d="scan'208";a="59189055"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2025 10:25:29 -0700
X-CSE-ConnectionGUID: hwkGMjSVR4acvXaoAfLhVg==
X-CSE-MsgGUID: a3kdz8UsQPmXnT14Q8wsCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,233,1751266800"; d="scan'208";a="171491139"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2025 10:25:29 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 2 Sep 2025 10:25:27 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Tue, 2 Sep 2025 10:25:27 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (40.107.243.48)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 2 Sep 2025 10:25:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tTdU+Oo5HXQq23KrBnK48SX0JIL27zU56URy3N0l/Scmi5kX67I3L75+wmdEHXkeH+Nn+3O9o/62aZ/b9lPVrJnUuQenVa+SJM07xdsR+f1ueoqEl+fcWcy+Gf+lJiYUluyeb12PFrRcd0AzVbl4oEtxtfY9QQR4klRn2uciZfDWjCWjjN68pjvxV3AUmK+0sAEgzl2+x/8EwM+dz818+RZe1i51grDhawn9dLKSIdb+uFClWztZowgdJYyVwKiUOEuCmGxr30U2+lQ1m4759Scl7eVO4ESi++9BZQI8mQN0WB4yYjerXTYRed9mHhRyNYFOBidnXuUF9kcfPzOYKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Dr1x6z/blxBNf8h5bNbviM8o4fHFgM5XTrQId8G/crk=;
 b=xl4mbju2eaGnAN9joVh4LE/Ld57J9zkk05sXg3b76gfpehYPJ5XVbg/aOU84JKHd8qscgntE8bkgOUR5oFVwQqHeg/2cwwC2G4dDxMhS7adpUrOvelhXE/+1ndf5clR707UckEAvc2TjpzLQtyh9skUQ6d4aeQ040/4NWHy1nJ54Rg0mE3LPOvPevY/Ke3I8CWWbnGtvm5Yu1ZzUD2rcdzGFurkOXNgu6OA4ZhsdGOGFp74TfP5rVDV5X6Z49Ay+QQdgcQe5JsrsuEWE0K5Oqsag3B+48Z9NDPl+c3aBCnftiCb8dtf3T7BzFirJmQqOcF2dxHgkmNH58n4tc8UN+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 DS7PR11MB7886.namprd11.prod.outlook.com (2603:10b6:8:d8::18) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9073.27; Tue, 2 Sep 2025 17:25:25 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b%3]) with mapi id 15.20.9094.016; Tue, 2 Sep 2025
 17:25:25 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>
CC: "Tauro, Riana" <riana.tauro@intel.com>, "De Marchi, Lucas"
 <lucas.demarchi@intel.com>
Subject: Re: [PATCH 3/3] drm/xe/configfs: Don't expose survivability_mode if
 not applicable
Thread-Topic: [PATCH 3/3] drm/xe/configfs: Don't expose survivability_mode if
 not applicable
Thread-Index: AQHcHAwRkhi4+9m3EE+bnMkAX7wpy7SAJQkA
Date: Tue, 2 Sep 2025 17:25:25 +0000
Message-ID: <cb4d9b4ea275b9d8dfad37a7e078cea8477e9bda.camel@intel.com>
References: <20250902131744.5076-1-michal.wajdeczko@intel.com>
 <20250902131744.5076-4-michal.wajdeczko@intel.com>
In-Reply-To: <20250902131744.5076-4-michal.wajdeczko@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5573:EE_|DS7PR11MB7886:EE_
x-ms-office365-filtering-correlation-id: 3481e72e-d908-4062-ee94-08ddea45b448
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?aDJwbmpIZi93V2FGR1loMEJYUlYyazlhdmlmQWt2VlNNN1NYM1krSmY0VTBz?=
 =?utf-8?B?dG5wNVBBVkxjekFNQVRTZUduenRiZXQ4VzRtVDE2V3FzUWtZa2pKVWVmdTVu?=
 =?utf-8?B?cXVVekV5cjNwNG1jVVJTVEt3eXpsc1Fhb1E5RE5pRUtmN3lxMS9hcmNobit5?=
 =?utf-8?B?OHJPVFRENWRsT01mYkMvekpQZm5nQnplSnkzcHpRU2FjUVVlTlpBSkhOOG40?=
 =?utf-8?B?NkRZUElSRWIvWW5kclFOcnRuNHpiUUxXNmMwQ2xGK0hra1NLaGRvVUtVMEd6?=
 =?utf-8?B?MFB3bzdEd00wNEpFTEpqK3ZqMmlEazR3c2NOanVCeUFoc1V1azYxSXhqRlFY?=
 =?utf-8?B?ek9OU2ZYbE94N01VU1dibGhBeDk3dGo4UjhtYXYwMDcrTEpxWmhiM3RvNWNU?=
 =?utf-8?B?QUw2M2NuV09qR2hYWisxTzlacHhUTHNRdE4zUjRLZmZHWXdVdDVnZHd5Y0ZE?=
 =?utf-8?B?SEdOQVEwaWFLV3FCZFFoWnFEL3paQmd4aG44RDlEK1N0NWRueXRlS3R6SFZJ?=
 =?utf-8?B?ZE5YU0pLb2trMmJTaXR0VE1LclI0K1hRNGs2NmFab0ZrTXF3a0k5Wkt2OG9h?=
 =?utf-8?B?NW1JSDNwOFA3bHdldkhydStxY1dqMWt5d0dWenRIRWFEUFpVVEtIV1ZXT2JT?=
 =?utf-8?B?VzhEbWNibEN5dnlDSDd4aGxLbmlqN3pPc2d2bXVPOXZjYlpmQzB6dEZzMTFU?=
 =?utf-8?B?aXZ6a0RZbG04a2QrM3dXNHFyUi9sNmp6NWVLYWpIRXlCZjBzRDdSZVpWamsv?=
 =?utf-8?B?cHpyQi9JSThoeW4yYW5BUXZMcW5IT1ZNekI4MmFmWGcxQ0l4cm9jcFJZWWVY?=
 =?utf-8?B?alFsZ1ZOYUtldlZEb0NGdHcvMWEwWW5Va3liR0RuWnVjVEFBZFhmVmlJV2Ew?=
 =?utf-8?B?THNtemJLOFJqNjhqVWRINnBFeFFXUGI5NHRNemRpQ3ZqQ3ArRU1vMkpNbVBo?=
 =?utf-8?B?VWt5SVZDNmt0bG1Sc3JRa2VuY2V3MklLVFpOWTVqYlpyWFllSUU1clpaT3RS?=
 =?utf-8?B?M2pLdldsMUVyRHQvMDFyM0xyL25qOCt5K0c0dEZvRW5LQnRTNGJackxJTWxo?=
 =?utf-8?B?OExhWWMzdzVJZzVSZG9GWUtkdWU0Y2JWOXBHa2ZXK1Rnb2dMRGRhY1lkd1BW?=
 =?utf-8?B?MFpnWEkrSGlpMjRvOC85cGxJc09lMFJjeDBkRldGQTAwZkN5TnN3aEN3WlpI?=
 =?utf-8?B?ZHNqU00zQUI0MnZTV05NMmVPdWMzSFhMUDhYSzhTMENWSlVkbEk3VzY2WGp3?=
 =?utf-8?B?emJlVmhVSnp2OU1GR2U2Slc3dzE5RHh5Vkc2Y3JMK2lnRjR6cVZWeDE1NEM5?=
 =?utf-8?B?aXYwNWN0SFNXei9GdTFENzRUYjVCZFh1elVWMEMwU1hMbXpIbXduZ0ZYaTcx?=
 =?utf-8?B?V3kwMWFVV0ZTZ1FXcmt6RkJVeVZvWDcwOXdXZVY5dnpmMExkV0JrNzhaT3or?=
 =?utf-8?B?RndWN3p6WFNtcnNFajk0TmE4WVJ6OFFGeVZFYkFLNFJtSDdCNUZiWFN0SGNP?=
 =?utf-8?B?L0tIaDdheTN2QUtSTTB1RGxPc2R3RTVidDlXQUE0YjZocjdPOXNadURvMkNU?=
 =?utf-8?B?Rm1HWTlHYmUwYUg2dkZiMWxEVUp4elR2SFpSdW9nUmlBYzJXaldxZFp1QUgv?=
 =?utf-8?B?SlEzYXBoL205MWV4S29kb2U2L0hFV0JyTWk2blN0WWJKZ2dJWHF1Y29jazFm?=
 =?utf-8?B?Qy9pOUVmUm9WR3Q2Nm5UV0RacWw5TThLQ1BUQjVqQnVCR0lpTnVkamk3ZWhN?=
 =?utf-8?B?WTZIZ2NsQVVUSzRtMlBQRmRZZjk4a2dCbTJqalBMajZGQVFtTWM0UGNOMDhY?=
 =?utf-8?B?c1VraC9Xb2Fra1VyaVRURit0ZllIME0vd3pNWDVFbUk1YWl6UTJON0xqcjZB?=
 =?utf-8?B?Y3A3ZktNSGFLNEgyb244azVHbjl3ZHlpUTlCODloZVU3WmU2OHRIaUVCV00r?=
 =?utf-8?B?Um1kTSs1VnM5dEk5SHN0U3RmcGlJcGFqVWg5Z0EwQkMxUjI2NjF2UGpLYmtK?=
 =?utf-8?Q?cuexcagUg39yADREMwehdzT3Accdbg=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QUxVVm9UUTFNbUYramFmMUN4OERFQXZUVXZQVnlUK0Z1eThCVDNTSURFV2JP?=
 =?utf-8?B?c2tqRGVuQlV0MldjRmtzVWhiR0FrRTNSNWEwb0RUWnhkVFJvRkpXSFpFMXpI?=
 =?utf-8?B?aHk2TW9hNnhVSm5FcG1Hd2RpdDFHbTRjL2g5SXNiMXNJRklXcmhJdWlLdWI3?=
 =?utf-8?B?ZVhzdWNiZ053QkEyamNNWXNmYlA0RVdPTG1UUElxa1FCeEprWndqNGZmVkdS?=
 =?utf-8?B?YU9ibm1pZncxOFI5ZGxVMXVKM0MxME5Bd2V1KzVlYlc4bHlKQmxYNm5jYVNa?=
 =?utf-8?B?TnRBaVpaTnNKYjVIb1V6SUF4ZG9tak9ZeUN2bjlpbjY3ZjFVMTVyZWpiV2VZ?=
 =?utf-8?B?a1FzS0lKL3NiY01UdzdxakFvR29uRWQ1dHN6OU9MN3IzTy9taTA5Ly83UDVm?=
 =?utf-8?B?a0d1NFQvVFhxMi9mUEVJRlJUWlhtNUp0K2diNjJFeDlMQjI3cVJZY1kreTls?=
 =?utf-8?B?MHY5MDRSaG10SnV0eTNmTVBTRE1hSFdzS29LOEV0eFhnR3RqNEs3dTNrSkJr?=
 =?utf-8?B?UTlNM1RWUkk2azVZU05KblRJTUYyTFBKVm1WV29JOGd2MkJ0WTY0V1ZSQUJT?=
 =?utf-8?B?ck5lelVGUjVMODdnOGsxcHFwN3hRU0llRzEzZWNDMVpib2ZWdzFVU2dxVlVj?=
 =?utf-8?B?QWM5NGtwZVUzUUxPUzYvYno5NUxHTmNaNXhGcnlpQllLZitRcGJndjRTMGxT?=
 =?utf-8?B?N0d1eEtlMG5tc0NROFkvcGlZSGo4R1hkWWFKODhsbDQyeG1LVTNoRnQ5ZEVM?=
 =?utf-8?B?SUJxdXBsK0xJaWQxV2c4ZDRqZlRXZGRDZU9wVHdPclk2RUhFa0FHdURVNm9o?=
 =?utf-8?B?TE1OcjVCTTBRNHhpRGtQUkgxQmlpYUxzaFRLMDBOSUt3MlZMUk9HaHZxN2Nk?=
 =?utf-8?B?QW9vYjBXRUdNdC9KbE5XbEtzNWg1dklkV1BKQ2ZQSFZpOHpBTTR0V21RODlC?=
 =?utf-8?B?Nk9tVlNQK0dCUDlLRUlEeU9CWXQzVWprMC9TcHp2ZU9iR09odHVMUnlvSW10?=
 =?utf-8?B?KzRCZ09sMVhEbjNudENpam5HdHJQcmcxczF3OGhOdHNzbkI2RHQySCt4WEFM?=
 =?utf-8?B?TlBmZG9aYWJrRkhBRDVPcTlEWWRzYU1nY2MxV3lVU09LMTdHVnduOGJBVzl6?=
 =?utf-8?B?R3l5NStRS0kzWmpGOG85MG15WGE1NTIrbHptUzI0V1BMUTVhU20vejc3Z00z?=
 =?utf-8?B?UWFxT2dJcE9TTS9ucEVZQUkxeS9DUG9EVDZuc3QzREJxakc5SStnY29vZ2Jj?=
 =?utf-8?B?S1hzYlN2eUtNOUZsbk8yZzZXRnc4YzI3RDdXN2xGQm5hSi96bkVHL3h4bXBC?=
 =?utf-8?B?WDVDMy81WndHNlRhNXZjTDdteDRiRnFwTGV6RFpUU1l1aFY3MUNVTkV3aXZD?=
 =?utf-8?B?NE9OOWEwWkFYVnIrNjZlSG9hNmRsKzlRR3hSbnRGZ3Y4VEhqeDdjTVpqTlBV?=
 =?utf-8?B?LzhtK2gyczR0bmwxUkY4bkVJWnhvMjBGbkIvWnZLektqb2ZLUWhZMEJmMmUr?=
 =?utf-8?B?aEJzQkdoQ3ZVcEZBajgzV01PQ3AvSVBDQWpWV3cxNzBxTllpNXV1K0Z5Wmpx?=
 =?utf-8?B?SlJGTmk1ZGZLaHhsSU5VNGVoSEY4ZkRGUFpPa3dsZUp6eEhlVVJ4RHM1c1Zl?=
 =?utf-8?B?dzVCeVAvQ1ZVOTVwV3NIWElNUC9SaE91MDVUYjVnYU40ZjB6TVlLendKQXpH?=
 =?utf-8?B?bEREVWtvdXZWV1Zlb0wvUndkeFNsNnMydFNQamlEUkdmTlN2cDBiN0VWdjlp?=
 =?utf-8?B?K2FNUnNQSlVaS3o1a2JMeWN5bEFkUWp2TnNvSEN4VlordW1neE9MUTA2eXZr?=
 =?utf-8?B?LzBEUnJVWTJ0Q2UvYTk5N3RoOVRMRmlsSDJQTkVUMS9kRnEzUzRFMVpud0lw?=
 =?utf-8?B?WGNGYUNOSWV5WTF1WVBwOGVTeWRWM3lDR3FnMXc3NHRHVkI0QVl1UEp5WDdX?=
 =?utf-8?B?MGE5QTcxem5HWU1wbEVPRndaT3U0QSs5V0NsMXE1M1hYVVlZSFg3NjBjcldO?=
 =?utf-8?B?VTRGNWlsZUhzeXNaWUtUcmFCSW9mOVQzanFNbVE1L2xvcHNtRkpnL3ZxZDVD?=
 =?utf-8?B?ejhHZ08rVHJXblRad0o4UGRtWXJXbUpqUlJINXhELzRDSG01N0Fyb0dIQ1Vk?=
 =?utf-8?B?Ynkzd3crRjFkc2tieVVlZ21ERWE2ajg0RHFsaG8wQy9PY00wVEtTamx6Z2JK?=
 =?utf-8?B?UXc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <509F19DB558E6B4185D63CBCD382648B@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3481e72e-d908-4062-ee94-08ddea45b448
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Sep 2025 17:25:25.4438 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Sc8QHa489dr6ZXSfdw5Layz8kOnNbcwhhNB/lPTXvkveJhVzjFw4kub7wE8rTf7PUcsF2UpWdRaNEC1oiEIo3ifUHslI6Dc9v3dvvZPmBbE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7886
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

T24gVHVlLCAyMDI1LTA5LTAyIGF0IDE1OjE3ICswMjAwLCBNaWNoYWwgV2FqZGVjemtvIHdyb3Rl
Og0KPiBUaGUgc3Vydml2YWJpbGl0eV9tb2RlIGF0dHJpYnV0ZSBpcyBhcHBsaWNhYmxlIG9ubHkg
Zm9yIERHRlggYW5kDQo+IHBsYXRmb3JtcyBuZXdlciB0aGFuIEJBVFRMRU1BR0UuIFVzZSAuaXNf
dmlzaWJsZSgpIGhvb2sgdG8gaGlkZQ0KPiB0aGlzIGF0dHJpYnV0ZSB3aGVuIGFib3ZlIGNvbmRp
dGlvbnMgYXJlIG5vdCBtZXQuIFJlbW92ZSBjb2RlIHRoYXQNCj4gd2FzIHRyeWluZyB0byBmaXgg
c3VjaCBjb25maWd1cmF0aW9uIGR1cmluZyB0aGUgcnVudGltZS4NCj4gDQo+IFNpZ25lZC1vZmYt
Ynk6IE1pY2hhbCBXYWpkZWN6a28gPG1pY2hhbC53YWpkZWN6a29AaW50ZWwuY29tPg0KPiBDYzog
THVjYXMgRGUgTWFyY2hpIDxsdWNhcy5kZW1hcmNoaUBpbnRlbC5jb20+DQo+IENjOiBSaWFuYSBU
YXVybyA8cmlhbmEudGF1cm9AaW50ZWwuY29tPg0KPiAtLS0NCj4gwqBkcml2ZXJzL2dwdS9kcm0v
eGUveGVfY29uZmlnZnMuY8KgwqDCoMKgwqDCoMKgwqDCoMKgIHwgMjQgKysrKysrLS0tLS0tLS0t
LS0tLS0NCj4gLS0NCj4gwqBkcml2ZXJzL2dwdS9kcm0veGUveGVfY29uZmlnZnMuaMKgwqDCoMKg
wqDCoMKgwqDCoMKgIHzCoCAyIC0tDQo+IMKgZHJpdmVycy9ncHUvZHJtL3hlL3hlX3N1cnZpdmFi
aWxpdHlfbW9kZS5jIHwgMTEgKy0tLS0tLS0tLQ0KPiDCoDMgZmlsZXMgY2hhbmdlZCwgNyBpbnNl
cnRpb25zKCspLCAzMCBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0veGUveGVfY29uZmlnZnMuYw0KPiBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9jb25maWdm
cy5jDQo+IGluZGV4IDQzZjAwMDI2MDc1Mi4uMDMzNzgxMTg2NGNkIDEwMDY0NA0KPiAtLS0gYS9k
cml2ZXJzL2dwdS9kcm0veGUveGVfY29uZmlnZnMuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0v
eGUveGVfY29uZmlnZnMuYw0KPiBAQCAtMzY5LDcgKzM2OSwxMiBAQCBzdGF0aWMgYm9vbCB4ZV9j
b25maWdfZGV2aWNlX2lzX3Zpc2libGUoc3RydWN0DQo+IGNvbmZpZ19pdGVtICppdGVtLA0KPiDC
oHsNCj4gwqDCoMKgwqDCoMKgwqDCoHN0cnVjdCB4ZV9jb25maWdfZ3JvdXBfZGV2aWNlICpkZXYg
PQ0KPiB0b194ZV9jb25maWdfZ3JvdXBfZGV2aWNlKGl0ZW0pOw0KPiDCoA0KPiAtwqDCoMKgwqDC
oMKgwqByZXR1cm4gZGV2LT5kZXNjOyAvKiBzaGFsbCBiZSBhbHdheXMgdHJ1ZSAqLw0KPiArwqDC
oMKgwqDCoMKgwqBpZiAoYXR0ciA9PSAmYXR0cl9zdXJ2aXZhYmlsaXR5X21vZGUpIHsNCj4gK8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGlmICghZGV2LT5kZXNjLT5pc19kZ2Z4IHx8IGRl
di0+ZGVzYy0+cGxhdGZvcm0gPA0KPiBYRV9CQVRUTEVNQUdFKQ0KPiArwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHJldHVybiBmYWxzZTsNCj4gK8KgwqDCoMKg
wqDCoMKgfQ0KPiArDQo+ICvCoMKgwqDCoMKgwqDCoHJldHVybiB0cnVlOw0KDQpXaHkgY2hhbmdl
IHRoZSByZXR1cm4gaGVyZT8gQ2FuIHdlIGVpdGhlciBsZWF2ZSB0aGlzIGFzIGRldi0+ZGVzYyBv
cg0Kb3RoZXJ3aXNlIHVzZSByZXR1cm4gdHJ1ZSBmb3IgdGhlIGluaXRpYWwgaW1wbGVtZW50YXRp
b24gKHByZXZpb3VzDQpwYXRjaCk/DQoNCkV2ZXJ5dGhpbmcgZWxzZSBpbiB0aGUgc2VyaWVzIGxv
b2tzIGdvb2QgdG8gbWUuIFRoaXMgZG9lcyBzZWVtIGxpa2UgYQ0KYmV0dGVyIHdheSB0byBhcHBy
b2FjaCB0aGlzLg0KDQpUaGFua3MsDQpTdHVhcnQNCg0KPiDCoH0NCj4gwqANCj4gwqBzdGF0aWMg
c3RydWN0IGNvbmZpZ2ZzX2dyb3VwX29wZXJhdGlvbnMgeGVfY29uZmlnX2RldmljZV9ncm91cF9v
cHMgPQ0KPiB7DQo+IEBAIC01NTgsMjMgKzU2Myw2IEBAIGJvb2wgeGVfY29uZmlnZnNfZ2V0X3N1
cnZpdmFiaWxpdHlfbW9kZShzdHJ1Y3QNCj4gcGNpX2RldiAqcGRldikNCj4gwqDCoMKgwqDCoMKg
wqDCoHJldHVybiBtb2RlOw0KPiDCoH0NCj4gwqANCj4gLS8qKg0KPiAtICogeGVfY29uZmlnZnNf
Y2xlYXJfc3Vydml2YWJpbGl0eV9tb2RlIC0gY2xlYXIgY29uZmlnZnMNCj4gc3Vydml2YWJpbGl0
eSBtb2RlDQo+IC0gKiBAcGRldjogcGNpIGRldmljZQ0KPiAtICovDQo+IC12b2lkIHhlX2NvbmZp
Z2ZzX2NsZWFyX3N1cnZpdmFiaWxpdHlfbW9kZShzdHJ1Y3QgcGNpX2RldiAqcGRldikNCj4gLXsN
Cj4gLcKgwqDCoMKgwqDCoMKgc3RydWN0IHhlX2NvbmZpZ19ncm91cF9kZXZpY2UgKmRldiA9DQo+
IGZpbmRfeGVfY29uZmlnX2dyb3VwX2RldmljZShwZGV2KTsNCj4gLQ0KPiAtwqDCoMKgwqDCoMKg
wqBpZiAoIWRldikNCj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHJldHVybjsNCj4g
LQ0KPiAtwqDCoMKgwqDCoMKgwqBndWFyZChtdXRleCkoJmRldi0+bG9jayk7DQo+IC3CoMKgwqDC
oMKgwqDCoGRldi0+Y29uZmlnLnN1cnZpdmFiaWxpdHlfbW9kZSA9IDA7DQo+IC0NCj4gLcKgwqDC
oMKgwqDCoMKgY29uZmlnX2dyb3VwX3B1dCgmZGV2LT5ncm91cCk7DQo+IC19DQo+IC0NCj4gwqAv
KioNCj4gwqAgKiB4ZV9jb25maWdmc19nZXRfZW5naW5lc19hbGxvd2VkIC0gZ2V0IGVuZ2luZSBh
bGxvd2VkIG1hc2sgZnJvbQ0KPiBjb25maWdmcw0KPiDCoCAqIEBwZGV2OiBwY2kgZGV2aWNlDQo+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfY29uZmlnZnMuaA0KPiBiL2RyaXZl
cnMvZ3B1L2RybS94ZS94ZV9jb25maWdmcy5oDQo+IGluZGV4IDU4YzhjMzE2NDAwMC4uMTQwMmU4
NjNiNzFjIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfY29uZmlnZnMuaA0K
PiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfY29uZmlnZnMuaA0KPiBAQCAtMTUsNyArMTUs
NiBAQCBpbnQgeGVfY29uZmlnZnNfaW5pdCh2b2lkKTsNCj4gwqB2b2lkIHhlX2NvbmZpZ2ZzX2V4
aXQodm9pZCk7DQo+IMKgdm9pZCB4ZV9jb25maWdmc19jaGVja19kZXZpY2Uoc3RydWN0IHBjaV9k
ZXYgKnBkZXYpOw0KPiDCoGJvb2wgeGVfY29uZmlnZnNfZ2V0X3N1cnZpdmFiaWxpdHlfbW9kZShz
dHJ1Y3QgcGNpX2RldiAqcGRldik7DQo+IC12b2lkIHhlX2NvbmZpZ2ZzX2NsZWFyX3N1cnZpdmFi
aWxpdHlfbW9kZShzdHJ1Y3QgcGNpX2RldiAqcGRldik7DQo+IMKgdTY0IHhlX2NvbmZpZ2ZzX2dl
dF9lbmdpbmVzX2FsbG93ZWQoc3RydWN0IHBjaV9kZXYgKnBkZXYpOw0KPiDCoGJvb2wgeGVfY29u
ZmlnZnNfZ2V0X3BzbWlfZW5hYmxlZChzdHJ1Y3QgcGNpX2RldiAqcGRldik7DQo+IMKgI2Vsc2UN
Cj4gQEAgLTIzLDcgKzIyLDYgQEAgc3RhdGljIGlubGluZSBpbnQgeGVfY29uZmlnZnNfaW5pdCh2
b2lkKSB7IHJldHVybg0KPiAwOyB9DQo+IMKgc3RhdGljIGlubGluZSB2b2lkIHhlX2NvbmZpZ2Zz
X2V4aXQodm9pZCkgeyB9DQo+IMKgc3RhdGljIGlubGluZSB2b2lkIHhlX2NvbmZpZ2ZzX2NoZWNr
X2RldmljZShzdHJ1Y3QgcGNpX2RldiAqcGRldikgew0KPiB9DQo+IMKgc3RhdGljIGlubGluZSBi
b29sIHhlX2NvbmZpZ2ZzX2dldF9zdXJ2aXZhYmlsaXR5X21vZGUoc3RydWN0IHBjaV9kZXYNCj4g
KnBkZXYpIHsgcmV0dXJuIGZhbHNlOyB9DQo+IC1zdGF0aWMgaW5saW5lIHZvaWQgeGVfY29uZmln
ZnNfY2xlYXJfc3Vydml2YWJpbGl0eV9tb2RlKHN0cnVjdA0KPiBwY2lfZGV2ICpwZGV2KSB7IH0N
Cj4gwqBzdGF0aWMgaW5saW5lIHU2NCB4ZV9jb25maWdmc19nZXRfZW5naW5lc19hbGxvd2VkKHN0
cnVjdCBwY2lfZGV2DQo+ICpwZGV2KSB7IHJldHVybiBVNjRfTUFYOyB9DQo+IMKgc3RhdGljIGlu
bGluZSBib29sIHhlX2NvbmZpZ2ZzX2dldF9wc21pX2VuYWJsZWQoc3RydWN0IHBjaV9kZXYNCj4g
KnBkZXYpIHsgcmV0dXJuIGZhbHNlOyB9DQo+IMKgI2VuZGlmDQo+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0veGUveGVfc3Vydml2YWJpbGl0eV9tb2RlLmMNCj4gYi9kcml2ZXJzL2dwdS9k
cm0veGUveGVfc3Vydml2YWJpbGl0eV9tb2RlLmMNCj4gaW5kZXggNzk0MjZlYTQ2ODYxLi4xOWEx
NzMyZTMzZDQgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9zdXJ2aXZhYmls
aXR5X21vZGUuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfc3Vydml2YWJpbGl0eV9t
b2RlLmMNCj4gQEAgLTI4NywxOSArMjg3LDEwIEBAIGJvb2wgeGVfc3Vydml2YWJpbGl0eV9tb2Rl
X2lzX3JlcXVlc3RlZChzdHJ1Y3QNCj4geGVfZGV2aWNlICp4ZSkNCj4gwqDCoMKgwqDCoMKgwqDC
oHUzMiBkYXRhOw0KPiDCoMKgwqDCoMKgwqDCoMKgYm9vbCBzdXJ2aXZhYmlsaXR5X21vZGU7DQo+
IMKgDQo+IC3CoMKgwqDCoMKgwqDCoGlmICghSVNfREdGWCh4ZSkgfHwgSVNfU1JJT1ZfVkYoeGUp
KQ0KPiArwqDCoMKgwqDCoMKgwqBpZiAoIUlTX0RHRlgoeGUpIHx8IElTX1NSSU9WX1ZGKHhlKSB8
fCB4ZS0+aW5mby5wbGF0Zm9ybSA8DQo+IFhFX0JBVFRMRU1BR0UpDQo+IMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgcmV0dXJuIGZhbHNlOw0KPiDCoA0KPiDCoMKgwqDCoMKgwqDCoMKg
c3Vydml2YWJpbGl0eV9tb2RlID0NCj4geGVfY29uZmlnZnNfZ2V0X3N1cnZpdmFiaWxpdHlfbW9k
ZShwZGV2KTsNCj4gLQ0KPiAtwqDCoMKgwqDCoMKgwqBpZiAoeGUtPmluZm8ucGxhdGZvcm0gPCBY
RV9CQVRUTEVNQUdFKSB7DQo+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBpZiAoc3Vy
dml2YWJpbGl0eV9tb2RlKSB7DQo+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgZGV2X2VycigmcGRldi0+ZGV2LCAiU3Vydml2YWJpbGl0eSBNb2RlIGlzDQo+
IG5vdCBzdXBwb3J0ZWQgb24gdGhpcyBjYXJkXG4iKTsNCj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqB4ZV9jb25maWdmc19jbGVhcl9zdXJ2aXZhYmlsaXR5
X21vZGUocGRldik7DQo+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqB9DQo+IC3CoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqByZXR1cm4gZmFsc2U7DQo+IC3CoMKgwqDCoMKgwqDC
oH0NCj4gLQ0KPiDCoMKgwqDCoMKgwqDCoMKgLyogRW5hYmxlIHN1cnZpdmFiaWxpdHkgbW9kZSBp
ZiBzZXQgdmlhIGNvbmZpZ2ZzICovDQo+IMKgwqDCoMKgwqDCoMKgwqBpZiAoc3Vydml2YWJpbGl0
eV9tb2RlKQ0KPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHJldHVybiB0cnVlOw0K
DQo=
