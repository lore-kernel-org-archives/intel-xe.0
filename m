Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF0E7C83F17
	for <intel-xe@archiver.kernel.org>; Tue, 15 Jul 2025 17:30:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 887A610E231;
	Tue, 15 Jul 2025 17:30:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fEFzDXjN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B45510E231
 for <intel-xe@lists.freedesktop.org>; Tue, 15 Jul 2025 17:30:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752600652; x=1784136652;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=3ImhNwgoNJyhWp72g5o1dX7KUbzPD4Y7CfNYCQBzarU=;
 b=fEFzDXjNLyxoiFA05VUlfn5lMpnGo/GYYQfRvADNrqOFz73jL/EZpP1y
 7COF5Sl1eQdqLYutmH1hmi1frwJ4JbzD+VyDCPNm2p9+9mKBkF3UWw8ud
 u+/1JUFznFh+zwv2sVyXqxMDHB+kBPmObnxqu99bHT97OmZvsPZrFq0yb
 bIPMS/me1IwLE8EDqPfx5Lk+V2czuaheRo89aJzi0cEKog8xWo/yDXLU/
 j+Tl/SWYejLqDuN6kk3Cq33NthnlyfKD2TOYqPgyJHo5+m8G3r20x/IFa
 vYihFe2nXNDL8ENQjkKeg9vihCnJVPc2ug/Hgpvo4qLNGb1PPbnnLIIc8 Q==;
X-CSE-ConnectionGUID: KokZnFdcRFKFXfQTsFsW8g==
X-CSE-MsgGUID: /Q05Kc6jTS6xgJoncPXzLg==
X-IronPort-AV: E=McAfee;i="6800,10657,11493"; a="54983623"
X-IronPort-AV: E=Sophos;i="6.16,313,1744095600"; d="scan'208";a="54983623"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2025 10:30:51 -0700
X-CSE-ConnectionGUID: Wbn2HvE0R5SDw4iRotkolQ==
X-CSE-MsgGUID: veKkdrj2T3+f4wSDI697lQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,313,1744095600"; d="scan'208";a="162926250"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2025 10:30:51 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 15 Jul 2025 10:30:50 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Tue, 15 Jul 2025 10:30:50 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (40.107.92.48) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 15 Jul 2025 10:30:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ukzi0lmObidF7J+RQ9C/Pe3kk6OC/M6bKofL1aT1J8o4/B7BSekjNf2fJTV6XnLfMgo0KmtDIU1f0t5pd5yOnZ7ilHfJnp67ROJctKHBas9pkFFO+ShnHOWiu0ETT4+wjvdqRMbIa34YF0Apwr9NBaG39VHpY35VoFR0px0KLXZDerrPE0xCcJ8rkkUv3WQ19mKK9fkIbQfikK0FsOg9xwwzqmQZMmDkmJoOUQ6NP9kbFF1Ddm/ceRTG8qR5guNIr6Me4iEJip9N/MncV4cQflq072Z2XqSH1tUUwUa/GvRp9ZvjJd/iUyXpL5lOfXt5gzWJT2FUKItp25y6JWZ6wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3ImhNwgoNJyhWp72g5o1dX7KUbzPD4Y7CfNYCQBzarU=;
 b=sgIlEg0qyBKtkmjIzUk4aEcADbHQ9iNjdQfDprJxaITC43C0br4J25tUOdnXJdjDAx/2H+DgyT5gjd80hqs6J1tftCT4CKsPMoCq8NBq5U65NcsUafiDZcj0MtBcT9++4jPEC4DfgH1I88Z54bh4UH2xQfay8Q++JJ1ou0pw6GoTfC55RcnDs0CKw+AH6VzdL6dqcfaCMfjgCGe/cmut6QvDOjHyErSLEz9W4N8jDutT/wXXDoo1N0rqujvVouFFLSPLCkkpWNRCBfQuSTUTKDkgDuKep4NJ+c/QY8/thEF2jG1q+AcdmWHgseHvsxeMMEtA5DNlLoGM5CaHyVgcog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 CO1PR11MB4834.namprd11.prod.outlook.com (2603:10b6:303:90::20) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8922.32; Tue, 15 Jul 2025 17:30:47 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b%3]) with mapi id 15.20.8922.028; Tue, 15 Jul 2025
 17:30:47 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Tauro, 
 Riana" <riana.tauro@intel.com>
CC: "Anirban, Sk" <sk.anirban@intel.com>, "Jadav, Raag"
 <raag.jadav@intel.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 "Scarbrough, Frank" <frank.scarbrough@intel.com>,
 "aravind.iddamsetty@linux.intel.com" <aravind.iddamsetty@linux.intel.com>,
 "Gupta, Anshuman" <anshuman.gupta@intel.com>, "De Marchi, Lucas"
 <lucas.demarchi@intel.com>, "Nerlige Ramappa, Umesh"
 <umesh.nerlige.ramappa@intel.com>
Subject: Re: [PATCH v3 3/7] drm/xe/xe_survivability: Add support for Runtime
 survivability mode
Thread-Topic: [PATCH v3 3/7] drm/xe/xe_survivability: Add support for Runtime
 survivability mode
Thread-Index: AQHb61fUF45e+ZRXTEiys71mYLUxv7QqISoAgAC+7ACACKWegA==
Date: Tue, 15 Jul 2025 17:30:46 +0000
Message-ID: <67abc9c91458903bc6f5014ac70f5208c0dfd1b2.camel@intel.com>
References: <20250702141118.3564242-1-riana.tauro@intel.com>
 <20250702141118.3564242-4-riana.tauro@intel.com>
 <0d56280d48bc707917bd1e11e3d93683a9de98f1.camel@intel.com>
 <de50743e-3d5c-4765-aa1f-4a61329c85a4@intel.com>
