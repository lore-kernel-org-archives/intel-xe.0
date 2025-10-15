Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFC56CCD193
	for <intel-xe@archiver.kernel.org>; Wed, 15 Oct 2025 21:07:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6129810E8F8;
	Wed, 15 Oct 2025 21:07:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jmhDNQvx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CAAB10E8F8
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Oct 2025 21:07:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760562471; x=1792098471;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=99jE6TG2Gd65sKULoFnU+gVoPV9bDaM41b0eqe80fqs=;
 b=jmhDNQvxX7vNRx7Sqy2tnf11ijjSz8hll+NU4uKgkSjYXxbvj+/uEhpK
 5KK5tDReSINad0MlJpB9qf5fdvr7DwDaED0Tto3JKSM6kbxyi+3JkTM6d
 PjK9HKkEcNFIPuBQ54LEzSww0Lx+RGVoJ8QOS/42+19Ia58gNfrIxFOpY
 R5DsC6vJSuoQXkJth2L7KMYOpOHrarN/7LiRtXzaScCXPoxv8qhpRMQ4L
 4RIczOJktdcFXKz4YBruNd7LAI72h5jTfDTEn8a/DQlX601i752aDtZ3v
 3oQN7yiEBfLwNosU958Msm5CasCOeFoU4a7gpGAe5onY/YP1iSHp5Z4oM Q==;
X-CSE-ConnectionGUID: r+ok6LSZSDOOzWBLQG4bqA==
X-CSE-MsgGUID: HtjdFZK6QZ2lDOfHzyGt0g==
X-IronPort-AV: E=McAfee;i="6800,10657,11583"; a="66611525"
X-IronPort-AV: E=Sophos;i="6.19,232,1754982000"; d="scan'208";a="66611525"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2025 14:07:50 -0700
X-CSE-ConnectionGUID: cQ2knqNOSsqEM6FyIjRzlg==
X-CSE-MsgGUID: fbzkR8vZS9KiZOi1QfUwDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,232,1754982000"; d="scan'208";a="186681440"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2025 14:07:50 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 15 Oct 2025 14:07:49 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 15 Oct 2025 14:07:49 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.6) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 15 Oct 2025 14:07:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oGYyo0PK7UoaD4hOddyEqW8se9//gSpTDVfCapF/hJSz0y9SGKctvVQL1keAITo+wpVJgODOVE8flA/cTx0bkXgdMyiBQkNVaT+FOcmszUZ6dKrjNMCt1+reoKPosI0ocg9lnFFx5szHe2XvWiickMBD108UJHhFsLKYi1D44YaVzY2MzHrSvvkE5h4ew0qxck4rSDC2N3MadvRCaqC20K4uqPdndNYRjzTZ5WQyD3hNKQs4LIkqKWB93pCfaAaJO6b+Oag+zY4s2iYoT3iRhZ94QPJNE+m0UIvWQ5CvlERAwGSdavLS7pugzrGWT+i/qmTNg2z+UvC8iffDr9Tqpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=99jE6TG2Gd65sKULoFnU+gVoPV9bDaM41b0eqe80fqs=;
 b=hDIB4r2zy4xw+4YQjtN6PntJcmjTfG14gq6VIBAT/hAn5ItApn6DQr6VacECAWguETXHtrKXTsQ+Iq0xteohZOVoKoDYwQavXCpht5OHeeUciflo9UzxfBADVnaFqY5GK+59UWCVGYX7d+Pue/EhbVcRwrnvy34cnyRr7LpqYCEPrpyhJ6dvR3PpfTs8aZKS01yV31UUZqkbE1MhDKIHX5y0hlBOeETtCKW5Hv9pyKT/1fmEObU+Y6KtcXBX1vLL+kR0vnTeYpiURYKNDKOy0LvhW24Y5S1TLAIyOmQLqcACzYvjY0MHP6KU7jA9+CvfANK1b3aAL370w3X64SarHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5456.namprd11.prod.outlook.com (2603:10b6:5:39c::14)
 by DS7PR11MB6149.namprd11.prod.outlook.com (2603:10b6:8:9e::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.11; Wed, 15 Oct
 2025 21:07:46 +0000
Received: from DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::b23b:735f:b015:26ad]) by DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::b23b:735f:b015:26ad%5]) with mapi id 15.20.9228.010; Wed, 15 Oct 2025
 21:07:46 +0000
