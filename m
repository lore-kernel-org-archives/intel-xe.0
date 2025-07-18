Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FE36C83F17
	for <intel-xe@archiver.kernel.org>; Fri, 18 Jul 2025 14:17:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E10A10E9C7;
	Fri, 18 Jul 2025 14:17:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RAwd1DAL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD44710E046
 for <intel-xe@lists.freedesktop.org>; Fri, 18 Jul 2025 14:17:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752848233; x=1784384233;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=s9JWuE+1E08BW5oqZ9fD13KkeP/O/xXa+kLgcI+4Ygo=;
 b=RAwd1DAL0ginFbw2rH7mc2f21ASxEvcaFvChYXG1fgmvQJUiz3e57eFv
 0XKalKSjEW0RCbrxUoTUASvZUXZ7kvFyhxpocxEzq0deQc4nhn6LWrDJV
 PQF7K4n7RabZRdCXEDafVFl6pRh6VMRFxYtzSrXrcxLIWDJyqUSF95Gmh
 B8Q92C1a0ThidQOhfUcG3tGRR9/GWFo/In42Cbg3fXyetbJwQV3QYO63C
 FhTd50VDMTkUpFmKxs0pL5VJ3XlyKK+eDHAw8xNnligbg7EMyjgldAytS
 MoAhMJAbSkQuBde9HoSHGWImDdw38AYZyR8KSMFZqdpkAaWhVhReBTxNO A==;
X-CSE-ConnectionGUID: ANjs34bdRD2dsUr+IfkrlQ==
X-CSE-MsgGUID: Pje/OIkITYyCecMNGF1q1Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11496"; a="66592724"
X-IronPort-AV: E=Sophos;i="6.16,321,1744095600"; d="scan'208";a="66592724"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jul 2025 07:17:12 -0700
X-CSE-ConnectionGUID: jsan1O1tQpy7JyRjQgGAbQ==
X-CSE-MsgGUID: +WeLwxuNRreEy3Sj0j8rjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,321,1744095600"; d="scan'208";a="189023067"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jul 2025 07:17:12 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Fri, 18 Jul 2025 07:17:10 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Fri, 18 Jul 2025 07:17:10 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (40.107.95.84) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Fri, 18 Jul 2025 07:17:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rSxMm1OuvA6Fw/ecZwaL8JMYxMia4XdWefqVXifTio8FH8OFf24G6E6d7XjttuD/wYmZHEKyv4xj8z/E9pXmSctIsqnb986HYNXQ7KsW+WvHE/rHU3/YAWndwfxjpOEyFr1H2dhdwy7SjAjfBIHRpux7H5AQsCeslUlACQGhgLT4qe2SxzEQ8HWAjB5r9xR8fioM8CZFBsdI5OnSadTgGTCZTptu+PP77lK7TLz4X5K4/PBbc6ge6h/oJPgq/8zvPrFsPKoV6jJyDKeLufoqe4mXSpm7efQoNbWkH773z5oSe4IZdKGbCotfYK7c3gMBJQuYipZsJr3Fytve2aQg4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s9JWuE+1E08BW5oqZ9fD13KkeP/O/xXa+kLgcI+4Ygo=;
 b=mKBSjrBy1Am98k/cZBnya1E/PyUaGR1Gk7YfPlPPi2RMP9jvQAqry9qRnR1hzl0GK/YJtATb5snyzVC4/yum9FI1Kzc8HjCjSj2uhA1Z+RdUrdnEV7aHoTyXjjN9khBlV89Jed7t9rVfGGszFddi7qAkOTHBrHPkxDw0w80dmJPgdrRyOiT9M019wRU7TrHzWKBvInWSEc6gYhETuBQ0os3aUwIoDchS5/avi/NB7/E18t7MOkERpDPEoKe3pq0dIAhYdj0ObHoSZyKU7w50abf3zUDj+60Vebc+1HHoxVmGHhK7H8eHQcgTfjXZTE/nCCKxniPWtHeGlfFyuO4C6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by IA4PR11MB9251.namprd11.prod.outlook.com (2603:10b6:208:56f::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.35; Fri, 18 Jul
 2025 14:16:54 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%7]) with mapi id 15.20.8922.037; Fri, 18 Jul 2025
 14:16:54 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "De Marchi, Lucas" <lucas.demarchi@intel.com>, "Cavitt, Jonathan"
 <jonathan.cavitt@intel.com>