In-Reply-To: <de50743e-3d5c-4765-aa1f-4a61329c85a4@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5573:EE_|CO1PR11MB4834:EE_
x-ms-office365-filtering-correlation-id: 7f0a973a-b7ff-418b-4f73-08ddc3c555aa
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?ejh3NkVacE5UQUYwS0pkdDBZZER6Vm94QnQ2cWZYWmw3K1lrZVk1Q01IbU5p?=
 =?utf-8?B?bTg5a291ZVFYeUU0RHJ0cVRialFOTkVtODJ0dEJUMm13clhiaThJT2xDVEhn?=
 =?utf-8?B?YkZKK0swWjBYSEdqd2M5QVkvNUpjbzU0UXhVUldCdG9IOW1xc0Fod1ZzTnIx?=
 =?utf-8?B?a1kwVWhsT21YTSsyMHBtMjFBQUJ2TDVNM01UTWVySitDaW5YYnNMTHdQK1hN?=
 =?utf-8?B?OG4rVnJuNGloaGo5S2xBNmFxRExGN3Bjeno0QVhmcGdBTTRVZW00TGZRcm4x?=
 =?utf-8?B?Q2Yra3VFYXg5SGRnSElieC82VUhUeWhrZFNMOWx6d1c0elJsc1NBWVJyMVI1?=
 =?utf-8?B?VFJiVnZ6eitLTWtGREx2YVBxUzE5OFBLelZ4K3N5ckpnVDh6Q0lteHVxQ1hM?=
 =?utf-8?B?Z1gvb0swZTZrUkdjZFkzUys3NWlxSExmbVMyMzJmTjN0SEVUQm9Banhoc3VM?=
 =?utf-8?B?U3dRTHd5bGYzU2l3TXltM0s4YUJvTWMxYnNCR05nd3FDU2d0bWlmRitRSlpO?=
 =?utf-8?B?cWFIZGNZY1RYbGZWNFNwUWpkU2xqUDBhVkNKSzFOSmdHd2lwYlE5Qkc1bDNV?=
 =?utf-8?B?am5HWFU4NURaamcxQWJpaVY2eXBVaDZVN20wWHp5NU5QRS9PQ1UyRUdERjZs?=
 =?utf-8?B?a0xQQ3BjZysva3F1cDl5K2JrQzgyZUFmVTJGcS9WVHl1VVM5QXdoeTRobGhj?=
 =?utf-8?B?TzBVODNWZnd2RjJkMVhXbHU0YUtQbUh5NDlHaXZ6V3g0ODFoSEsxeVkzY25R?=
 =?utf-8?B?ejJWZ3YrV3JRTDBBa0p4SC9pUjVxN3RZcHAvWTRZTnZZQk0xUmh0cWRzMkNS?=
 =?utf-8?B?MUVuWVpRUnJ4eDg5aUhNd212YmJURHgrK3hLaTJzNmhacWhXV2lNUFpxOExU?=
 =?utf-8?B?VlhGM01BNTUvSjZhdDRPendLaXRPWVlWZXVFSlFrL21YUTd6a3NHMHNsRmVx?=
 =?utf-8?B?L0hPTG9pTHZOTERObWxqL0F0T1kyUm5EdWxhMUhmbXpjTkJDRlByRjRhRGor?=
 =?utf-8?B?TXNMU05MaVVXMVp3WW1HbU9henR1bVAwcyttNDl1b2o2Q0NNYU1Lc1QwTGtM?=
 =?utf-8?B?UWROeHhITkkrSzdWUlk4YTE3SW1Na1p6a0dJMHkzS1VFQnZEZlA3d3YzVGRh?=
 =?utf-8?B?VFZVaHpubzlHSlVnL1FJMWVYUVhZaXp2KzhSRzVTQzlKZEQ4N0xJUVovNlNG?=
 =?utf-8?B?SVF6d2RvREFqb2RWU2ZqTTNKeERMNXV3SG9UTGJybk5ybms1b1NQVWRPTWNE?=
 =?utf-8?B?ZkNBekxhRG43TTlDZFdsMmFveEE1K2UwTko2VDNxZWJTQ25YS2FhRm5INExP?=
 =?utf-8?B?TkVMYVZPOEw4R2hzRWpKSWFSc3BXajlOZDl2UUV2ODNCdE50Q3plMVFlREZV?=
 =?utf-8?B?b1BoS1p0YmxwZS9LZGhKOHYyZUo2ZXJ0SWpsNWdadnpLN2hNSlBJL3l3UVky?=
 =?utf-8?B?SElzWXJvZFFiRzZKK1NtY3RsSFBjNUtqbktLTHowd0FPYUtnNlFWQmRMZmkw?=
 =?utf-8?B?Z0duOTRoQkR0QUlUbWE5TEFiNk9md1RKTWdSRUFRWmNIL1o3SUczUW5rSE1o?=
 =?utf-8?B?TVJnbFlQTktMRkxxMFpCUW9WTG41Z0JTUHpVNmVGcEFxUS95azhEQTE3UkQr?=
 =?utf-8?B?d1h6aWpabnJDWHlzWDJrQTdsSmhOQlJRNnNFcWVPaEpLYVV1UDhBUFN0c0Iw?=
 =?utf-8?B?ZTViTXdvRlBHYy9mUXRFL1dBUlZxM0tIUFNwUWtMRmVrVHIzdTZXTkVNelhI?=
 =?utf-8?B?czVLbGJnWkdDSkRHNkN1WUZGNGdQUUwyUXFaZzc0R2xmRXVIWUJFbnZZSkJO?=
 =?utf-8?B?TDBpcWkrMjJ2U1ZlMmhjTUdPb0ZHQ0EvNWZiaXdxT1YxTTI0YTE1TWhDeTRt?=
 =?utf-8?B?Y0x1NklzNkNlclBQaW91QUlzaWV4ZzJlOXZnbGdCRkVkOGpiaDJoSXA2czY0?=
 =?utf-8?B?ZGZqYnd1aXpqY0k1YlRndExpMzNzTlBHNEVtRmJ1dnV2TmVyVnpKZm9kRzhP?=
 =?utf-8?B?Q25rSjkvcmJRPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SHlaVXMxZGZiM0pIOUk2S2x6bEJwd3RuQ3djelhiYmtMNTRrWkdVamFrTVpF?=
 =?utf-8?B?NFRsaUJBSU8vNHFLajVhS2lkVTZ0MEtzYWlxdXFkRFFrZ3Rjd3hvVk0xOTZx?=
 =?utf-8?B?VnZ4SWNyZWpCd3hrKzU2bUEyVFN3ZG1EbnlkSVNGSzFPVFBvbzh5K2VzTmpp?=
 =?utf-8?B?SmJuWUUwdDhFNklqdVowM3FVaFZMWEFWejQxVXNCUEYvMzAxelQ4ZDZoc3VW?=
 =?utf-8?B?N2VCUnRoWmoyRERBZUVFT08xbldzQmJaaEdHR1dqQ3FtaDhLcDJuR0xkTUla?=
 =?utf-8?B?UTRnTHkvVXlndFBmdDQ5K2N5K3lGblpPYzJFdjByTUVHeEFkdklONmZ5S3pR?=
 =?utf-8?B?RTVWK2kvdE1qVG1sdFJaWXZIeEJjdHA4UjRNQStuVlRjdFBEdWlLOHZrb1VC?=
 =?utf-8?B?alljRVV3dFhOcXVCMXp0dWFNajVzeFlhOUw4dzQ5L2xycHVtUTJaZUhzR1Bj?=
 =?utf-8?B?YlNOTVkrSEJpUU1SZVNVVWRHWDNQNlNhcm94VXJuQ1ZGQk1IZE9XbDUrcFRh?=
 =?utf-8?B?U05xNmZzeVR6dE03djdOUWdDWWNNR3BBSGZFNDVTLzRMZm03QndmN1VYaTRU?=
 =?utf-8?B?YzV5aVd2RjFiZ2NzNFhvcGk3clgwcnFzcXY2clc3Y21iK205MWJiTmJXWE5L?=
 =?utf-8?B?ZUhtNWhnSXBhZ3N5aCsxTG9UeXU4VGJNU0xnS21ZSUxJOG91ZWVZMU5aelJN?=
 =?utf-8?B?MUk2bWFodk13UVliMExZZm5QVCs0WGRVaWFqenJYZklBU3VsTGx1ZlpEdTlH?=
 =?utf-8?B?bEd3aFUwb01pcHRYM3FkZFJhd2s4cHdyTzByN1R0SXdwR0tITFVvbUdZQWE4?=
 =?utf-8?B?czUzM3RQZ2RWbGNMV2N1U2pvMlVoemJNOWQ3Y1A5MjBZTXJUd2tocmVSRE5z?=
 =?utf-8?B?aVhLTG5saFJvNWRxRW92aHVMeWZQMGpLUWM2M0h5NVYzVGpQODlnelcxSkl3?=
 =?utf-8?B?UEpGOGFIK3NUanhyeVczQjVQQUhRdDVsTHNjaFFMR1U1ZkdBVlpIMncxOStD?=
 =?utf-8?B?YVNwVVg0S3ZPREEycktGNGcrMi9XbGNxSURYOVgwUURVeVZESXhSVTI3dCs5?=
 =?utf-8?B?RXBHWHBqZmowc050VGtkdGhUejRxNW4zMlBvZ1V2SDRDYjZmKzhncUNrVGlY?=
 =?utf-8?B?K2NMV21vYXpRK2o1SzluVzdPS1V0NHBCRHVWTmJsMFNRbDhOT3NiWUNpQXgy?=
 =?utf-8?B?bldPVGFscVNnWlRkK3c2RTlJU2k0eUE2UWRJU1JteWsvVTNwRVQ5RndFUG03?=
 =?utf-8?B?U1NReElESGh6ZE9YNWR0SjdJanQyQWJKdmNsSnpIZHI0dFo0WlJBM0tRS3pv?=
 =?utf-8?B?NWVIV3FjOFNKNmFjcnlRMDk2K1cyMms4Yjg4MXNJNGh4bUFPa09NZm5mZ2M1?=
 =?utf-8?B?L05BeG1YZDA5TFdoNFpUaXljMUdFSjZHRGp3cXFZSUJjSzl1a0xuV2Q0VDBS?=
 =?utf-8?B?bTJBVWtyRHgvYXZFVVdwdmsreHRSNjNkV05seVZjUnBDNG5MeXlxQzBXbEZw?=
 =?utf-8?B?RzM0a3ZRMkhLdmRsaER3aUxkR2pPSktKUjM0SFZZS3lObmlCTk55RjBsQUtJ?=
 =?utf-8?B?R3crRmZuelUreGdvMDFBajJBUUxqZVo1eFlIZVNwZWNDZ09vdHg1ZFV5aE1p?=
 =?utf-8?B?RE1KTHhHRzNZNER0TXlTYUNvM1FGV1o2bXpLM0UvWlhtR293QWdKOHVIVURO?=
 =?utf-8?B?S1VlUFRwQXdCVEM1RUVkZ2hoUENFYmJhLzhwQXZuUUhlc1Iza2lKNHpNRDQ3?=
 =?utf-8?B?TTlFLzhzd1FKaERFeFB3UFlGUlRXVnlUeW9YQWhPbmNzeHZjeGtWaWpDTVdF?=
 =?utf-8?B?L3VxUC9PTGNpMmdlNkVrNzF6WVhDWUVla0NnN3dSa29tbkVoMWhjaG9QR0th?=
 =?utf-8?B?N0hMUVFyVXUvUDhrb3JqVlhNcWEzUmlqTU9mZGZzK3dZVkN6MVdKTGNXUHd5?=
 =?utf-8?B?NlhrdFlEQkxmekw4SHVTU21kRzRPM3VqN3I1cDVYbW9SVkR0MVFCVS9aa0Jq?=
 =?utf-8?B?elBrTzFwWW13WjNSKzlqSll3eGlURlNtZHlNUWpvZm1URlRkTld5YTFpb0RR?=
 =?utf-8?B?eElBUjJiNjUwM0liOWlhMDB6cURxVmRTNTJJWHJlMEhSQnQraG1taHp0ckd1?=
 =?utf-8?B?MERyTTg0MmtSeE5sZEtWZWdnY0Z1OVl6WjBqMXdQUVlNWXV0WHZxczFjUllI?=
 =?utf-8?B?TUE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <CF41EF1EDFDDEF4EB4C7F16AE6234687@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f0a973a-b7ff-418b-4f73-08ddc3c555aa
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jul 2025 17:30:46.9205 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hiKyK7nVIe8A62glUvjR9Cq16ch6QD7MrI8b2/PBv4cw5ou5zJlXj3GCFUQl0kd+b/3w/jf1JZVyi+2lD1KhbDeGKOWBTaXr/Y7wy6W9Jtw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4834
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