From: "Lin, Shuicheng" <shuicheng.lin@intel.com>
To: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Brost, Matthew" <matthew.brost@intel.com>, "Summers, Stuart"
 <stuart.summers@intel.com>, "Auld, Matthew" <matthew.auld@intel.com>
Subject: RE: [PATCH] drm/xe/guc: Destroy LR exec queue directly if GuC is not
 running
Thread-Topic: [PATCH] drm/xe/guc: Destroy LR exec queue directly if GuC is not
 running
Thread-Index: AQHcPLwdKRsd0GwLskWBa7x77cQcnrTDgjmAgAACoCA=
Date: Wed, 15 Oct 2025 21:07:46 +0000
Message-ID: <DM4PR11MB5456A11427A23CE7A80EDACFEAE8A@DM4PR11MB5456.namprd11.prod.outlook.com>
References: <20251014033646.1619865-2-shuicheng.lin@intel.com>
 <5dd62ebb-ff5c-4ab7-a7d8-88a191105490@intel.com>
In-Reply-To: <5dd62ebb-ff5c-4ab7-a7d8-88a191105490@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB5456:EE_|DS7PR11MB6149:EE_
x-ms-office365-filtering-correlation-id: 009fda9d-c2a1-429a-37fd-08de0c2ee3ef
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?cDBrRjFQR3FjVkhsLzd1OE5UYzVaT0h1cGU1UUdUQ3VSZ3RBMVNJVXpoQVM1?=
 =?utf-8?B?MU5JYXBuVWJqbm9VdHdoTkFROCtQSGxGNEFiczBHS3Vvang2VmlKUDBNWnFL?=
 =?utf-8?B?ZFRzc2QvdEJGaGhYKzRxemdyZlAvNUd1d0NEU0NMdFZtR2s3RmlnbzZZdi90?=
 =?utf-8?B?SFA3TWdwTWJIVXpMOUpVZjZRdnZGYUQvQUc1bFZ2MFFJR2pUaFBud1pHKzNG?=
 =?utf-8?B?Y0JmdjQwWTRXUTQrcGRUTzFmV1ZnWDlsY1VIN0tEUHJ2MFdjZ0pkcGlkWG1M?=
 =?utf-8?B?UVl4TndveFFSR3kwRzJrVitHZnhJWmhWS0VkMDlpS2owVGR2S1VDOXlEUVBZ?=
 =?utf-8?B?NmhZV2VkdURGSXdId2tIQW5yd0dxa0xVelJZRVgvOFlQV3M1bHpFd25sV0k5?=
 =?utf-8?B?VVZtYXpLaG5RcndEOERHRWthVm0yT0ZsQUpMekt2UWF1bVFwcXNyZDJ6UFI3?=
 =?utf-8?B?T2VkVyt3Rno2c1RONU1WanFwV0ZSQmpTNnRQRkwxVVQyZ2laVkM3TXMwNmRi?=
 =?utf-8?B?Nk5kaENvYkNzc2kxMkluWVhCTEQyNERlRnlaaHpjYmc4NnhIUlZXV0x5TWF3?=
 =?utf-8?B?aWRIZ1dCZmhlTDJHVXdGUGZYWk9taDVXd3pvWmNBQUpydVFVcUlvT0RGdGJu?=
 =?utf-8?B?RFRtaE0wSnhxT2g5UCt2VFdoVVorRzZQS01JSHRYcXk0N2ZTS0FxWWJXRjRS?=
 =?utf-8?B?M1JuNkxTY01oQ0dtb3NsS2oyS0tYRTJTemVVRHkyY1YyTktnNzNNbVlVVjlJ?=
 =?utf-8?B?SFdPTUZxSmcrbUhLdmppRjhoZ2hvdUdpVEtDK080V29wTmV1aWZ2K1dCb3VB?=
 =?utf-8?B?QTlwUUxDRlg1MWppM0orMGlnbFcwYVhZK0kxclhQVkZWYTcvZ2g0RWlEeGFY?=
 =?utf-8?B?V0NPdEw2UW1DNkhndTVMcXhFOSs5U1BIWGlMY3lLSDhoQXRhZnpCb2VteUZy?=
 =?utf-8?B?RnM5R1RuTmdyVGtBVGRIOHRrTkhUdm93Sm1hQlpQNEZEd3lSaU1CWG9wb29a?=
 =?utf-8?B?c0hmVHNFcUxWUVBuamhZL2xJZ3BNdFV2cGZTelVpbzZHWXh2bXNSckNocGhn?=
 =?utf-8?B?RSttMkNaV0dhY1pKSWNBdjBsRXJWTGp4OW1oeDArZlMzLy9vcExSdGFyRTNZ?=
 =?utf-8?B?Ni8vQmtUbmk3OEt3ei9FNkhteDhoSjdKQ29RamkwSTAxMkdUYnZRSkxQQ1Vt?=
 =?utf-8?B?V2xoSFJQZlVYN1JyRHBZQzRvNzdCaGtrY290T1pFMFJFS1BGdFFoWFVwZ2tu?=
 =?utf-8?B?eWtkOCtLb2h2WVVqWDNIL01wYVJKZFpVWVVuRWo4QTFWMnU1NFA0UzdTajlM?=
 =?utf-8?B?UHdKZllmVTZKcWVubHhvOG9GbkZXRlhCWjFHd2F4ZHRHK254dm93bmoyN0Fv?=
 =?utf-8?B?TU5EZW5pcEpRUGZDU051NUlhN3NCRUI0VVNuNDBJdVdLRXdQbHVHMmhsMDhH?=
 =?utf-8?B?VGtqbWVJNVlDaUFHUDlZZmNIY2dhZDNUYjNPL29JTktxNHFiRVUzZk43cEV3?=
 =?utf-8?B?OGw4QWtGNlZKTEpiY2lpMTB0WUFTK0x4N2JuQVhSV05nL2h5RCtieFptTXdU?=
 =?utf-8?B?MnVZY3E4N0tEUlRseWM3a0dOdEdZNTFNN2ZObTZKeDNLNUJwTnRRNHNHeElx?=
 =?utf-8?B?YS9EcUVGYmhJNFRibExNRE9BKytzaXY2bDA5cTJmYjJTcHlCWk5INjNjYmIz?=
 =?utf-8?B?M3VVeE1ZMVJONk1NcWFZTmZuS04wYUI2WVllZWtXdlF1eFQwR3pnRXoxUVFm?=
 =?utf-8?B?Njl4SHZRNi95M05ndThEUnJPQWNlbHd1UmJCUXY2TkdXTWZGSEdsbWRoajFh?=
 =?utf-8?B?L2h3a2Z2Nk54cHNoOWxYL0owTzNmUmNIQXhZblVVSU1hblpTT0tKVXkwaHN3?=
 =?utf-8?B?Z1B3LzZJeHFnRjBnazFWQ1ZuZzVhQVpWQ2lkb01pQXlHZ2w3ODlIaWNualJ4?=
 =?utf-8?B?K3ZUQTNOU2VQbEt1aXh4QXU0WUFkUm9XUHZBZWRIaGJSNFdCaFk0UmJ0NXZE?=
 =?utf-8?B?dDRNNlhNZUFwdmlkOXJJUXRVaE92MTJhS3Avd25jeDkwYlV3THZ5MkNWenlq?=
 =?utf-8?Q?X5ykOG?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5456.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YitIeHBEaERkRkNBMGtyMTlITmo2NWdKTmZYMlRnVVhvdTViYzNpenUrRGd4?=
 =?utf-8?B?NDJEbVQ3bXVMaW1uZkUvTm9qYVlXOVVJdTlxTFl5dVRib1BOdFRZRzBvbDVS?=
 =?utf-8?B?MUdtcFdSSWprS3U5U1lCMnY2cjJYV3N6cE1yM1BmV3gxRVJpYjJINXdHQU8y?=
 =?utf-8?B?SmlwS254ME5ONEY5anFKSWM2NTZUaGtCKzAzQ2pQSU4ycWlhME5Ob1NPOTJn?=
 =?utf-8?B?TWY3c2FBMW9CZTJlaHNidXY2bVVlWlhzSGU4d0NrNi9CS3pOdkVOYndMdTFO?=
 =?utf-8?B?bXQ1NnpoODNERWF3d3RNdUhibEthOUcxSkZHalJ0dnlTOXVCSFdBS3l2NVZh?=
 =?utf-8?B?dml6ZjFiVEpXM1dtaHg3bUdROTBEcTlST2F2M29nN08zSGhzVTVUbSswTjIx?=
 =?utf-8?B?TGt3dlkwUXNLL25XMzNoZkxnaDR4aHRiMkZSc3hPVWNiejRyd1lUeVQ3dkxK?=
 =?utf-8?B?K0ZXZmdZaFRRZW9WSFYrUXI4Nk91aDZBam0zUkZwdVZoR2dnNFljS052eGgx?=
 =?utf-8?B?WGZGaWFHN3F6ejYyb3JTdFFWdDljVWlReHBKQ2J5blJXYXRpMFU1Yng3SEdw?=
 =?utf-8?B?blM0Q0xZWjNhWm9CbGdCS3VrL2YwdUw0T0RveE9oS3l6UFF3Mm1IVjhaUndW?=
 =?utf-8?B?WVpyWEZmN2Z1Q2JHWXlYcFRRc3VWaVU5b0pYc3BML2d6TEFzSlRwV2Y2bnJr?=
 =?utf-8?B?OHE4Um8wUTl6U3ZkeFFZa2puZElpWnBiclp4STVLQzlhQnBTUVNrb3VWQUdC?=
 =?utf-8?B?YmZIN3VsZ2VDUnBucE8vaEQzMlc2WUJZR1hKSjViRGlnY0x4dndCcHZKb1VO?=
 =?utf-8?B?YUg3SGlFcWRFS01RaE1DdEtEaUUvbjNtc2tPdEZUUUlBTmM4NWpLbk9GQW8v?=
 =?utf-8?B?b3dUSTc5ZVBKdXFmNzg5Q0ZROXdrazJOTVZ3SlN2Nk90SHRqT0V4OG1EMW9W?=
 =?utf-8?B?SGNnQ2RGUkhVVjNYUHA2YklidUp1cDRJelYyOS9hODZMK0E3L2dtTXM4QmtZ?=
 =?utf-8?B?cFozRkpxYlh0MysyL2FPeWFLV1lEWUxwL0h0OFdEWUsvb2lsUi9Ja3VDY2xZ?=
 =?utf-8?B?cW1DQk1CM3pYTEZ1NWZhc2lPMVJiTEdRbmQ1cWt4OHZ1L1d4YzBFVDR4OTNC?=
 =?utf-8?B?ckppUXZJajNxbjdnYXJ2djU3bFA4eDlxWkpDekdDTFRGNjhNSXA2OC8wWmFC?=
 =?utf-8?B?TXhQdUJCZ2oyQklaTjZhZFIvQlJtZmZLcFlpRTFNRlJXc2VrV0dDb0o4VmdS?=
 =?utf-8?B?U21BZmRpNUR4VHRoYUVSY0VneE5hd29yanJHWjVNSzloZDRVdFN4bjJwa0I4?=
 =?utf-8?B?ejhHNVVPRXZ3S2RXSzdJQzdhRndLd3g4YWl6Qk5ZbzRrVU81QnVSOWJ3eVI1?=
 =?utf-8?B?VW43N3dZVG5JNzczVVN1Q0tBQmpDOUNzUjlYbjloRDN6MVQ1alA2UHZ1QmF4?=
 =?utf-8?B?UWFna1V2dWVLbGVrSE9SVVBZc0VBNlZyMUJTWFdyQmV6T243ZDBoSkxIdk5I?=
 =?utf-8?B?ZUdhTG5sNkpDSkhyVGRUR2hENk91MmlqTnpudmNraFJHN2QxRUJJYmttV1A3?=
 =?utf-8?B?UHZFbSs5WHRmSmt1ZkZ0YyszckVJUktoYm5NMVNmTDE3Q242VlloTVRBaGJS?=
 =?utf-8?B?NmU3UDNhQlVXSGw1UWNRMTJhaytvTzk2MUJtVTRLMlAxYUo3QTluRnhFTVRF?=
 =?utf-8?B?T2xudmFsb1BxWXZYeHQvZFdiM044UHJNTlRrTDNJSE9ubmZEcXpxaGx3VWQ3?=
 =?utf-8?B?R2FFOWovRUc2aVJKb0xVN2NiQjRBeFZwR3lPWjRHS25nbHpSbDJJZ2VlaGJa?=
 =?utf-8?B?VTRweEREZHVVVmE2TzNwZEhDU3JETnBmOW9MR2t1djJUR095YlFIM0ZuY003?=
 =?utf-8?B?aWdwNnZQeE5FNjN5MGcyUWZyZkg1bWx1bVlNU1JBelhZNFlCOVVrZWVRVEJZ?=
 =?utf-8?B?cGpKZWszSkRiUU5jZG9YYnJTMlN0TlVWUjRSY2I4cEhRV0ZQNDZmekZOOTRS?=
 =?utf-8?B?cm02ZzlPamtRY0dGK2N1cDV6RDlJYldaMHVheG9HSFFuelBaZFh3VmhWa2JD?=
 =?utf-8?B?cWM0bERBRTAxakFxUnpvSXNwQkRHUlF2cjMwbEdvelBHekxGQ2l5UExRZXRE?=
 =?utf-8?Q?f5lPfbFg7hutWys6s7NC3L+7g?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5456.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 009fda9d-c2a1-429a-37fd-08de0c2ee3ef
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Oct 2025 21:07:46.5160 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UKB/4p0CUxxsjlpdTIAkVX+AfRn2WrLg6/FHAsTf4KIH61TfzbOjXE9y7nOYQEMTQW3Nrm7QRDF0o05MkDMXag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6149
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