Subject: RE: [PATCH 2/5] drm/xe/configfs: Enforce canonical device names
Thread-Topic: [PATCH 2/5] drm/xe/configfs: Enforce canonical device names
Thread-Index: AQHb90t0cyp+TfGyBkWewThTOsvuBbQ2wDEggADXzQCAAFSO0A==
Date: Fri, 18 Jul 2025 14:16:54 +0000
Message-ID: <CH0PR11MB54449EA2C5D8C889726D5541E550A@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20250717184825.851-1-michal.wajdeczko@intel.com>
 <20250717184825.851-3-michal.wajdeczko@intel.com>
 <CH0PR11MB5444B56DB80D45010E720F8FE551A@CH0PR11MB5444.namprd11.prod.outlook.com>
 <8741334c-1582-488f-82c7-41d1a998f879@intel.com>
In-Reply-To: <8741334c-1582-488f-82c7-41d1a998f879@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|IA4PR11MB9251:EE_
x-ms-office365-filtering-correlation-id: 270d92e5-4102-4bab-0c22-08ddc605bf6c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|10070799003|366016|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?M0laVkhKZ2owQVZ2aVFxbHFNUUlJaEdiZFpLSzUveE5UZkVuWkIzdnhxdWw1?=
 =?utf-8?B?R1ROQmxkZCt0K0k2Y3oreGlJaUJ0a3J3Y3NyVzFXQkNBY09DVE1XeWNydkVi?=
 =?utf-8?B?NWFqVENSeHJvNTJmTTBOTEJtMjRvZ3VLcVRnaTZBeVp1NklTNENHU3Zud0xq?=
 =?utf-8?B?MmNpWFN0SlMyYXhqTFdzRStFVG16blBVcVdNeGRsZnVWd29ZdXJKdGhqYWRv?=
 =?utf-8?B?TlVjNTNLLytXSVNJekVUaFBnL05xNmZhcm5VNzMrRURPLzVQajF5WXhTU3dz?=
 =?utf-8?B?TWxtSkdJMjlhRy9YdnhRSkVCdk8zbWVXWE5VTHRORmt1ZnZrbXJvODdvZWI2?=
 =?utf-8?B?K2hTNEhJOFZ6bk5SZS91d1N4M2RzZGZBQkdDTUF5UktwN05UN1JZRHJoQWFh?=
 =?utf-8?B?Nk03eENodHcxRG9XLzJRSmRSRGV3WVQxaGxBZk9qcUl0dTRKWGgxM05RMVRs?=
 =?utf-8?B?MjVhVFcwTFNZVjgrekMrbUJmRkxOZk9EdGVHdklJMVdxUnV3Qi9QTnBkaEt5?=
 =?utf-8?B?ZUxNL2JhUlRaU3JsMTFSVGNmOG01TGZSNEE1K0FRT1k1SHd4bDRwbGswWkdo?=
 =?utf-8?B?L2ZsNXJ0TEk3d2FsdVpRcWFobDQ4d1orUGZ2Z1JaUEZGQ1d2REE0MjB2bXJR?=
 =?utf-8?B?WjlkVHRDN2VMZWFHTFJsMmRDdkZIZzZ4OGlIc2F0ZXcxUGdva2swR24yeGlH?=
 =?utf-8?B?SVZmVy92QWV4L051ZXZrd3FvM0tBRUthVnE4ZzZVRzNBYmVNbUlLYlRpWkVs?=
 =?utf-8?B?ZjBmc2NIK0FlcHpKYk9JbGNoaU10L3ZVdkgxWTNWOWdUQW1jRXluc3prbWRq?=
 =?utf-8?B?bDRwU3VNaWJsUGtVZkJsbzNQUEtVYkJpdUJRQ0xTY0YxNmxzMkhZMGlvaEY2?=
 =?utf-8?B?aGFwNTVLS1F2OEtyUklmVWNpM2hnVHlWVmVvcDJvN0xxSi8ya3VKdWpsR1N2?=
 =?utf-8?B?dUN3ZmNtN3ZXVEVMRjdDeDJQTXNwZkJIOGVKdzBhVm8xTzhrMnp6SWZibXZ2?=
 =?utf-8?B?Q0RNbVF1eUkrUStVUkQ4bmFJb20zZHNRdkplTlRpMVZWOXV1MkFFMjFnOEs0?=
 =?utf-8?B?NURuMWxSalFPbWI2akVUOFROaHN3cG9LbjdFMmNvUjdYcEhma1JYM3MyQ2lV?=
 =?utf-8?B?c21uWDNGTW1qaklPbW1NRGIrM2VNanpWWktBaC9tYVEwZWd0N3l4K0J4Qmtz?=
 =?utf-8?B?ZXBxTTFqdXZ4N3ZuTGNPWFlMSnFGKzlKNHhwSngrbUN4Q3FqQXpNc0NhcHZT?=
 =?utf-8?B?NGx4SWFuTjRzS2lwZDFvVHZPRGtPTDY2WnlUMHV6MUxYK2VKam52bUNrbE4v?=
 =?utf-8?B?Ymw1aUpsMWpoeXQ1NWsxQ1Z2WWVVM2VjUzZQc1hPcWx1aW03MmhDRnJ2cVhs?=
 =?utf-8?B?ZnlaM2VxMHIzRVpBQnpTbTltcHBpb0hISG8yQVp5aTlmQ3hnR3VNVzNYdHBF?=
 =?utf-8?B?WXBJWVJCM2JaamtyR21saHBnTVk2cUVYU2xJb0h5T3Uvb1JlbTBQUXRtUnZ3?=
 =?utf-8?B?RXMrcDFCamp1MjhEamRFVG5jbE1SOGFZY2VoejJpNEtqbGlGc1ZvZ3hhUnFi?=
 =?utf-8?B?TldRdkhHc0pGKzFpWkozZ2FsQ1lLSUZVbmc0NGJtYzRZemY5K1BncVBPYjY1?=
 =?utf-8?B?NUNqNy83OE5pZ09NdVd2MHYrZGdKTVdXSDRjZWJienhxOXJ5K2RGYUFGTjZ0?=
 =?utf-8?B?Z1dMZEFpVFo4a0hrWVF3M0VlNmNrZ0xCdkNienoxQWwrdXhCK01oeExaVnpH?=
 =?utf-8?B?dllwaEc1YlE5dndqL2NxVVg4eUtZZFV6R1pUR2g3Y0Z3bjhnZlMwNjBnT3pz?=
 =?utf-8?B?NWQ2OU8yTFZVM05LMlhmaTZOMnlHb0pSdGRFd1FiZzE3V3hUVUswQWI5T0hl?=
 =?utf-8?B?Q0NBU1JZY1RpanljSHlYL1VOQ1Q3eXZMd0RWcGpITjhuUEVyUmxvWGVyY1FE?=
 =?utf-8?B?dEhXeDZMb29pczkya3NURWlvQ1VMVnNvU1AyRjVCY0FGRU5yb2RmNjNKTTlD?=
 =?utf-8?B?czFBOHpITlBnPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(10070799003)(366016)(7053199007)(38070700018);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OVcxQy96TXpycXFGMFA3Y1F5YkdSYlFsN0FlYWd6TTNEalE5Q1dqUmxzM3p4?=
 =?utf-8?B?NDN5ZnlXY25iSi9WeC9jejBNbGl3c0dnSEQ2R0I2K3J1QW15M2Y3dHBHeUZZ?=
 =?utf-8?B?d2MyblNjQXJoanZWMWpPaktRNUI1WHVlS3pHT1RNUUM5TlliYWpoQkNaQzll?=
 =?utf-8?B?MmNSRXUxNk9jSXJXaWxMSWZuVHMxNTZPUVBwRE91SGJnd1Bld3VkNmFQQTBK?=
 =?utf-8?B?M04wRVVMdnFEQmcvbGJGSTRDSENkQXVkRmNma291ZkpDcUJ3NnFlbTdlaGhu?=
 =?utf-8?B?SThIa05LUjdURkJrU0NjbzFFWGU3K25sVEZtVVhFZ1Buam05UWJ5TzdmOWh3?=
 =?utf-8?B?RS9wem01Z2tjZHFuRkkrdno3RytRTmRPTlY0TkxHZFpqUjU0dVp4L0VhbVNL?=
 =?utf-8?B?dGdjci8ybHNsdndRRHpFNnZMbHpYOEdqUXdqVE11RXpZNEdvWWVxK3lmL2tq?=
 =?utf-8?B?dGtsOHJBeU8vR0JqOXlsN1ZQRlQ0ZHFNdWZDSEZQU1FIOWdETDhjMktsWkov?=
 =?utf-8?B?K2VGczNremZsUEJFV3o2RWorVVZtaWt5Vk1SWHZIeHZEbnc1MllCMEZmNHlO?=
 =?utf-8?B?ak5aLzdsWmhhMXhuTjBSN3hhOEN5SEN6Y1l3dVRqUElOZnkydmlFbFlORnMz?=
 =?utf-8?B?a3JyOCs2aTFqNXVvOXZYZWRCSC91WGdrM21ZMXhMRmdaY2tWeFRWbUNYamUy?=
 =?utf-8?B?S1JWUnhiaTlQU0R2QlZPZ3IrTHhKVjFWeG1rblZ4cWVBblFTUkJ5TVNCbitW?=
 =?utf-8?B?dHhMakYzb0E2L3dMQmhMcjF3cUZWQzNjY1gzOUVmVDhIcFh2RU52WUUxYmZS?=
 =?utf-8?B?N3BGTml4cUxZK052YzBkYmtQOUFQcVh2akJOM1pJb3B5UWNxWXp0WGpTM0gy?=
 =?utf-8?B?OUFSMUNiS3hNY3RwbzkxVE9vM2FQVzNreU5mQTk4Um4vVkp0LzkwSzBUdGpz?=
 =?utf-8?B?MXhqRjViMHVNNmszU1RZWkNmM09vT3dMTVcxK3dpbVZxZU95eENGRnFuengv?=
 =?utf-8?B?MXJkT2pHbWl1UFBHUWNXNFNiZ1kxWDh2Y3VoaEN1K3cydFovYkR1YkI2Y3gr?=
 =?utf-8?B?Y1p4Y1A2a2ZCMStwYm9nODMrUFFXUmNFeVd1T0dxZG43VUJibzFEL0pqcVA5?=
 =?utf-8?B?NEZxeUIyb093UzdlUGVTMko4VnA4NWJhQnk2aFhGRG5ONHA1djliV2tpOXlS?=
 =?utf-8?B?SmYxSjBDUS9jVkNaelM0WWRwQnlGNkxDRmRBQVJ6bEtwMVBOVjlEa25vbVVX?=
 =?utf-8?B?b1lJL2tyVm5qUGZJWkJ4SURRd2lsSVcrRzNvQmpLakNMUVl4bHdtM1V4RjdY?=
 =?utf-8?B?MGZ1ak5VUUdaU0hObnBFbGtSOVlMbzQ4aTJacFBwOE1VVUYyNERnMENCY29P?=
 =?utf-8?B?bEREam1UMGlZMmNFRmQvamIwcUp0eTNKNHN1eHFES0owOVRzSlRscXBRZk9l?=
 =?utf-8?B?UDFoQ201bDBKcDZrdEdBekE3czFlMTUrbDB2ZXVlTExGT3AzSXFwUkIvUWFU?=
 =?utf-8?B?Unk0SFovQW9hNVhQUTFvSDNOTXlpVG01YjRSNTN1eDd6L2NkazlxOHZ2S0FR?=
 =?utf-8?B?UEVza3Rwd3lvakV5SlpBNFc4T0hKSzg3QXRrVHE5S0NralhCZkNPcE9KdkN4?=
 =?utf-8?B?dmRXMkNoYnZLODNueldKTm53eXFVR21EcmloeUxnR2FQSDNXVzZNQ1JGMEsw?=
 =?utf-8?B?eUo1Skk2SnJYR1doVnJPWFBKdklFWFNOTyt2cEI1NFpBMEJxWFp2dlZPM2Fw?=
 =?utf-8?B?N1drVFBLc09zYXp5aEd0ZXZJRHNHak1HSkRrVXAyMmpLQ25IWWNhK09xblc0?=
 =?utf-8?B?THhZOEFhR1lXS0NxdzZIMFZVRlBoWVVGMWVaWXZvSEdXVzhFUHREZmtOUUdo?=
 =?utf-8?B?SWN3UWVGT0pjZzhPWTNUUmMvdlN4YnltSDhKTGNOdVlxazFNeGdtNmZLN0Zs?=
 =?utf-8?B?RGNiYmF2ejRqUmM0UWRrK09FT1VyQS9HanQxaXBEQ2d3dUJtRUZiWTZsYnRE?=
 =?utf-8?B?Slluc01ncDNMNXo0NHZFRzFWcHFCR1hzYnJpdVFRb3JRbDBHMjhmenlnY2FF?=
 =?utf-8?B?Y3NaaXdQeS81U2x4dzd4blZmeUhWRjFtUjVrSW5GeXIyeStRb0JWZytHbmo5?=
 =?utf-8?B?emJqYUZwZnpQcjJ0QW1iZmhjZ2luazRjRTEwNUJhaGtNZDBmZ0pxYzZ1TGdz?=
 =?utf-8?Q?n+TfjuiZwY8mUypOIXY+4FhgixEp3TFjU5hdmdbmJeta?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 270d92e5-4102-4bab-0c22-08ddc605bf6c
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jul 2025 14:16:54.5084 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rBKIzWsOGmrol+p9Q+SxkGK36QqIWsA1XIPdmt1RbIi+1AFIdJHFCQCiCNoPJzWmXeQC5+CICoCFo/v/h/AtpSeVjBvApOWiz4w7t2D0vpU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9251
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

LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IFdhamRlY3prbywgTWljaGFsIDxNaWNo
YWwuV2FqZGVjemtvQGludGVsLmNvbT4gDQpTZW50OiBGcmlkYXksIEp1bHkgMTgsIDIwMjUgMjow
NyBBTQ0KVG86IENhdml0dCwgSm9uYXRoYW4gPGpvbmF0aGFuLmNhdml0dEBpbnRlbC5jb20+OyBp
bnRlbC14ZUBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCkNjOiBEZSBNYXJjaGksIEx1Y2FzIDxsdWNh
cy5kZW1hcmNoaUBpbnRlbC5jb20+DQpTdWJqZWN0OiBSZTogW1BBVENIIDIvNV0gZHJtL3hlL2Nv
bmZpZ2ZzOiBFbmZvcmNlIGNhbm9uaWNhbCBkZXZpY2UgbmFtZXMNCj4gDQo+IE9uIDE3LjA3LjIw
MjUgMjM6MTcsIENhdml0dCwgSm9uYXRoYW4gd3JvdGU6DQo+ID4gLS0tLS1PcmlnaW5hbCBNZXNz
YWdlLS0tLS0NCj4gPiBGcm9tOiBJbnRlbC14ZSA8aW50ZWwteGUtYm91bmNlc0BsaXN0cy5mcmVl
ZGVza3RvcC5vcmc+IE9uIEJlaGFsZiBPZiBNaWNoYWwgV2FqZGVjemtvDQo+ID4gU2VudDogVGh1
cnNkYXksIEp1bHkgMTcsIDIwMjUgMTE6NDggQU0NCj4gPiBUbzogaW50ZWwteGVAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnDQo+ID4gQ2M6IFdhamRlY3prbywgTWljaGFsIDxNaWNoYWwuV2FqZGVjemtv
QGludGVsLmNvbT47IERlIE1hcmNoaSwgTHVjYXMgPGx1Y2FzLmRlbWFyY2hpQGludGVsLmNvbT4N
Cj4gPiBTdWJqZWN0OiBbUEFUQ0ggMi81XSBkcm0veGUvY29uZmlnZnM6IEVuZm9yY2UgY2Fub25p
Y2FsIGRldmljZSBuYW1lcw0KPiA+Pg0KPiA+PiBXaGlsZSB3ZSBleHBlY3QgY29uZmlnIGRpcmVj
dG9yeSBuYW1lcyB0byBtYXRjaCBQQ0kgZGV2aWNlIG5hbWUsDQo+ID4+IGN1cnJlbnRseSB3ZSBh
cmUgb25seSBzY2FubmluZyBwcm92aWRlZCBuYW1lcyBmb3IgZG9tYWluLCBidXMsDQo+ID4+IGRl
dmljZSBhbmQgZnVuY3Rpb24gbnVtYmVycywgd2l0aG91dCBjaGVja2luZyB0aGVpciBmb3JtYXQu
DQo+ID4+IFRoaXMgd291bGQgcGFzcyBzbGlnaHRseSBicm9rZW4gZW50cmllcyBsaWtlOg0KPiA+
Pg0KPiA+PiAgIC9zeXMva2VybmVsL2NvbmZpZy94ZS8NCj4gPj4gICDilJzilIDilIAgMDAwMDow
MDowMi4wMDAwMDAwMDAwMDAwDQo+ID4+ICAg4pSCwqDCoCDilJTilIDilIAgLi4uDQo+ID4+ICAg
4pSc4pSA4pSAIDAwMDA6MDA6MDIuMHgNCj4gPj4gICDilILCoMKgIOKUlOKUgOKUgCAuLi4NCj4g
Pj4gICDilJzilIDilIAgIDA6IDA6IDIuIDANCj4gPj4gICDilILCoMKgIOKUlOKUgOKUgCAuLi4N
Cj4gPj4gICDilJTilIDilIAgMDowOjIuMA0KPiA+PiAgICAgICDilJTilIDilIAgLi4uDQo+ID4+
DQo+ID4+IFRvIGF2b2lkIHN1Y2ggbWlzdGFrZXMsIGNoZWNrIGlmIHRoZSBuYW1lIHByb3ZpZGVk
IGV4YWN0bHkgbWF0Y2hlcw0KPiA+PiB0aGUgY2Fub25pY2FsIFBDSSBkZXZpY2UgYWRkcmVzcyBm
b3JtYXQsIHdoaWNoIHdlIHJlY3JlYXRlZCBmcm9tDQo+ID4+IHRoZSBwYXJzZWQgQkRGIGRhdGEu
IEFsc28gc2ltcGxpZnkgc2NhbmYgZm9ybWF0IGFzIGl0IGNhbid0IHJlYWxseQ0KPiA+PiBjYXRj
aCBhbGwgZm9ybWF0dGluZyBlcnJvcnMuDQo+ID4+DQo+ID4+IFNpZ25lZC1vZmYtYnk6IE1pY2hh
bCBXYWpkZWN6a28gPG1pY2hhbC53YWpkZWN6a29AaW50ZWwuY29tPg0KPiA+PiBDYzogTHVjYXMg
RGUgTWFyY2hpIDxsdWNhcy5kZW1hcmNoaUBpbnRlbC5jb20+DQo+ID4+IC0tLQ0KPiA+PiAgZHJp
dmVycy9ncHUvZHJtL3hlL3hlX2NvbmZpZ2ZzLmMgfCA5ICsrKysrKysrLQ0KPiA+PiAgMSBmaWxl
IGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KPiA+Pg0KPiA+PiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2NvbmZpZ2ZzLmMgYi9kcml2ZXJzL2dwdS9k
cm0veGUveGVfY29uZmlnZnMuYw0KPiA+PiBpbmRleCBlOWI0NmEyZDAwMTkuLjkwYjRmZTkyYTYx
MSAxMDA2NDQNCj4gPj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2NvbmZpZ2ZzLmMNCj4g
Pj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2NvbmZpZ2ZzLmMNCj4gPj4gQEAgLTI1OSwx
MiArMjU5LDE5IEBAIHN0YXRpYyBzdHJ1Y3QgY29uZmlnX2dyb3VwICp4ZV9jb25maWdfbWFrZV9k
ZXZpY2VfZ3JvdXAoc3RydWN0IGNvbmZpZ19ncm91cCAqZ3JvDQo+ID4+ICAJdW5zaWduZWQgaW50
IGRvbWFpbiwgYnVzLCBzbG90LCBmdW5jdGlvbjsNCj4gPj4gIAlzdHJ1Y3QgeGVfY29uZmlnX2Rl
dmljZSAqZGV2Ow0KPiA+PiAgCXN0cnVjdCBwY2lfZGV2ICpwZGV2Ow0KPiA+PiArCWNoYXIgY2Fu
b25pY2FsWzE2XTsNCj4gPj4gIAlpbnQgcmV0Ow0KPiA+PiAgDQo+ID4+IC0JcmV0ID0gc3NjYW5m
KG5hbWUsICIlMDR4OiUwMng6JTAyeC4leCIsICZkb21haW4sICZidXMsICZzbG90LCAmZnVuY3Rp
b24pOw0KPiA+PiArCXJldCA9IHNzY2FuZihuYW1lLCAiJXg6JXg6JXguJWQiLCAmZG9tYWluLCAm
YnVzLCAmc2xvdCwgJmZ1bmN0aW9uKTsNCj4gPj4gIAlpZiAocmV0ICE9IDQpDQo+ID4+ICAJCXJl
dHVybiBFUlJfUFRSKC1FSU5WQUwpOw0KPiA+PiAgDQo+ID4+ICsJcmV0ID0gc2NucHJpbnRmKGNh
bm9uaWNhbCwgc2l6ZW9mKGNhbm9uaWNhbCksICIlMDR4OiUwMng6JTAyeC4lZCIsIGRvbWFpbiwg
YnVzLA0KPiA+PiArCQkJUENJX1NMT1QoUENJX0RFVkZOKHNsb3QsIGZ1bmN0aW9uKSksDQo+ID4+
ICsJCQlQQ0lfRlVOQyhQQ0lfREVWRk4oc2xvdCwgZnVuY3Rpb24pKSk7DQo+ID4gDQo+ID4gRG9l
cyB0aGlzIGZ1bmN0aW9uIGhhdmUgYW4gZXh0ZXJuYWwtZmFjaW5nIGludGVyZmFjZT8gIElmIHNv
LCBJJ20gYSBiaXQgd29ycmllZCB0aGlzIG1pZ2h0DQo+ID4gYnJlYWsgc29tZSBjdXN0b21lciB0
b29saW5nLiAgSXQncyBwcm9iYWJseSBub3QgYSBiaWcgZGVhbCwgYXMgdGhlIHRvb2xzIHNob3Vs
ZCBiZSBwYXNzaW5nDQo+ID4gdGhlIGNhbm9uaWNhbCBhZGRyZXNzZXMgYW55d2F5cywgYnV0IEkn
bSB1bmZvcnR1bmF0ZWx5IHNvbWV3aGF0IGZhbWlsaWFyIHdpdGggZXZlbg0KPiA+IGRlYnVnIGZv
cm1hdHRpbmcgY2hhbmdlcyBicmVha2luZyBleHRlcm5hbCB0b29scywgYW5kIHRoZXkndmUgY2F1
c2VzIGVuZGxlc3MNCj4gPiBoZWFkYWNoZXMgaW4gdGhlIHBhc3QgdGhhdCB3b3VsZCBiZSBnb29k
IHRvIGF2b2lkLg0KPiANCj4gZXZlbiBpZiB0aGVyZSBhcmUgdG9vbHMgdGhhdCB3ZXJlIHBhc3Np
bmcgbm9uLWNhbm9uaWNhbCBkZXZpY2UgbmFtZXMsDQo+IHRoZW4gdGhleSBhcmUgYWxyZWFkeSBi
cm9rZW4sIGFzIGV2ZW4gaWYgd2UgYWxsb3dlZCB0byBjcmVhdGUgY29uZmlnDQo+IGRpcmVjdG9y
eSB3aXRoIHdpdGggbm9uLWNhbm9uaWNhbCBuYW1lIGFuZCBsZXQgY29uZmlndXJlIG90aGVyDQo+
IHBhcmFtZXRlcnMsIHRoZW4gZHJpdmVyIHdpbGwgbmV2ZXIgdXNlIGl0IGFzIGl0IHVzZXMgY2Fu
b25pY2FsIG5hbWUNCj4gd2hpbGUgZG9pbmcgbG9va3VwIGZvciBkZXZpY2UgY29uZmlnLCBzbyBh
bGwgdGhvc2UgY29uZmlnIGNoYW5nZXMgd2VyZQ0KPiBlZmZlY3RpdmVseSBzaWxlbnRseSBpZ25v
cmVkICh3aXRob3V0IHRvb2wgYmVpbmcgYXdhcmUgb2YgdGhhdCkNCj4gDQo+IG5vdyB3ZSB3aWxs
IGp1c3QgZXJyb3IgZWFybHkgdG8gbGV0IHRoZSB0b29sIGtub3cgdGhhdCBpdCBpcyBkb2luZw0K
PiBzb21ldGhpbmcgd3JvbmcsIHNvIG93bmVyIG9mIHRoZSB0b29sIGhhdmUgYSBjaGFuY2UgdG8g
Zml4IGl0DQo+IA0KPiA+IA0KPiA+IFdlIGNvdWxkIHByb2JhYmx5IGZpeCB0aGF0IGJ5IHVzaW5n
ICJjYW5vbmljYWwiIGluc3RlYWQgb2YgIm5hbWUiIGxhdGVyIGluIHRoaXMgZnVuY3Rpb24sDQo+
ID4gc3VjaCB0aGF0IGV2ZW4gdGhlICdzbGlnaHRseSBicm9rZW4nIG5hbWVzIGNhbiBiZSBwYXJz
ZWQgd2l0aG91dCBpbnRyb2R1Y2luZyBhbnkgbmV3DQo+ID4gcmVqZWN0aW9uIGNhc2VzLg0KPiAN
Cj4gYWZ0ZXIgc3RyY21wKCkgd2UgYXJlIHJhdGhlciBjZXJ0YWluIHRoYXQgYm90aCAnbmFtZScg
YW5kICdjYW5vbmljYWwnDQo+IGFyZSB0aGUgc2FtZSBzdHJpbmdzLCBzbyB3aGF0IGNvdWxkIGJl
IG1vcmUgJ3NsaWdodGx5IGJyb2tlbicgPw0KDQpJIG1lYW50IHRoYXQgd2UgY291bGQgc2tpcCB0
aGUgc3RyY21wIGFuZCBqdXN0IHBhc3MgJ2Nhbm9uaWNhbCcsIGJ1dCBpdCBzZWVtcyB0aGF0DQpw
YXNzaW5nIGEgbm9uLWNhbm9uaWNhbCBuYW1lIG5ldmVyIHdvcmtlZCB0byBiZWdpbiB3aXRoIGlm
IEknbSByZWFkaW5nIHlvdXINCnJlc3BvbnNlIGNvcnJlY3RseSwgc28gSSBndWVzcyB0aGF0J3Mg
YSBtb290IHBvaW50Lg0KLUpvbmF0aGFuIENhdml0dA0KDQo+IA0KPiA+IA0KPiA+IEknbGwgbGVh
dmUgdGhhdCB1cCB0byB5b3UgdG8gZGVjaWRlLCB0aG91Z2guDQo+ID4gDQo+ID4gUmV2aWV3ZWQt
Ynk6IEpvbmF0aGFuIENhdml0dCA8am9uYXRoYW4uY2F2aXR0QGludGVsLmNvbT4NCj4gPiAtSm9u
YXRoYW4gQ2F2aXR0DQo+ID4gDQo+ID4+ICsJaWYgKHJldCAhPSAxMiB8fCBzdHJjbXAobmFtZSwg
Y2Fub25pY2FsKSkNCj4gPj4gKwkJcmV0dXJuIEVSUl9QVFIoLUVJTlZBTCk7DQo+ID4+ICsNCj4g
Pj4gIAlwZGV2ID0gcGNpX2dldF9kb21haW5fYnVzX2FuZF9zbG90KGRvbWFpbiwgYnVzLCBQQ0lf
REVWRk4oc2xvdCwgZnVuY3Rpb24pKTsNCj4gPj4gIAlpZiAoIXBkZXYpDQo+ID4+ICAJCXJldHVy
biBFUlJfUFRSKC1FTk9ERVYpOw0KPiA+PiAtLSANCj4gPj4gMi40Ny4xDQo+ID4+DQo+ID4+DQo+
IA0KPiANCg==