T24gVGh1LCAyMDI1LTA3LTEwIGF0IDEwOjU3ICswNTMwLCBSaWFuYSBUYXVybyB3cm90ZToNCj4g
SGkgU3R1YXJ0DQo+IA0KPiBPbiA3LzkvMjAyNSAxMTozNCBQTSwgU3VtbWVycywgU3R1YXJ0IHdy
b3RlOg0KPiA+IE9uIFdlZCwgMjAyNS0wNy0wMiBhdCAxOTo0MSArMDUzMCwgUmlhbmEgVGF1cm8g
d3JvdGU6DQo+ID4gPiBDZXJ0YWluIHJ1bnRpbWUgZmlybXdhcmUgZXJyb3JzIGNhbiBjYXVzZSB0
aGUgZGV2aWNlIHRvIGJlIHdlZGdlZA0KPiA+ID4gcmVxdWlyaW5nIGEgZmlybXdhcmUgZmxhc2gg
dG8gcmVzdG9yZSBub3JtYWwgb3BlcmF0aW9uLg0KPiA+ID4gUnVudGltZSBTdXJ2aXZhYmlsaXR5
IE1vZGUgaW5kaWNhdGVzIHRoYXQgYSBmaXJtd2FyZSBmbGFzaCBpcw0KPiA+ID4gbmVjZXNzYXJ5
IHRvDQo+ID4gPiByZWNvdmVyIHRoZSBkZXZpY2UuDQo+ID4gDQo+ID4gSSdtIG5vdCB1bmRlcnN0
YW5kaW5nIHdoeSB3ZSBuZWVkIHRvIG92ZXJsb2FkIHN1cnZpdmFiaWxpdHkgbW9kZQ0KPiA+IGhl
cmUNCj4gPiBpbiB0aGUgY2FzZSBvZiBhIENTQyAob3Igb3RoZXIgaGFyZHdhcmUgZXJyb3IpIGZh
aWx1cmUuIEkgc2VlIHRoZXJlDQo+ID4gaXMNCj4gPiBzb21lIHZlc2MgaW5pdGlhbGl6YXRpb24g
dGhhdCBoYXBwZW5zIHRoZXJlIGFuZCBHU0MgaW5pdGlhbGl6YXRpb24NCj4gPiAobmVlZCB0byBs
b29rIGZ1cnRoZXIsIGJ1dCBwcmVzdW1hYmx5IHRoaXMgcHV0cyBHU0MgaW4gYQ0KPiA+IHN1cnZp
dmFiaWxpdHkNCj4gPiBzdGF0ZSBhbHNvPykuIEJ1dCB3ZSBhbHJlYWR5IGhhdmUgdGhlIHZlbmRv
ciBzcGVjaWZpYyB3ZWRnZS4gRG8gd2UNCj4gPiByZWFsbHkgbmVlZCB0aGUgZXh0cmEgaG9vayB0
byBzdXJ2aXZhYmlsaXR5IG1vZGUgd2hpY2ggd2FzIHJlYWxseQ0KPiA+IGJ1aWx0DQo+ID4gYXMg
YSBib290IHRpbWUgY29uZmlnLg0KPiANCj4gdmVuZG9yLXNwZWNpZmljIHdpdGhvdXQgYSByZWFz
b24gaXMgdmFndWUgYW5kIGNvdWxkIGJlIHJldXNlZCBmb3IgYSANCj4gZGlmZmVyZW50IGFjdGlv
biBpbiB0aGUgZnV0dXJlLiBUaGVyZSBuZWVkcyB0byBiZSBhIGluZGljYXRpb24gdGhhdA0KPiB0
aGlzIA0KPiB3ZWRnZWQgdWV2ZW50IGluZGljYXRlcyBmaXJtd2FyZSBmbGFzaC4gU28gdGhlIHN1
cnZpdmFiaWxpdHkgbW9kZQ0KPiBzeXNmcw0KPiANCj4gVGhpcyBwYXRjaCB3aWxsIGZ1cnRoZXIg
YmUgZXh0ZW5kZWQgdG8gaGFuZGxlIGQzY29sZCByZXN1bWUgcGNvZGUgDQo+IGZhaWx1cmVzIHdo
aWNoIHdpbGwgc2VuZCBhIHNpbWlsYXIgd2VkZ2VkIGV2ZW50IGFuZCBzdXJ2aXZhYmlsaXR5DQo+
IG1vZGUNCg0KSSBrbm93IHlvdSBoYXZlIHRoZSBuZXcgc2VyaWVzIHVwLCBidXQganVzdCBjb21p
bmcgYmFjayB0byBjb25maXJtLi4uDQphY2sgZnJvbSBtZSBoZXJlLiBBbmQganVzdCBmb3IgbXkg
dW5kZXJzdGFuZGluZywgYmFzaWNhbGx5IHRoZSBpZGVhIGlzDQp3ZSBzZW5kIHRoZSB1ZXZlbnQs
IHRoZW4gc2V0IHRoZSAic3RhdGUiIG9mIHRoZSBkcml2ZXIvaGFyZHdhcmUgYnkNCnRyaWdnZXJp
bmcgc3Vydml2YWJpbGl0eSBydW50aW1lIG1vZGUuIFRoZSB1c2VyIGNhbiB0aGVuIHVzZSB0aGlz
IHN5c2ZzDQpzdGF0ZSB0byBkZXRlcm1pbmUgdGhhdCBhIHJlY292ZXJ5IG9mIHNvbWUga2luZCBp
cyBuZWVkZWQgLSBpbiB0aGlzDQpjYXNlIGZpcm13YXJlIGZsYXNoIGFuZC4uLiByZS1lbnVtZXJh
dGlvbj8gc29mdCByZXNldD8gb3IganVzdCBhIGRyaXZlcg0KcmVsb2FkPw0KDQpUaGFua3MsDQpT
dHVhcnQNCg0KPiANCj4gVGhhbmtzDQo+IFJpYW5hPg0KPiA+IFRoYW5rcywNCj4gPiBTdHVhcnQN
Cj4gPiANCj4gPiA+IA0KPiA+ID4gVGhlIGJlbG93IHN5c2ZzIGlzIGFuIGluZGljYXRpb24gdGhh
dCBkZXZpY2UgaXMgaW4gc3Vydml2YWJpbGl0eQ0KPiA+ID4gbW9kZQ0KPiA+ID4gDQo+ID4gPiAv
c3lzL2J1cy9wY2kvZGV2aWNlcy88ZGV2aWNlPi9zdXJpdmFiaWxpdHlfbW9kZQ0KPiA+ID4gDQo+
ID4gPiBTaWduZWQtb2ZmLWJ5OiBSaWFuYSBUYXVybyA8cmlhbmEudGF1cm9AaW50ZWwuY29tPg0K
PiA+ID4gLS0tDQo+ID4gPiDCoMKgZHJpdmVycy9ncHUvZHJtL3hlL3hlX2RldmljZS5jwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoCAyICstDQo+ID4gPiDCoMKgZHJpdmVycy9ncHUv
ZHJtL3hlL3hlX3N1cnZpdmFiaWxpdHlfbW9kZS5jwqDCoMKgIHwgMjYNCj4gPiA+ICsrKysrKysr
KysrKysrKystDQo+ID4gPiAtLQ0KPiA+ID4gwqDCoGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9zdXJ2
aXZhYmlsaXR5X21vZGUuaMKgwqDCoCB8wqAgNCArKy0NCj4gPiA+IMKgwqAuLi4vZ3B1L2RybS94
ZS94ZV9zdXJ2aXZhYmlsaXR5X21vZGVfdHlwZXMuaMKgIHzCoCA4ICsrKysrKw0KPiA+ID4gwqDC
oDQgZmlsZXMgY2hhbmdlZCwgMzUgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkNCj4gPiA+
IA0KPiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9kZXZpY2UuYw0KPiA+
ID4gYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfZGV2aWNlLmMNCj4gPiA+IGluZGV4IDRhMzg0ODZk
Y2NjOC4uNWRlZmE1NGNjZDI2IDEwMDY0NA0KPiA+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hl
L3hlX2RldmljZS5jDQo+ID4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfZGV2aWNlLmMN
Cj4gPiA+IEBAIC03MTYsNyArNzE2LDcgQEAgaW50IHhlX2RldmljZV9wcm9iZV9lYXJseShzdHJ1
Y3QgeGVfZGV2aWNlDQo+ID4gPiAqeGUpDQo+ID4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgICogcG9zc2libGUsIGJ1dCBzdGlsbCByZXR1cm4gdGhlIHByZXZpb3VzIGVycm9y
DQo+ID4gPiBmb3INCj4gPiA+IGVycm9yDQo+ID4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgICogcHJvcGFnYXRpb24NCj4gPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgKi8NCj4gPiA+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBlcnIgPSB4
ZV9zdXJ2aXZhYmlsaXR5X21vZGVfZW5hYmxlKHhlKTsNCj4gPiA+ICvCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqBlcnIgPSB4ZV9zdXJ2aXZhYmlsaXR5X21vZGVfZW5hYmxlKHhlLA0KPiA+
ID4gWEVfU1VSVklWQUJJTElUWV9UWVBFX0JPT1QpOw0KPiA+ID4gwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoGlmIChlcnIpDQo+ID4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHJldHVybiBlcnI7DQo+ID4gPiDCoCANCj4gPiA+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfc3Vydml2YWJpbGl0eV9tb2RlLmMNCj4g
PiA+IGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3N1cnZpdmFiaWxpdHlfbW9kZS5jDQo+ID4gPiBp
bmRleCAxZjcxMGIzZmM1OTkuLmUxYWRjYjMzYzliMCAxMDA2NDQNCj4gPiA+IC0tLSBhL2RyaXZl
cnMvZ3B1L2RybS94ZS94ZV9zdXJ2aXZhYmlsaXR5X21vZGUuYw0KPiA+ID4gKysrIGIvZHJpdmVy
cy9ncHUvZHJtL3hlL3hlX3N1cnZpdmFiaWxpdHlfbW9kZS5jDQo+ID4gPiBAQCAtMTI5LDcgKzEy
OSwxMCBAQCBzdGF0aWMgc3NpemVfdA0KPiA+ID4gc3Vydml2YWJpbGl0eV9tb2RlX3Nob3coc3Ry
dWN0DQo+ID4gPiBkZXZpY2UgKmRldiwNCj4gPiA+IMKgwqDCoMKgwqDCoMKgwqDCoHN0cnVjdCB4
ZV9zdXJ2aXZhYmlsaXR5X2luZm8gKmluZm8gPSBzdXJ2aXZhYmlsaXR5LQ0KPiA+ID4gPmluZm87
DQo+ID4gPiDCoMKgwqDCoMKgwqDCoMKgwqBpbnQgaW5kZXggPSAwLCBjb3VudCA9IDA7DQo+ID4g
PiDCoCANCj4gPiA+IC3CoMKgwqDCoMKgwqDCoGZvciAoaW5kZXggPSAwOyBpbmRleCA8IE1BWF9T
Q1JBVENIX01NSU87IGluZGV4KyspIHsNCj4gPiA+ICvCoMKgwqDCoMKgwqDCoGNvdW50ICs9IHN5
c2ZzX2VtaXRfYXQoYnVmZiwgY291bnQsICJTdXJ2aXZhYmlsaXR5IG1vZGU6DQo+ID4gPiAlc1xu
IiwNCj4gPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIHN1cnZpdmFiaWxpdHktPnR5cGUgPyAiUnVudGltZSIgOg0KPiA+ID4gIkJv
b3QiKTsNCj4gPiA+ICsNCj4gPiA+ICvCoMKgwqDCoMKgwqDCoGZvciAoaW5kZXggPSAwOyBzdXJ2
aXZhYmlsaXR5LT5ib290X3N0YXR1cyAmJiBpbmRleCA8DQo+ID4gPiBNQVhfU0NSQVRDSF9NTUlP
OyBpbmRleCsrKSB7DQo+ID4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgaWYg
KGluZm9baW5kZXhdLnJlZykNCj4gPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgY291bnQgKz0gc3lzZnNfZW1pdF9hdChidWZmLCBjb3VudCwgIiVz
Og0KPiA+ID4gMHgleA0KPiA+ID4gLSAweCV4XG4iLCBpbmZvW2luZGV4XS5uYW1lLA0KPiA+ID4g
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBpbmZvW2luZGV4XS5yZWcsDQo+
ID4gPiBpbmZvW2luZGV4XS52YWx1ZSk7DQo+ID4gPiBAQCAtMTY5LDYgKzE3MiwxMCBAQCBzdGF0
aWMgaW50IGVuYWJsZV9zdXJ2aXZhYmlsaXR5X21vZGUoc3RydWN0DQo+ID4gPiBwY2lfZGV2ICpw
ZGV2KQ0KPiA+ID4gwqDCoMKgwqDCoMKgwqDCoMKgaWYgKHJldCkNCj4gPiA+IMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqByZXR1cm4gcmV0Ow0KPiA+ID4gwqAgDQo+ID4gPiArwqDC
oMKgwqDCoMKgwqAvKiBPbmx5IGNyZWF0ZSBzeXNmcyBmb3IgcnVudGltZSBzdXJ2aXZhYmlsaXR5
IG1vZGUgKi8NCj4gPiA+ICvCoMKgwqDCoMKgwqDCoGlmICh4ZV9zdXJ2aXZhYmlsaXR5X21vZGVf
aXNfcnVudGltZSh4ZSkpDQo+ID4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcmV0
dXJuIDA7DQo+ID4gPiArDQo+ID4gPiDCoMKgwqDCoMKgwqDCoMKgwqAvKiBNYWtlIHN1cmUgeGVf
aGVjaV9nc2NfaW5pdCgpIGtub3dzIGFib3V0DQo+ID4gPiBzdXJ2aXZhYmlsaXR5DQo+ID4gPiBt
b2RlICovDQo+ID4gPiDCoMKgwqDCoMKgwqDCoMKgwqBzdXJ2aXZhYmlsaXR5LT5tb2RlID0gdHJ1
ZTsNCj4gPiA+IMKgIA0KPiA+ID4gQEAgLTE4OSw2ICsxOTYsMTcgQEAgc3RhdGljIGludCBlbmFi
bGVfc3Vydml2YWJpbGl0eV9tb2RlKHN0cnVjdA0KPiA+ID4gcGNpX2RldiAqcGRldikNCj4gPiA+
IMKgwqDCoMKgwqDCoMKgwqDCoHJldHVybiAwOw0KPiA+ID4gwqDCoH0NCj4gPiA+IMKgIA0KPiA+
ID4gKy8qKg0KPiA+ID4gKyAqIHhlX3N1cnZpdmFiaWxpdHlfbW9kZV9pc19ydW50aW1lIC0gY2hl
Y2sgaWYgc3Vydml2YWJpbGl0eQ0KPiA+ID4gbW9kZSBpcw0KPiA+ID4gcnVudGltZQ0KPiA+ID4g
KyAqIEB4ZTogeGUgZGV2aWNlIGluc3RhbmNlDQo+ID4gPiArICoNCj4gPiA+ICsgKiBSZXR1cm5z
IHRydWUgaWYgaW4gcnVudGltZSBzdXJ2aXZhYmlsaXR5IG1vZGUsIGZhbHNlDQo+ID4gPiBvdGhl
cndpc2UNCj4gPiA+ICsgKi8NCj4gPiA+ICtib29sIHhlX3N1cnZpdmFiaWxpdHlfbW9kZV9pc19y
dW50aW1lKHN0cnVjdCB4ZV9kZXZpY2UgKnhlKQ0KPiA+ID4gK3sNCj4gPiA+ICvCoMKgwqDCoMKg
wqDCoHJldHVybiB4ZS0+c3Vydml2YWJpbGl0eS50eXBlID09DQo+ID4gPiBYRV9TVVJWSVZBQklM
SVRZX1RZUEVfUlVOVElNRTsNCj4gPiA+ICt9DQo+ID4gPiArDQo+ID4gPiDCoMKgLyoqDQo+ID4g
PiDCoMKgICogeGVfc3Vydml2YWJpbGl0eV9tb2RlX2lzX2VuYWJsZWQgLSBjaGVjayBpZiBzdXJ2
aXZhYmlsaXR5DQo+ID4gPiBtb2RlIGlzDQo+ID4gPiBlbmFibGVkDQo+ID4gPiDCoMKgICogQHhl
OiB4ZSBkZXZpY2UgaW5zdGFuY2UNCj4gPiA+IEBAIC0yNTEsMTYgKzI2OSwxOCBAQCBib29sDQo+
ID4gPiB4ZV9zdXJ2aXZhYmlsaXR5X21vZGVfaXNfcmVxdWVzdGVkKHN0cnVjdA0KPiA+ID4geGVf
ZGV2aWNlICp4ZSkNCj4gPiA+IMKgwqAgKiBSZXR1cm46IDAgaWYgc3Vydml2YWJpbGl0eSBtb2Rl
IGlzIGVuYWJsZWQgb3Igbm90IHJlcXVlc3RlZDsNCj4gPiA+IG5lZ2F0aXZlIGVycm9yDQo+ID4g
PiDCoMKgICogY29kZSBvdGhlcndpc2UuDQo+ID4gPiDCoMKgICovDQo+ID4gPiAtaW50IHhlX3N1
cnZpdmFiaWxpdHlfbW9kZV9lbmFibGUoc3RydWN0IHhlX2RldmljZSAqeGUpDQo+ID4gPiAraW50
IHhlX3N1cnZpdmFiaWxpdHlfbW9kZV9lbmFibGUoc3RydWN0IHhlX2RldmljZSAqeGUsIGNvbnN0
DQo+ID4gPiBlbnVtDQo+ID4gPiB4ZV9zdXJ2aXZhYmlsaXR5X3R5cGUgdHlwZSkNCj4gPiA+IMKg
wqB7DQo+ID4gPiDCoMKgwqDCoMKgwqDCoMKgwqBzdHJ1Y3QgeGVfc3Vydml2YWJpbGl0eSAqc3Vy
dml2YWJpbGl0eSA9ICZ4ZS0NCj4gPiA+ID5zdXJ2aXZhYmlsaXR5Ow0KPiA+ID4gwqDCoMKgwqDC
oMKgwqDCoMKgc3RydWN0IHhlX3N1cnZpdmFiaWxpdHlfaW5mbyAqaW5mbzsNCj4gPiA+IMKgwqDC
oMKgwqDCoMKgwqDCoHN0cnVjdCBwY2lfZGV2ICpwZGV2ID0gdG9fcGNpX2Rldih4ZS0+ZHJtLmRl
dik7DQo+ID4gPiDCoCANCj4gPiA+IC3CoMKgwqDCoMKgwqDCoGlmICgheGVfc3Vydml2YWJpbGl0
eV9tb2RlX2lzX3JlcXVlc3RlZCh4ZSkpDQo+ID4gPiArwqDCoMKgwqDCoMKgwqBpZiAoIXhlX3N1
cnZpdmFiaWxpdHlfbW9kZV9pc19yZXF1ZXN0ZWQoeGUpICYmDQo+ID4gPiArwqDCoMKgwqDCoMKg
wqDCoMKgwqAgdHlwZSAhPSBYRV9TVVJWSVZBQklMSVRZX1RZUEVfUlVOVElNRSkNCj4gPiA+IMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqByZXR1cm4gMDsNCj4gPiA+IMKgIA0KPiA+
ID4gwqDCoMKgwqDCoMKgwqDCoMKgc3Vydml2YWJpbGl0eS0+c2l6ZSA9IE1BWF9TQ1JBVENIX01N
SU87DQo+ID4gPiArwqDCoMKgwqDCoMKgwqBzdXJ2aXZhYmlsaXR5LT50eXBlID0gdHlwZTsNCj4g
PiA+IMKgIA0KPiA+ID4gwqDCoMKgwqDCoMKgwqDCoMKgaW5mbyA9IGRldm1fa2NhbGxvYyh4ZS0+
ZHJtLmRldiwgc3Vydml2YWJpbGl0eS0+c2l6ZSwNCj4gPiA+IHNpemVvZigqaW5mbyksDQo+ID4g
PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCBHRlBfS0VSTkVMKTsNCj4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVf
c3Vydml2YWJpbGl0eV9tb2RlLmgNCj4gPiA+IGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3N1cnZp
dmFiaWxpdHlfbW9kZS5oDQo+ID4gPiBpbmRleCAwMjIzMWMyYmYwMDguLjU1OWQxZTk5YjAzYSAx
MDA2NDQNCj4gPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9zdXJ2aXZhYmlsaXR5X21v
ZGUuaA0KPiA+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3N1cnZpdmFiaWxpdHlfbW9k
ZS5oDQo+ID4gPiBAQCAtOSw5ICs5LDExIEBADQo+ID4gPiDCoMKgI2luY2x1ZGUgPGxpbnV4L3R5
cGVzLmg+DQo+ID4gPiDCoCANCj4gPiA+IMKgwqBzdHJ1Y3QgeGVfZGV2aWNlOw0KPiA+ID4gK2Vu
dW0geGVfc3Vydml2YWJpbGl0eV90eXBlOw0KPiA+ID4gwqAgDQo+ID4gPiAtaW50IHhlX3N1cnZp
dmFiaWxpdHlfbW9kZV9lbmFibGUoc3RydWN0IHhlX2RldmljZSAqeGUpOw0KPiA+ID4gK2ludCB4
ZV9zdXJ2aXZhYmlsaXR5X21vZGVfZW5hYmxlKHN0cnVjdCB4ZV9kZXZpY2UgKnhlLCBjb25zdA0K
PiA+ID4gZW51bQ0KPiA+ID4geGVfc3Vydml2YWJpbGl0eV90eXBlKTsNCj4gPiA+IMKgwqBib29s
IHhlX3N1cnZpdmFiaWxpdHlfbW9kZV9pc19lbmFibGVkKHN0cnVjdCB4ZV9kZXZpY2UgKnhlKTsN
Cj4gPiA+ICtib29sIHhlX3N1cnZpdmFiaWxpdHlfbW9kZV9pc19ydW50aW1lKHN0cnVjdCB4ZV9k
ZXZpY2UgKnhlKTsNCj4gPiA+IMKgwqBib29sIHhlX3N1cnZpdmFiaWxpdHlfbW9kZV9pc19yZXF1
ZXN0ZWQoc3RydWN0IHhlX2RldmljZSAqeGUpOw0KPiA+ID4gwqAgDQo+ID4gPiDCoMKgI2VuZGlm
IC8qIF9YRV9TVVJWSVZBQklMSVRZX01PREVfSF8gKi8NCj4gPiA+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0veGUveGVfc3Vydml2YWJpbGl0eV9tb2RlX3R5cGVzLmgNCj4gPiA+IGIvZHJp
dmVycy9ncHUvZHJtL3hlL3hlX3N1cnZpdmFiaWxpdHlfbW9kZV90eXBlcy5oDQo+ID4gPiBpbmRl
eCAxOWQ0MzNlMjUzZGYuLjAxZjA3ZDljNDEyNCAxMDA2NDQNCj4gPiA+IC0tLSBhL2RyaXZlcnMv
Z3B1L2RybS94ZS94ZV9zdXJ2aXZhYmlsaXR5X21vZGVfdHlwZXMuaA0KPiA+ID4gKysrIGIvZHJp
dmVycy9ncHUvZHJtL3hlL3hlX3N1cnZpdmFiaWxpdHlfbW9kZV90eXBlcy5oDQo+ID4gPiBAQCAt
OSw2ICs5LDExIEBADQo+ID4gPiDCoMKgI2luY2x1ZGUgPGxpbnV4L2xpbWl0cy5oPg0KPiA+ID4g
wqDCoCNpbmNsdWRlIDxsaW51eC90eXBlcy5oPg0KPiA+ID4gwqAgDQo+ID4gPiArZW51bSB4ZV9z
dXJ2aXZhYmlsaXR5X3R5cGUgew0KPiA+ID4gK8KgwqDCoMKgwqDCoMKgWEVfU1VSVklWQUJJTElU
WV9UWVBFX0JPT1QsDQo+ID4gPiArwqDCoMKgwqDCoMKgwqBYRV9TVVJWSVZBQklMSVRZX1RZUEVf
UlVOVElNRSwNCj4gPiA+ICt9Ow0KPiA+ID4gKw0KPiA+ID4gwqDCoHN0cnVjdCB4ZV9zdXJ2aXZh
YmlsaXR5X2luZm8gew0KPiA+ID4gwqDCoMKgwqDCoMKgwqDCoMKgY2hhciBuYW1lW05BTUVfTUFY
XTsNCj4gPiA+IMKgwqDCoMKgwqDCoMKgwqDCoHUzMiByZWc7DQo+ID4gPiBAQCAtMzAsNiArMzUs
OSBAQCBzdHJ1Y3QgeGVfc3Vydml2YWJpbGl0eSB7DQo+ID4gPiDCoCANCj4gPiA+IMKgwqDCoMKg
wqDCoMKgwqDCoC8qKiBAbW9kZTogYm9vbGVhbiB0byBpbmRpY2F0ZSBzdXJ2aXZhYmlsaXR5IG1v
ZGUgKi8NCj4gPiA+IMKgwqDCoMKgwqDCoMKgwqDCoGJvb2wgbW9kZTsNCj4gPiA+ICsNCj4gPiA+
ICvCoMKgwqDCoMKgwqDCoC8qKiBAdHlwZTogc3Vydml2YWJpbGl0eSBtb2RlIHR5cGUgKGJvb3Qg
b3IgcnVudGltZSkgKi8NCj4gPiA+ICvCoMKgwqDCoMKgwqDCoGVudW0geGVfc3Vydml2YWJpbGl0
eV90eXBlIHR5cGU7DQo+ID4gPiDCoMKgfTsNCj4gPiA+IMKgIA0KPiA+ID4gwqDCoCNlbmRpZiAv
KiBfWEVfU1VSVklWQUJJTElUWV9NT0RFX1RZUEVTX0hfICovDQo+ID4gDQo+IA0KPiANCj4gDQoN
Cg==