T24gV2VkLCBPY3QgIDE1LCAyMDI1IDExOjAyIEFNIERhbmllbGUgQ2VyYW9sbyBTcHVyaW8gd3Jv
dGU6DQo+IE9uIDEwLzEzLzIwMjUgODozNiBQTSwgU2h1aWNoZW5nIExpbiB3cm90ZToNCj4gPiBE
dXJpbmcgTFIgZXhlYyBxdWV1ZSBjbGVhbnVwLCBpZiB0aGUgR3VDIGZpcm13YXJlIGlzIG5vdCBy
dW5uaW5nLCB0aGUNCj4gPiBkcml2ZXIgY2Fubm90IGNvbW11bmljYXRlIHdpdGggdGhlIEd1QyB0
byBwcm9wZXJseSBkZXJlZ2lzdGVyIHRoZSBleGVjDQo+ID4gcXVldWUuIEluIHRoaXMgY2FzZSwg
ZGlyZWN0bHkgZGVzdHJveSB0aGUgZXhlYyBxdWV1ZSBpbnN0ZWFkIG9mDQo+ID4gYXR0ZW1wdGlu
ZyBkZXJlZ2lzdHJhdGlvbi4NCj4gPg0KPiA+IFRoaXMgcHJldmVudHMgc2NoZWR1bGUgZGlzYWJs
ZSBmYWlsdXJlIGFuZCBHdUMgSUQgcmVzb3VyY2UgbGVha3MgYXMNCj4gPiBiZWxvdyBkbWVzZyBs
b2c6DQo+ID4gIg0KPiA+IFsgICA1MC4yNDI1NjRdIHBjaSAwMDAwOjAzOjAwLjA6IFtkcm1dIEdU
MDogU2NoZWR1bGUgZGlzYWJsZSBmYWlsZWQgdG8NCj4gcmVzcG9uZCwgZ3VjX2lkPTINCj4gPiBb
ICAgNTAuMjQyNTY4XSAtLS0tLS0tLS0tLS1bIGN1dCBoZXJlIF0tLS0tLS0tLS0tLS0NCj4gPiBb
ICAgNTAuMjQyNTg0XSBwY2kgMDAwMDowMzowMC4wOiBbZHJtXSBBc3NlcnRpb24gYHJldGAgZmFp
bGVkIQ0KPiA+IC4uLg0KPiA+IFsgICA1MC4yNDQ5NDJdIHBjaSAwMDAwOjAzOjAwLjA6IFtkcm1d
ICpFUlJPUiogR1QwOiBHVUMgSUQgbWFuYWdlcg0KPiB1bmNsZWFuICgxLzY1NTM1KQ0KPiA+IFsg
ICA1MC4yNDQ5NzBdIHBjaSAwMDAwOjAzOjAwLjA6IFtkcm1dIEdUMDogICAgIHRvdGFsIDY1NTM1
DQo+ID4gWyAgIDUwLjI0NTAwMl0gcGNpIDAwMDA6MDM6MDAuMDogW2RybV0gR1QwOiAgICAgdXNl
ZCAxDQo+ID4gWyAgIDUwLjI0NTAzMl0gcGNpIDAwMDA6MDM6MDAuMDogW2RybV0gR1QwOiAgICAg
cmFuZ2UgMi4uMiAoMSkNCj4gPiAiDQo+ID4NCj4gPiBGaXhlczogOGFlOGEyZThkZDIxICgiZHJt
L3hlOiBMb25nIHJ1bm5pbmcgam9iIHVwZGF0ZSIpDQo+ID4gQ2M6IE1hdHRoZXcgQnJvc3QgPG1h
dHRoZXcuYnJvc3RAaW50ZWwuY29tPg0KPiA+IFNpZ25lZC1vZmYtYnk6IFNodWljaGVuZyBMaW4g
PHNodWljaGVuZy5saW5AaW50ZWwuY29tPg0KPiA+IC0tLQ0KPiA+ICAgZHJpdmVycy9ncHUvZHJt
L3hlL3hlX2d1Y19zdWJtaXQuYyB8IDEwICsrKysrKysrKy0NCj4gPiAgIDEgZmlsZSBjaGFuZ2Vk
LCA5IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0veGUveGVfZ3VjX3N1Ym1pdC5jDQo+ID4gYi9kcml2ZXJzL2dwdS9kcm0v
eGUveGVfZ3VjX3N1Ym1pdC5jDQo+ID4gaW5kZXggMGVmNjdkMzUyM2E3Li5kMmRmYmRjODI5MjAg
MTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d1Y19zdWJtaXQuYw0KPiA+
ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndWNfc3VibWl0LmMNCj4gPiBAQCAtNDcsNiAr
NDcsOCBAQA0KPiA+ICAgI2luY2x1ZGUgInhlX3VjX2Z3LmgiDQo+ID4gICAjaW5jbHVkZSAieGVf
dm0uaCINCj4gPg0KPiA+ICtzdGF0aWMgdm9pZCBfX2d1Y19leGVjX3F1ZXVlX2Rlc3Ryb3koc3Ry
dWN0IHhlX2d1YyAqZ3VjLCBzdHJ1Y3QNCj4gPiAreGVfZXhlY19xdWV1ZSAqcSk7DQo+ID4gKw0K
PiA+ICAgc3RhdGljIHN0cnVjdCB4ZV9ndWMgKg0KPiA+ICAgZXhlY19xdWV1ZV90b19ndWMoc3Ry
dWN0IHhlX2V4ZWNfcXVldWUgKnEpDQo+ID4gICB7DQo+ID4gQEAgLTEwNjAsMTAgKzEwNjIsMTUg
QEAgc3RhdGljIHZvaWQNCj4geGVfZ3VjX2V4ZWNfcXVldWVfbHJfY2xlYW51cChzdHJ1Y3Qgd29y
a19zdHJ1Y3QgKncpDQo+ID4gICAJICogc3RhdGUuDQo+ID4gICAJICovDQo+ID4gICAJaWYgKCF3
ZWRnZWQgJiYgZXhlY19xdWV1ZV9yZWdpc3RlcmVkKHEpDQo+ICYmICFleGVjX3F1ZXVlX2Rlc3Ry
b3llZChxKSkgew0KPiA+IC0JCXN0cnVjdCB4ZV9ndWMgKmd1YyA9IGV4ZWNfcXVldWVfdG9fZ3Vj
KHEpOw0KPiA+ICAgCQlpbnQgcmV0Ow0KPiA+DQo+ID4gICAJCXNldF9leGVjX3F1ZXVlX2Jhbm5l
ZChxKTsNCj4gPiArCQkvKiBJZiBHdUMgaXMgbm90IHJ1bm5pbmcsIGp1c3QgZGVzdHJveSB0aGUg
ZXhlYyBxdWV1ZSBhcyB3ZQ0KPiBjYW4ndCBjb21tdW5pY2F0ZSB3aXRoIGl0ICovDQo+ID4gKwkJ
aWYgKCF4ZV91Y19md19pc19ydW5uaW5nKCZndWMtPmZ3KSkgew0KPiANCj4gVGhpcyBkb2Vzbid0
IGNvdmVyIHRoZSBjYXNlIHdoZXJlIHRoZSBHdUMgaXMgcmVzZXQgYWZ0ZXIgd2Ugc2VuZCB0aGUg
bWVzc2FnZQ0KPiBidXQgYmVmb3JlIHdlIGdldCBhIHJlcGx5LiBUaGVyZSBpcyBhbHNvIGFscmVh
ZHkgYSBjaGVjayBiZWxvdyBhbmQgaW5zaWRlDQo+IGRpc2FibGVfc2NoZWR1bGluZ19kZXJlZ2lz
dGVyIHRvIGNvdmVyIHRoZSBjYXNlIHdoZXJlIHRoZSBHdUMgaXMgbm90DQo+IHJlc3BvbmRpbmcg
KGd1Y19yZWFkX3N0b3BwZWQoKSksIHdoaWNoIHNob3VsZCBhbHNvIGNvdmVyIHRoZSBjYXNlIHdo
ZXJlIHRoZQ0KPiBHdUMgaGFzIGFscmVhZHkgYmVlbiByZXNldC4gVGhhdCBmbG93IGlzIHByb2Jh
Ymx5IG5vdCB3b3JraW5nIGFzIGV4cGVjdGVkLCBzbw0KPiBpdCBtaWdodCBiZSB3b3J0aCBoYXZp
bmcgYSBsb29rIGF0IGZpeGluZyB0aGF0IGluc3RlYWQuDQoNCklmIEd1QyBpcyByZXNldCBieSB4
ZSBkcml2ZXIsIHRoZSBjdCBidWZmZXIgd2lsbCBiZSBjbGVhcmVkLCBzbyBkcml2ZXIgY2Fubm90
IGdldCBhDQpyZXBseSBhZnRlciBHdUMgaXMgcnVubmluZyBhZ2FpbiwgYW5kIHRoZSBleGVjX3F1
ZXVlIHdpbGwgbm90IGJlIGZyZWVkIGJ5IGRyaXZlci4NCkl0IHNlZW1zIG15IHBhdGNoIGNhbm5v
dCBjb3ZlciB0aGlzIGNhc2UgeWV0LiBCdXQgaWYgR3VDIGlzIGluIHJlc2V0LCB4ZSBkcml2ZXIg
aXMNCkFscmVhZHkgaW4gdGhlIGd0IHJlc3RhcnQgcGF0aCwgbm90IHN1cmUgaG93IGV4ZWMgcXVl
dWUgd2lsbCBiZSBoYW5kbGVkIGluIHRoaXMNCnBhdGgsIG5lZWQgbW9yZSB0aW1lIHRvIGZpZ3Vy
ZSBvdXQgaXQuDQpGb3IgdGhpcyBjYXNlLCBzaG91bGQgZHJpdmVyIHNlbmQgZGVyZWdpc3RlciBh
Y3Rpb24gcmVnYXJkbGVzcyBndWMgc3RhdGUsIGFuZCBmcmVlIA0KdGhlIHJlc291cmNlIGZyb20g
ZHJpdmVyIHNpZGUgaW1tZWRpYXRlbHkgd2l0aG91dCB3YWl0aW5nIGZvciB0aGUgZG9uZSBzaWdu
YWw/DQpNYXliZSB3ZSBjb3VsZCBoYW5kbGUgaXQgd2hlbiB0aGVyZSBpcyByZWFsIGNhc2UgaGl0
IGl0LiANCg0KRm9yIGRpc2FibGVfc2NoZWR1bGluZ19kZXJlZ2lzdGVyKCksIGl0IGp1c3QgZG8g
dGhlIERFUkVHSVNURVIgYWN0aW9uIHNlbmQsDQp0aGVuIGRyaXZlciB3aWxsIHJlbGVhc2UgdGhl
IGV4ZWMgcXVldWUgcmVzb3VyY2UgYWZ0ZXIgcmVjZWl2aW5nIGRvbmUgc2lnbmFsLg0KRm9yIG15
IGNhc2UsIGRpc2FibGVfc2NoZWR1bGluZ19kZXJlZ2lzdGVyKCkgY291bGQgcnVuIHdpdGhvdXQg
aXNzdWUsIGJ1dCBhcyANCkd1QyBpcyBhbHJlYWR5IHN0b3BwZWQsIHRoZSBBQ1RJT04gRE9ORSBp
cyBuZXZlciByZXR1cm5lZCwgc28gbGVhZCB0byB0aGUgDQpleGVjIHF1ZXVlIHJlc291cmNlIGlz
IG5vdCByZWxlYXNlZC4NCg0KQlRXLCBpdCBzZWVtcyBJIG5lZWQgY2FsbCB4ZV9leGVjX3F1ZXVl
X3B1dCgpIHRvIHJlbGVhc2UgTFIgcXVldWUgaW5zdGVhZCBvZg0KX19ndWNfZXhlY19xdWV1ZV9k
ZXN0cm95LiBMZXQgbWUgY2hlY2sgaXQuIFRoYW5rcy4NCg0KU2h1aWNoZW5nDQoNCj4gDQo+IERh
bmllbGUNCj4gDQo+ID4gKwkJCV9fZ3VjX2V4ZWNfcXVldWVfZGVzdHJveShndWMsIHEpOw0KPiA+
ICsJCQlnb3RvIHNraXBfZGVyZWdpc3RlcjsNCj4gPiArCQl9DQo+ID4gKw0KPiA+ICAgCQlkaXNh
YmxlX3NjaGVkdWxpbmdfZGVyZWdpc3RlcihndWMsIHEpOw0KPiA+DQo+ID4gICAJCS8qDQo+ID4g
QEAgLTEwODgsNiArMTA5NSw3IEBAIHN0YXRpYyB2b2lkIHhlX2d1Y19leGVjX3F1ZXVlX2xyX2Ns
ZWFudXAoc3RydWN0DQo+IHdvcmtfc3RydWN0ICp3KQ0KPiA+ICAgCQl9DQo+ID4gICAJfQ0KPiA+
DQo+ID4gK3NraXBfZGVyZWdpc3RlcjoNCj4gPiAgIAlpZiAoIWV4ZWNfcXVldWVfa2lsbGVkKHEp
ICYmICF4ZV9scmNfcmluZ19pc19pZGxlKHEtPmxyY1swXSkpDQo+ID4gICAJCXhlX2RldmNvcmVk
dW1wKHEsIE5VTEwsICJMUiBqb2IgY2xlYW51cCwgZ3VjX2lkPSVkIiwgcS0NCj4gPmd1Yy0+aWQp
Ow0KPiA+DQoNCg==
